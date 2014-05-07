Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4E765F34
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 21:20:20 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Wed,  7 May 2014 23:20:21 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id C899D3A152;
	Wed,  7 May 2014 23:20:13 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 23:19:50 +0200
Message-Id: <699098e9da6b5932cce137031ad8dc3604d949a3.1399497346.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <b481b46603ad2ee97a9cc55890293e24db85b8e7.1399497346.git.petter@technux.se>
References: <b481b46603ad2ee97a9cc55890293e24db85b8e7.1399497346.git.petter@technux.se>
In-Reply-To: <cover.1399497346.git.petter@technux.se>
References: <cover.1399497346.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 04/13] trace-cmd: remove usage of FILESPATH
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
X-List-Received-Date: Wed, 07 May 2014 21:20:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. All current patches in trace-cmd are shared, move them to
files instead, since it's included in base FILESPATH.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../{trace-cmd => files}/addldflags.patch          |    0
 .../blktrace-api-compatibility.patch               |    0
 .../kernelshark-fix-syntax-error-of-shell.patch    |    0
 .../{trace-cmd => files}/make-docs-optional.patch  |    0
 ...dd-checks-for-invalid-pointers-to-fix-seg.patch |    0
 ...o-not-call-stop_threads-if-doing-latency-.patch |    0
 ...etting-plugin-to-nop-clears-data-before-i.patch |    0
 .../trace-cmd-fix-syntax-error-of-shell.patch      |    0
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    2 --
 9 files changed, 2 deletions(-)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/addldflags.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/blktrace-api-compatibility.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/kernelshark-fix-syntax-error-of-shell.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/make-docs-optional.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch (100%)
 rename meta/recipes-kernel/trace-cmd/{trace-cmd => files}/trace-cmd-fix-syntax-error-of-shell.patch (100%)

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch b/meta/recipes-kernel/trace-cmd/files/addldflags.patch
similarity index 100%
rename from meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
rename to meta/recipes-kernel/trace-cmd/files/addldflags.patch
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch b/meta/recipes-kernel/trace-cmd/files/blktrace-api-compatibility.patch
similarity index 100%
rename from meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
rename to meta/recipes-kernel/trace-cmd/files/blktrace-api-compatibility.patch
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/files/kernelshark-fix-syntax-error-of-shell.patch
similarity index 100%
rename from meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
rename to meta/recipes-kernel/trace-cmd/files/kernelshark-fix-syntax-error-of-shell.patch
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch b/meta/recipes-kernel/trace-cmd/files/make-docs-optional.patch
similarity index 100%
rename from meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
rename to meta/recipes-kernel/trace-cmd/files/make-docs-optional.patch
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch b/meta/recipes-kernel/trace-cmd/files/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
similarity index 100%
rename from meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
rename to meta/recipes-kernel/trace-cmd/files/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch b/meta/recipes-kernel/trace-cmd/files/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
similarity index 100%
rename from meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
rename to meta/recipes-kernel/trace-cmd/files/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch b/meta/recipes-kernel/trace-cmd/files/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
similarity index 100%
rename from meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
rename to meta/recipes-kernel/trace-cmd/files/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/files/trace-cmd-fix-syntax-error-of-shell.patch
similarity index 100%
rename from meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
rename to meta/recipes-kernel/trace-cmd/files/trace-cmd-fix-syntax-error-of-shell.patch
diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
index d61097d..291c068 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
@@ -21,8 +21,6 @@ S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}' 'prefix=${prefix}' gui"
 
-FILESPATH = "${FILE_DIRNAME}/trace-cmd"
-
 do_install() {
 	oe_runmake CC="${CC}" AR="${AR}" prefix="${prefix}" DESTDIR="${D}" install_gui
 	rm -rf ${D}${datadir}/trace-cmd
-- 
1.7.9.5


