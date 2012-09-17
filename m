Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDaJq-0003Ks-RU
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:20:54 +0200
Received: by wgbds1 with SMTP id ds1so2566926wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 05:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=iaKIuqYC8ZGLeW0NQIG18ZWLN1ujFxVbJ3gzUgQRKCc=;
	b=Qn3mW492PF2SCi7XOmqsZBgd99DYS4jhNFwpRE06E3jbUCkOWeHC8YERFBsoLl4k4h
	PtEP3TlK9P1dsnk7lHJ4qSi08iwKUn1wFRzmeU6fPyB1ERpgO1Pd0bUml5usUHkAuvCE
	2p/PseAPK6B0oGaOeeURvr8lGsOxuSsEe9gyqEMp5+4yc3fhK1rTlpcaD8R9SjVgAQSq
	FhAyxM713m3OJMW5nV/EXJ47hQ5/sMXes1/rxcUfczwYRGDRwMX4DF0hJVON82cPeljC
	DbWWHR28G5R5JGc4xoY7vokZh4ASsriUYJdxNd/yKS+o8aP+X6NAzK4OhKri9lvxrlBR
	qomQ==
Received: by 10.216.145.88 with SMTP id o66mr2672930wej.169.1347883691447;
	Mon, 17 Sep 2012 05:08:11 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k20sm17570403wiv.11.2012.09.17.05.08.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 05:08:10 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 14:07:37 +0200
Message-Id: <1347883657-17529-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
References: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk9N6hKpyaiWvy/Vsdms/spgpdYD3wtKNxSM3lvZyAkqaSflNiJILx3p78f1tbbSV08Et6X
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][pulseaudio-updates 10/10] pulseaudio: remove ConsoleKit dependency
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
X-List-Received-Date: Mon, 17 Sep 2012 12:20:55 -0000

From: Ross Burton <ross.burton@intel.com>

ConsoleKit is a runtime dependency for the ConsoleKit module, but there isn't a
build-time dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 4a1d66c..9c4b4c3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
 DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxtst libice libsm libxcb gtk+', '', d)}"
 # optional
-DEPENDS += "udev alsa-lib glib-2.0 dbus consolekit \
+DEPENDS += "udev alsa-lib glib-2.0 dbus \
            ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 97bd4d3..e39b69e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.7.6



