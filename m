Return-Path: <tuanha@viosoft.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 313757CB10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 07:32:15 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s22so13335661pfh.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 23:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=viosoft-com.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=ygaP7TTLArxfZesR5pDm1t+3v6bsc8CCTjIPExmgLZw=;
	b=QMbUUG+TtP+qBIQO/DGoOJfojjLvAR/e37hEwMwy8981BYpuOhHpdxYmifUXxUmOGE
	mNt24Mox05J8z0QMXs4dAuZwlAhqRPvIvo2QaBUuJef/8gY1iYXuY8QnrApzMJywo3lI
	yYjnSYUs/ZHu0AaXQMhLrVviSrppfsJzde4vplEtVo462y3aEtDMqfvR5urfxUngk7z5
	voyyVdgbDVXCxKPL3zUn5iej4vhEere31oX7wip/I+Y9dRBgycT5H5jN8jx9gKTtfkG3
	7I8EYYM5kt7DnzUAzkbeJooA/1tlKNFvuCL1TpNtKm2Z+puziXDYwh+ovWmVYexD72bP
	hUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=ygaP7TTLArxfZesR5pDm1t+3v6bsc8CCTjIPExmgLZw=;
	b=TuM6uBgK5AmaW0iM/pmDWBWRIo4x0HHwDASv9FuFGYOwst7u364OvD2Q2x7PaLqX4k
	Xd2OWXU5JwFNc+6W00CrSXi1F+twLhcpmPgxf4dYTiXtHh52LQu9CEk3h1plV+tcI50L
	c0g/o1QOKwCOjiJMGVzW9VXOgmjAgt7pkixyPIGWcQRA0SVrQIebsNylAamuq9ZkcKgw
	UxbHn4t2SZq/CaO5R50AL1SOue+A7YpRGBA4fscwlH/K1HdrBUa2wYfYrx/SIu/smr04
	wxonKNYtQy2zt/WvI/bLnOtLUBefNWtYewSy8BrOMQxLoXh0FLeXK/w/aNt45K4RWyDQ
	SICA==
X-Gm-Message-State: AHQUAuZ2egRg/2YGkGsnzimWpbTbYdk6VHx09Vc1uRTOsQGgFA5D2hy6
	BkMHfpL19YS9f4eSj9PkXI4HB+QFo8857w==
X-Google-Smtp-Source: AHgI3Ibj0lkPvZbgSpGH/IwZ+YeFW6qnzSgRXKkXdv88yiQ2TSDmcUfNxTcNwEhojCMpcphS6lHo0w==
X-Received: by 2002:a62:f204:: with SMTP id m4mr38415023pfh.58.1550734335841; 
	Wed, 20 Feb 2019 23:32:15 -0800 (PST)
Received: from [192.168.100.13] ([123.16.252.182])
	by smtp.gmail.com with ESMTPSA id
	s190sm33549094pfb.103.2019.02.20.23.32.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 23:32:14 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: Hoang Anh Tuan <tuanha@viosoft.com>
Message-ID: <e4dd5e32-cfe0-d0cf-caa2-0ca7ff7041c4@viosoft.com>
Date: Thu, 21 Feb 2019 14:32:13 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 1/2] tk_8.6.9: Add tkConfig.sh in crossscript
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
X-List-Received-Date: Thu, 21 Feb 2019 07:32:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
  meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb | 25 +++++++++++++++++++++++++
  1 file changed, 25 insertions(+)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb 
b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
index 9eec4bb..459ae82 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
@@ -50,6 +50,11 @@ do_install_append() {
      ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
      oe_libinstall -so libtk${VER} ${D}${libdir}
      ln -sf wish${VER} ${D}${bindir}/wish
+
+    sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tkConfig.sh
+    sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tkConfig.sh
+    install -d ${D}${bindir_crossscripts}
+    install -m 0755 tkConfig.sh ${D}${bindir_crossscripts}
  }

  PACKAGECONFIG ??= "xft"
@@ -69,3 +74,23 @@ BBCLASSEXTEND = "native nativesdk"

  # Fix the path in sstate
  SSTATE_SCAN_FILES += "*Config.sh"
+
+inherit binconfig
+
+SYSROOT_DIRS += "${bindir_crossscripts}"
+
+# Fix some paths that might be used by Tcl extensions
+BINCONFIG_GLOB = "*Config.sh"
+
+# Cleanup host path from ${libdir}/tclConfig.sh and remove the
+# ${bindir_crossscripts}/tclConfig.sh from target
+PACKAGE_PREPROCESS_FUNCS += "tcl_package_preprocess"
+tcl_package_preprocess() {
+        sed -i -e "s;${DEBUG_PREFIX_MAP};;g" \
+               -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
+               -e "s;${STAGING_INCDIR};${includedir};g" \
+               -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
+               ${PKGD}${libdir}/tkConfig.sh
+
+        rm -f ${PKGD}${bindir_crossscripts}/tkConfig.sh
+}
-- 
2.7.4


