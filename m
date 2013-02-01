Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1GWS-0001F6-8C
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 14:19:25 +0100
Received: from mail-lb0-f199.google.com ([209.85.217.199])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 05:02:18 -0800
Received: by mail-lb0-f199.google.com with SMTP id m4so4641478lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 05:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=VELQ0NiK4GGsBeEcoVxk4vMCOn5woVJ0d9LfxkybWqI=;
	b=Uhjc3ebsqObwzCtLs1LYed4CvDl9WrCPqDujPR6MpDB3azoOfpc9lk2WS0aQRhycZy
	gVWBQ3PtJmMG5+D3k8oEcQjp/9zwCXvhkfRrJDCPY8VXHCNo/Cf77seIVF7lvaEXYX4I
	JYCCLSZEr9nAZbMrlzNtg5DvyzcRxeJq2mGuFom6QKLQwOnCxcPzLMm2ORqfh3aqSbcZ
	qCZUyCJUYQkKAywfpODXKxstbi7OVFJAuu99vJPtyWC/FiB4g5VyDzl3HrFu0Gg/uLMC
	dZG7GSiLoXizQNziLvJF6utHfpFd5Smw5jMa+lb56ckBp2cld60sTuH5JMCQfF8WY/zl
	FK1A==
X-Received: by 10.194.76.237 with SMTP id n13mr21668149wjw.57.1359723808751;
	Fri, 01 Feb 2013 05:03:28 -0800 (PST)
X-Received: by 10.194.76.237 with SMTP id n13mr21668125wjw.57.1359723808597;
	Fri, 01 Feb 2013 05:03:28 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hu8sm3146594wib.6.2013.02.01.05.03.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 05:03:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 13:01:17 +0000
Message-Id: <a27016c72e4884e85bd88cc8ec4aec95cb1b42a4.1359723526.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359723526.git.ross.burton@intel.com>
References: <cover.1359723526.git.ross.burton@intel.com>
In-Reply-To: <cover.1359723526.git.ross.burton@intel.com>
References: <cover.1359723526.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkY2K++FL15AQBUdKNrSJq2G0Pbr2EOVTMfwDGzsXOPxbfWEue6AyysBbLHcwidA9vzAcDTFUXLqmYDz9BmtTwnn9+MNWTF7niT2E6+ciCXm3k3j+b+xrmPcdDAZ5MommWmR0ZNe/w4jc1HiNnY/xDfcBSNqjIotWr5uEAaL4EemrWsDD94FDCH7WQotCyJGZ9Pwgd4
Subject: [PATCH 1/6] libcanberra: remove, migrated to meta-gnome
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
X-List-Received-Date: Fri, 01 Feb 2013 13:19:34 -0000


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



