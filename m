Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 25669731CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:41:10 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id c52so1347657qte.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=p5IlZ76E6Dr7JTZgoqc8fbsQ7cLVPSceiDIJRsoeC9w=;
	b=KLqEj6PjLB2LgaWJEyjS2k8Vt3zU8AseLeZyJFCyXHLJLXO0yBdkLN0R8MX3sySrBL
	Z4md9gN+EOJfV7QzvAr/igT/1G3sU5NtYUPFNby3Z4BpLwZVuyPfLJhw7F+PRi51pv5W
	ZkdLD5oTCMJJsSBKM8HKMK3PUOKoAH+W0TtVB5rVmUnDr4APsZ4Ol59gUv5K4nXzR3Uo
	njxquSXZqNVjIJcBcAfg4RMGRotOEXEdkz5dwhlALWY68lzR+U5U9gS9Mhw7mxQrB1rz
	BEsc3qWR3ECDi5Y5hEP/aIBZQL+9GzYExJKoLqcw7g00jU5yt9jFPbs1bEmff3O20Vol
	1+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p5IlZ76E6Dr7JTZgoqc8fbsQ7cLVPSceiDIJRsoeC9w=;
	b=Z4p35ZTowhcrXXQFeFr+iika9RvykQeHZvpvJP0qroS3pdqVQMRaeKJfN0TMnHng2v
	FgcDHMAyaXWrSjCwKg+HXkh+R+bEK9JnekkiKq7szbwKRor2jt1+BBGkWpvNj+DMuUwV
	+1gc0jbMEkiE4DrmK+thsF5aAn7Ul9KH9d0UQ1PJ7G7CmLXvgyhWEzODFMRQ5ec3wqqF
	DVQw2LaeSW/r1Q3C78auWIWwRqE0Erbw7QEpO5LaugwhOeDBuKs3ttT8PyYzG4SPVMv5
	Kfxl7M0g5P4lFMJ8uje8hlb83WAoZ83CjPB72wyqmO4thzfcX0/suuGidaVO6MeSRiVm
	mzwA==
X-Gm-Message-State: AEkooutNkEU3sN9JylJok6ATqEM4GkRI3Tv3WUBzQjR0vwzKJ+pTiuufja9afnWa6tUoyg==
X-Received: by 10.237.53.206 with SMTP id d14mr3578263qte.83.1471538471066;
	Thu, 18 Aug 2016 09:41:11 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	x185sm1492264qkb.14.2016.08.18.09.41.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 09:41:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 16:41:01 +0000
Message-Id: <1471538461-27065-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] Specify extra paths
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
X-List-Received-Date: Thu, 18 Aug 2016 16:41:11 -0000

Some layers have gstreamer plugin recipes which include
the .inc files from OE-Core but they do not get to find
the patch that is being forced by the .inc file and
ends up with errors like

WARNING: /mnt/oe/meta-qcom/recipes-multimedia/gstreamer/gstreamer1.0-plugins-v4l2.bb: Unable to get checksum for gstreamer1.0-plugins-v4l2 SRC_URI entry 0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch: file could not be fo
und

This path prepend fixes it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 2dcec50..b066941 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -28,6 +28,7 @@ EXTRA_OECONF = " \
     --disable-examples \
 "
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 SRC_URI_append = " file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch"
 
 delete_pkg_m4_file() {
-- 
1.8.3.1


