Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14679.1795513335192348798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bm5xagnv;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11284; q=dns/txt;
  s=iport01; t=1795513335; x=1796722935;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0tYZcTgf0Nh1i+267nRk4TEowfscglElrfnmVerktNM=;
  b=bm5xagnvcBtf7QksFSFADcx0AcDJ0EqUxR1r5M4CXZG/YGZtN6kqU8fR
   4C/yN/tvmIchptWfIZQfz/t8L7iL6ojH2fAQ+tniEFYl5wYd5wltcJWvO
   NHe4g/AURsh722oANSQhFvcE+PqaIBxG9mD3z7HbtkyQigu6lfKqTrTKh
   mUMn8+JLNfmvOZQRS1EMZCKF9SYS3vO8OZS4ILHIJRmDQpxdL7R7Hqvl3
   rvdk2cz7Byd5OWseAlHnGLL/siyOjj31lzfY/Mv+lc0rEB95JcvaZ4HXz
   3HPA8Oxox/hhUjLqONqyF7+AK4D4edXsRxd5vhb+mjXd7sUliAQHPUqhp
   Q==;
X-CSE-ConnectionGUID: uAbP3HKOQqCw/TJlG4/NVA==
X-CSE-MsgGUID: uSWJ279LRrCB9Z3CsuRvig==
X-IPAS-Result: =?us-ascii?q?A0DKAgBeWgVr/9JK/pBaglmCV3VgQ0kDlCeCIYtpkkOBf?=
 =?us-ascii?q?g8BAQEPLhYNBAEBkykCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEEJgsBcgMBAk8HBCMhgwIBgjoDNwMRumaBeTOBAYR+2?=
 =?us-ascii?q?EwNgloBBQYUAYE4hUKDAIUkXRgBhH0nGxuBcoEVg2qBBYEaQgGIJwSCInoSG?=
 =?us-ascii?q?4E5HmQJjAwCgU+ISUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGB?=
 =?us-ascii?q?YEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWI?=
 =?us-ascii?q?QsbGA1IESw3FRkEPm4HlBSCKGALBwF6EwErBYIPEwUREyqjBoIhoCBxCiiDe?=
 =?us-ascii?q?YwkjT6CAIV8GjOEBKZuC5h9glmLMRaDdJFfaIRqgWg8gVlwFTuCZ1MZD44uC?=
 =?us-ascii?q?wuDYIUTyUgmMgsDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:MSHBzaO9ZeMYAGTvrR3xlsFynXyQoLVcMsEvi/4bfWQNrUoihDIEx
 2ZKW2CGOPfZMTP3KI93b4+3oE1U657WzdVlSHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWIsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+hHBnltHa4/w/9cHiZy1
 /g3dHcrUDnW0opawJrjIgVtrs0uNozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2M3BPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5FIrj+iwbYWJEjCMbdhuoWTC+
 TPixX7SKEAob/eE1ACb833504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVm+zf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:itTDR6zdZLkABf3vYgAMKrPwHL1zdoMgy1knxilNoHtuA66lfq
 +V8sjzuSWYtN9zYgBCpTn/Asi9qBrnnPYfi7X5Vo3MYOCJggeVxflZjbfK8nnHBzD08PJb2O
 NLdqhzD8C1MH1B5PyKhTVR170bsb66GGfCv5a780tQ
X-Talos-CUID: 9a23:l2LP12+h5QAI3BQYXauVv1M9EPh+Ul769W77PAiEK2JGFPqzd3bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Axn4d1wyaOJSuvgr9Nr0Flfok4FKaqLmVN2JXzsQ?=
 =?us-ascii?q?igdOvH31CYByGkQ6pQ4Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62785574"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:42:13 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id C9A8C1800083F
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:42:12 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 7E616CC2EFA; Tue, 24 Nov 2026 01:42:11 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] grub: fix CVE-2026-97876
Date: Tue, 24 Nov 2026 01:42:11 -0800
Message-Id: <20261124094211.1552378-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250984
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream GRUB master backport for
CVE-2026-97876. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

Validated with bitbake grub grub-efi for qemux86-64.

[1] https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/26beaa3b2720fefdc4d04c1ae209b776fe6848d6
[2] https://www.openwall.com/lists/oss-security/2026/09/13/5

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../grub/files/CVE-2026-97876.patch           | 237 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 2 files changed, 238 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2026-97876.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2026-97876.patch b/meta/recipes-bsp/grub/files/CVE-2026-97876.patch
new file mode 100644
index 0000000000000000000000000000000000000000..bbe251aaab6f7b3c376e06c306066e1a755e3757
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2026-97876.patch
@@ -0,0 +1,237 @@
+From 6e77df4f6579eaf8ae6b494ff87cf78d6164d346 Mon Sep 17 00:00:00 2001
+From: Andrew Hamilton <adhamilt@gmail.com>
+Date: Tue, 15 Sep 2026 17:49:10 -0500
+Subject: [PATCH] term/serial: Reject caller-supplied port addresses under
+ lockdown
+
+The serial command is available in lockdown mode and the port option
+accepts a raw port address or a raw mmio base address. This can be
+misused to allow an attacker to write to local memory and do things
+including disabling / bypassing secure boot as long as the
+console is available or an unsigned GRUB configuration is under
+the attacker's control.
+
+Update the serial logic to only accept a raw address in lockdown when
+a port is already registered at it, which means the platform described
+that UART: grub_ns8250_init() for the legacy com<N> ports,
+grub_pciserial_init() for an enumerated PCI device, or an ACPI SPCR
+UART once "auto" has parsed the table. Names that are not addresses
+are untouched, so "auto", efi<N> from grub_efiserial_init() - the
+route on arm64, which has neither ns8250 nor SPCR support - and
+lookups by registered name all keep working.
+
+Behavior without lockdown (no secure boot) is unchanged.
+
+CVE: CVE-2026-97876
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/26beaa3b2720fefdc4d04c1ae209b776fe6848d6]
+
+Backport Changes:
+- The exact cherry-pick conflicts because GRUB 2.12 and 2.14 lack
+  the PL011 backend, introduced by upstream commit
+  fcff8f881bca5ce747fded03d624b9ba81a06f1c after these releases.
+  Omit grub-core/term/pl011.c, include/grub/pl011.h and the
+  PL011-only caller hunk in grub-core/term/serial.c.
+- Preserve all remaining upstream source/header changes unchanged.
+
+Assisted-by: Claude:Opus-5
+
+Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
+Suggested-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Reviewed-by: Leo Sandoval <lsandova@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/gnu-grub/grub/-/merge_requests/266>
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ grub-core/term/ns8250-spcr.c |  6 +++--
+ grub-core/term/ns8250.c      | 27 ++++++++++++++++---
+ grub-core/term/serial.c      | 50 ++++++++++++++++++++++++++++++++----
+ include/grub/serial.h        |  8 ++++--
+ 4 files changed, 78 insertions(+), 13 deletions(-)
+
+diff --git a/grub-core/term/ns8250-spcr.c b/grub-core/term/ns8250-spcr.c
+index d52b52c..ae20b07 100644
+--- a/grub-core/term/ns8250-spcr.c
++++ b/grub-core/term/ns8250-spcr.c
+@@ -78,9 +78,11 @@ grub_ns8250_spcr_init (void)
+   switch (spcr->base_addr.space_id)
+     {
++      /* The address comes from the platform's own ACPI table, so it is trusted. */
+       case GRUB_ACPI_GENADDR_MEM_SPACE:
+         return grub_serial_ns8250_add_mmio (spcr->base_addr.addr,
+-                                            spcr->base_addr.access_size, &config);
++                                            spcr->base_addr.access_size, &config,
++                                            true);
+       case GRUB_ACPI_GENADDR_IO_SPACE:
+-        return grub_serial_ns8250_add_port (spcr->base_addr.addr, &config);
++        return grub_serial_ns8250_add_port (spcr->base_addr.addr, &config, true);
+       default:
+         return NULL;
+diff --git a/grub-core/term/ns8250.c b/grub-core/term/ns8250.c
+index 23e8e09..014bb04 100644
+--- a/grub-core/term/ns8250.c
++++ b/grub-core/term/ns8250.c
+@@ -348,5 +348,6 @@ grub_ns8250_hw_get_port (const unsigned int unit)
+ 
+ struct grub_serial_port *
+-grub_serial_ns8250_add_port (grub_port_t port, struct grub_serial_config *config)
++grub_serial_ns8250_add_port (grub_port_t port, struct grub_serial_config *config,
++			     bool trusted)
+ {
+   struct grub_serial_port *p;
+@@ -364,6 +365,11 @@ grub_serial_ns8250_add_port (grub_port_t port, struct grub_serial_config *config
+       }
+ 
++  /*
++   * use_mmio and port share a union with the private data of every other back
++   * end, so they only mean anything on a port this driver registered.
++   */
+   FOR_SERIAL_PORTS (p)
+-    if (p->use_mmio == false && p->port == port)
++    if (p->driver == &grub_ns8250_driver
++	&& p->use_mmio == false && p->port == port)
+       {
+         if (config != NULL)
+@@ -372,4 +378,8 @@ grub_serial_ns8250_add_port (grub_port_t port, struct grub_serial_config *config
+       }
+ 
++  /* No port is registered here, so going on means probing the address. */
++  if (grub_serial_reject_untrusted_address (trusted) == true)
++    return NULL;
++
+   grub_outb (0x5a, port + UART_SR);
+   if (grub_inb (port + UART_SR) != 0x5a)
+@@ -403,5 +413,5 @@ grub_serial_ns8250_add_port (grub_port_t port, struct grub_serial_config *config
+ struct grub_serial_port *
+ grub_serial_ns8250_add_mmio (grub_addr_t addr, unsigned int acc_size,
+-                             struct grub_serial_config *config)
++                             struct grub_serial_config *config, bool trusted)
+ {
+   struct grub_serial_port *p;
+@@ -416,6 +426,11 @@ grub_serial_ns8250_add_mmio (grub_addr_t addr, unsigned int acc_size,
+       }
+ 
++  /*
++   * use_mmio and mmio share a union with the private data of every other back
++   * end, so they only mean anything on a port this driver registered.
++   */
+   FOR_SERIAL_PORTS (p)
+-    if (p->use_mmio == true && p->mmio.base == addr)
++    if (p->driver == &grub_ns8250_driver
++	&& p->use_mmio == true && p->mmio.base == addr)
+       {
+         if (config != NULL)
+@@ -424,4 +439,8 @@ grub_serial_ns8250_add_mmio (grub_addr_t addr, unsigned int acc_size,
+       }
+ 
++  /* No port is registered here, so going on means programming the address. */
++  if (grub_serial_reject_untrusted_address (trusted) == true)
++    return NULL;
++
+   p = grub_malloc (sizeof (*p));
+   if (p == NULL)
+diff --git a/grub-core/term/serial.c b/grub-core/term/serial.c
+index 8260dcb..57039dd 100644
+--- a/grub-core/term/serial.c
++++ b/grub-core/term/serial.c
+@@ -29,4 +29,5 @@
+ #include <grub/i18n.h>
+ #include <grub/list.h>
++#include <grub/lockdown.h>
+ #ifdef GRUB_MACHINE_MIPS_LOONGSON
+ #include <grub/machine/kernel.h>
+@@ -141,4 +142,28 @@ static struct grub_term_output grub_serial_term_output =
+ 
+ 
++/*
++ * An address that no port is registered at cannot be honored while lockdown
++ * is enforced: the probe and programming sequences in the ns8250 and pl011
++ * back ends write to fixed offsets from it with no way to tell a UART from
++ * ordinary memory, so an address taken from an unauthenticated configuration
++ * is a write primitive against whatever it points at.
++ *
++ * A back end calls this once its own lookup has found no port already
++ * registered at the address, that is, at the point where it would otherwise
++ * touch the hardware. TRUSTED is true when the address came from a platform
++ * description -- grub_ns8250_init(), an ACPI SPCR table, PCI enumeration --
++ * rather than from the caller.
++ */
++bool
++grub_serial_reject_untrusted_address (bool trusted)
++{
++  if (trusted == true || grub_is_lockdown () != GRUB_LOCKDOWN_ENABLED)
++    return false;
++
++  grub_error (GRUB_ERR_ACCESS_DENIED,
++	      N_("serial port address is not permitted when lockdown is enforced"));
++  return true;
++}
++
+ struct grub_serial_port *
+ grub_serial_find (const char *name)
+@@ -155,4 +180,10 @@ grub_serial_find (const char *name)
+       return port;
+ 
++  /*
++   * Everything below this point builds a port from an address the caller
++   * gave us, so the back ends are told the address is untrusted: under
++   * lockdown they hand back a port only if one is already registered at that
++   * address, which means the platform described that UART.
++   */
+ #if (defined(__mips__) || defined (__i386__) || defined (__x86_64__)) && !defined(GRUB_MACHINE_EMU) && !defined(GRUB_MACHINE_ARC)
+   if (grub_strncmp (name, "port", sizeof ("port") - 1) == 0
+@@ -160,5 +191,5 @@ grub_serial_find (const char *name)
+     {
+       port = grub_serial_ns8250_add_port (grub_strtoul (&name[sizeof ("port") - 1],
+-							0, 16), NULL);
++							0, 16), NULL, false);
+       if (port != NULL)
+         return port;
+@@ -206,5 +237,5 @@ grub_serial_find (const char *name)
+           }
+ 
+-      port = grub_serial_ns8250_add_mmio (addr, acc_size, NULL);
++      port = grub_serial_ns8250_add_mmio (addr, acc_size, NULL, false);
+       if (port != NULL)
+         return port;
+@@ -276,7 +307,16 @@ grub_cmd_serial (grub_extcmd_context_t ctxt, int argc, char **args)
+   port = grub_serial_find (name);
+   if (!port)
+-    return grub_error (GRUB_ERR_BAD_ARGUMENT,
+-		       N_("serial port `%s' isn't found"),
+-		       name);
++    {
++      /*
++       * A back end that refused the port has already said why; keep that
++       * rather than reporting a misleading "isn't found".
++       */
++      if (grub_errno == GRUB_ERR_ACCESS_DENIED)
++	return grub_errno;
++
++      return grub_error (GRUB_ERR_BAD_ARGUMENT,
++			 N_("serial port `%s' isn't found"),
++			 name);
++    }
+ 
+   config = port->config;
+diff --git a/include/grub/serial.h b/include/grub/serial.h
+index d7e0635..096209a 100644
+--- a/include/grub/serial.h
++++ b/include/grub/serial.h
+@@ -189,12 +189,16 @@ grub_serial_config_defaults (struct grub_serial_port *port)
+ }
+ 
++bool grub_serial_reject_untrusted_address (bool trusted);
++
+ #if defined(__mips__) || defined (__i386__) || defined (__x86_64__)
+ void grub_ns8250_init (void);
+ struct grub_serial_port *grub_ns8250_spcr_init (void);
+ struct grub_serial_port *grub_serial_ns8250_add_port (grub_port_t port,
+-						      struct grub_serial_config *config);
++						      struct grub_serial_config *config,
++						      bool trusted);
+ struct grub_serial_port *grub_serial_ns8250_add_mmio (grub_addr_t addr,
+ 						      unsigned int acc_size,
+-						      struct grub_serial_config *config);
++						      struct grub_serial_config *config,
++						      bool trusted);
+ #endif
+ #ifdef GRUB_MACHINE_IEEE1275
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 466c772e5bfe1f6c5c75220b2c6f85533297f385..3297f4ab66f1b5d523cd67e4ca2b2b4afcfc6782 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://0001-Revert-configure-Check-linker-for-image-base-support.patch \
            file://0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch \
+           file://CVE-2026-97876.patch \
 "
 
 SRC_URI[sha256sum] = "d0415fbb3e739237064e173743a6e5f60c33a81ec02a069cc9152d80efff4967"
-- 
2.35.6

