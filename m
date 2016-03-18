Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 18F9C60797
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 14:41:32 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l68so71951651wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xnoPjfORhKcGm8aotNUXm1w9ox3deFf7izKqXf3rliw=;
	b=hhZbCn1UikvdPTlB7GBKsIwM4O6aMcTeXB5KdvulTr1f9CHMWYBT+rwxZ+9FatUU6W
	6eXpvbd2qyOia0QOQBCOEBp3Qd1oi/A274YqM4gr/KKR+GKNaIOLducNT4bUF3T4W2en
	IN/QbhL4SaPHbF/BlaqtxNWgo3EAeZ2/6GpPMDy1iZdAEc9wJvJSOgJMKEdfp8O1P611
	TWWW0wk1zVC+WFzGnQArF0FPexNUzmh155qOEpkToKbfosxSEM31FS4stJYbdkYOb7Fy
	0Fe1VijagM2WK7d0CV6mfroxPC+o90sD7wahp/+OJ1dixOcedvv3hFIxlpWoCI7reDpr
	U50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xnoPjfORhKcGm8aotNUXm1w9ox3deFf7izKqXf3rliw=;
	b=ZSjjwL0zvEy0+fKWMeHpCRrfOSG4YF+8fI7HEvPp+TQsYgM+ifsoT4Rl9WxM2MWGI9
	xjZBntV/QFZJFXmave7sAqke+ScbKRrv3t07FBXNbwiyjcSscJLXWsFI1kei2/fsGagq
	1oinJwpoSwl5KdefObisoUbQmsf+Mx1OWJ60ybJ78mI+nzJmZVHkq3PD2OKfLRyJisIw
	h07dO3sBEvTl4MfQDrZuAIQpcbDLu0qJj25bZ/VFnH+ZmPhiTsgQ+IWyxu94UVD4xwJ6
	U+k/u6KPct4W08DqSA62GaSy5iJ41PbWlPEL98CvGhL2EAxUk6cSB29kZ4GiiWKfx7SP
	GlPw==
X-Gm-Message-State: AD7BkJJT7Ae/IujTwRUsPPdelxDMcvbL2e8tLTuCHG3tzut/u10e+MHHvp3qkl2LmzIaXBVt
X-Received: by 10.194.116.9 with SMTP id js9mr19072296wjb.112.1458312093187;
	Fri, 18 Mar 2016 07:41:33 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 3sm13030585wmp.14.2016.03.18.07.41.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Mar 2016 07:41:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Mar 2016 14:41:30 +0000
Message-Id: <1458312090-9290-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] grub: fix documentation rebuilds
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
X-List-Received-Date: Fri, 18 Mar 2016 14:41:33 -0000

If the documentation needs to rebuild then it will fail as the syntax isn't
valid with modern texinfo.  Backport a patch from git to fix the syntax.

[ YOCTO #9306 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/grub/files/fix-texinfo.patch | 32 +++++++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/fix-texinfo.patch

diff --git a/meta/recipes-bsp/grub/files/fix-texinfo.patch b/meta/recipes-bsp/grub/files/fix-texinfo.patch
new file mode 100644
index 0000000..b911d73
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/fix-texinfo.patch
@@ -0,0 +1,32 @@
+The tarball has a texi file that doesn't parse with current texinfo, so if it's
+being re-generated the build will fail.  Take a patch from upstream to fix the
+texi.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From d4c4b8e1a085f92afcec36f6e590c6dfc51d0a1c Mon Sep 17 00:00:00 2001
+From: Bryan Hundven <bryanhundven@gmail.com>
+Date: Mon, 08 Apr 2013 13:23:07 +0000
+Subject: 	* docs/grub-dev.texi: Move @itemize after @subsection to satisfy
+
+	texinfo-5.1.
+---
+(limited to 'docs/grub-dev.texi')
+
+diff --git a/docs/grub-dev.texi b/docs/grub-dev.texi
+index a4a3820..f74c966 100644
+--- a/docs/grub-dev.texi
++++ b/docs/grub-dev.texi
+@@ -1394,8 +1394,8 @@ grub_video_blit_glyph (&glyph, color, 0, 0);
+ 
+ @node Bitmap API
+ @section Bitmap API
+-@itemize
+ @subsection grub_video_bitmap_create
++@itemize
+ @item Prototype:
+ @example
+ grub_err_t grub_video_bitmap_create (struct grub_video_bitmap **bitmap, unsigned int width, unsigned int height, enum grub_video_blit_format blit_format)
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 12cff4f..146dde6 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -29,6 +29,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub2-fix-initrd-size-bug.patch \
            file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
            file://0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch \
+           file://fix-texinfo.patch \
             "
 
 DEPENDS = "flex-native bison-native"
-- 
2.7.0


