Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 92CA36C37F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 13:49:18 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id m22so14356710wml.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 05:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+dbKwTTDsb9UVaEw3q51IRHHPoWbmg/D7dCCe1DBLFk=;
	b=lijk5elPH7JHzEQSlqhIWQ8ewDh53C2cF9b6YEhya6TDpxbXVSHGJ3A88p1vcPGm1X
	ndCG3Sc5gSYWHUKnkxMsmnp28Em6KDqnuIiuunCYZx6tZudwa0ZiDaHiO+2OzsCIQoCm
	WKplOCMPOvr3voJfdmaP0xrbRzTnYcBn5xgvqTf8WBMgf7DpKsnniXYOOvvDPVOcty7O
	lFyiI+mLpKRds+DJOTdRgtKHutPK6LvB2DzJBxhGWcqL0bzA0KcjcIWkk0OTz1uMHWk3
	MyiobNvMbD90cY7hidX3akX15ko79aifqYpATKtelXuDTTgW1RzfJpzvCI6/8lGNrhxM
	YlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+dbKwTTDsb9UVaEw3q51IRHHPoWbmg/D7dCCe1DBLFk=;
	b=T7naQ80DPxb9Tjt2wyx3G42gefsoma6i/BfXKsxgZxaSEdu/3BZS5VDJV029iv2W/T
	VtoxQnZ6j9nGaqPaAzUI8A47dQj33k9LrMEQUsgW6cgpdRJSr6gKjjFAdYWLxbc3cUir
	EcKesOWkrAIhmBgO3Logb73/Y9KKHRZt4syxoRfu6j0HpoODq3dUUvv5OKzqh5v4ZWM8
	weQT/0btvi2FhMDy9SE7b9J4AwC1syfxBKJ/z8hZVQZWFd4+HFSQLxsbAsVZc0HYOC4O
	b+2ZyJG/EB00bHRTYUKWMx9WuLzHzaAP474lp5X8Re2DMV/qwD5xg8vabOKSnHCfh/B1
	U39w==
X-Gm-Message-State: AJcUukcZ37vmUVnhH9vl3VTDxYr0CSRFnvi8i0uVNWrZS/09Wjhhba1Q
	DH7fra3HBfpd06YBg7QZ1Iq0TeHn
X-Google-Smtp-Source: ALg8bN4jB2UWlloPfiPnJGYg7gz4p5oQpL5oHaTC64JW7VRNYsK18sC9uTp8wo9G7wKfBYwteHmFRg==
X-Received: by 2002:a1c:f112:: with SMTP id p18mr3625206wmh.83.1548164958682; 
	Tue, 22 Jan 2019 05:49:18 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	s132sm35315532wmf.28.2019.01.22.05.49.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 Jan 2019 05:49:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2019 14:48:44 +0100
Message-Id: <20190122134844.13433-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190122134844.13433-1-schnitzeltony@gmail.com>
References: <20190122134844.13433-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH] remove unused distutils-tools.bbclass
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
X-List-Received-Date: Tue, 22 Jan 2019 13:49:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* As far as I can see nothing uses it
* From commit history it seems distutils-tools came in accidentally

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/distutils-tools.bbclass | 73 ----------------------------
 1 file changed, 73 deletions(-)
 delete mode 100644 meta/classes/distutils-tools.bbclass

diff --git a/meta/classes/distutils-tools.bbclass b/meta/classes/distutils-tools.bbclass
deleted file mode 100644
index 6f2880ea01..0000000000
--- a/meta/classes/distutils-tools.bbclass
+++ /dev/null
@@ -1,73 +0,0 @@
-DISTUTILS_BUILD_ARGS ?= ""
-DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
-DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
-    --install-data=${STAGING_DATADIR}"
-DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
-    --install-data=${D}/${datadir}"
-
-distutils_do_compile() {
-         STAGING_INCDIR=${STAGING_INCDIR} \
-         STAGING_LIBDIR=${STAGING_LIBDIR} \
-         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
-         bbfatal_log "${PYTHON_PN} setup.py build_ext execution failed."
-}
-
-distutils_stage_headers() {
-        install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
-}
-
-distutils_stage_all() {
-        STAGING_INCDIR=${STAGING_INCDIR} \
-        STAGING_LIBDIR=${STAGING_LIBDIR} \
-        install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
-        PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py install (stage) execution failed."
-}
-
-distutils_do_install() {
-        echo "Beginning ${PN} Install ..."
-        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-        echo "Step 2 of ${PN} Install ..."
-        STAGING_INCDIR=${STAGING_INCDIR} \
-        STAGING_LIBDIR=${STAGING_LIBDIR} \
-        PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
-        bbfatal_log "${PYTHON_PN} setup.py install execution failed."
-
-        echo "Step 3 of ${PN} Install ..."
-        # support filenames with *spaces*
-        find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
-            sed -i -e s:${D}::g $i
-        done
-
-        echo "Step 4 of ${PN} Install ..."
-        if test -e ${D}${bindir} ; then	
-            for i in ${D}${bindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            done
-        fi
-
-        echo "Step 4 of ${PN} Install ..."
-        if test -e ${D}${sbindir}; then
-            for i in ${D}${sbindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            done
-        fi
-
-        echo "Step 5 of ${PN} Install ..."
-        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
-        
-        #
-        # FIXME: Bandaid against wrong datadir computation
-        #
-        if [ -e ${D}${datadir}/share ]; then
-            mv -f ${D}${datadir}/share/* ${D}${datadir}/
-        fi
-}
-
-#EXPORT_FUNCTIONS do_compile do_install
-
-export LDSHARED="${CCLD} -shared"
-- 
2.20.1


