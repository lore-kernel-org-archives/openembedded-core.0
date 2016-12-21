Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF287729B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:11:37 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id p42so204906162ioo.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 05:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rymh0gK5Ms+b6CsOZUZm+dOJAmmI0T6NulKCQMY9dJQ=;
	b=Ss5/ACxihppwfdiVAwkUjl+pU/o7lNmI6sy0PCcKf4wXG53S/66CCSbnDzfOWl3upW
	zO7RlXSxJlDAQx9O69Y/8Ue1YqOUMH+DHveRXNdHd718mrU3t5GV/5KW2RRhIzyrXRAO
	bE3ASRXPzUays817Ve0lCvEBH2FOJKKyJoymJrpwSDEifnz30vFivATmgO8U3xSJlC3I
	3KejCDnfkjUC3JE/ZrcLlN5bQGaaBuUeWCJOI9/HWkMoe2VxGGT2LC3iBiqrZkbQhQgZ
	XWAj3oDI9ZSEjCG/gNeto4faN5oGMdbJ2WL9DQPl1gB6atrgmCoSQUXcP5VZVgzrY5Iw
	eW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Rymh0gK5Ms+b6CsOZUZm+dOJAmmI0T6NulKCQMY9dJQ=;
	b=LUl5LEr6f4HLzFGXblq0mzmuRP1fAEEsqGjFsiOLdekAKaNnPR5MyHdgdEElyZnxYD
	rwWMJUwAptfS3Vvq/vv03cFwsKaOGfMAqWQsoFp9+XUYYtL7wgx98Zr33da42k+67FH9
	RK+r49hsRmB52/MeFjUoZk05tIpSF1OA8k7AfjdG8ONG2e7bhR/QVrQNNPp9MB/Jgc09
	uK+rHkb8nGyTw6qKad/bSq3EWeAc04VVWbqJ+tMlCtfLICdwnFXjkIKwJ01aTURhd4Bj
	Q9YseiY9hg1CjCyyB2FyHsSrnVCe2PzVGHVGgc61MYe31hTZzCWeLCIp0xDoSz8vrSXt
	LNaA==
X-Gm-Message-State: AIkVDXLlW+ccFb+8m8MjpWZHL/WOAuobHo18D5UoRJYS+ryr735k8Pc4mMNYJonSbgT/khKK
X-Received: by 10.107.175.147 with SMTP id p19mr5900517ioo.80.1482325898946;
	Wed, 21 Dec 2016 05:11:38 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F3CB.dip0.t-ipconnect.de.
	[93.232.243.203]) by smtp.gmail.com with ESMTPSA id
	o65sm12103726ioe.15.2016.12.21.05.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 05:11:37 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	ricardo.neri@intel.com
Date: Wed, 21 Dec 2016 14:11:23 +0100
Message-Id: <374bb6a728f368a801f961fb524290f205bb4625.1482324587.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
Cc: meta-luv <luv@lists.01.org>
Subject: [PATCH 2/9] iasl: move from meta-luv to OE-core
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
X-List-Received-Date: Wed, 21 Dec 2016 13:11:39 -0000

From: meta-luv <luv@lists.01.org>

This is an unmodified copy of
github.com/01org/luv-yocto/meta-luv/recipes-extended/iasl revision
4be4329.

iasl is also provided by the meta-oe layer's acpica recipe. iasl is a
bit simpler and thus seems more suitable for OE-core.

When the meta-oe layer is active, PREFERRED_PROVIDER_iasl-native must
be set to avoid a warning. It can be set to "acpica-native" when
something from acpica besides just iasl is needed.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-extended/iasl/iasl_20120215.bb | 27 +++++++++++++++++++++++++++
 meta/recipes-extended/iasl/iasl_20150410.bb | 27 +++++++++++++++++++++++++++
 meta/recipes-extended/iasl/iasl_20150515.bb | 27 +++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-extended/iasl/iasl_20120215.bb
 create mode 100644 meta/recipes-extended/iasl/iasl_20150410.bb
 create mode 100644 meta/recipes-extended/iasl/iasl_20150515.bb

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
+PR="r1"
+
+DEPENDS="flex-native bison-native"
+
+SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "324c89e5bb9002e2711e0494290ceacc"
+SRC_URI[sha256sum] = "b2b497415f29ddbefe7be8b9429b62c1f1f6e1ec11456928e4e7da86578e5b8d"
+
+S="${WORKDIR}/acpica-unix-${PV}/source/compiler"
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
diff --git a/meta/recipes-extended/iasl/iasl_20150410.bb b/meta/recipes-extended/iasl/iasl_20150410.bb
new file mode 100644
index 0000000..4e44817
--- /dev/null
+++ b/meta/recipes-extended/iasl/iasl_20150410.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
+HOMEPAGE = "http://www.acpica.org/"
+LICENSE = "Intel-ACPI"
+LIC_FILES_CHKSUM = "file://Makefile;endline=22;md5=b15414d545d190713f1bab9023dba3be"
+SECTION = "console/tools"
+PR="r1"
+
+DEPENDS="flex-native bison-native"
+
+SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "7b49c79728dde65ab1ba4edbee6f0b22"
+SRC_URI[sha256sum] = "1dce8d9edeb234fd553806987471f6206f429c2aab45556f62a5b2bfe2464875"
+
+S="${WORKDIR}/acpica-unix-${PV}"
+
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
+
+do_compile() {
+	make iasl
+}
+
+do_install() {
+	mkdir -p ${D}${prefix}/bin
+	cp ${S}/generate/unix/bin/iasl ${D}${prefix}/bin
+}
diff --git a/meta/recipes-extended/iasl/iasl_20150515.bb b/meta/recipes-extended/iasl/iasl_20150515.bb
new file mode 100644
index 0000000..c7e1cd5
--- /dev/null
+++ b/meta/recipes-extended/iasl/iasl_20150515.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
+HOMEPAGE = "http://www.acpica.org/"
+LICENSE = "Intel-ACPI"
+LIC_FILES_CHKSUM = "file://Makefile;endline=22;md5=b15414d545d190713f1bab9023dba3be"
+SECTION = "console/tools"
+PR="r1"
+
+DEPENDS="flex-native bison-native"
+
+SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c8c128b2d4859b52bc9c802faba2e908"
+SRC_URI[sha256sum] = "bfa1f296a3cc13421331dbaad3b62e0184678cc312104c3e8ac799ead0742c45"
+
+S="${WORKDIR}/acpica-unix-${PV}"
+
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
+
+do_compile() {
+	make iasl
+}
+
+do_install() {
+	mkdir -p ${D}${prefix}/bin
+	cp ${S}/generate/unix/bin/iasl ${D}${prefix}/bin
+}
-- 
2.1.4


