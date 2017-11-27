Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 238E1606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 01:41:34 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f6so7518094pln.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 17:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sJXSbSg7eebmfET4GmozGLffGF5jlOnlhERf40JfZyQ=;
	b=onrOtCkVHBUqGYNyX4bKBo2+R0jgKRsO3xmSsMC15aWOyS3PTL9Pu7iPRoJZQPN4rN
	V+1XzGa++iBbpnfc/9lXiNkl/emVU/s5o1N1FTt4wdLMI4LA8eUo+OFxMfWifHkg92H+
	wMMjr+HqFI7rmUSLFb/ZXhql/YfDTBgPAKDvn8yALLGEejNwJEmWotIaG53Pq0y+6oiR
	YNw4TxnmMhVub7CQkz9wUOy6hdEAcegy82YIUe8uUwqQ2M8KaRWcF5c7/wfRyQYgp+9Y
	ZQx+bZeD2Ml3Sy48wqN98mAMa1v4yvzelnvlMbtMymRbulW6nQJDWXOuwzqtjc3x/MUb
	eJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sJXSbSg7eebmfET4GmozGLffGF5jlOnlhERf40JfZyQ=;
	b=mgnzi9KIqHsoQyl8WKrjKDZY4PWp21oPYwy4cmMm/wVoX0jQ03b+y5O35dwM7OcRLo
	XiOglNDo2s2eAgnUSzvh6nsn3HISzAQD7AT3fvyRuEVA5n4eJfXcbmLjFmP+MuO91txd
	kgzHdt1r+UChxdItFFcsediQPsGP+goAAcfAAZwiRqIy8YFjoJjLdAegOqGOTAIVCXtJ
	YoobLfGRzZths1vCjeeT8ilmm3QdDE7HUPphpyQIo0nIAiJlK2v0RUb5GnQa0rbEDCuq
	pGYr2MtL0WBd1RYmQ1+3irE13EU5xMpKrWcL+al0/WPgnn2Zsi508946lSurmzYXxi3p
	3VAA==
X-Gm-Message-State: AJaThX5uWn6etZEmLg0e1FR5m+yvnyh9kccTpDw4NweFFR83EqZcMnnq
	l3DBTmfDXV5k3QFo3FmjdLJp14koHcUNnzFbLuY=
X-Google-Smtp-Source: AGs4zMaXviG0FsN57lvqo21ozSA0f/Rhjt3lfPZrFqgPEXKJnJX/1XIzXX/dSE/f4Bsizfo3SUZSF74SiIwehxjAm2o=
X-Received: by 10.84.217.2 with SMTP id o2mr36275281pli.338.1511746895789;
	Sun, 26 Nov 2017 17:41:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Sun, 26 Nov 2017 17:41:05 -0800 (PST)
In-Reply-To: <1511460550-27391-1-git-send-email-akuster808@gmail.com>
References: <1511460550-27391-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Nov 2017 17:41:05 -0800
Message-ID: <CAMKF1spJGdTb42zPywewLS25vTcsBmWzSRH_h52Qhx8bufLKwg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Morty][PATCH] systemd: fixs mips64 login issue
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
X-List-Received-Date: Mon, 27 Nov 2017 01:41:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 23, 2017 at 10:09 AM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> With out this patch, one can not login to a mips64 machine like qumumips64 or Octeon mips64 when
> systemd is enabled.
>
> remove PACKAGECONFIG option too
>
> affects: systemd < 2.3.2
                                 ^^^^^

a typo otherwise ok.

>
> Reviewed-by: Jeremy Puhlman <jpuhlman@mvista.com>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../systemd/Ensure-kdbus-isn-t-used-3501.patch     | 670 +++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_230.bb           |   3 +-
>  2 files changed, 671 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/Ensure-kdbus-isn-t-used-3501.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/Ensure-kdbus-isn-t-used-3501.patch b/meta/recipes-core/systemd/systemd/Ensure-kdbus-isn-t-used-3501.patch
> new file mode 100644
> index 0000000..d08a10f
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/Ensure-kdbus-isn-t-used-3501.patch
> @@ -0,0 +1,670 @@
> +From 222953e87f34545a3f9c6d3c18216e222bf6ea94 Mon Sep 17 00:00:00 2001
> +From: Dave Reisner <dreisner@archlinux.org>
> +Date: Fri, 10 Jun 2016 09:50:16 -0400
> +Subject: [PATCH] Ensure kdbus isn't used (#3501)
> +
> +Delete the dbus1 generator and some critical wiring. This prevents
> +kdbus from being loaded or detected. As such, it will never be used,
> +even if the user still has a useful kdbus module loaded on their system.
> +
> +Sort of fixes #3480. Not really, but it's better than the current state.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + Makefile.am                           |  20 --
> + autogen.sh                            |  12 +-
> + configure.ac                          |  10 -
> + src/core/busname.c                    |   7 +-
> + src/core/kmod-setup.c                 |   3 -
> + src/core/manager.c                    |  23 ---
> + src/core/mount-setup.c                |   2 -
> + src/core/service.c                    |  17 +-
> + src/dbus1-generator/dbus1-generator.c | 331 ----------------------------------
> + src/login/pam_systemd.c               |  31 ++--
> + src/shared/bus-util.c                 |  34 ----
> + src/shared/bus-util.h                 |   3 -
> + 12 files changed, 23 insertions(+), 470 deletions(-)
> + delete mode 100644 src/dbus1-generator/dbus1-generator.c
> +
> +Index: git/autogen.sh
> +===================================================================
> +--- git.orig/autogen.sh
> ++++ git/autogen.sh
> +@@ -55,19 +55,19 @@ fi
> + cd $oldpwd
> +
> + if [ "x$1" = "xc" ]; then
> +-        $topdir/configure CFLAGS='-g -O0 -ftrapv' --enable-kdbus $args
> ++        $topdir/configure CFLAGS='-g -O0 -ftrapv' $args
> +         make clean
> + elif [ "x$1" = "xg" ]; then
> +-        $topdir/configure CFLAGS='-g -Og -ftrapv' --enable-kdbus $args
> ++        $topdir/configure CFLAGS='-g -Og -ftrapv' $args
> +         make clean
> + elif [ "x$1" = "xa" ]; then
> +-        $topdir/configure CFLAGS='-g -O0 -Wsuggest-attribute=pure -Wsuggest-attribute=const -ftrapv' --enable-kdbus $args
> ++        $topdir/configure CFLAGS='-g -O0 -Wsuggest-attribute=pure -Wsuggest-attribute=const -ftrapv' $args
> +         make clean
> + elif [ "x$1" = "xl" ]; then
> +-        $topdir/configure CC=clang CFLAGS='-g -O0 -ftrapv' --enable-kdbus $args
> ++        $topdir/configure CC=clang CFLAGS='-g -O0 -ftrapv' $args
> +         make clean
> + elif [ "x$1" = "xs" ]; then
> +-        scan-build $topdir/configure CFLAGS='-std=gnu99 -g -O0 -ftrapv' --enable-kdbus $args
> ++        scan-build $topdir/configure CFLAGS='-std=gnu99 -g -O0 -ftrapv' $args
> +         scan-build make
> + else
> +         echo
> +@@ -75,6 +75,6 @@ else
> +         echo "Initialized build system. For a common configuration please run:"
> +         echo "----------------------------------------------------------------"
> +         echo
> +-        echo "$topdir/configure CFLAGS='-g -O0 -ftrapv' --enable-kdbus $args"
> ++        echo "$topdir/configure CFLAGS='-g -O0 -ftrapv' $args"
> +         echo
> + fi
> +Index: git/configure.ac
> +===================================================================
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -1294,16 +1294,6 @@ AC_ARG_WITH(tpm-pcrindex,
> + AC_DEFINE_UNQUOTED(SD_TPM_PCR, [$SD_TPM_PCR], [TPM PCR register number to use])
> +
> + # ------------------------------------------------------------------------------
> +-have_kdbus=no
> +-AC_ARG_ENABLE(kdbus, AS_HELP_STRING([--disable-kdbus], [do not connect to kdbus by default]))
> +-if test "x$enable_kdbus" != "xno"; then
> +-        AC_DEFINE(ENABLE_KDBUS, 1, [Define if kdbus is to be connected to by default])
> +-        have_kdbus=yes
> +-        M4_DEFINES="$M4_DEFINES -DENABLE_KDBUS"
> +-fi
> +-AM_CONDITIONAL(ENABLE_KDBUS, [test "$have_kdbus" = "yes"])
> +-
> +-# ------------------------------------------------------------------------------
> + AC_ARG_WITH(rc-local-script-path-start,
> +         AS_HELP_STRING([--with-rc-local-script-path-start=PATH],
> +                 [Path to /etc/rc.local]),
> +Index: git/src/core/busname.c
> +===================================================================
> +--- git.orig/src/core/busname.c
> ++++ git/src/core/busname.c
> +@@ -998,12 +998,7 @@ static int busname_get_timeout(Unit *u,
> + }
> +
> + static bool busname_supported(void) {
> +-        static int supported = -1;
> +-
> +-        if (supported < 0)
> +-                supported = is_kdbus_available();
> +-
> +-        return supported;
> ++        return false;
> + }
> +
> + static int busname_control_pid(Unit *u) {
> +Index: git/src/core/kmod-setup.c
> +===================================================================
> +--- git.orig/src/core/kmod-setup.c
> ++++ git/src/core/kmod-setup.c
> +@@ -64,9 +64,6 @@ int kmod_setup(void) {
> +                 /* this should never be a module */
> +                 { "unix",      "/proc/net/unix",            true,   true,    NULL      },
> +
> +-                /* IPC is needed before we bring up any other services */
> +-                { "kdbus",     "/sys/fs/kdbus",             false,  false,   is_kdbus_wanted },
> +-
> + #ifdef HAVE_LIBIPTC
> +                 /* netfilter is needed by networkd, nspawn among others, and cannot be autoloaded */
> +                 { "ip_tables", "/proc/net/ip_tables_names", false,  false,   NULL      },
> +Index: git/src/core/manager.c
> +===================================================================
> +--- git.orig/src/core/manager.c
> ++++ git/src/core/manager.c
> +@@ -809,28 +809,6 @@ static int manager_setup_cgroups_agent(M
> +         return 0;
> + }
> +
> +-static int manager_setup_kdbus(Manager *m) {
> +-        _cleanup_free_ char *p = NULL;
> +-
> +-        assert(m);
> +-
> +-        if (m->test_run || m->kdbus_fd >= 0)
> +-                return 0;
> +-        if (!is_kdbus_available())
> +-                return -ESOCKTNOSUPPORT;
> +-
> +-        m->kdbus_fd = bus_kernel_create_bus(
> +-                        MANAGER_IS_SYSTEM(m) ? "system" : "user",
> +-                        MANAGER_IS_SYSTEM(m), &p);
> +-
> +-        if (m->kdbus_fd < 0)
> +-                return log_debug_errno(m->kdbus_fd, "Failed to set up kdbus: %m");
> +-
> +-        log_debug("Successfully set up kdbus on %s", p);
> +-
> +-        return 0;
> +-}
> +-
> + static int manager_connect_bus(Manager *m, bool reexecuting) {
> +         bool try_bus_connect;
> +
> +@@ -1225,7 +1203,6 @@ int manager_startup(Manager *m, FILE *se
> +
> +         /* We might have deserialized the kdbus control fd, but if we
> +          * didn't, then let's create the bus now. */
> +-        manager_setup_kdbus(m);
> +         manager_connect_bus(m, !!serialization);
> +         bus_track_coldplug(m, &m->subscribed, &m->deserialized_subscribed);
> +
> +Index: git/src/core/mount-setup.c
> +===================================================================
> +--- git.orig/src/core/mount-setup.c
> ++++ git/src/core/mount-setup.c
> +@@ -108,8 +108,6 @@ static const MountPoint mount_table[] =
> +         { "efivarfs",    "/sys/firmware/efi/efivars", "efivarfs",   NULL,                      MS_NOSUID|MS_NOEXEC|MS_NODEV,
> +           is_efi_boot,   MNT_NONE                   },
> + #endif
> +-        { "kdbusfs",    "/sys/fs/kdbus",             "kdbusfs",    NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV,
> +-          is_kdbus_wanted,       MNT_IN_CONTAINER },
> + };
> +
> + /* These are API file systems that might be mounted by other software,
> +Index: git/src/core/service.c
> +===================================================================
> +--- git.orig/src/core/service.c
> ++++ git/src/core/service.c
> +@@ -574,20 +574,9 @@ static int service_setup_bus_name(Servic
> +         if (!s->bus_name)
> +                 return 0;
> +
> +-        if (is_kdbus_available()) {
> +-                const char *n;
> +-
> +-                n = strjoina(s->bus_name, ".busname");
> +-                r = unit_add_dependency_by_name(UNIT(s), UNIT_AFTER, n, NULL, true);
> +-                if (r < 0)
> +-                        return log_unit_error_errno(UNIT(s), r, "Failed to add dependency to .busname unit: %m");
> +-
> +-        } else {
> +-                /* If kdbus is not available, we know the dbus socket is required, hence pull it in, and require it */
> +-                r = unit_add_dependency_by_name(UNIT(s), UNIT_REQUIRES, SPECIAL_DBUS_SOCKET, NULL, true);
> +-                if (r < 0)
> +-                        return log_unit_error_errno(UNIT(s), r, "Failed to add dependency on " SPECIAL_DBUS_SOCKET ": %m");
> +-        }
> ++        r = unit_add_dependency_by_name(UNIT(s), UNIT_REQUIRES, SPECIAL_DBUS_SOCKET, NULL, true);
> ++        if (r < 0)
> ++                return log_unit_error_errno(UNIT(s), r, "Failed to add dependency on " SPECIAL_DBUS_SOCKET ": %m");
> +
> +         /* Regardless if kdbus is used or not, we always want to be ordered against dbus.socket if both are in the transaction. */
> +         r = unit_add_dependency_by_name(UNIT(s), UNIT_AFTER, SPECIAL_DBUS_SOCKET, NULL, true);
> +Index: git/src/dbus1-generator/dbus1-generator.c
> +===================================================================
> +--- git.orig/src/dbus1-generator/dbus1-generator.c
> ++++ /dev/null
> +@@ -1,331 +0,0 @@
> +-/***
> +-  This file is part of systemd.
> +-
> +-  Copyright 2013 Lennart Poettering
> +-
> +-  systemd is free software; you can redistribute it and/or modify it
> +-  under the terms of the GNU Lesser General Public License as published by
> +-  the Free Software Foundation; either version 2.1 of the License, or
> +-  (at your option) any later version.
> +-
> +-  systemd is distributed in the hope that it will be useful, but
> +-  WITHOUT ANY WARRANTY; without even the implied warranty of
> +-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +-  Lesser General Public License for more details.
> +-
> +-  You should have received a copy of the GNU Lesser General Public License
> +-  along with systemd; If not, see <http://www.gnu.org/licenses/>.
> +-***/
> +-
> +-#include "alloc-util.h"
> +-#include "bus-internal.h"
> +-#include "bus-util.h"
> +-#include "cgroup-util.h"
> +-#include "conf-parser.h"
> +-#include "dirent-util.h"
> +-#include "fd-util.h"
> +-#include "fileio.h"
> +-#include "mkdir.h"
> +-#include "special.h"
> +-#include "unit-name.h"
> +-#include "util.h"
> +-
> +-static const char *arg_dest_late = "/tmp", *arg_dest = "/tmp";
> +-
> +-static int create_dbus_files(
> +-                const char *path,
> +-                const char *name,
> +-                const char *service,
> +-                const char *exec,
> +-                const char *user,
> +-                const char *type) {
> +-
> +-        _cleanup_free_ char *b = NULL, *s = NULL, *lnk = NULL;
> +-        _cleanup_fclose_ FILE *f = NULL;
> +-        int r;
> +-
> +-        assert(path);
> +-        assert(name);
> +-        assert(service || exec);
> +-
> +-        if (!service) {
> +-                _cleanup_free_ char *a = NULL;
> +-
> +-                s = strjoin("dbus-", name, ".service", NULL);
> +-                if (!s)
> +-                        return log_oom();
> +-
> +-                a = strjoin(arg_dest_late, "/", s, NULL);
> +-                if (!a)
> +-                        return log_oom();
> +-
> +-                f = fopen(a, "wxe");
> +-                if (!f)
> +-                        return log_error_errno(errno, "Failed to create %s: %m", a);
> +-
> +-                fprintf(f,
> +-                        "# Automatically generated by systemd-dbus1-generator\n\n"
> +-                        "[Unit]\n"
> +-                        "SourcePath=%s\n"
> +-                        "Description=DBUS1: %s\n"
> +-                        "Documentation=man:systemd-dbus1-generator(8)\n\n"
> +-                        "[Service]\n"
> +-                        "ExecStart=%s\n"
> +-                        "Type=dbus\n"
> +-                        "BusName=%s\n",
> +-                        path,
> +-                        name,
> +-                        exec,
> +-                        name);
> +-
> +-                if (user)
> +-                        fprintf(f, "User=%s\n", user);
> +-
> +-
> +-                if (type) {
> +-                        fprintf(f, "Environment=DBUS_STARTER_BUS_TYPE=%s\n", type);
> +-
> +-                        if (streq(type, "system"))
> +-                                fprintf(f, "Environment=DBUS_STARTER_ADDRESS=" DEFAULT_SYSTEM_BUS_ADDRESS "\n");
> +-                        else if (streq(type, "session")) {
> +-                                char *run;
> +-
> +-                                run = getenv("XDG_RUNTIME_DIR");
> +-                                if (!run) {
> +-                                        log_error("XDG_RUNTIME_DIR not set.");
> +-                                        return -EINVAL;
> +-                                }
> +-
> +-                                fprintf(f, "Environment=DBUS_STARTER_ADDRESS="KERNEL_USER_BUS_ADDRESS_FMT ";" UNIX_USER_BUS_ADDRESS_FMT "\n",
> +-                                        getuid(), run);
> +-                        }
> +-                }
> +-
> +-                r = fflush_and_check(f);
> +-                if (r < 0)
> +-                        return log_error_errno(r, "Failed to write %s: %m", a);
> +-
> +-                f = safe_fclose(f);
> +-
> +-                service = s;
> +-        }
> +-
> +-        b = strjoin(arg_dest_late, "/", name, ".busname", NULL);
> +-        if (!b)
> +-                return log_oom();
> +-
> +-        f = fopen(b, "wxe");
> +-        if (!f)
> +-                return log_error_errno(errno, "Failed to create %s: %m", b);
> +-
> +-        fprintf(f,
> +-                "# Automatically generated by systemd-dbus1-generator\n\n"
> +-                "[Unit]\n"
> +-                "SourcePath=%s\n"
> +-                "Description=DBUS1: %s\n"
> +-                "Documentation=man:systemd-dbus1-generator(8)\n\n"
> +-                "[BusName]\n"
> +-                "Name=%s\n"
> +-                "Service=%s\n"
> +-                "AllowWorld=talk\n",
> +-                path,
> +-                name,
> +-                name,
> +-                service);
> +-
> +-        r = fflush_and_check(f);
> +-        if (r < 0)
> +-                return log_error_errno(r, "Failed to write %s: %m", b);
> +-
> +-        lnk = strjoin(arg_dest_late, "/" SPECIAL_BUSNAMES_TARGET ".wants/", name, ".busname", NULL);
> +-        if (!lnk)
> +-                return log_oom();
> +-
> +-        mkdir_parents_label(lnk, 0755);
> +-        if (symlink(b, lnk))
> +-                return log_error_errno(errno, "Failed to create symlink %s: %m", lnk);
> +-
> +-        return 0;
> +-}
> +-
> +-static int add_dbus(const char *path, const char *fname, const char *type) {
> +-        _cleanup_free_ char *name = NULL, *exec = NULL, *user = NULL, *service = NULL;
> +-
> +-        const ConfigTableItem table[] = {
> +-                { "D-BUS Service", "Name", config_parse_string, 0, &name },
> +-                { "D-BUS Service", "Exec", config_parse_string, 0, &exec },
> +-                { "D-BUS Service", "User", config_parse_string, 0, &user },
> +-                { "D-BUS Service", "SystemdService", config_parse_string, 0, &service },
> +-                { },
> +-        };
> +-
> +-        char *p;
> +-        int r;
> +-
> +-        assert(path);
> +-        assert(fname);
> +-
> +-        p = strjoina(path, "/", fname);
> +-        r = config_parse(NULL, p, NULL,
> +-                         "D-BUS Service\0",
> +-                         config_item_table_lookup, table,
> +-                         true, false, true, NULL);
> +-        if (r < 0)
> +-                return r;
> +-
> +-        if (!name) {
> +-                log_warning("Activation file %s lacks name setting, ignoring.", p);
> +-                return 0;
> +-        }
> +-
> +-        if (!service_name_is_valid(name)) {
> +-                log_warning("Bus service name %s is not valid, ignoring.", name);
> +-                return 0;
> +-        }
> +-
> +-        if (streq(name, "org.freedesktop.systemd1")) {
> +-                log_debug("Skipping %s, identified as systemd.", p);
> +-                return 0;
> +-        }
> +-
> +-        if (service) {
> +-                if (!unit_name_is_valid(service, UNIT_NAME_PLAIN|UNIT_NAME_INSTANCE)) {
> +-                        log_warning("Unit name %s is not valid, ignoring.", service);
> +-                        return 0;
> +-                }
> +-                if (!endswith(service, ".service")) {
> +-                        log_warning("Bus names can only activate services, ignoring %s.", p);
> +-                        return 0;
> +-                }
> +-        } else {
> +-                if (streq(exec, "/bin/false") || !exec) {
> +-                        log_warning("Neither service name nor binary path specified, ignoring %s.", p);
> +-                        return 0;
> +-                }
> +-
> +-                if (exec[0] != '/') {
> +-                        log_warning("Exec= in %s does not start with an absolute path, ignoring.", p);
> +-                        return 0;
> +-                }
> +-        }
> +-
> +-        return create_dbus_files(p, name, service, exec, user, type);
> +-}
> +-
> +-static int parse_dbus_fragments(const char *path, const char *type) {
> +-        _cleanup_closedir_ DIR *d = NULL;
> +-        struct dirent *de;
> +-        int r;
> +-
> +-        assert(path);
> +-        assert(type);
> +-
> +-        d = opendir(path);
> +-        if (!d) {
> +-                if (errno == -ENOENT)
> +-                        return 0;
> +-
> +-                return log_error_errno(errno, "Failed to enumerate D-Bus activated services: %m");
> +-        }
> +-
> +-        r = 0;
> +-        FOREACH_DIRENT(de, d, goto fail) {
> +-                int q;
> +-
> +-                if (!endswith(de->d_name, ".service"))
> +-                        continue;
> +-
> +-                q = add_dbus(path, de->d_name, type);
> +-                if (q < 0)
> +-                        r = q;
> +-        }
> +-
> +-        return r;
> +-
> +-fail:
> +-        return log_error_errno(errno, "Failed to read D-Bus services directory: %m");
> +-}
> +-
> +-static int link_busnames_target(const char *units) {
> +-        const char *f, *t;
> +-
> +-        f = strjoina(units, "/" SPECIAL_BUSNAMES_TARGET);
> +-        t = strjoina(arg_dest, "/" SPECIAL_BASIC_TARGET ".wants/" SPECIAL_BUSNAMES_TARGET);
> +-
> +-        mkdir_parents_label(t, 0755);
> +-        if (symlink(f, t) < 0)
> +-                return log_error_errno(errno, "Failed to create symlink %s: %m", t);
> +-
> +-        return 0;
> +-}
> +-
> +-static int link_compatibility(const char *units) {
> +-        const char *f, *t;
> +-
> +-        f = strjoina(units, "/systemd-bus-proxyd.socket");
> +-        t = strjoina(arg_dest, "/" SPECIAL_DBUS_SOCKET);
> +-        mkdir_parents_label(t, 0755);
> +-        if (symlink(f, t) < 0)
> +-                return log_error_errno(errno, "Failed to create symlink %s: %m", t);
> +-
> +-        f = strjoina(units, "/systemd-bus-proxyd.socket");
> +-        t = strjoina(arg_dest, "/" SPECIAL_SOCKETS_TARGET ".wants/systemd-bus-proxyd.socket");
> +-        mkdir_parents_label(t, 0755);
> +-        if (symlink(f, t) < 0)
> +-                return log_error_errno(errno, "Failed to create symlink %s: %m", t);
> +-
> +-        t = strjoina(arg_dest, "/" SPECIAL_DBUS_SERVICE);
> +-        if (symlink("/dev/null", t) < 0)
> +-                return log_error_errno(errno, "Failed to mask %s: %m", t);
> +-
> +-        return 0;
> +-}
> +-
> +-int main(int argc, char *argv[]) {
> +-        const char *path, *type, *units;
> +-        int r, q;
> +-
> +-        if (argc > 1 && argc != 4) {
> +-                log_error("This program takes three or no arguments.");
> +-                return EXIT_FAILURE;
> +-        }
> +-
> +-        if (argc > 1) {
> +-                arg_dest = argv[1];
> +-                arg_dest_late = argv[3];
> +-        }
> +-
> +-        log_set_target(LOG_TARGET_SAFE);
> +-        log_parse_environment();
> +-        log_open();
> +-
> +-        umask(0022);
> +-
> +-        if (!is_kdbus_available())
> +-                return 0;
> +-
> +-        r = cg_pid_get_owner_uid(0, NULL);
> +-        if (r >= 0) {
> +-                path = "/usr/share/dbus-1/services";
> +-                type = "session";
> +-                units = USER_DATA_UNIT_PATH;
> +-        } else if (r == -ENXIO) {
> +-                path = "/usr/share/dbus-1/system-services";
> +-                type = "system";
> +-                units = SYSTEM_DATA_UNIT_PATH;
> +-        } else
> +-                return log_error_errno(r, "Failed to determine whether we are running as user or system instance: %m");
> +-
> +-        r = parse_dbus_fragments(path, type);
> +-
> +-        /* FIXME: One day this should just be pulled in statically from basic.target */
> +-        q = link_busnames_target(units);
> +-        if (q < 0)
> +-                r = q;
> +-
> +-        q = link_compatibility(units);
> +-        if (q < 0)
> +-                r = q;
> +-
> +-        return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> +-}
> +Index: git/src/login/pam_systemd.c
> +===================================================================
> +--- git.orig/src/login/pam_systemd.c
> ++++ git/src/login/pam_systemd.c
> +@@ -182,25 +182,20 @@ static int export_legacy_dbus_address(
> +         _cleanup_free_ char *s = NULL;
> +         int r = PAM_BUF_ERR;
> +
> +-        if (is_kdbus_available()) {
> +-                if (asprintf(&s, KERNEL_USER_BUS_ADDRESS_FMT ";" UNIX_USER_BUS_ADDRESS_FMT, uid, runtime) < 0)
> +-                        goto error;
> +-        } else {
> +-                /* FIXME: We *really* should move the access() check into the
> +-                 * daemons that spawn dbus-daemon, instead of forcing
> +-                 * DBUS_SESSION_BUS_ADDRESS= here. */
> ++        /* FIXME: We *really* should move the access() check into the
> ++         * daemons that spawn dbus-daemon, instead of forcing
> ++         * DBUS_SESSION_BUS_ADDRESS= here. */
> +
> +-                s = strjoin(runtime, "/bus", NULL);
> +-                if (!s)
> +-                        goto error;
> ++        s = strjoin(runtime, "/bus", NULL);
> ++        if (!s)
> ++                goto error;
> +
> +-                if (access(s, F_OK) < 0)
> +-                        return PAM_SUCCESS;
> ++        if (access(s, F_OK) < 0)
> ++                return PAM_SUCCESS;
> +
> +-                s = mfree(s);
> +-                if (asprintf(&s, UNIX_USER_BUS_ADDRESS_FMT, runtime) < 0)
> +-                        goto error;
> +-        }
> ++        s = mfree(s);
> ++        if (asprintf(&s, UNIX_USER_BUS_ADDRESS_FMT, runtime) < 0)
> ++                goto error;
> +
> +         r = pam_misc_setenv(handle, "DBUS_SESSION_BUS_ADDRESS", s, 0);
> +         if (r != PAM_SUCCESS)
> +Index: git/src/shared/bus-util.c
> +===================================================================
> +--- git.orig/src/shared/bus-util.c
> ++++ git/src/shared/bus-util.c
> +@@ -1492,40 +1492,6 @@ int bus_path_decode_unique(const char *p
> +         return 1;
> + }
> +
> +-bool is_kdbus_wanted(void) {
> +-        _cleanup_free_ char *value = NULL;
> +-#ifdef ENABLE_KDBUS
> +-        const bool configured = true;
> +-#else
> +-        const bool configured = false;
> +-#endif
> +-
> +-        int r;
> +-
> +-        if (get_proc_cmdline_key("kdbus", NULL) > 0)
> +-                return true;
> +-
> +-        r = get_proc_cmdline_key("kdbus=", &value);
> +-        if (r <= 0)
> +-                return configured;
> +-
> +-        return parse_boolean(value) == 1;
> +-}
> +-
> +-bool is_kdbus_available(void) {
> +-        _cleanup_close_ int fd = -1;
> +-        struct kdbus_cmd cmd = { .size = sizeof(cmd), .flags = KDBUS_FLAG_NEGOTIATE };
> +-
> +-        if (!is_kdbus_wanted())
> +-                return false;
> +-
> +-        fd = open("/sys/fs/kdbus/control", O_RDWR | O_CLOEXEC | O_NONBLOCK | O_NOCTTY);
> +-        if (fd < 0)
> +-                return false;
> +-
> +-        return ioctl(fd, KDBUS_CMD_BUS_MAKE, &cmd) >= 0;
> +-}
> +-
> + int bus_property_get_rlimit(
> +                 sd_bus *bus,
> +                 const char *path,
> +Index: git/src/shared/bus-util.h
> +===================================================================
> +--- git.orig/src/shared/bus-util.h
> ++++ git/src/shared/bus-util.h
> +@@ -157,7 +157,4 @@ int bus_log_create_error(int r);
> + int bus_path_encode_unique(sd_bus *b, const char *prefix, const char *sender_id, const char *external_id, char **ret_path);
> + int bus_path_decode_unique(const char *path, const char *prefix, char **ret_sender, char **ret_external);
> +
> +-bool is_kdbus_wanted(void);
> +-bool is_kdbus_available(void);
> +-
> + int bus_property_get_rlimit(sd_bus *bus, const char *path, const char *interface, const char *property, sd_bus_message *reply, void *userdata, sd_bus_error *error);
> +Index: git/Makefile.am
> +===================================================================
> +--- git.orig/Makefile.am
> ++++ git/Makefile.am
> +@@ -2895,29 +2895,9 @@ systemd_gpt_auto_generator_CFLAGS = \
> + endif
> +
> + # ------------------------------------------------------------------------------
> +-systemgenerator_PROGRAMS +=  \
> +-      systemd-dbus1-generator
> +-
> +-systemd_dbus1_generator_SOURCES = \
> +-      src/dbus1-generator/dbus1-generator.c
> +-
> +-systemd_dbus1_generator_LDADD = \
> +-      libshared.la
> +-
> +-dbus1-generator-install-hook:
> +-      $(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratordir)
> +-      $(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
> +-      $(AM_V_LN)lnr $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
> +-
> +-dbus1-generator-uninstall-hook:
> +-      rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
> +-
> + dist_xinitrc_SCRIPTS = \
> +       xorg/50-systemd-user.sh
> +
> +-INSTALL_EXEC_HOOKS += dbus1-generator-install-hook
> +-UNINSTALL_EXEC_HOOKS += dbus1-generator-uninstall-hook
> +-
> + # ------------------------------------------------------------------------------
> + systemd_sysv_generator_SOURCES = \
> +       src/sysv-generator/sysv-generator.c
> diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
> index 40f1428..f4ff860 100644
> --- a/meta/recipes-core/systemd/systemd_230.bb
> +++ b/meta/recipes-core/systemd/systemd_230.bb
> @@ -37,6 +37,7 @@ SRC_URI += " \
>             file://udev-re-enable-mount-propagation-for-udevd.patch \
>             file://CVE-2016-7795.patch \
>             file://validate-user.patch \
> +           file://Ensure-kdbus-isn-t-used-3501.patch \
>  "
>  SRC_URI_append_libc-uclibc = "\
>             file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
> @@ -61,7 +62,6 @@ PACKAGECONFIG ??= "xz \
>                     timedated \
>                     timesyncd \
>                     localed \
> -                   kdbus \
>                     ima \
>                     smack \
>                     logind \
> @@ -96,7 +96,6 @@ PACKAGECONFIG[timedated] = "--enable-timedated,--disable-timedated"
>  PACKAGECONFIG[timesyncd] = "--enable-timesyncd,--disable-timesyncd"
>  PACKAGECONFIG[localed] = "--enable-localed,--disable-localed"
>  PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
> -PACKAGECONFIG[kdbus] = "--enable-kdbus,--disable-kdbus"
>  PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
>  PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
>  # libseccomp is found in meta-security
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

