Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooperjr27@gmail.com>) id 1TJbCm-0004ff-T2
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 04:30:29 +0200
Received: by oagh1 with SMTP id h1so7778385oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 19:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NnBmKF6dbh3EJ45Y5N83oHDBkjUcIh3IvTSdheXQlBg=;
	b=Rektshgbxhrr+JWNlsXg5OegUYZTOCdNnINfzIgJjpBcE4Vczp4cQvNw74IZzLTOX5
	9Q31jazhbVk8H+vuuZkV4lPSosel4aB41TVhouiFvnT7k7igeLQr2s1lmCrf+Qp17+uv
	63Ce4gGhkwGwNYfuOW/k1FoubuG1oDhwSxClcaFSQGHnrMYH62eoelXr/a02oNBzI7n5
	9svIECcQnieVwzjtoB1/gzrIINh5BXszP2449D9PEWr7soDmXpaKIHLtcqoBqRDuZwk5
	IQNSgfeXYeBCEuobPb+XWYc6mSZVqQcl+IL6hp60GYWBznLkyR82YGsDaOfEIjGUyAge
	eXrg==
Received: by 10.60.7.229 with SMTP id m5mr3064882oea.10.1349317047899;
	Wed, 03 Oct 2012 19:17:27 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ql3sm5433713obc.17.2012.10.03.19.17.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 19:17:27 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 21:45:21 -0500
Message-Id: <1349318721-17882-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [for-denzil][PATCH] gst-plugins-good: disable (uninstalled) examples
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 02:30:29 -0000

From: Ross Burton <ross.burton@intel.com>

The examples pull in a GTK+ build dependency, so remove that too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index e0eaf7b..e4c54bf 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
+DEPENDS += "gst-plugins-base gconf cairo jpeg libpng zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r1"
+PR = "r2"
 
 inherit gettext gconf
 
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
-                 --disable-orc"
+                 --disable-orc --disable-examples"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-- 
1.7.0.4



