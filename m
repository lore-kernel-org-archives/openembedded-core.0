Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F0CC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 05:43:02 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13273.1784871781708461451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 22:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A0UCSghI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ILv1WY4j;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f92a6016a-8093dd1a-b0f4-418f-9c31-d665011f1e21-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784871780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rd12aWP7nYzdIf79QEAIEngADpiE28xO5NYIEvaT7mg=;
	b=A0UCSghI6ozkzozAYtsUtil/eTah2Er8s0EC8Z9qIBIIgaqnbqMiytwpI8+L2f0o
	ifITVLVX510Y8i0+9YIba5fTn4wN8epBrvMtkgQLvdEm0JF9DSOPO0FmGeeDqfhrnFe
	VQLeL90JhTqu1u8Io8pS4LtEAoZgOvQ7HtIpASoE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784871780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rd12aWP7nYzdIf79QEAIEngADpiE28xO5NYIEvaT7mg=;
	b=ILv1WY4jSTngvrBUwS7kMoiJ2US0SquAHQaXIwjHNWHbLNpO6Fd+BvLkqOzTvIFC
	VdzIiEZoCIrvfNrptSOJgoy5M17EBjS4ziZCvazJbEk4pr1n+MrH/NLxrvdYfAPjq/S
	IllaL9eGBrAJ8SUknhAYSAbv+WcsUaJh2mCfdyDA=
Content-Type: multipart/mixed; boundary="===============8292345706394973679=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>, 
	Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot,systemd-boot-native,systemd,systemd-tools-native:
 upgrading to 261.2,261.2,261.2,261.2 FAILED
Message-ID: <0101019f92a6016a-8093dd1a-b0f4-418f-9c31-d665011f1e21-000000@us-west-2.amazonses.com>
Date: Fri, 24 Jul 2026 05:43:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.24-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 05:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241890

--===============8292345706394973679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-boot,systemd-boot-native,systemd,systemd-tools-native* to *261.2,261.2,261.2,261.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe systemd-tools-native failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1981 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (953 cached, 3 parsed). 1984 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-9d89b3b802bab144afa30e03b0411ae58232ef11"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9d89b3b802bab144afa30e03b0411ae58232ef11"
meta-yocto-bsp       
meta-poky            = "master:e4690557fb0fffcb5e9a86d1c1ebc550bb0da090"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
done.
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 4925d9f07fc697efccd98a93046ff535b8832445
WARNING: Command 'git rebase 4925d9f07fc697efccd98a93046ff535b8832445' failed:
Auto-merging src/shared/hwdb-util.c
CONFLICT (content): Merge conflict in src/shared/hwdb-util.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/systemd-tools-native
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/systemd-tools-native/systemd-tools-native_261.2.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/systemd-tools-native.txt



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8292345706394973679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-boot-changelog.txt"

Changelog for systemd-boot: 261.1 -> 261.2

4925d9f07f meson: bump version to 261.2
70cc4f3d72 escape: reject UTF-16 surrogates in \u escapes in cunescape_one() (#43079)
a7bce5b205 homed: verify privileged worker changes
f62b9ce4ed man: document that ExitType=cgroup is rejected for Type=oneshot
24ca862cf7 man: update the sample glib/sd-event integration
28c374ef1c man: document unlocked as default IMDS network mode
1192084871 sd-device: allow non-safe characters in uevent files
dbfd5d2789 hwdb: classify PlayStation controller audio as controller form-factor
41932924a4 hwdb: strip the root from filenames when generating hwdb.bin
089099b924 man/network: fix default value for RequiredFamilyForOnline=
ff395a8c2a hwdb: add debug logging for the output filename
26f3717e27 core/dbus: do not block the manager on GetId during bus (re-)connection
dc225cc553 boot: cover BCD offsets past the buffer
d8cdc4ee79 password-quality-util-passwdqc: restore password-quality-util.h include
598273bb05 systemd-imds-generator: fix import docs
b9a65cb1ba creds: reject empty validity intervals
5158952f96 dissect: include image size in JSON output
d4ea8a3061 repart: skip generated files during dry runs
eeb244e82c firstboot: validate root shell credentials
431c436a53 sysusers: validate shell credentials
d3ebe51c6a docs: clarify scope of portable services
c6fc821265 repart: fix varlink description string
484aee1528 network: silence false warning about unitialized variable
ef3e2271bd id128: reject app-specific IDs for new
2edfcce6b0 rm-rf: downgrade root check log when directory doesn't exist
caa3df83b3 rm-rf: use faccessat instead of fstatat
180baee67d repart: log allocation failure at debug level in Varlink service mode
b83eac6ac0 repart: report the actual block device size in currentSizeBytes
a315a8afca portable: honor --force for directory extensions
0e4bb54915 portabled: apply pool limits to portable images
bcc187363a portablectl: normalize set-limit image paths
bf5bf89bd4 portablectl: normalize remove image paths
81e6878669 portable: keep unit symlinks inside the image
4f7c9b77ae portablectl: normalize read-only image paths
e67b1bfaf5 portablectl: keep inspect --force unit metadata
b05d2790a2 hwdb: update to main@{2026-07-17}
b456963bec obs: disable Tumbleweed too
43c416bcd6 units: properly wait for swtpm to finish before the initrd transition
b2f01dfed1 units: harden systemd-tpm2-swtpm.service
a4badd74aa tpm2: stop the software TPM before the ESP is unmounted on shutdown
160d4f1259 tree-wide: get rid of backslashes in file names
8467a27870 nspawn: use chase() for creating dev nodes
c889bcb737 nspawn: log at error level before exiting if parsing OCI fails
fe3dbfdf7f boot: fix MEMMAP_DEVICE_PATH EndingAddress field calculation
870d718006 Rebased and reapplied the fix, dropped the test case.
7aa2da940f discover-image: don't ignore symlinks to raw images
d392d17143 homed: fix verification of local identity file
eb24d74627 machined: Allow user ids in open_shell for machine-dbus
c6138ffbdc udev-util: bound leading whitespace skip in udev_replace_whitespace
f4c528cb06 string-util: add strnspn()
f767359875 sysext: validate work directory metadata before removal
4529bb61d9 shift-uid: close consumed directory fds on early return
9033eae9af rm-rf: fail closed when the root check fails
c63b37c0f0 vconsole: reject empty layout during keymap conversion with error
fd01077f17 resolved: preserve unchanged question on asymmetric redirect
350d79015d journal-remote: zero-initialize MHD daemon wrapper
bd45f60193 journal-remote: remove disabled compression entry before freeing
91796f82de network: cancel netlink calls for detached requests
edd08edfe2 network: compare all multipath route nexthops
742bdbb0ea tpm2-util: keep the measurement log's torn-write marker intact
170dab0fe9 journalctl: reject field listing with filters
5e150d2eb5 test: make NSS IPv4 tuple bounds explicit
17dfd608f5 oci-util: Don't fall back to default registry for explicit registries
92ea6ed698 boot: guard missing Windows auto entry
19ce494c58 journalctl: use root machine ID for namespaces
5ab9b61004 tpm2-util: initialize NvPCRs on first extension
6f10261eef sd-dhcp-relay: fix off-by-one when discarding BOOTREQUEST messages by hops count
56958bd945 boot: downgrade EFI_MEMORY_ATTRIBUTE_PROTOCOL warning
fdd3966f56 sysupdate: use strverscmp_improved() like everywhere else
2c219d2f09 timedatectl: display RTCTimeUSec in UTC format
aa10c21092 network: do not use assert() on a call with side effects
8e10f5f229 dissect-image: don't assert() on partition geometry from blkid
20140670a5 homework-luks: add new key slots before destroying old ones
ff4298e73b pull-oci: switch assert() to assert_se() for set_remove() call
b5c0959d45 copy: avoid following fifo/node chmod target
cb25da37eb log: add upper bound to journal iovec accounting
a09c3c523d string-util: add upper bound to ellipsize_mem UTF-8 walks
c8e6b02ce6 test: Remove a redundant exit call
ddc90bf66c sysupdate: Downgrade an info to a debug log message
c8dabc7a90 man: update gpt-auto-generator ESP mounting behavior
b8a1d98873 repart: Properly pre-calculate auto size of images
2d75ade520 id128: honor json output for single ids
c3ce4a403d boot: allow BCD fields to end at buffer limit
e42a4b8be7 portablectl: retry inspect with PORTABLE_PREFIXES
1b23cedff3 string-util: introduce STRING_FILENAME_PART flag for string_is_safe()
87983793db string-util: add STRING_DISALLOW_WHITESPACE for string_is_safe
14648c131e dns-answer: preserve shared aliases when removing records
faa89f2c7d resolved: roll back partial DNS zone publication
856f2c88b7 man: clarify that --when= is a lower bound, not a condition
72816231de boot: skip boot counter logic for entries marked read-only
848532980f boot-secret: don't initialize secret mixin file if marked read-only
4c27b10f7f boot: skip random seed handling if seed file is marked read-only
eab3959fee run: reject waiting for remain-after-exit services
cdc7b3c086 run: reject JSON output with verbose logs
c6750b6267 run: reject JSON output in scope mode
1e4abaa22c run: reject JSON output for trigger units
53947cf5a3 run: reject JSON output with stdio forwarding
abe01e1a8c run: accept explicit trigger unit names
2e5787eb75 run: reject --ignore-failure in scope mode
3e93ac6e17 run: honor --no-block for trigger units
8f4aa23791 repart: Fix growing the partition preceding a FreeArea from leftover space
6a2db11e2e timer: avoid re-arming WakeSystem=yes timer after suspend
61ed8f7147 resolved: publish browsed service after initialization
49f3d283fd libudev: replace unique list entries in place
48161d0f85 udev/net: reset the config list head in link_configs_free()
3c0f875c76 repart: Don't copy trailing padding when using --copy-from=
377c4e1001 repart: Clarify and test that --copy-from= argument respects grain size
293e44cb09 repart: Don't get old grain size from fdisk for --copy-from=
15b672e8a5 udevadm-trigger: reject invalid wait-daemon timeout
461c203676 udev-config: merge configured children max
af2e46c389 man/udevadm: update device-id-of-file arguments
c9c847e23d udevadm-settle: reject positional arguments
feb767cb60 udevadm-wait: let --removed override initialization
400b796c81 udevadm-info: allow valueless attr filters
ac6eb48563 udev: avoid reading before empty capability masks
32fc32a92f test: TEST-89: assert ifindex=0 browse does not flap
72cb20049e ci: check 'update-man-rules' to ensure it is not forgotten
e445b27491 resolved: fix spurious BrowseServices add/remove flapping with ifindex=0
8ac83d4f6c nss-myhostname: keep IPv6 probe result stable
a6bd0815f5 creds: tolerate TPM2 seal failure in auto mode
af1a5b4566 ndisc: reject non-zero ICMPv6 codes in parsers
9d34967b4f pull-oci: verify redirected manifest digest
69a4065ae0 efivars: fix concurrent growth read accounting
ebbad7adc9 network: do not regenerate MAC address if already set by userspace
5e1295cb08 obs: explicitly disable Ubuntu/i586 builds
f1c1f93118 udev: require exact builtin command matches
a7ca71c5a4 include: add hwcaps missing from glibc and musl
7bb32fdcee nspawn-oci: match the spec-correct "swappiness" memory field key
7ac32985fe udevadm-info: handle missing data db cleanup
1da0209142 udevadm-control: reject oversized children-max
eca88a543b udev-rules: drop truncated import output line
76f014a083 udevadm-hwdb: honor root when querying
ab9695a0b1 udev-rules: accept cvm CONST matches
5df1e9d9f4 import: drop redundant oci-util.c from sources
735ac821c8 dns-configuration: make dns_scope_free() static
f36fa3cd91 creds: Use ERRNO_IS_NEG_TPM2_UNSEAL_BAD_PCR
a5231d9ace cryptsetup: Give NV index missing its own error code
5713f1e55e cryptsetup: Skip tokens with JSON parsing errors
e8660577a4 cryptsetup: Reduce log level for TPM mismatches
9ccec8367c cryptsetup: Remap bad PCR set early to EPERM
70eb48e1a4 TEST-70-TPM2.cryptsetup: Make sure we iterate over foreign tokens
2424b89f5e tpm2-util: Also report EREMOTE if key is for different parent template
6ff4b985ac tpm2-util: For NV index errors report EREMOTE to be able to continue
793efd3553 tpm2-util: Align tpm2_import with tpm2_load to report on foreign keys
96cc8eecb7 cryptsetup/cryptenroll: Iterate over TPM tokens when they don't match
4d229c8d85 cryptsetup: Report mismatching TPM token error separately
0bd3d0c2e2 stub: Set up all detected consoles
a047e14bc8 mount-util/sysext: Clone sub mounts as private to preserve nested ones
2d4b465561 mount-util: Compact list of sub mounts after dropping
434d6e0274 core: make `/run/systemd/first-boot` available earlier
df771b177b sysupdate: handle slashes after pattern fields
43a450377b tree-wide: fix some double word errors like "the the"
3b3b4692a8 core: connect to sockets in credential directories
42060d2c30 pcrlock: handle piped PE input
2073a33f0d dissect: do not follow copy-to directory symlinks
86931d2563 stub: Prefer graphical console over virtio detection heuristic
94d7796aef logind: set session->started before seat_read_active_vt() call
723b35b584 journal-remote: do not create /var/log/journal/remote
c76ae7a879 mkosi: update arch commit reference to f884cb080300eeb273fb7549fd0aa19bb6142c21
a955daf063 efi-api: validate boot option device path lengths
b82a9f9f53 dns-rr: invalidate wire format after changing ttl
872ad58935 tmpfiles: add hardening in glob_item_recursively
c4e5f003ed resolved: honour per-link DNSOverTLS=yes for certificate verification
4cff7ce255 sd-event: use CLOCK_BOOTTIME for rate limits
bcabc25eb6 creds-util: log when we remove a secret from a different machine
050ff0d62b sd-device: check fd validity before using in sendmsg in test
dd01b5bd60 dns-rr: fix SOA JSON fields
d51dd5a655 fsck: don't apply invalid mode or repair values
c4e0899385 bootctl: Fix prepend when installing systemd-boot for the first time
fc4658bc0a sd-bus: voidify bus_match_remove call
9ec5d452f2 measure-smbios: bound type 1 length before zeroing wake-up type
ac406e3232 gitignore: add .envrc, .direnv
b8522c506f portable: fix marker_matches_images() and propagate errors correctly
138467290f journald: replace existing syslog event source before reopening
626c57b9ba journald: pin the sending client's context across native message dispatch
60cba9ebf8 portable: detect drop-in-only attachments
706c4491ce sbsign: write unaligned signature size into WIN_CERTIFICATE header
775a9e171b pull: honor sync for OCI artifacts
8201bf6977 copy: keep replaced target after publish errors
675f4b0b06 mkosi: update fedora commit reference to 57cbcf979ce2dd872a871c59e87d2c65dfa996e6
589ba40e97 mkosi: update fedora commit reference to 45c16dd369c961b70664e473552def34d5469664
9e41763ec9 resolve: anchor the service browser from mDNS maintenance queries
4744ed0712 network: implement refcounting for SR-IOV objects
0c65971685 udev: clear event back-pointer when freeing a worker
c6d35bf4cb sd-bus: drop half-registered vtable members on failure
4a895ab034 sd-bus: re-check match_callbacks_modified in the argNhas value loop
c01e2dff1f sd-netlink: disconnect the slot on async/match error paths
9d9774050f network: initialize dot_servers before CLEANUP_ARRAY
16b5fcfa0d udev: track remaining buffer size across $links devlinks
10bc41033c sd-device: avoid 32-bit overflow in the monitor properties bounds check
99d7c6743a hashmap: honor the value destructor in set_ensure_consume()
5867697d6e sd-device: bound the tag filter BPF program size
0826a4a15d logind: drop the seat from the GC queue after draining its devices
d65875951e logind: cancel long-press timers when the Button is freed
b6a6963e78 logind: don't free live SessionDevice on duplicate TakeDevice
40467642bd boot: require a minimum PE optional header size in verify_pe()
b16364d0df boot: restore parent loaded image when initrd registration fails
b2644bfe8f boot: restore RW/RO memory attributes on every error
23741dcd57 boot: check PE section against SizeOfImage
0f3dd7ab02 boot: bound PE section VirtualSize before zeroing the inner kernel
1dbedeef33 boot: reject inner kernel entry point outside the image
ec6c9360b7 boot: don't unquote an empty value in line_get_key_value()
3b32f046f0 boot: initialize return parameters on zero-length EFI variable read
e62dc3e2bf boot: make device_path_next_node() robust against malformed zero-length nodes
0b59b1bd1f test-socket-util: convert to new ASSERT macros
313edfcb48 meson: merge two libelf-related clfags dependencies
30d63ed089 meson: merge three glib cflags dependencies
8e34addf1a meson: do not pass space-separated list of libraries
ab892b3e1f meson: use tpm2_cflags dependency rather than tpm2
93f26c6c5d pull: introduce pull-forward.h
2a08e8cb08 sysinstall: Look for valid kernel image before installing
e233936dbc boot: reject GPT headers with SizeOfPartitionEntry below the minimum
8eb162df81 machined: drop superfluos 'supervisor' varlink input parameter for register method
0cb4245755 calendarspec: warn on weekday/date conflict in systemd-analyze and systemd-run
387df32dc2 test: ignore fails when the formatted timezone differs from the current one
6fff312839 pcrextend,tpm2-util,tpm2-setup: gracefully skip NvPCR when TPM NV space is exhausted
4f5dcef65d bless-boot: avoid false maybe-uninitialized warning
a035cb3445 resolve: fix segfault when built with OPENSSL_NO_DEPRECATED_3_0
1f720ac2dd coredumpctl: use break instead of continue for time bound checks
f07d32db0f man: add thread-awareness note to sd_bus/sd_event manpages
c12e4a6e28 man: note that sd-tmpfiles/sysusers --root is not a sandboxing feature
3e5fdf2835 vmspawn/nspawn: Always use a per-machine runtime subdirectory
924727469e meson: fix fs.exists() check for fuzz corpus samples
59e87bb61a compress: handle ZSTD_CONTENTSIZE_UNKNOWN when decompressing blobs
97369d584a docs: Update memory pressure docs for latest GLib support for it
dc8ce44f48 test: suppress fails on the Africa/Tripoli (Libya) timezone
e61272caf1 ukify: show all sections and profiles in inspect JSON output
35178b46b7 test: add test case for show_menu()
f99cc27984 terminal-util: drop assert() on 'x'
8a6900b8fe terminal-util: make sure we never go below 10 characters line width
380432f43a terminal-util: use LESS_BY() where appropriate
8f62acc860 terminal-util: calculate array index only once
c547cddab9 bpf-restrict-fs: use a 32-bit magic key on big-endian too
ce595a30c1 core/scope: don't assert when start is retried during cgroup chown
337cc13d8b core: donate the fdset to do_reexecute() to avoid a double free
a8d535fb55 run: refuse --no-block when combined with --scope
cfeae2790c shared/install: give the borrowed name back before bailing on error
7d0f473cb9 quotacheck: don't apply an invalid quotacheck.mode= value
c4fe868f7b core: avoid using uninitialized buffer on bad systemd.random_seed=
256465f3f7 tree-wide: fix return type of sysconf()
cce527de38 memory-util: don't use 'r' for non-int returns
c9248545a5 build(deps): bump the actions group with 6 updates
8d8f9c1e39 man: update description for sd_device_enumerator_add_match_subsystem
9836c4ab8c test: reduce number of disks in TEST-64-UDEV-STORAGE-simultaneous_events on Debian/Ubuntu
de01a0f78f sd-journal: rate-limit tail timestamp refresh during iteration
2db85c4e1c man: fix wrong KillUserProcesses= default in systemd-run(1)
114df0eeab ptyfwd: avoid touching forwarder after exit drain
3c06c9e4ad boot/random-seed: create \loader\ dir if missing when seeding
903f1d1dc6 env-util: ensure NUL termination of the replace_env_argv() output array
9d3da650d0 fido2: reject zero-length HMAC secret
2674591913 ssl-util: set log level to debug in dlopen_many_sym_or_warn()
80f8a1124a resolvectl: fix JSON reply cleanup in varlink_dump_dns_configuration
a22d428609 exec-invoke: fix wrong errno in log_error_errno for setenv failure
b9ec917f14 crypto-util: set log level to debug in dlopen_many_sym_or_warn()
26916eda27 luo-util: use new LIVEUPDATE_SESSION_GET_NAME ioctl to get session name if available
8b45e907e7 Import linux/liveupdate.h UAPI header from 7.2-rc1
d76499f0b4 portable: leave room for trailing NUL in metadata receive buffer
ae34b3441d man: document that $XDG_CONFIG_HOME affects environment.d lookup path
14ec524c1f shared/varlink: fix license of varlink-io.systemd.Udev.c
eeb5862a0b test: drop ASAN workaround in TEST-07-PID1.issue-14566
cc0c446e10 test: use /run/ for temporary files in TEST-07-PID1.issue-14566
5827c35fd8 test: make TEST-07-PID1.issue-14566 more robust
5323aefd49 mkosi: fix license of mkosi.finalize
2bb7b1ae7c shell-completion: add missing commands and options to timedatectl zsh
1fc65de3b4 tmpfiles: fix device node major:minor logging to use i->major_minor
dd6c1c63de logind: fix typo in reboot-to-boot-loader-entry path
b8418ff33a journal-verify: fix offset reported for tail hash mismatch
38d246a627 tmpfiles: propagate clean_item_instance() error in clean_item()
df9ffa2309 Correct allocation size computation in xescape_full
71fc09c47e vmspawn: complain loudly if we can't prepare a unix socket for virtiofsd
06f2b81cc9 mkosi: pull new split-out packages for deb/ubuntu
73b089c099 journal-importer: avoid false maybe-uninitialized warning
cc674bbeca test: relax grep for DNS query refusal
6a5feb213e sd-json: Fix validation of optional fields within a mandatory struct
1e133c189e man: fix first argument in Environment= expansion example
0f1a2cde63 mkosi: update debian commit reference to 8e947316488c163321665a60766dbc972e9edf7a

--===============8292345706394973679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-boot-native-changelog.txt"

Changelog for systemd-boot-native: 261.1 -> 261.2

4925d9f07f meson: bump version to 261.2
70cc4f3d72 escape: reject UTF-16 surrogates in \u escapes in cunescape_one() (#43079)
a7bce5b205 homed: verify privileged worker changes
f62b9ce4ed man: document that ExitType=cgroup is rejected for Type=oneshot
24ca862cf7 man: update the sample glib/sd-event integration
28c374ef1c man: document unlocked as default IMDS network mode
1192084871 sd-device: allow non-safe characters in uevent files
dbfd5d2789 hwdb: classify PlayStation controller audio as controller form-factor
41932924a4 hwdb: strip the root from filenames when generating hwdb.bin
089099b924 man/network: fix default value for RequiredFamilyForOnline=
ff395a8c2a hwdb: add debug logging for the output filename
26f3717e27 core/dbus: do not block the manager on GetId during bus (re-)connection
dc225cc553 boot: cover BCD offsets past the buffer
d8cdc4ee79 password-quality-util-passwdqc: restore password-quality-util.h include
598273bb05 systemd-imds-generator: fix import docs
b9a65cb1ba creds: reject empty validity intervals
5158952f96 dissect: include image size in JSON output
d4ea8a3061 repart: skip generated files during dry runs
eeb244e82c firstboot: validate root shell credentials
431c436a53 sysusers: validate shell credentials
d3ebe51c6a docs: clarify scope of portable services
c6fc821265 repart: fix varlink description string
484aee1528 network: silence false warning about unitialized variable
ef3e2271bd id128: reject app-specific IDs for new
2edfcce6b0 rm-rf: downgrade root check log when directory doesn't exist
caa3df83b3 rm-rf: use faccessat instead of fstatat
180baee67d repart: log allocation failure at debug level in Varlink service mode
b83eac6ac0 repart: report the actual block device size in currentSizeBytes
a315a8afca portable: honor --force for directory extensions
0e4bb54915 portabled: apply pool limits to portable images
bcc187363a portablectl: normalize set-limit image paths
bf5bf89bd4 portablectl: normalize remove image paths
81e6878669 portable: keep unit symlinks inside the image
4f7c9b77ae portablectl: normalize read-only image paths
e67b1bfaf5 portablectl: keep inspect --force unit metadata
b05d2790a2 hwdb: update to main@{2026-07-17}
b456963bec obs: disable Tumbleweed too
43c416bcd6 units: properly wait for swtpm to finish before the initrd transition
b2f01dfed1 units: harden systemd-tpm2-swtpm.service
a4badd74aa tpm2: stop the software TPM before the ESP is unmounted on shutdown
160d4f1259 tree-wide: get rid of backslashes in file names
8467a27870 nspawn: use chase() for creating dev nodes
c889bcb737 nspawn: log at error level before exiting if parsing OCI fails
fe3dbfdf7f boot: fix MEMMAP_DEVICE_PATH EndingAddress field calculation
870d718006 Rebased and reapplied the fix, dropped the test case.
7aa2da940f discover-image: don't ignore symlinks to raw images
d392d17143 homed: fix verification of local identity file
eb24d74627 machined: Allow user ids in open_shell for machine-dbus
c6138ffbdc udev-util: bound leading whitespace skip in udev_replace_whitespace
f4c528cb06 string-util: add strnspn()
f767359875 sysext: validate work directory metadata before removal
4529bb61d9 shift-uid: close consumed directory fds on early return
9033eae9af rm-rf: fail closed when the root check fails
c63b37c0f0 vconsole: reject empty layout during keymap conversion with error
fd01077f17 resolved: preserve unchanged question on asymmetric redirect
350d79015d journal-remote: zero-initialize MHD daemon wrapper
bd45f60193 journal-remote: remove disabled compression entry before freeing
91796f82de network: cancel netlink calls for detached requests
edd08edfe2 network: compare all multipath route nexthops
742bdbb0ea tpm2-util: keep the measurement log's torn-write marker intact
170dab0fe9 journalctl: reject field listing with filters
5e150d2eb5 test: make NSS IPv4 tuple bounds explicit
17dfd608f5 oci-util: Don't fall back to default registry for explicit registries
92ea6ed698 boot: guard missing Windows auto entry
19ce494c58 journalctl: use root machine ID for namespaces
5ab9b61004 tpm2-util: initialize NvPCRs on first extension
6f10261eef sd-dhcp-relay: fix off-by-one when discarding BOOTREQUEST messages by hops count
56958bd945 boot: downgrade EFI_MEMORY_ATTRIBUTE_PROTOCOL warning
fdd3966f56 sysupdate: use strverscmp_improved() like everywhere else
2c219d2f09 timedatectl: display RTCTimeUSec in UTC format
aa10c21092 network: do not use assert() on a call with side effects
8e10f5f229 dissect-image: don't assert() on partition geometry from blkid
20140670a5 homework-luks: add new key slots before destroying old ones
ff4298e73b pull-oci: switch assert() to assert_se() for set_remove() call
b5c0959d45 copy: avoid following fifo/node chmod target
cb25da37eb log: add upper bound to journal iovec accounting
a09c3c523d string-util: add upper bound to ellipsize_mem UTF-8 walks
c8e6b02ce6 test: Remove a redundant exit call
ddc90bf66c sysupdate: Downgrade an info to a debug log message
c8dabc7a90 man: update gpt-auto-generator ESP mounting behavior
b8a1d98873 repart: Properly pre-calculate auto size of images
2d75ade520 id128: honor json output for single ids
c3ce4a403d boot: allow BCD fields to end at buffer limit
e42a4b8be7 portablectl: retry inspect with PORTABLE_PREFIXES
1b23cedff3 string-util: introduce STRING_FILENAME_PART flag for string_is_safe()
87983793db string-util: add STRING_DISALLOW_WHITESPACE for string_is_safe
14648c131e dns-answer: preserve shared aliases when removing records
faa89f2c7d resolved: roll back partial DNS zone publication
856f2c88b7 man: clarify that --when= is a lower bound, not a condition
72816231de boot: skip boot counter logic for entries marked read-only
848532980f boot-secret: don't initialize secret mixin file if marked read-only
4c27b10f7f boot: skip random seed handling if seed file is marked read-only
eab3959fee run: reject waiting for remain-after-exit services
cdc7b3c086 run: reject JSON output with verbose logs
c6750b6267 run: reject JSON output in scope mode
1e4abaa22c run: reject JSON output for trigger units
53947cf5a3 run: reject JSON output with stdio forwarding
abe01e1a8c run: accept explicit trigger unit names
2e5787eb75 run: reject --ignore-failure in scope mode
3e93ac6e17 run: honor --no-block for trigger units
8f4aa23791 repart: Fix growing the partition preceding a FreeArea from leftover space
6a2db11e2e timer: avoid re-arming WakeSystem=yes timer after suspend
61ed8f7147 resolved: publish browsed service after initialization
49f3d283fd libudev: replace unique list entries in place
48161d0f85 udev/net: reset the config list head in link_configs_free()
3c0f875c76 repart: Don't copy trailing padding when using --copy-from=
377c4e1001 repart: Clarify and test that --copy-from= argument respects grain size
293e44cb09 repart: Don't get old grain size from fdisk for --copy-from=
15b672e8a5 udevadm-trigger: reject invalid wait-daemon timeout
461c203676 udev-config: merge configured children max
af2e46c389 man/udevadm: update device-id-of-file arguments
c9c847e23d udevadm-settle: reject positional arguments
feb767cb60 udevadm-wait: let --removed override initialization
400b796c81 udevadm-info: allow valueless attr filters
ac6eb48563 udev: avoid reading before empty capability masks
32fc32a92f test: TEST-89: assert ifindex=0 browse does not flap
72cb20049e ci: check 'update-man-rules' to ensure it is not forgotten
e445b27491 resolved: fix spurious BrowseServices add/remove flapping with ifindex=0
8ac83d4f6c nss-myhostname: keep IPv6 probe result stable
a6bd0815f5 creds: tolerate TPM2 seal failure in auto mode
af1a5b4566 ndisc: reject non-zero ICMPv6 codes in parsers
9d34967b4f pull-oci: verify redirected manifest digest
69a4065ae0 efivars: fix concurrent growth read accounting
ebbad7adc9 network: do not regenerate MAC address if already set by userspace
5e1295cb08 obs: explicitly disable Ubuntu/i586 builds
f1c1f93118 udev: require exact builtin command matches
a7ca71c5a4 include: add hwcaps missing from glibc and musl
7bb32fdcee nspawn-oci: match the spec-correct "swappiness" memory field key
7ac32985fe udevadm-info: handle missing data db cleanup
1da0209142 udevadm-control: reject oversized children-max
eca88a543b udev-rules: drop truncated import output line
76f014a083 udevadm-hwdb: honor root when querying
ab9695a0b1 udev-rules: accept cvm CONST matches
5df1e9d9f4 import: drop redundant oci-util.c from sources
735ac821c8 dns-configuration: make dns_scope_free() static
f36fa3cd91 creds: Use ERRNO_IS_NEG_TPM2_UNSEAL_BAD_PCR
a5231d9ace cryptsetup: Give NV index missing its own error code
5713f1e55e cryptsetup: Skip tokens with JSON parsing errors
e8660577a4 cryptsetup: Reduce log level for TPM mismatches
9ccec8367c cryptsetup: Remap bad PCR set early to EPERM
70eb48e1a4 TEST-70-TPM2.cryptsetup: Make sure we iterate over foreign tokens
2424b89f5e tpm2-util: Also report EREMOTE if key is for different parent template
6ff4b985ac tpm2-util: For NV index errors report EREMOTE to be able to continue
793efd3553 tpm2-util: Align tpm2_import with tpm2_load to report on foreign keys
96cc8eecb7 cryptsetup/cryptenroll: Iterate over TPM tokens when they don't match
4d229c8d85 cryptsetup: Report mismatching TPM token error separately
0bd3d0c2e2 stub: Set up all detected consoles
a047e14bc8 mount-util/sysext: Clone sub mounts as private to preserve nested ones
2d4b465561 mount-util: Compact list of sub mounts after dropping
434d6e0274 core: make `/run/systemd/first-boot` available earlier
df771b177b sysupdate: handle slashes after pattern fields
43a450377b tree-wide: fix some double word errors like "the the"
3b3b4692a8 core: connect to sockets in credential directories
42060d2c30 pcrlock: handle piped PE input
2073a33f0d dissect: do not follow copy-to directory symlinks
86931d2563 stub: Prefer graphical console over virtio detection heuristic
94d7796aef logind: set session->started before seat_read_active_vt() call
723b35b584 journal-remote: do not create /var/log/journal/remote
c76ae7a879 mkosi: update arch commit reference to f884cb080300eeb273fb7549fd0aa19bb6142c21
a955daf063 efi-api: validate boot option device path lengths
b82a9f9f53 dns-rr: invalidate wire format after changing ttl
872ad58935 tmpfiles: add hardening in glob_item_recursively
c4e5f003ed resolved: honour per-link DNSOverTLS=yes for certificate verification
4cff7ce255 sd-event: use CLOCK_BOOTTIME for rate limits
bcabc25eb6 creds-util: log when we remove a secret from a different machine
050ff0d62b sd-device: check fd validity before using in sendmsg in test
dd01b5bd60 dns-rr: fix SOA JSON fields
d51dd5a655 fsck: don't apply invalid mode or repair values
c4e0899385 bootctl: Fix prepend when installing systemd-boot for the first time
fc4658bc0a sd-bus: voidify bus_match_remove call
9ec5d452f2 measure-smbios: bound type 1 length before zeroing wake-up type
ac406e3232 gitignore: add .envrc, .direnv
b8522c506f portable: fix marker_matches_images() and propagate errors correctly
138467290f journald: replace existing syslog event source before reopening
626c57b9ba journald: pin the sending client's context across native message dispatch
60cba9ebf8 portable: detect drop-in-only attachments
706c4491ce sbsign: write unaligned signature size into WIN_CERTIFICATE header
775a9e171b pull: honor sync for OCI artifacts
8201bf6977 copy: keep replaced target after publish errors
675f4b0b06 mkosi: update fedora commit reference to 57cbcf979ce2dd872a871c59e87d2c65dfa996e6
589ba40e97 mkosi: update fedora commit reference to 45c16dd369c961b70664e473552def34d5469664
9e41763ec9 resolve: anchor the service browser from mDNS maintenance queries
4744ed0712 network: implement refcounting for SR-IOV objects
0c65971685 udev: clear event back-pointer when freeing a worker
c6d35bf4cb sd-bus: drop half-registered vtable members on failure
4a895ab034 sd-bus: re-check match_callbacks_modified in the argNhas value loop
c01e2dff1f sd-netlink: disconnect the slot on async/match error paths
9d9774050f network: initialize dot_servers before CLEANUP_ARRAY
16b5fcfa0d udev: track remaining buffer size across $links devlinks
10bc41033c sd-device: avoid 32-bit overflow in the monitor properties bounds check
99d7c6743a hashmap: honor the value destructor in set_ensure_consume()
5867697d6e sd-device: bound the tag filter BPF program size
0826a4a15d logind: drop the seat from the GC queue after draining its devices
d65875951e logind: cancel long-press timers when the Button is freed
b6a6963e78 logind: don't free live SessionDevice on duplicate TakeDevice
40467642bd boot: require a minimum PE optional header size in verify_pe()
b16364d0df boot: restore parent loaded image when initrd registration fails
b2644bfe8f boot: restore RW/RO memory attributes on every error
23741dcd57 boot: check PE section against SizeOfImage
0f3dd7ab02 boot: bound PE section VirtualSize before zeroing the inner kernel
1dbedeef33 boot: reject inner kernel entry point outside the image
ec6c9360b7 boot: don't unquote an empty value in line_get_key_value()
3b32f046f0 boot: initialize return parameters on zero-length EFI variable read
e62dc3e2bf boot: make device_path_next_node() robust against malformed zero-length nodes
0b59b1bd1f test-socket-util: convert to new ASSERT macros
313edfcb48 meson: merge two libelf-related clfags dependencies
30d63ed089 meson: merge three glib cflags dependencies
8e34addf1a meson: do not pass space-separated list of libraries
ab892b3e1f meson: use tpm2_cflags dependency rather than tpm2
93f26c6c5d pull: introduce pull-forward.h
2a08e8cb08 sysinstall: Look for valid kernel image before installing
e233936dbc boot: reject GPT headers with SizeOfPartitionEntry below the minimum
8eb162df81 machined: drop superfluos 'supervisor' varlink input parameter for register method
0cb4245755 calendarspec: warn on weekday/date conflict in systemd-analyze and systemd-run
387df32dc2 test: ignore fails when the formatted timezone differs from the current one
6fff312839 pcrextend,tpm2-util,tpm2-setup: gracefully skip NvPCR when TPM NV space is exhausted
4f5dcef65d bless-boot: avoid false maybe-uninitialized warning
a035cb3445 resolve: fix segfault when built with OPENSSL_NO_DEPRECATED_3_0
1f720ac2dd coredumpctl: use break instead of continue for time bound checks
f07d32db0f man: add thread-awareness note to sd_bus/sd_event manpages
c12e4a6e28 man: note that sd-tmpfiles/sysusers --root is not a sandboxing feature
3e5fdf2835 vmspawn/nspawn: Always use a per-machine runtime subdirectory
924727469e meson: fix fs.exists() check for fuzz corpus samples
59e87bb61a compress: handle ZSTD_CONTENTSIZE_UNKNOWN when decompressing blobs
97369d584a docs: Update memory pressure docs for latest GLib support for it
dc8ce44f48 test: suppress fails on the Africa/Tripoli (Libya) timezone
e61272caf1 ukify: show all sections and profiles in inspect JSON output
35178b46b7 test: add test case for show_menu()
f99cc27984 terminal-util: drop assert() on 'x'
8a6900b8fe terminal-util: make sure we never go below 10 characters line width
380432f43a terminal-util: use LESS_BY() where appropriate
8f62acc860 terminal-util: calculate array index only once
c547cddab9 bpf-restrict-fs: use a 32-bit magic key on big-endian too
ce595a30c1 core/scope: don't assert when start is retried during cgroup chown
337cc13d8b core: donate the fdset to do_reexecute() to avoid a double free
a8d535fb55 run: refuse --no-block when combined with --scope
cfeae2790c shared/install: give the borrowed name back before bailing on error
7d0f473cb9 quotacheck: don't apply an invalid quotacheck.mode= value
c4fe868f7b core: avoid using uninitialized buffer on bad systemd.random_seed=
256465f3f7 tree-wide: fix return type of sysconf()
cce527de38 memory-util: don't use 'r' for non-int returns
c9248545a5 build(deps): bump the actions group with 6 updates
8d8f9c1e39 man: update description for sd_device_enumerator_add_match_subsystem
9836c4ab8c test: reduce number of disks in TEST-64-UDEV-STORAGE-simultaneous_events on Debian/Ubuntu
de01a0f78f sd-journal: rate-limit tail timestamp refresh during iteration
2db85c4e1c man: fix wrong KillUserProcesses= default in systemd-run(1)
114df0eeab ptyfwd: avoid touching forwarder after exit drain
3c06c9e4ad boot/random-seed: create \loader\ dir if missing when seeding
903f1d1dc6 env-util: ensure NUL termination of the replace_env_argv() output array
9d3da650d0 fido2: reject zero-length HMAC secret
2674591913 ssl-util: set log level to debug in dlopen_many_sym_or_warn()
80f8a1124a resolvectl: fix JSON reply cleanup in varlink_dump_dns_configuration
a22d428609 exec-invoke: fix wrong errno in log_error_errno for setenv failure
b9ec917f14 crypto-util: set log level to debug in dlopen_many_sym_or_warn()
26916eda27 luo-util: use new LIVEUPDATE_SESSION_GET_NAME ioctl to get session name if available
8b45e907e7 Import linux/liveupdate.h UAPI header from 7.2-rc1
d76499f0b4 portable: leave room for trailing NUL in metadata receive buffer
ae34b3441d man: document that $XDG_CONFIG_HOME affects environment.d lookup path
14ec524c1f shared/varlink: fix license of varlink-io.systemd.Udev.c
eeb5862a0b test: drop ASAN workaround in TEST-07-PID1.issue-14566
cc0c446e10 test: use /run/ for temporary files in TEST-07-PID1.issue-14566
5827c35fd8 test: make TEST-07-PID1.issue-14566 more robust
5323aefd49 mkosi: fix license of mkosi.finalize
2bb7b1ae7c shell-completion: add missing commands and options to timedatectl zsh
1fc65de3b4 tmpfiles: fix device node major:minor logging to use i->major_minor
dd6c1c63de logind: fix typo in reboot-to-boot-loader-entry path
b8418ff33a journal-verify: fix offset reported for tail hash mismatch
38d246a627 tmpfiles: propagate clean_item_instance() error in clean_item()
df9ffa2309 Correct allocation size computation in xescape_full
71fc09c47e vmspawn: complain loudly if we can't prepare a unix socket for virtiofsd
06f2b81cc9 mkosi: pull new split-out packages for deb/ubuntu
73b089c099 journal-importer: avoid false maybe-uninitialized warning
cc674bbeca test: relax grep for DNS query refusal
6a5feb213e sd-json: Fix validation of optional fields within a mandatory struct
1e133c189e man: fix first argument in Environment= expansion example
0f1a2cde63 mkosi: update debian commit reference to 8e947316488c163321665a60766dbc972e9edf7a

--===============8292345706394973679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-tools-native-changelog.txt"

Changelog for systemd-tools-native: 261.1 -> 261.2

4925d9f07f meson: bump version to 261.2
70cc4f3d72 escape: reject UTF-16 surrogates in \u escapes in cunescape_one() (#43079)
a7bce5b205 homed: verify privileged worker changes
f62b9ce4ed man: document that ExitType=cgroup is rejected for Type=oneshot
24ca862cf7 man: update the sample glib/sd-event integration
28c374ef1c man: document unlocked as default IMDS network mode
1192084871 sd-device: allow non-safe characters in uevent files
dbfd5d2789 hwdb: classify PlayStation controller audio as controller form-factor
41932924a4 hwdb: strip the root from filenames when generating hwdb.bin
089099b924 man/network: fix default value for RequiredFamilyForOnline=
ff395a8c2a hwdb: add debug logging for the output filename
26f3717e27 core/dbus: do not block the manager on GetId during bus (re-)connection
dc225cc553 boot: cover BCD offsets past the buffer
d8cdc4ee79 password-quality-util-passwdqc: restore password-quality-util.h include
598273bb05 systemd-imds-generator: fix import docs
b9a65cb1ba creds: reject empty validity intervals
5158952f96 dissect: include image size in JSON output
d4ea8a3061 repart: skip generated files during dry runs
eeb244e82c firstboot: validate root shell credentials
431c436a53 sysusers: validate shell credentials
d3ebe51c6a docs: clarify scope of portable services
c6fc821265 repart: fix varlink description string
484aee1528 network: silence false warning about unitialized variable
ef3e2271bd id128: reject app-specific IDs for new
2edfcce6b0 rm-rf: downgrade root check log when directory doesn't exist
caa3df83b3 rm-rf: use faccessat instead of fstatat
180baee67d repart: log allocation failure at debug level in Varlink service mode
b83eac6ac0 repart: report the actual block device size in currentSizeBytes
a315a8afca portable: honor --force for directory extensions
0e4bb54915 portabled: apply pool limits to portable images
bcc187363a portablectl: normalize set-limit image paths
bf5bf89bd4 portablectl: normalize remove image paths
81e6878669 portable: keep unit symlinks inside the image
4f7c9b77ae portablectl: normalize read-only image paths
e67b1bfaf5 portablectl: keep inspect --force unit metadata
b05d2790a2 hwdb: update to main@{2026-07-17}
b456963bec obs: disable Tumbleweed too
43c416bcd6 units: properly wait for swtpm to finish before the initrd transition
b2f01dfed1 units: harden systemd-tpm2-swtpm.service
a4badd74aa tpm2: stop the software TPM before the ESP is unmounted on shutdown
160d4f1259 tree-wide: get rid of backslashes in file names
8467a27870 nspawn: use chase() for creating dev nodes
c889bcb737 nspawn: log at error level before exiting if parsing OCI fails
fe3dbfdf7f boot: fix MEMMAP_DEVICE_PATH EndingAddress field calculation
870d718006 Rebased and reapplied the fix, dropped the test case.
7aa2da940f discover-image: don't ignore symlinks to raw images
d392d17143 homed: fix verification of local identity file
eb24d74627 machined: Allow user ids in open_shell for machine-dbus
c6138ffbdc udev-util: bound leading whitespace skip in udev_replace_whitespace
f4c528cb06 string-util: add strnspn()
f767359875 sysext: validate work directory metadata before removal
4529bb61d9 shift-uid: close consumed directory fds on early return
9033eae9af rm-rf: fail closed when the root check fails
c63b37c0f0 vconsole: reject empty layout during keymap conversion with error
fd01077f17 resolved: preserve unchanged question on asymmetric redirect
350d79015d journal-remote: zero-initialize MHD daemon wrapper
bd45f60193 journal-remote: remove disabled compression entry before freeing
91796f82de network: cancel netlink calls for detached requests
edd08edfe2 network: compare all multipath route nexthops
742bdbb0ea tpm2-util: keep the measurement log's torn-write marker intact
170dab0fe9 journalctl: reject field listing with filters
5e150d2eb5 test: make NSS IPv4 tuple bounds explicit
17dfd608f5 oci-util: Don't fall back to default registry for explicit registries
92ea6ed698 boot: guard missing Windows auto entry
19ce494c58 journalctl: use root machine ID for namespaces
5ab9b61004 tpm2-util: initialize NvPCRs on first extension
6f10261eef sd-dhcp-relay: fix off-by-one when discarding BOOTREQUEST messages by hops count
56958bd945 boot: downgrade EFI_MEMORY_ATTRIBUTE_PROTOCOL warning
fdd3966f56 sysupdate: use strverscmp_improved() like everywhere else
2c219d2f09 timedatectl: display RTCTimeUSec in UTC format
aa10c21092 network: do not use assert() on a call with side effects
8e10f5f229 dissect-image: don't assert() on partition geometry from blkid
20140670a5 homework-luks: add new key slots before destroying old ones
ff4298e73b pull-oci: switch assert() to assert_se() for set_remove() call
b5c0959d45 copy: avoid following fifo/node chmod target
cb25da37eb log: add upper bound to journal iovec accounting
a09c3c523d string-util: add upper bound to ellipsize_mem UTF-8 walks
c8e6b02ce6 test: Remove a redundant exit call
ddc90bf66c sysupdate: Downgrade an info to a debug log message
c8dabc7a90 man: update gpt-auto-generator ESP mounting behavior
b8a1d98873 repart: Properly pre-calculate auto size of images
2d75ade520 id128: honor json output for single ids
c3ce4a403d boot: allow BCD fields to end at buffer limit
e42a4b8be7 portablectl: retry inspect with PORTABLE_PREFIXES
1b23cedff3 string-util: introduce STRING_FILENAME_PART flag for string_is_safe()
87983793db string-util: add STRING_DISALLOW_WHITESPACE for string_is_safe
14648c131e dns-answer: preserve shared aliases when removing records
faa89f2c7d resolved: roll back partial DNS zone publication
856f2c88b7 man: clarify that --when= is a lower bound, not a condition
72816231de boot: skip boot counter logic for entries marked read-only
848532980f boot-secret: don't initialize secret mixin file if marked read-only
4c27b10f7f boot: skip random seed handling if seed file is marked read-only
eab3959fee run: reject waiting for remain-after-exit services
cdc7b3c086 run: reject JSON output with verbose logs
c6750b6267 run: reject JSON output in scope mode
1e4abaa22c run: reject JSON output for trigger units
53947cf5a3 run: reject JSON output with stdio forwarding
abe01e1a8c run: accept explicit trigger unit names
2e5787eb75 run: reject --ignore-failure in scope mode
3e93ac6e17 run: honor --no-block for trigger units
8f4aa23791 repart: Fix growing the partition preceding a FreeArea from leftover space
6a2db11e2e timer: avoid re-arming WakeSystem=yes timer after suspend
61ed8f7147 resolved: publish browsed service after initialization
49f3d283fd libudev: replace unique list entries in place
48161d0f85 udev/net: reset the config list head in link_configs_free()
3c0f875c76 repart: Don't copy trailing padding when using --copy-from=
377c4e1001 repart: Clarify and test that --copy-from= argument respects grain size
293e44cb09 repart: Don't get old grain size from fdisk for --copy-from=
15b672e8a5 udevadm-trigger: reject invalid wait-daemon timeout
461c203676 udev-config: merge configured children max
af2e46c389 man/udevadm: update device-id-of-file arguments
c9c847e23d udevadm-settle: reject positional arguments
feb767cb60 udevadm-wait: let --removed override initialization
400b796c81 udevadm-info: allow valueless attr filters
ac6eb48563 udev: avoid reading before empty capability masks
32fc32a92f test: TEST-89: assert ifindex=0 browse does not flap
72cb20049e ci: check 'update-man-rules' to ensure it is not forgotten
e445b27491 resolved: fix spurious BrowseServices add/remove flapping with ifindex=0
8ac83d4f6c nss-myhostname: keep IPv6 probe result stable
a6bd0815f5 creds: tolerate TPM2 seal failure in auto mode
af1a5b4566 ndisc: reject non-zero ICMPv6 codes in parsers
9d34967b4f pull-oci: verify redirected manifest digest
69a4065ae0 efivars: fix concurrent growth read accounting
ebbad7adc9 network: do not regenerate MAC address if already set by userspace
5e1295cb08 obs: explicitly disable Ubuntu/i586 builds
f1c1f93118 udev: require exact builtin command matches
a7ca71c5a4 include: add hwcaps missing from glibc and musl
7bb32fdcee nspawn-oci: match the spec-correct "swappiness" memory field key
7ac32985fe udevadm-info: handle missing data db cleanup
1da0209142 udevadm-control: reject oversized children-max
eca88a543b udev-rules: drop truncated import output line
76f014a083 udevadm-hwdb: honor root when querying
ab9695a0b1 udev-rules: accept cvm CONST matches
5df1e9d9f4 import: drop redundant oci-util.c from sources
735ac821c8 dns-configuration: make dns_scope_free() static
f36fa3cd91 creds: Use ERRNO_IS_NEG_TPM2_UNSEAL_BAD_PCR
a5231d9ace cryptsetup: Give NV index missing its own error code
5713f1e55e cryptsetup: Skip tokens with JSON parsing errors
e8660577a4 cryptsetup: Reduce log level for TPM mismatches
9ccec8367c cryptsetup: Remap bad PCR set early to EPERM
70eb48e1a4 TEST-70-TPM2.cryptsetup: Make sure we iterate over foreign tokens
2424b89f5e tpm2-util: Also report EREMOTE if key is for different parent template
6ff4b985ac tpm2-util: For NV index errors report EREMOTE to be able to continue
793efd3553 tpm2-util: Align tpm2_import with tpm2_load to report on foreign keys
96cc8eecb7 cryptsetup/cryptenroll: Iterate over TPM tokens when they don't match
4d229c8d85 cryptsetup: Report mismatching TPM token error separately
0bd3d0c2e2 stub: Set up all detected consoles
a047e14bc8 mount-util/sysext: Clone sub mounts as private to preserve nested ones
2d4b465561 mount-util: Compact list of sub mounts after dropping
434d6e0274 core: make `/run/systemd/first-boot` available earlier
df771b177b sysupdate: handle slashes after pattern fields
43a450377b tree-wide: fix some double word errors like "the the"
3b3b4692a8 core: connect to sockets in credential directories
42060d2c30 pcrlock: handle piped PE input
2073a33f0d dissect: do not follow copy-to directory symlinks
86931d2563 stub: Prefer graphical console over virtio detection heuristic
94d7796aef logind: set session->started before seat_read_active_vt() call
723b35b584 journal-remote: do not create /var/log/journal/remote
c76ae7a879 mkosi: update arch commit reference to f884cb080300eeb273fb7549fd0aa19bb6142c21
a955daf063 efi-api: validate boot option device path lengths
b82a9f9f53 dns-rr: invalidate wire format after changing ttl
872ad58935 tmpfiles: add hardening in glob_item_recursively
c4e5f003ed resolved: honour per-link DNSOverTLS=yes for certificate verification
4cff7ce255 sd-event: use CLOCK_BOOTTIME for rate limits
bcabc25eb6 creds-util: log when we remove a secret from a different machine
050ff0d62b sd-device: check fd validity before using in sendmsg in test
dd01b5bd60 dns-rr: fix SOA JSON fields
d51dd5a655 fsck: don't apply invalid mode or repair values
c4e0899385 bootctl: Fix prepend when installing systemd-boot for the first time
fc4658bc0a sd-bus: voidify bus_match_remove call
9ec5d452f2 measure-smbios: bound type 1 length before zeroing wake-up type
ac406e3232 gitignore: add .envrc, .direnv
b8522c506f portable: fix marker_matches_images() and propagate errors correctly
138467290f journald: replace existing syslog event source before reopening
626c57b9ba journald: pin the sending client's context across native message dispatch
60cba9ebf8 portable: detect drop-in-only attachments
706c4491ce sbsign: write unaligned signature size into WIN_CERTIFICATE header
775a9e171b pull: honor sync for OCI artifacts
8201bf6977 copy: keep replaced target after publish errors
675f4b0b06 mkosi: update fedora commit reference to 57cbcf979ce2dd872a871c59e87d2c65dfa996e6
589ba40e97 mkosi: update fedora commit reference to 45c16dd369c961b70664e473552def34d5469664
9e41763ec9 resolve: anchor the service browser from mDNS maintenance queries
4744ed0712 network: implement refcounting for SR-IOV objects
0c65971685 udev: clear event back-pointer when freeing a worker
c6d35bf4cb sd-bus: drop half-registered vtable members on failure
4a895ab034 sd-bus: re-check match_callbacks_modified in the argNhas value loop
c01e2dff1f sd-netlink: disconnect the slot on async/match error paths
9d9774050f network: initialize dot_servers before CLEANUP_ARRAY
16b5fcfa0d udev: track remaining buffer size across $links devlinks
10bc41033c sd-device: avoid 32-bit overflow in the monitor properties bounds check
99d7c6743a hashmap: honor the value destructor in set_ensure_consume()
5867697d6e sd-device: bound the tag filter BPF program size
0826a4a15d logind: drop the seat from the GC queue after draining its devices
d65875951e logind: cancel long-press timers when the Button is freed
b6a6963e78 logind: don't free live SessionDevice on duplicate TakeDevice
40467642bd boot: require a minimum PE optional header size in verify_pe()
b16364d0df boot: restore parent loaded image when initrd registration fails
b2644bfe8f boot: restore RW/RO memory attributes on every error
23741dcd57 boot: check PE section against SizeOfImage
0f3dd7ab02 boot: bound PE section VirtualSize before zeroing the inner kernel
1dbedeef33 boot: reject inner kernel entry point outside the image
ec6c9360b7 boot: don't unquote an empty value in line_get_key_value()
3b32f046f0 boot: initialize return parameters on zero-length EFI variable read
e62dc3e2bf boot: make device_path_next_node() robust against malformed zero-length nodes
0b59b1bd1f test-socket-util: convert to new ASSERT macros
313edfcb48 meson: merge two libelf-related clfags dependencies
30d63ed089 meson: merge three glib cflags dependencies
8e34addf1a meson: do not pass space-separated list of libraries
ab892b3e1f meson: use tpm2_cflags dependency rather than tpm2
93f26c6c5d pull: introduce pull-forward.h
2a08e8cb08 sysinstall: Look for valid kernel image before installing
e233936dbc boot: reject GPT headers with SizeOfPartitionEntry below the minimum
8eb162df81 machined: drop superfluos 'supervisor' varlink input parameter for register method
0cb4245755 calendarspec: warn on weekday/date conflict in systemd-analyze and systemd-run
387df32dc2 test: ignore fails when the formatted timezone differs from the current one
6fff312839 pcrextend,tpm2-util,tpm2-setup: gracefully skip NvPCR when TPM NV space is exhausted
4f5dcef65d bless-boot: avoid false maybe-uninitialized warning
a035cb3445 resolve: fix segfault when built with OPENSSL_NO_DEPRECATED_3_0
1f720ac2dd coredumpctl: use break instead of continue for time bound checks
f07d32db0f man: add thread-awareness note to sd_bus/sd_event manpages
c12e4a6e28 man: note that sd-tmpfiles/sysusers --root is not a sandboxing feature
3e5fdf2835 vmspawn/nspawn: Always use a per-machine runtime subdirectory
924727469e meson: fix fs.exists() check for fuzz corpus samples
59e87bb61a compress: handle ZSTD_CONTENTSIZE_UNKNOWN when decompressing blobs
97369d584a docs: Update memory pressure docs for latest GLib support for it
dc8ce44f48 test: suppress fails on the Africa/Tripoli (Libya) timezone
e61272caf1 ukify: show all sections and profiles in inspect JSON output
35178b46b7 test: add test case for show_menu()
f99cc27984 terminal-util: drop assert() on 'x'
8a6900b8fe terminal-util: make sure we never go below 10 characters line width
380432f43a terminal-util: use LESS_BY() where appropriate
8f62acc860 terminal-util: calculate array index only once
c547cddab9 bpf-restrict-fs: use a 32-bit magic key on big-endian too
ce595a30c1 core/scope: don't assert when start is retried during cgroup chown
337cc13d8b core: donate the fdset to do_reexecute() to avoid a double free
a8d535fb55 run: refuse --no-block when combined with --scope
cfeae2790c shared/install: give the borrowed name back before bailing on error
7d0f473cb9 quotacheck: don't apply an invalid quotacheck.mode= value
c4fe868f7b core: avoid using uninitialized buffer on bad systemd.random_seed=
256465f3f7 tree-wide: fix return type of sysconf()
cce527de38 memory-util: don't use 'r' for non-int returns
c9248545a5 build(deps): bump the actions group with 6 updates
8d8f9c1e39 man: update description for sd_device_enumerator_add_match_subsystem
9836c4ab8c test: reduce number of disks in TEST-64-UDEV-STORAGE-simultaneous_events on Debian/Ubuntu
de01a0f78f sd-journal: rate-limit tail timestamp refresh during iteration
2db85c4e1c man: fix wrong KillUserProcesses= default in systemd-run(1)
114df0eeab ptyfwd: avoid touching forwarder after exit drain
3c06c9e4ad boot/random-seed: create \loader\ dir if missing when seeding
903f1d1dc6 env-util: ensure NUL termination of the replace_env_argv() output array
9d3da650d0 fido2: reject zero-length HMAC secret
2674591913 ssl-util: set log level to debug in dlopen_many_sym_or_warn()
80f8a1124a resolvectl: fix JSON reply cleanup in varlink_dump_dns_configuration
a22d428609 exec-invoke: fix wrong errno in log_error_errno for setenv failure
b9ec917f14 crypto-util: set log level to debug in dlopen_many_sym_or_warn()
26916eda27 luo-util: use new LIVEUPDATE_SESSION_GET_NAME ioctl to get session name if available
8b45e907e7 Import linux/liveupdate.h UAPI header from 7.2-rc1
d76499f0b4 portable: leave room for trailing NUL in metadata receive buffer
ae34b3441d man: document that $XDG_CONFIG_HOME affects environment.d lookup path
14ec524c1f shared/varlink: fix license of varlink-io.systemd.Udev.c
eeb5862a0b test: drop ASAN workaround in TEST-07-PID1.issue-14566
cc0c446e10 test: use /run/ for temporary files in TEST-07-PID1.issue-14566
5827c35fd8 test: make TEST-07-PID1.issue-14566 more robust
5323aefd49 mkosi: fix license of mkosi.finalize
2bb7b1ae7c shell-completion: add missing commands and options to timedatectl zsh
1fc65de3b4 tmpfiles: fix device node major:minor logging to use i->major_minor
dd6c1c63de logind: fix typo in reboot-to-boot-loader-entry path
b8418ff33a journal-verify: fix offset reported for tail hash mismatch
38d246a627 tmpfiles: propagate clean_item_instance() error in clean_item()
df9ffa2309 Correct allocation size computation in xescape_full
71fc09c47e vmspawn: complain loudly if we can't prepare a unix socket for virtiofsd
06f2b81cc9 mkosi: pull new split-out packages for deb/ubuntu
73b089c099 journal-importer: avoid false maybe-uninitialized warning
cc674bbeca test: relax grep for DNS query refusal
6a5feb213e sd-json: Fix validation of optional fields within a mandatory struct
1e133c189e man: fix first argument in Environment= expansion example
0f1a2cde63 mkosi: update debian commit reference to 8e947316488c163321665a60766dbc972e9edf7a

--===============8292345706394973679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="systemd-changelog.txt"

Changelog for systemd: 261.1 -> 261.2

4925d9f07f meson: bump version to 261.2
70cc4f3d72 escape: reject UTF-16 surrogates in \u escapes in cunescape_one() (#43079)
a7bce5b205 homed: verify privileged worker changes
f62b9ce4ed man: document that ExitType=cgroup is rejected for Type=oneshot
24ca862cf7 man: update the sample glib/sd-event integration
28c374ef1c man: document unlocked as default IMDS network mode
1192084871 sd-device: allow non-safe characters in uevent files
dbfd5d2789 hwdb: classify PlayStation controller audio as controller form-factor
41932924a4 hwdb: strip the root from filenames when generating hwdb.bin
089099b924 man/network: fix default value for RequiredFamilyForOnline=
ff395a8c2a hwdb: add debug logging for the output filename
26f3717e27 core/dbus: do not block the manager on GetId during bus (re-)connection
dc225cc553 boot: cover BCD offsets past the buffer
d8cdc4ee79 password-quality-util-passwdqc: restore password-quality-util.h include
598273bb05 systemd-imds-generator: fix import docs
b9a65cb1ba creds: reject empty validity intervals
5158952f96 dissect: include image size in JSON output
d4ea8a3061 repart: skip generated files during dry runs
eeb244e82c firstboot: validate root shell credentials
431c436a53 sysusers: validate shell credentials
d3ebe51c6a docs: clarify scope of portable services
c6fc821265 repart: fix varlink description string
484aee1528 network: silence false warning about unitialized variable
ef3e2271bd id128: reject app-specific IDs for new
2edfcce6b0 rm-rf: downgrade root check log when directory doesn't exist
caa3df83b3 rm-rf: use faccessat instead of fstatat
180baee67d repart: log allocation failure at debug level in Varlink service mode
b83eac6ac0 repart: report the actual block device size in currentSizeBytes
a315a8afca portable: honor --force for directory extensions
0e4bb54915 portabled: apply pool limits to portable images
bcc187363a portablectl: normalize set-limit image paths
bf5bf89bd4 portablectl: normalize remove image paths
81e6878669 portable: keep unit symlinks inside the image
4f7c9b77ae portablectl: normalize read-only image paths
e67b1bfaf5 portablectl: keep inspect --force unit metadata
b05d2790a2 hwdb: update to main@{2026-07-17}
b456963bec obs: disable Tumbleweed too
43c416bcd6 units: properly wait for swtpm to finish before the initrd transition
b2f01dfed1 units: harden systemd-tpm2-swtpm.service
a4badd74aa tpm2: stop the software TPM before the ESP is unmounted on shutdown
160d4f1259 tree-wide: get rid of backslashes in file names
8467a27870 nspawn: use chase() for creating dev nodes
c889bcb737 nspawn: log at error level before exiting if parsing OCI fails
fe3dbfdf7f boot: fix MEMMAP_DEVICE_PATH EndingAddress field calculation
870d718006 Rebased and reapplied the fix, dropped the test case.
7aa2da940f discover-image: don't ignore symlinks to raw images
d392d17143 homed: fix verification of local identity file
eb24d74627 machined: Allow user ids in open_shell for machine-dbus
c6138ffbdc udev-util: bound leading whitespace skip in udev_replace_whitespace
f4c528cb06 string-util: add strnspn()
f767359875 sysext: validate work directory metadata before removal
4529bb61d9 shift-uid: close consumed directory fds on early return
9033eae9af rm-rf: fail closed when the root check fails
c63b37c0f0 vconsole: reject empty layout during keymap conversion with error
fd01077f17 resolved: preserve unchanged question on asymmetric redirect
350d79015d journal-remote: zero-initialize MHD daemon wrapper
bd45f60193 journal-remote: remove disabled compression entry before freeing
91796f82de network: cancel netlink calls for detached requests
edd08edfe2 network: compare all multipath route nexthops
742bdbb0ea tpm2-util: keep the measurement log's torn-write marker intact
170dab0fe9 journalctl: reject field listing with filters
5e150d2eb5 test: make NSS IPv4 tuple bounds explicit
17dfd608f5 oci-util: Don't fall back to default registry for explicit registries
92ea6ed698 boot: guard missing Windows auto entry
19ce494c58 journalctl: use root machine ID for namespaces
5ab9b61004 tpm2-util: initialize NvPCRs on first extension
6f10261eef sd-dhcp-relay: fix off-by-one when discarding BOOTREQUEST messages by hops count
56958bd945 boot: downgrade EFI_MEMORY_ATTRIBUTE_PROTOCOL warning
fdd3966f56 sysupdate: use strverscmp_improved() like everywhere else
2c219d2f09 timedatectl: display RTCTimeUSec in UTC format
aa10c21092 network: do not use assert() on a call with side effects
8e10f5f229 dissect-image: don't assert() on partition geometry from blkid
20140670a5 homework-luks: add new key slots before destroying old ones
ff4298e73b pull-oci: switch assert() to assert_se() for set_remove() call
b5c0959d45 copy: avoid following fifo/node chmod target
cb25da37eb log: add upper bound to journal iovec accounting
a09c3c523d string-util: add upper bound to ellipsize_mem UTF-8 walks
c8e6b02ce6 test: Remove a redundant exit call
ddc90bf66c sysupdate: Downgrade an info to a debug log message
c8dabc7a90 man: update gpt-auto-generator ESP mounting behavior
b8a1d98873 repart: Properly pre-calculate auto size of images
2d75ade520 id128: honor json output for single ids
c3ce4a403d boot: allow BCD fields to end at buffer limit
e42a4b8be7 portablectl: retry inspect with PORTABLE_PREFIXES
1b23cedff3 string-util: introduce STRING_FILENAME_PART flag for string_is_safe()
87983793db string-util: add STRING_DISALLOW_WHITESPACE for string_is_safe
14648c131e dns-answer: preserve shared aliases when removing records
faa89f2c7d resolved: roll back partial DNS zone publication
856f2c88b7 man: clarify that --when= is a lower bound, not a condition
72816231de boot: skip boot counter logic for entries marked read-only
848532980f boot-secret: don't initialize secret mixin file if marked read-only
4c27b10f7f boot: skip random seed handling if seed file is marked read-only
eab3959fee run: reject waiting for remain-after-exit services
cdc7b3c086 run: reject JSON output with verbose logs
c6750b6267 run: reject JSON output in scope mode
1e4abaa22c run: reject JSON output for trigger units
53947cf5a3 run: reject JSON output with stdio forwarding
abe01e1a8c run: accept explicit trigger unit names
2e5787eb75 run: reject --ignore-failure in scope mode
3e93ac6e17 run: honor --no-block for trigger units
8f4aa23791 repart: Fix growing the partition preceding a FreeArea from leftover space
6a2db11e2e timer: avoid re-arming WakeSystem=yes timer after suspend
61ed8f7147 resolved: publish browsed service after initialization
49f3d283fd libudev: replace unique list entries in place
48161d0f85 udev/net: reset the config list head in link_configs_free()
3c0f875c76 repart: Don't copy trailing padding when using --copy-from=
377c4e1001 repart: Clarify and test that --copy-from= argument respects grain size
293e44cb09 repart: Don't get old grain size from fdisk for --copy-from=
15b672e8a5 udevadm-trigger: reject invalid wait-daemon timeout
461c203676 udev-config: merge configured children max
af2e46c389 man/udevadm: update device-id-of-file arguments
c9c847e23d udevadm-settle: reject positional arguments
feb767cb60 udevadm-wait: let --removed override initialization
400b796c81 udevadm-info: allow valueless attr filters
ac6eb48563 udev: avoid reading before empty capability masks
32fc32a92f test: TEST-89: assert ifindex=0 browse does not flap
72cb20049e ci: check 'update-man-rules' to ensure it is not forgotten
e445b27491 resolved: fix spurious BrowseServices add/remove flapping with ifindex=0
8ac83d4f6c nss-myhostname: keep IPv6 probe result stable
a6bd0815f5 creds: tolerate TPM2 seal failure in auto mode
af1a5b4566 ndisc: reject non-zero ICMPv6 codes in parsers
9d34967b4f pull-oci: verify redirected manifest digest
69a4065ae0 efivars: fix concurrent growth read accounting
ebbad7adc9 network: do not regenerate MAC address if already set by userspace
5e1295cb08 obs: explicitly disable Ubuntu/i586 builds
f1c1f93118 udev: require exact builtin command matches
a7ca71c5a4 include: add hwcaps missing from glibc and musl
7bb32fdcee nspawn-oci: match the spec-correct "swappiness" memory field key
7ac32985fe udevadm-info: handle missing data db cleanup
1da0209142 udevadm-control: reject oversized children-max
eca88a543b udev-rules: drop truncated import output line
76f014a083 udevadm-hwdb: honor root when querying
ab9695a0b1 udev-rules: accept cvm CONST matches
5df1e9d9f4 import: drop redundant oci-util.c from sources
735ac821c8 dns-configuration: make dns_scope_free() static
f36fa3cd91 creds: Use ERRNO_IS_NEG_TPM2_UNSEAL_BAD_PCR
a5231d9ace cryptsetup: Give NV index missing its own error code
5713f1e55e cryptsetup: Skip tokens with JSON parsing errors
e8660577a4 cryptsetup: Reduce log level for TPM mismatches
9ccec8367c cryptsetup: Remap bad PCR set early to EPERM
70eb48e1a4 TEST-70-TPM2.cryptsetup: Make sure we iterate over foreign tokens
2424b89f5e tpm2-util: Also report EREMOTE if key is for different parent template
6ff4b985ac tpm2-util: For NV index errors report EREMOTE to be able to continue
793efd3553 tpm2-util: Align tpm2_import with tpm2_load to report on foreign keys
96cc8eecb7 cryptsetup/cryptenroll: Iterate over TPM tokens when they don't match
4d229c8d85 cryptsetup: Report mismatching TPM token error separately
0bd3d0c2e2 stub: Set up all detected consoles
a047e14bc8 mount-util/sysext: Clone sub mounts as private to preserve nested ones
2d4b465561 mount-util: Compact list of sub mounts after dropping
434d6e0274 core: make `/run/systemd/first-boot` available earlier
df771b177b sysupdate: handle slashes after pattern fields
43a450377b tree-wide: fix some double word errors like "the the"
3b3b4692a8 core: connect to sockets in credential directories
42060d2c30 pcrlock: handle piped PE input
2073a33f0d dissect: do not follow copy-to directory symlinks
86931d2563 stub: Prefer graphical console over virtio detection heuristic
94d7796aef logind: set session->started before seat_read_active_vt() call
723b35b584 journal-remote: do not create /var/log/journal/remote
c76ae7a879 mkosi: update arch commit reference to f884cb080300eeb273fb7549fd0aa19bb6142c21
a955daf063 efi-api: validate boot option device path lengths
b82a9f9f53 dns-rr: invalidate wire format after changing ttl
872ad58935 tmpfiles: add hardening in glob_item_recursively
c4e5f003ed resolved: honour per-link DNSOverTLS=yes for certificate verification
4cff7ce255 sd-event: use CLOCK_BOOTTIME for rate limits
bcabc25eb6 creds-util: log when we remove a secret from a different machine
050ff0d62b sd-device: check fd validity before using in sendmsg in test
dd01b5bd60 dns-rr: fix SOA JSON fields
d51dd5a655 fsck: don't apply invalid mode or repair values
c4e0899385 bootctl: Fix prepend when installing systemd-boot for the first time
fc4658bc0a sd-bus: voidify bus_match_remove call
9ec5d452f2 measure-smbios: bound type 1 length before zeroing wake-up type
ac406e3232 gitignore: add .envrc, .direnv
b8522c506f portable: fix marker_matches_images() and propagate errors correctly
138467290f journald: replace existing syslog event source before reopening
626c57b9ba journald: pin the sending client's context across native message dispatch
60cba9ebf8 portable: detect drop-in-only attachments
706c4491ce sbsign: write unaligned signature size into WIN_CERTIFICATE header
775a9e171b pull: honor sync for OCI artifacts
8201bf6977 copy: keep replaced target after publish errors
675f4b0b06 mkosi: update fedora commit reference to 57cbcf979ce2dd872a871c59e87d2c65dfa996e6
589ba40e97 mkosi: update fedora commit reference to 45c16dd369c961b70664e473552def34d5469664
9e41763ec9 resolve: anchor the service browser from mDNS maintenance queries
4744ed0712 network: implement refcounting for SR-IOV objects
0c65971685 udev: clear event back-pointer when freeing a worker
c6d35bf4cb sd-bus: drop half-registered vtable members on failure
4a895ab034 sd-bus: re-check match_callbacks_modified in the argNhas value loop
c01e2dff1f sd-netlink: disconnect the slot on async/match error paths
9d9774050f network: initialize dot_servers before CLEANUP_ARRAY
16b5fcfa0d udev: track remaining buffer size across $links devlinks
10bc41033c sd-device: avoid 32-bit overflow in the monitor properties bounds check
99d7c6743a hashmap: honor the value destructor in set_ensure_consume()
5867697d6e sd-device: bound the tag filter BPF program size
0826a4a15d logind: drop the seat from the GC queue after draining its devices
d65875951e logind: cancel long-press timers when the Button is freed
b6a6963e78 logind: don't free live SessionDevice on duplicate TakeDevice
40467642bd boot: require a minimum PE optional header size in verify_pe()
b16364d0df boot: restore parent loaded image when initrd registration fails
b2644bfe8f boot: restore RW/RO memory attributes on every error
23741dcd57 boot: check PE section against SizeOfImage
0f3dd7ab02 boot: bound PE section VirtualSize before zeroing the inner kernel
1dbedeef33 boot: reject inner kernel entry point outside the image
ec6c9360b7 boot: don't unquote an empty value in line_get_key_value()
3b32f046f0 boot: initialize return parameters on zero-length EFI variable read
e62dc3e2bf boot: make device_path_next_node() robust against malformed zero-length nodes
0b59b1bd1f test-socket-util: convert to new ASSERT macros
313edfcb48 meson: merge two libelf-related clfags dependencies
30d63ed089 meson: merge three glib cflags dependencies
8e34addf1a meson: do not pass space-separated list of libraries
ab892b3e1f meson: use tpm2_cflags dependency rather than tpm2
93f26c6c5d pull: introduce pull-forward.h
2a08e8cb08 sysinstall: Look for valid kernel image before installing
e233936dbc boot: reject GPT headers with SizeOfPartitionEntry below the minimum
8eb162df81 machined: drop superfluos 'supervisor' varlink input parameter for register method
0cb4245755 calendarspec: warn on weekday/date conflict in systemd-analyze and systemd-run
387df32dc2 test: ignore fails when the formatted timezone differs from the current one
6fff312839 pcrextend,tpm2-util,tpm2-setup: gracefully skip NvPCR when TPM NV space is exhausted
4f5dcef65d bless-boot: avoid false maybe-uninitialized warning
a035cb3445 resolve: fix segfault when built with OPENSSL_NO_DEPRECATED_3_0
1f720ac2dd coredumpctl: use break instead of continue for time bound checks
f07d32db0f man: add thread-awareness note to sd_bus/sd_event manpages
c12e4a6e28 man: note that sd-tmpfiles/sysusers --root is not a sandboxing feature
3e5fdf2835 vmspawn/nspawn: Always use a per-machine runtime subdirectory
924727469e meson: fix fs.exists() check for fuzz corpus samples
59e87bb61a compress: handle ZSTD_CONTENTSIZE_UNKNOWN when decompressing blobs
97369d584a docs: Update memory pressure docs for latest GLib support for it
dc8ce44f48 test: suppress fails on the Africa/Tripoli (Libya) timezone
e61272caf1 ukify: show all sections and profiles in inspect JSON output
35178b46b7 test: add test case for show_menu()
f99cc27984 terminal-util: drop assert() on 'x'
8a6900b8fe terminal-util: make sure we never go below 10 characters line width
380432f43a terminal-util: use LESS_BY() where appropriate
8f62acc860 terminal-util: calculate array index only once
c547cddab9 bpf-restrict-fs: use a 32-bit magic key on big-endian too
ce595a30c1 core/scope: don't assert when start is retried during cgroup chown
337cc13d8b core: donate the fdset to do_reexecute() to avoid a double free
a8d535fb55 run: refuse --no-block when combined with --scope
cfeae2790c shared/install: give the borrowed name back before bailing on error
7d0f473cb9 quotacheck: don't apply an invalid quotacheck.mode= value
c4fe868f7b core: avoid using uninitialized buffer on bad systemd.random_seed=
256465f3f7 tree-wide: fix return type of sysconf()
cce527de38 memory-util: don't use 'r' for non-int returns
c9248545a5 build(deps): bump the actions group with 6 updates
8d8f9c1e39 man: update description for sd_device_enumerator_add_match_subsystem
9836c4ab8c test: reduce number of disks in TEST-64-UDEV-STORAGE-simultaneous_events on Debian/Ubuntu
de01a0f78f sd-journal: rate-limit tail timestamp refresh during iteration
2db85c4e1c man: fix wrong KillUserProcesses= default in systemd-run(1)
114df0eeab ptyfwd: avoid touching forwarder after exit drain
3c06c9e4ad boot/random-seed: create \loader\ dir if missing when seeding
903f1d1dc6 env-util: ensure NUL termination of the replace_env_argv() output array
9d3da650d0 fido2: reject zero-length HMAC secret
2674591913 ssl-util: set log level to debug in dlopen_many_sym_or_warn()
80f8a1124a resolvectl: fix JSON reply cleanup in varlink_dump_dns_configuration
a22d428609 exec-invoke: fix wrong errno in log_error_errno for setenv failure
b9ec917f14 crypto-util: set log level to debug in dlopen_many_sym_or_warn()
26916eda27 luo-util: use new LIVEUPDATE_SESSION_GET_NAME ioctl to get session name if available
8b45e907e7 Import linux/liveupdate.h UAPI header from 7.2-rc1
d76499f0b4 portable: leave room for trailing NUL in metadata receive buffer
ae34b3441d man: document that $XDG_CONFIG_HOME affects environment.d lookup path
14ec524c1f shared/varlink: fix license of varlink-io.systemd.Udev.c
eeb5862a0b test: drop ASAN workaround in TEST-07-PID1.issue-14566
cc0c446e10 test: use /run/ for temporary files in TEST-07-PID1.issue-14566
5827c35fd8 test: make TEST-07-PID1.issue-14566 more robust
5323aefd49 mkosi: fix license of mkosi.finalize
2bb7b1ae7c shell-completion: add missing commands and options to timedatectl zsh
1fc65de3b4 tmpfiles: fix device node major:minor logging to use i->major_minor
dd6c1c63de logind: fix typo in reboot-to-boot-loader-entry path
b8418ff33a journal-verify: fix offset reported for tail hash mismatch
38d246a627 tmpfiles: propagate clean_item_instance() error in clean_item()
df9ffa2309 Correct allocation size computation in xescape_full
71fc09c47e vmspawn: complain loudly if we can't prepare a unix socket for virtiofsd
06f2b81cc9 mkosi: pull new split-out packages for deb/ubuntu
73b089c099 journal-importer: avoid false maybe-uninitialized warning
cc674bbeca test: relax grep for DNS query refusal
6a5feb213e sd-json: Fix validation of optional fields within a mandatory struct
1e133c189e man: fix first argument in Environment= expansion example
0f1a2cde63 mkosi: update debian commit reference to 8e947316488c163321665a60766dbc972e9edf7a

--===============8292345706394973679==--

