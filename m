Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q0ILA-0003fb-E0
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 19:54:33 +0100
Received: by pwj9 with SMTP id 9so445341pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 11:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zZ9ePn7U4XJvhhwBAfJLbKIv0ZkgxntU6nPhMlvegcc=;
	b=A99oHMYaiTi3QwbYCHOfcrUdxAZ4VsIt4ZfO8bsjOyVGB27nueLQUX99j2M4vT4zMJ
	Xo4dS7k8KO2mVDF12Zrna3EMPh+43btircjn8IpkOD35BEEIy8nW6Y5Pv1JQKYZe9pJg
	KraqNfrQdd/PuUmUQhFcRYCnnuGOeh22G4Zp0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=du83iu/Q4OM61ECXJNmMuyG7dpU/fWx2NcQ3jK4nxnvkPWm5m9mGHmB4hUQzXunSty
	CmlzeSIaJ5gpBO5qpqGCtyDDC0gwtiEoQfxJm0vFbIkgsqe3ag9RnYW0zf9RdyXS1+8x
	B9eRvFOLocm59KcTgRWIpizjXYmseySu64Uaw=
Received: by 10.142.156.12 with SMTP id d12mr73921wfe.184.1300387964864;
	Thu, 17 Mar 2011 11:52:44 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm2816203wfb.22.2011.03.17.11.52.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 11:52:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Mar 2011 11:52:38 -0700
Message-Id: <5cf658d4af50f5478a7ef852640933844f3292e7.1300387701.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300387701.git.raj.khem@gmail.com>
References: <cover.1300387701.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] qemu: Upgrade 0.13.0 -> 0.14.0
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
X-List-Received-Date: Thu, 17 Mar 2011 18:54:33 -0000

* ppc-hack patch is dropped.

* Other patches which were direct backports
  or has been merged upstream in 0.14.0 are
  also dropped

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../qemu/qemu-0.13.0/fix-dirent.patch              |   12 -
 .../qemu/qemu-0.13.0/glflags.patch                 |   13 -
 .../qemu/qemu-0.13.0/no-strip.patch                |   26 --
 .../qemu/qemu-0.13.0/parallel_make.patch           |   34 --
 .../qemu/qemu-0.13.0/port92_fix.patch              |  196 -----------
 .../qemu/qemu-0.13.0/qemu-ppc-hack.patch           |  108 ------
 .../qemu/qemu-0.13.0/vmware-vga-fifo-rewind.patch  |  198 -----------
 .../qemu/qemu-0.13.0/wacom-tablet-fix.patch        |   65 ----
 .../qemu-0.13.0/workaround_bad_futex_headers.patch |   24 --
 ...t-and-use-GCC-atomic-builtins-for-locking.patch |   84 +++++
 .../enable-i386-linux-user.patch                   |   14 +-
 .../fallback-to-safe-mmap_min_addr.patch           |    8 +-
 .../fix-configure-checks.patch                     |   12 +-
 .../{qemu-0.13.0 => qemu-0.14.0}/fix-nogl.patch    |   55 +++-
 .../{qemu-0.13.0 => qemu-0.14.0}/init-info.patch   |    8 +-
 .../qemu/qemu-0.14.0/larger_default_ram_size.patch |   13 +
 .../linker-flags.patch                             |    8 +-
 .../qemu/qemu-0.14.0/no-strip.patch                |   13 +
 .../{qemu-0.13.0 => qemu-0.14.0}/powerpc_rom.bin   |  Bin 4096 -> 4096 bytes
 .../qemu-git-qemugl-host.patch                     |  346 ++++++++++----------
 .../qemu-vmware-vga-depth.patch                    |   52 ++--
 .../qemugl-allow-glxcontext-release.patch          |    6 +-
 .../spice-qxl-locking-fix-for-qemu-kvm.patch       |  150 +++++++++
 .../qemu/{qemu_0.13.0.bb => qemu_0.14.0.bb}        |   19 +-
 24 files changed, 537 insertions(+), 927 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/fix-dirent.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/glflags.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/no-strip.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/parallel_make.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/port92_fix.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/qemu-ppc-hack.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/vmware-vga-fifo-rewind.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/wacom-tablet-fix.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu-0.13.0/workaround_bad_futex_headers.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/enable-i386-linux-user.patch (73%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/fallback-to-safe-mmap_min_addr.patch (87%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/fix-configure-checks.patch (65%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/fix-nogl.patch (61%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/init-info.patch (74%)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/linker-flags.patch (77%)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/qemu-git-qemugl-host.patch (99%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/qemu-vmware-vga-depth.patch (72%)
 rename meta/recipes-devtools/qemu/{qemu-0.13.0 => qemu-0.14.0}/qemugl-allow-glxcontext-release.patch (93%)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
 rename meta/recipes-devtools/qemu/{qemu_0.13.0.bb => qemu_0.14.0.bb} (69%)

diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/fix-dirent.patch b/meta/recipes-devtools/qemu/qemu-0.13.0/fix-dirent.patch
deleted file mode 100644
index 8bbfa0e..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/fix-dirent.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: qemu/linux-user/syscall.c
-===================================================================
---- qemu.orig/linux-user/syscall.c	2010-05-11 13:16:22.421783949 -0400
-+++ qemu/linux-user/syscall.c	2010-05-11 13:16:31.759805849 -0400
-@@ -26,6 +26,7 @@
- #include <errno.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#include <dirent.h>
- #include <time.h>
- #include <limits.h>
- #include <sys/types.h>
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/glflags.patch b/meta/recipes-devtools/qemu/qemu-0.13.0/glflags.patch
deleted file mode 100644
index 0a27c2d..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/glflags.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: git/Makefile.target
-===================================================================
---- git.orig/Makefile.target	2010-05-27 12:35:26.000000000 -0400
-+++ git/Makefile.target	2010-05-27 12:59:53.520415731 -0400
-@@ -326,7 +326,7 @@ vl.o: qemu-options.h
- 
- monitor.o: qemu-monitor.h
- 
--LIBS += -lGL -lGLU
-+LIBS += -lGL
- 
- ARLIBS=../libqemu_common.a libqemu.a $(HWLIB)
- 
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/no-strip.patch b/meta/recipes-devtools/qemu/qemu-0.13.0/no-strip.patch
deleted file mode 100644
index 62cdec6..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/no-strip.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Index: qemu-0.13.0/Makefile
-===================================================================
---- qemu-0.13.0.orig/Makefile	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/Makefile	2011-01-17 16:44:57.000000000 +0800
-@@ -185,7 +185,7 @@
- install: all $(if $(BUILD_DOCS),install-doc) install-sysconfig
- 	$(INSTALL_DIR) "$(DESTDIR)$(bindir)"
- ifneq ($(TOOLS),)
--	$(INSTALL_PROG) $(STRIP_OPT) $(TOOLS) "$(DESTDIR)$(bindir)"
-+	$(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
- endif
- ifneq ($(BLOBS),)
- 	$(INSTALL_DIR) "$(DESTDIR)$(datadir)"
-Index: qemu-0.13.0/Makefile.target
-===================================================================
---- qemu-0.13.0.orig/Makefile.target	2011-01-17 16:42:36.000000000 +0800
-+++ qemu-0.13.0/Makefile.target	2011-01-17 16:44:57.000000000 +0800
-@@ -351,7 +351,7 @@
- 
- install: all
- ifneq ($(PROGS),)
--	$(INSTALL) -m 755 $(STRIP_OPT) $(PROGS) "$(DESTDIR)$(bindir)"
-+	$(INSTALL) -m 755 $(PROGS) "$(DESTDIR)$(bindir)"
- endif
- 
- # Include automatically generated dependency files
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/parallel_make.patch b/meta/recipes-devtools/qemu/qemu-0.13.0/parallel_make.patch
deleted file mode 100644
index 278b1a7..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/parallel_make.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Make -j(>=6) always fail as some job depends on config-host.h. Added following
-patch in upstream to resolve it.
-
-Could remove it in next upgrade if necessary.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-commit f0acb38015409024683911380daa94cc974e4e0e
-Author: Paul Brook <paul@codesourcery.com>
-Date:   Fri Nov 26 18:46:03 2010 +0000
-
-    Add missing dependency.
-    
-    Teach Makefile that cmd.o depends on a generated header (specifically
-    config-host.h).
-    
-    Signed-off-by: Paul Brook <paul@codesourcery.com>
-    (cherry picked from commit 6e14404aab26f74a448747d1e793ac16bde8a92b)
-    
-    Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
-
-Index: qemu-0.13.0/Makefile
-===================================================================
---- qemu-0.13.0.orig/Makefile	2011-01-18 09:45:45.000000000 +0800
-+++ qemu-0.13.0/Makefile	2011-01-18 09:45:45.000000000 +0800
-@@ -107,7 +107,7 @@
- ######################################################################
- 
- qemu-img.o: qemu-img-cmds.h
--qemu-img.o qemu-tool.o qemu-nbd.o qemu-io.o: $(GENERATED_HEADERS)
-+qemu-img.o qemu-tool.o qemu-nbd.o qemu-io.o cmd.o: $(GENERATED_HEADERS)
- 
- qemu-img$(EXESUF): qemu-img.o qemu-tool.o qemu-error.o $(block-obj-y) $(qobject-obj-y)
- 
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/port92_fix.patch b/meta/recipes-devtools/qemu/qemu-0.13.0/port92_fix.patch
deleted file mode 100644
index e101c68..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/port92_fix.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-With qemu 0.13.0, poky failed to start on ppc arch because both ppc_prep_init
-and i8042_initfn try to register to port 0x92 then cause conflict. Introduce
-this patch from upstream to fix it.
-
-Could remove it in future if necessary.
-
-Signed-off-by: Zhai, Edwin <edwin.zhai@intel.com>
-
-commit 4b78a802ffaabb325a0f7b773031da92d173bde1
-Author: Blue Swirl <blauwirbel@gmail.com>
-Date:   Thu Jan 6 18:24:35 2011 +0000
-
-    pc: move port 92 stuff back to pc.c from pckbd.c
-    
-    956a3e6bb7386de48b642d4fee11f7f86a2fcf9a introduced a bug concerning
-    reset bit for port 92.
-    
-    Since the keyboard output port and port 92 are not compatible anyway,
-    let's separate them.
-    
-    Reported-by: Peter Lieven <pl@dlh.net>
-    Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
-    --
-    v2: added reset handler and VMState
-
-Index: qemu-0.13.0/hw/pc.c
-===================================================================
---- qemu-0.13.0.orig/hw/pc.c	2010-10-16 04:56:09.000000000 +0800
-+++ qemu-0.13.0/hw/pc.c	2011-01-20 20:37:37.000000000 +0800
-@@ -409,11 +409,91 @@
-     qemu_register_reset(pc_cmos_init_late, &arg);
- }
- 
-+/* port 92 stuff: could be split off */
-+typedef struct Port92State {
-+    ISADevice dev;
-+    uint8_t outport;
-+    qemu_irq *a20_out;
-+} Port92State;
-+
-+static void port92_write(void *opaque, uint32_t addr, uint32_t val)
-+{
-+    Port92State *s = opaque;
-+
-+    DPRINTF("port92: write 0x%02x\n", val);
-+    s->outport = val;
-+    qemu_set_irq(*s->a20_out, (val >> 1) & 1);
-+    if (val & 1) {
-+        qemu_system_reset_request();
-+    }
-+}
-+
-+static uint32_t port92_read(void *opaque, uint32_t addr)
-+{
-+    Port92State *s = opaque;
-+    uint32_t ret;
-+
-+    ret = s->outport;
-+    DPRINTF("port92: read 0x%02x\n", ret);
-+    return ret;
-+}
-+
-+static void port92_init(ISADevice *dev, qemu_irq *a20_out)
-+{
-+    Port92State *s = DO_UPCAST(Port92State, dev, dev);
-+
-+    s->a20_out = a20_out;
-+}
-+
-+static const VMStateDescription vmstate_port92_isa = {
-+    .name = "port92",
-+    .version_id = 1,
-+    .minimum_version_id = 1,
-+    .minimum_version_id_old = 1,
-+    .fields      = (VMStateField []) {
-+        VMSTATE_UINT8(outport, Port92State),
-+        VMSTATE_END_OF_LIST()
-+    }
-+};
-+
-+static void port92_reset(DeviceState *d)
-+{
-+    Port92State *s = container_of(d, Port92State, dev.qdev);
-+
-+    s->outport &= ~1;
-+}
-+
-+static int port92_initfn(ISADevice *dev)
-+{
-+    Port92State *s = DO_UPCAST(Port92State, dev, dev);
-+
-+    register_ioport_read(0x92, 1, 1, port92_read, s);
-+    register_ioport_write(0x92, 1, 1, port92_write, s);
-+    s->outport = 0;
-+    return 0;
-+}
-+
-+static ISADeviceInfo port92_info = {
-+    .qdev.name     = "port92",
-+    .qdev.size     = sizeof(Port92State),
-+    .qdev.vmsd     = &vmstate_port92_isa,
-+    .qdev.no_user  = 1,
-+    .qdev.reset    = port92_reset,
-+    .init          = port92_initfn,
-+};
-+
-+static void port92_register(void)
-+{
-+    isa_qdev_register(&port92_info);
-+}
-+device_init(port92_register)
-+
- static void handle_a20_line_change(void *opaque, int irq, int level)
- {
-     CPUState *cpu = opaque;
- 
-     /* XXX: send to all CPUs ? */
-+    /* XXX: add logic to handle multiple A20 line sources */
-     cpu_x86_set_a20(cpu, level);
- }
- 
-@@ -1017,7 +1097,7 @@
-     PITState *pit;
-     qemu_irq rtc_irq = NULL;
-     qemu_irq *a20_line;
--    ISADevice *i8042;
-+    ISADevice *i8042, *port92;
-     qemu_irq *cpu_exit_irq;
- 
-     register_ioport_write(0x80, 1, 1, ioport80_write, NULL);
-@@ -1051,10 +1131,12 @@
-         }
-     }
- 
--    a20_line = qemu_allocate_irqs(handle_a20_line_change, first_cpu, 1);
-+    a20_line = qemu_allocate_irqs(handle_a20_line_change, first_cpu, 2);
-     i8042 = isa_create_simple("i8042");
--    i8042_setup_a20_line(i8042, a20_line);
-+    i8042_setup_a20_line(i8042, &a20_line[0]);
-     vmmouse_init(i8042);
-+    port92 = isa_create_simple("port92");
-+    port92_init(port92, &a20_line[1]);
- 
-     cpu_exit_irq = qemu_allocate_irqs(cpu_request_exit, NULL, 1);
-     DMA_init(0, cpu_exit_irq);
-Index: qemu-0.13.0/hw/pckbd.c
-===================================================================
---- qemu-0.13.0.orig/hw/pckbd.c	2010-10-16 04:56:09.000000000 +0800
-+++ qemu-0.13.0/hw/pckbd.c	2011-01-20 20:33:44.000000000 +0800
-@@ -209,10 +209,8 @@
-         ps2_queue(s->kbd, b);
- }
- 
--static void ioport92_write(void *opaque, uint32_t addr, uint32_t val)
-+static void outport_write(KBDState *s, uint32_t val)
- {
--    KBDState *s = opaque;
--
-     DPRINTF("kbd: write outport=0x%02x\n", val);
-     s->outport = val;
-     if (s->a20_out) {
-@@ -223,16 +221,6 @@
-     }
- }
- 
--static uint32_t ioport92_read(void *opaque, uint32_t addr)
--{
--    KBDState *s = opaque;
--    uint32_t ret;
--
--    ret = s->outport;
--    DPRINTF("kbd: read outport=0x%02x\n", ret);
--    return ret;
--}
--
- static void kbd_write_command(void *opaque, uint32_t addr, uint32_t val)
- {
-     KBDState *s = opaque;
-@@ -340,7 +328,7 @@
-         kbd_queue(s, val, 1);
-         break;
-     case KBD_CCMD_WRITE_OUTPORT:
--        ioport92_write(s, 0, val);
-+        outport_write(s, val);
-         break;
-     case KBD_CCMD_WRITE_MOUSE:
-         ps2_write_mouse(s->mouse, val);
-@@ -469,8 +457,6 @@
-     register_ioport_write(0x60, 1, 1, kbd_write_data, s);
-     register_ioport_read(0x64, 1, 1, kbd_read_status, s);
-     register_ioport_write(0x64, 1, 1, kbd_write_command, s);
--    register_ioport_read(0x92, 1, 1, ioport92_read, s);
--    register_ioport_write(0x92, 1, 1, ioport92_write, s);
- 
-     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
-     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/qemu-ppc-hack.patch b/meta/recipes-devtools/qemu/qemu-0.13.0/qemu-ppc-hack.patch
deleted file mode 100644
index 6f45788..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/qemu-ppc-hack.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-Quick fixes to get the ppc system model to boot a 603e based
-kernel.
-
-Index: qemu-0.13.0/hw/m48t59.c
-===================================================================
---- qemu-0.13.0.orig/hw/m48t59.c	2010-10-16 04:56:09.000000000 +0800
-+++ qemu-0.13.0/hw/m48t59.c	2011-01-17 16:40:09.000000000 +0800
-@@ -50,6 +50,7 @@
-  */
- 
- struct M48t59State {
-+    SysBusDevice busdev;
-     /* Model parameters */
-     uint32_t type; // 2 = m48t02, 8 = m48t08, 59 = m48t59
-     /* Hardware parameters */
-@@ -74,11 +75,6 @@
-     M48t59State state;
- } M48t59ISAState;
- 
--typedef struct M48t59SysBusState {
--    SysBusDevice busdev;
--    M48t59State state;
--} M48t59SysBusState;
--
- /* Fake timer functions */
- 
- /* Alarm management */
-@@ -629,8 +625,7 @@
- 
- static void m48t59_reset_sysbus(DeviceState *d)
- {
--    M48t59SysBusState *sys = container_of(d, M48t59SysBusState, busdev.qdev);
--    M48t59State *NVRAM = &sys->state;
-+    M48t59State *NVRAM = container_of(d, M48t59State, busdev.qdev);
- 
-     m48t59_reset_common(NVRAM);
- }
-@@ -641,7 +636,7 @@
- {
-     DeviceState *dev;
-     SysBusDevice *s;
--    M48t59SysBusState *d;
-+    M48t59State *d;
- 
-     dev = qdev_create(NULL, "m48t59");
-     qdev_prop_set_uint32(dev, "type", type);
-@@ -658,9 +653,9 @@
-         sysbus_mmio_map(s, 0, mem_base);
-     }
- 
--    d = FROM_SYSBUS(M48t59SysBusState, s);
-+    d = FROM_SYSBUS(M48t59State, s);
- 
--    return &d->state;
-+    return d;
- }
- 
- M48t59State *m48t59_init_isa(uint32_t io_base, uint16_t size, int type)
-@@ -710,8 +705,7 @@
- 
- static int m48t59_init1(SysBusDevice *dev)
- {
--    M48t59SysBusState *d = FROM_SYSBUS(M48t59SysBusState, dev);
--    M48t59State *s = &d->state;
-+    M48t59State *s = FROM_SYSBUS(M48t59State, dev);
-     int mem_index;
- 
-     sysbus_init_irq(dev, &s->IRQ);
-@@ -740,12 +734,12 @@
- static SysBusDeviceInfo m48t59_info = {
-     .init = m48t59_init1,
-     .qdev.name  = "m48t59",
--    .qdev.size = sizeof(M48t59SysBusState),
-+    .qdev.size  = sizeof(M48t59State),
-     .qdev.reset = m48t59_reset_sysbus,
-     .qdev.props = (Property[]) {
--        DEFINE_PROP_UINT32("size",    M48t59SysBusState, state.size,    -1),
--        DEFINE_PROP_UINT32("type",    M48t59SysBusState, state.type,    -1),
--        DEFINE_PROP_HEX32( "io_base", M48t59SysBusState, state.io_base,  0),
-+        DEFINE_PROP_UINT32("size",    M48t59State, size,    -1),
-+        DEFINE_PROP_UINT32("type",    M48t59State, type,    -1),
-+        DEFINE_PROP_HEX32( "io_base", M48t59State, io_base,  0),
-         DEFINE_PROP_END_OF_LIST(),
-     }
- };
-Index: qemu-0.13.0/hw/ppc_prep.c
-===================================================================
---- qemu-0.13.0.orig/hw/ppc_prep.c	2010-10-16 04:56:09.000000000 +0800
-+++ qemu-0.13.0/hw/ppc_prep.c	2011-01-15 18:29:25.000000000 +0800
-@@ -74,7 +74,7 @@
- /* Constants for devices init */
- static const int ide_iobase[2] = { 0x1f0, 0x170 };
- static const int ide_iobase2[2] = { 0x3f6, 0x376 };
--static const int ide_irq[2] = { 13, 13 };
-+static const int ide_irq[2] = { 13, 14 };
- 
- #define NE2000_NB_MAX 6
- 
-@@ -631,9 +631,6 @@
-     if (filename) {
-         qemu_free(filename);
-     }
--    if (env->nip < 0xFFF80000 && bios_size < 0x00100000) {
--        hw_error("PowerPC 601 / 620 / 970 need a 1MB BIOS\n");
--    }
- 
-     if (linux_boot) {
-         kernel_base = KERNEL_LOAD_ADDR;
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/vmware-vga-fifo-rewind.patch b/meta/recipes-devtools/qemu/qemu-0.13.0/vmware-vga-fifo-rewind.patch
deleted file mode 100644
index 867e54b..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/vmware-vga-fifo-rewind.patch
+++ /dev/null
@@ -1,198 +0,0 @@
-commit 4dedc07ffbbc66002e0fd2b97d5516fe6aca5eea
-Author: Andrzej Zaborowski <balrog@zabor.org>
-Date:   Fri Sep 10 02:23:31 2010 +0200
-
-    vmware_vga: Add checks to deal with non-atomic fifo writes.
-    
-    Janne Huttunen noticed that the FIFO end pointer is updated by the
-    guest after writing each word to the FIFO, at least the X.org driver
-    which is open does this.  This means that there's no way for the
-    host to know if the guest is in the middle a write operation.  Qemu
-    thus needs to read the beginning of the command up to when it's able
-    to tell how many words are expected for the given command.  It will
-    abort reading and rewind the FIFO if there aren't enough words yet,
-    this should be relatively rare but it is suspected to have been the
-    cause of the occasional FIFO overrun that killed the display.
-
-Index: qemu-0.13.0/hw/vmware_vga.c
-===================================================================
---- qemu-0.13.0.orig/hw/vmware_vga.c	2011-01-15 18:06:06.000000000 +0800
-+++ qemu-0.13.0/hw/vmware_vga.c	2011-01-15 18:17:04.000000000 +0800
-@@ -521,27 +521,37 @@
- 
- static uint32_t last_cmd;
- 
--static inline int vmsvga_fifo_empty(struct vmsvga_state_s *s)
-+static inline int vmsvga_fifo_length(struct vmsvga_state_s *s)
- {
-+    int num;
-     if (!s->config || !s->enable)
--        return 1;
--    return (s->cmd->next_cmd == s->cmd->stop);
-+        return 0;
-+    num = CMD(next_cmd) - CMD(stop);
-+    if (num < 0)
-+        num += CMD(max) - CMD(min);
-+    return num >> 2;
- }
- 
- static inline uint32_t vmsvga_fifo_read_raw(struct vmsvga_state_s *s)
- {
--    int offset = CMD(stop);
-+    uint32_t cmd = s->fifo[CMD(stop) >> 2];
- 
-+    /* If parameter is not available in FIFO, return 0 rather than random
-+     * value. Also update the stop as missing parameter will be inserted
-+     * soonly, else it will be treated as new command next time.
-+     * With rewinding in vmsvga_fifo_run, this unlikely happen.
-+     */
-     if (unlikely(s->cmd->next_cmd == s->cmd->stop)) {
-         fprintf(stderr, "%s: FIFO empty during CMD %i\n",
-                         __FUNCTION__, last_cmd);
--        return 0x00000000;
-+        cmd = 0;
-     }
- 
--    s->cmd->stop = cpu_to_le32(offset + 4);
--    if (offset + 4 >= CMD(max))
-+    s->cmd->stop = cpu_to_le32(CMD(stop) + 4);
-+    if (CMD(stop) >= CMD(max))
-         s->cmd->stop = s->cmd->min;
--    return s->fifo[offset >> 2];
-+
-+    return cmd;
- }
- 
- static inline uint32_t vmsvga_fifo_read(struct vmsvga_state_s *s)
-@@ -552,13 +562,23 @@
- static void vmsvga_fifo_run(struct vmsvga_state_s *s)
- {
-     uint32_t colour;
--    int args = 0;
-+    int args, len;
-     int x, y, dx, dy, width, height;
-     struct vmsvga_cursor_definition_s cursor;
--    while (!vmsvga_fifo_empty(s))
-+    uint32_t cmd_start;
-+
-+    len = vmsvga_fifo_length(s);
-+    while (len > 0) {
-+        /* May need to go back to the start of the command if incomplete */
-+        cmd_start = s->cmd->stop;
-+
-         switch (last_cmd = vmsvga_fifo_read(s)) {
-         case SVGA_CMD_UPDATE:
-         case SVGA_CMD_UPDATE_VERBOSE:
-+            len -= 5;
-+            if (len <0)
-+                goto rewind;
-+
-             x = vmsvga_fifo_read(s);
-             y = vmsvga_fifo_read(s);
-             width = vmsvga_fifo_read(s);
-@@ -567,6 +587,10 @@
-             break;
- 
-         case SVGA_CMD_RECT_FILL:
-+            len -= 6;
-+            if (len < 0)
-+                goto rewind;
-+
-             colour = vmsvga_fifo_read(s);
-             x = vmsvga_fifo_read(s);
-             y = vmsvga_fifo_read(s);
-@@ -576,10 +600,15 @@
-             vmsvga_fill_rect(s, colour, x, y, width, height);
-             break;
- #else
-+            args = 0;
-             goto badcmd;
- #endif
- 
-         case SVGA_CMD_RECT_COPY:
-+            len -= 7;
-+            if (len < 0)
-+                goto rewind;
-+
-             x = vmsvga_fifo_read(s);
-             y = vmsvga_fifo_read(s);
-             dx = vmsvga_fifo_read(s);
-@@ -590,10 +619,15 @@
-             vmsvga_copy_rect(s, x, y, dx, dy, width, height);
-             break;
- #else
-+            args = 0;
-             goto badcmd;
- #endif
- 
-         case SVGA_CMD_DEFINE_CURSOR:
-+            len -= 8;
-+            if (len < 0)
-+                goto rewind;
-+
-             cursor.id = vmsvga_fifo_read(s);
-             cursor.hot_x = vmsvga_fifo_read(s);
-             cursor.hot_y = vmsvga_fifo_read(s);
-@@ -602,11 +636,14 @@
-             vmsvga_fifo_read(s);
-             cursor.bpp = vmsvga_fifo_read(s);
- 
-+            args = SVGA_BITMAP_SIZE(x, y) + SVGA_PIXMAP_SIZE(x, y, cursor.bpp);
- 	    if (SVGA_BITMAP_SIZE(x, y) > sizeof cursor.mask ||
--		SVGA_PIXMAP_SIZE(x, y, cursor.bpp) > sizeof cursor.image) {
--		    args = SVGA_BITMAP_SIZE(x, y) + SVGA_PIXMAP_SIZE(x, y, cursor.bpp);
-+		SVGA_PIXMAP_SIZE(x, y, cursor.bpp) > sizeof cursor.image)
- 		    goto badcmd;
--	    }
-+
-+            len -= args;
-+            if (len < 0)
-+                goto rewind;
- 
-             for (args = 0; args < SVGA_BITMAP_SIZE(x, y); args ++)
-                 cursor.mask[args] = vmsvga_fifo_read_raw(s);
-@@ -625,6 +662,10 @@
-          * for so we can avoid FIFO desync if driver uses them illegally.
-          */
-         case SVGA_CMD_DEFINE_ALPHA_CURSOR:
-+            len -= 6;
-+            if (len < 0)
-+                goto rewind;
-+
-             vmsvga_fifo_read(s);
-             vmsvga_fifo_read(s);
-             vmsvga_fifo_read(s);
-@@ -639,6 +680,10 @@
-             args = 7;
-             goto badcmd;
-         case SVGA_CMD_DRAW_GLYPH_CLIPPED:
-+            len -= 4;
-+            if (len < 0)
-+                goto rewind;
-+
-             vmsvga_fifo_read(s);
-             vmsvga_fifo_read(s);
-             args = 7 + (vmsvga_fifo_read(s) >> 2);
-@@ -659,14 +704,22 @@
-             break; /* Nop */
- 
-         default:
-+            args = 0;
-         badcmd:
-+            len -= args;
-+            if (len < 0)
-+                goto rewind;
-             while (args --)
-                 vmsvga_fifo_read(s);
-             printf("%s: Unknown command 0x%02x in SVGA command FIFO\n",
-                             __FUNCTION__, last_cmd);
-             break;
-+        rewind:
-+            s->cmd->stop = cmd_start;
-+            break;
-         }
- 
-+    }
-     s->syncing = 0;
- }
- 
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/wacom-tablet-fix.patch b/meta/recipes-devtools/qemu/qemu-0.13.0/wacom-tablet-fix.patch
deleted file mode 100644
index b8210db..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/wacom-tablet-fix.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-qemu 0.13.0 cause seg fault in qemu_remove_mouse_event_handler, this patch from
-upstream can fix it.
-
-Should remove it in next upgrade if necessary.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-commit b2d4d8329963b13c5cebe5944dcc99f0e9d1b5c7
-Author: Gerd Hoffmann <kraxel@redhat.com>
-Date:   Fri Oct 8 12:30:14 2010 +0200
-
-    wacom tablet: activate event handlers.
-    
-    Add qemu_activate_mouse_event_handler() calls to the usb wavom tablet so
-    it actually receives events.  Also make sure we only remove the handler
-    if we registered it before.
-    
-    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-    Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
-
-Index: qemu-0.13.0/hw/usb-wacom.c
-===================================================================
---- qemu-0.13.0.orig/hw/usb-wacom.c	2010-10-16 04:56:09.000000000 +0800
-+++ qemu-0.13.0/hw/usb-wacom.c	2011-01-18 16:58:44.000000000 +0800
-@@ -160,6 +160,7 @@
-     if (!s->mouse_grabbed) {
-         s->eh_entry = qemu_add_mouse_event_handler(usb_mouse_event, s, 0,
-                         "QEMU PenPartner tablet");
-+        qemu_activate_mouse_event_handler(s->eh_entry);
-         s->mouse_grabbed = 1;
-     }
- 
-@@ -197,6 +198,7 @@
-     if (!s->mouse_grabbed) {
-         s->eh_entry = qemu_add_mouse_event_handler(usb_wacom_event, s, 1,
-                         "QEMU PenPartner tablet");
-+        qemu_activate_mouse_event_handler(s->eh_entry);
-         s->mouse_grabbed = 1;
-     }
- 
-@@ -334,8 +336,10 @@
-         ret = 0;
-         break;
-     case WACOM_SET_REPORT:
--        qemu_remove_mouse_event_handler(s->eh_entry);
--        s->mouse_grabbed = 0;
-+        if (s->mouse_grabbed) {
-+            qemu_remove_mouse_event_handler(s->eh_entry);
-+            s->mouse_grabbed = 0;
-+        }
-         s->mode = data[0];
-         ret = 0;
-         break;
-@@ -397,7 +401,10 @@
- {
-     USBWacomState *s = (USBWacomState *) dev;
- 
--    qemu_remove_mouse_event_handler(s->eh_entry);
-+    if (s->mouse_grabbed) {
-+        qemu_remove_mouse_event_handler(s->eh_entry);
-+        s->mouse_grabbed = 0;
-+    }
- }
- 
- static int usb_wacom_initfn(USBDevice *dev)
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/workaround_bad_futex_headers.patch b/meta/recipes-devtools/qemu/qemu-0.13.0/workaround_bad_futex_headers.patch
deleted file mode 100644
index a08e2d9..0000000
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/workaround_bad_futex_headers.patch
+++ /dev/null
@@ -1,24 +0,0 @@
----
- linux-user/syscall.c |   10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-Index: qemu-0.13.0/linux-user/syscall.c
-===================================================================
---- qemu-0.13.0.orig/linux-user/syscall.c	2011-01-17 16:52:18.000000000 +0800
-+++ qemu-0.13.0/linux-user/syscall.c	2011-01-17 16:52:20.000000000 +0800
-@@ -99,6 +99,15 @@
- #define CLONE_NPTL_FLAGS2 0
- #endif
- 
-+#define FUTEX_WAIT              0
-+#define FUTEX_WAKE              1
-+#define FUTEX_FD                2
-+#define FUTEX_REQUEUE           3
-+#define FUTEX_CMP_REQUEUE       4
-+#define FUTEX_WAKE_OP           5
-+#define FUTEX_LOCK_PI           6
-+#define FUTEX_UNLOCK_PI         7
-+
- //#define DEBUG
- 
- //#include <linux/msdos_fs.h>
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
new file mode 100644
index 0000000..dc69bfb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
@@ -0,0 +1,84 @@
+From de01f17a2cb88dc5ff53cc321342b888c33b120a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <lool@dooz.org>
+Date: Thu, 11 Feb 2010 17:42:33 +0100
+Subject: [PATCH] Detect and use GCC atomic builtins for locking
+
+---
+ configure   |   17 +++++++++++++++++
+ qemu-lock.h |   13 +++++++++++++
+ 2 files changed, 30 insertions(+), 0 deletions(-)
+
+Index: qemu-0.14.0/configure
+===================================================================
+--- qemu-0.14.0.orig/configure
++++ qemu-0.14.0/configure
+@@ -2243,6 +2243,20 @@ fi
+ ##########################################
+ 
+ ##########################################
++# check if we have gcc atomic built-ins
++gcc_atomic_builtins=no
++cat > $TMPC << EOF
++int main(void) {
++    int i;
++    __sync_lock_test_and_set(&i, 1);
++    __sync_lock_release(&i);
++}
++EOF
++if compile_prog "" ""; then
++    gcc_atomic_builtins=yes
++fi
++
++##########################################
+ # check if we have fdatasync
+ 
+ fdatasync=no
+@@ -2731,6 +2745,9 @@ fi
+ if test "$gcc_attribute_warn_unused_result" = "yes" ; then
+   echo "CONFIG_GCC_ATTRIBUTE_WARN_UNUSED_RESULT=y" >> $config_host_mak
+ fi
++if test "$gcc_atomic_builtins" = "yes" ; then
++  echo "CONFIG_GCC_ATOMIC_BUILTINS=y" >> $config_host_mak
++fi
+ if test "$fdatasync" = "yes" ; then
+   echo "CONFIG_FDATASYNC=y" >> $config_host_mak
+ fi
+Index: qemu-0.14.0/qemu-lock.h
+===================================================================
+--- qemu-0.14.0.orig/qemu-lock.h
++++ qemu-0.14.0/qemu-lock.h
+@@ -33,6 +33,14 @@
+ 
+ #else
+ 
++#ifdef CONFIG_GCC_ATOMIC_BUILTINS
++typedef int spinlock_t;
++
++#define SPIN_LOCK_UNLOCKED 0
++
++#define resetlock(p) __sync_lock_release((p))
++#else /* CONFIG_GCC_ATOMIC_BUILTINS */
++
+ #if defined(__hppa__)
+ 
+ typedef int spinlock_t[4];
+@@ -56,7 +64,11 @@ static inline void resetlock (spinlock_t
+ }
+ 
+ #endif
++#endif /* !CONFIG_GCC_ATOMIC_BUILTINS */
+ 
++#ifdef CONFIG_GCC_ATOMIC_BUILTINS
++#define testandset(p) __sync_lock_test_and_set((p), 1)
++#else /* CONFIG_GCC_ATOMIC_BUILTINS */
+ #if defined(_ARCH_PPC)
+ static inline int testandset (int *p)
+ {
+@@ -213,6 +225,7 @@ static inline int testandset (int *p)
+ #else
+ #error unimplemented CPU support
+ #endif
++#endif /* !CONFIG_GCC_ATOMIC_BUILTINS */
+ 
+ #if defined(CONFIG_USER_ONLY)
+ static inline void spin_lock(spinlock_t *lock)
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/enable-i386-linux-user.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch
similarity index 73%
rename from meta/recipes-devtools/qemu/qemu-0.13.0/enable-i386-linux-user.patch
rename to meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch
index 95420ef..3cf0953 100644
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/enable-i386-linux-user.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch
@@ -2,11 +2,11 @@ Enable i386-linux-user
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
-Index: qemu-0.13.0/Makefile.target
+Index: qemu-0.14.0/Makefile.target
 ===================================================================
---- qemu-0.13.0.orig/Makefile.target	2011-01-17 16:50:39.000000000 +0800
-+++ qemu-0.13.0/Makefile.target	2011-01-17 16:50:41.000000000 +0800
-@@ -54,8 +54,13 @@
+--- qemu-0.14.0.orig/Makefile.target
++++ qemu-0.14.0/Makefile.target
+@@ -78,8 +78,13 @@ ifeq ($(TARGET_BASE_ARCH), i386)
  libobj-y += cpuid.o
  endif
  libobj-$(CONFIG_NEED_MMU) += mmu.o
@@ -20,10 +20,10 @@ Index: qemu-0.13.0/Makefile.target
  libobj-$(TARGET_ARM) += dummygl.o
  libobj-$(TARGET_MIPS) += dummygl.o
  libobj-$(TARGET_PPC) += dummygl.o
-Index: qemu-0.13.0/target-i386/dummygl.c
+Index: qemu-0.14.0/target-i386/dummygl.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/dummygl.c	2011-01-17 16:50:41.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/dummygl.c
 @@ -0,0 +1,26 @@
 +#include <string.h>
 +#include <stdlib.h>
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/fallback-to-safe-mmap_min_addr.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch
similarity index 87%
rename from meta/recipes-devtools/qemu/qemu-0.13.0/fallback-to-safe-mmap_min_addr.patch
rename to meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch
index 7c782b9..4b1a64f 100644
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/fallback-to-safe-mmap_min_addr.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch
@@ -8,10 +8,10 @@ Subject: [PATCH] linux-user: use default mmap_min_addr 65536 when /proc/sys/vm/m
  linux-user/main.c |    5 +++++
  1 files changed, 5 insertions(+), 0 deletions(-)
 
-Index: qemu-0.13.0/linux-user/main.c
+Index: qemu-0.14.0/linux-user/main.c
 ===================================================================
---- qemu-0.13.0.orig/linux-user/main.c
-+++ qemu-0.13.0/linux-user/main.c
+--- qemu-0.14.0.orig/linux-user/main.c
++++ qemu-0.14.0/linux-user/main.c
 @@ -36,6 +36,7 @@
  #include "envlist.h"
  
@@ -20,7 +20,7 @@ Index: qemu-0.13.0/linux-user/main.c
  
  char *exec_path;
  
-@@ -2973,8 +2974,14 @@ int main(int argc, char **argv, char **e
+@@ -3010,8 +3011,14 @@ int main(int argc, char **argv, char **e
              if (fscanf(fp, "%lu", &tmp) == 1) {
                  mmap_min_addr = tmp;
                  qemu_log("host mmap_min_addr=0x%lx\n", mmap_min_addr);
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/fix-configure-checks.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch
similarity index 65%
rename from meta/recipes-devtools/qemu/qemu-0.13.0/fix-configure-checks.patch
rename to meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch
index 46ddc6e..574b430 100644
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/fix-configure-checks.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch
@@ -6,15 +6,15 @@ added and files in the sysroot can be found.
 
 Patch from Paul Eggleton, Comments by RP 28/11/10
 
-Index: qemu-0.13.0/configure
+Index: qemu-0.14.0/configure
 ===================================================================
---- qemu-0.13.0.orig/configure	2010-10-16 04:56:09.000000000 +0800
-+++ qemu-0.13.0/configure	2011-01-15 18:19:41.000000000 +0800
-@@ -134,6 +134,7 @@
+--- qemu-0.14.0.orig/configure
++++ qemu-0.14.0/configure
+@@ -229,6 +229,7 @@ QEMU_CFLAGS="-Wstrict-prototypes -Wredun
  QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
  QEMU_CFLAGS="-D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
- QEMU_CFLAGS="-I. -I\$(SRC_PATH) $QEMU_CFLAGS"
+ QEMU_INCLUDES="-I. -I\$(SRC_PATH)"
 +QEMU_CFLAGS="$QEMU_CFLAGS $CFLAGS"
  LDFLAGS="-g $LDFLAGS"
  
- gcc_flags="-Wold-style-declaration -Wold-style-definition -fstack-protector-all"
+ # make source path absolute
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/fix-nogl.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch
similarity index 61%
rename from meta/recipes-devtools/qemu/qemu-0.13.0/fix-nogl.patch
rename to meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch
index fa518ab..0219cc8 100644
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/fix-nogl.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch
@@ -1,22 +1,24 @@
-Index: qemu-0.13.0/Makefile.target
+Index: qemu-0.14.0/Makefile.target
 ===================================================================
---- qemu-0.13.0.orig/Makefile.target	2011-01-17 16:53:08.000000000 +0800
-+++ qemu-0.13.0/Makefile.target	2011-01-17 16:53:11.000000000 +0800
-@@ -55,6 +55,10 @@
+--- qemu-0.14.0.orig/Makefile.target
++++ qemu-0.14.0/Makefile.target
+@@ -79,6 +79,12 @@ libobj-y += cpuid.o
  endif
  libobj-$(CONFIG_NEED_MMU) += mmu.o
  libobj-$(TARGET_I386) += helper_opengl.o opengl_exec.o
 +libobj-$(TARGET_X86_64) += helper_opengl.o opengl_exec.o
 +libobj-$(TARGET_ARM) += dummygl.o
 +libobj-$(TARGET_MIPS) += dummygl.o
++libobj-$(TARGET_MIPS64) += dummygl.o
 +libobj-$(TARGET_PPC) += dummygl.o
++libobj-$(TARGET_SH4) += dummygl.o
  libobj-$(TARGET_ARM) += neon_helper.o iwmmxt_helper.o
  
  libobj-y += disas.o
-Index: qemu-0.13.0/target-arm/dummygl.c
+Index: qemu-0.14.0/target-arm/dummygl.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-arm/dummygl.c	2011-01-17 16:53:11.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-arm/dummygl.c
 @@ -0,0 +1,22 @@
 +#include <string.h>
 +#include <stdlib.h>
@@ -40,10 +42,10 @@ Index: qemu-0.13.0/target-arm/dummygl.c
 +{
 +
 +}
-Index: qemu-0.13.0/target-mips/dummygl.c
+Index: qemu-0.14.0/target-mips/dummygl.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-mips/dummygl.c	2011-01-17 16:53:11.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-mips/dummygl.c
 @@ -0,0 +1,22 @@
 +#include <string.h>
 +#include <stdlib.h>
@@ -67,10 +69,37 @@ Index: qemu-0.13.0/target-mips/dummygl.c
 +{
 +
 +}
-Index: qemu-0.13.0/target-ppc/dummygl.c
+Index: qemu-0.14.0/target-ppc/dummygl.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-ppc/dummygl.c	2011-01-17 16:53:11.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-ppc/dummygl.c
+@@ -0,0 +1,22 @@
++#include <string.h>
++#include <stdlib.h>
++#include <assert.h>
++#include <stdint.h>
++#include <X11/Xlib.h>
++#include <X11/Xutil.h>
++
++void opengl_exec_set_parent_window(Display* _dpy, Window _parent_window)
++{
++
++}
++
++void opengl_process_enable(void)
++{
++
++}
++
++
++void mem_opengl(uint64_t ptr)
++{
++
++}
+Index: qemu-0.14.0/target-sh4/dummygl.c
+===================================================================
+--- /dev/null
++++ qemu-0.14.0/target-sh4/dummygl.c
 @@ -0,0 +1,22 @@
 +#include <string.h>
 +#include <stdlib.h>
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/init-info.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch
similarity index 74%
rename from meta/recipes-devtools/qemu/qemu-0.13.0/init-info.patch
rename to meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch
index 77022ae..8df60e8 100644
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/init-info.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch
@@ -2,11 +2,11 @@
 # makes info.info.x11.display zero and avoids the calls to
 # opengl_exec_set_parent_window, one of which is crashing.
 
-Index: qemu-0.13.0/ui/sdl.c
+Index: qemu-0.14.0/ui/sdl.c
 ===================================================================
---- qemu-0.13.0.orig/ui/sdl.c	2011-01-15 17:40:59.000000000 +0800
-+++ qemu-0.13.0/ui/sdl.c	2011-01-15 17:41:04.000000000 +0800
-@@ -857,6 +857,7 @@
+--- qemu-0.14.0.orig/ui/sdl.c
++++ qemu-0.14.0/ui/sdl.c
+@@ -863,6 +863,7 @@ void sdl_display_init(DisplayState *ds,
      vi = SDL_GetVideoInfo();
      host_format = *(vi->vfmt);
  
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
new file mode 100644
index 0000000..2d965c9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
@@ -0,0 +1,13 @@
+Index: qemu-0.14.0/vl.c
+===================================================================
+--- qemu-0.14.0.orig/vl.c
++++ qemu-0.14.0/vl.c
+@@ -168,7 +168,7 @@ int main(int argc, char **argv)
+ //#define DEBUG_NET
+ //#define DEBUG_SLIRP
+ 
+-#define DEFAULT_RAM_SIZE 128
++#define DEFAULT_RAM_SIZE 384
+ 
+ #define MAX_VIRTIO_CONSOLES 1
+ 
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/linker-flags.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch
similarity index 77%
rename from meta/recipes-devtools/qemu/qemu-0.13.0/linker-flags.patch
rename to meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch
index 54c480f..470cf80 100644
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/linker-flags.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch
@@ -7,11 +7,11 @@ More information is available on the Fedora Wiki:
 https://fedoraproject.org/wiki/UnderstandingDSOLinkChange
 
 JL - 15/06/10
-Index: qemu-0.13.0/Makefile.target
+Index: qemu-0.14.0/Makefile.target
 ===================================================================
---- qemu-0.13.0.orig/Makefile.target	2011-01-15 17:30:45.000000000 +0800
-+++ qemu-0.13.0/Makefile.target	2011-01-15 17:33:22.000000000 +0800
-@@ -193,7 +193,7 @@
+--- qemu-0.14.0.orig/Makefile.target
++++ qemu-0.14.0/Makefile.target
+@@ -218,7 +218,7 @@ obj-$(CONFIG_REALLY_VIRTFS) += virtio-9p
  obj-y += rwhandler.o
  obj-$(CONFIG_KVM) += kvm.o kvm-all.o
  obj-$(CONFIG_NO_KVM) += kvm-stub.o
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
new file mode 100644
index 0000000..cf0d659
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
@@ -0,0 +1,13 @@
+Index: qemu-0.14.0/Makefile
+===================================================================
+--- qemu-0.14.0.orig/Makefile
++++ qemu-0.14.0/Makefile
+@@ -235,7 +235,7 @@ install-sysconfig:
+ install: all $(if $(BUILD_DOCS),install-doc) install-sysconfig
+ 	$(INSTALL_DIR) "$(DESTDIR)$(bindir)"
+ ifneq ($(TOOLS),)
+-	$(INSTALL_PROG) $(STRIP_OPT) $(TOOLS) "$(DESTDIR)$(bindir)"
++	$(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
+ endif
+ ifneq ($(BLOBS),)
+ 	$(INSTALL_DIR) "$(DESTDIR)$(datadir)"
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/powerpc_rom.bin b/meta/recipes-devtools/qemu/qemu-0.14.0/powerpc_rom.bin
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-0.13.0/powerpc_rom.bin
rename to meta/recipes-devtools/qemu/qemu-0.14.0/powerpc_rom.bin
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-0.13.0/qemu-git-qemugl-host.patch
rename to meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
index 085477c..92467a7 100644
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/qemu-git-qemugl-host.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
@@ -1,8 +1,8 @@
-Index: qemu-0.13.0/Makefile.target
+Index: qemu-0.14.0/Makefile.target
 ===================================================================
---- qemu-0.13.0.orig/Makefile.target	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/Makefile.target	2011-01-17 16:42:36.000000000 +0800
-@@ -54,6 +54,7 @@
+--- qemu-0.14.0.orig/Makefile.target
++++ qemu-0.14.0/Makefile.target
+@@ -78,6 +78,7 @@ ifeq ($(TARGET_BASE_ARCH), i386)
  libobj-y += cpuid.o
  endif
  libobj-$(CONFIG_NEED_MMU) += mmu.o
@@ -10,7 +10,7 @@ Index: qemu-0.13.0/Makefile.target
  libobj-$(TARGET_ARM) += neon_helper.o iwmmxt_helper.o
  
  libobj-y += disas.o
-@@ -76,6 +77,21 @@
+@@ -100,6 +101,21 @@ op_helper.o cpu-exec.o: QEMU_CFLAGS += $
  # cpu_signal_handler() in cpu-exec.c.
  signal.o: QEMU_CFLAGS += $(HELPER_CFLAGS)
  
@@ -32,9 +32,9 @@ Index: qemu-0.13.0/Makefile.target
  #########################################################
  # Linux user emulator target
  
-@@ -202,6 +218,10 @@
- obj-i386-y += debugcon.o multiboot.o
+@@ -221,6 +237,10 @@ obj-i386-y += debugcon.o multiboot.o
  obj-i386-y += pc_piix.o
+ obj-i386-$(CONFIG_SPICE) += qxl.o qxl-logger.o qxl-render.o
  
 +ifeq ($(TARGET_BASE_ARCH), i386)
 +QEMU_CFLAGS += -DTARGET_OPENGL_OK
@@ -43,20 +43,20 @@ Index: qemu-0.13.0/Makefile.target
  # shared objects
  obj-ppc-y = ppc.o
  obj-ppc-y += vga.o
-@@ -301,6 +321,8 @@
+@@ -331,6 +351,8 @@ main.o: QEMU_CFLAGS+=$(GPROF_CFLAGS)
  
- monitor.o: qemu-monitor.h
+ monitor.o: hmp-commands.h qmp-commands.h
  
 +LIBS += -lGL -lGLU
 +
  $(obj-y) $(obj-$(TARGET_BASE_ARCH)-y): $(GENERATED_HEADERS)
  
  obj-y += $(addprefix ../, $(common-obj-y))
-Index: qemu-0.13.0/hw/pixel_ops.h
+Index: qemu-0.14.0/hw/pixel_ops.h
 ===================================================================
---- qemu-0.13.0.orig/hw/pixel_ops.h	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/hw/pixel_ops.h	2011-01-17 16:42:36.000000000 +0800
-@@ -4,6 +4,12 @@
+--- qemu-0.14.0.orig/hw/pixel_ops.h
++++ qemu-0.14.0/hw/pixel_ops.h
+@@ -4,6 +4,12 @@ static inline unsigned int rgb_to_pixel8
      return ((r >> 5) << 5) | ((g >> 5) << 2) | (b >> 6);
  }
  
@@ -69,20 +69,20 @@ Index: qemu-0.13.0/hw/pixel_ops.h
  static inline unsigned int rgb_to_pixel15(unsigned int r, unsigned int g,
                                            unsigned int b)
  {
-Index: qemu-0.13.0/hw/vmware_vga.c
+Index: qemu-0.14.0/hw/vmware_vga.c
 ===================================================================
---- qemu-0.13.0.orig/hw/vmware_vga.c	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/hw/vmware_vga.c	2011-01-17 16:42:36.000000000 +0800
-@@ -519,6 +519,8 @@
+--- qemu-0.14.0.orig/hw/vmware_vga.c
++++ qemu-0.14.0/hw/vmware_vga.c
+@@ -517,6 +517,8 @@ static inline void vmsvga_cursor_define(
  
  #define CMD(f)	le32_to_cpu(s->cmd->f)
  
 +static uint32_t last_cmd;
 +
- static inline int vmsvga_fifo_empty(struct vmsvga_state_s *s)
+ static inline int vmsvga_fifo_length(struct vmsvga_state_s *s)
  {
-     if (!s->config || !s->enable)
-@@ -528,11 +530,18 @@
+     int num;
+@@ -530,11 +532,18 @@ static inline int vmsvga_fifo_length(str
  
  static inline uint32_t vmsvga_fifo_read_raw(struct vmsvga_state_s *s)
  {
@@ -105,49 +105,51 @@ Index: qemu-0.13.0/hw/vmware_vga.c
  }
  
  static inline uint32_t vmsvga_fifo_read(struct vmsvga_state_s *s)
-@@ -542,12 +551,12 @@
+@@ -544,7 +553,7 @@ static inline uint32_t vmsvga_fifo_read(
  
  static void vmsvga_fifo_run(struct vmsvga_state_s *s)
  {
 -    uint32_t cmd, colour;
 +    uint32_t colour;
-     int args = 0;
+     int args, len;
      int x, y, dx, dy, width, height;
      struct vmsvga_cursor_definition_s cursor;
-     while (!vmsvga_fifo_empty(s))
+@@ -555,7 +564,7 @@ static void vmsvga_fifo_run(struct vmsvg
+         /* May need to go back to the start of the command if incomplete */
+         cmd_start = s->cmd->stop;
+ 
 -        switch (cmd = vmsvga_fifo_read(s)) {
 +        switch (last_cmd = vmsvga_fifo_read(s)) {
          case SVGA_CMD_UPDATE:
          case SVGA_CMD_UPDATE_VERBOSE:
-             x = vmsvga_fifo_read(s);
-@@ -654,7 +663,7 @@
+             len -= 5;
+@@ -695,7 +704,7 @@ static void vmsvga_fifo_run(struct vmsvg
              while (args --)
                  vmsvga_fifo_read(s);
              printf("%s: Unknown command 0x%02x in SVGA command FIFO\n",
 -                            __FUNCTION__, cmd);
 +                            __FUNCTION__, last_cmd);
              break;
-         }
- 
-@@ -1173,6 +1182,12 @@
- 
-     vga_init_vbe(&s->vga);
  
+         rewind:
+@@ -1216,6 +1225,11 @@ static void vmsvga_init(struct vmsvga_st
+     vga_common_init(&s->vga, vga_ram_size);
+     vga_init(&s->vga);
+     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
 +#ifdef EMBED_STDVGA
 +    s->vga.map_addr = VBE_DISPI_LFB_PHYSICAL_ADDRESS;
 +    s->vga.map_end = VBE_DISPI_LFB_PHYSICAL_ADDRESS + vga_ram_size;
 +    vga_dirty_log_start(s);
 +#endif
-+
-     rom_add_vga(VGABIOS_FILENAME);
  
      vmsvga_reset(s);
-Index: qemu-0.13.0/qemu-char.c
+ }
+Index: qemu-0.14.0/qemu-char.c
 ===================================================================
---- qemu-0.13.0.orig/qemu-char.c	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/qemu-char.c	2011-01-17 16:42:36.000000000 +0800
-@@ -2278,6 +2278,69 @@
-     return NULL;
+--- qemu-0.14.0.orig/qemu-char.c
++++ qemu-0.14.0/qemu-char.c
+@@ -2334,6 +2334,69 @@ size_t qemu_chr_mem_osize(const CharDriv
+     return d->outbuf_size;
  }
  
 +#define TARGET_OPENGL_OK
@@ -216,7 +218,7 @@ Index: qemu-0.13.0/qemu-char.c
  QemuOpts *qemu_chr_parse_compat(const char *label, const char *filename)
  {
      char host[65], port[33], width[8], height[8];
-@@ -2396,6 +2459,10 @@
+@@ -2452,6 +2515,10 @@ QemuOpts *qemu_chr_parse_compat(const ch
          qemu_opt_set(opts, "path", filename);
          return opts;
      }
@@ -227,7 +229,7 @@ Index: qemu-0.13.0/qemu-char.c
  
  fail:
      qemu_opts_del(opts);
-@@ -2411,6 +2478,7 @@
+@@ -2467,6 +2534,7 @@ static const struct {
      { .name = "udp",       .open = qemu_chr_open_udp },
      { .name = "msmouse",   .open = qemu_chr_open_msmouse },
      { .name = "vc",        .open = text_console_init },
@@ -235,10 +237,10 @@ Index: qemu-0.13.0/qemu-char.c
  #ifdef _WIN32
      { .name = "file",      .open = qemu_chr_open_win_file_out },
      { .name = "pipe",      .open = qemu_chr_open_win_pipe },
-Index: qemu-0.13.0/slirp/udp.c
+Index: qemu-0.14.0/slirp/udp.c
 ===================================================================
---- qemu-0.13.0.orig/slirp/udp.c	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/slirp/udp.c	2011-01-17 16:42:36.000000000 +0800
+--- qemu-0.14.0.orig/slirp/udp.c
++++ qemu-0.14.0/slirp/udp.c
 @@ -40,6 +40,7 @@
  
  #include <slirp.h>
@@ -247,7 +249,7 @@ Index: qemu-0.13.0/slirp/udp.c
  
  static uint8_t udp_tos(struct socket *so);
  
-@@ -125,6 +126,11 @@
+@@ -125,6 +126,11 @@ udp_input(register struct mbuf *m, int i
              goto bad;
          }
  
@@ -259,11 +261,11 @@ Index: qemu-0.13.0/slirp/udp.c
          if (slirp->restricted) {
              goto bad;
          }
-Index: qemu-0.13.0/sysemu.h
+Index: qemu-0.14.0/sysemu.h
 ===================================================================
---- qemu-0.13.0.orig/sysemu.h	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/sysemu.h	2011-01-17 16:42:36.000000000 +0800
-@@ -133,6 +133,7 @@
+--- qemu-0.14.0.orig/sysemu.h
++++ qemu-0.14.0/sysemu.h
+@@ -136,6 +136,7 @@ extern int semihosting_enabled;
  extern int old_param;
  extern int boot_menu;
  extern QEMUClock *rtc_clock;
@@ -271,10 +273,10 @@ Index: qemu-0.13.0/sysemu.h
  
  #define MAX_NODES 64
  extern int nb_numa_nodes;
-Index: qemu-0.13.0/target-i386/beginend_funcs.sh
+Index: qemu-0.14.0/target-i386/beginend_funcs.sh
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/beginend_funcs.sh	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/beginend_funcs.sh
 @@ -0,0 +1,23 @@
 +#! /bin/sh
 +# Copyright 2008 (C) Intel Corporation
@@ -299,10 +301,10 @@ Index: qemu-0.13.0/target-i386/beginend_funcs.sh
 +echo -e MAGIC_MACRO\(glCallList\)\\n
 +echo -e MAGIC_MACRO\(glCallLists\)\\n
 +echo -e MAGIC_MACRO\(glEdgeFlag{,v}\)\\n
-Index: qemu-0.13.0/target-i386/ghash.c
+Index: qemu-0.14.0/target-i386/ghash.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/ghash.c	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/ghash.c
 @@ -0,0 +1,347 @@
 +/* This is a modified and simplified version of original ghash.c */
 +
@@ -651,10 +653,10 @@ Index: qemu-0.13.0/target-i386/ghash.c
 +    hash_node = next;
 +  }
 +}
-Index: qemu-0.13.0/target-i386/ghash.h
+Index: qemu-0.14.0/target-i386/ghash.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/ghash.h	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/ghash.h
 @@ -0,0 +1,59 @@
 +/* This is a modified and simplified version of original ghash.h  */
 +
@@ -715,10 +717,10 @@ Index: qemu-0.13.0/target-i386/ghash.h
 +
 +#endif /* __SIMPLE_HASH_H__ */
 +
-Index: qemu-0.13.0/target-i386/gl_func_perso.h
+Index: qemu-0.14.0/target-i386/gl_func_perso.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/gl_func_perso.h	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/gl_func_perso.h
 @@ -0,0 +1,135 @@
 +/*
 + *  Hand-implemented GL/GLX API
@@ -855,11 +857,11 @@ Index: qemu-0.13.0/target-i386/gl_func_perso.h
 +MAGIC_MACRO(_glGetSelectBuffer_fake),
 +MAGIC_MACRO(_glFeedbackBuffer_fake),
 +MAGIC_MACRO(_glGetFeedbackBuffer_fake),
-Index: qemu-0.13.0/target-i386/helper.c
+Index: qemu-0.14.0/target-i386/helper.c
 ===================================================================
---- qemu-0.13.0.orig/target-i386/helper.c	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/target-i386/helper.c	2011-01-17 16:42:36.000000000 +0800
-@@ -914,7 +914,7 @@
+--- qemu-0.14.0.orig/target-i386/helper.c
++++ qemu-0.14.0/target-i386/helper.c
+@@ -962,7 +962,7 @@ target_phys_addr_t cpu_get_phys_page_deb
      }
  
      page_offset = (addr & TARGET_PAGE_MASK) & (page_size - 1);
@@ -868,21 +870,21 @@ Index: qemu-0.13.0/target-i386/helper.c
      return paddr;
  }
  
-Index: qemu-0.13.0/target-i386/helper.h
+Index: qemu-0.14.0/target-i386/helper.h
 ===================================================================
---- qemu-0.13.0.orig/target-i386/helper.h	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/target-i386/helper.h	2011-01-17 16:42:36.000000000 +0800
-@@ -217,4 +217,6 @@
+--- qemu-0.14.0.orig/target-i386/helper.h
++++ qemu-0.14.0/target-i386/helper.h
+@@ -217,4 +217,6 @@ DEF_HELPER_2(rclq, tl, tl, tl)
  DEF_HELPER_2(rcrq, tl, tl, tl)
  #endif
  
 +DEF_HELPER_0(opengl, void)
 +
  #include "def-helper.h"
-Index: qemu-0.13.0/target-i386/helper_opengl.c
+Index: qemu-0.14.0/target-i386/helper_opengl.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/helper_opengl.c	2011-01-17 16:44:27.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/helper_opengl.c
 @@ -0,0 +1,1207 @@
 +/*
 + *  Host-side implementation of GL/GLX API
@@ -1300,7 +1302,7 @@ Index: qemu-0.13.0/target-i386/helper_opengl.c
 +
 +    printf("oops\n");
 +
-+    /* if (show_stack_from_signal_handler && counter == 1) { struct ucontext* 
++    /* if (show_stack_from_signal_handler && counter == 1) { struct ucontext*
 +     * ctxt = (struct ucontext*)ptr; show_stack_from_signal_handler(10,
 +     * ctxt->uc_mcontext.gregs[REG_EBP], ctxt->uc_mcontext.gregs[REG_ESP]); } */
 +    anticrash_handler(ptr);
@@ -2091,11 +2093,11 @@ Index: qemu-0.13.0/target-i386/helper_opengl.c
 +    io_register();
 +}
 +#endif
-Index: qemu-0.13.0/target-i386/kvm.c
+Index: qemu-0.14.0/target-i386/kvm.c
 ===================================================================
---- qemu-0.13.0.orig/target-i386/kvm.c	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/target-i386/kvm.c	2011-01-17 16:42:36.000000000 +0800
-@@ -746,7 +746,7 @@
+--- qemu-0.14.0.orig/target-i386/kvm.c
++++ qemu-0.14.0/target-i386/kvm.c
+@@ -957,7 +957,7 @@ static int kvm_get_xcrs(CPUState *env)
  #endif
  }
  
@@ -2104,10 +2106,10 @@ Index: qemu-0.13.0/target-i386/kvm.c
  {
      struct kvm_sregs sregs;
      uint32_t hflags;
-Index: qemu-0.13.0/target-i386/mesa_enums.c
+Index: qemu-0.14.0/target-i386/mesa_enums.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/mesa_enums.c	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/mesa_enums.c
 @@ -0,0 +1,4890 @@
 +/* DO NOT EDIT - This file generated automatically by gl_enums.py (from Mesa) script */
 +
@@ -6999,10 +7001,10 @@ Index: qemu-0.13.0/target-i386/mesa_enums.c
 +}
 +
 +
-Index: qemu-0.13.0/target-i386/mesa_get.c
+Index: qemu-0.14.0/target-i386/mesa_get.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/mesa_get.c	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/mesa_get.c
 @@ -0,0 +1,5563 @@
 +
 +/***
@@ -12567,10 +12569,10 @@ Index: qemu-0.13.0/target-i386/mesa_get.c
 +      params[i] = (GLdouble) values[i];
 +}
 +
-Index: qemu-0.13.0/target-i386/mesa_gl.h
+Index: qemu-0.14.0/target-i386/mesa_gl.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/mesa_gl.h	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/mesa_gl.h
 @@ -0,0 +1,2251 @@
 +/*
 + * Mesa 3-D graphics library
@@ -14823,10 +14825,10 @@ Index: qemu-0.13.0/target-i386/mesa_gl.h
 +#endif
 +
 +#endif /* __gl_h_ */
-Index: qemu-0.13.0/target-i386/mesa_glext.h
+Index: qemu-0.14.0/target-i386/mesa_glext.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/mesa_glext.h	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/mesa_glext.h
 @@ -0,0 +1,7279 @@
 +#ifndef __glext_h_
 +#define __glext_h_
@@ -22107,10 +22109,10 @@ Index: qemu-0.13.0/target-i386/mesa_glext.h
 +
 +/* ERO */
 +GLAPI void GLAPIENTRY fake_gluBuild2DMipmaps (GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *data);
-Index: qemu-0.13.0/target-i386/mesa_glu.h
+Index: qemu-0.14.0/target-i386/mesa_glu.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/mesa_glu.h	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/mesa_glu.h
 @@ -0,0 +1,354 @@
 +/*
 +** License Applicability. Except to the extent portions of this file are
@@ -22466,10 +22468,10 @@ Index: qemu-0.13.0/target-i386/mesa_glu.h
 +#endif
 +
 +#endif /* __glu_h__ */
-Index: qemu-0.13.0/target-i386/mesa_glx.h
+Index: qemu-0.14.0/target-i386/mesa_glx.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/mesa_glx.h	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/mesa_glx.h
 @@ -0,0 +1,510 @@
 +/*
 + * Mesa 3-D graphics library
@@ -22981,10 +22983,10 @@ Index: qemu-0.13.0/target-i386/mesa_glx.h
 +#endif
 +
 +#endif
-Index: qemu-0.13.0/target-i386/mesa_glxext.h
+Index: qemu-0.14.0/target-i386/mesa_glxext.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/mesa_glxext.h	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/mesa_glxext.h
 @@ -0,0 +1,785 @@
 +#ifndef __glxext_h_
 +#define __glxext_h_
@@ -22995,7 +22997,7 @@ Index: qemu-0.13.0/target-i386/mesa_glxext.h
 +
 +/*
 +** Copyright (c) 2007 The Khronos Group Inc.
-+** 
++**
 +** Permission is hereby granted, free of charge, to any person obtaining a
 +** copy of this software and/or associated documentation files (the
 +** "Materials"), to deal in the Materials without restriction, including
@@ -23003,10 +23005,10 @@ Index: qemu-0.13.0/target-i386/mesa_glxext.h
 +** distribute, sublicense, and/or sell copies of the Materials, and to
 +** permit persons to whom the Materials are furnished to do so, subject to
 +** the following conditions:
-+** 
++**
 +** The above copyright notice and this permission notice shall be included
 +** in all copies or substantial portions of the Materials.
-+** 
++**
 +** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 +** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 +** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
@@ -23771,10 +23773,10 @@ Index: qemu-0.13.0/target-i386/mesa_glxext.h
 +#endif
 +
 +#endif
-Index: qemu-0.13.0/target-i386/mesa_mipmap.c
+Index: qemu-0.14.0/target-i386/mesa_mipmap.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/mesa_mipmap.c	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/mesa_mipmap.c
 @@ -0,0 +1,824 @@
 +
 +/*
@@ -24600,10 +24602,10 @@ Index: qemu-0.13.0/target-i386/mesa_mipmap.c
 +
 +   return retval;
 +}
-Index: qemu-0.13.0/target-i386/opengl_exec.c
+Index: qemu-0.14.0/target-i386/opengl_exec.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/opengl_exec.c	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/opengl_exec.c
 @@ -0,0 +1,3931 @@
 +/*
 + *  Host-side implementation of GL/GLX API
@@ -24820,7 +24822,7 @@ Index: qemu-0.13.0/target-i386/opengl_exec.c
 +
 +    XSync(dpy, 0);
 +
-+    /* 
++    /*
 +     * int loop = 1; while (loop) { while (XPending(dpy) > 0) { XEvent event;
 +     * XNextEvent(dpy, &event); switch (event.type) { case CreateNotify: { if
 +     * (((XCreateWindowEvent*)&event)->window == win) { loop = 0; } break; } }
@@ -27323,7 +27325,7 @@ Index: qemu-0.13.0/target-i386/opengl_exec.c
 +                        process->current_state->normalPointerSize);
 +            memcpy(process->current_state->normalPointer + offset,
 +                   (void *) args[4], bytes_size);
-+            // fprintf(stderr, "glNormalPointer_fake_func type=%d, stride=%d, 
++            // fprintf(stderr, "glNormalPointer_fake_func type=%d, stride=%d,
 +            // byte_size=%d\n", type, stride, bytes_size);
 +            glNormalPointer(type, stride,
 +                            process->current_state->normalPointer);
@@ -27547,7 +27549,7 @@ Index: qemu-0.13.0/target-i386/opengl_exec.c
 +                        process->current_state->texCoordPointerSize[index]);
 +            memcpy(process->current_state->texCoordPointer[index] + offset,
 +                   (void *) args[6], bytes_size);
-+            /* fprintf(stderr, "glTexCoordPointer_fake_func size=%d, type=%d, 
++            /* fprintf(stderr, "glTexCoordPointer_fake_func size=%d, type=%d,
 +             * stride=%d, byte_size=%d\n", size, type, stride, bytes_size); */
 +            do_glClientActiveTextureARB(GL_TEXTURE0_ARB + index);
 +            glTexCoordPointer(size, type, stride,
@@ -28423,36 +28425,36 @@ Index: qemu-0.13.0/target-i386/opengl_exec.c
 +            break;
 +        }
 +
-+        /* 
++        /*
 +         * case glEnableClientState_func: { if (display_function_call)
 +         * fprintf(stderr, "cap : %s\n", nameArrays[args[0] -
 +         * GL_VERTEX_ARRAY]); glEnableClientState(args[0]); break; }
-+         * 
++         *
 +         * case glDisableClientState_func: { if (display_function_call)
 +         * fprintf(stderr, "cap : %s\n", nameArrays[args[0] -
 +         * GL_VERTEX_ARRAY]); glDisableClientState(args[0]); break; }
-+         * 
++         *
 +         * case glClientActiveTexture_func: case
 +         * glClientActiveTextureARB_func: { if (display_function_call)
 +         * fprintf(stderr, "client activeTexture %d\n", args[0] -
 +         * GL_TEXTURE0_ARB); glClientActiveTextureARB(args[0]); break; }
-+         * 
++         *
 +         * case glActiveTextureARB_func: { if (display_function_call)
 +         * fprintf(stderr, "server activeTexture %d\n", args[0] -
 +         * GL_TEXTURE0_ARB); glActiveTextureARB(args[0]); break; }
-+         * 
++         *
 +         * case glLockArraysEXT_func: break;
-+         * 
++         *
 +         * case glUnlockArraysEXT_func: break;
-+         * 
++         *
 +         * case glArrayElement_func: { glArrayElement(args[0]); break; }
-+         * 
++         *
 +         * case glDrawArrays_func: { glDrawArrays(args[0],args[1],args[2]);
 +         * break; }
-+         * 
++         *
 +         * case glDrawElements_func: {
 +         * glDrawElements(args[0],args[1],args[2],(void*)args[3]); break; }
-+         * 
++         *
 +         * case glDrawRangeElements_func: {
 +         * glDrawRangeElements(args[0],args[1],args[2],args[3],args[4],(void*)args[5]);
 +         * break; } */
@@ -28536,10 +28538,10 @@ Index: qemu-0.13.0/target-i386/opengl_exec.c
 +
 +    return ret_int;
 +}
-Index: qemu-0.13.0/target-i386/opengl_func.h
+Index: qemu-0.14.0/target-i386/opengl_func.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/opengl_func.h	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/opengl_func.h
 @@ -0,0 +1,1108 @@
 +/*
 + *  Main header for both host and guest sides
@@ -29649,10 +29651,10 @@ Index: qemu-0.13.0/target-i386/opengl_func.h
 +#error Unsupported ABI
 +#endif
 +#endif
-Index: qemu-0.13.0/target-i386/opengl_player.c
+Index: qemu-0.14.0/target-i386/opengl_player.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/opengl_player.c	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/opengl_player.c
 @@ -0,0 +1,1461 @@
 +/*
 + *  Plays a sequence of OpenGL calls recorded either under qemu or with opengl_server
@@ -30109,13 +30111,13 @@ Index: qemu-0.13.0/target-i386/opengl_player.c
 +        }
 +        // fwrite(&func_number, sizeof(short), 1, fopcodes);
 +
-+        /* 
++        /*
 +         * instrWindow[instrWindowPtr] = func_number; instrWindowPtr++; if
 +         * (instrWindowPtr == INSTR_WINDOW_SIZE) instrWindowPtr = 0;
 +         * instrWindowCount++; if (instrWindowCount >= INSTR_WINDOW_SIZE) {
 +         * if ((instrWindowCount % (INSTR_WINDOW_SIZE / 2)) == 0)
 +         * find_repeated_seq(instrWindow, instrWindowBeginPtr,
-+         * INSTR_WINDOW_SIZE); instrWindowBeginPtr++; if (instrWindowBeginPtr 
++         * INSTR_WINDOW_SIZE); instrWindowBeginPtr++; if (instrWindowBeginPtr
 +         * == INSTR_WINDOW_SIZE) instrWindowBeginPtr = 0; } */
 +
 +        /* -1 is special code that indicates time synchro */
@@ -31115,10 +31117,10 @@ Index: qemu-0.13.0/target-i386/opengl_player.c
 +    }
 +    return 0;
 +}
-Index: qemu-0.13.0/target-i386/opengl_server.c
+Index: qemu-0.14.0/target-i386/opengl_server.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/opengl_server.c	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/opengl_server.c
 @@ -0,0 +1,826 @@
 +/*
 + *  TCP/IP OpenGL server
@@ -31946,10 +31948,10 @@ Index: qemu-0.13.0/target-i386/opengl_server.c
 +
 +  return 0;
 +}
-Index: qemu-0.13.0/target-i386/opengl_utils.h
+Index: qemu-0.14.0/target-i386/opengl_utils.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/opengl_utils.h	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/opengl_utils.h
 @@ -0,0 +1,453 @@
 +/*
 + *  Functions used by host & client sides
@@ -32404,10 +32406,10 @@ Index: qemu-0.13.0/target-i386/opengl_utils.h
 +}
 +
 +#endif
-Index: qemu-0.13.0/target-i386/parse_gl_h.c
+Index: qemu-0.14.0/target-i386/parse_gl_h.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/parse_gl_h.c	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/parse_gl_h.c
 @@ -0,0 +1,1496 @@
 +/*
 + *  Parse gl.h et glx.h to auto-generate source code
@@ -33905,10 +33907,10 @@ Index: qemu-0.13.0/target-i386/parse_gl_h.c
 +
 +  return 0;
 +}
-Index: qemu-0.13.0/target-i386/parse_mesa_get_c.c
+Index: qemu-0.14.0/target-i386/parse_mesa_get_c.c
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ qemu-0.13.0/target-i386/parse_mesa_get_c.c	2011-01-17 16:42:36.000000000 +0800
+--- /dev/null
++++ qemu-0.14.0/target-i386/parse_mesa_get_c.c
 @@ -0,0 +1,225 @@
 +/*
 + *  Parse the "get.c" from mesa source tree to generate "glgetv_cst.h"
@@ -34135,11 +34137,11 @@ Index: qemu-0.13.0/target-i386/parse_mesa_get_c.c
 +  fclose(outf);
 +  return 0;
 +}
-Index: qemu-0.13.0/target-i386/translate.c
+Index: qemu-0.14.0/target-i386/translate.c
 ===================================================================
---- qemu-0.13.0.orig/target-i386/translate.c	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/target-i386/translate.c	2011-01-17 16:42:36.000000000 +0800
-@@ -745,6 +745,8 @@
+--- qemu-0.14.0.orig/target-i386/translate.c
++++ qemu-0.14.0/target-i386/translate.c
+@@ -723,6 +723,8 @@ static void gen_check_io(DisasContext *s
      int state_saved;
      target_ulong next_eip;
  
@@ -34148,7 +34150,7 @@ Index: qemu-0.13.0/target-i386/translate.c
      state_saved = 0;
      if (s->pe && (s->cpl > s->iopl || s->vm86)) {
          if (s->cc_op != CC_OP_DYNAMIC)
-@@ -2672,11 +2674,18 @@
+@@ -2650,11 +2652,18 @@ static void gen_exception(DisasContext *
      s->is_jmp = DISAS_TB_JUMP;
  }
  
@@ -34167,11 +34169,11 @@ Index: qemu-0.13.0/target-i386/translate.c
      if (s->cc_op != CC_OP_DYNAMIC)
          gen_op_set_cc_op(s->cc_op);
      gen_jmp_im(cur_eip);
-Index: qemu-0.13.0/vl.c
+Index: qemu-0.14.0/vl.c
 ===================================================================
---- qemu-0.13.0.orig/vl.c	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/vl.c	2011-01-17 16:42:36.000000000 +0800
-@@ -217,12 +217,14 @@
+--- qemu-0.14.0.orig/vl.c
++++ qemu-0.14.0/vl.c
+@@ -222,12 +222,14 @@ QEMUOptionRom option_rom[MAX_OPTION_ROMS
  int nb_option_roms;
  int semihosting_enabled = 0;
  int old_param = 0;
@@ -34184,18 +34186,18 @@ Index: qemu-0.13.0/vl.c
  int boot_menu;
 +extern int enable_gl;
  
- int nb_numa_nodes;
- uint64_t node_mem[MAX_NODES];
-@@ -1433,6 +1435,8 @@
-     } else if (strstart(p, "xenfb", &opts)) {
-         vga_interface_type = VGA_XENFB;
+ typedef struct FWBootEntry FWBootEntry;
+ 
+@@ -1525,6 +1527,8 @@ static void select_vgahw (const char *p)
+     } else if (strstart(p, "qxl", &opts)) {
+         vga_interface_type = VGA_QXL;
      } else if (!strstart(p, "none", &opts)) {
 +    }
 +    else {
      invalid_vga:
          fprintf(stderr, "Unknown vga type: %s\n", p);
          exit(1);
-@@ -2535,6 +2539,9 @@
+@@ -2648,6 +2652,9 @@ int main(int argc, char **argv, char **e
              case QEMU_OPTION_old_param:
                  old_param = 1;
                  break;
@@ -34205,7 +34207,7 @@ Index: qemu-0.13.0/vl.c
              case QEMU_OPTION_clock:
                  configure_alarms(optarg);
                  break;
-@@ -2548,6 +2555,12 @@
+@@ -2661,6 +2668,12 @@ int main(int argc, char **argv, char **e
                  }
                  configure_rtc(opts);
                  break;
@@ -34218,7 +34220,7 @@ Index: qemu-0.13.0/vl.c
              case QEMU_OPTION_tb_size:
                  tb_size = strtol(optarg, NULL, 0);
                  if (tb_size < 0)
-@@ -2887,6 +2900,14 @@
+@@ -3018,6 +3031,14 @@ int main(int argc, char **argv, char **e
          if (foreach_device_config(DEV_USB, usb_parse) < 0)
              exit(1);
      }
@@ -34232,12 +34234,12 @@ Index: qemu-0.13.0/vl.c
 +#endif
  
      /* init generic devices */
-     if (qemu_opts_foreach(&qemu_device_opts, device_init_func, NULL, 1) != 0)
-Index: qemu-0.13.0/qemu-options.hx
+     if (qemu_opts_foreach(qemu_find_opts("device"), device_init_func, NULL, 1) != 0)
+Index: qemu-0.14.0/qemu-options.hx
 ===================================================================
---- qemu-0.13.0.orig/qemu-options.hx	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/qemu-options.hx	2011-01-17 16:44:27.000000000 +0800
-@@ -2024,6 +2024,18 @@
+--- qemu-0.14.0.orig/qemu-options.hx
++++ qemu-0.14.0/qemu-options.hx
+@@ -2118,6 +2118,18 @@ many timer interrupts were not processed
  re-inject them.
  ETEXI
  
@@ -34256,11 +34258,11 @@ Index: qemu-0.13.0/qemu-options.hx
  DEF("icount", HAS_ARG, QEMU_OPTION_icount, \
      "-icount [N|auto]\n" \
      "                enable virtual instruction counter with 2^N clock ticks per\n" \
-Index: qemu-0.13.0/ui/sdl.c
+Index: qemu-0.14.0/ui/sdl.c
 ===================================================================
---- qemu-0.13.0.orig/ui/sdl.c	2011-01-17 16:41:59.000000000 +0800
-+++ qemu-0.13.0/ui/sdl.c	2011-01-17 16:42:36.000000000 +0800
-@@ -59,6 +59,8 @@
+--- qemu-0.14.0.orig/ui/sdl.c
++++ qemu-0.14.0/ui/sdl.c
+@@ -63,6 +63,8 @@ static SDL_PixelFormat host_format;
  static int scaling_active = 0;
  static Notifier mouse_mode_notifier;
  
@@ -34269,7 +34271,7 @@ Index: qemu-0.13.0/ui/sdl.c
  static void sdl_update(DisplayState *ds, int x, int y, int w, int h)
  {
      //    printf("updating x=%d y=%d w=%d h=%d\n", x, y, w, h);
-@@ -121,12 +123,22 @@
+@@ -119,12 +121,22 @@ static void do_sdl_resize(int new_width,
  
  static void sdl_resize(DisplayState *ds)
  {
@@ -34293,7 +34295,7 @@ Index: qemu-0.13.0/ui/sdl.c
      } else {
          if (guest_screen != NULL) {
              SDL_FreeSurface(guest_screen);
-@@ -455,7 +467,7 @@
+@@ -457,7 +469,7 @@ static void sdl_show_cursor(void)
  
      if (!kbd_mouse_is_absolute()) {
          SDL_ShowCursor(1);
@@ -34302,7 +34304,7 @@ Index: qemu-0.13.0/ui/sdl.c
                  (gui_grab || kbd_mouse_is_absolute() || absolute_enabled))
              SDL_SetCursor(guest_sprite);
          else
-@@ -466,7 +478,8 @@
+@@ -468,7 +480,8 @@ static void sdl_show_cursor(void)
  static void sdl_grab_start(void)
  {
      if (guest_cursor) {
@@ -34312,7 +34314,7 @@ Index: qemu-0.13.0/ui/sdl.c
          if (!kbd_mouse_is_absolute() && !absolute_enabled)
              SDL_WarpMouse(guest_x, guest_y);
      } else
-@@ -768,7 +781,8 @@
+@@ -770,7 +783,8 @@ static void sdl_mouse_warp(int x, int y,
          if (!guest_cursor)
              sdl_show_cursor();
          if (gui_grab || kbd_mouse_is_absolute() || absolute_enabled) {
@@ -34322,7 +34324,7 @@ Index: qemu-0.13.0/ui/sdl.c
              if (!kbd_mouse_is_absolute() && !absolute_enabled)
                  SDL_WarpMouse(x, y);
          }
-@@ -796,7 +810,7 @@
+@@ -798,7 +812,7 @@ static void sdl_mouse_define(QEMUCursor
      qemu_free(image);
      qemu_free(mask);
  
@@ -34331,7 +34333,7 @@ Index: qemu-0.13.0/ui/sdl.c
              (gui_grab || kbd_mouse_is_absolute() || absolute_enabled))
          SDL_SetCursor(guest_sprite);
  }
-@@ -813,6 +827,7 @@
+@@ -815,6 +829,7 @@ void sdl_display_init(DisplayState *ds,
      int flags;
      uint8_t data = 0;
      DisplayAllocator *da;
@@ -34339,7 +34341,7 @@ Index: qemu-0.13.0/ui/sdl.c
      const SDL_VideoInfo *vi;
  
  #if defined(__APPLE__)
-@@ -842,6 +857,12 @@
+@@ -848,6 +863,12 @@ void sdl_display_init(DisplayState *ds,
      vi = SDL_GetVideoInfo();
      host_format = *(vi->vfmt);
  
@@ -34352,7 +34354,7 @@ Index: qemu-0.13.0/ui/sdl.c
      dcl = qemu_mallocz(sizeof(DisplayChangeListener));
      dcl->dpy_update = sdl_update;
      dcl->dpy_resize = sdl_resize;
-@@ -876,4 +897,9 @@
+@@ -882,4 +903,9 @@ void sdl_display_init(DisplayState *ds,
          gui_fullscreen_initial_grab = 1;
          sdl_grab_start();
      }
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/qemu-vmware-vga-depth.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch
similarity index 72%
rename from meta/recipes-devtools/qemu/qemu-0.13.0/qemu-vmware-vga-depth.patch
rename to meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch
index 5bdbaf3..42ec98f 100644
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/qemu-vmware-vga-depth.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch
@@ -1,11 +1,11 @@
 # fix VMware VGA driver depth calculation error, which may cause segmentation fault
 #
 # ktian1, 06/29/2010
-Index: qemu-0.13.0/console.h
+Index: qemu-0.14.0/console.h
 ===================================================================
---- qemu-0.13.0.orig/console.h	2011-01-17 16:41:58.000000000 +0800
-+++ qemu-0.13.0/console.h	2011-01-17 16:48:00.000000000 +0800
-@@ -171,6 +171,12 @@
+--- qemu-0.14.0.orig/console.h
++++ qemu-0.14.0/console.h
+@@ -171,6 +171,12 @@ struct DisplayAllocator {
      void (*free_displaysurface)(DisplaySurface *surface);
  };
  
@@ -18,7 +18,7 @@ Index: qemu-0.13.0/console.h
  struct DisplayState {
      struct DisplaySurface *surface;
      void *opaque;
-@@ -178,6 +184,7 @@
+@@ -178,6 +184,7 @@ struct DisplayState {
  
      struct DisplayAllocator* allocator;
      struct DisplayChangeListener* listeners;
@@ -26,7 +26,7 @@ Index: qemu-0.13.0/console.h
  
      void (*mouse_set)(int x, int y, int on);
      void (*cursor_define)(QEMUCursor *cursor);
-@@ -229,6 +236,12 @@
+@@ -229,6 +236,12 @@ static inline void register_displaychang
      ds->listeners = dcl;
  }
  
@@ -39,11 +39,11 @@ Index: qemu-0.13.0/console.h
  static inline void dpy_update(DisplayState *s, int x, int y, int w, int h)
  {
      struct DisplayChangeListener *dcl = s->listeners;
-Index: qemu-0.13.0/hw/vmware_vga.c
+Index: qemu-0.14.0/hw/vmware_vga.c
 ===================================================================
---- qemu-0.13.0.orig/hw/vmware_vga.c	2011-01-17 16:42:36.000000000 +0800
-+++ qemu-0.13.0/hw/vmware_vga.c	2011-01-17 16:48:00.000000000 +0800
-@@ -957,8 +957,9 @@
+--- qemu-0.14.0.orig/hw/vmware_vga.c
++++ qemu-0.14.0/hw/vmware_vga.c
+@@ -1001,8 +1001,9 @@ static void vmsvga_update_display(void *
      }
  }
  
@@ -54,7 +54,7 @@ Index: qemu-0.13.0/hw/vmware_vga.c
      s->index = 0;
      s->enable = 0;
      s->config = 0;
-@@ -1163,6 +1164,8 @@
+@@ -1207,6 +1208,8 @@ static const VMStateDescription vmstate_
  
  static void vmsvga_init(struct vmsvga_state_s *s, int vga_ram_size)
  {
@@ -63,9 +63,9 @@ Index: qemu-0.13.0/hw/vmware_vga.c
      s->scratch_size = SVGA_SCRATCH_SIZE;
      s->scratch = qemu_malloc(s->scratch_size * 4);
  
-@@ -1190,7 +1193,10 @@
- 
-     rom_add_vga(VGABIOS_FILENAME);
+@@ -1224,7 +1227,10 @@ static void vmsvga_init(struct vmsvga_st
+     vga_init(&s->vga);
+     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
  
 -    vmsvga_reset(s);
 +    dpc = qemu_mallocz(sizeof(DisplayPostCallback));
@@ -75,11 +75,11 @@ Index: qemu-0.13.0/hw/vmware_vga.c
  }
  
  static void pci_vmsvga_map_ioport(PCIDevice *pci_dev, int region_num,
-Index: qemu-0.13.0/qemu-common.h
+Index: qemu-0.14.0/qemu-common.h
 ===================================================================
---- qemu-0.13.0.orig/qemu-common.h	2011-01-17 16:41:58.000000000 +0800
-+++ qemu-0.13.0/qemu-common.h	2011-01-17 16:48:00.000000000 +0800
-@@ -205,6 +205,7 @@
+--- qemu-0.14.0.orig/qemu-common.h
++++ qemu-0.14.0/qemu-common.h
+@@ -241,6 +241,7 @@ typedef struct DisplayState DisplayState
  typedef struct DisplayChangeListener DisplayChangeListener;
  typedef struct DisplaySurface DisplaySurface;
  typedef struct DisplayAllocator DisplayAllocator;
@@ -87,22 +87,22 @@ Index: qemu-0.13.0/qemu-common.h
  typedef struct PixelFormat PixelFormat;
  typedef struct TextConsole TextConsole;
  typedef TextConsole QEMUConsole;
-Index: qemu-0.13.0/vl.c
+Index: qemu-0.14.0/vl.c
 ===================================================================
---- qemu-0.13.0.orig/vl.c	2011-01-17 16:42:36.000000000 +0800
-+++ qemu-0.13.0/vl.c	2011-01-17 16:48:00.000000000 +0800
-@@ -1814,6 +1814,7 @@
+--- qemu-0.14.0.orig/vl.c
++++ qemu-0.14.0/vl.c
+@@ -1920,6 +1920,7 @@ int main(int argc, char **argv, char **e
      char boot_devices[33] = "cad"; /* default to HD->floppy->CD-ROM */
      DisplayState *ds;
      DisplayChangeListener *dcl;
 +    DisplayPostCallback *dpc;
      int cyls, heads, secs, translation;
      QemuOpts *hda_opts = NULL, *opts;
-     int optind;
-@@ -2960,6 +2961,13 @@
-     }
-     dpy_resize(ds);
+     QemuOptsList *olist;
+@@ -3101,6 +3102,13 @@ int main(int argc, char **argv, char **e
  
+     /* display setup */
+     dpy_resize(ds);
 +    dpc = ds->postcalls;
 +    while (dpc != NULL) {
 +        if (dpc->postcall != NULL)
diff --git a/meta/recipes-devtools/qemu/qemu-0.13.0/qemugl-allow-glxcontext-release.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch
similarity index 93%
rename from meta/recipes-devtools/qemu/qemu-0.13.0/qemugl-allow-glxcontext-release.patch
rename to meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch
index 43acc36..478b204 100644
--- a/meta/recipes-devtools/qemu/qemu-0.13.0/qemugl-allow-glxcontext-release.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch
@@ -10,10 +10,10 @@ committer Andrzej Zaborowski <andrew.zaborowski@intel.com> Tue, 16 Jun 2009 22:2
  target-i386/opengl_exec.c |   31 ++++++++++++++++---------------
  1 files changed, 16 insertions(+), 15 deletions(-)
 
-Index: qemu/target-i386/opengl_exec.c
+Index: qemu-0.14.0/target-i386/opengl_exec.c
 ===================================================================
---- qemu.orig/target-i386/opengl_exec.c	2010-05-10 18:46:43.175394992 -0400
-+++ qemu/target-i386/opengl_exec.c	2010-05-10 18:46:43.218419933 -0400
+--- qemu-0.14.0.orig/target-i386/opengl_exec.c
++++ qemu-0.14.0/target-i386/opengl_exec.c
 @@ -1600,10 +1600,9 @@ int do_function_call(int func_number, ar
                  fprintf(stderr, "client_drawable=%p fake_ctx=%d\n",
                          (void *) client_drawable, fake_ctxt);
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
new file mode 100644
index 0000000..87d5927
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
@@ -0,0 +1,150 @@
+Description: spice/qxl: locking fix for qemu-kvm
+Author: Gerd Hoffmann <kraxel@redhat.com>
+Source: upstream, http://patchwork.ozlabs.org/patch/84704/
+Forwarding: not-needed
+
+Index: qemu-0.14.0/hw/qxl.c
+===================================================================
+--- qemu-0.14.0.orig/hw/qxl.c
++++ qemu-0.14.0/hw/qxl.c
+@@ -125,6 +125,27 @@ static void qxl_reset_memslots(PCIQXLDev
+ static void qxl_reset_surfaces(PCIQXLDevice *d);
+ static void qxl_ring_set_dirty(PCIQXLDevice *qxl);
+ 
++/* qemu-kvm locking ... */
++void qxl_unlock_iothread(SimpleSpiceDisplay *ssd)
++{
++    if (cpu_single_env) {
++        assert(ssd->env == NULL);
++        ssd->env = cpu_single_env;
++        cpu_single_env = NULL;
++    }
++    qemu_mutex_unlock_iothread();
++}
++
++void qxl_lock_iothread(SimpleSpiceDisplay *ssd)
++{
++    qemu_mutex_lock_iothread();
++    if (ssd->env) {
++        assert(cpu_single_env == NULL);
++        cpu_single_env = ssd->env;
++        ssd->env = NULL;
++    }
++}
++
+ static inline uint32_t msb_mask(uint32_t val)
+ {
+     uint32_t mask;
+@@ -662,10 +683,10 @@ static void qxl_hard_reset(PCIQXLDevice
+     dprint(d, 1, "%s: start%s\n", __FUNCTION__,
+            loadvm ? " (loadvm)" : "");
+ 
+-    qemu_mutex_unlock_iothread();
++    qxl_unlock_iothread(&d->ssd);
+     d->ssd.worker->reset_cursor(d->ssd.worker);
+     d->ssd.worker->reset_image_cache(d->ssd.worker);
+-    qemu_mutex_lock_iothread();
++    qxl_lock_iothread(&d->ssd);
+     qxl_reset_surfaces(d);
+     qxl_reset_memslots(d);
+ 
+@@ -795,9 +816,9 @@ static void qxl_reset_surfaces(PCIQXLDev
+ {
+     dprint(d, 1, "%s:\n", __FUNCTION__);
+     d->mode = QXL_MODE_UNDEFINED;
+-    qemu_mutex_unlock_iothread();
++    qxl_unlock_iothread(&d->ssd);
+     d->ssd.worker->destroy_surfaces(d->ssd.worker);
+-    qemu_mutex_lock_iothread();
++    qxl_lock_iothread(&d->ssd);
+     memset(&d->guest_surfaces.cmds, 0, sizeof(d->guest_surfaces.cmds));
+ }
+ 
+@@ -866,9 +887,9 @@ static void qxl_destroy_primary(PCIQXLDe
+     dprint(d, 1, "%s\n", __FUNCTION__);
+ 
+     d->mode = QXL_MODE_UNDEFINED;
+-    qemu_mutex_unlock_iothread();
++    qxl_unlock_iothread(&d->ssd);
+     d->ssd.worker->destroy_primary_surface(d->ssd.worker, 0);
+-    qemu_mutex_lock_iothread();
++    qxl_lock_iothread(&d->ssd);
+ }
+ 
+ static void qxl_set_mode(PCIQXLDevice *d, int modenr, int loadvm)
+@@ -938,10 +959,10 @@ static void ioport_write(void *opaque, u
+     case QXL_IO_UPDATE_AREA:
+     {
+         QXLRect update = d->ram->update_area;
+-        qemu_mutex_unlock_iothread();
++        qxl_unlock_iothread(&d->ssd);
+         d->ssd.worker->update_area(d->ssd.worker, d->ram->update_surface,
+                                    &update, NULL, 0, 0);
+-        qemu_mutex_lock_iothread();
++        qxl_lock_iothread(&d->ssd);
+         break;
+     }
+     case QXL_IO_NOTIFY_CMD:
+Index: qemu-0.14.0/ui/spice-display.c
+===================================================================
+--- qemu-0.14.0.orig/ui/spice-display.c
++++ qemu-0.14.0/ui/spice-display.c
+@@ -186,18 +186,18 @@ void qemu_spice_create_host_primary(Simp
+     surface.mem        = (intptr_t)ssd->buf;
+     surface.group_id   = MEMSLOT_GROUP_HOST;
+ 
+-    qemu_mutex_unlock_iothread();
++    qxl_unlock_iothread(ssd);
+     ssd->worker->create_primary_surface(ssd->worker, 0, &surface);
+-    qemu_mutex_lock_iothread();
++    qxl_lock_iothread(ssd);
+ }
+ 
+ void qemu_spice_destroy_host_primary(SimpleSpiceDisplay *ssd)
+ {
+     dprint(1, "%s:\n", __FUNCTION__);
+ 
+-    qemu_mutex_unlock_iothread();
++    qxl_unlock_iothread(ssd);
+     ssd->worker->destroy_primary_surface(ssd->worker, 0);
+-    qemu_mutex_lock_iothread();
++    qxl_lock_iothread(ssd);
+ }
+ 
+ void qemu_spice_vm_change_state_handler(void *opaque, int running, int reason)
+@@ -207,9 +207,9 @@ void qemu_spice_vm_change_state_handler(
+     if (running) {
+         ssd->worker->start(ssd->worker);
+     } else {
+-        qemu_mutex_unlock_iothread();
++        qxl_unlock_iothread(ssd);
+         ssd->worker->stop(ssd->worker);
+-        qemu_mutex_lock_iothread();
++        qxl_lock_iothread(ssd);
+     }
+     ssd->running = running;
+ }
+Index: qemu-0.14.0/ui/spice-display.h
+===================================================================
+--- qemu-0.14.0.orig/ui/spice-display.h
++++ qemu-0.14.0/ui/spice-display.h
+@@ -43,6 +43,9 @@ typedef struct SimpleSpiceDisplay {
+     QXLRect dirty;
+     int notify;
+     int running;
++
++    /* qemu-kvm locking ... */
++    void *env;
+ } SimpleSpiceDisplay;
+ 
+ typedef struct SimpleSpiceUpdate {
+@@ -52,6 +55,9 @@ typedef struct SimpleSpiceUpdate {
+     uint8_t *bitmap;
+ } SimpleSpiceUpdate;
+ 
++void qxl_unlock_iothread(SimpleSpiceDisplay *ssd);
++void qxl_lock_iothread(SimpleSpiceDisplay *ssd);
++
+ int qemu_spice_rect_is_empty(const QXLRect* r);
+ void qemu_spice_rect_union(QXLRect *dest, const QXLRect *r);
+ 
diff --git a/meta/recipes-devtools/qemu/qemu_0.13.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
similarity index 69%
rename from meta/recipes-devtools/qemu/qemu_0.13.0.bb
rename to meta/recipes-devtools/qemu/qemu_0.14.0.bb
index 71b56b7..d8535b2 100644
--- a/meta/recipes-devtools/qemu/qemu_0.13.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
@@ -3,35 +3,30 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r1"
+PR = "r0"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
 
 SRC_URI = "\
     http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
-    file://workaround_bad_futex_headers.patch \
+    file://powerpc_rom.bin \
     file://qemu-git-qemugl-host.patch \
     file://no-strip.patch \
-    file://fix-dirent.patch \
     file://fix-nogl.patch \
     file://qemugl-allow-glxcontext-release.patch \
     file://linker-flags.patch \
     file://init-info.patch \
     file://qemu-vmware-vga-depth.patch \
-    file://qemu-ppc-hack.patch \
     file://enable-i386-linux-user.patch \
-    file://vmware-vga-fifo-rewind.patch \
     file://fix-configure-checks.patch \
-    file://parallel_make.patch \
-    file://wacom-tablet-fix.patch \
-    file://port92_fix.patch \
-    file://powerpc_rom.bin \
     file://fallback-to-safe-mmap_min_addr.patch \
+    file://spice-qxl-locking-fix-for-qemu-kvm.patch \
+    file://Detect-and-use-GCC-atomic-builtins-for-locking.patch \
+    file://larger_default_ram_size.patch \
     "
-
-SRC_URI[md5sum] = "397a0d665da8ba9d3b9583629f3d6421"
-SRC_URI[sha256sum] = "1e6f5851b05cea6e377c835f4668408d4124cfb845f9948d922808743c5fd877"
+SRC_URI[md5sum] = "f9d145d5c09de9f0984ffe9bd1229970"
+SRC_URI[sha256sum] = "ba21e84d7853217830e167dae9999cdbff481189c6a0bb600ac7fb7201453108"
 
 do_install_append () {
         install -d ${D}${datadir}/qemu
-- 
1.7.4.1



