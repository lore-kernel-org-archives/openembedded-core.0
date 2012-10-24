Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TR4Bu-0005iD-Hh
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 18:52:26 +0200
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 24 Oct 2012 09:38:30 -0700
Received: by mail-ea0-f197.google.com with SMTP id i1so547032eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 09:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=NIwF4dmHyXPIu8DSwJ2IWmoqwlNLeXFBxGr5XIu1IUQ=;
	b=JnizLXo21P5zK5lSZsVpFrvnLd5ne2XiVJf1HSECRcdhbWVlytCldEnep6QNmGPU15
	XktdXKKG1w6ChZ4Pfnii0R9wdVMZvixmpgQAPeWUqjNNTVypoGNZIB5mzjX+vJynqzex
	fMpnCMG8ZKe3TdDUVG5eI/ZAZms5wtMwIgPP/NbxcfVj4EYksm6Zpvb8LF5bLVhzUmPC
	0PgZNidG3zBsPQnVEJsibZnCdcBUXe69yVU97InQYnI5+5tp6lvTvvw4YpeMt21agdEj
	pM+hjgIQ7iW5bizgWTekM4/OyJZNHizqYzQg4y9YNNLIHMBIvypdvqelNBVoxYMfNAM0
	UNWQ==
Received: by 10.180.87.34 with SMTP id u2mr3812376wiz.3.1351096735817;
	Wed, 24 Oct 2012 09:38:55 -0700 (PDT)
Received: by 10.180.87.34 with SMTP id u2mr3812349wiz.3.1351096735499;
	Wed, 24 Oct 2012 09:38:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fp6sm5146349wib.0.2012.10.24.09.38.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 09:38:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Oct 2012 17:37:36 +0100
Message-Id: <1351096656-32438-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm1pChP67QWrtYxUgxfuAYtp4mPRm4dakTlQMAuMYF0Re1fFLjjbHsvGBqP3cur5l2uwZckESNfBZmrbmDNDMNeb/qQ7Iq6egSM0NME5+LP0J9VxhFOI9nNJtoFmy5YcMzMSJahQzjc2GHr1TALgXgcQfg/Ty+4WJOY0a66p13jWMfHCUpD6N/BO7LsymN5z0pUP/y9
Subject: [PATCH 4/4] pulseaudio: remove libpulse-browse, removed upstream in 2011
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
X-List-Received-Date: Wed, 24 Oct 2012 16:52:26 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    3 +--
 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb |    2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 8c19c22..1708db7 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -64,7 +64,7 @@ USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"
 
-PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-browse libpulse-mainloop-glib \
+PACKAGES =+ "libpulsecore libpulsecommon libpulse libpulse-simple libpulse-mainloop-glib \
              pulseaudio-server pulseaudio-misc"
 
 #upgrade path:
@@ -76,7 +76,6 @@ FILES_libpulsecore = "${libdir}/libpulsecore*.so"
 FILES_libpulsecommon = "${libdir}/pulseaudio/libpulsecommon*.so"
 FILES_libpulse = "${libdir}/libpulse.so.*"
 FILES_libpulse-simple = "${libdir}/libpulse-simple.so.*"
-FILES_libpulse-browse = "${libdir}/libpulse-browse.so.*"
 FILES_libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 
 FILES_${PN}-dbg += "${libexecdir}/pulse/.debug \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 6d5eb5f..546a80f 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r10"
+PR = "r11"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.10



