Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0ZuY-0001fg-VZ
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:44:47 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NEltSC002909 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:55 GMT
X-Quarantine-ID: <WeRWq+bjUOkY>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WeRWq+bjUOkY
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:55 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NElqBo002884
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:53 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0Yt1-0005F3-RZ
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 13:39:07 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:38:24 +0000
Message-Id: <828e720df944368aa3a05cf77f95c12edcf5d31d.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 15/16] gthumb: Resolve staticdev QA warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 14:44:54 -0000

Since the .a files are pretty useless in the case of plugin modules, lets
just remove them. This resolves the warnings:

WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libslideshow.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libimporter.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libimage_viewer.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libchange_date.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libedit_metadata.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libgstreamer_tools.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libphoto_importer.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libimage_rotation.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libfile_viewer.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libpixbuf_savers.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libexport_tools.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libconvert_format.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/librename_series.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libfile_tools.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libwebalbums.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libcatalogs.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libresize_images.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libimage_print.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libdesktop_background.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libred_eye_removal.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libcomments.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libfile_manager.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libjpeg_utils.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libgstreamer_utils.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/liblist_tools.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libbookmarks.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libsearch.a'
WARNING: QA Issue: non -staticdev package contains static .a library: gthumb path '/work/x86_64-poky-linux/gthumb-2.12.4-r1/packages-split/gthumb/usr/lib/gthumb/extensions/libraw_files.a'

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 19a6b31..5c87dc1 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
 
@@ -15,3 +15,7 @@ FILES_${PN}-dbg += "${libdir}/gthumb/modules/.debug/ ${libdir}/gthumb/extensions
 
 SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
 SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
+
+do_install_append () {
+	rm ${D}${libdir}/${BPN}/extensions/*.a
+}
-- 
1.7.5.4



