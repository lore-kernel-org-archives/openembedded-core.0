Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW0jc-0004SA-NX
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 08:07:08 +0100
Received: by bkbzv15 with SMTP id zv15so1291255bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 23:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=eH6xDG9Y5B09OHwXXnWd5zo3RfbyBy8Wifar6SjoQDo=;
	b=fbL8zKDVdCZzw2mHOvPqmb7NrwDuEURRiuAYTEFEJgUM/7OExQFyhCHC6DuNhuBHK8
	nF1aMGr7QyldN+kUyjVRqw8u+FpdwwzTtOwBjl/0F19JirxDPW3yFRs61I4Ey7TSgWFH
	7Nn9WTj0Tsj89K6kXo7tfHz6U49BXPVlTOjo8=
Received: by 10.204.154.7 with SMTP id m7mr5881848bkw.71.1322722827579;
	Wed, 30 Nov 2011 23:00:27 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h7sm9285584bkw.12.2011.11.30.23.00.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 23:00:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 08:00:18 +0100
Message-Id: <1322722819-2808-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
Subject: [PATCH][oe-core 1/2] gst-plugins-good: bump PR for gdbm SOVERSION change
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
X-List-Received-Date: Thu, 01 Dec 2011 07:07:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/gst-plugins-good_0.10.30.bb          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
index 728175b..a3dffa0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r3"
+PR = "r4"
 
 inherit gettext gconf
 
-- 
1.7.8.rc4



