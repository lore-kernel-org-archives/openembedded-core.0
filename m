Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2D873768
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 18:01:50 +0000 (UTC)
Received: by wghl18 with SMTP id l18so13334706wgh.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 10:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Hn+GinzuJOkUIjltcw95lgoPSyu8nCa8E1aysvSfB44=;
	b=jqNsPk9pngAFrKjPjkufrStmVhMb1inCiuNY5srb4vbmpO5IIcCOKz2P4U5M1IiDOC
	sAX5DTXlmBRNHQkJXMDPPlzGf0xLPQLJXSK+Kfb71FNIKCuYBVYJgvTlauDPz1ye02mi
	iQdaq/zpjwM56B1/ycMhDvpOSH0joTs7KnSWmBCw+YcG3FN3RbG0a1tUl9n5LR6mAKur
	KaKNSJ7xS4Q41EzpJIOdjlkVJ2OsdXM+lK+iDpX1PE4sMHHWIE1rtPLpLVtUM6yBY9DG
	Bv/zXXm6JRdGD/Z+mJrVyj01JRXQ3aCUy06FShoZ80ZpxgfCR+9Tfra3JI5YWSX/LghD
	lZGg==
X-Gm-Message-State: ALoCoQnWoyCtuA46PGUgDreVaOEFjLV/O7DowbgGs2cb/CF+4E4lhIica1QX2w3NhV3Xs313ClJK
X-Received: by 10.180.82.129 with SMTP id i1mr18538839wiy.77.1424973711629;
	Thu, 26 Feb 2015 10:01:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id kj8sm2433359wjc.29.2015.02.26.10.01.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Feb 2015 10:01:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Feb 2015 17:59:01 +0000
Message-Id: <1424973542-30540-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1424973542-30540-1-git-send-email-ross.burton@intel.com>
References: <1424973542-30540-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] sato: use gtk-play (from gst-player) instead of Gaku
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
X-List-Received-Date: Thu, 26 Feb 2015 18:01:54 -0000

The Gaku media player was always a bit incomplete and had some serious bugs.
gst-player doesn't have these bugs, is maintained, and uses GStreamer 1.x.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index bc3e0fd..fa9a261 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -49,7 +49,7 @@ WEB ?= ""
 SUMMARY_${PN}-apps = "Sato desktop - applications"
 RDEPENDS_${PN}-apps = "\
     leafpad \
-    gaku \
+    gtk-play \
     x11vnc \
     matchbox-terminal \
     sato-screenshot \
-- 
1.7.10.4


