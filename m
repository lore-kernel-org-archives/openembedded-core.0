Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 1272A7293D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 18:03:09 +0000 (UTC)
Received: from [70.30.87.145] (port=47322 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Y8YTC-0004ea-ME for openembedded-core@lists.openembedded.org;
	Tue, 06 Jan 2015 13:03:06 -0500
Date: Tue, 6 Jan 2015 13:03:04 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1501061257160.4810@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] Tidy up aesthetics of packagegroup recipe files.
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
X-List-Received-Date: Tue, 06 Jan 2015 18:03:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Some aesthetic cleanup of packagegroup files to make them more
consistent and easier to read:

 * standard indentation and line continuation
 * as much as possible, use ${PN} instead of hardcoded filename

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  while pedantic, this cleanup makes the packagegroup files easier to
peruse and use for demo when i'm teaching classes. also, as much as
possible and when consistent over the entire file, i replaced the
hardcoded packagegroup filename with the variable ${PN} to make it
more visually obvious that that's what was happening.

  to test, i just created a new project and ran a bitbake parse, and
everything seemed fine.

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index f4b2cd5..61031c7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -11,38 +11,37 @@ inherit packagegroup

 PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
-            packagegroup-base \
-            packagegroup-base-extended \
-            packagegroup-distro-base \
-            packagegroup-machine-base \
-            \
-            ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "ext2", "packagegroup-base-ext2", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "vfat", "packagegroup-base-vfat", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "irda", "packagegroup-base-irda", "",d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "packagegroup-base-keyboard", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "pci", "packagegroup-base-pci", "",d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "pcmcia", "packagegroup-base-pcmcia", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "phone", "packagegroup-base-phone", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "serial", "packagegroup-base-serial", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "usbgadget", "packagegroup-base-usbgadget", "", d)} \
-            ${@bb.utils.contains("MACHINE_FEATURES", "usbhost", "packagegroup-base-usbhost", "", d)} \
-            \
-            ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "packagegroup-base-bluetooth", "", d)} \
-            ${@bb.utils.contains("DISTRO_FEATURES", "wifi", "packagegroup-base-wifi", "", d)} \
-            ${@bb.utils.contains("DISTRO_FEATURES", "3g", "packagegroup-base-3g", "", d)} \
-            ${@bb.utils.contains("DISTRO_FEATURES", "nfc", "packagegroup-base-nfc", "", d)} \
-            ${@bb.utils.contains("DISTRO_FEATURES", "cramfs", "packagegroup-base-cramfs", "", d)} \
-            ${@bb.utils.contains("DISTRO_FEATURES", "ipsec", "packagegroup-base-ipsec", "", d)} \
-            ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "packagegroup-base-ipv6", "", d)} \
-            ${@bb.utils.contains("DISTRO_FEATURES", "nfs", "packagegroup-base-nfs", "", d)} \
-            ${@bb.utils.contains("DISTRO_FEATURES", "ppp", "packagegroup-base-ppp", "", d)} \
-            ${@bb.utils.contains("DISTRO_FEATURES", "smbfs", "packagegroup-base-smbfs", "", d)} \
-            ${@bb.utils.contains("DISTRO_FEATURES", "zeroconf", "packagegroup-base-zeroconf", "", d)} \
-            \
-            '
+    packagegroup-base \
+    packagegroup-base-extended \
+    packagegroup-distro-base \
+    packagegroup-machine-base \
+    \
+    ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "ext2", "packagegroup-base-ext2", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "vfat", "packagegroup-base-vfat", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "irda", "packagegroup-base-irda", "",d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "packagegroup-base-keyboard", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "pci", "packagegroup-base-pci", "",d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "pcmcia", "packagegroup-base-pcmcia", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "phone", "packagegroup-base-phone", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "serial", "packagegroup-base-serial", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "usbgadget", "packagegroup-base-usbgadget", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "usbhost", "packagegroup-base-usbhost", "", d)} \
+    \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "packagegroup-base-bluetooth", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "wifi", "packagegroup-base-wifi", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "3g", "packagegroup-base-3g", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "nfc", "packagegroup-base-nfc", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "cramfs", "packagegroup-base-cramfs", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "ipsec", "packagegroup-base-ipsec", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "packagegroup-base-ipv6", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "nfs", "packagegroup-base-nfs", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "ppp", "packagegroup-base-ppp", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "smbfs", "packagegroup-base-smbfs", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "zeroconf", "packagegroup-base-zeroconf", "", d)} \
+    '

 # Override by distro if needed
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
@@ -91,7 +90,8 @@ RRECOMMENDS_packagegroup-base = "\
     kernel-module-rtc-dev \
     kernel-module-rtc-proc \
     kernel-module-rtc-sysfs \
-    kernel-module-unix"
+    kernel-module-unix \
+    "

 RDEPENDS_packagegroup-base-extended = "\
     packagegroup-base \
@@ -144,28 +144,33 @@ RRECOMMENDS_packagegroup-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"

 SUMMARY_packagegroup-base-keyboard = "Keyboard support"
 RDEPENDS_packagegroup-base-keyboard = "\
-    ${VIRTUAL-RUNTIME_keymaps}"
+    ${VIRTUAL-RUNTIME_keymaps} \
+    "

 SUMMARY_packagegroup-base-pci = "PCI bus support"
 RDEPENDS_packagegroup-base-pci = "\
-    pciutils"
+    pciutils \
+    "

 SUMMARY_packagegroup-base-acpi = "ACPI support"
 RDEPENDS_packagegroup-base-acpi = "\
     acpid \
-    libacpi "
+    libacpi \
+    "

 SUMMARY_packagegroup-base-apm = "APM support"
 RDEPENDS_packagegroup-base-apm = "\
     ${VIRTUAL-RUNTIME_apm} \
-    apmd"
+    apmd \
+    "

 SUMMARY_packagegroup-base-ext2 = "ext2 filesystem support"
 RDEPENDS_packagegroup-base-ext2 = "\
     hdparm \
     e2fsprogs \
     e2fsprogs-e2fsck \
-    e2fsprogs-mke2fs"
+    e2fsprogs-mke2fs \
+    "

 SUMMARY_packagegroup-base-vfat = "FAT filesystem support"
 RRECOMMENDS_packagegroup-base-vfat = "\
@@ -173,17 +178,20 @@ RRECOMMENDS_packagegroup-base-vfat = "\
     kernel-module-vfat \
     kernel-module-nls-iso8859-1 \
     kernel-module-nls-cp437 \
-    dosfstools"
+    dosfstools \
+    "

 SUMMARY_packagegroup-base-alsa = "ALSA sound support"
 RDEPENDS_packagegroup-base-alsa = "\
     alsa-utils-alsactl \
     alsa-utils-alsamixer \
-    ${VIRTUAL-RUNTIME_alsa-state}"
+    ${VIRTUAL-RUNTIME_alsa-state} \
+    "

 RRECOMMENDS_packagegroup-base-alsa = "\
     kernel-module-snd-mixer-oss \
-    kernel-module-snd-pcm-oss"
+    kernel-module-snd-pcm-oss \
+    "

 SUMMARY_packagegroup-base-pcmcia = "PC card slot support"
 RDEPENDS_packagegroup-base-pcmcia = "\
@@ -225,7 +233,8 @@ RRECOMMENDS_packagegroup-base-bluetooth = "\

 SUMMARY_packagegroup-base-irda = "IrDA support"
 RDEPENDS_packagegroup-base-irda = "\
-    irda-utils"
+    irda-utils \
+    "

 RRECOMMENDS_packagegroup-base-irda = "\
     kernel-module-pxaficp-ir \
@@ -238,7 +247,8 @@ RRECOMMENDS_packagegroup-base-irda = "\
     kernel-module-irtty \
     kernel-module-irtty-sir \
     kernel-module-sir-dev \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-ir-usb', '',d)} "
+    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-ir-usb', '',d)} \
+    "

 SUMMARY_packagegroup-base-usbgadget = "USB gadget support"
 RRECOMMENDS_packagegroup-base-usbgadget = "\
@@ -246,11 +256,13 @@ RRECOMMENDS_packagegroup-base-usbgadget = "\
     kernel-module-gadgetfs \
     kernel-module-g-file-storage \
     kernel-module-g-serial \
-    kernel-module-g-ether"
+    kernel-module-g-ether \
+    "

 SUMMARY_packagegroup-base-usbhost = "USB host support"
 RDEPENDS_packagegroup-base-usbhost = "\
-    usbutils "
+    usbutils \
+    "

 RRECOMMENDS_packagegroup-base-usbhost = "\
     kernel-module-uhci-hcd \
@@ -264,26 +276,30 @@ RRECOMMENDS_packagegroup-base-usbhost = "\
     kernel-module-usbmouse \
     kernel-module-mousedev \
     kernel-module-usbserial \
-    kernel-module-usb-storage "
+    kernel-module-usb-storage \
+    "

 SUMMARY_packagegroup-base-ppp = "PPP dial-up protocol support"
 RDEPENDS_packagegroup-base-ppp = "\
     ppp \
-    ppp-dialin"
+    ppp-dialin \
+    "

 RRECOMMENDS_packagegroup-base-ppp = "\
     kernel-module-ppp-async \
     kernel-module-ppp-deflate \
     kernel-module-ppp-generic \
     kernel-module-ppp-mppe \
-    kernel-module-slhc"
+    kernel-module-slhc \
+    "

 SUMMARY_packagegroup-base-ipsec = "IPSEC support"
 RDEPENDS_packagegroup-base-ipsec = "\
     "

 RRECOMMENDS_packagegroup-base-ipsec = "\
-    kernel-module-ipsec"
+    kernel-module-ipsec \
+    "

 #
 # packagegroup-base-wifi contain everything needed to get WiFi working
@@ -294,7 +310,8 @@ RDEPENDS_packagegroup-base-wifi = "\
     wireless-tools \
     ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', '',d)} \
     ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',d)} \
-    wpa-supplicant"
+    wpa-supplicant \
+    "

 RRECOMMENDS_packagegroup-base-wifi = "\
     ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-zd1211rw', '',d)} \
@@ -308,59 +325,72 @@ RRECOMMENDS_packagegroup-base-wifi = "\
     kernel-module-cryptomgr \
     kernel-module-michael-mic \
     kernel-module-aes-generic \
-    kernel-module-aes"
+    kernel-module-aes \
+    "

 SUMMARY_packagegroup-base-nfc = "Near Field Communication support"
 RDEPENDS_packagegroup-base-nfc = "\
-    neard"
+    neard \
+    "

 RRECOMMENDS_packagegroup-base-nfc = "\
-    kernel-module-nfc"
+    kernel-module-nfc \
+    "

 SUMMARY_packagegroup-base-3g = "Cellular data support"
 RDEPENDS_packagegroup-base-3g = "\
-    ofono"
+    ofono \
+    "

 RRECOMMENDS_packagegroup-base-3g = "\
     kernel-module-cdc-acm \
-    kernel-module-cdc-wdm"
+    kernel-module-cdc-wdm \
+    "

 SUMMARY_packagegroup-base-smbfs = "SMB network filesystem support"
 RRECOMMENDS_packagegroup-base-smbfs = "\
     kernel-module-cifs \
-    kernel-module-smbfs"
+    kernel-module-smbfs \
+    "

 SUMMARY_packagegroup-base-cramfs = "cramfs filesystem support"
 RRECOMMENDS_packagegroup-base-cramfs = "\
-    kernel-module-cramfs"
+    kernel-module-cramfs \
+    "

 #
 # packagegroup-base-nfs provides ONLY client support - server is in nfs-utils package
 #
 SUMMARY_packagegroup-base-nfs = "NFS network filesystem support"
 RDEPENDS_packagegroup-base-nfs = "\
-    rpcbind"
+    rpcbind \
+    "

 RRECOMMENDS_packagegroup-base-nfs = "\
-    kernel-module-nfs "
+    kernel-module-nfs \
+    "

 SUMMARY_packagegroup-base-zeroconf = "Zeroconf support"
 RDEPENDS_packagegroup-base-zeroconf = "\
     libnss-mdns \
-    avahi-daemon"
+    avahi-daemon \
+    "

 SUMMARY_packagegroup-base-ipv6 = "IPv6 support"
 RDEPENDS_packagegroup-base-ipv6 = "\
     "

 RRECOMMENDS_packagegroup-base-ipv6 = "\
-    kernel-module-ipv6 "
+    kernel-module-ipv6 \
+    "

 SUMMARY_packagegroup-base-serial = "Serial port support"
 RDEPENDS_packagegroup-base-serial = "\
     setserial \
-    lrzsz "
+    lrzsz \
+    "

 SUMMARY_packagegroup-base-phone = "Cellular telephony (voice) support"
 RDEPENDS_packagegroup-base-phone = "\
-    ofono"
+    ofono \
+    "
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 09f5373..5f080be 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -41,7 +41,9 @@ RDEPENDS_${PN} = "\
     ${VIRTUAL-RUNTIME_init_manager} \
     ${VIRTUAL-RUNTIME_dev_manager} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
-    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
+    ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS} \
+    "

 RRECOMMENDS_${PN} = "\
-    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"
+    ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS} \
+    "
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 74ed247..f0b7a41 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"

 inherit packagegroup

-RDEPENDS_packagegroup-core-buildessential = "\
+RDEPENDS_${PN} = "\
     autoconf \
     automake \
     binutils \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index a544bbd..3d95f09 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -10,7 +10,7 @@ inherit packagegroup

 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'

-RDEPENDS_packagegroup-core-sdk = "\
+RDEPENDS_${PN} = "\
     packagegroup-core-buildessential \
     coreutils \
     ccache \
@@ -26,7 +26,7 @@ RDEPENDS_packagegroup-core-sdk = "\
     file \
     tcl"

-RRECOMMENDS_packagegroup-core-sdk = "\
+RRECOMMENDS_${PN} = "\
     libgomp \
     libgomp-dev"

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index f95ce77..5047e5c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -10,27 +10,27 @@ LICENSE = "MIT"
 inherit packagegroup

 PACKAGES = "\
-    packagegroup-self-hosted \
-    packagegroup-self-hosted-debug \
-    packagegroup-self-hosted-sdk \
-    packagegroup-self-hosted-extended \
-    packagegroup-self-hosted-graphics \
-    packagegroup-self-hosted-host-tools \
+    ${PN} \
+    ${PN}-debug \
+    ${PN}-sdk \
+    ${PN}-extended \
+    ${PN}-graphics \
+    ${PN}-host-tools \
     "

-RDEPENDS_packagegroup-self-hosted = "\
-    packagegroup-self-hosted-debug \
-    packagegroup-self-hosted-sdk \
-    packagegroup-self-hosted-extended \
-    packagegroup-self-hosted-graphics \
-    packagegroup-self-hosted-host-tools \
+RDEPENDS_${PN} = "\
+    ${PN}-debug \
+    ${PN}-sdk \
+    ${PN}-extended \
+    ${PN}-graphics \
+    ${PN}-host-tools \
     "

 # midori depends on webkit-gtk which could not build for mips64
 MIDORI = "midori"
 MIDORI_mips64 = ""

-RDEPENDS_packagegroup-self-hosted-host-tools = "\
+RDEPENDS_${PN}-host-tools = "\
     connman \
     connman-plugin-ethernet \
     dhcp-client \
@@ -51,7 +51,7 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     screen \
     "

-RRECOMMENDS_packagegroup-self-hosted-host-tools = "\
+RRECOMMENDS_${PN}-host-tools = "\
     kernel-module-tun \
     kernel-module-iptable-raw \
     kernel-module-iptable-nat \
@@ -60,7 +60,7 @@ RRECOMMENDS_packagegroup-self-hosted-host-tools = "\
 	"

 # glibc-utils: for rpcgen
-RDEPENDS_packagegroup-self-hosted-sdk = "\
+RDEPENDS_${PN}-sdk = "\
     autoconf \
     automake \
     binutils \
@@ -96,7 +96,7 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     sed \
     "

-RDEPENDS_packagegroup-self-hosted-debug = " \
+RDEPENDS_${PN}-debug = " \
     gdb \
     gdbserver \
     rsync \
@@ -104,7 +104,7 @@ RDEPENDS_packagegroup-self-hosted-debug = " \
     tcf-agent"


-RDEPENDS_packagegroup-self-hosted-extended = "\
+RDEPENDS_${PN}-extended = "\
     bzip2 \
     chkconfig \
     chrpath \
@@ -209,7 +209,7 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     "


-RDEPENDS_packagegroup-self-hosted-graphics = "\
+RDEPENDS_${PN}-graphics = "\
     builder \
     libgl \
     libgl-dev \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index ad3f240..80ac3df 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -10,14 +10,14 @@ LICENSE = "MIT"
 inherit packagegroup

 PACKAGES = "\
-    packagegroup-core-full-cmdline \
-    packagegroup-core-full-cmdline-libs \
-    packagegroup-core-full-cmdline-utils \
-    packagegroup-core-full-cmdline-extended \
-    packagegroup-core-full-cmdline-dev-utils \
-    packagegroup-core-full-cmdline-multiuser \
-    packagegroup-core-full-cmdline-initscripts \
-    packagegroup-core-full-cmdline-sys-services \
+    ${PN} \
+    ${PN}-libs \
+    ${PN}-utils \
+    ${PN}-extended \
+    ${PN}-dev-utils \
+    ${PN}-multiuser \
+    ${PN}-initscripts \
+    ${PN}-sys-services \
     "

 python __anonymous () {
@@ -54,21 +54,21 @@ python __anonymous () {
 }


-RDEPENDS_packagegroup-core-full-cmdline = "\
-    packagegroup-core-full-cmdline-libs \
-    packagegroup-core-full-cmdline-utils \
-    packagegroup-core-full-cmdline-extended \
-    packagegroup-core-full-cmdline-dev-utils \
-    packagegroup-core-full-cmdline-multiuser \
-    packagegroup-core-full-cmdline-initscripts \
-    packagegroup-core-full-cmdline-sys-services \
+RDEPENDS_${PN} = "\
+    ${PN}-libs \
+    ${PN}-utils \
+    ${PN}-extended \
+    ${PN}-dev-utils \
+    ${PN}-multiuser \
+    ${PN}-initscripts \
+    ${PN}-sys-services \
     "

-RDEPENDS_packagegroup-core-full-cmdline-libs = "\
+RDEPENDS_${PN}-libs = "\
     glib-2.0 \
     "

-RDEPENDS_packagegroup-core-full-cmdline-utils = "\
+RDEPENDS_${PN}-utils = "\
     bash \
     acl \
     attr \
@@ -102,7 +102,7 @@ RDEPENDS_packagegroup-core-full-cmdline-utils = "\
     zlib \
     "

-RDEPENDS_packagegroup-core-full-cmdline-extended = "\
+RDEPENDS_${PN}-extended = "\
     iproute2 \
     iputils \
     iptables \
@@ -110,7 +110,7 @@ RDEPENDS_packagegroup-core-full-cmdline-extended = "\
     openssl \
     "

-RDEPENDS_packagegroup-core-full-cmdline-dev-utils = "\
+RDEPENDS_${PN}-dev-utils = "\
     byacc \
     diffutils \
     m4 \
@@ -122,7 +122,7 @@ VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 VIRTUAL-RUNTIME_login_manager ?= "busybox"
 VIRTUAL-RUNTIME_syslog ?= "sysklogd"
-RDEPENDS_packagegroup-core-full-cmdline-initscripts = "\
+RDEPENDS_${PN}-initscripts = "\
     ${VIRTUAL-RUNTIME_initscripts} \
     ${VIRTUAL-RUNTIME_init_manager} \
     ethtool \
@@ -130,7 +130,7 @@ RDEPENDS_packagegroup-core-full-cmdline-initscripts = "\
     ${VIRTUAL-RUNTIME_syslog} \
     "

-RDEPENDS_packagegroup-core-full-cmdline-multiuser = "\
+RDEPENDS_${PN}-multiuser = "\
     cracklib \
     gzip \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libuser', '', d)} \
@@ -138,7 +138,7 @@ RDEPENDS_packagegroup-core-full-cmdline-multiuser = "\
     sudo \
     "

-RDEPENDS_packagegroup-core-full-cmdline-sys-services = "\
+RDEPENDS_${PN}-sys-services = "\
     at \
     bzip2 \
     cronie \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index dd96fbe..dc7498f 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -167,7 +167,7 @@ RDEPENDS_packagegroup-core-lsb-core = "\
     nspr \
     libpng12 \
     nss \
-"
+    "

 SUMMARY_packagegroup-core-lsb-perl = "LSB Runtime Languages (Perl)"
 DESCRIPTION_packagegroup-core-lsb-perl = "Packages required to support libraries \
@@ -179,7 +179,7 @@ RDEPENDS_packagegroup-core-lsb-perl = "\
     perl-pod \
     perl-dev \
     perl-doc \
-"
+    "

 SUMMARY_packagegroup-core-lsb-python = "LSB Runtime Languages (Python)"
 DESCRIPTION_packagegroup-core-lsb-python = "Packages required to support libraries \
@@ -188,7 +188,7 @@ RDEPENDS_packagegroup-core-lsb-python = "\
     python \
     python-modules \
     python-misc \
-"
+    "

 def get_libqt3(d):
     if 'linuxstdbase' in d.getVar('DISTROOVERRIDES') or "":
@@ -234,7 +234,7 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
     libasound \
     ${QT4PKGS} \
     ${@get_libqt3(d)} \
-"
+    "

 RDEPENDS_packagegroup-core-lsb-runtime-add = "\
     ldd \
@@ -258,7 +258,7 @@ RDEPENDS_packagegroup-core-lsb-runtime-add = "\
     libfile-checktree-perl \
     libi18n-collate-perl \
     libpod-plainer-perl \
-"
+    "

 PTH = "pth"
 PTH_libc-uclibc = ""
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
index 53dc0ae..d46a4b1 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
@@ -8,10 +8,10 @@ inherit packagegroup
 TOUCH = ' ${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'

 RDEPENDS_${PN} = " \
-		directfb \
-		directfb-examples \
-		pango \
-		pango-modules \
-		fontconfig \
-		${TOUCH} \
-"
+    directfb \
+    directfb-examples \
+    pango \
+    pango-modules \
+    fontconfig \
+    ${TOUCH} \
+    "
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index d7a457c..7325456 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -10,43 +10,43 @@ inherit packagegroup
 TOUCH = ' ${@bb.utils.contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'

 RDEPENDS_${PN} = " \
-	qt4-embedded \
-	libqt-embedded3support4 \
-	libqt-embeddedclucene4 \
-	libqt-embeddedcore4 \
-	libqt-embeddeddbus4 \
-	libqt-embeddedgui4 \
-	libqt-embeddedhelp4 \
-	libqt-embeddedmultimedia4 \
-	libqt-embeddednetwork4 \
-	libqt-embeddedscript4 \
-	libqt-embeddedscripttools4 \
-	libqt-embeddedsql4 \
-	libqt-embeddedsvg4 \
-	libqt-embeddedtest4 \
-	libqt-embeddedwebkit4 \
-	libqt-embeddedxml4 \
-	qt4-embedded-fonts-ttf-dejavu \
-	qt4-embedded-fonts-ttf-vera \
-	qt4-embedded-plugin-iconengine-svgicon \
-	qt4-embedded-plugin-imageformat-gif \
-	qt4-embedded-plugin-imageformat-ico \
-	qt4-embedded-plugin-imageformat-jpeg \
-	qt4-embedded-plugin-imageformat-mng \
-	qt4-embedded-plugin-imageformat-svg \
-	qt4-embedded-plugin-imageformat-tiff \
-	qt4-embedded-plugin-mousedriver-tslib \
-	qt4-embedded-plugin-phonon-backend-gstreamer \
-	qt4-embedded-plugin-script-dbus \
-	qt4-embedded-plugin-sqldriver-sqlite \
-	${TOUCH} \
-        qt4-embedded-demos \
-        qt4-embedded-examples \
-        qt-demo-init \
-        qt4-embedded-assistant \
-"
+    qt4-embedded \
+    libqt-embedded3support4 \
+    libqt-embeddedclucene4 \
+    libqt-embeddedcore4 \
+    libqt-embeddeddbus4 \
+    libqt-embeddedgui4 \
+    libqt-embeddedhelp4 \
+    libqt-embeddedmultimedia4 \
+    libqt-embeddednetwork4 \
+    libqt-embeddedscript4 \
+    libqt-embeddedscripttools4 \
+    libqt-embeddedsql4 \
+    libqt-embeddedsvg4 \
+    libqt-embeddedtest4 \
+    libqt-embeddedwebkit4 \
+    libqt-embeddedxml4 \
+    qt4-embedded-fonts-ttf-dejavu \
+    qt4-embedded-fonts-ttf-vera \
+    qt4-embedded-plugin-iconengine-svgicon \
+    qt4-embedded-plugin-imageformat-gif \
+    qt4-embedded-plugin-imageformat-ico \
+    qt4-embedded-plugin-imageformat-jpeg \
+    qt4-embedded-plugin-imageformat-mng \
+    qt4-embedded-plugin-imageformat-svg \
+    qt4-embedded-plugin-imageformat-tiff \
+    qt4-embedded-plugin-mousedriver-tslib \
+    qt4-embedded-plugin-phonon-backend-gstreamer \
+    qt4-embedded-plugin-script-dbus \
+    qt4-embedded-plugin-sqldriver-sqlite \
+    ${TOUCH} \
+    qt4-embedded-demos \
+    qt4-embedded-examples \
+    qt-demo-init \
+    qt4-embedded-assistant \
+    "

 RRECOMMENDS_${PN} = " \
-	libqt-embeddedxmlpatterns4 \
-"
+    libqt-embeddedxmlpatterns4 \
+    "

diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
index 0e7c800..53b7af4 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.bb
@@ -5,7 +5,7 @@ QTLIBPREFIX = ""
 require packagegroup-qt-toolchain-target.inc

 RDEPENDS_${PN} += " \
-        qt4-x11-free-dev \
-        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libqtopengl4-dev', '', d)} \
-        ${@bb.utils.contains('DISTRO_FEATURES', 'openvg', 'libqtopenvg4-dev', '', d)} \
-        "
+    qt4-x11-free-dev \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libqtopengl4-dev', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'openvg', 'libqtopenvg4-dev', '', d)} \
+    "

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

