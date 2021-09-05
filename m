Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.15632.1630882716018477864
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 15:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aOstUNxA;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id g14so4194442pfm.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Sep 2021 15:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JMNr7Kz4EdSJL6asgglUGb9dOObusoNn5zbFYkDlYCk=;
        b=aOstUNxAnwCa4xPQB0BOPLJrpnvCA4MWnr6B3vZMlll9GPiAIeLaDCu8ZYsxTybuXs
         f2vHsUaG+5Y4LCc2E0m15OTCo6Io3pAcuZqbD7ccB0xvi3MVS63r+kO++IlWE5jtFn2p
         Fs9DGzqXiVgAyDLBcdgmhp13w/z2wUAHV+75gwAMRcv7glw/UITQLunrTwUCRt07pkVQ
         1WHF4wmjY2zZy/s064uSDPlvqUdk2FhmxctrpziQYhwFe5kuunmofeYv9Q3IofuleusE
         X6ONCaWAEiYihEsbeDOLZNXnFu0wTKi1llCKgvNIqMe00tkum+NHr79YA6xPx4gQoEuD
         ncBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JMNr7Kz4EdSJL6asgglUGb9dOObusoNn5zbFYkDlYCk=;
        b=AYB+EfuvDpoQZPBCg7URr/EY+sux1lb7yRirehmPkO9qD9d0CQ4/D/qxTraSzAfoxS
         r/ZPwvmwERpJPFs55YNppNSCN58ZWZfyT4u93liiVL0r35NckNtujEKNeVxp8fTfVAmK
         sHRVkI8/kfzhyeEDk76g9O7LK1qwBHOMfQJ27I7rzLBV66d9LoyF90eIeZrc0xlEqx4W
         Jx2poq6ZaNE37ozXD8vh2PqRe9JrB9Wwf0g08+2tLPgOJUqqTDRC2wnOSVFEW9ch5fua
         HDC3doSZMFhQJz0AY5UFjxFz1Ik1D7LEiIlOYateKynjY6c2BS0s8WGTa4t+WUqTxsWZ
         pqQQ==
X-Gm-Message-State: AOAM530o33x6Ip18U3LW0SybjBO9X6X8atpgAO0/Q456n7KIsp8ONuoE
	FQH8jgRPXv0H+fiFarQdhjM0lxIWxrc=
X-Google-Smtp-Source: ABdhPJyWtNT5RR+4RuttKuQeHIFUDg2xMU++S9U4dWkUC9DSwB+8IYSF15zf/we3sF0x2h9N0mnl3w==
X-Received: by 2002:a63:e74b:: with SMTP id j11mr9382182pgk.322.1630882714003;
        Sun, 05 Sep 2021 15:58:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:741f:21b:dc9f:801])
        by smtp.gmail.com with ESMTPSA id t15sm5462206pja.1.2021.09.05.15.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 15:58:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH 2/2] grub2: Several cve fixes
Date: Sun,  5 Sep 2021 15:58:30 -0700
Message-Id: <20210905225830.2265684-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210905225830.2265684-1-akuster808@gmail.com>
References: <20210905225830.2265684-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source:  Debian.org
MR: 109156, 109169, 109336, 109349, 109362, 109375, 109388
Type: Security Fix https://sources.debian.org/patches/grub2/2.04-20/
Disposition: Backport from
ChangeID: f87f309a172004f21ac28870b85477cb90438d50
Description:

Affects < 2.06

Fixes these CVE's:
CVE-2020-14372
CVE-2020-25632
CVE-2020-25647
CVE-2020-27749
CVE-2020-27779
CVE-2021-20225
CVE-2021-20233

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../grub/files/CVE-2020-14372.patch           |  79 ++++
 .../grub/files/CVE-2020-14372_p1.patch        | 432 ++++++++++++++++++
 .../grub/files/CVE-2020-14372_p2.patch        |  60 +++
 .../grub/files/CVE-2020-14372_p3.patch        |  57 +++
 .../grub/files/CVE-2020-14372_p4.patch        | 168 +++++++
 .../grub/files/CVE-2020-25632.patch           |  90 ++++
 .../grub/files/CVE-2020-25647.patch           | 117 +++++
 .../grub/files/CVE-2020-27749_1.patch         |  80 ++++
 .../grub/files/CVE-2020-27749_2.patch         | 123 +++++
 .../grub/files/CVE-2020-27749_3.patch         |  69 +++
 .../grub/files/CVE-2020-27749_4.patch         |  97 ++++
 .../grub/files/CVE-2020-27749_5.patch         | 311 +++++++++++++
 .../grub/files/CVE-2020-27749_6.patch         | 254 ++++++++++
 .../grub/files/CVE-2020-27779.patch           |  72 +++
 .../grub/files/CVE-2021-20225.patch           |  57 +++
 .../grub/files/CVE-2021-20233.patch           |  50 ++
 meta/recipes-bsp/grub/grub2.inc               |  16 +
 17 files changed, 2132 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_p1.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_p2.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_p3.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_p4.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25632.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25647.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27749_1.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27749_2.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27749_3.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27749_4.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27749_5.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27749_6.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-20225.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-20233.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372.patch
new file mode 100644
index 0000000000..cb51686ca5
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372.patch
@@ -0,0 +1,79 @@
+From b62501e6d869aa0968a17c8cb2379bde475dab20 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Mon, 28 Sep 2020 20:08:41 +0200
+Subject: acpi: Don't register the acpi command when locked down
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The command is not allowed when lockdown is enforced. Otherwise an
+attacker can instruct the GRUB to load an SSDT table to overwrite
+the kernel lockdown configuration and later load and execute
+unsigned code.
+
+Fixes: CVE-2020-14372
+
+Reported-by: Máté Kukri <km@mkukri.xyz>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/006-acpi-Don-t-register-the-acpi-command-when-locked-down.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-14372
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ docs/grub.texi            |  5 +++++
+ grub-core/commands/acpi.c | 15 ++++++++-------
+ 2 files changed, 13 insertions(+), 7 deletions(-)
+
+Index: grub-2.04/docs/grub.texi
+===================================================================
+--- grub-2.04.orig/docs/grub.texi
++++ grub-2.04/docs/grub.texi
+@@ -3986,6 +3986,11 @@ Normally, this command will replace the
+ (RSDP) in the Extended BIOS Data Area to point to the new tables. If the
+ @option{--no-ebda} option is used, the new tables will be known only to
+ GRUB, but may be used by GRUB's EFI emulation.
++
++Note: The command is not allowed when lockdown is enforced (@pxref{Lockdown}).
++      Otherwise an attacker can instruct the GRUB to load an SSDT table to
++      overwrite the kernel lockdown configuration and later load and execute
++      unsigned code.
+ @end deffn
+ 
+ 
+Index: grub-2.04/grub-core/commands/acpi.c
+===================================================================
+--- grub-2.04.orig/grub-core/commands/acpi.c
++++ grub-2.04/grub-core/commands/acpi.c
+@@ -27,6 +27,7 @@
+ #include <grub/mm.h>
+ #include <grub/memory.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ #ifdef GRUB_MACHINE_EFI
+ #include <grub/efi/efi.h>
+@@ -775,13 +776,13 @@ static grub_extcmd_t cmd;
+ 
+ GRUB_MOD_INIT(acpi)
+ {
+-  cmd = grub_register_extcmd ("acpi", grub_cmd_acpi, 0,
+-			      N_("[-1|-2] [--exclude=TABLE1,TABLE2|"
+-			      "--load-only=TABLE1,TABLE2] FILE1"
+-			      " [FILE2] [...]"),
+-			      N_("Load host ACPI tables and tables "
+-			      "specified by arguments."),
+-			      options);
++  cmd = grub_register_extcmd_lockdown ("acpi", grub_cmd_acpi, 0,
++                                       N_("[-1|-2] [--exclude=TABLE1,TABLE2|"
++                                          "--load-only=TABLE1,TABLE2] FILE1"
++                                          " [FILE2] [...]"),
++                                       N_("Load host ACPI tables and tables "
++                                          "specified by arguments."),
++                                       options);
+ }
+ 
+ GRUB_MOD_FINI(acpi)
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372_p1.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372_p1.patch
new file mode 100644
index 0000000000..47bbc594dc
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372_p1.patch
@@ -0,0 +1,432 @@
+From 4484c5c41f65b0975c0b300015764c0980765f0b Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Mon, 28 Sep 2020 20:08:02 +0200
+Subject: kern: Add lockdown support
+
+When the GRUB starts on a secure boot platform, some commands can be
+used to subvert the protections provided by the verification mechanism and
+could lead to booting untrusted system.
+
+To prevent that situation, allow GRUB to be locked down. That way the code
+may check if GRUB has been locked down and further restrict the commands
+that are registered or what subset of their functionality could be used.
+
+The lockdown support adds the following components:
+
+* The grub_lockdown() function which can be used to lockdown GRUB if,
+  e.g., UEFI Secure Boot is enabled.
+
+* The grub_is_lockdown() function which can be used to check if the GRUB
+  was locked down.
+
+* A verifier that flags OS kernels, the GRUB modules, Device Trees and ACPI
+  tables as GRUB_VERIFY_FLAGS_DEFER_AUTH to defer verification to other
+  verifiers. These files are only successfully verified if another registered
+  verifier returns success. Otherwise, the whole verification process fails.
+
+  For example, PE/COFF binaries verification can be done by the shim_lock
+  verifier which validates the signatures using the shim_lock protocol.
+  However, the verification is not deferred directly to the shim_lock verifier.
+  The shim_lock verifier is hooked into the verification process instead.
+
+* A set of grub_{command,extcmd}_lockdown functions that can be used by
+  code registering command handlers, to only register unsafe commands if
+  the GRUB has not been locked down.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/002-kern-Add-lockdown-support.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-14372 Patch #1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ conf/Makefile.common        |  2 +
+ docs/grub-dev.texi          | 27 +++++++++++++
+ docs/grub.texi              |  8 ++++
+ grub-core/Makefile.am       |  5 ++-
+ grub-core/Makefile.core.def |  1 +
+ grub-core/commands/extcmd.c | 23 +++++++++++
+ grub-core/kern/command.c    | 24 +++++++++++
+ grub-core/kern/lockdown.c   | 80 +++++++++++++++++++++++++++++++++++++
+ include/grub/command.h      |  5 +++
+ include/grub/extcmd.h       |  7 ++++
+ include/grub/lockdown.h     | 44 ++++++++++++++++++++
+ 11 files changed, 225 insertions(+), 1 deletion(-)
+ create mode 100644 grub-core/kern/lockdown.c
+ create mode 100644 include/grub/lockdown.h
+
+Index: grub-2.04/conf/Makefile.common
+===================================================================
+--- grub-2.04.orig/conf/Makefile.common
++++ grub-2.04/conf/Makefile.common
+@@ -84,7 +84,9 @@ CPPFLAGS_PARTTOOL_LIST = -Dgrub_parttool
+ CPPFLAGS_TERMINAL_LIST = '-Dgrub_term_register_input(...)=INPUT_TERMINAL_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_TERMINAL_LIST += '-Dgrub_term_register_output(...)=OUTPUT_TERMINAL_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_COMMAND_LIST = '-Dgrub_register_command(...)=COMMAND_LIST_MARKER(__VA_ARGS__)'
++CPPFLAGS_COMMAND_LIST += '-Dgrub_register_command_lockdown(...)=COMMAND_LOCKDOWN_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_COMMAND_LIST += '-Dgrub_register_extcmd(...)=EXTCOMMAND_LIST_MARKER(__VA_ARGS__)'
++CPPFLAGS_COMMAND_LIST += '-Dgrub_register_extcmd_lockdown(...)=EXTCOMMAND_LOCKDOWN_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_COMMAND_LIST += '-Dgrub_register_command_p1(...)=P1COMMAND_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_FDT_LIST := '-Dgrub_fdtbus_register(...)=FDT_DRIVER_LIST_MARKER(__VA_ARGS__)'
+ CPPFLAGS_MARKER = $(CPPFLAGS_FS_LIST) $(CPPFLAGS_VIDEO_LIST) \
+Index: grub-2.04/docs/grub-dev.texi
+===================================================================
+--- grub-2.04.orig/docs/grub-dev.texi
++++ grub-2.04/docs/grub-dev.texi
+@@ -86,6 +86,7 @@ This edition documents version @value{VE
+ * PFF2 Font File Format::
+ * Graphical Menu Software Design::
+ * Verifiers framework::
++* Lockdown framework::
+ * Copying This Manual::         Copying This Manual
+ * Index::
+ @end menu
+@@ -2086,6 +2087,32 @@ Optionally at the end of the file @samp{
+ the context. If you return no error during any of @samp{init}, @samp{write} and
+ @samp{fini} then the file is considered as having succeded verification.
+ 
++@node Lockdown framework
++@chapter Lockdown framework
++
++The GRUB can be locked down, which is a restricted mode where some operations
++are not allowed. For instance, some commands cannot be used when the GRUB is
++locked down.
++
++The function
++@code{grub_lockdown()} is used to lockdown GRUB and the function
++@code{grub_is_lockdown()} function can be used to check whether lockdown is
++enabled or not. When enabled, the function returns @samp{GRUB_LOCKDOWN_ENABLED}
++and @samp{GRUB_LOCKDOWN_DISABLED} when is not enabled.
++
++The following functions can be used to register the commands that can only be
++used when lockdown is disabled:
++
++@itemize
++
++@item @code{grub_cmd_lockdown()} registers command which should not run when the
++GRUB is in lockdown mode.
++
++@item @code{grub_cmd_lockdown()} registers extended command which should not run
++when the GRUB is in lockdown mode.
++
++@end itemize
++
+ @node Copying This Manual
+ @appendix Copying This Manual
+ 
+Index: grub-2.04/docs/grub.texi
+===================================================================
+--- grub-2.04.orig/docs/grub.texi
++++ grub-2.04/docs/grub.texi
+@@ -5581,6 +5581,7 @@ environment variables and commands are l
+ * Using digital signatures::         Booting digitally signed code
+ * UEFI secure boot and shim::        Booting digitally signed PE files
+ * Measured Boot::                    Measuring boot components
++* Lockdown::                         Lockdown when booting on a secure setup
+ @end menu
+ 
+ @node Authentication and authorisation
+@@ -5794,6 +5795,13 @@ into @file{core.img} in order to avoid a
+ 
+ Measured boot is currently only supported on EFI platforms.
+ 
++@node Lockdown
++@section Lockdown when booting on a secure setup
++
++The GRUB can be locked down when booted on a secure boot environment, for example
++if the UEFI secure boot is enabled. On a locked down configuration, the GRUB will
++be restricted and some operations/commands cannot be executed.
++
+ @node Platform limitations
+ @chapter Platform limitations
+ 
+Index: grub-2.04/grub-core/Makefile.am
+===================================================================
+--- grub-2.04.orig/grub-core/Makefile.am
++++ grub-2.04/grub-core/Makefile.am
+@@ -79,6 +79,7 @@ KERNEL_HEADER_FILES += $(top_srcdir)/inc
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/i18n.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/kernel.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/list.h
++KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/lockdown.h
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/misc.h
+ if COND_emu
+ KERNEL_HEADER_FILES += $(top_srcdir)/include/grub/compiler-rt-emu.h
+@@ -375,8 +376,10 @@ command.lst: $(MARKER_FILES)
+ 	  b=`basename $$pp .marker`; \
+ 	  sed -n \
+ 	    -e "/EXTCOMMAND_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/*\1: $$b/;p;}" \
++	    -e "/EXTCOMMAND_LOCKDOWN_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/*\1: $$b/;p;}" \
+ 	    -e "/P1COMMAND_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/*\1: $$b/;p;}" \
+-	    -e "/COMMAND_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/\1: $$b/;p;}" $$pp; \
++	    -e "/COMMAND_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/\1: $$b/;p;}" \
++	    -e "/COMMAND_LOCKDOWN_LIST_MARKER *( *\"/{s/.*( *\"\([^\"]*\)\".*/\1: $$b/;p;}" $$pp; \
+ 	done) | sort -u > $@
+ platform_DATA += command.lst
+ CLEANFILES += command.lst
+Index: grub-2.04/grub-core/Makefile.core.def
+===================================================================
+--- grub-2.04.orig/grub-core/Makefile.core.def
++++ grub-2.04/grub-core/Makefile.core.def
+@@ -203,6 +203,7 @@ kernel = {
+   efi = term/efi/console.c;
+   efi = kern/acpi.c;
+   efi = kern/efi/acpi.c;
++  efi = kern/lockdown.c;
+   i386_coreboot = kern/i386/pc/acpi.c;
+   i386_multiboot = kern/i386/pc/acpi.c;
+   i386_coreboot = kern/acpi.c;
+Index: grub-2.04/grub-core/commands/extcmd.c
+===================================================================
+--- grub-2.04.orig/grub-core/commands/extcmd.c
++++ grub-2.04/grub-core/commands/extcmd.c
+@@ -19,6 +19,7 @@
+ 
+ #include <grub/mm.h>
+ #include <grub/list.h>
++#include <grub/lockdown.h>
+ #include <grub/misc.h>
+ #include <grub/extcmd.h>
+ #include <grub/script_sh.h>
+@@ -110,6 +111,28 @@ grub_register_extcmd (const char *name,
+ 				    summary, description, parser, 1);
+ }
+ 
++static grub_err_t
++grub_extcmd_lockdown (grub_extcmd_context_t ctxt __attribute__ ((unused)),
++                      int argc __attribute__ ((unused)),
++                      char **argv __attribute__ ((unused)))
++{
++  return grub_error (GRUB_ERR_ACCESS_DENIED,
++                     N_("%s: the command is not allowed when lockdown is enforced"),
++                     ctxt->extcmd->cmd->name);
++}
++
++grub_extcmd_t
++grub_register_extcmd_lockdown (const char *name, grub_extcmd_func_t func,
++                               grub_command_flags_t flags, const char *summary,
++                               const char *description,
++                               const struct grub_arg_option *parser)
++{
++  if (grub_is_lockdown () == GRUB_LOCKDOWN_ENABLED)
++    func = grub_extcmd_lockdown;
++
++  return grub_register_extcmd (name, func, flags, summary, description, parser);
++}
++
+ void
+ grub_unregister_extcmd (grub_extcmd_t ext)
+ {
+Index: grub-2.04/grub-core/kern/command.c
+===================================================================
+--- grub-2.04.orig/grub-core/kern/command.c
++++ grub-2.04/grub-core/kern/command.c
+@@ -17,6 +17,7 @@
+  *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#include <grub/lockdown.h>
+ #include <grub/mm.h>
+ #include <grub/command.h>
+ 
+@@ -77,6 +78,29 @@ grub_register_command_prio (const char *
+   return cmd;
+ }
+ 
++static grub_err_t
++grub_cmd_lockdown (grub_command_t cmd __attribute__ ((unused)),
++                   int argc __attribute__ ((unused)),
++                   char **argv __attribute__ ((unused)))
++
++{
++  return grub_error (GRUB_ERR_ACCESS_DENIED,
++                     N_("%s: the command is not allowed when lockdown is enforced"),
++                     cmd->name);
++}
++
++grub_command_t
++grub_register_command_lockdown (const char *name,
++                                grub_command_func_t func,
++                                const char *summary,
++                                const char *description)
++{
++  if (grub_is_lockdown () == GRUB_LOCKDOWN_ENABLED)
++    func = grub_cmd_lockdown;
++
++  return grub_register_command_prio (name, func, summary, description, 0);
++}
++
+ void
+ grub_unregister_command (grub_command_t cmd)
+ {
+Index: grub-2.04/grub-core/kern/lockdown.c
+===================================================================
+--- /dev/null
++++ grub-2.04/grub-core/kern/lockdown.c
+@@ -0,0 +1,80 @@
++/*
++ *  GRUB  --  GRand Unified Bootloader
++ *  Copyright (C) 2020  Free Software Foundation, Inc.
++ *
++ *  GRUB is free software: you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation, either version 3 of the License, or
++ *  (at your option) any later version.
++ *
++ *  GRUB is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
++ *
++ */
++
++#include <grub/dl.h>
++#include <grub/file.h>
++#include <grub/lockdown.h>
++#include <grub/verify.h>
++
++static int lockdown = GRUB_LOCKDOWN_DISABLED;
++
++static grub_err_t
++lockdown_verifier_init (grub_file_t io __attribute__ ((unused)),
++                    enum grub_file_type type,
++                    void **context __attribute__ ((unused)),
++                    enum grub_verify_flags *flags)
++{
++  *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
++
++  switch (type & GRUB_FILE_TYPE_MASK)
++    {
++    case GRUB_FILE_TYPE_GRUB_MODULE:
++    case GRUB_FILE_TYPE_LINUX_KERNEL:
++    case GRUB_FILE_TYPE_MULTIBOOT_KERNEL:
++    case GRUB_FILE_TYPE_XEN_HYPERVISOR:
++    case GRUB_FILE_TYPE_BSD_KERNEL:
++    case GRUB_FILE_TYPE_XNU_KERNEL:
++    case GRUB_FILE_TYPE_PLAN9_KERNEL:
++    case GRUB_FILE_TYPE_NTLDR:
++    case GRUB_FILE_TYPE_TRUECRYPT:
++    case GRUB_FILE_TYPE_FREEDOS:
++    case GRUB_FILE_TYPE_PXECHAINLOADER:
++    case GRUB_FILE_TYPE_PCCHAINLOADER:
++    case GRUB_FILE_TYPE_COREBOOT_CHAINLOADER:
++    case GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE:
++    case GRUB_FILE_TYPE_ACPI_TABLE:
++    case GRUB_FILE_TYPE_DEVICE_TREE_IMAGE:
++      *flags = GRUB_VERIFY_FLAGS_DEFER_AUTH;
++
++      /* Fall through. */
++
++    default:
++      return GRUB_ERR_NONE;
++    }
++}
++
++struct grub_file_verifier lockdown_verifier =
++  {
++    .name = "lockdown_verifier",
++    .init = lockdown_verifier_init,
++  };
++
++void
++grub_lockdown (void)
++{
++  lockdown = GRUB_LOCKDOWN_ENABLED;
++
++  grub_verifier_register (&lockdown_verifier);
++}
++
++int
++grub_is_lockdown (void)
++{
++  return lockdown;
++}
+Index: grub-2.04/include/grub/command.h
+===================================================================
+--- grub-2.04.orig/include/grub/command.h
++++ grub-2.04/include/grub/command.h
+@@ -86,6 +86,11 @@ EXPORT_FUNC(grub_register_command_prio)
+ 					 const char *summary,
+ 					 const char *description,
+ 					 int prio);
++grub_command_t
++EXPORT_FUNC(grub_register_command_lockdown) (const char *name,
++                                             grub_command_func_t func,
++                                             const char *summary,
++                                             const char *description);
+ void EXPORT_FUNC(grub_unregister_command) (grub_command_t cmd);
+ 
+ static inline grub_command_t
+Index: grub-2.04/include/grub/extcmd.h
+===================================================================
+--- grub-2.04.orig/include/grub/extcmd.h
++++ grub-2.04/include/grub/extcmd.h
+@@ -62,6 +62,13 @@ grub_extcmd_t EXPORT_FUNC(grub_register_
+ 						 const char *description,
+ 						 const struct grub_arg_option *parser);
+ 
++grub_extcmd_t EXPORT_FUNC(grub_register_extcmd_lockdown) (const char *name,
++                                                          grub_extcmd_func_t func,
++                                                          grub_command_flags_t flags,
++                                                          const char *summary,
++                                                          const char *description,
++                                                          const struct grub_arg_option *parser);
++
+ grub_extcmd_t EXPORT_FUNC(grub_register_extcmd_prio) (const char *name,
+ 						      grub_extcmd_func_t func,
+ 						      grub_command_flags_t flags,
+Index: grub-2.04/include/grub/lockdown.h
+===================================================================
+--- /dev/null
++++ grub-2.04/include/grub/lockdown.h
+@@ -0,0 +1,44 @@
++/*
++ *  GRUB  --  GRand Unified Bootloader
++ *  Copyright (C) 2020  Free Software Foundation, Inc.
++ *
++ *  GRUB is free software: you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation, either version 3 of the License, or
++ *  (at your option) any later version.
++ *
++ *  GRUB is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
++ */
++
++#ifndef GRUB_LOCKDOWN_H
++#define GRUB_LOCKDOWN_H 1
++
++#include <grub/symbol.h>
++
++#define GRUB_LOCKDOWN_DISABLED       0
++#define GRUB_LOCKDOWN_ENABLED        1
++
++#ifdef GRUB_MACHINE_EFI
++extern void
++EXPORT_FUNC (grub_lockdown) (void);
++extern int
++EXPORT_FUNC (grub_is_lockdown) (void);
++#else
++static inline void
++grub_lockdown (void)
++{
++}
++
++static inline int
++grub_is_lockdown (void)
++{
++  return GRUB_LOCKDOWN_DISABLED;
++}
++#endif
++#endif /* ! GRUB_LOCKDOWN_H */
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372_p2.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372_p2.patch
new file mode 100644
index 0000000000..5dffbb1506
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372_p2.patch
@@ -0,0 +1,60 @@
+From fbcb8c44aa9136f9421f60d4d0bb9d055dc8c2eb Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Tue, 2 Feb 2021 19:59:48 +0100
+Subject: kern/lockdown: Set a variable if the GRUB is locked down
+
+It may be useful for scripts to determine whether the GRUB is locked
+down or not. Add the lockdown variable which is set to "y" when the GRUB
+is locked down.
+
+Suggested-by: Dimitri John Ledkov <xnox@ubuntu.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/003-kern-lockdown-Set-a-variable-if-the-GRUB-is-locked-down.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-14372 Patch #2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ docs/grub.texi            | 3 +++
+ grub-core/kern/lockdown.c | 4 ++++
+ 2 files changed, 7 insertions(+)
+
+Index: grub-2.04/docs/grub.texi
+===================================================================
+--- grub-2.04.orig/docs/grub.texi
++++ grub-2.04/docs/grub.texi
+@@ -5802,6 +5802,9 @@ The GRUB can be locked down when booted
+ if the UEFI secure boot is enabled. On a locked down configuration, the GRUB will
+ be restricted and some operations/commands cannot be executed.
+ 
++The @samp{lockdown} variable is set to @samp{y} when the GRUB is locked down.
++Otherwise it does not exit.
++
+ @node Platform limitations
+ @chapter Platform limitations
+ 
+Index: grub-2.04/grub-core/kern/lockdown.c
+===================================================================
+--- grub-2.04.orig/grub-core/kern/lockdown.c
++++ grub-2.04/grub-core/kern/lockdown.c
+@@ -18,6 +18,7 @@
+  */
+ 
+ #include <grub/dl.h>
++#include <grub/env.h>
+ #include <grub/file.h>
+ #include <grub/lockdown.h>
+ #include <grub/verify.h>
+@@ -71,6 +72,9 @@ grub_lockdown (void)
+   lockdown = GRUB_LOCKDOWN_ENABLED;
+ 
+   grub_verifier_register (&lockdown_verifier);
++
++  grub_env_set ("lockdown", "y");
++  grub_env_export ("lockdown");
+ }
+ 
+ int
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372_p3.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372_p3.patch
new file mode 100644
index 0000000000..2a8f1ed6d6
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372_p3.patch
@@ -0,0 +1,57 @@
+From 0260afe3d0b3fe07a2c55eaf3582a21a35bfd4f5 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Mon, 28 Sep 2020 20:08:29 +0200
+Subject: efi: Lockdown the GRUB when the UEFI Secure Boot is enabled
+
+If the UEFI Secure Boot is enabled then the GRUB must be locked down
+to prevent executing code that can potentially be used to subvert its
+verification mechanisms.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/004-efi-Lockdown-the-GRUB-when-the-UEFI-Secure-Boot-is-enabled.patch
+Upstream-Status: Backport
+CVE: CVE-2020-14372 Patch #3
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/kern/efi/init.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/grub-core/kern/efi/init.c b/grub-core/kern/efi/init.c
+index 2c31847bf..811692054 100644
+--- a/grub-core/kern/efi/init.c
++++ b/grub-core/kern/efi/init.c
+@@ -20,6 +20,7 @@
+ #include <grub/efi/efi.h>
+ #include <grub/efi/console.h>
+ #include <grub/efi/disk.h>
++#include <grub/lockdown.h>
+ #include <grub/term.h>
+ #include <grub/misc.h>
+ #include <grub/env.h>
+@@ -39,6 +40,23 @@ grub_efi_init (void)
+   /* Initialize the memory management system.  */
+   grub_efi_mm_init ();
+ 
++  /*
++   * Lockdown the GRUB and register the shim_lock verifier
++   * if the UEFI Secure Boot is enabled.
++   */
++  if (grub_efi_secure_boot ())
++    {
++      grub_lockdown ();
++
++      /*
++       * TODO: Move Debian to using the shim_lock verifier and
++       * enable the lockdown verifier.
++       */
++#if 0
++      grub_shim_lock_verifier_setup ();
++#endif
++    }
++
+   efi_call_4 (grub_efi_system_table->boot_services->set_watchdog_timer,
+ 	      0, 0, 0, NULL);
+ 
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14372_p4.patch b/meta/recipes-bsp/grub/files/CVE-2020-14372_p4.patch
new file mode 100644
index 0000000000..486c9f76aa
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14372_p4.patch
@@ -0,0 +1,168 @@
+From bcffa66a873f72f337eb79d4ce673b2db8b3e7b0 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Mon, 28 Sep 2020 20:08:33 +0200
+Subject: efi: Use grub_is_lockdown() instead of hardcoding a disabled modules
+ list
+
+Now the GRUB can check if it has been locked down and this can be used to
+prevent executing commands that can be utilized to circumvent the UEFI
+Secure Boot mechanisms. So, instead of hardcoding a list of modules that
+have to be disabled, prevent the usage of commands that can be dangerous.
+
+This not only allows the commands to be disabled on other platforms, but
+also properly separate the concerns. Since the shim_lock verifier logic
+should be only about preventing to run untrusted binaries and not about
+defining these kind of policies.
+
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/005-efi-Use-grub_is_lockdown-instead-of-hardcoding-a-disabled-modules-list.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-14372 Patch #4
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ docs/grub.texi                  | 17 ++++++++++-------
+ grub-core/commands/i386/wrmsr.c |  5 +++--
+ grub-core/commands/iorw.c       | 19 ++++++++++---------
+ grub-core/commands/memrw.c      | 19 ++++++++++---------
+ 4 files changed, 33 insertions(+), 27 deletions(-)
+
+Index: grub-2.04/docs/grub.texi
+===================================================================
+--- grub-2.04.orig/docs/grub.texi
++++ grub-2.04/docs/grub.texi
+@@ -5256,6 +5256,9 @@ only applies to the particular cpu/core/
+ Also, if you specify a reserved or unimplemented MSR address, it will
+ cause a general protection exception (which is not currently being handled)
+ and the system will reboot.
++
++Note: The command is not allowed when lockdown is enforced (@pxref{Lockdown}).
++      This is done to prevent subverting various security mechanisms.
+ @end deffn
+ 
+ @node xen_hypervisor
+@@ -5750,13 +5753,13 @@ secure boot chain.
+ The GRUB, except the @command{chainloader} command, works with the UEFI secure
+ boot and the shim. This functionality is provided by the shim_lock module. It
+ is recommend to build in this and other required modules into the @file{core.img}.
+-All modules not stored in the @file{core.img} and the ACPI tables for the
+-@command{acpi} command have to be signed, e.g. using PGP. Additionally, the
+-@command{iorw}, the @command{memrw} and the @command{wrmsr} commands are
+-prohibited if the UEFI secure boot is enabled. This is done due to
+-security reasons. All above mentioned requirements are enforced by the
+-shim_lock module. And itself it is a persistent module which means that
+-it cannot be unloaded if it was loaded into the memory.
++
++All GRUB modules not stored in the @file{core.img}, OS kernels, ACPI tables,
++Device Trees, etc. have to be signed, e.g, using PGP. Additionally, the commands
++that can be used to subvert the UEFI secure boot mechanism, such as @command{iorw}
++and @command{memrw} will not be available when the UEFI secure boot is enabled.
++This is done for security reasons and are enforced by the GRUB Lockdown mechanism
++(@pxref{Lockdown}).
+ 
+ @node Measured Boot
+ @section Measuring boot components
+Index: grub-2.04/grub-core/commands/i386/wrmsr.c
+===================================================================
+--- grub-2.04.orig/grub-core/commands/i386/wrmsr.c
++++ grub-2.04/grub-core/commands/i386/wrmsr.c
+@@ -24,6 +24,7 @@
+ #include <grub/env.h>
+ #include <grub/command.h>
+ #include <grub/extcmd.h>
++#include <grub/lockdown.h>
+ #include <grub/i18n.h>
+ #include <grub/i386/cpuid.h>
+ #include <grub/i386/wrmsr.h>
+@@ -83,8 +84,8 @@ grub_cmd_msr_write (grub_command_t cmd _
+ 
+ GRUB_MOD_INIT(wrmsr)
+ {
+-  cmd_write = grub_register_command ("wrmsr", grub_cmd_msr_write, N_("ADDR VALUE"),
+-				     N_("Write a value to a CPU model specific register."));
++  cmd_write = grub_register_command_lockdown ("wrmsr", grub_cmd_msr_write, N_("ADDR VALUE"),
++                                              N_("Write a value to a CPU model specific register."));
+ }
+ 
+ GRUB_MOD_FINI(wrmsr)
+Index: grub-2.04/grub-core/commands/iorw.c
+===================================================================
+--- grub-2.04.orig/grub-core/commands/iorw.c
++++ grub-2.04/grub-core/commands/iorw.c
+@@ -23,6 +23,7 @@
+ #include <grub/env.h>
+ #include <grub/cpu/io.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -131,17 +132,17 @@ GRUB_MOD_INIT(memrw)
+ 			  N_("PORT"), N_("Read 32-bit value from PORT."),
+ 			  options);
+   cmd_write_byte =
+-    grub_register_command ("outb", grub_cmd_write,
+-			   N_("PORT VALUE [MASK]"),
+-			   N_("Write 8-bit VALUE to PORT."));
++    grub_register_command_lockdown ("outb", grub_cmd_write,
++                                    N_("PORT VALUE [MASK]"),
++                                    N_("Write 8-bit VALUE to PORT."));
+   cmd_write_word =
+-    grub_register_command ("outw", grub_cmd_write,
+-			   N_("PORT VALUE [MASK]"),
+-			   N_("Write 16-bit VALUE to PORT."));
++    grub_register_command_lockdown ("outw", grub_cmd_write,
++                                    N_("PORT VALUE [MASK]"),
++                                    N_("Write 16-bit VALUE to PORT."));
+   cmd_write_dword =
+-    grub_register_command ("outl", grub_cmd_write,
+-			   N_("ADDR VALUE [MASK]"),
+-			   N_("Write 32-bit VALUE to PORT."));
++    grub_register_command_lockdown ("outl", grub_cmd_write,
++                                    N_("ADDR VALUE [MASK]"),
++                                    N_("Write 32-bit VALUE to PORT."));
+ }
+ 
+ GRUB_MOD_FINI(memrw)
+Index: grub-2.04/grub-core/commands/memrw.c
+===================================================================
+--- grub-2.04.orig/grub-core/commands/memrw.c
++++ grub-2.04/grub-core/commands/memrw.c
+@@ -22,6 +22,7 @@
+ #include <grub/extcmd.h>
+ #include <grub/env.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -133,17 +134,17 @@ GRUB_MOD_INIT(memrw)
+ 			  N_("ADDR"), N_("Read 32-bit value from ADDR."),
+ 			  options);
+   cmd_write_byte =
+-    grub_register_command ("write_byte", grub_cmd_write,
+-			   N_("ADDR VALUE [MASK]"),
+-			   N_("Write 8-bit VALUE to ADDR."));
++    grub_register_command_lockdown ("write_byte", grub_cmd_write,
++                                    N_("ADDR VALUE [MASK]"),
++                                    N_("Write 8-bit VALUE to ADDR."));
+   cmd_write_word =
+-    grub_register_command ("write_word", grub_cmd_write,
+-			   N_("ADDR VALUE [MASK]"),
+-			   N_("Write 16-bit VALUE to ADDR."));
++    grub_register_command_lockdown ("write_word", grub_cmd_write,
++                                    N_("ADDR VALUE [MASK]"),
++                                    N_("Write 16-bit VALUE to ADDR."));
+   cmd_write_dword =
+-    grub_register_command ("write_dword", grub_cmd_write,
+-			   N_("ADDR VALUE [MASK]"),
+-			   N_("Write 32-bit VALUE to ADDR."));
++    grub_register_command_lockdown ("write_dword", grub_cmd_write,
++                                    N_("ADDR VALUE [MASK]"),
++                                    N_("Write 32-bit VALUE to ADDR."));
+ }
+ 
+ GRUB_MOD_FINI(memrw)
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-25632.patch b/meta/recipes-bsp/grub/files/CVE-2020-25632.patch
new file mode 100644
index 0000000000..30a6997185
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-25632.patch
@@ -0,0 +1,90 @@
+From 1e3203e7ec93ba725eb27bd28210a42430bf6539 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Tue, 29 Sep 2020 14:08:55 +0200
+Subject: dl: Only allow unloading modules that are not dependencies
+
+When a module is attempted to be removed its reference counter is always
+decremented. This means that repeated rmmod invocations will cause the
+module to be unloaded even if another module depends on it.
+
+This may lead to a use-after-free scenario allowing an attacker to execute
+arbitrary code and by-pass the UEFI Secure Boot protection.
+
+While being there, add the extern keyword to some function declarations in
+that header file.
+
+Fixes: CVE-2020-25632
+
+Reported-by: Chris Coulson <chris.coulson@canonical.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/014-dl-Only-allow-unloading-modules-that-are-not-dependencies.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-25632
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/commands/minicmd.c | 7 +++++--
+ grub-core/kern/dl.c          | 9 +++++++++
+ include/grub/dl.h            | 8 +++++---
+ 3 files changed, 19 insertions(+), 5 deletions(-)
+
+Index: grub-2.04/grub-core/commands/minicmd.c
+===================================================================
+--- grub-2.04.orig/grub-core/commands/minicmd.c
++++ grub-2.04/grub-core/commands/minicmd.c
+@@ -140,8 +140,11 @@ grub_mini_cmd_rmmod (struct grub_command
+   if (grub_dl_is_persistent (mod))
+     return grub_error (GRUB_ERR_BAD_ARGUMENT, "cannot unload persistent module");
+ 
+-  if (grub_dl_unref (mod) <= 0)
+-    grub_dl_unload (mod);
++  if (grub_dl_ref_count (mod) > 1)
++    return grub_error (GRUB_ERR_BAD_ARGUMENT, "cannot unload referenced module");
++
++  grub_dl_unref (mod);
++  grub_dl_unload (mod);
+ 
+   return 0;
+ }
+Index: grub-2.04/grub-core/kern/dl.c
+===================================================================
+--- grub-2.04.orig/grub-core/kern/dl.c
++++ grub-2.04/grub-core/kern/dl.c
+@@ -549,6 +549,15 @@ grub_dl_unref (grub_dl_t mod)
+   return --mod->ref_count;
+ }
+ 
++int
++grub_dl_ref_count (grub_dl_t mod)
++{
++  if (mod == NULL)
++    return 0;
++
++  return mod->ref_count;
++}
++
+ static void
+ grub_dl_flush_cache (grub_dl_t mod)
+ {
+Index: grub-2.04/include/grub/dl.h
+===================================================================
+--- grub-2.04.orig/include/grub/dl.h
++++ grub-2.04/include/grub/dl.h
+@@ -203,9 +203,11 @@ grub_dl_t EXPORT_FUNC(grub_dl_load) (con
+ grub_dl_t grub_dl_load_core (void *addr, grub_size_t size);
+ grub_dl_t EXPORT_FUNC(grub_dl_load_core_noinit) (void *addr, grub_size_t size);
+ int EXPORT_FUNC(grub_dl_unload) (grub_dl_t mod);
+-void grub_dl_unload_unneeded (void);
+-int EXPORT_FUNC(grub_dl_ref) (grub_dl_t mod);
+-int EXPORT_FUNC(grub_dl_unref) (grub_dl_t mod);
++extern void grub_dl_unload_unneeded (void);
++extern int EXPORT_FUNC(grub_dl_ref) (grub_dl_t mod);
++extern int EXPORT_FUNC(grub_dl_unref) (grub_dl_t mod);
++extern int EXPORT_FUNC(grub_dl_ref_count) (grub_dl_t mod);
++
+ extern grub_dl_t EXPORT_VAR(grub_dl_head);
+ 
+ #ifndef GRUB_UTIL
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-25647.patch b/meta/recipes-bsp/grub/files/CVE-2020-25647.patch
new file mode 100644
index 0000000000..73b2abadf3
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-25647.patch
@@ -0,0 +1,117 @@
+From 98a777237f96dcf82a01d42c887015f6bc45174f Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Fri, 11 Dec 2020 19:19:21 +0100
+Subject: usb: Avoid possible out-of-bound accesses caused by malicious devices
+
+The maximum number of configurations and interfaces are fixed but there is
+no out-of-bound checking to prevent a malicious USB device to report large
+values for these and cause accesses outside the arrays' memory.
+
+Fixes: CVE-2020-25647
+
+Reported-by: Joseph Tartaro (IOActive)
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/015-usb-Avoid-possible-out-of-bound-accesses-caused-by-malicious-devices.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-25647
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ grub-core/bus/usb/usb.c | 15 ++++++++++++---
+ include/grub/usb.h      | 10 +++++++---
+ 2 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/grub-core/bus/usb/usb.c b/grub-core/bus/usb/usb.c
+index 8da5e4c74..7cb3cc230 100644
+--- a/grub-core/bus/usb/usb.c
++++ b/grub-core/bus/usb/usb.c
+@@ -75,6 +75,9 @@ grub_usb_controller_iterate (grub_usb_controller_iterate_hook_t hook,
+ grub_usb_err_t
+ grub_usb_clear_halt (grub_usb_device_t dev, int endpoint)
+ {
++  if (endpoint >= GRUB_USB_MAX_TOGGLE)
++    return GRUB_USB_ERR_BADDEVICE;
++
+   dev->toggle[endpoint] = 0;
+   return grub_usb_control_msg (dev, (GRUB_USB_REQTYPE_OUT
+ 				     | GRUB_USB_REQTYPE_STANDARD
+@@ -134,10 +137,10 @@ grub_usb_device_initialize (grub_usb_device_t dev)
+     return err;
+   descdev = &dev->descdev;
+ 
+-  for (i = 0; i < 8; i++)
++  for (i = 0; i < GRUB_USB_MAX_CONF; i++)
+     dev->config[i].descconf = NULL;
+ 
+-  if (descdev->configcnt == 0)
++  if (descdev->configcnt == 0 || descdev->configcnt > GRUB_USB_MAX_CONF)
+     {
+       err = GRUB_USB_ERR_BADDEVICE;
+       goto fail;
+@@ -172,6 +175,12 @@ grub_usb_device_initialize (grub_usb_device_t dev)
+       /* Skip the configuration descriptor.  */
+       pos = dev->config[i].descconf->length;
+ 
++      if (dev->config[i].descconf->numif > GRUB_USB_MAX_IF)
++        {
++          err = GRUB_USB_ERR_BADDEVICE;
++          goto fail;
++        }
++
+       /* Read all interfaces.  */
+       for (currif = 0; currif < dev->config[i].descconf->numif; currif++)
+ 	{
+@@ -217,7 +226,7 @@ grub_usb_device_initialize (grub_usb_device_t dev)
+ 
+  fail:
+ 
+-  for (i = 0; i < 8; i++)
++  for (i = 0; i < GRUB_USB_MAX_CONF; i++)
+     grub_free (dev->config[i].descconf);
+ 
+   return err;
+diff --git a/include/grub/usb.h b/include/grub/usb.h
+index 512ae1dd0..6475c552f 100644
+--- a/include/grub/usb.h
++++ b/include/grub/usb.h
+@@ -23,6 +23,10 @@
+ #include <grub/usbdesc.h>
+ #include <grub/usbtrans.h>
+ 
++#define GRUB_USB_MAX_CONF    8
++#define GRUB_USB_MAX_IF      32
++#define GRUB_USB_MAX_TOGGLE  256
++
+ typedef struct grub_usb_device *grub_usb_device_t;
+ typedef struct grub_usb_controller *grub_usb_controller_t;
+ typedef struct grub_usb_controller_dev *grub_usb_controller_dev_t;
+@@ -167,7 +171,7 @@ struct grub_usb_configuration
+   struct grub_usb_desc_config *descconf;
+ 
+   /* Interfaces associated to this configuration.  */
+-  struct grub_usb_interface interf[32];
++  struct grub_usb_interface interf[GRUB_USB_MAX_IF];
+ };
+ 
+ struct grub_usb_hub_port
+@@ -191,7 +195,7 @@ struct grub_usb_device
+   struct grub_usb_controller controller;
+ 
+   /* Device configurations (after opening the device).  */
+-  struct grub_usb_configuration config[8];
++  struct grub_usb_configuration config[GRUB_USB_MAX_CONF];
+ 
+   /* Device address.  */
+   int addr;
+@@ -203,7 +207,7 @@ struct grub_usb_device
+   int initialized;
+ 
+   /* Data toggle values (used for bulk transfers only).  */
+-  int toggle[256];
++  int toggle[GRUB_USB_MAX_TOGGLE];
+ 
+   /* Used by libusb wrapper.  Schedulded for removal. */
+   void *data;
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27749_1.patch b/meta/recipes-bsp/grub/files/CVE-2020-27749_1.patch
new file mode 100644
index 0000000000..2cc07186f7
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27749_1.patch
@@ -0,0 +1,80 @@
+From 8d06222bb8fb5d610dcdadb221d1846e7de88980 Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Wed, 18 Nov 2020 00:59:24 +0000
+Subject: kern/parser: Fix a memory leak
+
+The getline() function supplied to grub_parser_split_cmdline() returns
+a newly allocated buffer and can be called multiple times, but the
+returned buffer is never freed.
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/093-kern-parser-Fix-a-memory-leak.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-27749 patch#1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/kern/parser.c | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+Index: grub-2.04/grub-core/kern/parser.c
+===================================================================
+--- grub-2.04.orig/grub-core/kern/parser.c
++++ grub-2.04/grub-core/kern/parser.c
+@@ -140,6 +140,7 @@ grub_parser_split_cmdline (const char *c
+   char buffer[1024];
+   char *bp = buffer;
+   char *rd = (char *) cmdline;
++  char *rp = rd;
+   char varname[200];
+   char *vp = varname;
+   char *args;
+@@ -148,10 +149,18 @@ grub_parser_split_cmdline (const char *c
+   *argc = 0;
+   do
+     {
+-      if (!rd || !*rd)
++      if (rp == NULL || *rp == '\0')
+ 	{
++	  if (rd != cmdline)
++	    {
++	      grub_free (rd);
++	      rd = rp = NULL;
++	    }
+ 	  if (getline)
+-	    getline (&rd, 1, getline_data);
++	    {
++	      getline (&rd, 1, getline_data);
++	      rp = rd;
++	    }
+ 	  else
+ 	    break;
+ 	}
+@@ -159,12 +168,12 @@ grub_parser_split_cmdline (const char *c
+       if (!rd)
+ 	break;
+ 
+-      for (; *rd; rd++)
++      for (; *rp != '\0'; rp++)
+ 	{
+ 	  grub_parser_state_t newstate;
+ 	  char use;
+ 
+-	  newstate = grub_parser_cmdline_state (state, *rd, &use);
++	  newstate = grub_parser_cmdline_state (state, *rp, &use);
+ 
+ 	  /* If a variable was being processed and this character does
+ 	     not describe the variable anymore, write the variable to
+@@ -197,6 +206,9 @@ grub_parser_split_cmdline (const char *c
+     }
+   while (state != GRUB_PARSER_STATE_TEXT && !check_varstate (state));
+ 
++  if (rd != cmdline)
++    grub_free (rd);
++
+   /* A special case for when the last character was part of a
+      variable.  */
+   add_var (varname, &bp, &vp, state, GRUB_PARSER_STATE_TEXT);
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27749_2.patch b/meta/recipes-bsp/grub/files/CVE-2020-27749_2.patch
new file mode 100644
index 0000000000..88a780bcec
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27749_2.patch
@@ -0,0 +1,123 @@
+From 45812770ce81194ede99bba4c868b3a244fc37ee Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Tue, 5 Jan 2021 22:17:28 +0000
+Subject: kern/parser: Introduce process_char() helper
+
+grub_parser_split_cmdline() iterates over each command line character.
+In order to add error checking and to simplify the subsequent error
+handling, split the character processing in to a separate function.
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/094-kern-parser-Introduce-process_char-helper.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-27749 patch#2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/kern/parser.c | 74 +++++++++++++++++++++++++----------------
+ 1 file changed, 46 insertions(+), 28 deletions(-)
+
+Index: grub-2.04/grub-core/kern/parser.c
+===================================================================
+--- grub-2.04.orig/grub-core/kern/parser.c
++++ grub-2.04/grub-core/kern/parser.c
+@@ -1,7 +1,7 @@
+ /* parser.c - the part of the parser that can return partial tokens */
+ /*
+  *  GRUB  --  GRand Unified Bootloader
+- *  Copyright (C) 2005,2007,2009  Free Software Foundation, Inc.
++ *  Copyright (C) 2005,2007,2009,2021  Free Software Foundation, Inc.
+  *
+  *  GRUB is free software: you can redistribute it and/or modify
+  *  it under the terms of the GNU General Public License as published by
+@@ -129,6 +129,46 @@ add_var (char *varname, char **bp, char
+     *((*bp)++) = *val;
+ }
+ 
++static grub_err_t
++process_char (char c, char *buffer, char **bp, char *varname, char **vp,
++	      grub_parser_state_t state, int *argc,
++	      grub_parser_state_t *newstate)
++{
++  char use;
++
++  *newstate = grub_parser_cmdline_state (state, c, &use);
++
++  /*
++   * If a variable was being processed and this character does
++   * not describe the variable anymore, write the variable to
++   * the buffer.
++   */
++  add_var (varname, bp, vp, state, *newstate);
++
++  if (check_varstate (*newstate))
++    {
++      if (use)
++	*((*vp)++) = use;
++    }
++  else if (*newstate == GRUB_PARSER_STATE_TEXT &&
++	   state != GRUB_PARSER_STATE_ESC && grub_isspace (use))
++    {
++      /*
++       * Don't add more than one argument if multiple
++       * spaces are used.
++       */
++      if (*bp != buffer && *((*bp) - 1) != '\0')
++	{
++	  *((*bp)++) = '\0';
++	  (*argc)++;
++	}
++    }
++  else if (use)
++    *((*bp)++) = use;
++
++  return GRUB_ERR_NONE;
++}
++
+ grub_err_t
+ grub_parser_split_cmdline (const char *cmdline,
+ 			   grub_reader_getline_t getline, void *getline_data,
+@@ -171,35 +211,13 @@ grub_parser_split_cmdline (const char *c
+       for (; *rp != '\0'; rp++)
+ 	{
+ 	  grub_parser_state_t newstate;
+-	  char use;
+-
+-	  newstate = grub_parser_cmdline_state (state, *rp, &use);
+ 
+-	  /* If a variable was being processed and this character does
+-	     not describe the variable anymore, write the variable to
+-	     the buffer.  */
+-	  add_var (varname, &bp, &vp, state, newstate);
+-
+-	  if (check_varstate (newstate))
+-	    {
+-	      if (use)
+-		*(vp++) = use;
+-	    }
+-	  else
++	  if (process_char (*rp, buffer, &bp, varname, &vp, state, argc,
++			    &newstate) != GRUB_ERR_NONE)
+ 	    {
+-	      if (newstate == GRUB_PARSER_STATE_TEXT
+-		  && state != GRUB_PARSER_STATE_ESC && grub_isspace (use))
+-		{
+-		  /* Don't add more than one argument if multiple
+-		     spaces are used.  */
+-		  if (bp != buffer && *(bp - 1))
+-		    {
+-		      *(bp++) = '\0';
+-		      (*argc)++;
+-		    }
+-		}
+-	      else if (use)
+-		*(bp++) = use;
++	      if (rd != cmdline)
++		grub_free (rd);
++	      return grub_errno;
+ 	    }
+ 	  state = newstate;
+ 	}
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27749_3.patch b/meta/recipes-bsp/grub/files/CVE-2020-27749_3.patch
new file mode 100644
index 0000000000..ff211a9bd4
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27749_3.patch
@@ -0,0 +1,69 @@
+From a93ec88ea67b578c495113663a7312777de22df3 Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Thu, 7 Jan 2021 19:53:55 +0000
+Subject: kern/parser: Introduce terminate_arg() helper
+
+process_char() and grub_parser_split_cmdline() use similar code for
+terminating the most recent argument. Add a helper function for this.
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/095-kern-parser-Introduce-terminate_arg-helper.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-27749 patch#3
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/kern/parser.c | 23 +++++++++++++----------
+ 1 file changed, 13 insertions(+), 10 deletions(-)
+
+Index: grub-2.04/grub-core/kern/parser.c
+===================================================================
+--- grub-2.04.orig/grub-core/kern/parser.c
++++ grub-2.04/grub-core/kern/parser.c
+@@ -129,6 +129,16 @@ add_var (char *varname, char **bp, char
+     *((*bp)++) = *val;
+ }
+ 
++static void
++terminate_arg (char *buffer, char **bp, int *argc)
++{
++  if (*bp != buffer && *((*bp) - 1) != '\0')
++    {
++      *((*bp)++) = '\0';
++      (*argc)++;
++    }
++}
++
+ static grub_err_t
+ process_char (char c, char *buffer, char **bp, char *varname, char **vp,
+ 	      grub_parser_state_t state, int *argc,
+@@ -157,11 +167,7 @@ process_char (char c, char *buffer, char
+        * Don't add more than one argument if multiple
+        * spaces are used.
+        */
+-      if (*bp != buffer && *((*bp) - 1) != '\0')
+-	{
+-	  *((*bp)++) = '\0';
+-	  (*argc)++;
+-	}
++      terminate_arg (buffer, bp, argc);
+     }
+   else if (use)
+     *((*bp)++) = use;
+@@ -231,11 +237,8 @@ grub_parser_split_cmdline (const char *c
+      variable.  */
+   add_var (varname, &bp, &vp, state, GRUB_PARSER_STATE_TEXT);
+ 
+-  if (bp != buffer && *(bp - 1))
+-    {
+-      *(bp++) = '\0';
+-      (*argc)++;
+-    }
++  /* Ensure that the last argument is terminated. */
++  terminate_arg (buffer, &bp, argc);
+ 
+   /* Reserve memory for the return values.  */
+   args = grub_malloc (bp - buffer);
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27749_4.patch b/meta/recipes-bsp/grub/files/CVE-2020-27749_4.patch
new file mode 100644
index 0000000000..ac18909ce9
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27749_4.patch
@@ -0,0 +1,97 @@
+From d5d6b0d72ef3ae571720c443210b4222122cf9eb Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Wed, 6 Jan 2021 13:54:26 +0000
+Subject: kern/parser: Refactor grub_parser_split_cmdline() cleanup
+
+Introduce a common function epilogue used for cleaning up on all
+return paths, which will simplify additional error handling to be
+introduced in a subsequent commit.
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/096-kern-parser-Refactor-grub_parser_split_cmdline-cleanup.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-27749 patch#4
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/kern/parser.c | 35 ++++++++++++++++++++---------------
+ 1 file changed, 20 insertions(+), 15 deletions(-)
+
+Index: grub-2.04/grub-core/kern/parser.c
+===================================================================
+--- grub-2.04.orig/grub-core/kern/parser.c
++++ grub-2.04/grub-core/kern/parser.c
+@@ -220,38 +220,37 @@ grub_parser_split_cmdline (const char *c
+ 
+ 	  if (process_char (*rp, buffer, &bp, varname, &vp, state, argc,
+ 			    &newstate) != GRUB_ERR_NONE)
+-	    {
+-	      if (rd != cmdline)
+-		grub_free (rd);
+-	      return grub_errno;
+-	    }
++	    goto fail;
++
+ 	  state = newstate;
+ 	}
+     }
+   while (state != GRUB_PARSER_STATE_TEXT && !check_varstate (state));
+ 
+-  if (rd != cmdline)
+-    grub_free (rd);
+-
+   /* A special case for when the last character was part of a
+      variable.  */
+   add_var (varname, &bp, &vp, state, GRUB_PARSER_STATE_TEXT);
+ 
++  /* If there are no args, then we're done. */
++    if (!*argc)
++    {
++        grub_errno = GRUB_ERR_NONE;
++        goto out;
++    }
++
+   /* Ensure that the last argument is terminated. */
++
+   terminate_arg (buffer, &bp, argc);
+ 
+   /* Reserve memory for the return values.  */
+   args = grub_malloc (bp - buffer);
+   if (!args)
+-    return grub_errno;
++    goto fail;
+   grub_memcpy (args, buffer, bp - buffer);
+ 
+   *argv = grub_calloc (*argc + 1, sizeof (char *));
+   if (!*argv)
+-    {
+-      grub_free (args);
+-      return grub_errno;
+-    }
++    goto fail;
+ 
+   /* The arguments are separated with 0's, setup argv so it points to
+      the right values.  */
+@@ -264,7 +263,18 @@ grub_parser_split_cmdline (const char *c
+       bp++;
+     }
+ 
+-  return 0;
++  grub_errno = GRUB_ERR_NONE;
++
++ out:
++  if (rd != cmdline)
++    grub_free (rd);
++
++  return grub_errno;
++
++ fail:
++  grub_free (*argv);
++  grub_free (args);
++  goto out;
+ }
+ 
+ /* Helper for grub_parser_execute.  */
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27749_5.patch b/meta/recipes-bsp/grub/files/CVE-2020-27749_5.patch
new file mode 100644
index 0000000000..e6917c606b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27749_5.patch
@@ -0,0 +1,311 @@
+From 4f38583d8066b81dcc04eadd2d29700f58991547 Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Thu, 7 Jan 2021 15:15:43 +0000
+Subject: kern/buffer: Add variable sized heap buffer
+
+Add a new variable sized heap buffer type (grub_buffer_t) with simple
+operations for appending data, accessing the data and maintaining
+a read cursor.
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/097-kern-buffer-Add-variable-sized-heap-buffer.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-27749 patch#5
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/Makefile.core.def |   1 +
+ grub-core/kern/buffer.c     | 117 +++++++++++++++++++++++++++++
+ include/grub/buffer.h       | 144 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 262 insertions(+)
+ create mode 100644 grub-core/kern/buffer.c
+ create mode 100644 include/grub/buffer.h
+
+diff --git a/grub-core/Makefile.core.def b/grub-core/Makefile.core.def
+index e7e4d3cf5..248835aca 100644
+--- a/grub-core/Makefile.core.def
++++ b/grub-core/Makefile.core.def
+@@ -123,6 +123,7 @@ kernel = {
+   riscv32_efi_startup = kern/riscv/efi/startup.S;
+   riscv64_efi_startup = kern/riscv/efi/startup.S;
+ 
++  common = kern/buffer.c;
+   common = kern/command.c;
+   common = kern/corecmd.c;
+   common = kern/device.c;
+diff --git a/grub-core/kern/buffer.c b/grub-core/kern/buffer.c
+new file mode 100644
+index 000000000..9f5f8b867
+--- /dev/null
++++ b/grub-core/kern/buffer.c
+@@ -0,0 +1,117 @@
++/*
++ *  GRUB  --  GRand Unified Bootloader
++ *  Copyright (C) 2021  Free Software Foundation, Inc.
++ *
++ *  GRUB is free software: you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation, either version 3 of the License, or
++ *  (at your option) any later version.
++ *
++ *  GRUB is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
++ */
++
++#include <grub/buffer.h>
++#include <grub/err.h>
++#include <grub/misc.h>
++#include <grub/mm.h>
++#include <grub/safemath.h>
++#include <grub/types.h>
++
++grub_buffer_t
++grub_buffer_new (grub_size_t sz)
++{
++  struct grub_buffer *ret;
++
++  ret = (struct grub_buffer *) grub_malloc (sizeof (*ret));
++  if (ret == NULL)
++    return NULL;
++
++  ret->data = (grub_uint8_t *) grub_malloc (sz);
++  if (ret->data == NULL)
++    {
++      grub_free (ret);
++      return NULL;
++    }
++
++  ret->sz = sz;
++  ret->pos = 0;
++  ret->used = 0;
++
++  return ret;
++}
++
++void
++grub_buffer_free (grub_buffer_t buf)
++{
++  grub_free (buf->data);
++  grub_free (buf);
++}
++
++grub_err_t
++grub_buffer_ensure_space (grub_buffer_t buf, grub_size_t req)
++{
++  grub_uint8_t *d;
++  grub_size_t newsz = 1;
++
++  /* Is the current buffer size adequate? */
++  if (buf->sz >= req)
++    return GRUB_ERR_NONE;
++
++  /* Find the smallest power-of-2 size that satisfies the request. */
++  while (newsz < req)
++    {
++      if (newsz == 0)
++	return grub_error (GRUB_ERR_OUT_OF_RANGE,
++			   N_("requested buffer size is too large"));
++      newsz <<= 1;
++    }
++
++  d = (grub_uint8_t *) grub_realloc (buf->data, newsz);
++  if (d == NULL)
++    return grub_errno;
++
++  buf->data = d;
++  buf->sz = newsz;
++
++  return GRUB_ERR_NONE;
++}
++
++void *
++grub_buffer_take_data (grub_buffer_t buf)
++{
++  void *data = buf->data;
++
++  buf->data = NULL;
++  buf->sz = buf->pos = buf->used = 0;
++
++  return data;
++}
++
++void
++grub_buffer_reset (grub_buffer_t buf)
++{
++  buf->pos = buf->used = 0;
++}
++
++grub_err_t
++grub_buffer_advance_read_pos (grub_buffer_t buf, grub_size_t n)
++{
++  grub_size_t newpos;
++
++  if (grub_add (buf->pos, n, &newpos))
++    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++
++  if (newpos > buf->used)
++    return grub_error (GRUB_ERR_OUT_OF_RANGE,
++		       N_("new read is position beyond the end of the written data"));
++
++  buf->pos = newpos;
++
++  return GRUB_ERR_NONE;
++}
+diff --git a/include/grub/buffer.h b/include/grub/buffer.h
+new file mode 100644
+index 000000000..f4b10cf28
+--- /dev/null
++++ b/include/grub/buffer.h
+@@ -0,0 +1,144 @@
++/*
++ *  GRUB  --  GRand Unified Bootloader
++ *  Copyright (C) 2021  Free Software Foundation, Inc.
++ *
++ *  GRUB is free software: you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation, either version 3 of the License, or
++ *  (at your option) any later version.
++ *
++ *  GRUB is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
++ */
++
++#ifndef GRUB_BUFFER_H
++#define GRUB_BUFFER_H	1
++
++#include <grub/err.h>
++#include <grub/misc.h>
++#include <grub/mm.h>
++#include <grub/safemath.h>
++#include <grub/types.h>
++
++struct grub_buffer
++{
++  grub_uint8_t *data;
++  grub_size_t sz;
++  grub_size_t pos;
++  grub_size_t used;
++};
++
++/*
++ * grub_buffer_t represents a simple variable sized byte buffer with
++ * read and write cursors. It currently only implements
++ * functionality required by the only user in GRUB (append byte[s],
++ * peeking data at a specified position and updating the read cursor.
++ * Some things that this doesn't do yet are:
++ * - Reading a portion of the buffer by copying data from the current
++ *   read position in to a caller supplied destination buffer and then
++ *   automatically updating the read cursor.
++ * - Dropping the read part at the start of the buffer when an append
++ *   requires more space.
++ */
++typedef struct grub_buffer *grub_buffer_t;
++
++/* Allocate a new buffer with the specified initial size. */
++extern grub_buffer_t grub_buffer_new (grub_size_t sz);
++
++/* Free the buffer and its resources. */
++extern void grub_buffer_free (grub_buffer_t buf);
++
++/* Return the number of unread bytes in this buffer. */
++static inline grub_size_t
++grub_buffer_get_unread_bytes (grub_buffer_t buf)
++{
++  return buf->used - buf->pos;
++}
++
++/*
++ * Ensure that the buffer size is at least the requested
++ * number of bytes.
++ */
++extern grub_err_t grub_buffer_ensure_space (grub_buffer_t buf, grub_size_t req);
++
++/*
++ * Append the specified number of bytes from the supplied
++ * data to the buffer.
++ */
++static inline grub_err_t
++grub_buffer_append_data (grub_buffer_t buf, const void *data, grub_size_t len)
++{
++  grub_size_t req;
++
++  if (grub_add (buf->used, len, &req))
++    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++
++  if (grub_buffer_ensure_space (buf, req) != GRUB_ERR_NONE)
++    return grub_errno;
++
++  grub_memcpy (&buf->data[buf->used], data, len);
++  buf->used = req;
++
++  return GRUB_ERR_NONE;
++}
++
++/* Append the supplied character to the buffer. */
++static inline grub_err_t
++grub_buffer_append_char (grub_buffer_t buf, char c)
++{
++  return grub_buffer_append_data (buf, &c, 1);
++}
++
++/*
++ * Forget and return the underlying data buffer. The caller
++ * becomes the owner of this buffer, and must free it when it
++ * is no longer required.
++ */
++extern void *grub_buffer_take_data (grub_buffer_t buf);
++
++/* Reset this buffer. Note that this does not deallocate any resources. */
++void grub_buffer_reset (grub_buffer_t buf);
++
++/*
++ * Return a pointer to the underlying data buffer at the specified
++ * offset from the current read position. Note that this pointer may
++ * become invalid if the buffer is mutated further.
++ */
++static inline void *
++grub_buffer_peek_data_at (grub_buffer_t buf, grub_size_t off)
++{
++  if (grub_add (buf->pos, off, &off))
++    {
++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected."));
++      return NULL;
++    }
++
++  if (off >= buf->used)
++    {
++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("peek out of range"));
++      return NULL;
++    }
++
++  return &buf->data[off];
++}
++
++/*
++ * Return a pointer to the underlying data buffer at the current
++ * read position. Note that this pointer may become invalid if the
++ * buffer is mutated further.
++ */
++static inline void *
++grub_buffer_peek_data (grub_buffer_t buf)
++{
++  return grub_buffer_peek_data_at (buf, 0);
++}
++
++/* Advance the read position by the specified number of bytes. */
++extern grub_err_t grub_buffer_advance_read_pos (grub_buffer_t buf, grub_size_t n);
++
++#endif /* GRUB_BUFFER_H */
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27749_6.patch b/meta/recipes-bsp/grub/files/CVE-2020-27749_6.patch
new file mode 100644
index 0000000000..8e21c948ce
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27749_6.patch
@@ -0,0 +1,254 @@
+From e44c6dbbb5c344aaca6bf20967f3b2a2f9a25eba Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Thu, 7 Jan 2021 19:21:03 +0000
+Subject: kern/parser: Fix a stack buffer overflow
+
+grub_parser_split_cmdline() expands variable names present in the supplied
+command line in to their corresponding variable contents and uses a 1 kiB
+stack buffer for temporary storage without sufficient bounds checking. If
+the function is called with a command line that references a variable with
+a sufficiently large payload, it is possible to overflow the stack
+buffer via tab completion, corrupt the stack frame and potentially
+control execution.
+
+Fixes: CVE-2020-27749
+
+Reported-by: Chris Coulson <chris.coulson@canonical.com>
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/098-kern-parser-Fix-a-stack-buffer-overflow.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-27749 patch#6
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/kern/parser.c | 110 ++++++++++++++++++++++++----------------
+ 1 file changed, 67 insertions(+), 43 deletions(-)
+
+Index: grub-2.04/grub-core/kern/parser.c
+===================================================================
+--- grub-2.04.orig/grub-core/kern/parser.c
++++ grub-2.04/grub-core/kern/parser.c
+@@ -18,6 +18,7 @@
+  */
+ 
+ #include <grub/parser.h>
++#include <grub/buffer.h>
+ #include <grub/env.h>
+ #include <grub/misc.h>
+ #include <grub/mm.h>
+@@ -107,8 +108,8 @@ check_varstate (grub_parser_state_t s)
+ }
+ 
+ 
+-static void
+-add_var (char *varname, char **bp, char **vp,
++static grub_err_t
++add_var (grub_buffer_t varname, grub_buffer_t buf,
+ 	 grub_parser_state_t state, grub_parser_state_t newstate)
+ {
+   const char *val;
+@@ -116,31 +117,41 @@ add_var (char *varname, char **bp, char
+   /* Check if a variable was being read in and the end of the name
+      was reached.  */
+   if (!(check_varstate (state) && !check_varstate (newstate)))
+-    return;
++    return GRUB_ERR_NONE;
++
++  if (grub_buffer_append_char (varname, '\0') != GRUB_ERR_NONE)
++    return grub_errno;
+ 
+-  *((*vp)++) = '\0';
+-  val = grub_env_get (varname);
+-  *vp = varname;
++  val = grub_env_get ((const char *) grub_buffer_peek_data (varname));
++  grub_buffer_reset (varname);
+   if (!val)
+-    return;
++    return GRUB_ERR_NONE;
+ 
+   /* Insert the contents of the variable in the buffer.  */
+-  for (; *val; val++)
+-    *((*bp)++) = *val;
++  return grub_buffer_append_data (buf, val, grub_strlen (val));
+ }
+ 
+-static void
+-terminate_arg (char *buffer, char **bp, int *argc)
++static grub_err_t
++terminate_arg (grub_buffer_t buffer, int *argc)
+ {
+-  if (*bp != buffer && *((*bp) - 1) != '\0')
+-    {
+-      *((*bp)++) = '\0';
+-      (*argc)++;
+-    }
++  grub_size_t unread = grub_buffer_get_unread_bytes (buffer);
++
++  if (unread == 0)
++    return GRUB_ERR_NONE;
++
++  if (*(const char *) grub_buffer_peek_data_at (buffer, unread - 1) == '\0')
++    return GRUB_ERR_NONE;
++
++  if (grub_buffer_append_char (buffer, '\0') != GRUB_ERR_NONE)
++    return grub_errno;
++
++  (*argc)++;
++
++  return GRUB_ERR_NONE;
+ }
+ 
+ static grub_err_t
+-process_char (char c, char *buffer, char **bp, char *varname, char **vp,
++process_char (char c, grub_buffer_t buffer, grub_buffer_t varname,
+ 	      grub_parser_state_t state, int *argc,
+ 	      grub_parser_state_t *newstate)
+ {
+@@ -153,12 +164,13 @@ process_char (char c, char *buffer, char
+    * not describe the variable anymore, write the variable to
+    * the buffer.
+    */
+-  add_var (varname, bp, vp, state, *newstate);
++  if (add_var (varname, buffer, state, *newstate) != GRUB_ERR_NONE)
++    return grub_errno;
+ 
+   if (check_varstate (*newstate))
+     {
+       if (use)
+-	*((*vp)++) = use;
++        return grub_buffer_append_char (varname, use);
+     }
+   else if (*newstate == GRUB_PARSER_STATE_TEXT &&
+ 	   state != GRUB_PARSER_STATE_ESC && grub_isspace (use))
+@@ -167,10 +179,10 @@ process_char (char c, char *buffer, char
+        * Don't add more than one argument if multiple
+        * spaces are used.
+        */
+-      terminate_arg (buffer, bp, argc);
++      return terminate_arg (buffer, argc);
+     }
+   else if (use)
+-    *((*bp)++) = use;
++    return grub_buffer_append_char (buffer, use);
+ 
+   return GRUB_ERR_NONE;
+ }
+@@ -181,18 +193,21 @@ grub_parser_split_cmdline (const char *c
+ 			   int *argc, char ***argv)
+ {
+   grub_parser_state_t state = GRUB_PARSER_STATE_TEXT;
+-  /* XXX: Fixed size buffer, perhaps this buffer should be dynamically
+-     allocated.  */
+-  char buffer[1024];
+-  char *bp = buffer;
++  grub_buffer_t buffer, varname;
+   char *rd = (char *) cmdline;
+   char *rp = rd;
+-  char varname[200];
+-  char *vp = varname;
+-  char *args;
+   int i;
+ 
+   *argc = 0;
++
++  buffer = grub_buffer_new (1024);
++  if (buffer == NULL)
++    return grub_errno;
++
++  varname = grub_buffer_new (200);
++  if (varname == NULL)
++    goto fail;
++
+   do
+     {
+       if (rp == NULL || *rp == '\0')
+@@ -218,7 +233,7 @@ grub_parser_split_cmdline (const char *c
+ 	{
+ 	  grub_parser_state_t newstate;
+ 
+-	  if (process_char (*rp, buffer, &bp, varname, &vp, state, argc,
++	  if (process_char (*rp, buffer, varname, state, argc,
+ 			    &newstate) != GRUB_ERR_NONE)
+ 	    goto fail;
+ 
+@@ -229,7 +244,13 @@ grub_parser_split_cmdline (const char *c
+ 
+   /* A special case for when the last character was part of a
+      variable.  */
+-  add_var (varname, &bp, &vp, state, GRUB_PARSER_STATE_TEXT);
++   if (add_var (varname, buffer, state, GRUB_PARSER_STATE_TEXT) != GRUB_ERR_NONE)
++      goto fail;
++
++  /* Ensure that the last argument is terminated. */
++
++  if (terminate_arg (buffer, argc) != GRUB_ERR_NONE)
++     goto fail;
+ 
+   /* If there are no args, then we're done. */
+     if (!*argc)
+@@ -238,15 +259,6 @@ grub_parser_split_cmdline (const char *c
+         goto out;
+     }
+ 
+-  /* Ensure that the last argument is terminated. */
+-
+-  terminate_arg (buffer, &bp, argc);
+-
+-  /* Reserve memory for the return values.  */
+-  args = grub_malloc (bp - buffer);
+-  if (!args)
+-    goto fail;
+-  grub_memcpy (args, buffer, bp - buffer);
+ 
+   *argv = grub_calloc (*argc + 1, sizeof (char *));
+   if (!*argv)
+@@ -254,26 +266,39 @@ grub_parser_split_cmdline (const char *c
+ 
+   /* The arguments are separated with 0's, setup argv so it points to
+      the right values.  */
+-  bp = args;
+   for (i = 0; i < *argc; i++)
+     {
+-      (*argv)[i] = bp;
+-      while (*bp)
+-	bp++;
+-      bp++;
++      char *arg;
++
++      if (i > 0)
++	{
++	  if (grub_buffer_advance_read_pos (buffer, 1) != GRUB_ERR_NONE)
++	    goto fail;
++	}
++
++      arg = (char *) grub_buffer_peek_data (buffer);
++      if (arg == NULL ||
++	  grub_buffer_advance_read_pos (buffer, grub_strlen (arg)) != GRUB_ERR_NONE)
++	goto fail;
++
++      (*argv)[i] = arg;
+     }
+ 
++  /* Keep memory for the return values. */
++  grub_buffer_take_data (buffer);
++
+   grub_errno = GRUB_ERR_NONE;
+ 
+  out:
+   if (rd != cmdline)
+     grub_free (rd);
++  grub_buffer_free (buffer);
++  grub_buffer_free (varname);
+ 
+   return grub_errno;
+ 
+  fail:
+   grub_free (*argv);
+-  grub_free (args);
+   goto out;
+ }
+ 
diff --git a/meta/recipes-bsp/grub/files/CVE-2020-27779.patch b/meta/recipes-bsp/grub/files/CVE-2020-27779.patch
new file mode 100644
index 0000000000..cf489a5468
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2020-27779.patch
@@ -0,0 +1,72 @@
+From 4ad34d7d0aff5467cc2a2b3e0c55750856c19545 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Wed, 14 Oct 2020 16:33:42 +0200
+Subject: mmap: Don't register cutmem and badram commands when lockdown is
+ enforced
+
+The cutmem and badram commands can be used to remove EFI memory regions
+and potentially disable the UEFI Secure Boot. Prevent the commands to be
+registered if the GRUB is locked down.
+
+Fixes: CVE-2020-27779
+
+Reported-by: Teddy Reed <teddy.reed@gmail.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/007-mmap-Don-t-register-cutmem-and-badram-commands-when-lockdown-is-enforced.patch
+
+Upstream-Status: Backport
+CVE: CVE-2020-27779
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ docs/grub.texi        |  4 ++++
+ grub-core/mmap/mmap.c | 13 +++++++------
+ 2 files changed, 11 insertions(+), 6 deletions(-)
+
+Index: grub-2.04/docs/grub.texi
+===================================================================
+--- grub-2.04.orig/docs/grub.texi
++++ grub-2.04/docs/grub.texi
+@@ -4051,6 +4051,10 @@ this page is to be filtered.  This synta
+ that are often result of memory damage, due to physical distribution of memory
+ cells.
+ 
++Note: The command is not allowed when lockdown is enforced (@pxref{Lockdown}).
++      This prevents removing EFI memory regions to potentially subvert the
++      security mechanisms provided by the UEFI secure boot.
++
+ @node blocklist
+ @subsection blocklist
+ 
+Index: grub-2.04/grub-core/mmap/mmap.c
+===================================================================
+--- grub-2.04.orig/grub-core/mmap/mmap.c
++++ grub-2.04/grub-core/mmap/mmap.c
+@@ -20,6 +20,7 @@
+ #include <grub/memory.h>
+ #include <grub/machine/memory.h>
+ #include <grub/err.h>
++#include <grub/lockdown.h>
+ #include <grub/misc.h>
+ #include <grub/mm.h>
+ #include <grub/command.h>
+@@ -534,12 +535,12 @@ static grub_command_t cmd, cmd_cut;
+ 
+ GRUB_MOD_INIT(mmap)
+ {
+-  cmd = grub_register_command ("badram", grub_cmd_badram,
+-			       N_("ADDR1,MASK1[,ADDR2,MASK2[,...]]"),
+-			       N_("Declare memory regions as faulty (badram)."));
+-  cmd_cut = grub_register_command ("cutmem", grub_cmd_cutmem,
+-				   N_("FROM[K|M|G] TO[K|M|G]"),
+-				   N_("Remove any memory regions in specified range."));
++  cmd = grub_register_command_lockdown ("badram", grub_cmd_badram,
++                                        N_("ADDR1,MASK1[,ADDR2,MASK2[,...]]"),
++                                        N_("Declare memory regions as faulty (badram)."));
++  cmd_cut = grub_register_command_lockdown ("cutmem", grub_cmd_cutmem,
++                                            N_("FROM[K|M|G] TO[K|M|G]"),
++                                            N_("Remove any memory regions in specified range."));
+ 
+ }
+ 
diff --git a/meta/recipes-bsp/grub/files/CVE-2021-20225.patch b/meta/recipes-bsp/grub/files/CVE-2021-20225.patch
new file mode 100644
index 0000000000..e7b213868e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-20225.patch
@@ -0,0 +1,57 @@
+From e46927de3e5bac21bc91986099c6b7ae014a4016 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Fri, 22 Jan 2021 16:07:29 +1100
+Subject: lib/arg: Block repeated short options that require an argument
+
+Fuzzing found the following crash:
+
+  search -hhhhhhhhhhhhhf
+
+We didn't allocate enough option space for 13 hints because the
+allocation code counts the number of discrete arguments (i.e. argc).
+However, the shortopt parsing code will happily keep processing
+a combination of short options without checking if those short
+options require an argument. This means you can easily end writing
+past the allocated option space.
+
+This fixes a OOB write which can cause heap corruption.
+
+Fixes: CVE-2021-20225
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/061-lib-arg-Block-repeated-short-options-that-require-an-argument.patch
+
+Upstream-Status: Backport
+CVE: CVE-2021-20225
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/lib/arg.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/grub-core/lib/arg.c b/grub-core/lib/arg.c
+index 3288609a5..537c5e94b 100644
+--- a/grub-core/lib/arg.c
++++ b/grub-core/lib/arg.c
+@@ -299,6 +299,19 @@ grub_arg_parse (grub_extcmd_t cmd, int argc, char **argv,
+ 		 it can have an argument value.  */
+ 	      if (*curshort)
+ 		{
++		  /*
++		   * Only permit further short opts if this one doesn't
++		   * require a value.
++		   */
++		  if (opt->type != ARG_TYPE_NONE &&
++		      !(opt->flags & GRUB_ARG_OPTION_OPTIONAL))
++		    {
++		      grub_error (GRUB_ERR_BAD_ARGUMENT,
++				  N_("missing mandatory option for `%s'"),
++				  opt->longarg);
++		      goto fail;
++		    }
++
+ 		  if (parse_option (cmd, opt, 0, usr) || grub_errno)
+ 		    goto fail;
+ 		}
diff --git a/meta/recipes-bsp/grub/files/CVE-2021-20233.patch b/meta/recipes-bsp/grub/files/CVE-2021-20233.patch
new file mode 100644
index 0000000000..3f0abe0bde
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-20233.patch
@@ -0,0 +1,50 @@
+From e8813743f74b8ac23bf40ed9ee86b759d0475666 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Fri, 22 Jan 2021 17:10:48 +1100
+Subject: commands/menuentry: Fix quoting in setparams_prefix()
+
+Commit 9acdcbf32542 (use single quotes in menuentry setparams command)
+says that expressing a quoted single quote will require 3 characters. It
+actually requires (and always did require!) 4 characters:
+
+  str: a'b => a'\''b
+  len:  3  => 6 (2 for the letters + 4 for the quote)
+
+This leads to not allocating enough memory and thus out of bounds writes
+that have been observed to cause heap corruption.
+
+Allocate 4 bytes for each single quote.
+
+Commit 22e7dbb2bb81 (Fix quoting in legacy parser.) does the same
+quoting, but it adds 3 as extra overhead on top of the single byte that
+the quote already needs. So it's correct.
+
+Fixes: CVE-2021-20233
+Fixes: 9acdcbf32542 (use single quotes in menuentry setparams command)
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Patch-Name: 2021-02-security/063-commands-menuentry-Fix-quoting-in-setparams_prefix.patch
+
+Upstream-Status: Backport
+CVE: CVE-2021-20233
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ grub-core/commands/menuentry.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/commands/menuentry.c b/grub-core/commands/menuentry.c
+index 9164df744..720e6d8ea 100644
+--- a/grub-core/commands/menuentry.c
++++ b/grub-core/commands/menuentry.c
+@@ -230,7 +230,7 @@ setparams_prefix (int argc, char **args)
+       len += 3; /* 3 = 1 space + 2 quotes */
+       p = args[i];
+       while (*p)
+-	len += (*p++ == '\'' ? 3 : 1);
++	len += (*p++ == '\'' ? 4 : 1);
+     }
+ 
+   result = grub_malloc (len + 2);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 180e3752f8..d8c4337cf3 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -31,6 +31,22 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
            file://CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
            file://determinism.patch \
+           file://CVE-2020-25632.patch \
+           file://CVE-2020-25647.patch \
+           file://CVE-2020-14372_p1.patch \
+           file://CVE-2020-14372_p2.patch \
+           file://CVE-2020-14372_p3.patch \
+           file://CVE-2020-14372_p4.patch \
+           file://CVE-2020-14372.patch \
+           file://CVE-2020-27779.patch \
+           file://CVE-2021-20225.patch \
+           file://CVE-2021-20233.patch \
+           file://CVE-2020-27749_1.patch \
+           file://CVE-2020-27749_2.patch \
+           file://CVE-2020-27749_3.patch \
+           file://CVE-2020-27749_4.patch \
+           file://CVE-2020-27749_5.patch \
+           file://CVE-2020-27749_6.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1

