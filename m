Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoFh-00022z-S0
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:39 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055117"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:27:54 -0800
Message-Id: <1469485eca04f2bedcc2a4bd82f120bcc8878777.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/21] pulseaudio-0.9.23: force ARM mode
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:39 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

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
 .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
index 9521ab0..dd5fcae 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r6"
+PR = "r7"
 
 DEPENDS += "gdbm speex libxml-parser-perl-native"
 
-- 
1.7.6.4



