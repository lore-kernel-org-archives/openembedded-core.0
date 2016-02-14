Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AF5CA731A6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 23:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1EN3b4M004221 for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 23:03:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rzEZewmRN6ZV
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 23:03:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1EN3XWv004217
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 23:03:34 GMT
Message-ID: <1455491013.16142.413.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Feb 2016 23:03:33 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] gstreamer1.0-meta-base: Mark as machine specific due to COMBINED_FEATURES
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
X-List-Received-Date: Sun, 14 Feb 2016 23:03:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

http://git.openembedded.org/openembedded-core/commit/?id=948165dce7475b815a344fd3c3d58165e6865d48
makes gstreamer1.0-plugins-base-alsa depend on COMBINED_FEATURES.

This is an allarch recipe so this only works if all your machines
have the same MACHINE_FEATURES.

The recipe therefore needs to become machine specific.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
index ecfd082..c542b13 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -1,6 +1,9 @@
 SUMMARY = "Gstreamer1.0 package groups"
 LICENSE = "MIT"
 
+# Due to use of COMBINED_FEATURES
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit packagegroup
 
 COMMERCIAL_PLUGINS = "${COMMERCIAL_AUDIO_PLUGINS} ${COMMERCIAL_VIDEO_PLUGINS}"



