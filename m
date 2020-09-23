Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.2459.1600884908651645636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 11:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NjBdbUy+;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: geissonator@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id m13so609607otl.9
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2020 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lpdeizygc6ZY4teeXGsSkKQulrRzv11oFjCvXhpNKOQ=;
        b=NjBdbUy+m14oqkKWNVI+oKgN3URchSb1BcsDNDWuxW1jkB8Ji0JqYxq5z+b7KkNycC
         Ay4AJblvjS+gk/jeaC87RAlQL+5UoVx6aIV1tNo1a/4mI4wUta7je8VPYrPvuwAHFowt
         scXeSFk0N/Zpa1mR+eq31EHzQoRHMHifwO1zWrg8wnTMrzdiOcA/Ui0DeQpBDA8CvYVL
         GpzctJnpqoc2mB4fjpy3rpuXybwNHhxKB7NBRyCbqtPv5jrwQ7TA6QDEi6ZJvdDV/gV3
         4I1dV37qie3hVaIVB7nQg5ZlAGjGM1/547xwhxfcXoGCt92VP+1STuuC1GPR4P0AJqdT
         1rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lpdeizygc6ZY4teeXGsSkKQulrRzv11oFjCvXhpNKOQ=;
        b=d7zmpfeFIi4+mppNrEqQ7i4iAbgtSXpn0Y7b8JOsXcXlBfPO5cHG016T8wJ+jCjV8u
         en6XptlRLJfDBW1NShclx2wowAfcKgiylI+JRAJop3Sl3AHPb66aZPaPYahl4GqJSrkA
         ush8biFYh7XF7j1MFW15iZKahJMCyRrFDQ5nbjqRIWZwW/rant/UHCz50qRfPkn0I+Uy
         NaYjwfLKYZugqUdUzPLXkC0gdhZy99el6+x2F2C6B7mkoDGZ1r7RZkfh/QMag9iCnPcd
         LLyN4r51KTdGiW3bqmEXKrBWXhlVKWEBiKpVDiNjA4U3+RbKfTSUkslaz8ZB/HK3NQgR
         oGTQ==
X-Gm-Message-State: AOAM5309aI4Ry2bOd151cqQNrRLgI0Phv0BeXci7uje7dDHnj63RL8PE
	r8hwdY2PU5PmhJTdfLFIf5N7uz1EQ+scYw==
X-Google-Smtp-Source: ABdhPJy/cp8twQSZ6NWFpIydljAC+book0Ut9jdc1syehBcSH3CZWea+cFIRybkUa+kdhOFgcU1Ohg==
X-Received: by 2002:a9d:3f06:: with SMTP id m6mr573895otc.173.1600884907439;
        Wed, 23 Sep 2020 11:15:07 -0700 (PDT)
Return-Path: <geissonator@gmail.com>
Received: from Andrews-MBP-2.attlocal.net (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
        by smtp.gmail.com with ESMTPSA id t22sm182103otq.44.2020.09.23.11.15.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2020 11:15:06 -0700 (PDT)
From: "Andrew Geissler" <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH] systemd: Upgrade v246.2 -> v246.6
Date: Wed, 23 Sep 2020 13:14:47 -0500
Message-Id: <20200923181447.31521-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0001-Use-PREFIX-ROOTPREFIX-correctly.patch was fixed fix the following:
https://github.com/systemd/systemd/pull/17009

2ee1c57c4f (tag: v246.6) kernel-install/90-loaderentry: fix when /boot is not mountpoint
a2a8802abe homed: make clean that --storage=directory --image-path=/dev/some-block-device is not supported
e1df274a76 homed: make sure our worker processes finish before we exit
f2763ff6cd nspawn: fix fd leak on failure path
6f9c8af500 nspawn: check return of setsid()
31875b3cb0 dissect: is_loop_device() returns negative on error, don't mistake that is true
418cf0e78c dissect: always invalidate secondary arch partitions if we found primary arch
1d17c00260 util: wireguard is merged into upstream kernel
48a308b76a repart: don't mark image files generated with --empty=create executable
9353607ef3 man: substitute path to rc.local in the man page
f2b9345cd2 meson: RC_LOCAL_SCRIPT_PATH_START to RC_LOCAL_PATH
b0fff9012a socket-proxy: allow localhost addresses
5e8bf33de1 sd-bus: allow localhost addresses
ad77a988f2 fstab-generator: add 'nofail' when  NFS 'bg' option is used
d08f6fddc0 busctl: add missing shortopt -l
64d58480ac socket-util: reset length argument for second getsockopt call in fd_[gs]et_rcvbuf
0046c58334 test: use pclose() for popen()
689d2e061b core: propagate unit start limit hit state to triggering path unit
2f53d690ea core: propagate triggered unit in more load states
a06cf9a5ba bootctl: handle if LoaderSystemToken is invalid for some reason
e2c0023dd2 test-fileio: test test strings with shell, too
251b96c9b5 test-env-file: add test that tests our env file read + writer + shell against each other
4d1922d8bb env-file: bring our decoding of double-quoted strings in env files in line with shell
281581cd74 test-fileio: use test strings that are actually valid in shell
366d38d8ed man: document that RemainAfterElapse=no means that also the triggered unit needs to deactivate
d0f0f048ec (tag: v246.5) sd-path: use ROOTPREFIX without suffixed slash
e662cf6d51 hashmap: make sure to initialize shared hash key atomically
da310c6b45 socket: downgrade log warnings about inability to set socket buffer sizes
ab6fcd9135 core: fix securebits setting
4f6925484d capability-util: add new function for raising setpcap
771436884d network: do not add prefix to RA if radv is not configured
fb2afc5f30 man: document the random delay of persistent timers
b2006ddc8f test-network: add test for ENOBUFS issue #17012
8758580ef5 backlight: do not claim that ID_BACKLIGHT_CLAMP= property is not set
57fc184a6c fs-util,tmpfiles: fix error handling of fchmod_opath()
db0f031e70 bootctl: don't accidentally propagate errors in "bootctl status"
3e2c806681 ethtool-util: don't pass error value that isn't used to log_syntax
b671730edb network: don't fail on various config parse errors
0ad86030c5 man: document that sd_bus_message_close_container() may only be called at end of container
f3da018017 cryptsetup: Fix null pointer dereference (#16987)
6f65eaf9c2 core: fix set keep caps for ambient capabilities
08338a234e core: fix comments on ambient capabilities
f0e6d9876d network: make log_link_error() or friends return void
35766dc61b core: make log_unit_error() or friends return void
3ed10b2ee8 core/slice: explicitly specify return value
2f6406914b udev: do not discard const qualifier
07671aa4cc sd-device: make log_device_error() or friends return void
d4bea73972 udev: explicitly specify return value
7db399be1e udev: return negative errno for invalid EVDEV_ABS_XXX= property
8c8d188e85 udev: make log_rule_error() or friends return void
4921375fd3 socket: fix copy/paste error
0f7fd97749 udev: warn if failed to set buffer size for device monitor
fc763d38d8 network: increase receive buffer size for device monitor
3bf7797f1f network: do not start device monitor if /sys is read-only
ebc0729c6a network: honor the buffer size specified in networkd.socket
ef3d2e178b core/socket: use fd_set_{rcv,snd}buf()
5dd4cc4b10 sd-device-monitor: use fd_set_rcvbuf()
fe9b92e566 util: introduce fd_set_{snd,rcv}buf()
4dcae66688 util: try to set with SO_{RCV,SND}BUFFORCE when requested size is larger than the kernel limit
4b6b523946 util: refuse to set too large value for socket buffer size
b4be8edb45 network: ignore error on increasing netlink receive buffer size
5ce47fb491 tree-wide: if get_block_device() returns zero devno, check for it in all cases
8ea6ec18e7 btrfs: if BTRFS_IOC_DEV_INFO returns /dev/root generate a friendly error message
e1ff4947d2 basic/log: make log_{info,warning,...} return void
8019995e9a tree-wide: correct cases where return log_{error,warning} is used without value
932f4c3e8b test-execute/exec-dynamicuser-statedir.service: fix quoting
16b9426f70 man: fix quickhelp listing in sysusers.d(5)
bde903d9e9 network: fix NDisc handling for the case when multiple routers exist
c965063b64 network: expose route_{hash,compare}_func()
6d24a40669 network: expose address_{hash,compare}_func()
054838a2e0 util: expose in6_addr_{hash,compare}_func()
58bd4a70de network: fixes gateway assignment through DHCPv4
8ad5382fe3 bash-completion: resolvectl: support 'log-level' command
a98bd75072 resolvectl: add 'log-level' to help message
78262fe807 core/socket: we may get ENOTCONN from socket_instantiate_service()
fecb3f00c4 homed: remember the secret even when the for_state is FIXATING_FOR_ACQUIRE
dc2e82af33 (tag: v246.4) core: create per-user inaccessible node from the service manager
0b3c497347 nspawn,pid1: pass "inaccessible" nodes from cntr mgr to pid1 payload via /run/host
2239965c29 coredump: don't convert s → µs twice
61d29b7f8c firstboot: fill empty color if ansi_color unavailable from os-release
9678a3daf6 varlink: do not parse invalid messages twice
4e516dcbc1 userdbctl: add forgotten --output mode in help
aee20dfbd8 shared/{user,group}-record-nss: adjust filtering of "valid" passwords
5933d77afe doc: cross link sd_listen_fd() docs a bit
97fdde3239 Rework how we cache mtime to figure out if units changed
0500968241 core: always try to reload not-found unit
8ae22f0d64 pid1: use the cache mtime not clock to "mark" load attempts
715507c277 core: rename manager_unit_file_maybe_loadable_from_cache()
20ad76d0a7 man: document fd ownership for sd-bus fd marshalling
38ae73fafd resolved: make sure we initialize t->answer_errno before completing the transaction
a1ba0fbef6 homed: fix log message to honor real homework path
d6b1e659b3 src/shared/dissect-image.c: fix build without blkdid (#16901)
e42f9add21 analyze: fix error handling in one case
4804ce1488 units: add missing usb-gadget.target
5ad4e68c37 man: extend on the usec/sec discrepancy
2fb612371d login/logind: Include sys/stat.h for struct stat usage
5e884e7ee0 partition/makefs: Include missing sys/file.h header
7bbc3807da network: dhcp6: logs only new address
2056429e0f Don't run test-repart when loop devices are not available
dcbea51c5a man: clarify that several networkctl commands takes device names
16e4cfcc82 networkctl: label command does not take any argument
2352921244 missing: Add new Linux capability
8b29c4a4f9 tty-ask-pw-agent: properly propagate error
f7ce2e9839 tty-ask-pw-agent: the message string might not be set
29cba5c9ef tty-ask-pw-agent: make sure "--list" works correctly
e1ce367d73 add "list" verb to autocompleted commands
1f4cb5da1e shell-completion/zsh: add missing verbs for networkctl
a4236a2764 path: Improve $PATH search directory case
b7cef386bd (tag: v246.3) path: Skip directories when finalising $PATH search
122945f315 rules: don't install 80-drivers.rules when kmod is disabled
42fab2d454 zsh: correct journalctl command completion parsing
ed3f97f962 basic/missing_syscall: fix syscall numbers for arm64 :(
ba6e7f7c46 shared/install: fix preset operations for non-service instantiated units
d39f139348 nss-resolve: treat BUS_ERROR_NO_SUCH_UNIT the same as SD_BUS_ERROR_SERVICE_UNKNOWN too
9bb3e64d71 various: treat BUS_ERROR_NO_SUCH_UNIT the same as SD_BUS_ERROR_SERVICE_UNKNOWN
6d802dd596 man: drop reference to long gone .busname unit type
a29656804b man: fix a fix of a typo in systemd.service example
21ce0f5b33 network: can: Fix CAN initialization
cab5cde8c9 man: update autogenerated dbus api lists
0d8000522b man: fix invalid tag place
ea94f218be man: add conditionals to more man pages
ef91325349 meson: add ENABLE_ANALYZE conditional
83f7c0a7ec core: add missing conditions/asserts to unit file parsing
716718155d analyze: rework condition testing
5c4c7581bc sd-bus: fix error handling on readv()
6cd058f305 user-runtime-dir: deal gracefully with missing logind properties
6a2d73638d shared/seccomp: do not use ifdef guards around textual syscall names
7355ac9689 machine-id-setup: don't use KVM or container manager supplied uuid if in chroot env
496a71f444 man: Fix typo in systemd-tmpfiles
6c5d216ad8 homework: downgrade chattr failure log message
1708f06a00 homework: explicitly close cryptsetup context, to not keep loopback device busy
a21eaa2a3a homework: correct error passed into log message
3a2d169f36 homework: sync everything to disk before we rename LUKS loopback file into place
84e1ab74d2 homed: downgrade quota message in containers
8b62cadf36 analyze-security: do not assign badness to filtered-out syscalls
29854a5437 NEWS: clarify two points
4cb4fb82f7 meson: add min version for libfdisk
76331f86f6 load-fragment: fix grammar in error messages
1e53c2d70f Fix function description in logind man page
669066564d network: do not fail if UseMTU=yes on DHCP lease lost
a2a3f16cdc missing_syscall: do not use function name that may conflict with glibc
4091dcd469 missing_syscall: fix pidfd_{send_signal,open} numbers for alpha
7875daf52b network: wait for previous address removal before configuring static addresses
120064b4a1 network: only process non-error message
f44ec1de15 test: accept that char device 0/0 can now be created witout privileges

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...0001-Use-PREFIX-ROOTPREFIX-correctly.patch | 81 -------------------
 .../{systemd_246.2.bb => systemd_246.6.bb}    |  1 -
 3 files changed, 1 insertion(+), 83 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly.patch
 rename meta/recipes-core/systemd/{systemd_246.2.bb => systemd_246.6.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index b0d4fe4033..1733565fc0 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "91b37e6f0982e1e64c63017000248d7441a83a2e"
+SRCREV = "2ee1c57c4ff4fd3349cf03c2e89fbd18ca0b3a4a"
 SRCBRANCH = "v246-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly.patch b/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly.patch
deleted file mode 100644
index c61941df91..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 2868e3b72d4ac02860e380d70c9af0d61a985790 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Sun, 16 Aug 2020 16:07:12 +0000
-Subject: [PATCH] Use PREFIX/ROOTPREFIX correctly
-
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-status: Pending [https://github.com/systemd/systemd/issues/16773]
----
- meson.build                      | 1 +
- src/core/systemd.pc.in           | 8 ++++----
- src/libsystemd/sd-path/sd-path.c | 8 ++++----
- 3 files changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index dbbddb68e232..18618dba0623 100644
---- a/meson.build
-+++ b/meson.build
-@@ -226,6 +226,7 @@ conf.set_quoted('SYSTEMD_SHUTDOWN_BINARY_PATH',               join_paths(rootlib
- conf.set_quoted('SYSTEMCTL_BINARY_PATH',                      join_paths(rootbindir, 'systemctl'))
- conf.set_quoted('SYSTEMD_TTY_ASK_PASSWORD_AGENT_BINARY_PATH', join_paths(rootbindir, 'systemd-tty-ask-password-agent'))
- conf.set_quoted('SYSTEMD_STDIO_BRIDGE_BINARY_PATH',           join_paths(bindir, 'systemd-stdio-bridge'))
-+conf.set_quoted('PREFIX',                                     prefixdir)
- conf.set_quoted('ROOTPREFIX',                                 rootprefixdir)
- conf.set_quoted('RANDOM_SEED_DIR',                            randomseeddir)
- conf.set_quoted('RANDOM_SEED',                                join_paths(randomseeddir, 'random-seed'))
-diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
-index 8424837824b5..410a126317ad 100644
---- a/src/core/systemd.pc.in
-+++ b/src/core/systemd.pc.in
-@@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_dir}
- tmpfiles_dir=${prefix}/lib/tmpfiles.d
- tmpfilesdir=${tmpfiles_dir}
- 
--sysusers_dir=${rootprefix}/lib/sysusers.d
-+sysusers_dir=${prefix}/lib/sysusers.d
- sysusersdir=${sysusers_dir}
- 
--sysctl_dir=${rootprefix}/lib/sysctl.d
-+sysctl_dir=${prefix}/lib/sysctl.d
- sysctldir=${sysctl_dir}
- 
--binfmt_dir=${rootprefix}/lib/binfmt.d
-+binfmt_dir=${prefix}/lib/binfmt.d
- binfmtdir=${binfmt_dir}
- 
--modules_load_dir=${rootprefix}/lib/modules-load.d
-+modules_load_dir=${prefix}/lib/modules-load.d
- modulesloaddir=${modules_load_dir}
- 
- catalog_dir=${prefix}/lib/systemd/catalog
-diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-path.c
-index 736795d1d797..3572916dc073 100644
---- a/src/libsystemd/sd-path/sd-path.c
-+++ b/src/libsystemd/sd-path/sd-path.c
-@@ -371,19 +371,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
-                 return 0;
- 
-         case SD_PATH_SYSUSERS:
--                *ret = ROOTPREFIX "/lib/sysusers.d";
-+                *ret = PREFIX "/lib/sysusers.d";
-                 return 0;
- 
-         case SD_PATH_SYSCTL:
--                *ret = ROOTPREFIX "/lib/sysctl.d";
-+                *ret = PREFIX "/lib/sysctl.d";
-                 return 0;
- 
-         case SD_PATH_BINFMT:
--                *ret = ROOTPREFIX "/lib/binfmt.d";
-+                *ret = PREFIX "/lib/binfmt.d";
-                 return 0;
- 
-         case SD_PATH_MODULES_LOAD:
--                *ret = ROOTPREFIX "/lib/modules-load.d";
-+                *ret = PREFIX "/lib/modules-load.d";
-                 return 0;
- 
-         case SD_PATH_CATALOG:
--- 
-2.17.1
-
diff --git a/meta/recipes-core/systemd/systemd_246.2.bb b/meta/recipes-core/systemd/systemd_246.6.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_246.2.bb
rename to meta/recipes-core/systemd/systemd_246.6.bb
index af10e4212b..0167346522 100644
--- a/meta/recipes-core/systemd/systemd_246.2.bb
+++ b/meta/recipes-core/systemd/systemd_246.6.bb
@@ -20,7 +20,6 @@ SRC_URI += "file://touchscreen.rules \
            file://99-default.preset \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
-           file://0001-Use-PREFIX-ROOTPREFIX-correctly.patch \
            "
 
 # patches needed by musl
-- 
2.24.3 (Apple Git-128)

