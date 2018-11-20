Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3D65F6C490
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:18:46 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 125so2512481wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 07:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=SmRTapld8IOXBG6jMshSyZZMk8LBZJBy4eXoNkqncPE=;
	b=NQd31WkthiL0Y3fPsWcnlcJ+vC5sT7QG9o7PjALFzTmm1FYCx+1YtKS/ZVSYVHPvRe
	fjdAvDONwbsTSyOQSJ+2rrzQ6KwJ0fP/TxxZnMHoN+6BFER3VKg9NsG6vudg7nRTk3da
	GEMFUBOmol9PxW1n2uJrQiEWFJN8ZvmQ9J2SFchx4RlHDbygLxLcn5q6uac2roJJOXAc
	Hc/CMbMFgyQ2OAPGt/MM7EaUmNJEwUGUHOKhsVEXG5BSWCzAqio7LVqEMsogPf8GoIgQ
	iVAKGjJxeuvdxe5gt56kVUcXs2Kymheuqg4+NQmZtCF5K5EQaFaMSjB+OZ1HT5UuYF2y
	q8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SmRTapld8IOXBG6jMshSyZZMk8LBZJBy4eXoNkqncPE=;
	b=Id3Qe4eIDcLtRdWiSzGmUcXTl9b8FpaPrfEy0GJw4jcsAj2J2ZWl8eUk6YM5EeEPD4
	Em1+KEmMrAjEQgcM7xj/Ja+PASV5s2m9bAM/PbOoqHIT7M56S8ZldJnvkmkT06L+2iLX
	5G5pd0O/i5Ne8JdN88lhxi56zUgkrdsOAhJFpswmuUOn1t8vfg6GEAVwOrU6qE2S5sUS
	GkWsv0lP+mfEiHsREh0+qod8KZbl51VxmUZgcnL9jAi5r2LLcdWSfuKDRDr0pNlJHX2C
	boNssyclkxYWRR9mWfWBRiFLyNL8MTt8989VmvxpQoTiyTplayQNJeE/tpCySUaa7UFg
	SaXQ==
X-Gm-Message-State: AGRZ1gKOOmvb+GcpZzv3h8PpQdTZmIYhf2+0cWETY+CVrCZ85l7lC77S
	72s3cOBL/sTbnjS9F/tQKCs9DEj4jyM=
X-Google-Smtp-Source: AFSGD/VmDwm9PKauTR553XVwbAwvu8+WGHgJehjBYDw7aFUoWig7wEWKRrjZfw7V5TVyOpiUPrD86Q==
X-Received: by 2002:a1c:a6cd:: with SMTP id p196mr2537667wme.142.1542727126727;
	Tue, 20 Nov 2018 07:18:46 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e8-v6sm84997206wmf.22.2018.11.20.07.18.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 07:18:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 15:18:44 +0000
Message-Id: <20181120151844.13614-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] xcb-proto: use python3native to have reproducible pyc files
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
X-List-Received-Date: Tue, 20 Nov 2018 15:18:46 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb | 26 ++--------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
index d5037868d54..74670909201 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
@@ -12,40 +12,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/${BP}.tar.bz2"
-
 SRC_URI[md5sum] = "abe9aa4886138150bbc04ae4f29b90e3"
 SRC_URI[sha256sum] = "7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271e47a2fe875e2bde1"
 
-inherit autotools pkgconfig
-
-# Force the use of Python 3 and a specific library path so we don't need to
-# depend on python3-native
-CACHED_CONFIGUREVARS += "PYTHON=python3 am_cv_python_pythondir=${libdir}/xcb-proto"
+inherit autotools pkgconfig python3native
 
 PACKAGES += "python-xcbgen"
 
 FILES_${PN} = ""
 FILES_${PN}-dev += "${datadir}/xcb/*.xml ${datadir}/xcb/*.xsd"
-FILES_python-xcbgen = "${libdir}/xcb-proto"
+FILES_python-xcbgen = "${PYTHON_SITEPACKAGES_DIR}"
 
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
-
-# Need to do this dance because we're forcing the use of host Python above and
-# if xcb-proto is built with Py3.5 and then re-used from sstate on a host with
-# Py3.6 the second build will write new cache files into the sysroot which won't
-# be listed in the manifest so won't be deleted, resulting in an error on
-# rebuilds.  Solve this by deleting the entire cache directory when this package
-# is removed from the sysroot.
-SSTATEPOSTINSTFUNCS += "xcb_sstate_postinst"
-xcb_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		cat <<EOF >${SSTATE_INST_POSTRM}
-#!/bin/sh
-rm -rf ${libdir}/xcb-proto/xcbgen/__pycache__
-EOF
-	fi
-}
-- 
2.11.0


