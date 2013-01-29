Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U09M4-0006Uv-Ru
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 12:28:00 +0100
Received: from mail-we0-f198.google.com ([74.125.82.198])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 29 Jan 2013 03:11:46 -0800
Received: by mail-we0-f198.google.com with SMTP id k14so390968wer.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 03:11:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=VELQ0NiK4GGsBeEcoVxk4vMCOn5woVJ0d9LfxkybWqI=;
	b=SAA1Y9rCHN+Q4FHJ6VRC5IohEbhlVd4NZxHmXWiW10q6blHBnwlCSP3+Mx2LDLiD//
	dnNHR1Ug3mAPvju2ndiRLDhwN7ku0Pz0yNfqWG4zOgA8A0g26I1Ihj6Ju6l+mGrWjR3a
	x78eCMXf5wnIvtvk1SFQyOLBmzLioruJLt6BBT5YOb+szpGyCuf+/CMKK/UTdFB+QRsU
	f98fAfYZa4SN3K52LzGShC58AQ8senKO5fggaw8+kFWyZ8Mu6P4P8wyVQZ/5/URVJCpO
	vbjjql5VpNW7TouxhNLUiax4rEPOHeWlcAKl0nZg7lRFm3+geUekYynASpmyJjJ1S1eY
	bVog==
X-Received: by 10.180.104.10 with SMTP id ga10mr1414785wib.23.1359457900377;
	Tue, 29 Jan 2013 03:11:40 -0800 (PST)
X-Received: by 10.180.104.10 with SMTP id ga10mr1414471wib.23.1359457896697;
	Tue, 29 Jan 2013 03:11:36 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fa15sm2576633wid.7.2013.01.29.03.11.35
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 03:11:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 11:09:30 +0000
Message-Id: <8ff867ae9add11bfebfd8098933f7510a22a491d.1359457685.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359457685.git.ross.burton@intel.com>
References: <cover.1359457685.git.ross.burton@intel.com>
In-Reply-To: <cover.1359457685.git.ross.burton@intel.com>
References: <cover.1359457685.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnAPjN2GWTeh0TrIXVnUStlAkTMa/UmdPMAgtEf4c5NxGeYjbyORqiTkUU96EJK0yJrddlrrWw0mHFwaBIKGc+Y1dHZ2NySgo6jnoHmbegO3Flc9jyMqSKT8P6E30H2naFgFZQfbBa8Mk3gXM9xLEr/AZwCqt4qBg/22K23SplRBGxbkj4QAthe7ZKC5Tp0f163ZYN2
Subject: [PATCH 1/2] libcanberra: remove, migrated to meta-gnome
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
X-List-Received-Date: Tue, 29 Jan 2013 11:28:15 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pulseaudio/libcanberra_0.29.bb                 |   32 --------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb

diff --git a/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb b/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
deleted file mode 100644
index b3c0e3d..0000000
--- a/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Implementation of XDG Sound Theme and Name Specifications"
-DESCRIPTION = "Libcanberra is an implementation of the XDG Sound Theme and Name Specifications, for generating event sounds on free desktops."
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/canberra.h;beginline=7;endline=24;md5=c616c687cf8da540a14f917e0d23ab03"
-
-DEPENDS = "gtk+ pulseaudio alsa-lib libtool libvorbis"
-PR = "r0"
-
-inherit gconf autotools
-
-SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "2594093a5d61047bd9cc87e955f86df8"
-SRC_URI[sha256sum] = "127a5ef07805856d63758e5180ebfb241d1f80094fd301c287591a15b8cfcd72"
-
-EXTRA_OECONF = " --disable-oss --disable-ltdl-install" 
-
-do_configure_prepend () {
-	rm -f ${S}/libltdl/configure*
-}
-
-PACKAGES += "${PN}-gnome"
-
-FILES_${PN} += "${libdir}/gtk-2.0/modules/ ${datadir}/gnome"
-FILES_${PN}-gnome += "${datadir}/gdm/autostart/LoginWindow/libcanberra-ready-sound.desktop \
-	              ${libdir}/gnome-settings-daemon-3.0/gtk-modules/canberra-gtk-module.desktop"
-FILES_${PN}-dev += "${libdir}/libcanberra-0.29/libcanberra-*.so \
-		    ${libdir}/libcanberra-0.29/libcanberra-*.la \
-		    ${datadir}/vala/vapi"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanberra-0.29/.debug"
-
-- 
1.7.10.4



