Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5F77A7FCAD
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:38 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id s94so37708pjc.1
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MbC+28CJ0R4ktw15sXcSXlIpCNhQQSSUJI+kIrgcdoI=;
	b=ajLl2UQ3HfjRikjZmmunJy0XHhZGWassYFGEnctc6+y12zRluuFRIGE4uqNlS/jB4P
	dR333M4e7vKKHi5rnOTjo5Sl5E8IbyvGRzcd6lxoSwgDdNnfLlojzNg/lkmB0OpWtx9O
	HG0+cSckYN2e97pMS5767PIK2TaCxWlN/YO6t+OF6zVQxYrtC++KSWsHVQmiZxSOxSVU
	iSZJBNciNi8W2jgU80yLKYUkuTfvP59R5hyL43cTN9fYdXtTLuKZ7UCT0lv1bSJsWny2
	XaUoL5BCDZQPw4TuE6iUWoKCvFS4mZXBR/ghfjaaRiooksyjFRSeh2sjwYOvOeT10ERy
	t+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MbC+28CJ0R4ktw15sXcSXlIpCNhQQSSUJI+kIrgcdoI=;
	b=IDm1N/R77X1Td55Fb+y2P1nj/4xBBBIGMR9SpuYVaYPLb9MCNdWNJLQtbDjOC0xJ1w
	IhxSNw5M27FUwPiYPltODngaETLZPpqR1FEnop4M0p3qKoHGCUfiHKRAxoEBRduoiwiW
	nz9EULEPMXGWNdJIxVAerT1HNCgLThp4jBer6jwh66DoZS+e5zd+wXBM/yBbT4J3t+Dx
	eljlFekFyTX0YheHt78WGSphVvp28atmyYJmKSxIT3rlEuR+w23z6yUuwtTYbPjgq4wP
	t1Bamcln/jS39qA70aEfg/cCfcFInvdSRXIT729AnqrDPLCyvckCQSeMFmBOZx1G9B4p
	zfGQ==
X-Gm-Message-State: APjAAAUQ133zzZpCggsCO09A5twHCLA+GiPaNVTSpF7+7Krbjczi5+N/
	PR3Xq/11ba8uH8cdbQ/stuJ3Wvuy
X-Google-Smtp-Source: APXvYqxpX6xSahMMpyoguQoEEBgSjxtSHWkSXdhwzK0Y7eVTznSbNPxGj+hv2iL0oQKGIMoSBW5cWw==
X-Received: by 2002:a17:902:61:: with SMTP id
	88mr14424671pla.313.1578929439373; 
	Mon, 13 Jan 2020 07:30:39 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:06 -0800
Message-Id: <c214c6c7c0f011c933da8b271630fd6833d84685.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 07/28] libpam: set CVE_PRODUCT
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:38 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index c124e3bb02..ad6ac4b701 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -164,3 +164,5 @@ CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-password"
 CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
 CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-account"
 CONFFILES_${PN}-runtime += "${sysconfdir}/security/limits.conf"
+
+CVE_PRODUCT = "linux-pam"
-- 
2.17.1


