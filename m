Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7190F7DBB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 21:56:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id j187so545992wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 14:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ujaXc0iYMms/IKip5sWv3WTQWs5WN1RDYrzRP4k1y08=;
	b=CKT+r3a9yXA1QP2RSdWid7d1g1SCppc6i5lt3xgz0lRWvpp33G0Prp6VGoL2GamwWP
	eGeuK0/hxTOrUUN21qHr1WbCIs7+DNkH17vkVq+fD63nHq66DRkxVFpC1xQ7iBrIJOdJ
	THmfCMQYVDbNom6YwiqXbCKkIofSTSaaaQw3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ujaXc0iYMms/IKip5sWv3WTQWs5WN1RDYrzRP4k1y08=;
	b=ul2r94hnnG+bjNu0L7FdaU/O5WMVG/5qAYC6vxr8c/07b9s/5eXEgXuCObmb5rOeK5
	t30oxVON1fgnMltOQfiEDr5jnU8jzyxLC3Vj1jJoF88KPEsCTzrYX24i5HOkxqdoU4bb
	6kY9aAqTTQ5zhOssQjc04p4p5HksGIXPDfucJ84OktYQQezTfe1DHiLmNQ3SL+D5/SoQ
	4MVjXG/inR/XM1zCSY4tjw18mci4BE7J/c1fd6904zYzqLX7S1UoIg8xFm6AeVoYSJ11
	VRYo65DNQ1+6b6XZvnZ4x4Zk4ZsHOFacb9MBMfiAxTIOneiW1CZ3D3aZMnpG2Jmn56eq
	2WNA==
X-Gm-Message-State: APjAAAU3UJbyH55rAjRW59D9GgsA85KskqMwz/BrYlCXslEUEiwVVdH7
	TgN51irRwhVDfVBMF06faOt/CSgBbJU=
X-Google-Smtp-Source: APXvYqyrfekJYw5Zsv18UxLQGegrOr0JQeIgAXJD/hLGsSZl/SkKgtD0MChM8f9t9flGMQI6NY0IgA==
X-Received: by 2002:a1c:6206:: with SMTP id w6mr14452833wmb.56.1557870967978; 
	Tue, 14 May 2019 14:56:07 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id d6sm126130wrp.9.2019.05.14.14.56.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 14:56:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 22:56:04 +0100
Message-Id: <20190514215604.24839-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514215604.24839-1-richard.purdie@linuxfoundation.org>
References: <20190514215604.24839-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] ptest: Add RDEPENDS frpm PN-ptest to PN package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2019 21:56:07 -0000
Content-Transfer-Encoding: 8bit

Many different ptests are breaking as they assume that ${PN}-ptest
depends on ${PN}. It doesn't currently but should. If we fix this, many
different ptests start passing when they previously failed.

It does depend on fixing an issue in the dbus-test recipe which is done
in the preceeding patch (mentioned in case this gets backported).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/ptest.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 936bf82736e..fa4c36ec769 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -13,6 +13,7 @@ PTEST_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
 PTEST_ENABLED_class-native = ""
 PTEST_ENABLED_class-nativesdk = ""
 PTEST_ENABLED_class-cross-canadian = ""
+RDEPENDS_${PN}-ptest += "${PN}"
 RDEPENDS_${PN}-ptest_class-native = ""
 RDEPENDS_${PN}-ptest_class-nativesdk = ""
 RRECOMMENDS_${PN}-ptest += "ptest-runner"
-- 
2.20.1


