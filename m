Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5BB6FCF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 19:07:47 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id um1so815756pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 12:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Y5RYOGDGFO5fyUJQenqXZ5aIxGynac/eXvDjnffZjIM=;
	b=NBqBKPK2UDPYa7b39OTOt7EO6G0uxlz+h3M6dF8UK0P1ygFn2d5IvW+27eqX8DVyIb
	4WkpisCT67yoqAghHmZIqXgr0TqnS27VLs383ScYoiD1w1FXV83qIELvX707xa3mlx78
	ek+rkbTkOu+GPoVNIGawLZDwwlMmYvGu5fsAgf+ssMETODbLVPaTR4K+pwe/rgY8E9Ug
	b0sEkpM5KmBw01o8nF3+Rkcy7VHTowzG1FZVAsoc/CLpkoQytpK45ui5OalGh6g4wwv9
	C1hMK1IP2ABt6BruPZb7MzsEzB5z7sR4CQjI6Xe4jMeVnyIzS+y4v7BYPGHuh8YMpCHM
	eOdA==
X-Received: by 10.66.174.199 with SMTP id bu7mr11486382pac.54.1401390468407;
	Thu, 29 May 2014 12:07:48 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id qw8sm2501335pbb.27.2014.05.29.12.07.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 May 2014 12:07:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 12:10:20 -0700
Message-Id: <1401390620-21874-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd: Upgrade 212 -> 213
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
X-List-Received-Date: Thu, 29 May 2014 19:07:51 -0000

boots on all qemu machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/{systemd_212.bb => systemd_213.bb} |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-core/systemd/{systemd_212.bb => systemd_213.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd_212.bb b/meta/recipes-core/systemd/systemd_213.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_212.bb
rename to meta/recipes-core/systemd/systemd_213.bb
index 233bd31..5f90576 100644
--- a/meta/recipes-core/systemd/systemd_212.bb
+++ b/meta/recipes-core/systemd/systemd_213.bb
@@ -17,9 +17,9 @@ SECTION = "base/shell"
 
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
 
-SRCREV = "9b3310b066136b0674a926da094b7fe87a13a58b"
+SRCREV = "c9679c652b3c31f2510e8805d81630680ebc7e95"
 
-PV = "212+git${SRCPV}"
+PV = "213+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=git \
            file://binfmt-install.patch \
@@ -95,6 +95,7 @@ do_configure_prepend() {
 		cp -r ${S}/units ${S}/units.pre_sed
 	fi
 	sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
+	sed -i '/ln --relative --help/d' ${S}/configure.ac
 	sed -i -e 's:\$(LN_S) --relative -f:lnr:g' ${S}/Makefile.am
 	sed -i -e 's:\$(LN_S) --relative:lnr:g' ${S}/Makefile.am
 }
-- 
1.7.10.4


