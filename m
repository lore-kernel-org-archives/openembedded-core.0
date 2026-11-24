Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14682.1795513337943633955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=U3UKd2BQ;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11086; q=dns/txt;
  s=iport01; t=1795513338; x=1796722938;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4oMk5ZQVfg5LBEgRmpvF0f5prYttOPDhWCxnPN6B/j0=;
  b=U3UKd2BQNCjoyoskOXgjMAXIYIkkJ6D+UYxKYGGL1JjKnRSY45dkDPdo
   GyUKORl+h0r6gfGKrFjWPvx5sW5hsV6NrEHpvXW1cLbmMq+UZsAneSFKf
   HN7FD+zuOQbPCmmxmu3Xyb3/ILYnQq2Eh4UbdBtPgybgv8AhIEO7N2PQD
   XS5GWHZsjJoinWPWUlkSuUYgmaqDGwZlgLeZclEQ2LYISuNOK+5gyXZso
   c9vtoGKuSUjnVLBFg2QxUHzUf0LGW1WOcYK4Y/hp7KNykA+01oaejTbfU
   8YYLU/didl2wi0D5BzZcmgVXUYDaiJzhgVSHV2fWFLtzWtPJNBYIGx1B2
   g==;
X-CSE-ConnectionGUID: QeI6DeKbT8CCgvBNTJds5w==
X-CSE-MsgGUID: 4SsQaAvKTwmcI+od+VMqkQ==
X-IPAS-Result: =?us-ascii?q?A0DKAgC4WQVr/9RK/pBaglmCV3VgQ0kDlCeCIYtpkkOBf?=
 =?us-ascii?q?g8BAQEPLhYNBAEBkykCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEEJgsBcgMBAk8HBCMhgwIBgjoDNwMRumaBeTOBAYR+2?=
 =?us-ascii?q?EwNgloBBQYUAYE4hUKDAIUkXRgBhH0nGxuBcoEVg2qBBYEaQgGIJwSCIoEMg?=
 =?us-ascii?q?VQeZAmMDAKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFg?=
 =?us-ascii?q?RyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhC?=
 =?us-ascii?q?xsYDUgRLDcVGQQ+bgeUFIIoYAsHgQ4BK4F9FxMFET2TLY9ZgiGgIHEKKIN5j?=
 =?us-ascii?q?CSNPoIAhXwaM4QEpm4LmH2CWYsxFoN0kV9ohGqBaDyBWXAVO4JnUxkPji4LC?=
 =?us-ascii?q?4NghRPJSCYyCwMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:y2bSlK9knwwHAtbaE7WaDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2AeDGzTPv6PZzameY10Ooq/pBwCupaAndY3T1dtri9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kPMKxG1utUC10e3
 tcXNhorUjKPnL+plefTpulE3qzPLeHiMZlavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOXWjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZCzaoWEII3WG625mG7En
 Xn/9k3nIS0FMde+ij2JsUyJn+z2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:PnPCDaGQ+msHThPcpLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhfo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: =?us-ascii?q?9a23=3ARTkUf2ud45RbNWZHTWjUrEXj6Iscf1yD4HrzKXP?=
 =?us-ascii?q?oIk1mVpezdX2c4/57xp8=3D?=
X-Talos-MUID: 9a23:nt3zRgt5I0Y37ky5b82n2Ap5Dc5B/YeSF0UGsNYBt4q6EDVzAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62792946"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:42:13 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id A33DC180001F6
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:42:13 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 57EA6CCA798; Tue, 24 Nov 2026 01:42:12 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] grub: fix CVE-2026-97876
Date: Tue, 24 Nov 2026 01:42:12 -0800
Message-Id: <20261124094212.1552440-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250986
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream GRUB master backport for
CVE-2026-97876. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

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
index dfc87eaa94d576b9e49fff28089bc9a9b0429c3a..d51e413436bb8173b3586ca88e9aab307ad9b7b7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -42,6 +42,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-61661.patch \
            file://CVE-2025-61662.patch \
            file://CVE-2025-61663_61664.patch \
+           file://CVE-2026-97876.patch \
 "
 
 # remove at next version upgrade or when output changes
-- 
2.35.6

