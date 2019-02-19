Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 65F797C886
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 00:08:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i12so20295991wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 16:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rTTxfke4T4wgOoMUqpIC49+Vlr93yqjKZUIgpuIjqdY=;
	b=CaUKVfoQNQ22FZJygt0xTm+PmN3O7ce2f4KDSSoEN9MKo6wLeK+VyHu2WfPzbG1emt
	B82izdbLOvVuKxVNIht7YiEyiUNBs7ff6iL/2OIfX20IaA66HzTom02WzPxlw5sVh5n1
	aHCWx5328EtepGMTja3kVRMdP/F5kQmLPPYxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rTTxfke4T4wgOoMUqpIC49+Vlr93yqjKZUIgpuIjqdY=;
	b=M60AF6pC6ddlOVg5cO6w1W046Nr/3QYfWGq+EuYurOp/S2d0/y2asJqEiKWplOKoNb
	TFtyXihrRTXeE3Z5kHA2CoTI/jeQPLR8FiepSR/shrHl0Vof3VbxZwjkQRCZyxdNRrhU
	5yQcf0QJwRM44r+VimL8Z1SG1zmLuMLgpTvsqxmD8o5vPC+7+z1mgrSjr0m1TRurHj36
	iogpTHyiik4LOg7vBqdQJv7xxRIKsqH0OFGM+illYXIcgYnzZG4UW9y4/U1xYTmSWhL4
	c6+j/PEdOmRH2zekPKGEjaqcARL04QxJB4eofsc8O1NKiDsj1H5hZHPZF4CnK9AiluS5
	VOwA==
X-Gm-Message-State: AHQUAubtKDkmInZ7rhW4Lt5s2sfkNcKVeRoLeFpVvi1Fom6jj7jBI6qL
	43fCQ6U9xcOyT5HMgKL31BT4QuXj21Q=
X-Google-Smtp-Source: AHgI3IYDt3ugO2CAnt9ltkdoxoVK5qCDL3I2ZcmOfOYS6UDqSprx+xbHSCADHITp4vp2bYIgKFQNgg==
X-Received: by 2002:a05:6000:92:: with SMTP id
	m18mr18281226wrx.258.1550534931743; 
	Mon, 18 Feb 2019 16:08:51 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t18sm1626860wmt.8.2019.02.18.16.08.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 16:08:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 00:08:46 +0000
Message-Id: <20190219000849.6177-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
References: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/5] clutter-gst-3.0: upgrade 3.0.26 -> 3.0.27
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
X-List-Received-Date: Tue, 19 Feb 2019 00:08:51 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{clutter-gst-3.0_3.0.26.bb => clutter-gst-3.0_3.0.27.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.26.bb => clutter-gst-3.0_3.0.27.bb} (58%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.26.bb b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.27.bb
similarity index 58%
rename from meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.26.bb
rename to meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.27.bb
index 8a0dda54274..35382453c20 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.26.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.27.bb
@@ -3,5 +3,5 @@ require clutter-gst-3.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
 
-SRC_URI[archive.md5sum] = "7809ca6ce9d1a3490597fd4a7375c389"
-SRC_URI[archive.sha256sum] = "d8618a6d9accec0f2a8574c5e1220051f8505fb82b20336c26bdbd482aa6cb3a"
+SRC_URI[archive.md5sum] = "2bf9d7ca146c9d71e86c45cd00e9a28e"
+SRC_URI[archive.sha256sum] = "fe69bd6c659d24ab30da3f091eb91cd1970026d431179b0724f13791e8ad9f9d"
-- 
2.20.1


