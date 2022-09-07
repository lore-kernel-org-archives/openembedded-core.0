Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 17/24] scripts/runqemu.README: fix typos and trailing whitespaces
Date: Wed,  7 Sep 2022 04:20:18 -1000
Message-Id: <b765d234c9d9d1e5e6bb02b074f42cea8fb48df2.1662559557.git.steve@sakoman.com>
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 217b00d378f359689613ca4c0666bb2eed040f69)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu.README | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/runqemu.README b/scripts/runqemu.README
index da9abd7dfb..e5f4b4634c 100644
--- a/scripts/runqemu.README
+++ b/scripts/runqemu.README
@@ -1,12 +1,12 @@
 Using OE images with QEMU
 =========================
 
-OE-Core can generate qemu bootable kernels and images with can be used 
+OE-Core can generate qemu bootable kernels and images which can be used
 on a desktop system. The scripts currently support booting ARM, MIPS, PowerPC
-and x86 (32 and 64 bit) images. The scripts can be used within the OE build 
-system or externaly.
+and x86 (32 and 64 bit) images. The scripts can be used within the OE build
+system or externally.
 
-The runqemu script is run as: 
+The runqemu script is run as:
 
    runqemu <machine> <zimage> <filesystem>
 
@@ -15,13 +15,13 @@ where:
    <machine> is the machine/architecture to use (qemuarm/qemumips/qemuppc/qemux86/qemux86-64)
    <zimage> is the path to a kernel (e.g. zimage-qemuarm.bin)
    <filesystem> is the path to an ext2 image (e.g. filesystem-qemuarm.ext2) or an nfs directory
-   
-If <machine> isn't specified, the script will try to detect the machine name 
+
+If <machine> isn't specified, the script will try to detect the machine name
 from the name of the <zimage> file.
 
 If <filesystem> isn't specified, nfs booting will be assumed.
 
-When used within the build system, it will default to qemuarm, ext2 and the last kernel and 
+When used within the build system, it will default to qemuarm, ext2 and the last kernel and
 core-image-sato-sdk image built by the build system. If an sdk image isn't present it will look
 for sato and minimal images.
 
@@ -31,7 +31,7 @@ Full usage instructions can be seen by running the command with no options speci
 Notes
 =====
 
- - The scripts run qemu using sudo. Change perms on /dev/net/tun to 
+ - The scripts run qemu using sudo. Change perms on /dev/net/tun to
    run as non root. The runqemu-gen-tapdevs script can also be used by
    root to prepopulate the appropriate network devices.
  - You can access the host computer at 192.168.7.1 within the image.
-- 
2.25.1

