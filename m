Return-Path: <matt@console-pimps.org>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id CF87B6AC79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 13:03:53 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id bs8so7371843wib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 06:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x7H5PRVNfX/WFVm1fOdxnJld6p8SCPsvPql7y3ZiHsE=;
	b=L3U39nWO7L5A8k9idiImFd721TR8ofI6ssx6BemXAi1mLUdLfdt2VSvUWu4k32OLIP
	SdO+KIpv8YjYbmpT5uSfR2mrymc65yiwFmecJVAhHxQbgAgRYd0oSGPAXXn1aohcKrR+
	1W4P42JKjUiKEgNRN9bUQ6PbsCB4V5/K3mAMXJUV8zTT48RUsGO9+G4uZ5zAH6cnF9it
	mmXYlLHqMO6YvTfmVBf4DwfAUFiOD3/u8tVGOTOZ3FLhTng+DXdzJmXYjybfa/bDmods
	qpwiv7i3Rj+w8aT3A+g3lAFV1v3NNaR7WuiTm7Jvga1FRDb+WhxMfddjXF6ukPzqEswH
	FQRg==
X-Gm-Message-State: ALoCoQkKlEE3/vjsnMU1oCs+eoB6WBWf4S1NgaRNpIcZdBKVAKlfkDUAHT/rNRhJwof6t5YumMUs
X-Received: by 10.180.102.130 with SMTP id fo2mr30488962wib.29.1407935033851; 
	Wed, 13 Aug 2014 06:03:53 -0700 (PDT)
Received: from localhost (05428d07.skybroadband.com. [5.66.141.7])
	by mx.google.com with ESMTPSA id ek3sm4320608wjd.17.2014.08.13.06.03.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 06:03:53 -0700 (PDT)
From: Matt Fleming <matt@console-pimps.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 14:03:42 +0100
Message-Id: <1407935023-9284-2-git-send-email-matt@console-pimps.org>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1407935023-9284-1-git-send-email-matt@console-pimps.org>
References: <1407935023-9284-1-git-send-email-matt@console-pimps.org>
Cc: Mihai Prica <mihai.prica@intel.com>, Matt Fleming <matt.fleming@intel.com>,
	Raymond Danks <ray.danks@se-eng.com>
Subject: [PATCH 1/2] recipes-extended: Add iasl recipe
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
X-List-Received-Date: Wed, 13 Aug 2014 13:03:55 -0000

From: Matt Fleming <matt.fleming@intel.com>

Import the Intel ACPI toolchain from the meta-virtualization layer.

Cc: Mihai Prica <mihai.prica@intel.com>
Cc: Raymond Danks <ray.danks@se-eng.com>
Signed-off-by: Matt Fleming <matt.fleming@intel.com>
---
 meta/recipes-extended/iasl/iasl_20120215.bb | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-extended/iasl/iasl_20120215.bb

diff --git a/meta/recipes-extended/iasl/iasl_20120215.bb b/meta/recipes-extended/iasl/iasl_20120215.bb
new file mode 100644
index 0000000..a14d2ec
--- /dev/null
+++ b/meta/recipes-extended/iasl/iasl_20120215.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
+HOMEPAGE = "http://www.acpica.org/"
+LICENSE = "Intel-ACPI"
+LIC_FILES_CHKSUM = "file://asldefine.h;endline=115;md5=d4d7cf809b8b5e03131327b3f718e8f0"
+SECTION = "console/tools"
+PR = "r1"
+
+DEPENDS = "flex-native bison-native"
+
+SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "324c89e5bb9002e2711e0494290ceacc"
+SRC_URI[sha256sum] = "b2b497415f29ddbefe7be8b9429b62c1f1f6e1ec11456928e4e7da86578e5b8d"
+
+S = "${WORKDIR}/acpica-unix-${PV}/source/compiler"
+
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
+
+do_compile() {
+	CFLAGS="-Wno-error=redundant-decls" $MAKE
+}
+
+do_install() {
+	mkdir -p ${D}${prefix}/bin
+	cp ${S}/iasl ${D}${prefix}/bin
+}
-- 
1.9.3


