Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3332270101
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 20:28:25 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id gc2so992709pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=d+5CxvD6ULQu+ZTwqUXwnuv2RjCegz7noAGjXALtn/g=;
	b=WTpVTDTO9XL7tFGwtLbJtNFU97s/sKQ3aVi7h5eTFzKLpHvnmLpj88SV663lJf5UZ2
	zoLC34U5eDA5yFFi9q9XbJsRgLrDn1YQ1NxG15M3/FXzNrYnQ+azXn+zk8loMKZxARe8
	fgjGSjcnkibvt6b+pQZ9LSImphudBZnKaqqnjr0hE8zvqE+KaTylkfyZ1vQtApApqG9j
	ekH82IUUylJfxmSc/pWdFvjhTOGKe0j/tAEClYKRMd3t2Ey3Cjeb1FcmSRBSbyCvTRQu
	bhWpQrSynXqJBQ7BfAoPmqG25YAlY07/mnAejpUfSah97gvkoiO+h5SuKNaEzFOKIa8G
	O3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=d+5CxvD6ULQu+ZTwqUXwnuv2RjCegz7noAGjXALtn/g=;
	b=Hiie5hepauntL5/tAz+7DBQ5uds/fm/QQHKm/MOV95lzs0ogSrTgGTR9+ryGOYmad3
	/Ertxe3lko1L2L0+EDu4I2bVxcE6qia8Xu6ZdnZI/4Bsbzm1xOGKpZvC2umIzabPOtuU
	Jfvy49EqeROXiVRgNjZhBA4PPiWFSAZD7pET9RCysuQox11j8jxv3QFBz4jEofFX/DY4
	nwUkkDCa5t3OQG2sfkQH81R97werQhpTJ+RWyo33MoQMHLr5BGbXlUckhccn+zgOCblv
	L39vsa4IsP7bwT01jxX6uia8rL9sDFwjStURU6dZnO7AoFTIWnTmInRg0/Nq39m2gsee
	wnJw==
X-Gm-Message-State: AG10YOTe/qJX5GOLy0xLL2YQw152XA4Eew/c7Pinzeqy/13McywJ04UAstU3EJemilycAw==
X-Received: by 10.66.90.133 with SMTP id bw5mr61123311pab.22.1455136106663;
	Wed, 10 Feb 2016 12:28:26 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	yl1sm7127443pac.35.2016.02.10.12.28.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 12:28:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 12:28:22 -0800
Message-Id: <1455136102-4951-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1455136102-4951-1-git-send-email-akuster808@gmail.com>
References: <1455136102-4951-1-git-send-email-akuster808@gmail.com>
Subject: [[master][PATCH 2/2] qemu: Security fix CVE-2016-2198
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
X-List-Received-Date: Wed, 10 Feb 2016 20:28:26 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-2198 Qemu: usb: ehci null pointer dereference in ehci_caps_write

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-2198.patch | 45 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch
new file mode 100644
index 0000000..f1201f0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch
@@ -0,0 +1,45 @@
+From: Prasad J Pandit <address@hidden>
+
+USB Ehci emulation supports host controller capability registers.
+But its mmio '.write' function was missing, which lead to a null
+pointer dereference issue. Add a do nothing 'ehci_caps_write'
+definition to avoid it; Do nothing because capability registers
+are Read Only(RO).
+
+Reported-by: Zuozhi Fzz <address@hidden>
+Signed-off-by: Prasad J Pandit <address@hidden>
+
+Upstream-Status: Backport
+https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg05899.html
+
+CVE: CVE-2016-2198
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/usb/hcd-ehci.c | 6 ++++++
+  1 file changed, 6 insertions(+)
+
+Index: qemu-2.5.0/hw/usb/hcd-ehci.c
+===================================================================
+--- qemu-2.5.0.orig/hw/usb/hcd-ehci.c
++++ qemu-2.5.0/hw/usb/hcd-ehci.c
+@@ -893,6 +893,11 @@ static uint64_t ehci_caps_read(void *ptr
+     return s->caps[addr];
+ }
+ 
++static void ehci_caps_write(void *ptr, hwaddr addr,
++                             uint64_t val, unsigned size)
++{
++}
++
+ static uint64_t ehci_opreg_read(void *ptr, hwaddr addr,
+                                 unsigned size)
+ {
+@@ -2310,6 +2315,7 @@ static void ehci_frame_timer(void *opaqu
+ 
+ static const MemoryRegionOps ehci_mmio_caps_ops = {
+     .read = ehci_caps_read,
++    .write = ehci_caps_write,
+     .valid.min_access_size = 1,
+     .valid.max_access_size = 4,
+     .impl.min_access_size = 1,
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index 3e7df2f..4398a18 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://no-valgrind.patch \
             file://CVE-2016-1568.patch \
             file://CVE-2016-2197.patch \
+            file://CVE-2016-2198.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-- 
2.3.5


