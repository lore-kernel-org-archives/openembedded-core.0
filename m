Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D478C46467
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:56 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.70844.1669472151910294466
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=L5F8F2O2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id b4so6464094pfb.9
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtK5vquvsq7QGQLs4XJFXkFfMDJOi9W27IkccbtwWjE=;
        b=L5F8F2O2+NfcpHi8E+ZPDn9wN6Di174W1k7Matw55vArRECYR/Kei0XPyj8+sIvMnh
         1WNPMvGIIDcwVG0DR/Ca4s8XXQj9Te1kjM8up8VaTuXqaqcL7vJxxT/VwHHvULSK1mmE
         3eOP/GDmcXHFiSzKaDJXgq17Fz7Y10IcoaW1jzoYlAo9OYsbt+4ZWbKMCLaHIYeAbUBc
         oO78c41nGbfoWNT648GTzQKlijuGo/aH1jx4GIVptsS7SiL+Q3kccCzQ8Q5X72H11LJj
         Nwnaic90ofOUWzaMOHUalyZMCAGVCT/URe9/O9uB4hEtd1O2K+zCLohvLXub3yWGOo1N
         GsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtK5vquvsq7QGQLs4XJFXkFfMDJOi9W27IkccbtwWjE=;
        b=0RtVgHDVxoUGUe5rwwdodCfg5S5iNElxg2+KUaPL+0+Oo9ZWc+IouSNQYhzhdXEQio
         QZPZAPoJ5v7o0Tfc5vt8vUElG5EbX46XWvCVDxkJ70JnliZz1SN1lk+lbqHOV7iYA6tO
         PrUfLMbrUjnKY1oCe1nW4HvLZkmXuSEMgman32wLP4B9VLT+6yd6NmNGWnTfZCpRbwd1
         PG2nO9iMx3SWjKdYcHFXPf8emjwndkk4IcRh6R4R0QQruomHDp3ZqJSmLKyuGmeg3S8Y
         zOBtGo/fa2cvEgPzBBMRgF/PTFO7QdaJQLh8y0ZP03tVkoTWPmU1S++qYUku8+r4LtPw
         pqsQ==
X-Gm-Message-State: ANoB5pmvX5Lm0g494vtNoCQ1RxgGSxAtH6rjeCxEb9EJoyENNN0zmNQv
	c15n2gCX0Sk022/ilq0uhwsFUlutib+zOcBB7so=
X-Google-Smtp-Source: AA0mqf40snWpLn3TUS6bAmgmAbH0HYwqbC1LCY/qLQlU2PYQEK0LkpoHTHW7dDAGFOKM6IoiodSA7g==
X-Received: by 2002:a05:6a00:21c8:b0:562:e0fb:3c79 with SMTP id t8-20020a056a0021c800b00562e0fb3c79mr23508800pfj.39.1669472150637;
        Sat, 26 Nov 2022 06:15:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/37] systemd: update 251.4 -> 251.8
Date: Sat, 26 Nov 2022 04:14:25 -1000
Message-Id: <52d8f9211586156f2bb7534087dea79f1ebff542.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173814

From: Alexander Kanavin <alex.kanavin@gmail.com>

Update to latest stable release

Changes:

ae8b249af4 (HEAD -> v251-stable, tag: v251.8) test: fstab-generator: adjust PATH for fsck
03514a9f64 man: add note that network-generator is not a generator
8c8a423821 condition: Check that subsystem is enabled in ConditionSecurity=tpm2
9243b88b55 test: wait for loop device to be removed
f5c2be99bc test: wait for the lodev to get properly initialized
8cfe979030 test: disable LSan in the ASan env wrapper
db00a62be8 test: introduce a simple environment file for test service
fd082f335e test: lower the # of mpath devices to 16
d17a45340b test: make TEST-64 a bit more ASan friendly
a51cc9e578 test: don't wrap binaries built with ASan
e176dca593 test: drop all LD_PRELOAD-related ASan workarounds
9fba4cdf61 test: set $ASAN_RT_PATH along with $LD_PRELOAD to the ASan runtime DSO
4fbf69fd1b semaphore: remove the Semaphore repositories recursively
6258394c1e test: wrap `ls` and `stat` to make it work w/ sanitizers in specific cases
db14b371df test: create an ASan wrapper for `getent` and `su`
1027d3d633 test: always wrap useradd/userdel when running w/ ASan
65ab7b0950 Revert "Support -D_FORTIFY_SOURCE=3 by using __builtin_dynamic_object_size."
f994276068 test: make TEST-63 more reliable on slower machines
68b4f10f82 test: use PBKDF2 with capped iterations instead of Argon2
1f32ec761c hashmap: use assert_se() to make clang happy
94a25aa6d5 coredump: drop an unused variable
5f09fa4d5e network: drop an unused variable
a29ddb989b machine: drop an unused variable
9a71cd3bf6 sd-journal: drop an unused variable
ae0537f18f ci: reenable validation of GH Actions files
6e92f64ca4 ci: temporarily disable validation of GH Action files
6cd1b11d02 cryptsetup: fix build with -Db_ndebug=true
0ab5e9fe98 test: wrap binaries using systemd DSOs when running w/ ASan
6d4ae5a7cd test: make the virt detection quiet
024ee3def9 test: check for other hypervisors as well
520be40734 test-mountpoint-util: support running on a mount namespace with another mount on /proc
2cd4aed358 test-mountpoint-util: use log_info()
c7b66dbe2a test-mountpoint-util: fix NULL arg to %s
4e49c726ad test: drop redundant log message
b57ef0c672 build(deps): bump meson from 0.63.2 to 0.63.3 in /.github/workflows
8c80564405 build(deps): bump ninja from 1.10.2.3 to 1.10.2.4 in /.github/workflows
70e90da84b build(deps): bump meson from 0.63.1 to 0.63.2 in /.github/workflows
489c00dee5 build(deps): bump meson from 0.63.0 to 0.63.1 in /.github/workflows
08e85ad43d build(deps): bump meson from 0.62.2 to 0.63.0 in /.github/workflows
b0619c9c55 build(deps): bump meson from 0.62.0 to 0.62.2 in /.github/workflows
d982169592 build(deps): bump systemd/mkosi
9d4af5fea1 mkosi: libbpf0 -> libbpf1
3abf9f08f1 mkosi: Switch to Fedora 37
18f9fbab08 mkosi: update to latest commit
5403b727a7 mkosi: Use SourceFileTransfer=mount
9744c04ffd mkosi: Drop kernel-modules-extra from Fedora config
ab2f7a9b9e mkosi: install fdisk for test-loop-block
17acdca99d mkosi: Set ExtraSearchPaths=build/ by default
420e782904 mkosi: update to latest commit
43ef15c752 mkosi: add back packages removed from OpenSUSE build
9a94aa1d88 mkosi: disable isc-dhcp-server again
d1785c462f mkosi: Ensure we build all features/components in mkosi
6712396da3 meson: Downgrade efi-ld warning
66309ee674 ci: Add mold to build tests
86c25ca937 ci: build with clang-15; drop clang-12
28457b030e mkosi: Drop workarounds
abecb21561 mkosi: Update to latest commit
d9eaf39930 mkosi: Update to latest commit
619b36b22c mkosi: Don't use InstallDirectory by default
cdf3fd312a mkosi: Use mkosi.output/ as output directory by default
b8a746e89b mkosi: Add package libfdisk to Ubuntu dependencies (#24211)
0e518f3639 ci: set a timeout for each mkosi stage
5e79cf977c mkosi: Update to latest
edef8edf0b mkosi: Update to latest commit
a0402d3ab6 mkosi: Update to latest commit
081168fa19 mkosi: Build against Fedora rawhide as well
a38a0504ec mkosi: Remove usage of deprecated option names/sections
47404f1802 mkosi: Changes to allow booting with sanitizers in mkosi
db1281e12e mkosi: Update Ubuntu config to 22.04
ca8dc691fe mkosi: Install xxd in images
f12a6945c6 ci: limit which env variables we pass through `sudo`
7e24ac6d77 mkosi: update to latest main
a46ba01e79 mkosi: Update to latest release
7ef1d71895 mkosi: Pull in fix that solves action mirror issue
d3d90ae66b mkosi: Update CI to mkosi 13
9bf797be2c ci: build systemd with clang with -Dmode=release --optimization=2
9e88b3a5e1 ci: bump gcc in the "build test" workflow
dcbc64db61 ci: prefer the distro llvm version if available
ccd81889d4 ci: bump GH Actions to Ubuntu Jammy where applicable
b8fbf21526 kernel-install/90-loaderentry: do not add multiple systemd.machine_id options
fe5e692bfc tests: minor simplification in test-execute
a94fe70bbe tests: make test-execute pass on openSUSE
4a65c1674b firstboot: fix segfault when --locale-messages= is passed without --locale=
c3b22515b9 test: introduce sanity coverage for auxiliary utils
c61e4377d7 udev: add safe guard for setting by-id symlink
2f4fdaaecc udev: drop redundant call of usb_id and assignment of ID_USB_INTERFACE_NUM
491924940f udev: first set properties based on usb subsystem
293c006789 test: further extend systemctl's sanity coverage
f48e6576a2 test: add a couple of sanity tests for systemctl
3d5e379808 test: rename TEST-26-SETENV to TEST-26-SYSTEMCTL
a34afc4197 namespace: Add hidepid/subset support check
2ac138a5b6 coverage: Mark _coverage__exit as noreturn
9952c228a9 parse_hwdb: allow negative value for EVDEV_ABS_ properties
7b6fa1d3e6 test: add a couple of sanity tests for journalctl
cf21555d6d sd-device-monitor: dynamically allocate receive buffer
ee42e84968 man: use the correct 'Markers' property name for marking units
45090f3418 core: fix memleak in GetUnitFileLinks method
7eefd2fbb7 network: forcibly reconfigure all interfaces after sleep
66fa6110ba resolved: fix typo in feature level table
2f8f1d9e4a network: skip to reassign master ifindex if already set
d94f197818 resolved: fix copypasta in resolved varlink API
b61fcaca1b udev: always create device symlinks for USB disks
6fc2f387af man: Add documentation for AssertCredential= (#25178)
c339e8d71b man: document reboot --poweroff exception
91b8491e97 network: allow 0 for table number
3f94f03389 network: Table= also accepts table name
bdd84e82e5 analyze: add --image= + --root= to --help text
23d66a03de meson: Fix build with --optimization=plain
98a45608c4 manager: allow transient units to have drop-ins
228cd82d2c manager: reformat boolean expression in unit_is_pristine()
06dc900efa (tag: v251.7) network/bridge: fix UseBPDU= and AllowPortToBeRoot=
b0972e4df0 homed: properly initialize all return params
d61ccd0252 meson: always use libatomic if found
833ad5f950 Revert "Fix issue with system time set back (#24131)"
73d1dc665b bash-completion: add systemd-dissect support
d89e9993d2 dissect: add missing --umount to the help output
087cbfd936 coredump: avoid deadlock when passing processed backtrace data
ab587aaf8e shared/json: use different return code for empty input
219272f7b2 shared/json: allow json_variant_dump() to return an error
d1066f33b5 man: document restrictions on naming interfaces
e2a07cdac6 qrcode-util: Add support for libqrencode 3.0
8be601f7ef seccomp: add riscv_flush_icache to allow list
3028e05955 (tag: v251.6) logind: fix getting property OnExternalPower via D-Bus
5da595db39 shared/condition: avoid nss lookup in PID1
40053e60f5 test: add more tests for StateDirectory= with DynamicUser=
0ba2e4bb69 core: do not create symlink to private directory if parent already exists
1de3cb97ee core: make exec_directory_add() extends existing symlinks
d7b83b9986 sd-ndisc: ignore failure in sending solicitation
e0ba044985 analyze: add forgotten return statement
40742ac74f basic/log: include the log syntax callback in the errno protection block
3e38c39600 logind: do not emit beep in wall messages
bf13ffec59 udev: drop assertion which is always false
78a8e938e4 man/shutdown: document how to switch to single-user mode
9de8a5d5d0 libbpf: add compat helpers for libbpf down to 0.1.0
9d5d267ab3 Try to load libbpf.so.1 as well
8cc2387b03 libbpf: Remove use of deprecated APIs
4abc5b2cfe repart: always honour `--discard=no`
b3d5724bfc ata_id: Fixed getting Response Code from SCSI Sense Data (#24921)
e91ea65aba resolve: unsupported DNSSEC algorithms are considered INSECURE; not BOGUS
73db7d9932 generator: skip fsck if fsck command is missing
80dc4425db udevadm: do not try to find device unit when a path like string is provided
7add2f21f1 resolved: don't access sshfp fields from tlsa printer
9d9a970ad7 resolved: fix parameter reuse in DNS_ANSWER_FOREACH_ITEM() iterator macro
913d22cf8d kernel-install: do not fail if $layout is not "bls"
25facc6e7f units: udev: partially emulate ProtectClock=
2e6e0498aa nspawn: fix two error strings
5befffa69a xdg-autostart-service: expand tilde in Exec lines
4cb75191c4 fix typo in log
738eca5e05 meson: add libatomic dependency
c40fa78968 xdg-autostart-service: Use common boolean parser
654ae8c1e4 (tag: v251.5) base-filesystem.c: add trailing zero byte for s390x entry
e4a19eef33 basic/missing_loop.h: fix missing lo_flags LO_FLAGS_DIRECT_IO
24238be484 mount-util: fix error code
1b1ad8c79f udev: certainly restart event for previously locked device
7dacfb3fb4 stub: Use EfiLoaderCode for kernel memory
eaeaf4f6ef network: do not silently stop to process configuration on activation failure
bb803856bc bus: use inline trace argument for ANONYMOUS auth
6349062326 Fix ObjectManager interface emitted for non-manager objects
c90ab07fa0 test-bus-objects: Test interfaces added/removed signal interfaces
e32fe1b457 Fix GetManagedObjects returning ObjectManager interface for non-manager objects
efd8e39f4a test-bus-objects: Test GetManagedObjects interfaces are correct
344efd022a coredump: when parsing json, optionally copy the string first
de08edca17 systemctl: color ignored exit status in yellow, not red
1531a496e3 manager: make clear internal Dump() logic is debugging only.
c4fd38f7d2 man: document the Dump() calls of the PID 1 D-Bus interface, and what they are
140fee4627 resolve: do not cache mDNS goodbye packet
1a2d93a770 kbd-model-map: correct variants for cz-qwerty to include comma
9d1ebb2247 resolve: persist DNSOverTLS configuration in state file
3137ac6ef5 udev: support by-path devlink for multipath nvme block devices
c948091cc5 run: make --working-directory= work for --scope too
7bb204620d kbd-model-map: add a mapping for switched czech qwerty/us
e5157050d1 test: add more test cases for mkdir_p_safe() and mkdir_p_root()
b3a9f7b5cb mkdir: chase_symlinks_and_stat() does not return 0
0bfdc91807 units: make sure that initrd-switch-root.service pulls in .target
45fb64c54b units: add dependency ordering for emergency.service conflicts
6535813084 units: add ordering dependencies on initrd-switch-root.target
09c90224f1 units/systemd-network-generator.service: add forgotten ordering for shutdown
1dd723a3b8 units: reorder/split unit dependency blocks
054cad0097 man: explicitly document that "reboot -f" is different from "systemctl reboot -f"
c5b0ae86b1 watchdog: use /dev/watchdog0 only if it exists
ac805eac15 journalctl: respect --quiet flag during file concistency verification
c1d729795d xdg-autostart-service: expand tilde in Exec lines
35c5f5d688 unit: drop ProtectClock=yes from systemd-udevd.service
175ba30cf6 busctl: Fix warning about invaild introspection data
6c7b91372d udev/rules,hwdb: filter out mostly meaningless default strings
8b89e677e9 units: prolong the stop timeout for homed
202a79e7c5 homed: don't wait indefinitely for workers on exit
44660d2e12 man: fix static bridge example
e0dde8a14f log: don't attempt to duplicate closed fd
254b77e73c condition: fix device-tree firmware path
96da39ddb1 udev-util: minor cleanups for on_ac_power()
3345520512 docs: fix incorrect env var name for credentials directory
49f9fa87b2 shell-completion: drop unused $mode
1e29d934de oomd: fix off-by-one when dumping kill candidates
b00cb050c8 on-ac-power: ignore devices with scope==Device
9886011356 on-ac-power: rework logic
1fc74d251e sd-device: add helper to read a unsigned int attribute
6d4c138534 shared/udev-util: say "ignoring device", not "ignoring"
cd2fad2300 virt: Support detection of Apple Virtualization.framework guests
6e47e75c86 virt: align tables
951e99231e check-os-release.py compatible with Python < 3.8
d572a74163 core/mount: adjust deserialized state based on /proc/self/mountinfo
2e372afc35 Allow uneven length BootXXXX variables
8ad143e684 gpt: fix native uuids for s390x
2bb9a0a29b udev: fix inversed inequality for timeout of retrying event
cf67d5ed1b bash-completion: add systemd-sysext support
ada437cfb1 sysext: add missing COMMAND to the help output and man synopsis
58bc1e8e04 hostname: make chassis type actually obtained from ACPI when nothing from DMI
4ffde70981 booctl: do not say uuids differ if one of the uuids is unset
5219a99ccb bash-completion: autocomplete cgroup names in systemd-cgtop
9f2f391153 sysusers: add fsync for passwd (#24324)
c966377c51 dhcp6: do not append ORO option when no option requested
97474b03e7 dhcp6: gracefully handle NoBinding error
c67a388aef udev/cdrom_id: check last track info
52c631b02e firstboot: fix can't overwrite timezone
f279a6f4d1 cryptenroll: fix memory leak
66b060225d sd-device-enumerator: drop noisy log messages
6e1acfe818 sd-device-monitor: actually refuse to send invalid devices
81339c45e8 sd-device-monitor: fix inversed condition
1760559918 resolvctl: only remove protocol after last dot when mangling ifname for resolvconf
a3348ba748 oom: drop invalid %m in the log message
b3dd66f32b meson: Test correct efi linker for supported args
f9d936b865 sysusers: properly process user entries with an explicit GID
ec5a46ca34 sysusers: only check whether the requested GID is available
037b1a8acc dhcp: fix potential buffer overflow
ed2955f8fe udev-util: assume system is running on AC power when no battery found
37b54927d3 Fix issue with system time set back (#24131)
4fdca1ab9e shared/generator: Ensure growfs unit runs after repart
32f9d70f8b manager: optionally, do a full preset on first boot

This resolves systemd-boot fails with latest meson,
while systemd -> 252 is being prepared.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1d96287906f66ad28e50c9686eaffc2fb7b874fe)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/{systemd-boot_251.4.bb => systemd-boot_251.8.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_251.4.bb => systemd_251.8.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_251.4.bb => systemd-boot_251.8.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_251.4.bb => systemd_251.8.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_251.4.bb b/meta/recipes-core/systemd/systemd-boot_251.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_251.4.bb
rename to meta/recipes-core/systemd/systemd-boot_251.8.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 71eb93f23a..3bb6b0efe6 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2a674b4b66af1a050a0362b646d2fca90c90112e"
+SRCREV = "ae8b249af4acb055f920134f2ac584c4cbc86e3b"
 SRCBRANCH = "v251-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_251.8.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_251.4.bb
rename to meta/recipes-core/systemd/systemd_251.8.bb
-- 
2.25.1


