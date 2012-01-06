Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RjJbA-0002P4-3t
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 00:53:24 +0100
Received: by vcbf1 with SMTP id f1so1665921vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 15:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=nKq3xpwH4s0yGOq8nfat50uwZT+DO71TafYPKcP1po0=;
	b=Wm86auIIKQvpzTjwI33HrFgpmvtgBWTzjTTSIWYaQJLFd1m4icW8FRIMac0hGcqmi+
	pWnnPN8MSERoE/OGBw6cj8RNu2eLyM2emCblzSOwanYKNQHyLztz29+GaRzruwnXGZld
	4auFSKaAiPXEit0xt0gxdppwQcIyNApMhfZvw=
MIME-Version: 1.0
Received: by 10.220.229.200 with SMTP id jj8mr2043544vcb.53.1325893548102;
	Fri, 06 Jan 2012 15:45:48 -0800 (PST)
Received: by 10.52.95.211 with HTTP; Fri, 6 Jan 2012 15:45:48 -0800 (PST)
Date: Fri, 6 Jan 2012 15:45:48 -0800
Message-ID: <CAGDS+nm0tC4ZXPcL-VRGvA0qy+9WOU36+85Jhon6Dwq948pfqQ@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] Remove last remnants of kernel26 MACHINE_FEATURES
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
X-List-Received-Date: Fri, 06 Jan 2012 23:53:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

There is really no reason to continue to carry this feature

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
Note: bsp layer maintainers may want to remove kernel26 references
from their machine.conf files

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c21616..5f75ddf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -692,7 +692,6 @@ OES_BITBAKE_CONF = "1"
 # Machine properties and task-base stuff
 ##################################################################

-MACHINE_FEATURES ?= "kernel26"
 DISTRO_FEATURES ?= ""

 # This is used to limit what packages goes into images built, so set
big by default
diff --git a/meta/conf/machine/include/qemu.inc
b/meta/conf/machine/include/qemu.inc
index 3cebfab..10ab76e 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -1,7 +1,7 @@
 PCMCIA_MANAGER = "pcmciautils"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"

-MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
+MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"

 IMAGE_FSTYPES ?= "tar.bz2 ext3"

diff --git a/meta/recipes-kernel/update-modules/update-modules_1.0.bb
b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
index 1ea97a8..dc44965 100644
--- a/meta/recipes-kernel/update-modules/update-modules_1.0.bb
+++ b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
@@ -3,8 +3,8 @@ SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM =
"file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"

-RDEPENDS_${PN} = "${@base_contains("MACHINE_FEATURES", "kernel26",
"module-init-tools-depmod","modutils-depmod",d)} "
-PR = "r10"
+RDEPENDS_${PN} = "module-init-tools-depmod"
+PR = "r11"

 SRC_URI = "file://update-modules \
            file://COPYING.GPL"


