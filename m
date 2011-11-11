Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu4q-0005ch-8e
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:35:40 +0100
Received: by faat2 with SMTP id t2so4356740faa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NBZpvBaw8UWwVUnm85IsOoILc47t5APkZevvGp35hXQ=;
	b=PuokPdQLM0Kii8ZEE9HQlxRf3J2iue2CCpTr4z4AjBd14P+LQQcB/unYYeNdXjXw/w
	WeO5/Y1P5Ioh+1tVC97Z0CYUmNFe0Dgbh6uA78CzhAqU1VuZYFDlirop5AhFDNgYkiGV
	JmsCdYGyYQ+e1GOgCdrqdfOvD+sVyr/ceJZbA=
Received: by 10.204.12.68 with SMTP id w4mr8974413bkw.31.1321028961857;
	Fri, 11 Nov 2011 08:29:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu17sm11707946bkc.9.2011.11.11.08.29.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:29:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:39 +0100
Message-Id: <22f43619b78cf0d16c2c24c55f1b0c025229b322.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 03/22] pulseaudio-0.9.23: force ARM mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2011 16:35:40 -0000

* this is just work around, should be tested again after upgrade to
  pulseaudio-1.1
* otherwise build for armv4t (om-gta02) fails with this:
| /bin/sh ../arm-oe-linux-gnueabi-libtool  --tag=CC   --mode=compile
arm-oe-linux-gnueabi-gcc  -march=armv4t -mthumb -mthumb-interwork
-mtune=arm920t --sysroot=/OE/shr-core/tmp/sysroots/om-gta02 -std=gnu99
-DHAVE_CONFIG_H -I. -I..    -I../src -I../src -I../src/modules
-I../src/modules -I../src/modules/rtp -I../src/modules/rtp
-I../src/modules/gconf -I../src/modules/gconf -I../src/modules/bluetooth
-I../src/modules/bluetooth -I../src/modules/oss -I../src/modules/oss
-I../src/modules/alsa -I../src/modules/alsa -I../src/modules/raop
-I../src/modules/raop -I../src/modules/x11 -I../src/modules/x11
-I../src/modules/jack -I../src/modules/jack -I../src/modules/echo-cancel
-I../src/modules/echo-cancel -pthread -D_POSIX_PTHREAD_SEMANTICS
-DPA_BUILDDIR=\"/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/pulseaudio-0.9.23-r6/pulseaudio-0.9.23/src\"
-DPA_DLSEARCHPATH=\"/usr/lib/pulse-0.9.23/modules\"
-DPA_DEFAULT_CONFIG_DIR=\"/etc/pulse\"
-DPA_BINARY=\"/usr/bin/pulseaudio\"
-DPA_SYSTEM_RUNTIME_PATH=\"/var/run/pulse\"
-DPA_SYSTEM_CONFIG_PATH=\"/var/lib/pulse\"
-DPA_SYSTEM_STATE_PATH=\"/var/lib/pulse\" -DAO_REQUIRE_CAS
-DPULSE_LOCALEDIR=\"/usr/share/locale\"
-DPA_MACHINE_ID=\"/var/lib/dbus/machine-id\"
-DPA_ALSA_PATHS_DIR=\"/usr/share/pulseaudio/alsa-mixer/paths\"
-DPA_ALSA_PROFILE_SETS_DIR=\"/usr/share/pulseaudio/alsa-mixer/profile-sets\"
-O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wextra -pipe
-Wno-long-long -Winline -Wvla -Wno-overlength-strings
-Wunsafe-loop-optimizations -Wundef -Wformat=2 -Wlogical-op
-Wsign-compare -Wformat-security -Wmissing-include-dirs
-Wformat-nonliteral -Wold-style-definition -Wpointer-arith -Winit-self
-Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes
-Wstrict-prototypes -Wredundant-decls -Wmissing-declarations
-Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align
-Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter -ffast-math
-Wp,-D_FORTIFY_SOURCE=2 -fno-common -fdiagnostics-show-option -c -o
libbluetooth_sbc_la-sbc.lo `test -f 'modules/bluetooth/sbc.c' || echo
'./'`modules/bluetooth/sbc.ci

| arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc
-march=armv4t -mthumb -mthumb-interwork -mtune=arm920t
--sysroot=/OE/shr-core/tmp/sysroots/om-gta02 -std=gnu99 -DHAVE_CONFIG_H
-I. -I.. -I../src -I../src -I../src/modules -I../src/modules
-I../src/modules/rtp -I../src/modules/rtp -I../src/modules/gconf
-I../src/modules/gconf -I../src/modules/bluetooth
-I../src/modules/bluetooth -I../src/modules/oss -I../src/modules/oss
-I../src/modules/alsa -I../src/modules/alsa -I../src/modules/raop
-I../src/modules/raop -I../src/modules/x11 -I../src/modules/x11
-I../src/modules/jack -I../src/modules/jack -I../src/modules/echo-cancel
-I../src/modules/echo-cancel -pthread -D_POSIX_PTHREAD_SEMANTICS
-DPA_BUILDDIR=\"/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/pulseaudio-0.9.23-r6/pulseaudio-0.9.23/src\"
-DPA_DLSEARCHPATH=\"/usr/lib/pulse-0.9.23/modules\"
-DPA_DEFAULT_CONFIG_DIR=\"/etc/pulse\"
-DPA_BINARY=\"/usr/bin/pulseaudio\"
-DPA_SYSTEM_RUNTIME_PATH=\"/var/run/pulse\"
-DPA_SYSTEM_CONFIG_PATH=\"/var/lib/pulse\"
-DPA_SYSTEM_STATE_PATH=\"/var/lib/pulse\" -DAO_REQUIRE_CAS
-DPULSE_LOCALEDIR=\"/usr/share/locale\"
-DPA_MACHINE_ID=\"/var/lib/dbus/machine-id\"
-DPA_ALSA_PATHS_DIR=\"/usr/share/pulseaudio/alsa-mixer/paths\"
-DPA_ALSA_PROFILE_SETS_DIR=\"/usr/share/pulseaudio/alsa-mixer/profile-sets\"
-O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wextra -pipe
-Wno-long-long -Winline -Wvla -Wno-overlength-strings
-Wunsafe-loop-optimizations -Wundef -Wformat=2 -Wlogical-op
-Wsign-compare -Wformat-security -Wmissing-include-dirs
-Wformat-nonliteral -Wold-style-definition -Wpointer-arith -Winit-self
-Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes
-Wstrict-prototypes -Wredundant-decls -Wmissing-declarations
-Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align
-Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter -ffast-math
-Wp,-D_FORTIFY_SOURCE=2 -fno-common -fdiagnostics-show-option -c

modules/bluetooth/sbc.c  -fPIC -DPIC -o .libs/libbluetooth_sbc_la-sbc.oi
| modules/bluetooth/sbc.c: In function 'sbc_synthesize_four':
| modules/bluetooth/sbc.c:553:18: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:553:18: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:553:18: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:553:18: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:553:18: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:553:18: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:553:18: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:553:18: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:565:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c: In function 'sbc_synthesize_eight':
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:595:29: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: declaration of 'tmp' shadows a previous local [-Wshadow]
| modules/bluetooth/sbc.c:611:40: warning: shadowed declaration is here [-Wshadow]
| {standard input}: Assembler messages:
| {standard input}:6997: Error: selected processor does not support Thumb mode `mla r3,r0,ip,r3'
| {standard input}:7012: Error: selected processor does not support Thumb mode `mla r3,r1,ip,r3'
| {standard input}:7026: Error: selected processor does not support Thumb mode `mla r3,ip,r0,r3'
| {standard input}:7215: Error: selected processor does not support Thumb mode `mla r3,r7,r0,r3'
| {standard input}:7230: Error: selected processor does not support Thumb mode `mla r3,r7,r0,r3'
| {standard input}:7241: Error: selected processor does not support Thumb mode `mla r3,r0,r7,r3'
| {standard input}:7256: Error: selected processor does not support Thumb mode `mla r3,r0,r7,r3'
| {standard input}:7267: Error: selected processor does not support Thumb mode `mla r3,r7,r0,r3'
| {standard input}:7287: Error: selected processor does not support Thumb mode `mla r3,r7,r6,r3'
| {standard input}:7301: Error: selected processor does not support Thumb mode `mla r3,r6,r5,r3'
| {standard input}:7319: Error: selected processor does not support Thumb mode `mla r3,r0,r5,r3'
| {standard input}:7327: Error: selected processor does not support Thumb mode `mla r3,r1,r0,r3'
| {standard input}:7594: Error: selected processor does not support Thumb mode `mla r3,r5,r6,r3'
| {standard input}:7604: Error: selected processor does not support Thumb mode `mla r3,r5,r6,r3'
| {standard input}:7614: Error: selected processor does not support Thumb mode `mla r3,r5,r6,r3'
| {standard input}:7624: Error: selected processor does not support Thumb mode `mla r3,r5,r6,r3'
| {standard input}:7634: Error: selected processor does not support Thumb mode `mla r3,r5,r6,r3'
| {standard input}:7647: Error: selected processor does not support Thumb mode `mla r3,r2,r5,r3'
| {standard input}:7657: Error: selected processor does not support Thumb mode `mla r3,r2,r5,r3'
| {standard input}:7815: Error: selected processor does not support Thumb mode `mla r3,r9,r7,r3'
| {standard input}:7837: Error: selected processor does not support Thumb mode `mla r3,r9,r0,r3'
| {standard input}:7853: Error: selected processor does not support Thumb mode `mla r3,r9,r0,r3'
| {standard input}:7875: Error: selected processor does not support Thumb mode `mla r3,r9,r7,r3'
| {standard input}:7891: Error: selected processor does not support Thumb mode `mla r3,r9,r7,r3'
| {standard input}:7908: Error: selected processor does not support Thumb mode `mla r3,r0,r6,r3'
| {standard input}:7931: Error: selected processor does not support Thumb mode `mla r3,r6,r5,r3'
| {standard input}:7952: Error: selected processor does not support Thumb mode `mla r3,r0,r5,r3'
| {standard input}:7960: Error: selected processor does not support Thumb mode `mla r3,r2,r0,r3'
| make[4]: *** [libbluetooth_sbc_la-sbc.lo] Error 1
| make[4]: Leaving directory `/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/pulseaudio-0.9.23-r6/pulseaudio-0.9.23/src'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory `/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/pulseaudio-0.9.23-r6/pulseaudio-0.9.23/src'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory `/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/pulseaudio-0.9.23-r6/pulseaudio-0.9.23/src'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/pulseaudio-0.9.23-r6/pulseaudio-0.9.23'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| ERROR: Function 'do_compile' failed (see /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/pulseaudio-0.9.23-r6/temp/log.do_compile.3404 for further information)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pulseaudio/pulseaudio_0.9.23.bb                |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
index 9521ab0..62832d9 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r6"
+PR = "r7"
 
 DEPENDS += "gdbm speex libxml-parser-perl-native"
 
@@ -23,3 +23,4 @@ do_compile_prepend() {
     cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
 }
 
+ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.rc1



