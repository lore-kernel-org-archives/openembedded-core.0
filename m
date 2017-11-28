Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4181B60684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 15:54:04 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id b5so246335itc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 07:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SuGyUJED7g3CghExRTRDg/jlml4XnE8Vr8Ag79YSExU=;
	b=hoZITcb1humhIrImKyyhgK5UCXkquhWtZSY6wDHYYWhvP09KBM6yJxFdu5Zxil3dMR
	x/Sqf30c2EtE6d8feM3n4+dOX4M74r+x6WMBeUyN3ctBnnMYwZSrb5x5hTf+6HAO8oqA
	6MqnNHBLfTZTWQfP+tbqVXPtJWFDNAQzx53QLI82lsVrQYRnmbo+u0ivmh02WTQtTd68
	6uN8xPLhXQJNz+oDQyaV83G+19gkkVAPViDg0exq9heMmB90P6xSS65qjm6MG69xtHkc
	xJbMWzt56hVogd+Gx4ugMlbrGKIyZmzs7tZpW7kFTD1man5VOAXMsaP/JiDhrQOJSqDM
	BjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SuGyUJED7g3CghExRTRDg/jlml4XnE8Vr8Ag79YSExU=;
	b=dFHs/x6FgaYqQsojqQOPlPEggP2t0QAMmm2En4C9vawCiGCc6dJ6XgWfKdnMR+gppj
	W7Et2bwk8DS5l6VbTFrp2Hv+jCsFw+ndRiTbr7waoIPvEDfC+PRiU72/xxCj4KsYL5pm
	33eQY/KtZa67fRYw4WL2o1aWaYTQFLSKwxbm2fKiqJJYkfyBGcqYo6MjRthjzqMsABdg
	IMrFlQXUKhkAd7r6drfoGs4gGKdhe7gnhQhTp6AJG4BXSOzl33s8CgEcT27zXRvNFMQT
	OVtSyiV+znIdxzpUPskJNOinW1UxJcMlv22hXdYAcNT8H/w9kXA5TOqvWDuCgAj2rbXP
	3hgA==
X-Gm-Message-State: AJaThX6X9f+d8PyB0vsk0zqOsQ192qhwsGJ90QKWi2Tvc5ywKLktNT3a
	kQZ3vBhqfveGzKV0pCpBi1s6WPcPWV17elEiY5engg==
X-Google-Smtp-Source: AGs4zMYr8CTl7zGZULoH3KYNMSw2UuqtdJ8glQpvtwfwJZ6agkqN76FabUfG6HyGTPvUHAtvYNu2/jEZl5p6GrxBBns=
X-Received: by 10.36.233.5 with SMTP id f5mr3010047ith.61.1511884445071; Tue,
	28 Nov 2017 07:54:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.8.1 with HTTP; Tue, 28 Nov 2017 07:54:04 -0800 (PST)
In-Reply-To: <CAMKF1spJGdTb42zPywewLS25vTcsBmWzSRH_h52Qhx8bufLKwg@mail.gmail.com>
References: <1511460550-27391-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spJGdTb42zPywewLS25vTcsBmWzSRH_h52Qhx8bufLKwg@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Tue, 28 Nov 2017 21:24:04 +0530
Message-ID: <CAD3vsf7z2f+excsXWxTKoqX9Qri1f_YTdKYyVUqGpqSug5za5g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 28 Nov 2017 15:54:04 -0000
Content-Type: multipart/alternative; boundary="94eb2c0033764a5747055f0d072b"

--94eb2c0033764a5747055f0d072b
Content-Type: text/plain; charset="UTF-8"

The patch (Ensure-kdbus-isn-t-used-3501.patch) is already part of systemd
v2.3.1.
The issue comes on systemd < 2.3.1.

Regards,
Jagadeesh

On Mon, Nov 27, 2017 at 7:11 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Nov 23, 2017 at 10:09 AM, Armin Kuster <akuster808@gmail.com>
> wrote:
> > From: Armin Kuster <akuster@mvista.com>
> >
> > With out this patch, one can not login to a mips64 machine like
> qumumips64 or Octeon mips64 when
> > systemd is enabled.
> >
> > remove PACKAGECONFIG option too
> >
> > affects: systemd < 2.3.2
>                                  ^^^^^
>
> a typo otherwise ok.
>
> >
> > Reviewed-by: Jeremy Puhlman <jpuhlman@mvista.com>
> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > Signed-off-by: Armin Kuster <akuster@mvista.com>
> > ---
> >  .../systemd/Ensure-kdbus-isn-t-used-3501.patch     | 670
> +++++++++++++++++++++
> >  meta/recipes-core/systemd/systemd_230.bb           |   3 +-
> >  2 files changed, 671 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-core/systemd/
> systemd/Ensure-kdbus-isn-t-used-3501.patch
> >
> > diff --git a/meta/recipes-core/systemd/systemd/Ensure-kdbus-isn-t-used-3501.patch
> b/meta/recipes-core/systemd/systemd/Ensure-kdbus-isn-t-used-3501.patch
> > new file mode 100644
> > index 0000000..d08a10f
> > --- /dev/null
> > +++ b/meta/recipes-core/systemd/systemd/Ensure-kdbus-isn-t-
> used-3501.patch
> > @@ -0,0 +1,670 @@
> > +From 222953e87f34545a3f9c6d3c18216e222bf6ea94 Mon Sep 17 00:00:00 2001
> > +From: Dave Reisner <dreisner@archlinux.org>
> > +Date: Fri, 10 Jun 2016 09:50:16 -0400
> > +Subject: [PATCH] Ensure kdbus isn't used (#3501)
> > +
> > +Delete the dbus1 generator and some critical wiring. This prevents
> > +kdbus from being loaded or detected. As such, it will never be used,
> > +even if the user still has a useful kdbus module loaded on their system.
> > +
> > +Sort of fixes #3480. Not really, but it's better than the current state.
> > +
> > +Upstream-Status: Backport
> > +Signed-off-by: Armin Kuster <akuster@mvista.com>
> > +
> > +---
> > + Makefile.am                           |  20 --
> > + autogen.sh                            |  12 +-
> > + configure.ac                          |  10 -
> > + src/core/busname.c                    |   7 +-
> > + src/core/kmod-setup.c                 |   3 -
> > + src/core/manager.c                    |  23 ---
> > + src/core/mount-setup.c                |   2 -
> > + src/core/service.c                    |  17 +-
> > + src/dbus1-generator/dbus1-generator.c | 331
> ----------------------------------
> > + src/login/pam_systemd.c               |  31 ++--
> > + src/shared/bus-util.c                 |  34 ----
> > + src/shared/bus-util.h                 |   3 -
> > + 12 files changed, 23 insertions(+), 470 deletions(-)
> > + delete mode 100644 src/dbus1-generator/dbus1-generator.c
> > +
> > +Index: git/autogen.sh
> > +===================================================================
> > +--- git.orig/autogen.sh
> > ++++ git/autogen.sh
> > +@@ -55,19 +55,19 @@ fi
> > + cd $oldpwd
> > +
> > + if [ "x$1" = "xc" ]; then
> > +-        $topdir/configure CFLAGS='-g -O0 -ftrapv' --enable-kdbus $args
> > ++        $topdir/configure CFLAGS='-g -O0 -ftrapv' $args
> > +         make clean
> > + elif [ "x$1" = "xg" ]; then
> > +-        $topdir/configure CFLAGS='-g -Og -ftrapv' --enable-kdbus $args
> > ++        $topdir/configure CFLAGS='-g -Og -ftrapv' $args
> > +         make clean
> > + elif [ "x$1" = "xa" ]; then
> > +-        $topdir/configure CFLAGS='-g -O0 -Wsuggest-attribute=pure
> -Wsuggest-attribute=const -ftrapv' --enable-kdbus $args
> > ++        $topdir/configure CFLAGS='-g -O0 -Wsuggest-attribute=pure
> -Wsuggest-attribute=const -ftrapv' $args
> > +         make clean
> > + elif [ "x$1" = "xl" ]; then
> > +-        $topdir/configure CC=clang CFLAGS='-g -O0 -ftrapv'
> --enable-kdbus $args
> > ++        $topdir/configure CC=clang CFLAGS='-g -O0 -ftrapv' $args
> > +         make clean
> > + elif [ "x$1" = "xs" ]; then
> > +-        scan-build $topdir/configure CFLAGS='-std=gnu99 -g -O0
> -ftrapv' --enable-kdbus $args
> > ++        scan-build $topdir/configure CFLAGS='-std=gnu99 -g -O0
> -ftrapv' $args
> > +         scan-build make
> > + else
> > +         echo
> > +@@ -75,6 +75,6 @@ else
> > +         echo "Initialized build system. For a common configuration
> please run:"
> > +         echo "-----------------------------
> -----------------------------------"
> > +         echo
> > +-        echo "$topdir/configure CFLAGS='-g -O0 -ftrapv' --enable-kdbus
> $args"
> > ++        echo "$topdir/configure CFLAGS='-g -O0 -ftrapv' $args"
> > +         echo
> > + fi
> > +Index: git/configure.ac
> > +===================================================================
> > +--- git.orig/configure.ac
> > ++++ git/configure.ac
> > +@@ -1294,16 +1294,6 @@ AC_ARG_WITH(tpm-pcrindex,
> > + AC_DEFINE_UNQUOTED(SD_TPM_PCR, [$SD_TPM_PCR], [TPM PCR register number
> to use])
> > +
> > + # ------------------------------------------------------------
> ------------------
> > +-have_kdbus=no
> > +-AC_ARG_ENABLE(kdbus, AS_HELP_STRING([--disable-kdbus], [do not
> connect to kdbus by default]))
> > +-if test "x$enable_kdbus" != "xno"; then
> > +-        AC_DEFINE(ENABLE_KDBUS, 1, [Define if kdbus is to be connected
> to by default])
> > +-        have_kdbus=yes
> > +-        M4_DEFINES="$M4_DEFINES -DENABLE_KDBUS"
> > +-fi
> > +-AM_CONDITIONAL(ENABLE_KDBUS, [test "$have_kdbus" = "yes"])
> > +-
> > +-# ------------------------------------------------------------
> ------------------
> > + AC_ARG_WITH(rc-local-script-path-start,
> > +         AS_HELP_STRING([--with-rc-local-script-path-start=PATH],
> > +                 [Path to /etc/rc.local]),
> > +Index: git/src/core/busname.c
> > +===================================================================
> > +--- git.orig/src/core/busname.c
> > ++++ git/src/core/busname.c
> > +@@ -998,12 +998,7 @@ static int busname_get_timeout(Unit *u,
> > + }
> > +
> > + static bool busname_supported(void) {
> > +-        static int supported = -1;
> > +-
> > +-        if (supported < 0)
> > +-                supported = is_kdbus_available();
> > +-
> > +-        return supported;
> > ++        return false;
> > + }
> > +
> > + static int busname_control_pid(Unit *u) {
> > +Index: git/src/core/kmod-setup.c
> > +===================================================================
> > +--- git.orig/src/core/kmod-setup.c
> > ++++ git/src/core/kmod-setup.c
> > +@@ -64,9 +64,6 @@ int kmod_setup(void) {
> > +                 /* this should never be a module */
> > +                 { "unix",      "/proc/net/unix",            true,
>  true,    NULL      },
> > +
> > +-                /* IPC is needed before we bring up any other services
> */
> > +-                { "kdbus",     "/sys/fs/kdbus",             false,
> false,   is_kdbus_wanted },
> > +-
> > + #ifdef HAVE_LIBIPTC
> > +                 /* netfilter is needed by networkd, nspawn among
> others, and cannot be autoloaded */
> > +                 { "ip_tables", "/proc/net/ip_tables_names", false,
> false,   NULL      },
> > +Index: git/src/core/manager.c
> > +===================================================================
> > +--- git.orig/src/core/manager.c
> > ++++ git/src/core/manager.c
> > +@@ -809,28 +809,6 @@ static int manager_setup_cgroups_agent(M
> > +         return 0;
> > + }
> > +
> > +-static int manager_setup_kdbus(Manager *m) {
> > +-        _cleanup_free_ char *p = NULL;
> > +-
> > +-        assert(m);
> > +-
> > +-        if (m->test_run || m->kdbus_fd >= 0)
> > +-                return 0;
> > +-        if (!is_kdbus_available())
> > +-                return -ESOCKTNOSUPPORT;
> > +-
> > +-        m->kdbus_fd = bus_kernel_create_bus(
> > +-                        MANAGER_IS_SYSTEM(m) ? "system" : "user",
> > +-                        MANAGER_IS_SYSTEM(m), &p);
> > +-
> > +-        if (m->kdbus_fd < 0)
> > +-                return log_debug_errno(m->kdbus_fd, "Failed to set up
> kdbus: %m");
> > +-
> > +-        log_debug("Successfully set up kdbus on %s", p);
> > +-
> > +-        return 0;
> > +-}
> > +-
> > + static int manager_connect_bus(Manager *m, bool reexecuting) {
> > +         bool try_bus_connect;
> > +
> > +@@ -1225,7 +1203,6 @@ int manager_startup(Manager *m, FILE *se
> > +
> > +         /* We might have deserialized the kdbus control fd, but if we
> > +          * didn't, then let's create the bus now. */
> > +-        manager_setup_kdbus(m);
> > +         manager_connect_bus(m, !!serialization);
> > +         bus_track_coldplug(m, &m->subscribed,
> &m->deserialized_subscribed);
> > +
> > +Index: git/src/core/mount-setup.c
> > +===================================================================
> > +--- git.orig/src/core/mount-setup.c
> > ++++ git/src/core/mount-setup.c
> > +@@ -108,8 +108,6 @@ static const MountPoint mount_table[] =
> > +         { "efivarfs",    "/sys/firmware/efi/efivars", "efivarfs",
>  NULL,                      MS_NOSUID|MS_NOEXEC|MS_NODEV,
> > +           is_efi_boot,   MNT_NONE                   },
> > + #endif
> > +-        { "kdbusfs",    "/sys/fs/kdbus",             "kdbusfs",
> NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV,
> > +-          is_kdbus_wanted,       MNT_IN_CONTAINER },
> > + };
> > +
> > + /* These are API file systems that might be mounted by other software,
> > +Index: git/src/core/service.c
> > +===================================================================
> > +--- git.orig/src/core/service.c
> > ++++ git/src/core/service.c
> > +@@ -574,20 +574,9 @@ static int service_setup_bus_name(Servic
> > +         if (!s->bus_name)
> > +                 return 0;
> > +
> > +-        if (is_kdbus_available()) {
> > +-                const char *n;
> > +-
> > +-                n = strjoina(s->bus_name, ".busname");
> > +-                r = unit_add_dependency_by_name(UNIT(s), UNIT_AFTER,
> n, NULL, true);
> > +-                if (r < 0)
> > +-                        return log_unit_error_errno(UNIT(s), r,
> "Failed to add dependency to .busname unit: %m");
> > +-
> > +-        } else {
> > +-                /* If kdbus is not available, we know the dbus socket
> is required, hence pull it in, and require it */
> > +-                r = unit_add_dependency_by_name(UNIT(s),
> UNIT_REQUIRES, SPECIAL_DBUS_SOCKET, NULL, true);
> > +-                if (r < 0)
> > +-                        return log_unit_error_errno(UNIT(s), r,
> "Failed to add dependency on " SPECIAL_DBUS_SOCKET ": %m");
> > +-        }
> > ++        r = unit_add_dependency_by_name(UNIT(s), UNIT_REQUIRES,
> SPECIAL_DBUS_SOCKET, NULL, true);
> > ++        if (r < 0)
> > ++                return log_unit_error_errno(UNIT(s), r, "Failed to add
> dependency on " SPECIAL_DBUS_SOCKET ": %m");
> > +
> > +         /* Regardless if kdbus is used or not, we always want to be
> ordered against dbus.socket if both are in the transaction. */
> > +         r = unit_add_dependency_by_name(UNIT(s), UNIT_AFTER,
> SPECIAL_DBUS_SOCKET, NULL, true);
> > +Index: git/src/dbus1-generator/dbus1-generator.c
> > +===================================================================
> > +--- git.orig/src/dbus1-generator/dbus1-generator.c
> > ++++ /dev/null
> > +@@ -1,331 +0,0 @@
> > +-/***
> > +-  This file is part of systemd.
> > +-
> > +-  Copyright 2013 Lennart Poettering
> > +-
> > +-  systemd is free software; you can redistribute it and/or modify it
> > +-  under the terms of the GNU Lesser General Public License as
> published by
> > +-  the Free Software Foundation; either version 2.1 of the License, or
> > +-  (at your option) any later version.
> > +-
> > +-  systemd is distributed in the hope that it will be useful, but
> > +-  WITHOUT ANY WARRANTY; without even the implied warranty of
> > +-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> > +-  Lesser General Public License for more details.
> > +-
> > +-  You should have received a copy of the GNU Lesser General Public
> License
> > +-  along with systemd; If not, see <http://www.gnu.org/licenses/>.
> > +-***/
> > +-
> > +-#include "alloc-util.h"
> > +-#include "bus-internal.h"
> > +-#include "bus-util.h"
> > +-#include "cgroup-util.h"
> > +-#include "conf-parser.h"
> > +-#include "dirent-util.h"
> > +-#include "fd-util.h"
> > +-#include "fileio.h"
> > +-#include "mkdir.h"
> > +-#include "special.h"
> > +-#include "unit-name.h"
> > +-#include "util.h"
> > +-
> > +-static const char *arg_dest_late = "/tmp", *arg_dest = "/tmp";
> > +-
> > +-static int create_dbus_files(
> > +-                const char *path,
> > +-                const char *name,
> > +-                const char *service,
> > +-                const char *exec,
> > +-                const char *user,
> > +-                const char *type) {
> > +-
> > +-        _cleanup_free_ char *b = NULL, *s = NULL, *lnk = NULL;
> > +-        _cleanup_fclose_ FILE *f = NULL;
> > +-        int r;
> > +-
> > +-        assert(path);
> > +-        assert(name);
> > +-        assert(service || exec);
> > +-
> > +-        if (!service) {
> > +-                _cleanup_free_ char *a = NULL;
> > +-
> > +-                s = strjoin("dbus-", name, ".service", NULL);
> > +-                if (!s)
> > +-                        return log_oom();
> > +-
> > +-                a = strjoin(arg_dest_late, "/", s, NULL);
> > +-                if (!a)
> > +-                        return log_oom();
> > +-
> > +-                f = fopen(a, "wxe");
> > +-                if (!f)
> > +-                        return log_error_errno(errno, "Failed to
> create %s: %m", a);
> > +-
> > +-                fprintf(f,
> > +-                        "# Automatically generated by
> systemd-dbus1-generator\n\n"
> > +-                        "[Unit]\n"
> > +-                        "SourcePath=%s\n"
> > +-                        "Description=DBUS1: %s\n"
> > +-                        "Documentation=man:systemd-
> dbus1-generator(8)\n\n"
> > +-                        "[Service]\n"
> > +-                        "ExecStart=%s\n"
> > +-                        "Type=dbus\n"
> > +-                        "BusName=%s\n",
> > +-                        path,
> > +-                        name,
> > +-                        exec,
> > +-                        name);
> > +-
> > +-                if (user)
> > +-                        fprintf(f, "User=%s\n", user);
> > +-
> > +-
> > +-                if (type) {
> > +-                        fprintf(f, "Environment=DBUS_STARTER_BUS_TYPE=%s\n",
> type);
> > +-
> > +-                        if (streq(type, "system"))
> > +-                                fprintf(f, "Environment=DBUS_STARTER_ADDRESS="
> DEFAULT_SYSTEM_BUS_ADDRESS "\n");
> > +-                        else if (streq(type, "session")) {
> > +-                                char *run;
> > +-
> > +-                                run = getenv("XDG_RUNTIME_DIR");
> > +-                                if (!run) {
> > +-                                        log_error("XDG_RUNTIME_DIR not
> set.");
> > +-                                        return -EINVAL;
> > +-                                }
> > +-
> > +-                                fprintf(f, "Environment=DBUS_STARTER_
> ADDRESS="KERNEL_USER_BUS_ADDRESS_FMT ";" UNIX_USER_BUS_ADDRESS_FMT "\n",
> > +-                                        getuid(), run);
> > +-                        }
> > +-                }
> > +-
> > +-                r = fflush_and_check(f);
> > +-                if (r < 0)
> > +-                        return log_error_errno(r, "Failed to write %s:
> %m", a);
> > +-
> > +-                f = safe_fclose(f);
> > +-
> > +-                service = s;
> > +-        }
> > +-
> > +-        b = strjoin(arg_dest_late, "/", name, ".busname", NULL);
> > +-        if (!b)
> > +-                return log_oom();
> > +-
> > +-        f = fopen(b, "wxe");
> > +-        if (!f)
> > +-                return log_error_errno(errno, "Failed to create %s:
> %m", b);
> > +-
> > +-        fprintf(f,
> > +-                "# Automatically generated by
> systemd-dbus1-generator\n\n"
> > +-                "[Unit]\n"
> > +-                "SourcePath=%s\n"
> > +-                "Description=DBUS1: %s\n"
> > +-                "Documentation=man:systemd-dbus1-generator(8)\n\n"
> > +-                "[BusName]\n"
> > +-                "Name=%s\n"
> > +-                "Service=%s\n"
> > +-                "AllowWorld=talk\n",
> > +-                path,
> > +-                name,
> > +-                name,
> > +-                service);
> > +-
> > +-        r = fflush_and_check(f);
> > +-        if (r < 0)
> > +-                return log_error_errno(r, "Failed to write %s: %m", b);
> > +-
> > +-        lnk = strjoin(arg_dest_late, "/" SPECIAL_BUSNAMES_TARGET
> ".wants/", name, ".busname", NULL);
> > +-        if (!lnk)
> > +-                return log_oom();
> > +-
> > +-        mkdir_parents_label(lnk, 0755);
> > +-        if (symlink(b, lnk))
> > +-                return log_error_errno(errno, "Failed to create
> symlink %s: %m", lnk);
> > +-
> > +-        return 0;
> > +-}
> > +-
> > +-static int add_dbus(const char *path, const char *fname, const char
> *type) {
> > +-        _cleanup_free_ char *name = NULL, *exec = NULL, *user = NULL,
> *service = NULL;
> > +-
> > +-        const ConfigTableItem table[] = {
> > +-                { "D-BUS Service", "Name", config_parse_string, 0,
> &name },
> > +-                { "D-BUS Service", "Exec", config_parse_string, 0,
> &exec },
> > +-                { "D-BUS Service", "User", config_parse_string, 0,
> &user },
> > +-                { "D-BUS Service", "SystemdService",
> config_parse_string, 0, &service },
> > +-                { },
> > +-        };
> > +-
> > +-        char *p;
> > +-        int r;
> > +-
> > +-        assert(path);
> > +-        assert(fname);
> > +-
> > +-        p = strjoina(path, "/", fname);
> > +-        r = config_parse(NULL, p, NULL,
> > +-                         "D-BUS Service\0",
> > +-                         config_item_table_lookup, table,
> > +-                         true, false, true, NULL);
> > +-        if (r < 0)
> > +-                return r;
> > +-
> > +-        if (!name) {
> > +-                log_warning("Activation file %s lacks name setting,
> ignoring.", p);
> > +-                return 0;
> > +-        }
> > +-
> > +-        if (!service_name_is_valid(name)) {
> > +-                log_warning("Bus service name %s is not valid,
> ignoring.", name);
> > +-                return 0;
> > +-        }
> > +-
> > +-        if (streq(name, "org.freedesktop.systemd1")) {
> > +-                log_debug("Skipping %s, identified as systemd.", p);
> > +-                return 0;
> > +-        }
> > +-
> > +-        if (service) {
> > +-                if (!unit_name_is_valid(service,
> UNIT_NAME_PLAIN|UNIT_NAME_INSTANCE)) {
> > +-                        log_warning("Unit name %s is not valid,
> ignoring.", service);
> > +-                        return 0;
> > +-                }
> > +-                if (!endswith(service, ".service")) {
> > +-                        log_warning("Bus names can only activate
> services, ignoring %s.", p);
> > +-                        return 0;
> > +-                }
> > +-        } else {
> > +-                if (streq(exec, "/bin/false") || !exec) {
> > +-                        log_warning("Neither service name nor binary
> path specified, ignoring %s.", p);
> > +-                        return 0;
> > +-                }
> > +-
> > +-                if (exec[0] != '/') {
> > +-                        log_warning("Exec= in %s does not start with
> an absolute path, ignoring.", p);
> > +-                        return 0;
> > +-                }
> > +-        }
> > +-
> > +-        return create_dbus_files(p, name, service, exec, user, type);
> > +-}
> > +-
> > +-static int parse_dbus_fragments(const char *path, const char *type) {
> > +-        _cleanup_closedir_ DIR *d = NULL;
> > +-        struct dirent *de;
> > +-        int r;
> > +-
> > +-        assert(path);
> > +-        assert(type);
> > +-
> > +-        d = opendir(path);
> > +-        if (!d) {
> > +-                if (errno == -ENOENT)
> > +-                        return 0;
> > +-
> > +-                return log_error_errno(errno, "Failed to enumerate
> D-Bus activated services: %m");
> > +-        }
> > +-
> > +-        r = 0;
> > +-        FOREACH_DIRENT(de, d, goto fail) {
> > +-                int q;
> > +-
> > +-                if (!endswith(de->d_name, ".service"))
> > +-                        continue;
> > +-
> > +-                q = add_dbus(path, de->d_name, type);
> > +-                if (q < 0)
> > +-                        r = q;
> > +-        }
> > +-
> > +-        return r;
> > +-
> > +-fail:
> > +-        return log_error_errno(errno, "Failed to read D-Bus services
> directory: %m");
> > +-}
> > +-
> > +-static int link_busnames_target(const char *units) {
> > +-        const char *f, *t;
> > +-
> > +-        f = strjoina(units, "/" SPECIAL_BUSNAMES_TARGET);
> > +-        t = strjoina(arg_dest, "/" SPECIAL_BASIC_TARGET ".wants/"
> SPECIAL_BUSNAMES_TARGET);
> > +-
> > +-        mkdir_parents_label(t, 0755);
> > +-        if (symlink(f, t) < 0)
> > +-                return log_error_errno(errno, "Failed to create
> symlink %s: %m", t);
> > +-
> > +-        return 0;
> > +-}
> > +-
> > +-static int link_compatibility(const char *units) {
> > +-        const char *f, *t;
> > +-
> > +-        f = strjoina(units, "/systemd-bus-proxyd.socket");
> > +-        t = strjoina(arg_dest, "/" SPECIAL_DBUS_SOCKET);
> > +-        mkdir_parents_label(t, 0755);
> > +-        if (symlink(f, t) < 0)
> > +-                return log_error_errno(errno, "Failed to create
> symlink %s: %m", t);
> > +-
> > +-        f = strjoina(units, "/systemd-bus-proxyd.socket");
> > +-        t = strjoina(arg_dest, "/" SPECIAL_SOCKETS_TARGET
> ".wants/systemd-bus-proxyd.socket");
> > +-        mkdir_parents_label(t, 0755);
> > +-        if (symlink(f, t) < 0)
> > +-                return log_error_errno(errno, "Failed to create
> symlink %s: %m", t);
> > +-
> > +-        t = strjoina(arg_dest, "/" SPECIAL_DBUS_SERVICE);
> > +-        if (symlink("/dev/null", t) < 0)
> > +-                return log_error_errno(errno, "Failed to mask %s: %m",
> t);
> > +-
> > +-        return 0;
> > +-}
> > +-
> > +-int main(int argc, char *argv[]) {
> > +-        const char *path, *type, *units;
> > +-        int r, q;
> > +-
> > +-        if (argc > 1 && argc != 4) {
> > +-                log_error("This program takes three or no arguments.");
> > +-                return EXIT_FAILURE;
> > +-        }
> > +-
> > +-        if (argc > 1) {
> > +-                arg_dest = argv[1];
> > +-                arg_dest_late = argv[3];
> > +-        }
> > +-
> > +-        log_set_target(LOG_TARGET_SAFE);
> > +-        log_parse_environment();
> > +-        log_open();
> > +-
> > +-        umask(0022);
> > +-
> > +-        if (!is_kdbus_available())
> > +-                return 0;
> > +-
> > +-        r = cg_pid_get_owner_uid(0, NULL);
> > +-        if (r >= 0) {
> > +-                path = "/usr/share/dbus-1/services";
> > +-                type = "session";
> > +-                units = USER_DATA_UNIT_PATH;
> > +-        } else if (r == -ENXIO) {
> > +-                path = "/usr/share/dbus-1/system-services";
> > +-                type = "system";
> > +-                units = SYSTEM_DATA_UNIT_PATH;
> > +-        } else
> > +-                return log_error_errno(r, "Failed to determine whether
> we are running as user or system instance: %m");
> > +-
> > +-        r = parse_dbus_fragments(path, type);
> > +-
> > +-        /* FIXME: One day this should just be pulled in statically
> from basic.target */
> > +-        q = link_busnames_target(units);
> > +-        if (q < 0)
> > +-                r = q;
> > +-
> > +-        q = link_compatibility(units);
> > +-        if (q < 0)
> > +-                r = q;
> > +-
> > +-        return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
> > +-}
> > +Index: git/src/login/pam_systemd.c
> > +===================================================================
> > +--- git.orig/src/login/pam_systemd.c
> > ++++ git/src/login/pam_systemd.c
> > +@@ -182,25 +182,20 @@ static int export_legacy_dbus_address(
> > +         _cleanup_free_ char *s = NULL;
> > +         int r = PAM_BUF_ERR;
> > +
> > +-        if (is_kdbus_available()) {
> > +-                if (asprintf(&s, KERNEL_USER_BUS_ADDRESS_FMT ";"
> UNIX_USER_BUS_ADDRESS_FMT, uid, runtime) < 0)
> > +-                        goto error;
> > +-        } else {
> > +-                /* FIXME: We *really* should move the access() check
> into the
> > +-                 * daemons that spawn dbus-daemon, instead of forcing
> > +-                 * DBUS_SESSION_BUS_ADDRESS= here. */
> > ++        /* FIXME: We *really* should move the access() check into the
> > ++         * daemons that spawn dbus-daemon, instead of forcing
> > ++         * DBUS_SESSION_BUS_ADDRESS= here. */
> > +
> > +-                s = strjoin(runtime, "/bus", NULL);
> > +-                if (!s)
> > +-                        goto error;
> > ++        s = strjoin(runtime, "/bus", NULL);
> > ++        if (!s)
> > ++                goto error;
> > +
> > +-                if (access(s, F_OK) < 0)
> > +-                        return PAM_SUCCESS;
> > ++        if (access(s, F_OK) < 0)
> > ++                return PAM_SUCCESS;
> > +
> > +-                s = mfree(s);
> > +-                if (asprintf(&s, UNIX_USER_BUS_ADDRESS_FMT, runtime) <
> 0)
> > +-                        goto error;
> > +-        }
> > ++        s = mfree(s);
> > ++        if (asprintf(&s, UNIX_USER_BUS_ADDRESS_FMT, runtime) < 0)
> > ++                goto error;
> > +
> > +         r = pam_misc_setenv(handle, "DBUS_SESSION_BUS_ADDRESS", s, 0);
> > +         if (r != PAM_SUCCESS)
> > +Index: git/src/shared/bus-util.c
> > +===================================================================
> > +--- git.orig/src/shared/bus-util.c
> > ++++ git/src/shared/bus-util.c
> > +@@ -1492,40 +1492,6 @@ int bus_path_decode_unique(const char *p
> > +         return 1;
> > + }
> > +
> > +-bool is_kdbus_wanted(void) {
> > +-        _cleanup_free_ char *value = NULL;
> > +-#ifdef ENABLE_KDBUS
> > +-        const bool configured = true;
> > +-#else
> > +-        const bool configured = false;
> > +-#endif
> > +-
> > +-        int r;
> > +-
> > +-        if (get_proc_cmdline_key("kdbus", NULL) > 0)
> > +-                return true;
> > +-
> > +-        r = get_proc_cmdline_key("kdbus=", &value);
> > +-        if (r <= 0)
> > +-                return configured;
> > +-
> > +-        return parse_boolean(value) == 1;
> > +-}
> > +-
> > +-bool is_kdbus_available(void) {
> > +-        _cleanup_close_ int fd = -1;
> > +-        struct kdbus_cmd cmd = { .size = sizeof(cmd), .flags =
> KDBUS_FLAG_NEGOTIATE };
> > +-
> > +-        if (!is_kdbus_wanted())
> > +-                return false;
> > +-
> > +-        fd = open("/sys/fs/kdbus/control", O_RDWR | O_CLOEXEC |
> O_NONBLOCK | O_NOCTTY);
> > +-        if (fd < 0)
> > +-                return false;
> > +-
> > +-        return ioctl(fd, KDBUS_CMD_BUS_MAKE, &cmd) >= 0;
> > +-}
> > +-
> > + int bus_property_get_rlimit(
> > +                 sd_bus *bus,
> > +                 const char *path,
> > +Index: git/src/shared/bus-util.h
> > +===================================================================
> > +--- git.orig/src/shared/bus-util.h
> > ++++ git/src/shared/bus-util.h
> > +@@ -157,7 +157,4 @@ int bus_log_create_error(int r);
> > + int bus_path_encode_unique(sd_bus *b, const char *prefix, const char
> *sender_id, const char *external_id, char **ret_path);
> > + int bus_path_decode_unique(const char *path, const char *prefix, char
> **ret_sender, char **ret_external);
> > +
> > +-bool is_kdbus_wanted(void);
> > +-bool is_kdbus_available(void);
> > +-
> > + int bus_property_get_rlimit(sd_bus *bus, const char *path, const char
> *interface, const char *property, sd_bus_message *reply, void *userdata,
> sd_bus_error *error);
> > +Index: git/Makefile.am
> > +===================================================================
> > +--- git.orig/Makefile.am
> > ++++ git/Makefile.am
> > +@@ -2895,29 +2895,9 @@ systemd_gpt_auto_generator_CFLAGS = \
> > + endif
> > +
> > + # ------------------------------------------------------------
> ------------------
> > +-systemgenerator_PROGRAMS +=  \
> > +-      systemd-dbus1-generator
> > +-
> > +-systemd_dbus1_generator_SOURCES = \
> > +-      src/dbus1-generator/dbus1-generator.c
> > +-
> > +-systemd_dbus1_generator_LDADD = \
> > +-      libshared.la
> > +-
> > +-dbus1-generator-install-hook:
> > +-      $(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratordir)
> > +-      $(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/
> systemd-dbus1-generator
> > +-      $(AM_V_LN)lnr $(DESTDIR)$(systemgeneratordir)/systemd-dbus1-generator
> $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
> > +-
> > +-dbus1-generator-uninstall-hook:
> > +-      rm -f $(DESTDIR)$(usergeneratordir)/systemd-dbus1-generator
> > +-
> > + dist_xinitrc_SCRIPTS = \
> > +       xorg/50-systemd-user.sh
> > +
> > +-INSTALL_EXEC_HOOKS += dbus1-generator-install-hook
> > +-UNINSTALL_EXEC_HOOKS += dbus1-generator-uninstall-hook
> > +-
> > + # ------------------------------------------------------------
> ------------------
> > + systemd_sysv_generator_SOURCES = \
> > +       src/sysv-generator/sysv-generator.c
> > diff --git a/meta/recipes-core/systemd/systemd_230.bb
> b/meta/recipes-core/systemd/systemd_230.bb
> > index 40f1428..f4ff860 100644
> > --- a/meta/recipes-core/systemd/systemd_230.bb
> > +++ b/meta/recipes-core/systemd/systemd_230.bb
> > @@ -37,6 +37,7 @@ SRC_URI += " \
> >             file://udev-re-enable-mount-propagation-for-udevd.patch \
> >             file://CVE-2016-7795.patch \
> >             file://validate-user.patch \
> > +           file://Ensure-kdbus-isn-t-used-3501.patch \
> >  "
> >  SRC_URI_append_libc-uclibc = "\
> >             file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
> \
> > @@ -61,7 +62,6 @@ PACKAGECONFIG ??= "xz \
> >                     timedated \
> >                     timesyncd \
> >                     localed \
> > -                   kdbus \
> >                     ima \
> >                     smack \
> >                     logind \
> > @@ -96,7 +96,6 @@ PACKAGECONFIG[timedated] =
> "--enable-timedated,--disable-timedated"
> >  PACKAGECONFIG[timesyncd] = "--enable-timesyncd,--disable-timesyncd"
> >  PACKAGECONFIG[localed] = "--enable-localed,--disable-localed"
> >  PACKAGECONFIG[efi] = "--enable-efi,--disable-efi"
> > -PACKAGECONFIG[kdbus] = "--enable-kdbus,--disable-kdbus"
> >  PACKAGECONFIG[ima] = "--enable-ima,--disable-ima"
> >  PACKAGECONFIG[smack] = "--enable-smack,--disable-smack"
> >  # libseccomp is found in meta-security
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0033764a5747055f0d072b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>The patch (Ensure-kdbus-isn-t-<wbr>used-3501.pat=
ch) is already part of systemd v2.3.1.<br>The issue comes on systemd &lt; 2=
.3.1.<br><br></div>Regards,<br></div>Jagadeesh <br><div><div><div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Nov 27, 2017 at 7:=
11 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">On Thu, Nov 23=
, 2017 at 10:09 AM, Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com=
">akuster808@gmail.com</a>&gt; wrote:<br>
&gt; From: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akuster@m=
vista.com</a>&gt;<br>
&gt;<br>
&gt; With out this patch, one can not login to a mips64 machine like qumumi=
ps64 or Octeon mips64 when<br>
&gt; systemd is enabled.<br>
&gt;<br>
&gt; remove PACKAGECONFIG option too<br>
&gt;<br>
&gt; affects: systemd &lt; 2.3.2<br>
</span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^<br>
<br>
a typo otherwise ok.<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt;<br>
&gt; Reviewed-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com"=
>jpuhlman@mvista.com</a>&gt;<br>
&gt; Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishn=
anjanappa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
&gt; Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">=
akuster@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../systemd/Ensure-kdbus-isn-<wbr>t-used-3501.patch=C2=A0 =C2=A0=
 =C2=A0| 670 +++++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_230.bb" rel=
=3D"noreferrer" target=3D"_blank">syst<wbr>emd_230.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 2 files changed, 671 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/systemd/<wbr>systemd/Ensure=
-kdbus-isn-t-<wbr>used-3501.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<wbr>systemd/Ensure-kdbus-isn-t=
-<wbr>used-3501.patch b/meta/recipes-core/systemd/<wbr>systemd/Ensure-kdbus=
-isn-t-<wbr>used-3501.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..d08a10f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/systemd/<wbr>systemd/Ensure-kdbus-isn-t-<wbr>u=
sed-3501.patch<br>
&gt; @@ -0,0 +1,670 @@<br>
&gt; +From 222953e87f34545a3f9c6d3c18216e<wbr>222bf6ea94 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Dave Reisner &lt;<a href=3D"mailto:dreisner@archlinux.org">drei=
sner@archlinux.org</a>&gt;<br>
&gt; +Date: Fri, 10 Jun 2016 09:50:16 -0400<br>
&gt; +Subject: [PATCH] Ensure kdbus isn&#39;t used (#3501)<br>
&gt; +<br>
&gt; +Delete the dbus1 generator and some critical wiring. This prevents<br=
>
&gt; +kdbus from being loaded or detected. As such, it will never be used,<=
br>
&gt; +even if the user still has a useful kdbus module loaded on their syst=
em.<br>
&gt; +<br>
&gt; +Sort of fixes #3480. Not really, but it&#39;s better than the current=
 state.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com"=
>akuster@mvista.com</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 --<br>
&gt; + autogen.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +-<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 -<br>
&gt; + src/core/busname.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
&gt; + src/core/kmod-setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 -<br>
&gt; + src/core/manager.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 23 ---<br>
&gt; + src/core/mount-setup.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
&gt; + src/core/service.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 +-<br>
&gt; + src/dbus1-generator/dbus1-<wbr>generator.c | 331 -------------------=
-----------<wbr>----<br>
&gt; + src/login/pam_systemd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 31 ++--<br>
&gt; + src/shared/bus-util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 34 ----<br>
&gt; + src/shared/bus-util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 -<br>
&gt; + 12 files changed, 23 insertions(+), 470 deletions(-)<br>
&gt; + delete mode 100644 src/dbus1-generator/dbus1-<wbr>generator.c<br>
&gt; +<br>
&gt; +Index: git/autogen.sh<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/autogen.sh<br>
&gt; ++++ git/autogen.sh<br>
&gt; +@@ -55,19 +55,19 @@ fi<br>
&gt; + cd $oldpwd<br>
&gt; +<br>
&gt; + if [ &quot;x$1&quot; =3D &quot;xc&quot; ]; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 $topdir/configure CFLAGS=3D&#39;-g -O0 -=
ftrapv&#39; --enable-kdbus $args<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $topdir/configure CFLAGS=3D&#39;-g -O0 -=
ftrapv&#39; $args<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make clean<br>
&gt; + elif [ &quot;x$1&quot; =3D &quot;xg&quot; ]; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 $topdir/configure CFLAGS=3D&#39;-g -Og -=
ftrapv&#39; --enable-kdbus $args<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $topdir/configure CFLAGS=3D&#39;-g -Og -=
ftrapv&#39; $args<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make clean<br>
&gt; + elif [ &quot;x$1&quot; =3D &quot;xa&quot; ]; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 $topdir/configure CFLAGS=3D&#39;-g -O0 -=
Wsuggest-attribute=3Dpure -Wsuggest-attribute=3Dconst -ftrapv&#39; --enable=
-kdbus $args<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $topdir/configure CFLAGS=3D&#39;-g -O0 -=
Wsuggest-attribute=3Dpure -Wsuggest-attribute=3Dconst -ftrapv&#39; $args<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make clean<br>
&gt; + elif [ &quot;x$1&quot; =3D &quot;xl&quot; ]; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 $topdir/configure CC=3Dclang CFLAGS=3D&#=
39;-g -O0 -ftrapv&#39; --enable-kdbus $args<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 $topdir/configure CC=3Dclang CFLAGS=3D&#=
39;-g -O0 -ftrapv&#39; $args<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make clean<br>
&gt; + elif [ &quot;x$1&quot; =3D &quot;xs&quot; ]; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 scan-build $topdir/configure CFLAGS=3D&#=
39;-std=3Dgnu99 -g -O0 -ftrapv&#39; --enable-kdbus $args<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 scan-build $topdir/configure CFLAGS=3D&#=
39;-std=3Dgnu99 -g -O0 -ftrapv&#39; $args<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scan-build make<br>
&gt; + else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
&gt; +@@ -75,6 +75,6 @@ else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Initialized build system=
. For a common configuration please run:&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;------------------------=
-----<wbr>------------------------------<wbr>-----&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$topdir/configure CFLAGS=3D&#=
39;-g -O0 -ftrapv&#39; --enable-kdbus $args&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$topdir/configure CFLAGS=3D&#=
39;-g -O0 -ftrapv&#39; $args&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
&gt; + fi<br>
&gt; +Index: git/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a><br>
&gt; ++++ git/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a><br>
&gt; +@@ -1294,16 +1294,6 @@ AC_ARG_WITH(tpm-pcrindex,<br>
&gt; + AC_DEFINE_UNQUOTED(SD_TPM_PCR, [$SD_TPM_PCR], [TPM PCR register numb=
er to use])<br>
&gt; +<br>
&gt; + # ------------------------------<wbr>------------------------------<=
wbr>------------------<br>
&gt; +-have_kdbus=3Dno<br>
&gt; +-AC_ARG_ENABLE(kdbus, AS_HELP_STRING([--disable-<wbr>kdbus], [do not =
connect to kdbus by default]))<br>
&gt; +-if test &quot;x$enable_kdbus&quot; !=3D &quot;xno&quot;; then<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(ENABLE_KDBUS, 1, [Define if kd=
bus is to be connected to by default])<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_kdbus=3Dyes<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 M4_DEFINES=3D&quot;$M4_DEFINES -DENABLE_=
KDBUS&quot;<br>
&gt; +-fi<br>
&gt; +-AM_CONDITIONAL(ENABLE_KDBUS, [test &quot;$have_kdbus&quot; =3D &quot=
;yes&quot;])<br>
&gt; +-<br>
&gt; +-# ------------------------------<wbr>------------------------------<=
wbr>------------------<br>
&gt; + AC_ARG_WITH(rc-local-script-<wbr>path-start,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AS_HELP_STRING([--with-rc-<wbr>loca=
l-script-path-start=3DPATH],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Path t=
o /etc/rc.local]),<br>
&gt; +Index: git/src/core/busname.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/src/core/busname.c<br>
&gt; ++++ git/src/core/busname.c<br>
&gt; +@@ -998,12 +998,7 @@ static int busname_get_timeout(Unit *u,<br>
&gt; + }<br>
&gt; +<br>
&gt; + static bool busname_supported(void) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 static int supported =3D -1;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (supported &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 supported =
=3D is_kdbus_available();<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return supported;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; + }<br>
&gt; +<br>
&gt; + static int busname_control_pid(Unit *u) {<br>
&gt; +Index: git/src/core/kmod-setup.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/src/core/kmod-setup.c<br>
&gt; ++++ git/src/core/kmod-setup.c<br>
&gt; +@@ -64,9 +64,6 @@ int kmod_setup(void) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* this=
 should never be a module */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot=
;unix&quot;,=C2=A0 =C2=A0 =C2=A0 &quot;/proc/net/unix&quot;,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 true,=C2=A0 =C2=A0true,=C2=A0 =C2=A0 NULL=C2=A0=
 =C2=A0 =C2=A0 },<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* IPC is ne=
eded before we bring up any other services */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;kdbu=
s&quot;,=C2=A0 =C2=A0 =C2=A0&quot;/sys/fs/kdbus&quot;,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0false,=C2=A0 false,=C2=A0 =C2=A0is_kdbus_wanted =
},<br>
&gt; +-<br>
&gt; + #ifdef HAVE_LIBIPTC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* netf=
ilter is needed by networkd, nspawn among others, and cannot be autoloaded =
*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot=
;ip_tables&quot;, &quot;/proc/net/ip_tables_names&quot;, false,=C2=A0 false=
,=C2=A0 =C2=A0NULL=C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +Index: git/src/core/manager.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/src/core/manager.c<br>
&gt; ++++ git/src/core/manager.c<br>
&gt; +@@ -809,28 +809,6 @@ static int manager_setup_cgroups_agent(M<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-static int manager_setup_kdbus(Manager *m) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *p =3D NULL;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(m);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (m-&gt;test_run || m-&gt;kdbus_fd &gt=
;=3D 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!is_kdbus_available())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ESOC=
KTNOSUPPORT;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 m-&gt;kdbus_fd =3D bus_kernel_create_bus=
(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MANAGER_IS_SYSTEM(m) ? &quot;system&quot; : &quot;user&qu=
ot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MANAGER_IS_SYSTEM(m), &amp;p);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (m-&gt;kdbus_fd &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_d=
ebug_errno(m-&gt;kdbus_fd, &quot;Failed to set up kdbus: %m&quot;);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 log_debug(&quot;Successfully set up kdbu=
s on %s&quot;, p);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-}<br>
&gt; +-<br>
&gt; + static int manager_connect_bus(Manager *m, bool reexecuting) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool try_bus_connect;<br>
&gt; +<br>
&gt; +@@ -1225,7 +1203,6 @@ int manager_startup(Manager *m, FILE *se<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We might have deserialized the k=
dbus control fd, but if we<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * didn&#39;t, then let&#39;s creat=
e the bus now. */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 manager_setup_kdbus(m);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manager_connect_bus(m, !!serializat=
ion);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus_track_coldplug(m, &amp;m-&gt;su=
bscribed, &amp;m-&gt;deserialized_subscribed);<br>
&gt; +<br>
&gt; +Index: git/src/core/mount-setup.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/src/core/mount-setup.<wbr>c<br>
&gt; ++++ git/src/core/mount-setup.c<br>
&gt; +@@ -108,8 +108,6 @@ static const MountPoint mount_table[] =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;efivarfs&quot;,=C2=A0 =C2=
=A0 &quot;/sys/firmware/efi/efivars&quot;, &quot;efivarfs&quot;,=C2=A0 =C2=
=A0NULL,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MS_NOSUID|MS_NOEXEC|MS_NODEV,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is_efi_boot,=C2=A0 =C2=A0MNT=
_NONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}=
,<br>
&gt; + #endif<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;kdbusfs&quot;,=C2=A0 =C2=A0 &quo=
t;/sys/fs/kdbus&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;kdbusfs&quot;,=C2=A0 =C2=A0 NULL, MS_NOSUID|MS_NOEXEC|MS_NODEV,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_kdbus_wanted,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0MNT_IN_CONTAINER },<br>
&gt; + };<br>
&gt; +<br>
&gt; + /* These are API file systems that might be mounted by other softwar=
e,<br>
&gt; +Index: git/src/core/service.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/src/core/service.c<br>
&gt; ++++ git/src/core/service.c<br>
&gt; +@@ -574,20 +574,9 @@ static int service_setup_bus_name(Servic<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;bus_name)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
0;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_kdbus_available()) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *=
n;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D strjoi=
na(s-&gt;bus_name, &quot;.busname&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D unit_a=
dd_dependency_by_name(<wbr>UNIT(s), UNIT_AFTER, n, NULL, true);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0=
)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return log_unit_error_errno(UNIT(s), r, &quot;Failed to a=
dd dependency to .busname unit: %m&quot;);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If kdbus =
is not available, we know the dbus socket is required, hence pull it in, an=
d require it */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D unit_a=
dd_dependency_by_name(<wbr>UNIT(s), UNIT_REQUIRES, SPECIAL_DBUS_SOCKET, NUL=
L, true);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0=
)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return log_unit_error_errno(UNIT(s), r, &quot;Failed to a=
dd dependency on &quot; SPECIAL_DBUS_SOCKET &quot;: %m&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D unit_add_dependency_by_name(<wbr>U=
NIT(s), UNIT_REQUIRES, SPECIAL_DBUS_SOCKET, NULL, true);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_u=
nit_error_errno(UNIT(s), r, &quot;Failed to add dependency on &quot; SPECIA=
L_DBUS_SOCKET &quot;: %m&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Regardless if kdbus is used or n=
ot, we always want to be ordered against dbus.socket if both are in the tra=
nsaction. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D unit_add_dependency_by_name(<=
wbr>UNIT(s), UNIT_AFTER, SPECIAL_DBUS_SOCKET, NULL, true);<br>
&gt; +Index: git/src/dbus1-generator/dbus1-<wbr>generator.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/src/dbus1-generator/<wbr>dbus1-generator.c<br>
&gt; ++++ /dev/null<br>
&gt; +@@ -1,331 +0,0 @@<br>
&gt; +-/***<br>
&gt; +-=C2=A0 This file is part of systemd.<br>
&gt; +-<br>
&gt; +-=C2=A0 Copyright 2013 Lennart Poettering<br>
&gt; +-<br>
&gt; +-=C2=A0 systemd is free software; you can redistribute it and/or modi=
fy it<br>
&gt; +-=C2=A0 under the terms of the GNU Lesser General Public License as p=
ublished by<br>
&gt; +-=C2=A0 the Free Software Foundation; either version 2.1 of the Licen=
se, or<br>
&gt; +-=C2=A0 (at your option) any later version.<br>
&gt; +-<br>
&gt; +-=C2=A0 systemd is distributed in the hope that it will be useful, bu=
t<br>
&gt; +-=C2=A0 WITHOUT ANY WARRANTY; without even the implied warranty of<br=
>
&gt; +-=C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the =
GNU<br>
&gt; +-=C2=A0 Lesser General Public License for more details.<br>
&gt; +-<br>
&gt; +-=C2=A0 You should have received a copy of the GNU Lesser General Pub=
lic License<br>
&gt; +-=C2=A0 along with systemd; If not, see &lt;<a href=3D"http://www.gnu=
.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/lic=
enses/</a>&gt;<wbr>.<br>
&gt; +-***/<br>
&gt; +-<br>
&gt; +-#include &quot;alloc-util.h&quot;<br>
&gt; +-#include &quot;bus-internal.h&quot;<br>
&gt; +-#include &quot;bus-util.h&quot;<br>
&gt; +-#include &quot;cgroup-util.h&quot;<br>
&gt; +-#include &quot;conf-parser.h&quot;<br>
&gt; +-#include &quot;dirent-util.h&quot;<br>
&gt; +-#include &quot;fd-util.h&quot;<br>
&gt; +-#include &quot;fileio.h&quot;<br>
&gt; +-#include &quot;mkdir.h&quot;<br>
&gt; +-#include &quot;special.h&quot;<br>
&gt; +-#include &quot;unit-name.h&quot;<br>
&gt; +-#include &quot;util.h&quot;<br>
&gt; +-<br>
&gt; +-static const char *arg_dest_late =3D &quot;/tmp&quot;, *arg_dest =3D=
 &quot;/tmp&quot;;<br>
&gt; +-<br>
&gt; +-static int create_dbus_files(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *=
path,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *=
name,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *=
service,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *=
exec,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *=
user,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *=
type) {<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *b =3D NULL, *s =3D =
NULL, *lnk =3D NULL;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_fclose_ FILE *f =3D NULL;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(path);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(name);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(service || exec);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!service) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_fre=
e_ char *a =3D NULL;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D strjoi=
n(&quot;dbus-&quot;, name, &quot;.service&quot;, NULL);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return log_oom();<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a =3D strjoi=
n(arg_dest_late, &quot;/&quot;, s, NULL);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!a)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return log_oom();<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D fopen(=
a, &quot;wxe&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!f)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return log_error_errno(errno, &quot;Failed to create %s: =
%m&quot;, a);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(f,<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;# Automatically generated by systemd-dbus1-generato=
r\n\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;[Unit]\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;SourcePath=3D%s\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Description=3DDBUS1: %s\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Documentation=3Dman:systemd-<wbr>dbus1-generator(8)=
\n\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;[Service]\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;ExecStart=3D%s\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Type=3Ddbus\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;BusName=3D%s\n&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 path,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 name,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 exec,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 name);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (user)<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fprintf(f, &quot;User=3D%s\n&quot;, user);<br>
&gt; +-<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (type) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fprintf(f, &quot;Environment=3DDBUS_STARTER_BUS_<wbr>TYPE=
=3D%s\n&quot;, type);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (streq(type, &quot;system&quot;))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(f, &quot;Environment=
=3DDBUS_STARTER_<wbr>ADDRESS=3D&quot; DEFAULT_SYSTEM_BUS_ADDRESS &quot;\n&q=
uot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 else if (streq(type, &quot;session&quot;)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *run;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run =3D getenv(&quot;XDG_RUNT=
IME_DIR&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!run) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l=
og_error(&quot;XDG_RUNTIME_DIR not set.&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
eturn -EINVAL;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(f, &quot;Environment=
=3DDBUS_STARTER_<wbr>ADDRESS=3D&quot;KERNEL_USER_BUS_<wbr>ADDRESS_FMT &quot=
;;&quot; UNIX_USER_BUS_ADDRESS_FMT &quot;\n&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
etuid(), run);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D fflush=
_and_check(f);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0=
)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return log_error_errno(r, &quot;Failed to write %s: %m&qu=
ot;, a);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D safe_f=
close(f);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service =3D =
s;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D strjoin(arg_dest_late, &quot;/&quo=
t;, name, &quot;.busname&quot;, NULL);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!b)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_o=
om();<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D fopen(b, &quot;wxe&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!f)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_e=
rror_errno(errno, &quot;Failed to create %s: %m&quot;, b);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(f,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;# Auto=
matically generated by systemd-dbus1-generator\n\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;[Unit]=
\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Source=
Path=3D%s\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Descri=
ption=3DDBUS1: %s\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Docume=
ntation=3Dman:systemd-<wbr>dbus1-generator(8)\n\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;[BusNa=
me]\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Name=
=3D%s\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Servic=
e=3D%s\n&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;AllowW=
orld=3Dtalk\n&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service);<br=
>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D fflush_and_check(f);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_e=
rror_errno(r, &quot;Failed to write %s: %m&quot;, b);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lnk =3D strjoin(arg_dest_late, &quot;/&q=
uot; SPECIAL_BUSNAMES_TARGET &quot;.wants/&quot;, name, &quot;.busname&quot=
;, NULL);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!lnk)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_o=
om();<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir_parents_label(lnk, 0755);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (symlink(b, lnk))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_e=
rror_errno(errno, &quot;Failed to create symlink %s: %m&quot;, lnk);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-}<br>
&gt; +-<br>
&gt; +-static int add_dbus(const char *path, const char *fname, const char =
*type) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *name =3D NULL, *exe=
c =3D NULL, *user =3D NULL, *service =3D NULL;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const ConfigTableItem table[] =3D {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;D-BU=
S Service&quot;, &quot;Name&quot;, config_parse_string, 0, &amp;name },<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;D-BU=
S Service&quot;, &quot;Exec&quot;, config_parse_string, 0, &amp;exec },<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;D-BU=
S Service&quot;, &quot;User&quot;, config_parse_string, 0, &amp;user },<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;D-BU=
S Service&quot;, &quot;SystemdService&quot;, config_parse_string, 0, &amp;s=
ervice },<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { },<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *p;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(path);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(fname);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D strjoina(path, &quot;/&quot;, fnam=
e);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D config_parse(NULL, p, NULL,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;D-BUS Service\0&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0config_item_table_lookup, table,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0true, false, true, NULL);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br=
>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!name) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_warning(=
&quot;Activation file %s lacks name setting, ignoring.&quot;, p);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!service_name_is_valid(name)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_warning(=
&quot;Bus service name %s is not valid, ignoring.&quot;, name);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (streq(name, &quot;org.freedesktop.sy=
stemd1&quot;)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_debug(&q=
uot;Skipping %s, identified as systemd.&quot;, p);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (service) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!unit_na=
me_is_valid(service, UNIT_NAME_PLAIN|UNIT_NAME_<wbr>INSTANCE)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 log_warning(&quot;Unit name %s is not valid, ignoring.&qu=
ot;, service);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!endswit=
h(service, &quot;.service&quot;)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 log_warning(&quot;Bus names can only activate services, i=
gnoring %s.&quot;, p);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (streq(ex=
ec, &quot;/bin/false&quot;) || !exec) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 log_warning(&quot;Neither service name nor binary path sp=
ecified, ignoring %s.&quot;, p);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (exec[0] =
!=3D &#39;/&#39;) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 log_warning(&quot;Exec=3D in %s does not start with an ab=
solute path, ignoring.&quot;, p);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return create_dbus_files(p, name, servic=
e, exec, user, type);<br>
&gt; +-}<br>
&gt; +-<br>
&gt; +-static int parse_dbus_fragments(const char *path, const char *type) =
{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_closedir_ DIR *d =3D NULL;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dirent *de;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(path);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(type);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d =3D opendir(path);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!d) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =
=3D=3D -ENOENT)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_e=
rror_errno(errno, &quot;Failed to enumerate D-Bus activated services: %m&qu=
ot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D 0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 FOREACH_DIRENT(de, d, goto fail) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int q;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!endswit=
h(de-&gt;d_name, &quot;.service&quot;))<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D add_db=
us(path, de-&gt;d_name, type);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (q &lt; 0=
)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 r =3D q;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
&gt; +-<br>
&gt; +-fail:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_error_errno(errno, &quot;Fail=
ed to read D-Bus services directory: %m&quot;);<br>
&gt; +-}<br>
&gt; +-<br>
&gt; +-static int link_busnames_target(const char *units) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *f, *t;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D strjoina(units, &quot;/&quot; SPEC=
IAL_BUSNAMES_TARGET);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D strjoina(arg_dest, &quot;/&quot; S=
PECIAL_BASIC_TARGET &quot;.wants/&quot; SPECIAL_BUSNAMES_TARGET);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir_parents_label(t, 0755);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (symlink(f, t) &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_e=
rror_errno(errno, &quot;Failed to create symlink %s: %m&quot;, t);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-}<br>
&gt; +-<br>
&gt; +-static int link_compatibility(const char *units) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *f, *t;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D strjoina(units, &quot;/systemd-bus=
-proxyd.socket&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D strjoina(arg_dest, &quot;/&quot; S=
PECIAL_DBUS_SOCKET);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir_parents_label(t, 0755);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (symlink(f, t) &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_e=
rror_errno(errno, &quot;Failed to create symlink %s: %m&quot;, t);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D strjoina(units, &quot;/systemd-bus=
-proxyd.socket&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D strjoina(arg_dest, &quot;/&quot; S=
PECIAL_SOCKETS_TARGET &quot;.wants/systemd-bus-proxyd.<wbr>socket&quot;);<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir_parents_label(t, 0755);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (symlink(f, t) &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_e=
rror_errno(errno, &quot;Failed to create symlink %s: %m&quot;, t);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 t =3D strjoina(arg_dest, &quot;/&quot; S=
PECIAL_DBUS_SERVICE);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (symlink(&quot;/dev/null&quot;, t) &l=
t; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_e=
rror_errno(errno, &quot;Failed to mask %s: %m&quot;, t);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +-}<br>
&gt; +-<br>
&gt; +-int main(int argc, char *argv[]) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *path, *type, *units;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r, q;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (argc &gt; 1 &amp;&amp; argc !=3D 4) =
{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error(&q=
uot;This program takes three or no arguments.&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return EXIT_=
FAILURE;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (argc &gt; 1) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg_dest =3D=
 argv[1];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg_dest_lat=
e =3D argv[3];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 log_set_target(LOG_TARGET_<wbr>SAFE);<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 log_parse_environment();<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 log_open();<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 umask(0022);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!is_kdbus_available())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br=
>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D cg_pid_get_owner_uid(0, NULL);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &gt;=3D 0) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D &qu=
ot;/usr/share/dbus-1/services&quot;;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &qu=
ot;session&quot;;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 units =3D US=
ER_DATA_UNIT_PATH;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (r =3D=3D -ENXIO) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D &qu=
ot;/usr/share/dbus-1/system-<wbr>services&quot;;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D &qu=
ot;system&quot;;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 units =3D SY=
STEM_DATA_UNIT_PATH;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_e=
rror_errno(r, &quot;Failed to determine whether we are running as user or s=
ystem instance: %m&quot;);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D parse_dbus_fragments(path, type);<=
br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: One day this should just be pu=
lled in statically from basic.target */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D link_busnames_target(units);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (q &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D q;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D link_compatibility(units);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (q &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D q;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r &lt; 0 ? EXIT_FAILURE : EXIT_SU=
CCESS;<br>
&gt; +-}<br>
&gt; +Index: git/src/login/pam_systemd.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/src/login/pam_<wbr>systemd.c<br>
&gt; ++++ git/src/login/pam_systemd.c<br>
&gt; +@@ -182,25 +182,20 @@ static int export_legacy_dbus_address(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_cleanup_free_ char *s =3D NULL;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int r =3D PAM_BUF_ERR;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_kdbus_available()) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (asprintf=
(&amp;s, KERNEL_USER_BUS_ADDRESS_FMT &quot;;&quot; UNIX_USER_BUS_ADDRESS_FM=
T, uid, runtime) &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 goto error;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: We=
 *really* should move the access() check into the<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* daem=
ons that spawn dbus-daemon, instead of forcing<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* DBUS=
_SESSION_BUS_ADDRESS=3D here. */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: We *really* should move the ac=
cess() check into the<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* daemons that spawn dbus-daemon, =
instead of forcing<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* DBUS_SESSION_BUS_ADDRESS=3D here=
. */<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D strjoi=
n(runtime, &quot;/bus&quot;, NULL);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 goto error;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D strjoin(runtime, &quot;/bus&quot;,=
 NULL);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<=
br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(s=
, F_OK) &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return PAM_SUCCESS;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(s, F_OK) &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PAM_S=
UCCESS;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D mfree(=
s);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (asprintf=
(&amp;s, UNIX_USER_BUS_ADDRESS_FMT, runtime) &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 goto error;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D mfree(s);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (asprintf(&amp;s, UNIX_USER_BUS_ADDRE=
SS_FMT, runtime) &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D pam_misc_setenv(handle, &quot=
;DBUS_SESSION_BUS_ADDRESS&quot;, s, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r !=3D PAM_SUCCESS)<br>
&gt; +Index: git/src/shared/bus-util.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/src/shared/bus-util.c<br>
&gt; ++++ git/src/shared/bus-util.c<br>
&gt; +@@ -1492,40 +1492,6 @@ int bus_path_decode_unique(const char *p<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-bool is_kdbus_wanted(void) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_free_ char *value =3D NULL;<br>
&gt; +-#ifdef ENABLE_KDBUS<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const bool configured =3D true;<br>
&gt; +-#else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 const bool configured =3D false;<br>
&gt; +-#endif<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_proc_cmdline_key(&quot;kdbus&quo=
t;, NULL) &gt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;=
<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D get_proc_cmdline_key(&quot;kdbus=
=3D&quot;, &amp;value);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt;=3D 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return confi=
gured;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return parse_boolean(value) =3D=3D 1;<br=
>
&gt; +-}<br>
&gt; +-<br>
&gt; +-bool is_kdbus_available(void) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 _cleanup_close_ int fd =3D -1;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct kdbus_cmd cmd =3D { .size =3D siz=
eof(cmd), .flags =3D KDBUS_FLAG_NEGOTIATE };<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!is_kdbus_wanted())<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false=
;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D open(&quot;/sys/fs/kdbus/control&=
quot;, O_RDWR | O_CLOEXEC | O_NONBLOCK | O_NOCTTY);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false=
;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ioctl(fd, KDBUS_CMD_BUS_MAKE, &am=
p;cmd) &gt;=3D 0;<br>
&gt; +-}<br>
&gt; +-<br>
&gt; + int bus_property_get_rlimit(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sd_bus =
*bus,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const c=
har *path,<br>
&gt; +Index: git/src/shared/bus-util.h<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/src/shared/bus-util.h<br>
&gt; ++++ git/src/shared/bus-util.h<br>
&gt; +@@ -157,7 +157,4 @@ int bus_log_create_error(int r);<br>
&gt; + int bus_path_encode_unique(sd_bus *b, const char *prefix, const char=
 *sender_id, const char *external_id, char **ret_path);<br>
&gt; + int bus_path_decode_unique(const char *path, const char *prefix, cha=
r **ret_sender, char **ret_external);<br>
&gt; +<br>
&gt; +-bool is_kdbus_wanted(void);<br>
&gt; +-bool is_kdbus_available(void);<br>
&gt; +-<br>
&gt; + int bus_property_get_rlimit(sd_bus *bus, const char *path, const cha=
r *interface, const char *property, sd_bus_message *reply, void *userdata, =
sd_bus_error *error);<br>
&gt; +Index: git/Makefile.am<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- git.orig/Makefile.am<br>
&gt; ++++ git/Makefile.am<br>
&gt; +@@ -2895,29 +2895,9 @@ systemd_gpt_auto_generator_<wbr>CFLAGS =3D \<b=
r>
&gt; + endif<br>
&gt; +<br>
&gt; + # ------------------------------<wbr>------------------------------<=
wbr>------------------<br>
&gt; +-systemgenerator_PROGRAMS +=3D=C2=A0 \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 systemd-dbus1-generator<br>
&gt; +-<br>
&gt; +-systemd_dbus1_generator_<wbr>SOURCES =3D \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 src/dbus1-generator/dbus1-<wbr>generator.c<br>
&gt; +-<br>
&gt; +-systemd_dbus1_generator_<wbr>LDADD =3D \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://libshared.la" rel=3D"noreferr=
er" target=3D"_blank">libshared.la</a><br>
&gt; +-<br>
&gt; +-dbus1-generator-install-<wbr>hook:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(AM_V_at)$(MKDIR_P) $(DESTDIR)$(usergeneratord=
ir)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(AM_V_RM)rm -f $(DESTDIR)$(usergeneratordir)/<=
wbr>systemd-dbus1-generator<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 $(AM_V_LN)lnr $(DESTDIR)$(<wbr>systemgeneratord=
ir)/systemd-<wbr>dbus1-generator $(DESTDIR)$(usergeneratordir)/<wbr>systemd=
-dbus1-generator<br>
&gt; +-<br>
&gt; +-dbus1-generator-uninstall-<wbr>hook:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 rm -f $(DESTDIR)$(usergeneratordir)/<wbr>system=
d-dbus1-generator<br>
&gt; +-<br>
&gt; + dist_xinitrc_SCRIPTS =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0xorg/50-systemd-user.sh<br>
&gt; +<br>
&gt; +-INSTALL_EXEC_HOOKS +=3D dbus1-generator-install-hook<br>
&gt; +-UNINSTALL_EXEC_HOOKS +=3D dbus1-generator-uninstall-hook<br>
&gt; +-<br>
&gt; + # ------------------------------<wbr>------------------------------<=
wbr>------------------<br>
&gt; + systemd_sysv_generator_SOURCES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0src/sysv-generator/sysv-<wbr>generator.c<b=
r>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_230.b=
b" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_230.bb</a> b/meta/reci=
pes-core/systemd/<a href=3D"http://systemd_230.bb" rel=3D"noreferrer" targe=
t=3D"_blank">sy<wbr>stemd_230.bb</a><br>
&gt; index 40f1428..f4ff860 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_230.bb" rel=
=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_230.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_230.bb" rel=
=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_230.bb</a><br>
&gt; @@ -37,6 +37,7 @@ SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://udev-re-enable-m=
ount-<wbr>propagation-for-udevd.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-7795.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://validate-user.pa=
tch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Ensure-kdbus-isn-t-<w=
br>used-3501.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI_append_libc-uclibc =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-units-Prefe=
r-<wbr>getty-to-agetty-in-console-<wbr>setup-system.patch \<br>
&gt; @@ -61,7 +62,6 @@ PACKAGECONFIG ??=3D &quot;xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0timedated \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0timesyncd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0localed \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
kdbus \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ima \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0smack \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0logind \<br>
&gt; @@ -96,7 +96,6 @@ PACKAGECONFIG[timedated] =3D &quot;--enable-timedate=
d,--disable-<wbr>timedated&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[timesyncd] =3D &quot;--enable-timesyncd,--disable-=
<wbr>timesyncd&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[localed] =3D &quot;--enable-localed,--disable-<wbr=
>localed&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[efi] =3D &quot;--enable-efi,--disable-efi&quot;<br=
>
&gt; -PACKAGECONFIG[kdbus] =3D &quot;--enable-kdbus,--disable-<wbr>kdbus&qu=
ot;<br>
&gt;=C2=A0 PACKAGECONFIG[ima] =3D &quot;--enable-ima,--disable-ima&quot;<br=
>
&gt;=C2=A0 PACKAGECONFIG[smack] =3D &quot;--enable-smack,--disable-<wbr>sma=
ck&quot;<br>
&gt;=C2=A0 # libseccomp is found in meta-security<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div><span class=3D"gmail-HOEnZb"><font color=3D"#888888">&gt; --<br=
>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div></div></div></div>

--94eb2c0033764a5747055f0d072b--
