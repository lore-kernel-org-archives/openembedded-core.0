Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2810574732
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 20:12:24 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z9so12709179pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 13:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=agTZ6Ssd6OQ/vmBCQkM49aWpz/7bUM3vQXIT07iNAdI=;
	b=f17MJjyiC5KkeKZTjNNS4PyCs1aaAEn0/SiNxl16YFo9po6KQ7SqZVEEDTRVvcul4t
	o2/db06zmj20xoyI/EN4bynnGkYFiGz8OmWOn0Q3EIDmHD9GH6JROtTP5UdFOOfkMUwW
	9vpK6WSn/eA+cWNnfkptdAz7z1/3I8DoikJRJsWP9izEswEfG3ISPIHAztZCGmAGzBVt
	VayEVtqpFp4/DBLFpuwqvcOFUf01/uxsF3iiACJ/e84LvrqRki678/NqrX/E9AD/hYca
	YbcIhOiODPzcBZLyDftkY1QOMxnONF7E5OvWj2DTaRomalah9U3AQqIYLJz8MKiw31pB
	S/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=agTZ6Ssd6OQ/vmBCQkM49aWpz/7bUM3vQXIT07iNAdI=;
	b=RBjEcWvt3cmOHE5Qt/SxACdIYs0vOjSNDIzactyh7mRDDZtlNKAx8YxttgbpRlYFn4
	rMs7YNsEjCPPRg/KI/iMKUbRVTGLrvSI7PKjdxsic02DdKqr1a98NFCwLrS0ICxUaGkb
	L9cq90QB4/hoBGBNLR4gSsLc/aG32SZN7hDHlDxj6ayhq/DO2TMns7jR+7vKfEgHkPGA
	Zd9axYG9xuZ37M9YzyrWpqb1mrKLwiaddv4zblpgN9ggpUFP0eIqP8ZzDO3nhHT5rpQc
	IhM+Mbp5Pv5NYkzgKiMDNl0BQcJaAU5M9Lsv5lrCt7dKFwx1EX+PVB9IvyOipBotkMUb
	Y5Ug==
X-Gm-Message-State: ALQs6tC/2+tUF/q8hwpI30bXx9fg8ckFZOqj7ZPxrE4P9If+52aLgze8
	dfbZCBP97WxrnocKMTE6XUg/uQ==
X-Google-Smtp-Source: AB8JxZqNbbHTUdlp1DV3iy8P9Q7YRgl0RmesUNi2KD9Z1TyHxqHDfmYi/3+neNLmlnfILM0TZb+7OA==
X-Received: by 2002:a17:902:8ec4:: with SMTP id
	x4-v6mr21107700plo.370.1525291945862; 
	Wed, 02 May 2018 13:12:25 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q207-v6sm23256503pgq.9.2018.05.02.13.12.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 May 2018 13:12:25 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2018 13:12:18 -0700
Message-Id: <1525291938-13615-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] alsa-lib: move contents of alsa-fpu.inc into alsa-lib recipe
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
X-List-Received-Date: Wed, 02 May 2018 20:12:25 -0000

Merge historical .inc file into the only recipe which uses it.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-fpu.inc      |  4 ----
 meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb | 13 +++++++------
 2 files changed, 7 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-fpu.inc

diff --git a/meta/recipes-multimedia/alsa/alsa-fpu.inc b/meta/recipes-multimedia/alsa/alsa-fpu.inc
deleted file mode 100644
index 355a9df..0000000
--- a/meta/recipes-multimedia/alsa/alsa-fpu.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-def get_alsa_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU') in [ 'soft' ]:
-        return "--with-softfloat"
-    return ""
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
index c5bf107..fb6b4fb 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
@@ -6,20 +6,19 @@ LICENSE = "LGPLv2.1 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
                     file://src/socket.c;beginline=1;endline=26;md5=11ff89a8a7a4a690a5c78effe8159545"
 
-BBCLASSEXTEND = "native nativesdk"
-
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2"
 SRC_URI[md5sum] = "a2b465c3a5265d8a57f3ff39c6c4fc29"
 SRC_URI[sha256sum] = "f4f68ad3c6da36b0b5241ac3c798a7a71e0e97d51f972e9f723b3f20a9650ae6"
 
 inherit autotools pkgconfig
 
-require alsa-fpu.inc
-EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
-
-EXTRA_OECONF += "--disable-python"
+EXTRA_OECONF += " \
+    ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
+    --disable-python \
+"
 
 PACKAGES =+ "alsa-server libasound alsa-conf alsa-doc"
+
 FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
@@ -38,3 +37,5 @@ RCONFLICTS_${PN}-dev = "alsa-dev"
 RPROVIDES_alsa-conf = "alsa-conf-base"
 RREPLACES_alsa-conf = "alsa-conf-base"
 RCONFLICTS_alsa-conf = "alsa-conf-base"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


