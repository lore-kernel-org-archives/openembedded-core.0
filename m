Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.672.1596818588093223516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 09:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l7TqyzCw;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id z18so2244940wrm.12
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t1XPD2OGn4tq93mYO0TCTXyZSbcSBIKwjsfC+fCaRNQ=;
        b=l7TqyzCwFkp34w1top1Nw6pTRhZaF+VAxQaJs4we9wbFIxW9mrpUnv5BFx0aCqVpUD
         SYitGcfiN9HRu4Y6I9SgCVRdc7+nWS47vroRyBSvsHoTKxBm3bJraCisKdh8CkIWoolk
         0GjTI+YuyKaOl/ZzOaC0iqRtgq9aiBaU/gZmvF8BlnSsuvbHu3ZvZP6TahJ4g60L11+G
         VHC+sxjdUOKhHbBhn1HQ2f20pPU16Gv67wY2uJg6GvyQ+JJFux7gDR2wZ9BkhcRA+Vgj
         wL5gCmwIw7hgWnZfmb5SfSycrm8hWbq70LoTJjTLCyNyCk97jRpGGgopIRY/owiOugoq
         FGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t1XPD2OGn4tq93mYO0TCTXyZSbcSBIKwjsfC+fCaRNQ=;
        b=O8jTGhRTCBlbiXYt1vz2q62jIcslyqxj3euFDvJdeopa3ipDHVXbk16WtUAzZJcRW3
         28NM8ohs9UuHAPglWR9jGQVL1Xxy1Bc67WoMI9wWDEpsW9K+t0XkKmJ3847jGIde8YRS
         +7CA0nAUBmyJTfVFNAmzkQdH7vyHo0v6VdTlC5iNP2Bu9l/0UjegQBuHfu+Idv/Bsmog
         o8ASKh/3r0A6z3vnqT/7ydTiudifwHeO3wRCIUhBVwBpgIu9TrHJM3Z3NEQGkAhSswE1
         UqGio2AzzAfPtTSIqwMOyr5zqLwSMXFLQZCQUsQX9sYZSbtRoWC4JW8tbU2Ij047v4KQ
         WiVQ==
X-Gm-Message-State: AOAM531Ko1eHJ2LNja0vTFyAhUKlT2roj7eX+wIJNYIdTxO9OsomDK1H
	bztirxbuvaT0B2Brihz9uu432Apa
X-Google-Smtp-Source: ABdhPJwyI8k08dTQrEIh8ha9XImFQNxBNIju+pNEtxLdg6ZgN3n/1rq6/RgUqH0iazqB8y+fN1yCSQ==
X-Received: by 2002:a05:6000:1149:: with SMTP id d9mr12261020wrx.335.1596818582517;
        Fri, 07 Aug 2020 09:43:02 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from ip-172-31-20-103.eu-west-1.compute.internal (ec2-54-229-56-102.eu-west-1.compute.amazonaws.com. [54.229.56.102])
        by smtp.gmail.com with ESMTPSA id t189sm11122006wmf.47.2020.08.07.09.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 09:43:00 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] systemd: upgrade v245.6 -> v246
Date: Fri,  7 Aug 2020 16:42:49 +0000
Message-Id: <20200807164249.32605-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop backport of CVE-2020-13776 (merged upstream), refresh
0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch. Refresh
musl patches for v246.

Commits:

  ae366f3acb NEWS: last rites
  cae1e8fb88 loop-device: implicitly sync device on detach
  3660da17b0 Merge pull request #16624 from keszybz/timesync-retry-interval
  e7e954243a udev: fix codesonar warnings
  b67ec8e5b2 pid1: stop limiting size of /dev/shm
  2f2c60d7fe path-util: make use of TAKE_PTR() where we can
  b6eb208b29 hwdb: Add EliteBook to use micmute hotkey
  c8f3d7672c repart: log fixes
  5919bd3df3 timesync: increase retry interval more slowly
  8588146f69 added alternative version of SurfTab Twin
  2ac7eec3b5 network: fix use of uninitialized value
  b209cff2ad network: Fix "Unknown section 'DHCPv6PrefixDelegation'." message
  c05b8edde0 NEWS: mention about [DHCPv6PrefixDelegation] section
  dd57cf6444 meson: run 'ninja man/update-man-rules' again
  6b222c4b02 man: fix link markup
  0cfb490fe9 Merge pull request #16585 from yuwata/network-dhcp6-fixes
  ee56c072b9 Merge pull request #16590 from keszybz/test-fs-util-relax
  f8528230b3 Merge pull request #16576 from keszybz/bump-tmp-size
  b1d666ac58 test-cgroup-util: Handle result=NULL as empty string
  f649325ba7 firstboot: Update help string with --root-shell options
  c550cb7f8c test-sleep: add more logging, show secure boot mode
  02e1eb6d02 NEWS: mention new tmpfs limits
  362a55fc14 Bump /tmp size back to 50% of RAM
  99e015e28c network: rename settings about DHCPv6 Prefix Delegation
  61c0ef4ff3 network: make RADVPrefixDelegation enum bitfield
  ea121d8f25 network: update address infomation even if link is in failed or linger state
  e55265184b network: do not assume static addresses are configured
  15797d6a2b network: check at least one dynamic address is assigned when DHCP is enabled
  1633c45731 network: dhcp6: drop addresses and delegated prefixes on client stop
  1c09d84e42 network: rename ipv4ll_address -> ipv4ll_address_configured
  b0b9776656 network: ndisc: also remove old DNSSL or RDNSS records after an SLAAC address is ready
  69203fba70 network: ndisc: remove old addresses and routes after at least one SLAAC address becomes ready
  6e537f62d7 network: dhcp4: release old lease after the new address become ready
  80b0e86084 network: make address/route_configure optionally return created Address/Route object
  8eec0b9da5 network: set key destructor in several hash_ops
  5f58af25e6 network: make link_check_ready() return earlier if the link is not in 'configuring' state
  3336e946da network: ndisc: do not set configured flags when addresses or routes are not assigned yet
  5d8c3ec1e9 network: make link enter failed state if address_update() failed
  97f000744f network: introduce callback called when an address becomes ready
  c9d223e803 test-network: add tests for prefix routes
  3606ca659e network: add debug log for configuring address
  c21ed6812e test-ndisc-rs: increase timeouts
  500727c220 test-path: increase timeout
  933ab8199d test-fs-util: do not assume /dev is always real
  31363bd564 firstboot: Check if the given shell exists
  97efde65d8 network: radv: Send RA on newly-added dynamic prefix
  c8f12abc73 Fix clang-11 issues
  116d6d2965 catalog: update Polish translation
  f527c6fa08 resolvectl: fix older resolved or networkd support to set DNS servers
  e128723dae Merge pull request #16566 from poettering/nspawn-osrelease-fixes
  a8bd4bab75 Merge pull request #16567 from keszybz/more-news
  199a892218 selinux: handle getcon_raw producing a NULL pointer, despite returning 0
  d05f7b5007 semaphoreci: update Debian release to bullseye
  38821a0e29 update TODO
  d64e32c245 nspawn: rework how /run/host/ is set up
  62b0ee9eb1 portabled: update host's os-release path
  98aac2ad5a doc: update os-release spec with new path for container host's file
  549719699c NEWS: fix typo in path
  d130181fd8 nspawn: add missing spdx header
  e9769453e3 Merge pull request #16561 from yuwata/test-ordered-set
  8047ac8fdc core: clean more env vars from env block pid1 receives
  337f0b0094 NEWS: reorder entries a bit and add a few items
  8b25484af3 NEWS: update contributors list for v246-pre
  c015d657ec hwdb: update again for v246
  b226422cd7 firstboot: don't create /etc/passwd with mode 000
  2a2e78e969 nspawn: fix MS_SHARED mount propagation for userns containers
  fe224669fb Update mkosi.ubuntu to 'focal'
  6f5d73aba6 network: compare with peer address if it is specified
  01b92946c5 Merge pull request #16532 from yuwata/network-sync-state-file
  d4fa0493a7 test-ordered-set: add a case where we get 0 for duplicate entries
  5cf821acf8 man: do not say that isolate is like switching runlevels
  402e1e699f Merge pull request #16557 from keszybz/two-ci-fixes
  2645d4bcc1 test: clarify that ordered_set_put() returns -EEXIST if entry is duplicated
  0390b094f5 meson: do not choke on time epoch when there are no git tags
  960a64691f semaphore: pull in tree explicitly
  495454f40f update NEWS
  82ff544160 Merge pull request #16496 from DaanDeMeyer/firstboot-shell
  bd190899bb Get SOURCE_EPOCH from the latest git tag instead of NEWS
  00b868e857 Merge pull request #16542 from keszybz/make-targets-fail-again
  c3f8a065e9 execute: take ownership of more fields in ExecParameters
  28900a1bfe firstboot: Add --root-shell option
  c4a53ebf7a firstboot: Tighten up passwd/shadow handling
  94d1ddbd7c pid1: target units can fail through dependencies
  74c8e3c4e0 Revert "units: drop OnFailure= from .target units"
  771b52427a core/job: adjust whitespace and comment
  7f8c1e95a5 test-network: add test for duplicated IPv6Token=
  2c62149509 network: ndisc: ignore duplicated IPv6Token=
  92ee90af47 network: ndisc: do not store duplicated data in Set
  3bb4126262 Merge pull request #16536 from poettering/time-clock-map-fixes
  3dbd8a15d5 util: use IN6_ARE_ADDR_EQUAL() macro
  f91b234077 test-network: drop unnecessary sleep() in NetworkdStateFileTests.test_state_file
  1b14222124 network: make bus methods sync link state file
  c2a6595014 network: introduce link_save_and_clean()
  f281fc1e95 tree-wide: use siphash24_compress_string() where it is applicable
  1c568d65ac util: introduce siphash24_compress_string()
  6c04fccb1d util: make siphash24_compress_boolean() inline
  e3643b00a8 test-path: decrease variable scope
  8f8c7801e9 test: increase timeout for test-path
  2859bb932b Merge pull request #16530 from yuwata/udev-fix-race-in-renaming-network-interface
  63fdaa36c5 Merge pull request #16407 from bluca/verity_reuse
  8fa2cd83c6 Revert "man: add note about systemd-vconsole-setup.service and tty as input/output"
  2aa5a13aa9 test: adapt test-functions for SUSE
  f25e9eda52 Merge pull request #16514 from keszybz/zstd-decompress-fix
  b876b07812 Merge pull request #16540 from poettering/acl-fix
  ac1f3ad05f verity: re-use already open devices if the hashes match
  536879480a dm-util: use CRYPT_DEACTIVATE_DEFERRED instead of ioctl
  d81be4e752 coredump: port to use common add_acls_for_user()
  2ea6247e01 acl-util: fix error handling in add_acls_for_user()
  002674387c offline-passwd: use chase_symlinks()
  628db21130 update TODO
  0da322d9a4 man: update docs with the new functions and other enhancements
  7cbb7d62c6 homectl: fix warning about unused function
  06847d0fba TODO: add entry for XZ
  e4a321fc08 journal/compress: remove loop in decompress_startswith_zstd()
  a24153279e journal/compress: fix zstd decompression with capped output size
  b4a11ca3f2 journal: use -EPROTONOSUPPORT for unknown compression
  76cbafcdd4 sd-journal: when enumerating, continue even after an inaccessible field
  04dffc0add user-util: indentation fix
  58afc4f8e4 core: don't acquire dual timestamp needlessly if we don't need it in .timer handling
  d3926f9a46 test: add basic test for clock mapping
  7c0eb30e32 time-util: rework clock conversion logic
  4c967576da update NEWS
  6456dafa12 Merge pull request #16504 from poettering/read-file-ipc
  c400d040ce import: always prefer GNU tar, to avoid cmdline incompatibilities
  3177b9270c fileio: add brief explanations for flags
  49f16281c9 tree-wide: use READ_FULL_FILE_CONNECT_SOCKET at various places
  c668aa8b35 fileio: allow to read base64/hex data as strings
  b93d3f6b81 fileio: add support for read_full_file() on AF_UNIX stream sockets
  f294470262 fileio: add explicit flag for generating world executable warning when reading file
  2e3e2750bb Merge pull request #16519 from yuwata/networkctl-altnames
  739b9a4354 Merge pull request #16353 from yuwata/network-dns-sni
  28266c446a udev: drop unnecessary checks
  ae353ec2f6 udev: save ID_RENAMING= property to database before renaming network interface
  1cdea1a2f7 network: update one log message
  08de6f945d test: run systemd-dissect and systemd-run with log level debug in TEST-50-DISSECT
  3a978b30cd logind: Fix org.freedesktop.login1.set-reboot-to-boot-loader-menu saving to the wrong file in the non EFI case
  ddbab78f9a bus: use bus_log_connect_error to print error message
  711dd5db9e man: update explanation about the format to specify DNS servers
  a574b7d152 resolvectl: use bus_message_read_in_addr_auto()
  7695e2cbbe network, resolve: use bus_message_read_ifindex() or friends
  3dd95ab6c5 util: introduce bus_message_read_ifindex()
  10d4620467 util: introduce bus_mesage_read_dns_servers()
  976009897b util: introduce helper functions to read in_addr from bus message
  e293e755d5 util: drop duplicated inclusion of sd-bus.h
  66479677a9 test-network: add tests for DNS= with port number and SNI
  a747e71c56 resolvectl: show DNS servers with port and SNI
  b1881e8320 resolvectl: make DNS servers can be specified with port number and SNI
  8e56ea4c88 resolve: add DBus properties which support DNS SNI and port number
  95ce1ba87b resolve: add DBus method to set DNS server with port number and SNI
  4e11ddfdd3 network: add DBus method to set DNS server with port number and SNI
  87d6489776 network: save DNS servers specified by DBus interface
  6458176514 network: do not save DNS= entries not match link ifindex
  e77bd3fdff network: support port number and SNI in [Network] DNS=
  8aa5afd20f resolve: read/save port number and SNI from/into link state file
  b6af282475 resolve: compare port and SNI in dns_server_hash_ops
  1b86009298 resolve: also compare port and SNI in dns_server_find()
  da9de7385a resolve: support port specifier in DNS= setting
  395aa34023 resolve: ignore empty server name
  408f8fbc0f util: introduce 'struct in_addr_full' and its helper functions
  a723fb85da util: introduce in_addr_port_ifindex_name_from_string_auto() and in_addr_port_ifindex_name_to_string()
  cbe194b39e resolve: propagate error in link_load_user()
  eced0d2a46 Merge pull request #16518 from yuwata/network-fix-failure-in-updating-mac-address
  2665327a41 travis: compile with -O1 with clang
  d7d717b7e2 docs: Document xdg-autostart parameter X-systemd-skip
  4c0668bc14 Merge pull request #16478 from bluca/dissect_tests
  6a097936b2 docs: Update section about XDG autostart generator
  e6791b5522 Merge pull request #16497 from DaanDeMeyer/mkosi
  7e8279c0a6 Merge pull request #16501 from yuwata/udev-fix-renaming
  807667f7ac network: stop already running engines before updating MAC address
  96fe813c42 radv: introduce sd_radv_is_running()
  48c5398951 networkctl: do not ignore -EOPNOTSUPP when reading netlink message
  ae5b779252 networkctl: sort alternative names
  0ef1adf512 vconsole-setup: downgrade log message when setting font fails on dummy console
  628f08b66d sd-netlink: make timeout message sealed
  d735e4f2d6 Merge pull request #16505 from yuwata/network-manage-foreign-routes-cleanups
  ed4512d009 nspawn: set container_host env vars before user arguments
  a9c9b18a95 networkd: Use NLM_F_ACK on the netlink message to add a neighbor.
  d3f45d130e clang-format: set Break afer enum to false
  4573592ddf Merge pull request #16512 from keszybz/offline-passwd-altfiles
  241947d1b4 shared/offline-passwd: look at /usr/lib/{passwd,group} too
  3e5d2264b5 Move offline-password.[ch] to shared and add test-offline-passwd
  55678b9eae build: skip installation of 2 files if feature is disabled
  0119ab3d6c Merge pull request #16476 from keszybz/qemu-autosuspend-rules
  a8c10331b4 network: replace NDISC -> NDisc in log messages
  5eec0a0810 network: introduce address_exists() helper function
  d15818f227 network: update debug log when foreign routes are received with ManageForeignRoutes=no
  5ff1ef31f2 network: do not enumerate routes if ManageForeignRoutes=no
  97fdae33df udev: do not try to reassign alternative names
  434a348380 netlink: do not fail when new interface name is already used as an alternative name
  1498252614 netlink: introduce rtnl_get/delete_link_alternative_names()
  77547d5313 hwdb: check that uppercase digits are used in modalias patterns
  7f16ef9fba Merge pull request #16490 from yuwata/network-radv-ndisc-cleanups
  457763aa03 hwdb: allow spaces in usb: matches and similar patterns
  dc9e9a18be Merge pull request #16491 from keszybz/udev-logging
  e5f0010659 mkosi: Update help comment in settings files
  172ad053ff mkosi: Keep mkosi.default out of the repository.
  9e79123884 tree-wide: use SYNTHETIC_ERRNO with log_device_* in more places
  46d4149d0f sd-device: use LOG_PRI() in log_device_full()
  b5ef66101a analyze: CAP_RAWIO -> CAP_SYS_RAWIO
  94ec163ad2 timedatectl: do not show (null) if the address of NTP server is not resolved
  ec8bebbcc2 Add autosuspend rules for emulated QEMU devices
  df7667323d udev: change the modalias string for usb devices to include the device name
  d6d4961b01 udev: don't complain when udev_watch_end() is called without udev_watch_init()
  6b9f5f01cb basic/string-table: reduce variable scope
  5992f362bf udevadm: use STR_IN_SET(), add comment
  fe20121a4c sd-device: use strjoin instead of asprintf
  22ba4525d3 udev: tweak debug logs for udev rules
  12254ccab0 man: add more details for IMPORT, PROGRAM and RUN keys
  ba60127df7 udev: accept OPTIONS+= without any fuss
  b6a80b83bc udev: accept IMPORT{}= without any fuss
  13e8a49a58 network: ndisc: any failures in processing event make the link in failed state
  c97785168b network: radv: clean up conf parsers
  19b4864346 hwdb/autosuspend: add missing parenthesis
  d96edb2c6e network: downgrade log level in conf parsers
  4d939d2c84 Merge pull request #16485 from bluca/nspawn_os_release_mounts
  9e54462cd5 Merge pull request #16482 from poettering/coverity-246
  14f1c47a0c nspawn: mount os-release in two steps to make it read-only
  eafc7d6056 nspawn: use access/F_OK instead of stat to check for file existence
  2094cd49c4 shared/os-util: fix comment style to follow guidelines
  cc76bf01e3 basic/mkdir: use uid_is_valid instead of manual check
  40282752a2 Merge pull request #16483 from poettering/man-env-d-no-session
  27806670ef Merge pull request #16480 from yuwata/network-fix-dhcp4-races
  3f13f9159f man: configuration files contain assignments, no directories
  d320bfa558 man: GNOME is usually capitalized
  a449b7198c man: don't claim environment.d/ was about sessions
  3cd4459003 Revert "selinux: cache enforced status and treat retrieve failure as enforced mode"
  8e32ad9557 machine: fix if check
  f63ef93703 execute: fix if check
  0ded0e40ab dhcp4: only renewing lease when the client already has a lease
  330f899079 load-fragment: downgrade log messages we ignore to LOG_WARNING
  89a5385fb7 mountpoint-util: fix error handling
  f766d9af38 network: dhcp4: add two warnings
  153cf04139 network: dhcp4: fix another race with SendDecline=yes
  75be72d139 network: dhcp4: also release old lease in dhcp_lease_lost()
  8d5bb13d78 core: fix invalid assertion
  aeba8dd523 network: fix typo
  2bc148add0 test: exercise RootImage, RootHash and RootVerity in TEST-50-DISSECT
  0f5d24a8b9 test: pre-assemble minimal image for TEST-50-DISSECT at build time
  a5f1d665d7 test: exercise systemd-dissect with GPT and verity in TEST-50-DISSECT
  6939873412 test: exercise systemd-dissect --mount in TEST-50-DISSECT
  42165319b1 update TODO
  95b29f3267 Merge pull request #16396 from yuwata/network-configured-flag
  b8ff0663e8 Merge pull request #16468 from keszybz/two-unrelated-patches
  43bf28741f network: drop doubled white space
  93b0b88c3a network: free address when it is removed
  6906794dd1 network: dhcp4: do not assign new address before old one is not removed
  5d976f5f64 network: do not call link_check_ready() in link_request_set_routing_policy_rule()
  0c816fcc7b network: make link_request_set_nexthop() called from link_request_set_routes() or route_handler()
  659ad3a0af network: do not make link in configured state when no address is assigned
  d98c546dac network: ndisc: split ndisc_configured flag into for addresses and routes
  01c344bdd4 network: ndisc: do not ignore remaining addresses
  571f953934 test-network: wait for addresses are not in tentative state
  39373cb984 network: add debugging log why link is not in configured state yet
  c5fcd8a70a test-network: check assigned address is not tentative state
  491b79aeac test-network: set IPv6AcceptRA=no if no dynamic addresses are not required
  eb01a2dfb1 network: make link_request_set_nexthop() static
  a4623f84ed network: add a debugging log
  feb596b5c3 network: include error code in the log message
  2a877f4560 network: set dhcp6_xxx_configured flag after routes/addresses are assigned
  ee5c1311ee logs: when embedding catalog info in log output use a dash of color and unicode
  a996ead6a2 Merge pull request #16398 from poettering/machined-varlink
  26698337f3 timer: Adjust calendar timers based on monotonic timer instead of realtime
  d3e0662c7d Revert "ci: turn off the "upstream-systemd-ci" ppa"
  06bb441102 test: Add "finish" rule to .PHONY
  76830e2500 Merge pull request #16462 from keszybz/rpm-macro-warnings
  b56a877ef8 test-fs-util: use log_info instead of printf
  d4ff79bbe1 ci: turn off the "upstream-systemd-ci" ppa
  6cdc429454 Merge pull request #16340 from keszybz/var-tmp-readonly
  56a13a495c pid1: create ro private tmp dirs when /tmp or /var/tmp is read-only
  a318a5659a man: document F1 in sd-boot too
  1061fc1c17 rpm: include macro name in errors for two args macros too
  281014b73e rpm: adjust various macros to print macro name in the error message
  8800df5f71 Merge pull request #16430 from mikhailnov/fix-rpm-create-package-macros
  dad2062f40 update TODO
  38ccb55731 nss-mymachines: drop support for UID/GID resolving
  4c2cf15751 man: document new varlink service
  4751364e76 machined: implement user/group lookup varlink API in machined too
  74d1b7d2ad machined: refactor UID/GID machine translation
  a07f18cd30 process-util: make sure procfs_file_alloca() works for non-literal field names too
  56870d324b docs: permit user/group services that do not support enumeration
  16a4a2f8cc update TODO
  08ef688656 analyze: make testing ConditionPathExistsGlob= work
  4519c7c706 update TODO
  77ee1783eb udevadm: beef up deprecation log warning
  a18c7865be meson: do not install testdata when -Dinstall-tests=false
  60b45a80c1 Update .clang-format
  5b72b34708 Make the instructions slightly easier to read
  8ba6c15a82 Merge pull request #16437 from systemd/coverity-gcc-10
  b7067c4d87 coverity: install systemd
  1374448add coverity: switch back to Fedora 31
  46072ae35a repart: include more relevant information in the warning message, fix test
  5553041a62 Merge pull request #16435 from gaoyi1988/master
  6b949d2605 NEWS: mention source mode for MACVLAN or MACVTAP
  ddcdcac519 Merge pull request #16432 from cgzones/selinux_err_fix
  0d3a8bc7eb test: add test case for multi matches when use "||"
  1e67a9c2cd udev: specify the end of value
  d67b1d18fc bus: use bus_log_parse_error to print message
  f2df56bfea namespace: unify logging in mount_tmpfs
  db06c162e8 shared: fix error handling in make_inaccessible_nodes
  3e6e0856cd rpm: avoid hiding errors and output in *_create_package macros
  93406fd379 rpm: avoid odd symbols in EOF indicator
  b159831b61 Merge pull request #16424 from keszybz/cap-bpf-compat
  b0ff0eaa01 Merge pull request #16426 from cgzones/run_user_label
  675fa6ea28 man: fix some manvolnum
  abad72be4d namespace: fix MAC labels of TemporaryFileSystem=
  8d9cbd809d selinux: create standard user-runtime nodes with default context
  7a3e4dc38b basic: add helper function mknod_label()
  5149990e1f NEWS: grammar improvements (#16413)
  5c53766f28 Added MSI Prestige15 A10SC specific keycodes
  d0571b758b Add support for HP Elitebook x360 1040 G6 micmute button
  ed1de7108e Explain how to determine hierarchy type from shell
  5700780389 basic/cap-list: reduce scope of variables
  864a25d99b basic/capability-util: let cap_last_cap() return unsigned integer
  417770f303 basic/cap-list: parse/print numerical capabilities
  76fb53c94a install: fix wrong data type
  a38c68a18a NEWS: drop duplicate entry, add --image= entry
  976efe1b80 NEWS: add date
  a127c6208f userdb: fix dlopen call
  5157d719f0 Merge pull request #16411 from ddstreet/bridge_without_carrier_fails
  5961d35a5b NEWS: add blurb about os-release and $container_host_*
  55aacd502b Merge pull request #15891 from bluca/host_os_release
  001c07cfff test-netowrk: in test_bridge_configure_without_carrier, avoid strange test failures
  48c190822b Merge pull request #16405 from sipraga/master
  02b0109af5 Merge pull request #15955 from anitazha/nullorempty
  4e3376d43a test-network: don't print networkctl output for passing subtests
  62320feb9f Merge pull request #16404 from keszybz/release-246-prep
  2e7090e94d test: bump the TEST-47 sleeps once again
  0d0de133f0 network: add support for MACVLAN source mode
  3994922baf meson: bump version numbers for v246
  72e5190878 NEWS: update contributors list for v246-rc
  9c70fc2164 git-contrib: simplify implementation a bit
  cbc056c819 core: wrap some long lines and other formatting changes
  24e2494407 Merge pull request #16385 from JackFangXN/master
  43b24a0716 sd-device: use log_device_debug_errno()
  4b6607d949 table use table_log_print_error() instead of table_log_show_error
  df83eb546b table add table_log_sort_error()
  d836018a73 table add table_log_show_error()
  c253a95bca Merge pull request #16379 from yuwata/network-dhcp6-delegated-prefix-address-handler
  21d19a7a13 docs: update information where to file bugs against RHEL/CentOS versions of systemd
  2e2f6a01a0 Merge pull request #16143 from fbuihuu/fstab-generator-fix
  5dc60faae5 add error message when bind mount src missing
  3650173fec network: make address_handler() static
  a211ff4b84 network: introduce own address handler for dhcp6 delegated prefix
  2b0bf3ccf8 Merge pull request #16301 from poettering/firstboot-image
  9870cfdf7f Merge pull request #16388 from keszybz/xdg-desktop-fuzz-case
  60e3a5a252 Merge pull request #16390 from keszybz/coverity-and-typos
  dea7f5cc87 xdg-autostart: ignore all empty entries in multi-string entries
  f4e1a42592 man: match parentheses
  d1ca1f7c2a xdg-autostart: avoid quadratic behaviour in strv parsing
  a53f024d71 journald: minor wording tweak in message
  cd990847b9 tree-wide: more repeated words
  0da425df65 networkd: use capitalized "IP" and "TOS" in messages
  8ab0f03266 journal/compress: drop "future" code in zstd compression
  d7b34e3841 all: fix minor typos
  5d043c9fdf update NEWS
  cbe952fe1f update TODO
  737ec51444 TODO
  a122502077 firstboot: add option to turn off welcome text display
  dcfdd62184 man: document the new --image= switch of systemd-firstboot
  3ff9fa591e firstboot: add --image= switch
  827ea52125 mount-util: use UMOUNT_NOFOLLOW in recursive umounter
  e49ee28522 mount-util: add destructor helper that umounts + rmdirs a path
  e2ec9c4d3a namespace-util: introduce helper for combining unshare() + MS_SLAVE remount
  9ecf5d9340 fuzz: add test case that should already be resolved
  cda667722c core: refresh unit cache when building a transaction if UNIT_NOT_FOUND
  3f2e15abc5 sleep: one spelling unification
  77ecc1aaa5 Merge pull request #16380 from yuwata/network-dhcp6-update-prefix-route
  9389a271b7 Merge pull request #16381 from yuwata/dhcp4-renewing
  a240147bdc Merge pull request #16383 from yuwata/network-dhcp6-radv-update-prefix
  7f6e342c93 hwdb: Add Google Pixel Slate (nocturne) (#16377)
  58e6c62191 network: fix memleak
  1d596fdec2 network: do not restart radv engine when adding prefix
  8fc2a5dff4 network: fix indentation
  290696e512 Revert "network: Don't send RA with zero router lifetime when restarting radv"
  c1495f8e9d fix typo
  d469cea3bd network: Don't send RA with zero router lifetime when restarting radv While investigating https://github.com/systemd/systemd/issues/16356, I discovered that networkd stops the radv service before adding or updating prefixes and then starts it again.  This causes networkd to send an RA with a router lifetime of zero, causing the routes to flap on systems receiving the RA for a fraction of a second before radv is started again and proper RAs are sent.  That has the potential to cause issues with latency-sensitive traffic like gaming or VoIP.  This patch adds a boolean argument to the sd_radv_stop() function to control this behavior.  The zero lifetime RA is still sent whenever radv is actually being stopped, but when it is being restarted for a prefix update (from networkd-dhcp6.c), the final RA is no longer sent to avoid the route flapping.
  921693a0f3 dhcp4: do not try to renew address when client has no lease
  ceaec54a3c dhcp4: do not renew address if client is not running yet
  f050c94df0 network: always update acquired prefix route
  1419ff0401 network: decrease indentation level
  cecd68c70f network: fix indentation
  c82012605b Merge pull request #16374 from keszybz/docs-and-networkd
  08bf20287c hwdb: update again for v246
  98ebef62c7 DHCPv4: client add support for DHCP server allow list
  b3077c47a8 Merge pull request #16344 from keszybz/update-utmp-erofs
  c5bc4f77d9 hwdb: add another Logitech M705 mouse variant
  5544cd3199 Merge pull request #16373 from JackFangXN/master
  9a61e8fca2 unit-name: fix a potential memory leak
  1f68f77292 networkd: we should not loop when extract_first_word() fails
  8dc647fd30 man: do not say that tasks are threads and processes
  24c8d4d3f4 man: one more typo
  b37e4d9c87 Merge pull request #16370 from keszybz/tree-wide-spelling
  e26538dd04 network: tc: fix n_prio bounds check
  f987a261b4 userdbctl homectl use table_log_add_error()
  f04a98e13f Fix two typos found by codespell
  bdac560801 tree-wide: drop quotes from around [section]
  e9dd698407 tree-wide: fixes for assorted grammar and spelling issues
  a64911f9b7 travis: install missing deps for the Coverity run
  c5fbdebec6 Merge pull request #16287 from yuwata/udevadm-info-attribute-walk
  4276749dd3 shared/install: do not require /dev/null to be present in chroots
  3da49ad55a catalog: update Polish translation
  ca1d199b48 update-utmp: do not fail on EROFS
  c2a9909377 Define _cleanup_ helper for setutxent()+endutxent()
  bf795c47bc test: use KILL instead of SIGKILL in TEST-52-HONORFIRSTSHUTDOWN
  21c7fe6d12 sd-device: be more defensive in FOREACH_DEVICE_SYSATTR
  2fadbb4535 core: set private section name for automount units
  c2056dd6f9 hwdb: Pavilion 13 x360: Tablet mode and SYSRQ key
  071be2fa9f Merge pull request #15442 from poettering/fido2
  21df146501 udevadm: sort entries in `udevadm info -a` by attribute name
  fadcc12229 sd-device: make FOREACH_DEVICE_SYSATTR() list attributes in subdirectories
  33d943d168 initialize arg_clock_usec
  9e99bfbd5a Merge pull request #16348 from yuwata/news-sriov
  640f3b143d core: check null_or_empty for masked units instead of /dev/null
  71af436c63 NEWS: mention .network [SR-IOV] section
  554a97ba23 NEWS: WithoutRA= is not a boolean option anymore
  a68da22257 NEWS: tweak WithoutRA= description a bit more
  272ac70a21 various daemons: emit Stopping... notification before destructing the manager object
  cc090ca7fe initctl: use _cleanup_ and run()
  e9d9d50cef initctl,update-utmp: define iterator variable in loop
  bc9d1dbfc8 update-utmp,initctl: drop ppid check
  c03ef420fa network: tc: rename several settings which take size in bytes
  25b67032a8 Merge pull request #16343 from jirislaby/master
  cc832f9772 Merge pull request #16338 from keszybz/spelling2
  63b7e7b4ba Merge pull request #16336 from yuwata/ifindex-cleanups
  cbdf02952e NEWS: update document about WithoutRA=
  1447dc625a Merge pull request #16219 from ssahani/network-sr-iov
  74986a0f88 hwdb: Add accel orientation quirk for UMAX VisionBook 10Wi Pro
  52e085af82 tree-wide: "unparseable" → "unparsable"
  13adf35343 resolve: use appropriate type
  5e958e1d6c util: use setsockopt_int() at one more place
  1a6c913676 libsystemd-network: rename index -> ifindex
  7fa69c0a6f dhcp6, radv: only accept valid ifindex
  15e6a6e87b tree-wide: spell "lifecycle" without hyphen everywhere
  37b22b3b47 tree: wide "the the" and other trivial grammar fixes
  838d39af93 network: Allow DHCPv6 client  to start solicit mode
  51115fdc42 l10n: update Czech Translation
  6371e69b49 fstab-generator: introduce an helper to write extra dependencies specified via the mount options
  045c5faf5a fstab-generator: extra dependencies specified in fstab should be applied to the mount unit
  c8fe23d45c update TODO
  4442c26942 man: update homectl man page with documentation for new features
  fe2520fbb5 docs: document new FIDO2 user record fields
  0eb3be4644 homectl: add --pkcs11-uri=auto and --pkcs-11-uri=list support
  2af3966af3 homectl: add acquired fido2 PIN to user record
  93295a2501 homectl: split out pkcs#11 related code bits into own .c/.h file
  c98811d837 homectl: rework how we log when doing a home directory update
  8e62dfb12a homectl: do generic error handling/retry also when creating a home directory
  f737186ab1 homectl: show touch emoji when asking for PKCS#11 protected auth path
  85b1294488 pam-systemd-home: print helpful message when token's PIN is locked
  7b78db28e5 homed: add support for authenticating with fido2 hmac-secret tokens
  1c0c4a43c6 homectl: add support for enrolling FIDO2 HMAC-SECRET tokens
  5e4fa456fa user-record: add fields for FIDO2 HMAC authentication options
  af4fbd463f build-sys: add libfido2 as optional dependency
  c0bde0d240 user-record: rename JSON field "pkcs11Pin" to "tokenPin"
  d00f318323 user-record: securely erase pkcs#11 when assigned NULL too
  7b8d55b72c homectl: add missing log messages when json_variant_format() fails
  c63ec11bf5 pkcs11-util: reduce scope of a variable
  1146b664e6 macro: add new FOREACH_POINTER() macro magic
  428d32afea locale-util: add support for touch emoji
  830ffbce1b doc: add recentry introduced transient settings
  9457b6bb21 Merge pull request #16303 from poettering/dbus-util-split
  3d2c26925f test-network: add tests for SR-IOV
  c3a5025dc6 network: add MACAddress= setting in [SR-IOV] section
  e64b31c848 network: add VLANProtocol= setting in [SR-IOV] section
  518cd6b527 network: Introduce SR-IOV
  5908ddd763 sd-netlink: Add SR-IOV netlink properties
  b46d8c1c70 udev: spi: include chip select number in ID_PATH
  d17eabb105 Fix build with µhttpd 0.9.71
  116739cfb6 Merge pull request #16316 from yuwata/backlight-use-actual-brightness
  5c236388c3 update TODO
  6c3a19d5b3 Merge pull request #16313 from yuwata/network-move-ipv6ll-gen-mode
  7233e91af0 core: store timestamps of unit load attempts
  f93dd4b940 Merge pull request #16282 from poettering/repart-copy-blocks
  437b9a7f75 backlight: read current backlight brightness from 'actual_brightness' attribute
  daa227a320 backlight: call log_setup_service() before logging
  74f1bb5c9f backlight: use SYNTHETIC_ERRNO() macro
  40af3d020f shared: split out property get helpers
  9176326ba2 shared: split out code for printing properties
  807542bece shared: split out code that maps properties to local structs
  9b71e4ab90 shared: actually move all BusLocator related calls to bus-locator.c
  c664cf5607 shared: split out BusObjectImplementor APIs
  7aee1e7304 hwdb: adjust touchpad edge detection for X1Tab3 (#16310)
  aa0b850bca NEWS: minor fixes
  6f6296b93f network: move IPv6LinkLocalAddressGenerationMode= to [Network] section
  3ea58e010d NEWS: add several entries about networkd
  26b0fda9b7 test-repart: allow the test to pass on non-amd64 architectures
  e4f8d5e01f shell-completion: add missing verbs for networkctl
  8f843190ff test: bump the timeout for systemd-hwdb-update.service under ASan
  0e31a6c2ad Merge pull request #16142 from poettering/random-seed-cmdline
  bed0b7dfc0 pid1: warn if people use User=nobody (#16293)
  7143b95552 efi: define cache functions inside EFI_ENABLE ifdef
  cb713f1696 tree-wide: spellcheck fixes
  7f56c26d10 NEWS: reorder entries with some minor additions
  0cffae953a core: add device mapper to allow-list with DevicePolicy=closed and RootImage
  b47261e5cb update TODO
  e78228b1b0 update TODO
  10f9436c2d Merge pull request #16281 from poettering/logind-cache-more-efi
  0090b551e6 Add quotes for -n
  22aa58adc9 JOURNAL_FILE_FORMAT: minor markdown fixes
  1f19ae0ffb NEWS: add more items for 246
  af2697e83d logind: also cache LoaderEntryOneShot EFI variable
  e8df4eee65 efi-loader: cache LoaderConfigTimeoutOneShot too
  6eea6e30ab tmpfile-util: typo fixes
  95fc17bf46 util: add missing header guard
  12d14b7373 Merge pull request #16096 from poettering/journal-hash-fix
  a79be2f807 hwdb: update for v246
  7caaf44777 update TODO
  757bc2e4c1 repart: add new CopyBlocks= setting
  3f11426f52 Merge pull request #16275 from yuwata/network-deprecate-netdevsim
  fdf3e48c44 udev: split attribute assignment for MMC cards
  6d88513e6b portabled: create temp file for unit, not directory
  823e917f13 selinux: check mac_selinux_init() in tests
  0986bb9b95 Merge pull request #16278 from keszybz/fix-man-links
  66ed28d332 Merge pull request #15624 from poettering/hostnamed-instant
  98506a41fe Merge pull request #15697 from OhNoMoreGit/fix-path-units
  5c0102f83f update TODO
  c85cf04fa3 compress: do something roughly reasonable when building without compressor
  3afe5c00a5 coredump: use log_error_errno() where appropriate
  d80b051cea tree-wide: add new HAVE_COMPRESSION compile time flag
  70cd1e561c docs: document the new journal file format additions
  bbcd38e41e docs: import journal file format docs from fdo wiki
  8653185a9e journal: support zstd compression for large objects in journal files
  0dbe57ee86 journal-file: when individual hash chains grow too large, rotate
  4ce534f4cd journal: use a different hash function for each journal file
  7851ec6634 journal: make signature arrays const
  20b0acfacd journal: rename hash64() to jenkins_hash64()
  f4474e004d journal-file: rename return parameters to ret_xyz
  5030c85a3e journal-file: also show field hash table size in debug output
  e958c05703 journal-file: simplify boot ID acquiring
  cde8c5f722 journal: store NE hash instead of LE hash in Match object
  a76560915f journal-file: use FLAGS_SET where appropriate
  e9ece6a0e3 journal: fix definition of _OBJECT_COMPRESSED_MAX
  d1d8f0f369 macro: add CONST_MIN() similar to CONST_MAX()
  4a5a01ccdd man: reword awkward sentence
  55cf7779f2 man: fix various internal references
  b7a4734551 man: fix links to various external man pages
  f49bead3b0 Merge pull request #16257 from keszybz/two-fuzzer-issues
  b7d81d19cc Merge pull request #16249 from bluca/root_verity_sig
  d7f4ad203a hostnamed: minimize caching of /etc/hostname, /etc/os-release and /etc/machine-info
  aa994368c9 hostnamed: don't cache local hostname either
  a055076988 ci: free up some resources on Pipelines
  efa5bef285 ci: switch to Ubuntu Bionic on Semaphore
  440988666c test-network: remove unused config
  59a9ef1022 network: deprecate netdevsim support in .netdev config
  d4d55b0d13 core: add RootHashSignature service parameter
  c2923fdcd7 dissect/nspawn: add support for dm-verity root hash signature
  035e8e50d7 veritysetup: add support for dm-verity root hash signature
  e60d3b13df Merge pull request #16265 from Werkov/fix-16248
  fd7c7fc8ee Merge pull request #16271 from yuwata/network-cleanups-around-link-get
  e41de5e491 missing: Add new Linux capabilities
  6b000af4f2 tree-wide: avoid some loaded terms
  f23810da20 fuzz-udev-rules: -ENOBUFS should be accepted too
  85fbebe61a journal: fix buffer overrun when urlifying
  f50f597217 network: fix typo in comment
  7936917e3e network: do not update operstate when netdev is not ready
  e856ed00f9 network: fix assertion in link_get()
  25b831bac8 network: check that received ifindex is valid
  d184fb39b6 test: Test memory limit parsing
  67e2baff6b cgroup: Parse infinity properly for memory protections
  b18573e16f ci: bring back Coverity part 2
  595cb4211a ci: bring back Coverity
  c4e90266db Merge pull request #16093 from yuwata/network-htb-add-settings-15213
  f9044b74c5 Merge pull request #16106 from yuwata/network-tc-ets
  f83803a649 Merge pull request #16238 from keszybz/set-handling-more
  41d1f469cf log: introduce log_parse_environment_cli() and log_setup_cli()
  3f8ed9fd96 update TODO
  18d9cee002 man: document systemd.random-seed=
  d247f232a8 core: add new systemd.random_seed= kernel command line option for seeding entropy pool
  4dd055f907 random-util: add common helper random_write_entropy() for crediting entropy to the kernel's pool
  45250e66cc pid1: don't apply "systemd.clock_usec" kernel cmdline parameter outside of PID 1
  97f1c6af8c random-seed: use ERRNO_IS_NOT_SUPPORTED() where appropriate
  e198eba7c2 sysv-generator: reduce scope of variables
  80ce54adaf socket-proxy: use structured initialization in one place
  add74e8929 basic/hashmap,set: propagate allocation location info in _copy()
  35e601d4f9 tree-wide: use set_ensure_consume() in various places
  39dbd0c74c networkd: take ref immediately after storing item in set
  d02fd8b1c6 core/bpf-firewall: use the correct cleanup function
  648c339c49 logind: fix possible memleak of message if the message was already in the set
  d378ef708b portable: rework set handling in portable_detach()
  ab9dd0b997 resolved: fix memleak on duplicate host lines in /etc/hosts
  ceb17827fa resolved: simplify allocation failure handling in dns_stub_process_query()
  b8b46b1ce5 basic/set,hashmap: pass through allocation info in more cases
  fcc1d0315d basic/set: add set_ensure_consume()
  a1ba8c5b71 feature to honor first shutdown request to completion
  7bf6babfa2 Merge pull request #16112 from poettering/nss-systemd-block-fix
  bc8d57f290 Merge pull request #16223 from cgzones/user_selinux
  3d9fbea43e selinux: update mac_selinux_free()
  1cdc42f283 hwdb: add another Logitech G502 Hero variant (#16256)
  0d0248c665 Merge pull request #16246 from benzea/benzea/xdg-autostart
  21856e3462 Merge pull request #16213 from yuwata/network-cleanup-link-state-file
  87d25bdead make-autosuspend-rules: restore compatibility with Python3 < 3.6
  db3b8d5d41 fuzz-udev-rules: rewrite to not require root privileges
  a9ba0e328f Make failures of mac_selinux_init() fatal
  a11bfc17dc Initialize SELinux in user instances
  c238a1f5f1 udev: split rules object creation and loading
  037b0a47b0 userdb: replace recursion lock
  6e78726e20 nss-systemd: skip /etc/gshadow look-ups when we just need the GID of a group
  88d775b734 util: add dlfcn-util.h
  21385e639a man: replace perl bug tracker link that went away with link to paper
  92d64d1444 man: s/PROGRAMM/PROGRAM/
  311a0e2ee6 Revert "cgroup: Allow empty assignments of Memory{Low,Min}="
  73083ca238 portabled: implement container host os-release interface
  e1bb4b0d1d nspawn: implement container host os-release interface
  34e0d56ce2 Container interface: document exposing the host's os-release
  b3b1a08a56 nspawn: use mkdir_p_safe instead of homegrown version
  17b99e377b basic/mkdir: introduce safe recursive variants
  3d0c8750c5 networkctl: display DHCPv4 server address
  fd1f3b3eed dhcp: fix entry name in parsing lease file
  46986251d6 network: drop duplicated information from link state file
  5202be27ee sd-network: drop unused functions
  862e710820 networkctl: use lease file to get DHCPv4 client ID
  d41fa6ee91 networkctl: use lease file to get DHCPv4 address
  35cab5f99d networkctl: load DHCPv4 lease file and use timezone data from the lease file
  ef0daa1129 libsystemd-network: move prototypes of dhcp_lese_save/load() to network-internal.h
  cc479760b4 Revert "job: Don't mark as redundant if deps are relevant"
  9d9a9500cd xdg-autostart: Ignore all files with GNOME autostart phase
  566cb7e23b xdg-autostart: Fix info message if Type= is not Application
  0389f4fa81 core: add RootHash and RootVerity service parameters
  6fe01ced0e nspawn: mkdir selinux mount point once, but not twice
  75ae672bb2 Merge pull request #16196 from mrc0mmand/travis-simplification
  5c9918aca0 Merge pull request #16216 from nabijaczleweli/make-a-fuss
  65804d6aff selinux-util: tweak log_enforcing_errno() to return the errno passed in or 0 when in non-enforcing mode
  9e1732924d test-functions: read /usr/etc/nsswitch.conf if /etc/nsswitch.conf does not exist (#16195)
  affa893da0 man/sd-makefs: link to btrfs.wiki.kernel.org for btrfs-man5, since the man-pages link is dead
  2edc494216 Merge pull request #16237 from keszybz/revert-message-type-check
  c2c193f79a Merge pull request #16179 from keszybz/auto-suspend-hwdb
  b98f393d88 bus-message: add macro for calculation of offset from the page
  b17af3e503 bus-message: avoid dereferencing a NULL pointer
  a9c9f79ece Revert "bus-message: immediately reject messages with invalid type"
  6cd55d6f74 shared/bus-util: fix misleading error handling
  e2ab8e09c8 udevadm-monitor: simplify creation of arg_tag_filter set
  804a436582 fuzz-netdev-parser: add test case for earlier version of preceding patches
  44e9342078 netdev/wireguard: do not invalidate peer on invalid syntax
  de7fef4b6e tree-wide: use set_ensure_put()
  0f9ccd9552 basic/set: add set_ensure_put()
  aaffd34933 sd-device: use set_put_strdup() in one more place
  29bd6012f1 resolved: introduce dns_transaction_gcp()
  7b33ff7388 make-autosuspend-rules: remove one instance of "whitelist"
  88936ed6f9 rules: remove 61-autosuspend-manual.rules
  39d5b72e32 hwdb: enable autosuspend for Wacom Pen and EMV Smartcard Reader
  aa549ff397 test: also verify the generated autosuspend hwdb file
  79dc5d35dd tools: rewrite make-autosuspend-rules.py and add udev rules
  5fde0607a8 Merge pull request #16235 from yuwata/network-fix-warning-16224
  bc694c06e6 log: Prefer logging to CLI unless JOURNAL_STREAM is set
  7830b5c103 Merge pull request #16059 from keszybz/resolve-single-label-names
  b7e8286b4a Merge pull request #15926 from fbuihuu/rework-show-status
  8db8f99eb9 man: add note regarding editing user groups
  c4e585a36b network: add missing break
  1e42c269cb Merge pull request #16239 from keszybz/cleanups
  e6175fbe45 ci: pass -Werror using CFLAGS
  8d9982e30d network: drop unnecessary "&"
  a51a3247e5 man: Fix a typo of session
  c2ad8c0978 man/sd-makefs: also mention /sbin/mkswap
  2bd5e1b272 man: document the new option
  3b5bd7d6b8 resolved: optionally allow single-label A/AAAA queries
  c2f1e83e27 resolved: drop bit-field annotations for fields in Manager
  7877e5ca7c resolved: add dns_query_candidate_freep()
  801d25ef0f man: rework description of Domains=
  876c75fe87 udev: do not execute hwdb builtin import twice or thrice
  b753e8358c test-network: add tests for ETS
  d474aa51bf network: tc: introduce Enhanced Transmission Selection (ETS)
  4dec921889 sd-netlink: add netlink properties of Enhanced Transmission Selection (ETS)
  3a712fda86 sd-boot: Add small comments after device-specific key macros
  034d0eb962 Merge pull request #16191 from poettering/repart-spec
  bc3b868b42 Merge pull request #16208 from yuwata/udev-fix-16207
  cc17c4c9a1 network: do not fail to configure non-nl80211 wifi interfaces
  845d784e54 network: drop casting in memcpy()ing IPv6 address
  5eb6ef8b45 udev: udev_event_apply_format() always make buf NUL terminated
  bc568a7a35 udev: fix error handling of sd_device_get_parent()
  2a71d57f4e network: clean-up DHCP lease server data configuration
  d5da3ada8e Merge pull request #16061 from filbranden/standalone1
  2ee7e54b9e test-network: add tests for HTB settings
  d9eacc1cdd network: tc: add more settings for HTB
  120b5c0bbe network: DHCPv6 - Add support to set token on the LAN interface
  8d2d64166e efi: use stub for cache_efi_options_variable if !ENABLE_EFI
  ffc8eeae62 USER_RECORD: fix typo
  0116d27a30 travis: sort dependencies
  305efcaf3c travis: drop stuff moved to GH Actions
  eeb8c7accf travis: use a matrix for similar jobs
  fb08381c14 repart: if now minimal size is specified, default to 10M
  e031166e15 repart: add simple specifier expansion in Label=
  cdfd853744 update TODO
  d9b6decd88 README: add reference to systemd.io
  77169ed09b update TODO
  d8a9dd0dc1 hwdb: Mask rfkill event from intel-hid on HP platforms
  c73624a553 man: do not say that systemd-modules-load.service only uses static config
  6fe95d3020 sd-boot: Work around malformed CR key code
  7daaf56761 hwdb: Add accel orientation quirk for Odys Fusion Win 12 2in1
  cb24fad361 Merge pull request #16170 from keszybz/man-user@
  387536b3a9 man: mention systemd-user-runtime-dir in user@.service too
  7283fbfd0c efi: Skip parsing SystemdOptions if there's an error getting it.
  25c86e4c39 networkd: Add missing match_wlan_iftype check to network_verify
  f1a20afacd man: Document the crypttab keyfile syntax specifying a device
  550c14fedd Merge pull request #16163 from DaanDeMeyer/resolved-edns-info
  6df8a6c753 Improve message for scheduled shutdown or reboot
  b4564641be hwdb: generate a hwdb file instead of rules for autosuspend
  4677c3da97 man: really fix conditional in homed.conf
  4f0ef40deb man: drop obsolete HAVE_PYTHON conditional
  a2095c0698 update-man-rules: properly filter out directives index again
  4f571b4061 resolved: Log the feature level we're downgrading from as well
  209b2592ed efi: Cache contents of EFI variable SystemdOptions
  6d0f38017c test: in test_bridge_configure_without_carrier, ignore setup_state
  e034886b80 resolved: Don't complain too much when downgrading from EDNS
  ac4e03d45b login: filenames in /run/systemd/users are uids
  a2c7035976 cifuzz: build fuzz target with UBsan and MSan as well
  135a1add7b turn off fuzzit part 2
  60950f3c25 Merge pull request #16144 from mrc0mmand/gh-actions-followup
  86a23f38ab ci: tweak the dependency installation
  3d0a45d5da ci: tweak the compilation options
  4e1a13db89 ci: move the build check script to workflows directory
  0664249ffc ci: do the compiler-detection magic in the test script
  ed6727d40a Merge pull request #16137 from poettering/sleep-fixlets
  119111645b Merge pull request #16136 from mrc0mmand/travis-cleanup
  35cd3db4e5 ci: add homed/zstd dependencies
  aab86b12dd github: move the clang/gcc build check to GH Actions
  241616d57d Merge pull request #16124 from ssahani/dhcpv6-duid
  43bba15ac8 pid1: rename manager_set_{show_status,watchdog}_overridden() into manager_override_(show_status,watchdog}
  0bb007f7a2 pid1: add a new SetShowStatus() bus call to override/restore show status mode
  3ceb347130 pid1: introduce an helper to handle the show-status marker
  2c4702057b sleep: pass error we see to log function
  1326de0158 sleep-config: modernize destructors
  c732e87979 sleep-config: downgrade log level in can_s2h()
  c02540dc9e sleep: clean up debug/error logging
  6f9120ad61 sleep-config: return correct error code
  c0d8fbfa34 sleep-config: add more debug logging
  48c6399ad8 github: rename CIFuzz workflow file to cifuzz.yml
  b31fba440c travis: bump Ubuntu release to Bionic
  2b918da5a1 journal: drop the assert-only variable completely
  5a573f2b91 travis: replace set (+|-)e with travis_terminate
  0f2d351f79 tree-wide: port to fd_wait_for_event()
  db64ba81c6 meson: build standalone version of systemd-tmpfiles
  8ef8f3d5a7 meson: add a new -Dstandalone-binaries=true option
  639118854f networkctl: Display DHCP6 DUID
  a9deab2eec sd-network: Introduce APIs to get DHCP6 DUID
  7e738e7b70 network: DHCP6 - save DUID to state file
  6b7d5b6eaf network: DHCP6 - introduce DHCP6 DUID to string
  24bd74ae03 Merge pull request #15940 from keszybz/names-set-optimization
  4c150809eb update TODO
  e47add9edc test: make TEST-02-CRYPTSETUP a bit more robust
  bb9244781c core: don't consider SERVICE_SKIP_CONDITION for abnormal or failure restarts
  6a881daf85 docs: Change suffix for desktop applications to support non-transient services
  d5da196319 journal: simplify vsnprintf() ret value check
  97033ba455 pager: set PR_DEATHSIG for pager to SIGINT rather than SIGTERM
  c85b6ff1b2 docs: point contributors to list of most recent systemd releases
  51b367b86d Merge pull request #16111 from poettering/bitlck-fix
  9664be199a Merge pull request #16118 from poettering/inaccessible-fixlets
  2befe404d4 Merge pull request #16120 from poettering/udevd-fixlets
  e2ea005681 core: do not touch instance from unit_choose_id()
  934ef6a522 core: create socket service instances with the correct name from the start
  ada4b34ec7 core: rework error messages in unit_add_name()
  d383acad25 core: when adding names to unit, require matching instance strings
  4562c35527 core: store unit aliases in a separate set
  02939ee001 Merge pull request #16087 from mrc0mmand/travis-build-check
  dad28bffd6 tree-wide: check POLLNVAL everywhere
  dfa64b64a7 tree-wide: mark assert()-only variables as unused
  b36746c90e travis: check build with various compiler options
  45204921be Merge pull request #16104 from ssahani/dhcpv6-iaid
  2ffadd3cee AppArmor: Support for loading a set of pre-compiled profiles at startup time
  d689f0f20a Merge pull request #16058 from Werkov/fix-memory-protection-default
  4f4f37b20d Merge pull request #16046 from bluca/dissect_squashfs_verity
  2233c2703c man: udevadm: mention non-zero exit code on settle
  60b316b1e9 test-network: wait 2min for the bridge being in configured state
  69876f94ab doc: Try to clarify automount dependency confusion
  fa0e23c900 docs: use bool in varlink interface definition
  48b747fa03 inaccessible: move inaccessible file nodes to /systemd/ subdir in runtime dir always
  b8c9074534 login: use ERRNO_IS_PRIVILEGE() where appropriate
  d582afe144 mkdir: use log_full_errno() where appropriate
  6b2229c6c6 udev: set fewer process properties
  fe56acd8e0 udevd: use cpus_in_affinity_mask()
  57b611a5bf Merge pull request #16074 from msekletar/freezer-test-flakes
  6930d069a3 cryptsetup: pass selected mode to crypt_load() when doing LUKS
  5af39ac850 cryptsetup: try to load bitlocker superblock only if requested
  8b8ae7959d hwbd entry for  Dell Inspiron Chromebook 14 2-in-1 sensor (#16109)
  f01994380e login: allow individual USB ports to be assigned to seats
  e7cbe5cb9e dissect: support single-filesystem verity images with external verity hash
  331ee15f18 networkctl: DHCPv6 - display IAID
  01dd138031 sd-network: Introduce API to get DHCPv6 IAID
  18d8a2cf30 network: DHCPv6 - export IAID to state file
  d69d4038ec dhcp6: Provide method to access IAID
  ed66590d15 Merge pull request #16080 from YmrDtnJu/9p
  bf76080180 core: let user define start-/stop-timeout behaviour
  8b5616fa91 Merge pull request #16073 from keszybz/shell-completion
  d3d0b763b4 Merge pull request #15953 from keszybz/gdb-script
  44a419540e pid1: rework handling of m->show_status
  0d6d3cf055 pid1: rename manager_get_show_status() to manager_should_show_status()
  b309078ab9 pid1: make more use of show_status_on()
  5a36324962 Merge pull request #16047 from poettering/udev-ro-block
  707dc7949c update TODO
  a4d1bef73f Merge pull request #16085 from ssahani/network-client-id
  6cc27c29ad Add 'bitlk' option to mount Bitlocker drives with cryptsetup.
  c15ab81ed9 mount-tool: Replace fstype_is_{network,api_vfs} with fstype_is_blockdev_backed
  ac2474e4ff basic: New function fstype_is_blockdev_backed for fstypes that need a blockdev
  b11e98037c hwdb: add HP Spectre x360's mic mute switch
  b1481b2092 Merge pull request #16092 from yuwata/network-accept-local-16090
  a34a2933e9 man: single-char parameters take no '='
  048b4dc2e1 units: tweak udev unit descriptions
  95ac523030 udev: optionally mark all block devices read-only as they pop up
  b1806441bb dissect-image: wait for udev for single filesystem images too
  2153bbc81a networkctl: Display DHCP4 client ID
  daec96821d sd-network: Introduce API to access DHCP4 client ID
  5dfaf89b5b network: DHCP4 client ID save in state file
  29f69c5741 test-network: add test for IPv4AcceptLocal=
  94d76d071e network: introduce IPv4AcceptLocal= setting
  a07e962549 homed help --uid short option
  7887e58051 test: avoid failing due to unexpected precision
  6495ceddf3 Merge pull request #16033 from poettering/parse-int-fixlets
  a742f9828e resolve: enable RES_TRUSTAD towards the 127.0.0.53 stub resolver
  9141594cae lldp: fix assertion checking argument for sd_lldp_set_neighbors_max()
  7487b48688 man: fix typo Takse -> Takes
  3a9692dd05 shell-completion: add homectl for bash
  3ac33bc966 kernel-install: extend --help
  ea9f36ac83 Merge pull request #15378 from msekletar/udev-kill-signal
  2884836e3c core: fix the return value in order to make sure we don't dipatch method return too early
  a0d79df8e5 tests: sleep a bit and give kernel time to perform the action after manual freeze/thaw
  42e57a4eb2 test: add test for parse_uid_range()
  53c6db99fa tests: beef up integer parsing tests
  fc80cabcf5 parse-util: also parse integers prefixed with 0b and 0o
  60eb1f0728 parse-util: rewrite parse_uid_range() on top of parse_uid()
  f5979b63cc user-util: be stricter in parse_uid()
  c44702a8bd parse-util: rewrite parse_mode() on top of safe_atou_full()
  aa85e4d3ce parse-util: make return parameter optional in safe_atou16_full()
  c78eefc135 parse-util: allow '-0' as alternative to '0' and '+0'
  707e93aff8 parse-util: allow tweaking how to parse integers
  3611ed7378 test: add integration test for udev event timeout
  e209926778 udev: make signal that we use to kill workers on timeout configurable
  0ce8092109 Merge pull request #15466 from elmarco/dhcp-leases
  b3753406c0 turn off fuzzit
  d9ce1c2493 networkctl: print DHCP leases
  090c923b4d networkctl: factor out link_get_property()
  7be3261222 sd-dhcp-client: add sd_dhcp_client_id_to_string()
  aaec2d7b9b macro.h: add sizeof_field() helper
  00ebe01156 sd-dhcp-client: make struct sd_dhcp_client_id reusable
  cf72a78660 networkd: expose DHCPServer interface on links
  38ee31a6e4 networkd: start a DBus interface for the DHCP server
  36d35f2259 sd-dhcp-server: notify callback on lease changed
  5b03043a75 sd-dhcp-server: add sd_dhcp_server_set_callback()
  3cd5924c85 network: make link become configured state when at least one dynamic protocol provide an address
  168561f2eb change fs/file-max to LONG_MAX instead of ULONG_MAX
  161bc1b627 Merge pull request #16057 from keszybz/resolvectl-sorted-no-nta
  bb9a9e33c9 Merge pull request #15171 from ssahani/tc-qfq
  0d63e7dd0b Merge pull request #16056 from keszybz/minor-doc-updates
  ecc04067f9 seccomp: filter openat2() entirely in seccomp_restrict_sxid()
  7ade8982ca core: remove support for ".include" stanza
  c643bda5ec network: read driver name from ethtool
  33bece166c basic/sort-util: adorn qsort_safe with a prefix underscore
  bacafb0990 pstore: use typesafe_qsort
  eb10767565 resolvect: sort status output by link number
  c9d243cdef resolvectl,systemctl: reduce scope of variables
  6cf3011c6c Introduce strcasecmp_ptr() and use it in a few places
  6773049a4c resolvectl: do not show NTA lists in status
  891ff9633f test-network: add tests for QFQ
  4d7ddaf97b network: tc: introduce [QuickFairQueueingClass] section
  b12aaee5ab network: tc: introduce Quick Fair Queueing (QFQ)
  c33f1e5a3f sd-netlink: add netlink properties of Quick Fair Queueing (QFQ)
  6161b35d5e Merge pull request #16048 from poettering/conf-parser-mtime
  c9e0695675 core: set source_mtime after load dropins
  4f9ff96a55 conf-parser: return mtime in config_parse() and friends
  5aca2e6733 conf-parse: fix pretty bad typo
  22ed4a6d9a fs-util: add stat_warn_permissions() that operates on struct stat instead of fd
  7183b22f12 Merge pull request #15996 from yuwata/network-dhcp6-route-metric-15295
  53aa85af24 cgroup: Allow empty assignments of Memory{Low,Min}=
  db2b8d2e28 cgroup: Make empty assignments reset to default
  21c8397694 tests: Fix description of test units
  eee9b30af4 basic/efivars: try re-reading efivars without delay first
  75f6d5d87e fd-util: be more careful with fclose() errnos
  112bed84bf update TODO
  927b9b8f63 man: add note that emergency.target inherits mount state
  41a7c3bf5d units: uppercase the description
  b68edd3006 man,mkosi: bump Fedora version
  68f6c58354 test: temporarily block test 48 on Ubuntu's autopkgtest
  8dd91cb55b network: drop an unused function
  c24dd73952 network: move DHCPv6 related conf parsers to networkd-dhcp6.c
  bdad94d0d6 network: set both dhcp_route_metric and dhcp6_route_metric by DHCP.RouteMetric= for backward compatibility
  1bf1bfd958 network: add DHCPv6.RouteMetric=
  132be2b868 network: use uint32_t instead of unsigned for route priority
  d06661ab66 Merge pull request #16030 from yuwata/network-read-mtime-of-dropin-configs-15521
  397288e3eb Merge pull request #15991 from keszybz/uids-gids-only-decimal
  9f83091e3c network: also read mtime of drop-in configs
  c4473dec34 network: do not propagte error on stat()
  63e2d1714e udev: single binary replacing udevd and udevadm
  0e77fc66bc network: fix double free in macsec_receive_channel_free()
  b9d19abd38 Merge pull request #16029 from yuwata/network-wireguard-without-peers-15786
  6597cb324a Merge pull request #15990 from jwrdegoede/hwdb-accel-quirks
  da3509f0f5 test-network: add test for wireguard without peers
  50254f5500 network: wireguard: set ListenPort= when no peers are configured
  dc851c00c3 Merge pull request #15982 from keszybz/shell-completion-and-help
  f3e4b1e07c Merge pull request #15884 from ssahani/dhcpv6-vendor
  a8b46548e6 Merge pull request #15993 from mrc0mmand/news-update
  fdd156dd99 tests: add a testcase triggering https://github.com/systemd/systemd/issues/15968
  1d16f661eb NEWS: fix several typos
  156a5fd297 basic/user-util: always use base 10 for user/group numbers
  f7091f458e loginctl: define loop iterators in the loop header
  a7a8dcffc2 hwdb: Add accel orientation quirk for Trekstor Surftab Twin 10.1 ST10432-8
  b5f829a2da hwdb: Add accel orientation quirk for Toshiba Encore WT10A tablet
  aa0cb635f1 network: L2TP fix crash
  9774347b57 Fix typo.
  2cac801f0f stat-util: trivial empty_or_null() tweaks
  b054e69bf9 Check ambient set against bounding set prior to applying ambient set
  bed695375a udev: when the BSD lock on a block device is taken, don't complain
  66fcfdfde7 core: add forgotten return in error path
  05dd19fad3 shared/efi-loader: remove check that uses absolute tick value
  753a71ad1d gpt: include homed GPT partition type in well-known partition table
  3668722049 units: don't set PrivateNetwork= in systemd-homed.service
  2bca2d77d3 resolved-dns-query: remove dns_query_candidate_is_routable
  a3f6020432 sd-network: fix inverted error message
  a7a9fe3c93 network: allow empty assignment to PreferredLifetime=
  8df6fc1241 Update resolvectl zsh completion
  c1a83277d0 shared: treat generator units as vendor units
  1f382d818d tree-wide: fix bad errno checks
  667c207683 bus-message: immediately reject messages with invalid type
  116a8eadb6 bus-message: fix negative offset with ~empty message
  4d5779d886 load-fragment: fix a typo
  c8b6de003a NEWS: retroactively document Family=
  cf6b8e6ec5 man: fix dir name in sysctl.d(5)
  6d009b7a25 journalctl,elsewhere: make sure --file=foo fails with sane error msg if foo is not readable
  cf786ef164 makefs: log about OOM condition
  0b1839822f blockdev: propagate one more unexpected error
  d78ce949d0 repart: don't insist on coming up on partition label ourselves
  9e1363fcc6 journal: fix dropping first record during upload to remote journal
  50cb4e418d meson: initialize time-epoch to reproducible builds compatible value
  76abe079b7 limit-util: quieten a very common debug message that is misleading
  b3e484a3b1 shared: fix integer overflow in calendarspec
  0c29eea969 repart: suppress complaints about lack of BLKRRPART when operating on regular file
  3db52f5ed8 repart: explain when we exit early and don't do a thing
  d99cba3aaa mount: introduce mount_is_nofail() helper
  7bc4bcea15 mount: default startup dependencies and default network ones are orthogonal
  7fe617fa53 mount: introduce mount_add_default_ordering_dependencies()
  e1c091b6d4 automount: fix handling of default dependencies for automount units
  ae05a137c9 mount: let pid1 alone handle the default dependencies for mount units
  f1fb197176 mount: mount unit activated by automount unit should be only ordered against the automount unit
  c9bcc69703 generator: don't generate device dependencies for extrinsic mounts
  ebac09ea0a fstab-util: introduce fstab_is_extrinsic()
  a20e4ea0ed device: drop refuse_after
  2799fffac1 man: drop some left-over mentions of StandardOutput=syslog
  144aff9c3b sd-netlink: remove unused RTNL_WQUEUE_MAX define
  34ca8df8e1 test: Add return 0 to main() function (even it is not strictly necessary)
  6e03f328a9 network: 'cur' variable cannot be null, so simplify code
  8d0c97f6ca tree-wide: Initialize _cleanup_ variables if needed
  4f174e49ae netlink: Fix assert condition on n_containers
  3905ce532c journald: Increase stdout buffer size sooner, when almost full
  5a37eb7c61 core: don't bind varlink socket if running in test mode
  33fff72ce6 pam_systemd: also print debug lines when ending a session
  ba9af79ccb pam_systemd_home: use correct macro for converting ptr to fd
  6199235489 Fix misuse of PAM_PROMPT_ECHO_OFF in systemd-homed
  c180a2c452 shared/ethtool-util: hush gcc warnings about array bounds
  1addba4aac core: fix compilation with gcc -O3
  9c46b97161 random-util: use ERRNO_IS_NOT_SUPPORTED() macro
  d85f9093d2 tmpfiles: clarify that "!" lines are filtered before collisions are checked
  2fac966a5c man: mention the exclamation mark and minus sign literally, to make things searchable
  4f61be3373 man: clarify that exit status name mappings are unaffected by SuccessExitStatus=
  b747d74a41 seccomp-util: add new syscalls from kernel 5.6 to syscall filter table
  c30d8caf8b tree-wide: Replace assert() by assert_se() when there is side effect
  b6e8e3be7e networkctl: use uint64_t for link speed throughout
  be66ce6089 tree-wide: use CMSG_SPACE() (and not CMSG_LEN()) to allocate control buffers
  1cb197798a man: suffix pam options with "=" where arg is required too
  a5fe01d3da test: Use assert_se() where variables are only checked by assert
  6960efd198 tree-wide: Fix, replace assert() by assert_se() when there is side effect
  93c1b03074 tree-wide: Mark as _unused_ variables that are only used in assert()
  c7679d7a9f tree-wide: Workaround -Wnonnull GCC bug
  073b257fd7 man: bring example PAM snippet of pam_systemd and pam_systemd_home back in sync
  855291a81c man: highlight relevant lines in pam_systemd_home.so example PAM snippet
  f89ad7c0fd login: include pam_systemd_home.so in the default PAM snippet we ship for user@.service
  9357f9466f test: Skip test-boot-timestamps on permission denied
  cad4ebe14e sysusers: be extra careful when locking accounts
  551e6f233a shared/install: print name of offending file in error
  c6a2e51232 systemctl: fix --root support in querying presets
  6f1eedbfdd systemctl: fix hint when 'systemctl help' is given
  925521df7c shared/unit-file: fix resolution of absoulute symlinks with --root
  756ba362e8 man: mention that ProtectSystem= also takes care of /efi
  4f77cf43b5 man: systemd.service: systemd-analyze exit-codes -> exit-status
  7c6ea7a053 man: expand on the star…end/repetition time expressions
  e06b940792 calendarspec: be more graceful with two kinds of calendar expressions
  f3dd0b476d calendarspec: minor simplification
  3581c16d56 shutdown: fix spacing in shutdown error message
  9556255349 nspawn: mount custom paths before writing to /etc
  37447b7e78 repart: fix partition maximum size segfault
  7f231ba503 link: Add units and fix typo in (Rx|Tx)BufferSize= manpage. Clean up the implementation slightly
  e75d2cdb0b main: bump RLIMIT_MEMLOCK by physical RAM size
  e16b9a1e31 nspawn: be more careful with creating/chowning directories to overmount
  765d184a69 homectl: say "home area" in more places
  c11bff4fa7 userdbctl: make --help fit in 80 columns
  0e56c2ef3f shell-completion/zsh: update systemd-analyze completions
  2bb580f994 zsh: fix disable/enable completion
  607a19a309 cgroup-util: check for SYSFS_MAGIC when detecting cgroup format
  ddb3c38efc stat-util: no need to open a file to check fs type
  bd8842304c sysusers,tmpfiles: always mention error when failing to replace specifiers
  bdea9b65d2 sysusers: add accidentally forgotten 'return'
  17b059774d man: document binfmt's new --unregister switch
  560380d8ec binfmt: also unregister binfmt entries from unit
  80835d9c51 binfmt: modernize code a bit
  a1745741b8 shutdown: unregister all binfmt_misc entries before entering shutdown loop
  b637445950 shared: add common helper for unregistering all binfmt entries
  0215625e99 home: fix strv NUL termination
  038988baa1 networkd: don't do lldp rx nor tx on bond devices
  9512d576d9 sd-bus: Fix typo in sd_bus_message_append_array docs
  63cef71dd0 shared: add NULL callback check in one more place
  6b91ca22a2 core: fix unused variable warning when !HAVE_SECCOMP
  f7c1c79c57 udev: prepare memory for extra NUL termination for NULSTR
  69e0ef0d99 tree-wide: use recvmsg_safe() at various places
  cd0a84d4e9 socket-util: add recvmsg_safe() wrapper that handles MSG_CTRUNC
  2bb48c704b sd-bus: work around ubsan warning
  c147bba1fb shared: Don't try calling NULL callback in bus_wait_for_units_clear
  f907491463 run: don't wait for start job to complete when running interactively anyway
  d3d1550a5d man: Fix typo "multiplied with" -> "multiplied by"
  ae5a9f27c5 core: make sure we don't get confused when setting TERM for a tty fd
  a07d3eaf76 man: document that VirtualEthernetExtra= has nothing to do with Bridge=
  35fe81078e core: add debug log when a job in the activation queue is not runnable
  a0cd882be8 core: add log_get_max_level check optimization in log_unit_full
  2a6ad1093c util: return the correct correct wd from inotify helpers
  9ec244c5c1 core: minor error code handling fixes
  a799283c91 man: document how to get the boot menu with zero time-out
  7263e86c8d resolved: return org.freedesktop.resolve1.DnsError.NXDOMAIN on LLMNR resolution failure
  6eab4c2b3e man: use manpages.ubuntu.com for resolvconf(8) link
  75ccec5cde man: add a note that resolvconf updates /etc/resolv.conf in specific circumstances
  3e3a31743a resolvectl: fix indentation of hexdump'ed packets
  6576058fab journald: add configuration option for enabling/disabling audit during journald startup
  52c5909f15 man/systemd-service: clarify env variable expansion
  ac08df59c0 resolved: fix typo in an unused function and add comment
  d1109e12c0 udevd: update snippet string
  d904afc730 core: reload cache if it's dirty when starting a UNIT_NOT_FOUND unit
  8f0a346a29 shell-completions: update bootctl
  956508cb5d Merge pull request #15935 from poettering/cache-more-efi-vars
  d308cd4bfa po: update Brazilian Portuguese translation
  3a02643a40 Merge pull request #15915 from poettering/journal-external-link
  366d077235 update NEWS
  ddb82ec2a2 sd-dhcp: clean-up of DHCP lease server code
  eed44b715d fix_test_function_timeout
  5e0676c2ca hwdb: Add accel orientation quirk for Chuwi Hi10 X
  a1422af564 network: L2TP fix crash
  856e51957a strv: propagate location info from the call site too
  138f49e452 basic/hashmap,set: change "internal_" to "_" as the prefix
  ea806175cd gdb: make output a bit nicer
  68b0ab5891 gitignore: ignore mypy cache
  55825de59b basic/hashmap: drop unneeded macro
  3aff6c7917 gdb: update accessors for bucket counts and entry sizes
  31ca609f8a gdb: drop python2 support
  43874aa7bb hashmap: don't allow hashmap_type_info table to be optimized away
  c544fc319c tools/gdb: decrese indentation to 4 spaces
  06134457d2 basic/hashmap: update comment
  269412ef44 Merge pull request #15958 from layderv/master
  02591c95bb Merge pull request #15975 from mgub/patch-1
  bf1abf1a2c Fix typo.
  dae710bef1 #15773 add --reboot-argument to systemctl reboot
  29da419305 stat-util: trivial empty_or_null() tweaks
  8acb11a6a3 Check ambient set against bounding set prior to applying ambient set
  42ba8d25ad update TODO
  5fc20ede0f Merge pull request #15954 from keszybz/unit-file-leak
  84190644ff efi: add more logging for all EFI variable reads
  002914e688 bootctl: add simple, low-level reboot-to-firmware verb for controlling the flag
  8a96369e0b bootctl: show reboot-to-firmware info, too
  c37070c85a efi: cache OsIndications too
  d197c403b2 efi: explicitly update mtime of EFI variables when changing them
  c75e7da0b5 efi: as extra paranoia NUL terminate UTF-16 strings with three NUL bytes
  9e5230aad9 efi: cache OsIndicationsSupported
  5c25f42322 efi: avoid weirdly double }} by indenting differently
  d4bd786d69 efi: cache LoaderEntries EFI variable
  ceae629564 README: add a Fossies codespell badge
  433e14fda7 network: fix memleaks
  7c5f97f5e3 network: clean up doubled white space
  1c3ec1cd45 network: dhcp6 - fix memory leak
  b4ccc5de7d network: Inroduce DHCP6- send vendor options
  99ccb8ff89 sd-dhcp6: Introduce vendor specific information
  4737345173 update NEWS
  dd587c3a88 man: briefly document the DOCUMENTATION= structure log field
  2fac514fa9 logs: strndupa() cannot fail
  2108b56749 journal: show documentation hyperlink if known in log output
  422c8251e5 pretty-print: export urlify_enabled()
  a90fb08c81 locale-util: add glyph for external links
  b965ec7a63 catalog: normalize how we link to documentation
  9efa8a3cff network: DHCPv6 Assign delegated prefix to LAN interface
  5c95a9134a sd-network: Rectify Advertise Message Processing by a Client
  fac729f811 Merge pull request #15911 from poettering/unit-name-tighten
  f6dbcebdc2 sd-device: check netlink netns matches host netns before using monitor
  8abbd9a4d9 Merge pull request #15944 from poettering/sd-path-fixups
  27cd09442f Merge pull request #15942 from poettering/pass-pktinfo
  cfbee85ce2 Merge pull request #15956 from poettering/news-v246
  63ef9d31fd Merge pull request #15930 from poettering/udev-no-lock-warn
  63b00fa77d Merge pull request #15619 from ddstreet/ignore_carrier_loss_default
  bfafec253c update TODO
  ccdf03b9c7 sd-path: drop "-dir" and "-path" suffixes from path enums
  4a56315a99 path: use ROOTPREFIX properly
  6527b019fc xdg-autostart: fix two coverity found issues
  871dc8d644 homed: enable userdb too if homed is requested
  a745117dba udev: catch genuine_random_bytes() failures
  70d8586365 libsystemd: properly export new sd_notify_barrier() API call
  5a7cf2e9d8 hwdb: whitespace fix
  b0d0e0ef98 start NEWS file for v246
  08b8f29a25 tree-wide: remove spurious whitespace
  a4ac27c1af manager: free the jobs hashmap after we have no jobs
  f6173cb955 core: define UnitDependency iterators in loops
  3fb2326f3e shared/unit-file: make sure the old hashmaps and sets are freed upon replacement
  db868d45f9 core: make unit_set_invocation_id static
  60daebdec2 Merge pull request #15882 from poettering/pam-sudo-fixes-part4
  38344f1a79 Merge pull request #15893 from DaanDeMeyer/firstboot-overwrite
  e0d70f7691 pam_systemd: set legacy D-Bus path only if the runtime directory is validated
  6d06dfad85 pam_systemd: be more thorough when validating runtime paths
  08ab18618e resolved: tweak cmsg calculation
  43007b302e networkd: clean up NETLINK_PKTINFO vs. SO_PASSCRED confusion
  a3d19f5d99 core: add new PassPacketInfo= socket unit property
  35a3eb9bdc socket-util: add generic socket_pass_pktinfo() helper
  a5925354bb firstboot: Add --kernel-command-line option
  676339a191 firstboot: Add --root-password-hashed option
  97a1a1103c Remove systemd-firstboot --force entry from TODO
  4926ceaff3 firstboot: Add --delete-root-password option
  b4909a3fd0 firstboot: Add --force option
  2da3dc69e7 fileio: Rename rename_and_apply_smack to rename_and_apply_smack_floor_label.
  90c81688ff fileio: Refactor sync_rights to take fds as arguments
  494735f3d0 sysusers: Move sync_rights and rename_and_apply_smack to basic
  1fbc95d388 firstboot: Don't check twice if /etc/shadow exists
  bb2294e454 Merge pull request #15669 from andir/systemd-ipv6-pd-subnet-id
  6bce17455e Merge pull request #15226 from benzea/benzea/xdg-autostart-generator
  f978844eb6 man: fix conditional in homed.conf.xml
  9ff7c5b031 basic/hashmap: make _ensure_allocated return 1 on actual allocations
  5abee64ed4 udev: when the BSD lock on a block device is taken, don't complain
  49d5aae503 Merge pull request #15934 from keszybz/docs-and-test-fix
  6d02412d51 Merge pull request #15928 from poettering/kill-mode-warnings
  8aa36b1ddd man: Fix typo in suggested permissions
  2b5f708985 run: when waiting for unit, also check if no job is pending anymore
  518a9bd689 Merge pull request #15853 from poettering/tmp-argument
  ffbb0fb9cb meson: support building fuzzers with meson <0.48.0
  4793c31083 service: Display updated WatchdogUSec from sd_notify
  dde5c821bf shared/efi-loader: remove check that uses absolute tick value
  24b4597064 core: minor simplification
  40fd0a77c6 userwork: remove trailing comma in message
  1414090854 core: add forgotten return in error path
  2ad7597e44 fuzz: Add an XDG desktop file fuzzer
  98e07533a2 test: Add test for XDG desktop file parsing and interpretation
  4540e698e8 man: Add systemd-xdg-autostart-generator man page
  8feca2472c xdg-autostart-generator: Add a generator for XDG autostart files
  3035a7c577 core: update comment about sysv compat
  8746820b87 sysv-generator: Downgrade directory listing fails to warning
  2991fa41e4 test: create public images by default
  9554b8d1d1 fuzzit: switch to -fundefined
  8441ff6886 test: make the systemd-run calls synchronous
  698564d147 efivars: log whenever an EFI variable read access is slow
  effefa30de update TODO
  0e42cbe254 sysv: generate warning for every SysV service lacking a native systemd unit
  470ab28d07 sysv: use structured initialization
  c8aa4b5b86 core: voidify one function return
  b0cea477d4 core: some more structured initialization
  4c42543429 core: also log about left-over processes during unit stop
  021acbc188 units: remove KillMode=process in our regular gettys
  9b52e0d81a man: document that KillMode=none is a bad idea
  d068765b68 core: warn if KillMode=none is used
  7b11770bae gpt: include homed GPT partition type in well-known partition table
  48432791ac units: don't set PrivateNetwork= in systemd-homed.service
  8a7b71bd97 Merge pull request #15910 from poettering/tmpfiles-pstore-tweak
  4b019d2f2d tmpfiles: deal with kernel errno change if quota is not enabled
  548af942b8 Revert "presets: "disable" all passive targets by default"
  90bdc8be66 resolved-dns-query: remove dns_query_candidate_is_routable
  e6190e2882 sd-boot: fix menu ordering with boot counting
  2d2d75047e update TODO
  7257f717c1 Merge pull request #15920 from keszybz/userwork-proc-title
  53ac130b51 cryptsetup: support tmp= file system argument
  92a08691c2 fstab-util: prefix return parameters with ret_
  0fc0d85fae test: add bridge configure-without-carrier test
  9bacf4313e test: expand configure-without-carrier test
  6b8a1aa6a3 network: return 1 on start and 0 if ipv4ll is already started
  cf3317f63a Merge pull request #15906 from keszybz/busctl-stdout-stderr
  47eeb381c8 Merge pull request #15909 from keszybz/sd-network-serialization
  3544f65f0c editorconfig: add man configuration
  6589a56972 dont install systemd-initctl, runlevel, telinit if no SYSV compat
  bd0d471c8f network: Change IgnoreCarrierLoss default to value of ConfigureWithoutCarrier
  a53a85b35e Merge pull request #15914 from poettering/ubsan-float-check
  02e9e34bd9 networkd: Add support for setting a preferred subnet id for IPv6 PD leases
  171f625b9e in-addr-util: removed in_addr_prefix_next implementation
  863b99cdd9 in-addr-util: introduce in_addr_prefix_nth
  e1a0423266 man: reword description of IPAddressDeny/Allow a bit
  201632e314 tree-wide: s/time-out/timeout/g
  e14db35072 userwork: fix typos in comment
  c55104ce58 basic/process-util: only try PR_SET_MM once
  ad4f7f6747 basic/process-util: create helper function
  fdf3c16d75 man: beef up $MAINPID examples
  d8bff5cc37 network: simplify how initial space is handled
  d5e172d2fb networkd: unfoobar serialization of links
  253acc229c Merge pull request #15840 from Werkov/mkosi-opensuse
  00813316b0 sd-dhcp6: constify output arguments in get_{ntp,nds}_addr
  dddc8d1e1e sd-network: reduce scope of some variables
  ffec8658db Merge pull request #15862 from hunger/master
  6ae8c6f5d7 update TODO
  8dd7cbce42 journal: expand variables up to PATH_MAX in size in catalog output
  2c905207db core: improve log messages when we cannot process a mount point
  5aec5c751a unit-name: use TAKE_PTR() where appropriate
  ab19db01ae unit-name: tighten checks for building valid unit names
  445bd57e39 busctl: drop unneeded param
  50f20d1bc2 busctl: verify args early and always print results to stdout
  e5af586f49 add a test triggering https://github.com/systemd/systemd/issues/15907
  8e2fa6e223 json: turn off ubsan for json_variant_has_type()
  6028d766d1 macro: introduce DISABLE_WARNING_TYPE_LIMITS and make use of it everywhere
  56e577c62f tree-wide: use DISABLE_WARNING_FORMAT_NONLITERAL where appropriate
  6a5b28def2 json: use our regular way to turn off compiler warnings
  1283366a90 Merge pull request #15167 from ssahani/address-gen-mode
  a177f05a5c Merge pull request #15872 from keszybz/networkd-types
  203c07c95b tmpfiles: don't complain if we can't enable pstore in containers
  1baaf8aa04 tmpfiles: downgrade log message when we can't write a file and failure is allowed
  7b5cb4ceb4 Repart: Add simple tests for Label="" and UUID=""
  129635333d repart: Add UUID option to config files
  10b20e5a93 network: allow empty assignment to PreferredLifetime=
  d273579667 network: use consistent type when parsing lifetimes
  2206aa5c35 sd-network: fix inverted error message
  062ac2ea85 sd-bus: internalize setting of bus is_system/is_user
  0406d1a843 man: add docs for the new functions
  5453a4b1a8 tree-wide: use public sd-bus functions in more places
  d2916409ed sd-bus: make name validation functions public
  4c163bf1f4 busctl: use set_put_strdup()
  15dd451535 tree-wide: codespell fixes
  639375e0b6 ACCEL_MOUNT_MATRIX for additional Acer Spin model
  cc1c85fbc3 login: limit nr_inodes for /run/user/$UID
  6a220cdb0b home: respect user record mount flags
  9f50cdd34a hwdb: remove support for MOUSE_WHEEL_TILT_*
  3c60fb077f Merge pull request #15886 from mrc0mmand/travis-enable-fuzz-tests
  87666b31f9 meson: pass the optimization level to the fuzzer build
  e9158b254c travis: enable fuzzer regression tests under sanitizers
  0aeb407cb4 Merge pull request #15889 from evverx/15885
  0d5266541c tests: add a testcase for https://github.com/systemd/systemd/issues/15885
  1eb73422f2 network: Fix crash when SendOption= is invalid
  fbc6d1716f Merge pull request #15869 from poettering/cant-auth
  5dd1469ef1 Merge pull request #15877 from mrc0mmand/meson-fuzz-test
  c8f145adbb homed: don't insist on authentication against host-copy user record
  1a53adb3ab homed: include error string when in log message if quota doesn't work
  2fcbf417b6 bus-util: actually register the object manager
  fa3709c5fb homed: also fsync private/public key pair when storing it
  e8dd54ab3c homed: fix typo
  b847192699 homed: make sure we log about invalid user records we load
  20f4a308bf homed: automatically clean up empty user record files
  e4005ffe00 homed: when updating local copy of user record, sync to disk
  5b3f4a20ea fileio: sync directory after rename, too
  cbffdcecae homed: return a better error when a home has no authentication information defined
  766507972b Merge pull request #15433 from mrc0mmand/test-reintroduce-parallelization
  c56463fdb4 meson: add fuzz-tests= option
  e72ecbf506 Merge pull request #15873 from evverx/pointer-overflow-oss-fuzz
  a6f1848a23 network: Allow to configure addr_gen_mode
  d0192e93f8 Update resolvectl zsh completion
  efdbf5fe9c shared: treat generator units as vendor units
  9b3278d907 udev: rename the persistent link for ATA devices
  7f20a9e5b9 networkctl: Add a range to address genmode
  1b1b7b44cc rules: automatically pull in smartcard.target from all CCID devices
  7c15a55f8b Merge pull request #15870 from poettering/proc-cmdline-efi-fix
  2f0a427b45 docs: add a link to the Fossies codespell report
  1f034000a5 oss-fuzz: turn on the pointer-overflow check
  f198303902 sd-path: fix systemd-system-generator-path lookup
  5dc31db7c1 network: reduce scope of variables, etc.
  a27060759b network: fix signed/unsigned confusion
  a60416f319 homed: fix return value mix-up
  b10ceb4783 Merge pull request #15557 from poettering/journal-zero-fix
  a88dce2bdd Merge pull request #15865 from evverx/ubsan-to-the-rescue
  acf70f8dd1 Merge pull request #15854 from poettering/call-method-ret-error
  30ed6e2250 Merge pull request #15864 from poettering/pam-sudo-fixes-part3
  0c789b6b81 Merge pull request #15868 from keszybz/fix-failed-to-fix-up-pid1-environment
  09835de3cc proc-cmdline: make checking of EFI options variable optional
  05a7827e87 proc-cmdline: add checking of EFI options variable in proc_cmdline_get_key_many() too
  4b5ee5901c proc-cmdline: fix return value clobbering in proc_cmdline_get_key()
  6b8664cb5b tree-wide: fix bad errno checks
  a0fa268337 basic/efivars: fix errno propagation
  929d07ddcb Merge pull request #15274 from ssahani/network-issue-9610
  400530c1e2 Merge pull request #15490 from ssahani/dhcpv6-vendor-class
  157dcb8de3 fuzzit: turn on the pointer-overflow check
  8976715804 build-system: build the fuzz targets with both ASan and UBSan
  2efa512a1a man: let's document explicitly that method reply handlers won't get ret_error set to method error
  af955f917f man: include sd_bus_message_handler_t prototype in synopsys of all man pages that reference the type
  a94d11cc66 Merge pull request #15860 from keszybz/bus-message-empty-fields
  bb94ded693 Merge pull request #15661 from hundeboll/mount-read-write-only
  579ca0a2b2 sd-network: DHCPv4 - Add user class, extra option and send generic options in request state
  3d45f6b2d0 Merge pull request #15535 from fbuihuu/update-runtime-watchdog-on-reload
  929fed02df load-fragment: fix a typo
  ad76560525 man: document x-systemd.rw-only fstab option
  f42aa41683 fstab-generator: add x-systemd.rw-only option support
  75f4bd7fd0 man: document ReadWriteOnly property for mount units
  a2dd991d0f bus-message: immediately reject messages with invalid type
  e0c17a7d1b bus-message: fix negative offset with ~empty message
  550c8784c5 udev: when random MACs are requested, generate them with genuine randomness
  2d3adfa6c4 DHCPv6: MUD URL lengh - use UINT8_MAX instead of 255
  ed0d1b2e99 network: DHCPv6 - Add support to send vendor class information
  73c8ced784 sd-network: DHCPv6 - Add support to send vendor class data
  d6463307e0 network: DHCPv4- Allow to set DHCP lease lifetime
  4c0b8d563d sd-dhcpv4: Allow to configure lease lifetime
  e945dd9eed pam_systemd: clean up success path
  764ae4dd51 man_systemd_home: intrdouce SYSTEMD_HOME_SUSPEND env var
  d08a6ec39c update TODO
  1c3232e4a4 Merge pull request #15482 from ssahani/dhcpv6-userclass
  38fee61952 systemctl: Fix frozen state coloring
  d31dda5e95 Merge pull request #15637 from poettering/cryptsetup-literal
  6e41f4dd91 man: document the newly acquired cryptsetup features
  4eb08bdb71 cryptsetup: fix minor indentation issue
  0ba6f85ed3 cryptsetup: optionally, see if empty password works for unlocking the file system
  2424fb7e7b cryptsetup: fix minor memory leak
  c6b1d7d1da cryptsetup: also check for /dev/hwrng as random device node
  cb6c9283b5 cryptsetup: make sure to return EAGAIN on wrong tcrypt password too
  7407f68980 cryptsetup: automatically load luks keys off disk
  23769fb371 cryptsetup: split out key loading from pkcs11 code and teach search path logic
  d3d49e7649 cryptsetup: optionally remove key file after use
  8ced40c09b cryptsetup: catch up with debian crypttab options a bit
  053e0626db fs-util: teach unlinkat_deallocate() a simple scheme for overwriting for erasing
  1d06deba0f Merge pull request #15845 from poettering/btrfs-encrypted-fix
  2946d46355 Merge pull request #15843 from poettering/busctl-duplicate-tweaks
  f12465466d Merge pull request #15848 from keszybz/small-doc-tweaks
  70fcda8562 NEWS: retroactively document Family=
  b406c6d128 pid1: make manager_deserialize_{uid,gid}_refs() static
  80f605c807 pid1: make manager_serialize_{uid,gid}_refs() static
  06a4eb0737 pid1: make manager_vacuum_{uid,gid}_refs() static
  1addc46c8c pid1: make manager_flip_auto_status() static
  ffe5c01eaa pid1: fold load_configuration() into main()
  986935cf6a pid1: update manager settings on reload too
  544e146b0e journalctl,elsewhere: make sure --file=foo fails with sane error msg if foo is not readable
  7f6b827f36 Merge pull request #15836 from poettering/makefs-lock
  feb13fca97 repart: don't insist on coming up on partition label ourselves
  a840ad5ae8 mkosi: Add explicit --bootable=no openSUSE dependencies
  3468e5ac51 btrfs-util: tweak error code a bit
  f8838c6c2f test-fs-util: don't fail on btrfs file systems in containers
  ffed0205c7 DHCP: Use UINT8_MAX instead of 255
  f37f2a6b8a network: DHCPv6 - Add support to send user class
  3392392518 sd-network: DHCPv6 - add support to send userclass option
  44dcb318cc Merge pull request #15842 from evverx/cifuzz
  cdf7ad38b6 allow removal of initrd services
  5e375a1ef2 Merge pull request #15794 from poettering/pam-sudo-fixes-part2
  201fa8f256 Merge pull request #15166 from ssahani/networkctl-ipvlan
  c5dc0a298e homed: use right config section in example config
  f17153a721 busctl: improve error messages on duplicate members/interfaces
  9600c27c41 busctl: use structured initialization
  11aaaa2c96 TODO: drop some external items
  e2da649182 TODO: drop some networkd items
  619720ba0a Merge pull request #15810 from poettering/override-first-boot
  01bcea4999 dhcp6: slightly improve log message
  e2cf880e68 README: add a CIFuzz badge
  82d7a25ee6 cifuzz: protect forks from CIFuzz
  bc48b25afd journal: fix dropping first record during upload to remote journal
  abc72137d1 Merge pull request #15838 from poettering/hostnamed-instant-part2
  498115c2b6 mkosi: Add openSUSE Tumbleweed packages
  7b9289b1a0 man: fix dir name in sysctl.d(5)
  cfb9433de4 hostnamed: call our destructor _destroy(), not _clear()
  5704cd733c hostnamed: don't cache system UUID
  72f48cd3e3 hostnamed: don't cache uname() data
  db2c56b0dd cryptsetup-generator: use systemd-makefs for implementation of "swap" and "tmp" options
  a5a8fe2e8d makefs: normalize logging a bit
  0181ad85b3 makefs: lock device while we operate
  c6526b8d66 update TODO
  34293dfafd core: allow overriding the system hostname with systemd.hostname= on the kernel command line
  3753325bef main: add a kernel command line option for setting the system clock early during boot
  814872e925 condition: introduce systemd.condition-first-boot= kernel command line switch
  5439d8212c condition: debug log if F_OK check on /run/systemd/first-boot fails unexpectedly
  ce0f7f5546 condition: reverse if check to lower indentation level
  f8b4ae29c7 condition: allow overriding of ConditionNeedsUpdate= on the kernel command line
  3931056767 proc-cmdline: add some explanatory comments
  b2d1ad757c condition: when reading /etc/ modification timestamp, let's actualy compare it as-is
  f33cd69b5c condition: downgrade a few log messages to debug
  df1f5dc1d9 condition: add debug log messages on unexpected errors
  841c0987f7 condition: check if path is absolute first
  851ef1ed56 networkctl: Add support to display ipvlan
  ac83e5aeca blockdev: add helper for locking whole block device
  58dfbfbdd6 dissect: use log_debug_errno() where appropriate
  700e0d3d87 makefs: log about OOM condition
  6cba41ab0d blockdev: propagate one more unexpected error
  34d16bad2d update TODO
  b3d15d90c0 Merge pull request #15804 from poettering/hostnamed-instant-part1
  d7d892e694 Merge pull request #15494 from ssahani/dhcpv6-request-options
  d0e3e76bb1 Merge pull request #15165 from ssahani/bonding
  6dbf352cfb meson: initialize time-epoch to reproducible builds compatible value
  28a060688f dhcpv6 tests: Update since we allow arbitrary options to be set
  35f6a5cb44 network: DHCPv6 - Add support set arbitary request options
  2b20ca653c sd-dhcp6: Allow to add arbitary request option
  7a57256c73 test: introduce TEST_PARALLELIZE to support running tests in parallel
  e89450921f test: fix public/private image detection and prefer the latter one
  3be6f50117 test: unify quotation around image names
  b55818fd12 networkctl: Use bond util common functions
  5fe5908eed network: Introduce bond util
  22ae6c7d9a networkctl: VXLan - display more properties
  35072050e6 network: Introduce ipvlan util
  f00c36641a pstore: introduce tmpfiles.d/systemd-pstore.conf
  b4e1563ffb Increase size of /run to 20%
  154962d348 docs: policy for systemd-security subscriptions
  18fbb567a8 Merge pull request #15817 from poettering/more-conditions
  cb1277fa3b udev: get rid of "Could not set flow control of" message on "lo" interface
  c07f18ffd4 shared: fix integer overflow in calendarspec
  bccba5249a update TODO
  410abf8304 man: document the two new condition types
  a0b191b705 condition: add ConditionEnvironment=
  7cd9e4f8a0 limit-util: quieten a very common debug message that is misleading
  411e835c50 condition: return (Condition*) NULL from condition_free()
  dce719f6c1 condition: introduce generic function type for condition_to_string()-like functions
  7f19247b5e condition: add ConditionPathIsEncrypted=
  89fe653544 network: Add support to group links.
  bf896ca628 Merge pull request #15792 from poettering/repart-allocate
  e1e214c56b Merge pull request #15265 from fbuihuu/mount-fixes
  214ffe64fc Merge pull request #15052 from jaankit/journal-send
  f5b04551b8 Merge pull request #15812 from poettering/deprecate-stdout-syslog
  b0eb3d6ed2 hwdb: fix microphone shortcut on HP EliteBook 840 G1
  f3dc6af20f core: automatically update StandardOuput=syslog to =journal (and similar for StandardError=)
  d2b843554a man: drop some left-over mentions of StandardOutput=syslog
  157644119b update TODO
  96deebbcda man: document new --empty=create and --size= switches to repart
  05ae606b79 test: update tests to use new repart features
  a26f4a49f4 repart: add support for create/growing loopback files
  9a1deb8578 repart: suppress complaints about lack of BLKRRPART when operating on regular file
  e2d65cd299 repart: explain when we exit early and don't do a thing
  32fcf399bf sd-netlink: remove unused RTNL_WQUEUE_MAX define
  c53ce14dfc sysctl: check correct error code
  2eaf435a16 journal-send: Fix the limitation of LINE_MAX
  969d329490 test-journal-send: send printing of long lines
  4df4df5b56 network: allow setting VLAN protocol on bridges
  cf217a0922 networkctl: Add support to display macvlan/macvtap mode
  d51674806a network: Introduce macvlan util
  6551cf2d61 man: document $LOG_NAMESPACE
  90810f7a37 sd-dhcp-server: some function prototype fix-ups
  4b129fba30 cifuzz: set allowed-broken-targets-percentage to 0
  2b8c2fbb2d Merge pull request #15765 from benjarobin/fix_kw
  3250501865 Merge pull request #15660 from benjarobin/perf_barrier_fd
  de07add2c9 Merge pull request #15801 from poettering/journal-pid-change-fix
  9bf4984a2a selinux: add parenthesis to function names in log messages
  5141b4e3b6 ci: install fdisk on Debian
  243945e95e test: Add return 0 to main() function (even it is not strictly necessary)
  fbb0b66577 systemctl: Check clean_or_freeze_unit(): Add assert if unknown method
  81c5a5961f network: 'cur' variable cannot be null, so simplify code
  b9c54c4665 tree-wide: Initialize _cleanup_ variables if needed
  179b4db439 netlink: Fix assert condition on n_containers
  5151b4ccd2 core: Parse the tags list sooner, and use it for multiple function
  a3d9aee14f man: document the new _LINE_BREAK= type
  d38b3b74db test: Stricter test case for #15654 (Add more checks)
  c11d8fd1da test: Add a test case for #15654
  45ba1ea5e9 journald: rework pid change handling
  020b4a023c journald: use the fact that client_context_release() returns NULL
  549b7379ba journald: rework end of line marker handling to use a field table
  5fe7fb0bf6 journald: use log_warning_errno() where appropriate
  034e9719ac journald: Increase stdout buffer size sooner, when almost full
  e65848175f semaphore: use dots instead of dashes
  0271e9b10c man: complete vtable flag documentation
  491ce16103 sd-bus: introduce new SD_BUS_VTABLE_ABSOLUTE_OFFSET vtable flag
  61c12865f5 resolved: port to stat_inode_unmodified()
  fee5c52ac2 stat-util: add stat_inode_unmodified() helper that checks if an inode was modified
  5a0173147b docs: add some backticks and more formatting to PASSWORD_AGENTS.md (#15803)
  053fbf54fc Merge pull request #15795 from gdamjan/master
  266dd55505 systemctl: fix indentation of 'Active:' field in status output
  8284f81bf7 Tidy up the Fedora mkosi Package list
  8623836502 fix WikiWord not-links
  7d85383edb tree-wide: add size limits for tmpfs mounts
  7cc8fb3ef0 update TODO
  08d50deaf8 core: don't bind varlink socket if running in test mode
  67a40f217c docs: import password agents documentation
  6c8428bb8b pam_systemd_home: also store acquirement fd per user
  dbe7fff476 pam_systemd/pam_systemd_home: rework how we cache user records
  0289b4ec69 Merge pull request #15785 from poettering/pam-sudo-fixes-part1
  cd8fdc2c73 Merge pull request #15789 from poettering/homed-bus-api
  3d9237d666 update TODO
  45c5fa253a pam_systemd: also print debug lines when ending a session
  3400bc866d pam_systemd: drop unused uid argument from export_legacy_dbus_address()
  da4340fd43 pam_systemd_home: use correct macro for converting ptr to fd
  2dffb32309 man: document homed D-Bus API
  55842c7326 homed: fix parameter names on D-Bus methods
  671fee1873 man: run man/update-dbus-docs again
  9e45fb09bf netlink: port to recvmsg_safe()
  d423294394 Fix misuse of PAM_PROMPT_ECHO_OFF in systemd-homed
  9b107000ab Merge pull request #15762 from keszybz/gcc-10-build
  e7d5fe17db DHCP client: make SendOption work for DHCPv6 too.
  2d5996c175 Merge pull request #15460 from elmarco/network-dhcp-resolve1
  94c0c5b7ea shared/ethtool-util: hush gcc warnings about array bounds
  6b726e602e Merge pull request #15768 from poettering/grnd-insecure
  f1f7b08805 Merge pull request #15769 from poettering/man-tmpfiles-boot-override
  1e0d5eebf1 man: clarify that exit status name mappings are unaffected by SuccessExitStatus=
  13c829c1bd Added Chuwi Hibook Pro (Model: CWI526) (#15770)
  8270e3d8ed seccomp-util: add new syscalls from kernel 5.6 to syscall filter table
  fcee2755ec core: Update prototype of notify_message, tags list is read only
  147d8fc1a7 basic: Allow to call STRV_FOREACH_BACKWARDS() with a char * const * strv
  ead2a4a231 tmpfiles: clarify that "!" lines are filtered before collisions are checked
  f742f9d317 man: mention the exclamation mark and minus sign literally, to make things searchable
  82c8bda1f1 update TODO
  0497c4c28a random-util: make use of GRND_INSECURE when it is defined
  e2b5546452 random-util: use ERRNO_IS_NOT_SUPPORTED() macro
  57ee010ff2 random-util: actually encode our expectations on RAND_MAX
  f1eb0ccd9e update TODO
  622e1cdb31 fs-util: beef up path_is_encrypted() to deal with LVM block devices
  20c3acfaad tree-wide: Replace assert() by assert_se() when there is side effect
  b2da95cfa1 update TODO
  15981c26e3 update TODO
  23450c897d core: fix compilation with gcc -O3
  2f665f2437 networkctl: use uint64_t for link speed throughout
  a114ab6373 cifuzz: fuzz the master branch on push
  94f660a8fe cifuzz: run only for relevant PRs
  f2a8372e37 Merge pull request #15703 from poettering/homed-tweak-default-storage
  dd1d306058 network: fallback on resolved resolv.conf for DHCP server settings
  0328d672f3 Merge pull request #15651 from poettering/newlocale-check
  c01ef54f7f homectl: color disk free output if low on free space
  27593a0641 hwdb: Fix accel orientation quirk for Medion Akoya E2215T MD60198
  165bda37ba Merge pull request #15718 from poettering/tmpfiles-offline
  8acb7780df Merge pull request #15623 from poettering/cmsg-cleanup
  321330ecab update TODO
  feb86ca90c man: document homed.conf
  c76dd733af homed: make default storage/file system type configurable in homed.conf
  c07bf7a4ed homed: move supported_fstype() to home-util.c
  1dfe5de095 homed: tweak logic for picking a default storage and file system
  0d5e523461 home: when adding a binding for a user record, use common code for determining automatic image path
  a43eddbdf4 user-record: split out code that generates automatic image path for records
  ed9c0851e5 fs-util: add helper path_is_encrypted() that checks if a file system is encrypted
  a6e1018df2 update TODO
  2d95d81f7b shared: move in_addr_ifindex_name_from_string_auto() there
  d910f4c2b2 core/cgroup: fix return value of unit_cgorup_freezer_action()
  c60bc8d4fb Merge pull request #15745 from keszybz/one-more-specifier
  7c5137329d Merge pull request #15713 from poettering/home-discard-when-offline
  bb5da6c385 meson: re-run ninja update-man-rules
  5e55340ad4 Merge pull request #15681 from vcaputo/buslocator
  43fe4f7613 timedate: switch to BusLocator-oriented helpers
  8010c205dd systemctl: switch to BusLocator-oriented helpers
  7ad61613de run: switch to BusLocator-oriented helpers
  d96f9abc95 resolve: switch to BusLocator-oriented helpers
  bf5c8177f8 portable: switch to BusLocator-oriented helpers
  a63d7e7bf6 nss-resolve: switch to BusLocator-oriented helpers
  7b38987880 nss-mymachines: switch to BusLocator-oriented helpers
  1ecaac5c30 nspawn: switch to BusLocator-oriented helpers
  8a048c8c42 network: switch to BusLocator-oriented helpers
  92cb8ebcb4 mount: switch to BusLocator-oriented helpers
  14456f7607 machine: switch to BusLocator-oriented helpers
  5d990cc571 login: switch to BusLocator-oriented helpers
  e3c8ec3b33 locale: switch to BusLocator-oriented helpers
  de770b6042 analyze: switch to BusLocator-oriented helpers
  8a1596aab5 home: switch to shared bus_home_mgr
  54e27bb5c0 bus: introduce bus-locator.[ch]
  b6c93a5a44 test-specifier: add a simple test which prints "global" specifiers
  e97708fa3e Add %l as specifier for the hostname without any domain component
  eef4b80033 Add a basic test that the configured fallback hostname is OK
  a00a78b84e tree-wide: port various bits over to locale_is_installed()
  b45b0a69bb test: add test case for locale_is_installed()
  23fa786ca6 locale-util: add new helper locale_is_installed()
  5cea17a177 Merge pull request #15635 from keszybz/set-put-strdup
  b36dc5cebd Merge pull request #15714 from poettering/homed-key-mgmt-doc
  77a3cec0c7 man: document the new tmpfiles --root= behaviour regarding users
  7dc6477dc9 sysusers/tmpfiles: use --root=/ as way to force offline operation (i.e.  without NSS)
  a3451c2c4c tmpfiles: optionally, read /etc/passwd + /etc/group without NSS
  6dbf40256b man: put all pages which mention a specifier in the index
  6552874506 man: fix indentation in sysusers.d.xml
  6a49603e08 update TODO
  c0440512e6 docs: document the new offline discard logic
  28a7f10620 homework: run fitrim or fallocate on logout based on the new user record property
  cba116991d homectl: add option for controlling new luksOfflineDiscard user record field
  5e86c82acd user-record: add new field for requesting LUKS discard on logout
  c06bcd4d68 homed: allow overriding homework path via env var
  1f7c6f906b update TODO
  6d68a0b3dd man: document homed key management
  0d525a3e93 man: add specifiers section to directives index
  282230882c tools: move directive index template to separate file
  fb29cdbef2 tree-wide: make sure our control buffers are properly aligned
  0d9d333672 tree-wide: remove redundant assignments
  a258f4915a tree-wide: use CMSG_SPACE() (and not CMSG_LEN()) to allocate control buffers
  c62e7d041f man: update rules
  06689b8d11 meson: rename make-man-rules.py to update-man-rules.py
  dd1e33c8dc meson: drop "meson-" prefix from various helper script filenames
  1f63c72d2e man: suffix pam options with "=" where arg is required too
  6bae4b905c Revert "Add Kensington SlimBlade Trackball"
  d402edb764 resolved: Fix build error due to missing include.
  48a3b5c6db netlink socket correct check (#15720)
  f5b7d681c7 homectl: show disk free in percent in 'inspect'
  354722dde4 Merge pull request #15733 from benjarobin/fix_warn_ndebug
  08f468567d tree-wide: Workaround -Wnonnull GCC bug
  ba876a4c8d homed: open up home dir Acquire operation to unpriv clients
  be28f72d6a resolved: Break include cycles
  0454681395 meson: Do not drop warnings (unused variable) when NDEBUG is defined
  683d0bc041 resize-fs: Use xsprintf instead of snprintf
  060d9c61b6 test: Use assert_se() where variables are only checked by assert
  f391597c67 tree-wide: Fix, replace assert() by assert_se() when there is side effect
  0a0e594a26 tree-wide: Mark as _unused_ variables that are only used in assert()
  96249bf8d6 Merge pull request #15735 from poettering/pam-snippet-update
  a06df2a4bd Merge pull request #15727 from poettering/systemctl-list-sockets-tweak
  4ad5bf7865 man: bring example PAM snippet of pam_systemd and pam_systemd_home back in sync
  c6472bb019 man: highlight relevant lines in pam_systemd_home.so example PAM snippet
  bd685faa1a login: include pam_systemd_home.so in the default PAM snippet we ship for user@.service
  e48471b948 test: Skip test-boot-timestamps on permission denied
  259f0dfbec hwdb: Force "mouse" type on Logitech Ultrathin Touch Mouse
  e57ac1b017 tree-wide: use _cleanup_set_free_ where appropriate
  2f063186d5 shared/logs-show: constify Set *fields
  476a63e9c0 sd-device: get rid of device_enumerator_clear_match_parent
  2204f018cd sd-device: optimize addition of already present matches
  eb1c1dc029 sd-device: use hashmap_put_strdup()
  25b3e2a835 basic/hashmap: allow NULL values in strdup hashmaps and add test
  c73bb51364 sd-device: use string hash ops in device enumerator
  de747a0008 test-set: make test-set not link to libshared and test test_set_put_strdup*()
  be32732168 basic/set: let set_put_strdup() create the set with string hash ops
  1fab579743 systemctl: underline whole rows, gapless
  b0395c1176 format-table: support coloring the gap right of each cell individually
  45d82c3f1c systemctl: ensure underline for "list-unit-files" empty cells
  50098d87fb systemctl: let's tweak how we synthesize a cell for activating unit
  bc04bb0d29 systemctl: change column name in "list-sockets" out from "units" to "unit"
  0773357ad1 systemctl: show empty cells as '-'
  557b0841b7 format-table: display an empty strv cell the same way as an empty cell
  0894f08bf1 resolve: fix type of parameter and update man page
  ba5a389d24 Merge pull request #15473 from keszybz/bus-introspection
  9e12d5bf63 socket-proxy: Support exit-on-idle
  c28904dae0 Update the rsync command in CONVERTING_TO_HOMED
  eff7c2d3c9 sd-bus: Add a nicer way of specifying sd-bus vtable method arguments
  7f3a5eb70e build-system: bring back 'nonnull'
  fc58c0c7bf sysusers: be extra careful when locking accounts
  b61cc5fdad man: update login1(5) for SetType()
  b856b346c1 man: add stub for home1(5)
  cfd508a9d6 homed: convert to the new scheme and add --bus-introspect
  c92391f52f Merge pull request #15692 from keszybz/preset-cleanup
  1a0e562a5b man: add description of org.freedesktop.LogControl1
  81e06775be meson: add man/update-dbus-docs target
  7cb4f4145f man: drop LogLevel from resolve1(5)
  38b52b6918 man: drop CanMultiSession from documention
  48f99d7c06 man: use --bus-introspect to autogenerate dbus api docs
  c351d568c3 update-dbus-docs: use executables in build/
  5c08257b70 pid1: add --bus-introspect
  f6e9aa9e45 pid1: convert to the new scheme
  4faa530cf6 machined: convert to the new scheme and add --bus-introspect
  5ceceff170 localed: convert to the new scheme and add --bus-introspect
  670139db40 hostnamed: convert to the new scheme and add --bus-introspect
  8b4933973e bus-introspect: list the interfaces with "list"
  8d1280897b resolved: convert to the new scheme
  c4b7d95c46 timedated: convert to the new scheme and add --bus-introspect
  cd7e1e1a7f units: change description of systemd-logind.service
  d4cc0edfce importd,logind: add --bus-introspect= option
  1e9bc92dba bus-util: add wrapper for interface introspection
  c2b178d3ca logind: convert to the new scheme
  a3b7cf5013 importd: convert to the new scheme
  6a7e98aaca sd-bus: add helper struct for interface definitions
  31b8895af7 systemctl: do not show preset state for "static"/"alias"/"generated"/"transient" units
  15d7ab87c4 systemctl: add new enablement state "alias"
  9c894b8579 shared/install: rename variable for clarity
  bce84e10f8 shared/install: print name of offending file in error
  babccf14ce shared/install: indent tables
  8f7b256665 shared/install: optionally cache the preset list
  87afd40b5a man: systemd.service: systemd-analyze exit-codes -> exit-status
  a8acbf9748 Add Zowie ZA12 details to mouse hwdb
  c39b7821f6 systemctl: fix --root support in querying presets
  4cb1015e6b systemctl: refuse online-only ops with --root
  9321e23c40 shared/verbs: split out helper to find verbs
  d8b065e056 shared/verbs: add a modicum of documentation
  ae98f726ff systemctl: mark log-level,log-target,service-watchdogs as online-only
  77102db288 systemctl: fix hint when 'systemctl help' is given
  eaf7ac4929 Merge pull request #15645 from poettering/calender-expression-doc-fix
  05c7d9bf5b Revert "logs-show: declare [static 2] on all highlight parameters"
  640ebaa952 Merge pull request #15648 from poettering/journalctl-cat-beefup
  c83347b49d man: migrate more specifier explanations to standard-specifiers.xml
  90f1f8188b Merge pull request #15701 from poettering/systemctl-json-table
  cae97f3b60 correct evdev dimensions for T490 trackpad
  4723f9ef16 hwdb: Fix brightness keys for Logitech K811
  5fe4d1b514 shutdown: fix spacing in shutdown error message
  5444520628 logs-show: declare [static 2] on all highlight parameters
  e0e3d38726 man: document the new -o cat feature
  4d5d1bba73 journalctl: optionally, show a different field than MESSAGE in -o cat mode
  54ff74d273 journal: use set_contains() where appropriate
  5c4deb9a5c nspawn: mount custom paths before writing to /etc
  2edc7aea7a man: expand on the star…end/repetition time expressions
  c9c9f6f450 calendarspec: be more graceful with two kinds of calendar expressions
  05851cb9df calendarspec: minor simplification
  3c6f0300ae calendarspec: drop _pure_ from static function
  80b19994a4 calendarspec: pack our flags a bit
  a4d6d711cf calendarspec: encode that it's OK to store µs in 'int's
  49cd06fa2d systemctl: optionally output tables in JSON format
  e21b76cd68 format-table: generate better JSON field names
  708961c701 core/path: recheck path specs when triggered unit changes state
  f285f07752 core/path: use escaped path in serialization
  848cfa74d2 Merge pull request #15636 from poettering/sensitivity-training
  53491f7fe7 Merge pull request #15647 from benzea/benzea/graphical-use-app-prefix
  05d9125ece mkosi: Fix openSUSE image declaration
  8049c79b65 Add Kensington SlimBlade Trackball
  793452e0ba catalog,po: update Polish translation
  111e71c431 test: fix potential use-after-free
  80cf50120c Merge pull request #15422 from nolange/add_zstd_coredump
  8012d5c08e install libzstd-dev for CI builds
  ef5924aa31 coredump: add zstandard support for coredumps
  ddd6a22a0f basic: add STRCASE_IN_SET() which is to STR_IN_SET() what strcaseeq() is to streq()
  fc021a5bbf logind,importd,hostnamed,localed,timedated,machined,resolved: add option parsing stubs
  7ae473268c manager: add highlighting to --help
  53f7f7fcf2 util-lib: add stub parser for --help, --version
  ab09bf9007 importd: wrap long lines
  b49ca3bc37 sd-bus: use STR_IN_SET() in one more place
  2b6a1d155d bus-introspect: move xml string defines into the .c file
  61d0df3919 bus-introspect: write <interface> from within introspect_write_interface()
  2d4f8cf467 man: fix few spelling errors
  2e4086060b test: Fix build with !HAVE_LZ4 && HAVE_XZ
  9494b39dac cifuzz: upload artifacts only when the "run fuzzers" step fails
  db1442260a repart: fix partition maximum size segfault
  843c631a8e Merge pull request #15652 from MadMcCrow/master
  c600357ba6 mount: add ReadWriteOnly property to fail on read-only mounts
  6eb35fd695 Merge pull request #15547 from kkdwivedi/notify-barrier
  b76ef59756 Merge pull request #13512 from msekletar/freezer
  5ec7a9947e man: sd_notify() race is gone with sd_notify_barrier()
  4f07ddfa9b Introduce sd_notify_barrier
  cad6727906 test: find path for systemd-journal-remote
  a8332698d7 Merge pull request #15592 from kennylevinsen/fdpoll-standalone
  db72aea4a9 Add SetType method to login Session interface
  3052049260 core: (De-)Serialize poll flag for fds in fdstore
  cb5a46b845 core: Add optional FDPOLL=0 argument to fdstore
  208bf319d3 Fix Chromebook Caroline board accelerometer not having correct orientation
  d446ae89c0 test: add test for cgroup v2 freezer support
  d9e45bc3ab core: introduce support for cgroup freezer
  9dcd43b149 notify: beef up --pid= logic
  60ca8f22b8 docs: Change prefix for desktop applications to app-
  484f4e5b2d efi: honour SYSTEMD_EFI_OPTIONS even if we wouldn't honour SystemdOptions EFI var due to SecureBoot
  b8239b9c50 shared/unit-file: fix resolution of absoulute symlinks with --root
  26b8190841 man: mention that ProtectSystem= also takes care of /efi
  f46ba93944 efi: cache test results of boolean EFI state functions
  d47df15b11 Merge pull request #15630 from nabijaczleweli/symmetric-buffers
  e81f5fc4e8 link: Allow configuring RX mini and jumbo ring sizes, too
  80af9bdabe link: Add units and fix typo in (Rx|Tx)BufferSize= manpage. Clean up the implementation slightly
  25a1f04c68 basic/cgroup-util: introduce cg_get_keyed_attribute_full()
  f20078df0b docs: reorder the section about security reporting to emphasize the sekrit list
  560a3e5dd6 home: make sure whenever we touch the 'secret' part of a user record, we set the the sensitive flag on it
  2ffee2c9b0 home: mark various bus messages we write user records to as sensitive
  94600eeb29 json: when making a copy of a json variant, propagate the sensitive bit
  08deac6e3e selinux: do preprocessor check only in selinux-access.c
  e83ef04d97 Merge pull request #15626 from poettering/more-specifiers
  384bd937fa Merge pull request #15628 from poettering/tmpfiles-fuzz-fix
  dfe01841e6 tmpfiles: remove unnecessary assert
  d02933fded tmpfiles: use log_syntax() for all parse errors
  33bd857f94 update TODO
  503298b724 man: document new specifiers
  268f5a5463 tree-wide: support a bunch of additional specifiers
  76410e9849 update TODO
  04d1ee0f7e main: bump RLIMIT_MEMLOCK by physical RAM size
  dcff2fa5d1 nspawn: be more careful with creating/chowning directories to overmount
  c98fef264b update TODO
  bac1b83217 sd-bus: Add sd_bus_query_sender_creds/privilege docs
  2344aefccf Merge pull request #15618 from keszybz/help-output
  8653422b6a sd-bus: Add sd_bus_get_creds_mask docs
  4096043f05 Revert "detect-virt: also detect "microsoft" as WSL"
  c11428adf9 homectl: say "home area" in more places
  460e5af05d meson: test userdbctl and homectl --help
  7009610ff5 userdbctl: make --help fit in 80 columns
  6164ec4c93 meson: modernize indentation
  7229ec02ab efivars: retry open and read operations
  4b6d94a1e5 shell-completion/zsh: update systemd-analyze completions
  f5b3be308d zsh: fix disable/enable completion
  3c14dc61f7 tests: various small fixes for strict systems
  7b679a188e sd-bus: Cite sd_bus_creds_unref in sd_bus_get_name_creds docs
  af5654d35c test-cgroup: skip if /sys/fs/cgroup unknown fs
  0bc5f001db cgroup-util: check for SYSFS_MAGIC when detecting cgroup format
  84cb27086f Improve help for clang-format
  3b4ea094e2 ci: introduce CIFuzz
  feb7d7a212 dhcp6: make string argument to sd_dhcp6_client_set_request_mud_url() const
  c13f4643f4 Merge pull request #15579 from DaanDeMeyer/sd-bus-get-name/owner-creds-docs
  e2697253c8 Merge pull request #15564 from poettering/tmpfiles-no-proc
  425d5cecbe sd-bus: Add sd_bus_get_name/owner_creds docs
  11f9379866 Merge pull request #15570 from poettering/cmsg-find
  41ab8c67eb tree-wide: use structured initialization at various places
  2efa5bc6fa dhcp-server: port to recvmsg_safe()
  2adfd1bda1 icmp6-util: port to recvmsg_safe()
  84b5d3e532 dhcp-client: port to recvmsg_safe()
  a8af7f6a5c fuzzit: make the submit phase a bit more robust
  9494da41c2 nss-systemd: don't synthesize root/nobody when iterating
  68b5003bc1 sd-bus: Add sd_bus_message_get_creds docs
  0e4305eeea sd-bus: Add sd_bus_get_name_machine_id docs
  d7fbc6804e sd-bus: Add sd_bus_send_to docs
  bf39cb7b92 Merge pull request #15566 from poettering/destroy-binfmt
  113a51d221 home: fix strv NUL termination
  927cffd57f Merge pull request #15569 from DaanDeMeyer/sd-bus-message-peek-type-docs
  b2cdefad3a networkd: don't do lldp rx nor tx on bond devices
  37f446eab7 Merge pull request #15550 from DaanDeMeyer/sd-bus-open/close/enter/exit-container-docs
  9d569d5fcb man: add a description of handling of single-label names
  035e3cb9f9 Merge pull request #15563 from keszybz/wait-callback-tweak
  08508c4862 Merge pull request #15561 from poettering/udev-memdup-fix
  371d72e05b socket-util: introduce type-safe, dereferencing wrapper CMSG_FIND_DATA around cmsg_find()
  dac556fa7b tree-wide: use cmsg_find() helper at various places where appropriate
  3df22bb5c8 sd-bus: Add sd_bus_message_peek_type docs
  7cd40caa66 sd-bus: Add sd_bus_message_open/close/enter/exit_container docs
  31e4abd1a6 sd-bus: Fix typo in sd_bus_message_append_array docs
  0f4a141744 Merge pull request #15504 from poettering/cmsg-find-pure
  cd9aa8f0f9 man: document binfmt's new --unregister switch
  846acb6798 binfmt: also unregister binfmt entries from unit
  f3670df13e binfmt: modernize code a bit
  0282c0285a shutdown: unregister all binfmt_misc entries before entering shutdown loop
  965cc99416 shared: add common helper for unregistering all binfmt entries
  a9ab5cdb50 Merge pull request #15472 from keszybz/dbus-api-docs
  185924ab63 update TODO
  d3d53e5cd1 shared: add NULL callback check in one more place
  f8606626ed tmpfiles: if we get ENOENT when opening /proc/self/fd/, check if /proc is mounted
  883fff25f4 stat-util: add simpler helper for checking if /proc/ is mounted
  6d965610bd stat-util: no need to open a file to check fs type
  0f7e4b2888 sysusers,tmpfiles: always mention error when failing to replace specifiers
  2230e8f29d sysusers: add accidentally forgotten 'return'
  8f3e342fa9 core: fix unused variable warning when !HAVE_SECCOMP
  9663ed378e udev: use STR_IN_SET() wher eit makes sense
  cd3c8a117c udev: prepare memory for extra NUL termination for NULSTR
  2d69cf6eb0 Merge pull request #15543 from poettering/fix-ubsan-sd-bus
  9f65637308 shared: Don't try calling NULL callback in bus_wait_for_units_clear
  b70cc80ffb Merge pull request #15544 from poettering/fix-journalctl-namespace
  bfbd5be02a journal: no need to check offset twice, journal_file_move_to_object() does it again
  893e0f8fb6 journal: make sure to explicitly copy out values of mmap before doing arithmetics on them
  711398986e journal: several minor coding style fixes/clean-ups
  0600ff0e66 journal: don't assert on mmap'ed object type
  13933c6b6f memory-util: add missing () in macro evaulation
  bba6e4aeec journal: use structured initialization for Location structure
  e6fea3063b journal: use a bitfield where appropriate
  20ee282bb7 journal-file: avoid risky subtraction when validity checking object
  ed50f18c4d macro: add READ_NOW() macro for force reading of memory, making a copy
  a5f0f46f1a Merge pull request #15538 from poettering/nspawn-no-netns
  ca57eed2e1 Merge pull request #15527 from Werkov/mkosi-opensuse
  69d95d6468 mkosi: Add openSUSE params file
  a7c71d214c run: don't wait for start job to complete when running interactively anyway
  3691bcf3c5 tree-wide: use recvmsg_safe() at various places
  47eae6ce0c socket-util: add recvmsg_safe() wrapper that handles MSG_CTRUNC
  5c568be167 test: add a test case for #15528
  2b6df46d21 sd-journal: don't check namespaces if we have no namespace to go by
  287b737693 nspawn: refuse politely when we are run in the non-host netns in combination with --image=
  1433e0f212 nspawn: minor simplification
  73781de41f Merge pull request #15530 from ssahani/lpr-dhcpv4-option-9
  0076098b0a sd-bus: Add sd_bus_message_get_error/errno docs
  49490c1d35 acpi-fpdt: mark structures as packed
  0cd41757d0 sd-bus: work around ubsan warning
  570f92c691 sd-bus: Add sd_bus_get/set_allow_interactive_authorization docs
  9786b27cbb Merge pull request #15546 from poettering/pid1-serialize-comand-fix
  4ee40eefce Merge pull request #15516 from poettering/nspawn-resolv-conf
  81d2fe53fc nspawn: some minor modernizations
  69123c218c man: Fix typo "multiplied with" -> "multiplied by"
  e8c47f7370 sd-bus: Add sd_bus_message_at_end docs
  bbdeb2b5e9 Merge pull request #15517 from DaanDeMeyer/sd-bus-monitor-docs
  1943d50e4e Merge pull request #15507 from poettering/bus-log-api
  e8cf09b2a2 core: make sure we don't get confused when setting TERM for a tty fd
  60e16d20a3 man: document that VirtualEthernetExtra= has nothing to do with Bridge=
  e9da62b18a core: make sure to restore the control command id, too
  5b99bd5fd4 core: some minor clean-ups/modernizations
  e309b929ba man: document the new --resolv-conf= options
  86775e3524 nspawn: beef up --resolve-conf= modes
  082814743f resolve: move resolv.conf path definitions to shared header
  828e653c48 networkctl: Add support to display LPR servers
  d64cc72e80 sd-network: Add support to retrive LPR servers
  d361b3730a network: Add support send and receive LPR servers
  50018bfa84 sd-network: DHCPv4 Add support to send and receive LPR servers.
  eecf4f7e04 Merge pull request #15526 from bluca/start_stop_wait_debug
  c03fbd37d6 core: add debug log when a job in the activation queue is not runnable
  ff5499824f mkosi: Unify environment for unit tests
  9acb2964d7 test: Simplify hostname checking
  bac567a53b mkosi: Use distro-invariant rootprefix
  9df91db5e0 Merge pull request #15519 from DaanDeMeyer/sd-bus-message-read-strv-docs
  80b44b38b5 test: correctly clean up test artifacts
  f6f4f5fe53 util: return the correct correct wd from inotify helpers
  df3d3bdfe8 core: minor error code handling fixes
  42f5c9a335 sd-bus: Clarify sd_bus_list_names results ownership
  e5f1a3faab sd-bus: Add sd_bus_message_read_strv docs
  2807b68019 Merge pull request #15520 from mrc0mmand/various-codebase-improvements
  a00f28c554 Merge pull request #15443 from ddstreet/use_gateway_backwards_compatible
  06c2b0c76b test: verify RoutesToDNS= is independent of UseGateway=
  86b52a3958 tree-wide: fix spelling errors
  e4ff03935c tree-wide: formatting tweaks reported by Coccinelle
  244490f5e0 network: honor SetDNSRoutes= even if UseGateway=False
  7c0d36ff5f test: modify/add tests for UseRoutes= and UseGateway= configuration
  589397a277 network: change UseGateway= default to UseRoutes= setting
  f74067dfbd sd-bus: Add sd_bus_list_names docs
  ff3518f1f4 test: drop Disk (Size|Free|Floor|Ceiling) fields prior comparing
  c5ca6d9076 update TODO
  0eb5b641c5 sd-bus: Add sd_bus_set/is_monitor docs
  7fffaafaf2 sd-bus: Rewrap sd_bus_set_server docs at 109 columns
  c5bc2c01ee core: add log_get_max_level check optimization in log_unit_full
  beb1d28654 man: remove gendered pronoun and reindent a paragraph
  98ab0daeeb docs: use "polkit" to refer to PolicyKit
  10d5ce0aa5 man: fix two typos
  2a9159244b man: timedate1(5) — add missing descriptions
  5d2262d7c3 man: hostname(5) — add description of methods and properties
  893f801d67 core: implement generic log control API in PID1 too
  25141692e9 core: use generic implementations of log level/target bus propertier getters
  ac9f55ed40 tree-wide: implement new log control API dbus interface in all our daemons
  4c4520789d resolved: replace private log level control API with generic one
  052740e2e3 log-control-api: add generic D-Bus interface for querying/setting log level/target
  38b38500c6 tree-wide: use "hostname" spelling everywhere
  debf2ddd28 man: reorder hostname1(5)
  33b58dfb41 core: automatically add udev dependency for units using RootImage=
  91b75f1f2f Merge pull request #15508 from keszybz/add-dbus-entities-to-index
  ede32a7cff Merge pull request #15505 from keszybz/man-sd-hwdb-sd-journal
  e14a0c21e9 man: document how to get the boot menu with zero time-out
  32c4d2ba62 man: add SD_HWDB_FOREACH_PROPERTY with an example
  ec7ea47dae man: add description of all the sd-hwdb funtions
  00bb75d7ce man: add markers to put all dbus entities in the directives index
  47fb7fd6b0 man: run systemd1(5) through the updater
  4a582e73b9 Merge pull request #15476 from boucman/directive_dbus
  f9411d5d5f Merge pull request #15495 from keszybz/resolve-debugging-and-stub-handling
  543d1e7854 Merge pull request #15314 from keszybz/network-server-access-functions
  55c0fbde8f Merge pull request #15502 from DaanDeMeyer/sd-bus-exit-on-disconnect-docs
  309b7d41f2 Merge pull request #15503 from DaanDeMeyer/sd-bus-get-docs
  21dc5e82ad man: add sd_j_open_namespace as refname
  622018c5b4 check-api-docs: sd_journal_open_container is deprecated
  c11edfee98 man: document sd_journal_*_with_location
  23139f89dc sd-bus: Rewrap sd_bus_set_close_on_exit + small fixes
  4eaf8bc69e sd-bus: Add sd_bus_get_scope/tid/unique_name docs
  b778146b94 sd-bus: Rewrap sd_bus_set_description docs
  75358555a5 sd-bus: sd_bus_get_fd docs typo fix
  f92c8d1c67 update-dbus-docs: automatically add variablelist for introspected items
  d4169bf8b0 sd-bus: Rewrap sd_bus_get_fd docs
  37409a1c68 sd-bus: Small sd_bus_set_server doc fix
  c72d0fb154 sd-bus: Add sd_bus_get/set_exit_on_disconnect docs
  842a362c3a sd-bus: Add sd_bus_is_server + sd_bus_set/is_bus_client docs
  8906e26278 make-directive-index: allow variablelist to specify an element to index
  acbfdec33e make-directive-index: allow pages to specify the path to search
  d512670a1f sd-bus: sd_bus_get_current_* docs fixes
  ca8b81d923 resolve: when the stub listener is disabled, symlink stub-resolv.conf to resolv.conf
  965228a846 resolve: when writing of private resolv.confs fails, do not remove old copies
  5c35cd5f47 resolved: include actual path in error message
  e53b8cc521 resolved: return org.freedesktop.resolve1.DnsError.NXDOMAIN on LLMNR resolution failure
  6daebf9e4a TODO: add a hypothetical
  7f25507647 man: add forgotten <para> tags around a paragaph in resolve1(5)
  df9578498f resolve: allow setting the log level dynamically as in pid1
  59eb35bd94 Merge pull request #15439 from keszybz/man-resolve
  b136cf54fc Merge pull request #15491 from keszybz/resolvconf-compat
  3d334c40b4 resolved: fix minor confusion in comment
  42ecca2e68 man: use manpages.ubuntu.com for resolvconf(8) link
  d8c73cb7c2 man: fix formatting in resolved.conf(5)
  b0fb800c9b man: reindent nss-resolve(8)
  f294b60204 Merge pull request #15480 from DaanDeMeyer/sd-bus-add-node-enumerator-docs
  9268c04bc1 Merge pull request #15478 from DaanDeMeyer/dbus-api-docs-fixes
  db5328e931 sd-bus: Add sd_bus_get_current_* docs
  ad30002885 sd-bus: Add sd_bus_emit_* docs
  7f3daf158a sd-bus: Small sd_bus_add_object_manager docs fix
  a3c0b9df9a sd-bus: Add sd_bus_add_node_enumerator docs
  85eeb14210 sd-bus: sd_bus_add_object docs fixes
  924ccc35f9 man: add a note that resolvconf updates /etc/resolv.conf in specific circumstances
  c40bd28419 sd-bus: Add sd_bus_set_server, sd_bus_get_bus_id docs
  2736c25ce2 D-Bus docs: systemd1 fixes
  e762fa0392 sd-bus: Add sd_bus_add_object_manager docs
  3841fa7916 sd-bus: Add sd_bus_add_filter docs
  89fc6fd3ea D-Bus docs: Use method instead of call
  5099fd44ca Merge pull request #15463 from keszybz/resolvectl-query-formatting
  0d5071fb29 Merge pull request #15444 from poettering/audit-enable
  09f8722801 Merge pull request #15396 from keszybz/dbus-api-docs
  1cabd2d0c5 systemctl: hide first column with --plain instead of --no-legend
  75dff0f910 Merge pull request #15459 from keszybz/remove-seat_can_multi_session
  affb59e6a2 network: add TUN/TAP vt-* network rule for VMs
  0136b1d1e0 resolvectl: fix indentation of hexdump'ed packets
  2cb9a8b963 test-resolve: add a bunch more packets for testing
  0500114e2a headers: get rid of pointless /* deprecated */ comment
  8f8cc84ba4 sd-login: get rid of seat_can_multi_session()
  0648f9beb9 errno-util: let's beef up ERRNO_IS_NOT_SUPPORTED() with socket not supported errors
  511e03a3ee journald: add configuration option for enabling/disabling audit during journald startup
  3db1c62d22 man/systemd-service: clarify env variable expansion
  f3a604e4cf Add .clang-format file
  4444e8533f Merge pull request #15454 from keszybz/codespell-fixes
  9a506b7e92 network: use "FooOverUDP" as one word
  c5e3469059 network: fix static assertion on IPPROTO_MAX range
  a71980e030 resolved: tone down comment in /run/systemd/{stub-,}resolve.conf
  7a2b5237d1 logind: skip polkit query with --no-wall
  e7ee906371 verify: ignore nonexistent executables if required
  037b5e2281 hwdb: optimize isatty()-per-line away
  2099a9e58d fileio: extend comment a bit
  abbfa8fdfa fileio: optionally allow telling read_line_full() whether we are processing a tty or not
  10731dde42 fileio: fileno() can realistically return -1
  40b2a5975c coredumpctl: support --file=PATH
  059211c7c6 Fix pam_systemd_home's debug parameter to match man page description
  c4883fe438 core: make sure ProtectHostname= is handled gracefully in containers lacking seccomp
  3ad42f3837 test: wait a bit after stopping the test service
  76e0d8b380 catalog: add entry for SD_MESSAGE_UNSAFE_USER_NAME
  ed86450ff4 docs: hook up the new USER_NAMES document everywhere
  64fdacd5f1 user-util: rework how we validate user names
  110d89cb65 userdbctl: drop redundant user name validity check
  f0300901ba man: explicitly note that ExecSt*Post does count for After/Before ordering
  78b3f7348d sleep: improve log msg slightly
  680d485902 man: correct the default slice for systemd-run units
  e04ee3c708 hwdb: Update database of Bluetooth company identifiers
  d830b0574e detect-virt: also detect "microsoft" as WSL
  dea7e0dd97 dbus-execute: show also ProtectClock
  8a2b89b5d6 man: add note that --no-hostname has limited effect
  8b0368f511 journal-remote: fix description of option
  da2125b6a2 capability: don't skip ambient caps setup if we actually have something to set
  e3b6d65c53 shared/dissect-image: log messages from cryptsetup
  9c61b53c74 resolve: reload /etc/hosts on inode change
  d540b947f4 string-util: make sure we eat even half complete words in split()
  3fa7fdce59 udev: Fix SIGSEGV in AlternativeNamesPolicy handling
  a8cff0034c Merge pull request #15347 from hakman/journald-upload-public-cloud
  c3b22a92a9 Merge pull request #15452 from keszybz/fix-ipproto-assert
  f1e318f690 network: fix typo
  a942084057 resolved: fix typo in an unused function and add comment
  ca264f7d96 man: fixes from online review
  ae53ea5226 man: update description of polkit rules for systemd1
  b9a1ee32c4 shared/reboot-util: indentation update
  c4b01de482 man: locale1(5) — adjust page structure and fill in the missing parts
  7592871e26 man: login1(5) — fix markup and fill in the missing descriptions
  b441a1d4bc man: review of import1(5)
  8024ac43b9 man: various tweaks to org.freedesktop.hostname1(5)
  4fb222c4b2 man: run dbus api docs through the updater
  08fe1b6cdc update-dbus-docs: add support for settings printing just one selected interface
  e5dd26cc20 Add updater for dbus introspection in man pages
  dad97f0425 manager: add dbus parameter names
  3031660c21 man: import org.freedesktop.systemd1(3) from the wiki
  edc6a8031e resolved: add dbus parameter names
  ffd10e5a24 man: import org.freedesktop.resolve1(3) from the wiki
  ce416f425c resolved: tone down comment in /run/systemd/{stub-,}resolve.conf
  b11b278097 Merge pull request #15448 from keszybz/logind-avoid-polkit-query
  162392b75a tree-wide: spellcheck using codespell
  fac2166359 network: use "FooOverUDP" as one word
  3d58d7328a network: fix static assertion on IPPROTO_MAX range
  e46736fbb6 units: use correct path to refer to plymouth
  c5f8a179a2 watchdog: reduce watchdog pings in timeout interval
  0f6d7be844 Merge pull request #15437 from keszybz/man-nss-resolve
  9ba4029f8f Merge pull request #15441 from sartura/src/analyze
  5644d47b7c logind: skip polkit query with --no-wall
  8183ebcd45 loginctl: adjust indentation
  3dadb54f5f Support journal-upload HTTPS without key and certificate
  f2a20e9966 man: move "myhostname" right after "resolve"
  44b7aedbde man: move "files" after "resolve" in the suggested configuration
  f30bf4d937 Include new configure options in features list
  ac24e418d9 network: Allow DHCPv6 client to be started even if no O or M bit in RA.
  9b4f3fa3ea virt: Use cache for VIRTUALIZATION_PROOT
  67551eac30 Add Logitech G502 HERO to mouse hwdb
  904ebcb200 sd-boot: Add → as alternative to boot selected entry
  80cc3e3eab virt: Detect proot virtualisation by ptrace metadata
  6ab2e1178e Merge pull request #15431 from poettering/lock-and-key-emoji
  dd0f79523f Add new meson configure option for controlling systemd-analyze support
  f4ff71b360 man: update os-release(5) to use 24bit ANSI color in example
  3614df0575 meson,resolved: make default LLMNR= and MulticastDNS= values configurable
  e3ac53a27d ask-password-api: reword some debug messages
  52d199e318 ask-password: prefix password questions with lock and key emoji
  539ee0989e locale-util: export emoji_enable() for other code to use
  48d70b4ac9 locale-util: add support for lock+key emoji
  c90c597ee3 verify: ignore nonexistent executables if required
  5fa5c3e2d0 Add meson build option to prevent building kernel-install
  3cfb7cc507 Merge pull request #15417 from poettering/fileno-can-fail
  a3af963958 Merge pull request #15414 from mrc0mmand/coredumpctl-file
  332f38d084 Fix pam_systemd_home's debug parameter to match man page description
  76643fedc8 sd-network: DHCPv6 - Add status codes
  daf8f72b4e core: make sure ProtectHostname= is handled gracefully in containers lacking seccomp
  aeb5645082 coredumpctl: support --file=PATH
  6663cfd574 update TODO
  648ba0ee81 hwdb: optimize isatty()-per-line away
  451fcbfc58 fileio: extend comment a bit
  609ae0f596 fileio: optionally allow telling read_line_full() whether we are processing a tty or not
  14f594b995 fileio: fileno() can realistically return -1
  9d5dac4dce Merge pull request #15411 from ssahani/systemd-issue-15375
  d9235719f2 Merge pull request #15397 from ssahani/vxlan
  38cd55b007 Remove unneded {}s
  667ceb9d9d sd-network: DHCP6 - Use readable error status rather than numeric value in the log message
  5cc34d6d1a localed: add dbus parameter names
  91c7ac94ba man: import org.freedesktop.locale1(3) from the wiki
  599c99ee3b timedated: add dbus parameter names
  9c970e5f55 man: import org.freedesktop.timedate1(3) from the wiki
  106d79be06 hostnamed: add dbus parameter names
  e09a36bd46 man: import org.freedesktop.hostname1(3) from the wiki
  956ecd3cd3 importd: add dbus parameter names
  2fe60ff1d0 man: import org.freedesktop.import1(3) from the wiki
  bbe17ca1cb machined: add dbus parameter names
  de2efb75f7 man: import org.freedesktop.machine1(3) from the wiki
  4cb5fd0da8 logind: add dbus parameter names
  44fd44f1cf man: import org.freedesktop.login1(3) from the wiki
  8cf85bb575 Merge pull request #15281 from keszybz/functional-test-rework
  92cad3f82d Merge pull request #15406 from DaanDeMeyer/sd-bus-set-exec-docs
  3415b0cc8a sd-bus: Add sd_bus_set_exec docs
  ea7cbf5bdd home: switch to BusLocator-oriented helpers
  964df69bd5 hwdb: Add accel orientation quirk for Geoflex laptop
  a1a11d5610 Merge pull request #15365 from poettering/remount-fs-pstore-fix
  b15b4376af Merge pull request #15405 from DaanDeMeyer/sd-bus-can-send-docs
  e5a12c4961 Merge pull request #15399 from DaanDeMeyer/sd-bus-property-docs
  7a0f1895d3 sd-network: DHCPv6 - Add NoPrefixAvail to error code
  59a77060e0 sd-bus: Use pointer syntax for sd_bus_set_exec argv parameter
  3258aa750e sd-bus: Add sd_bus_can_send docs
  535f1d0492 sd-bus: Fix sd_bus_close.xml line wrapping
  eb74579d09 meson: Exclude more deprecated functions from check-api-docs
  4b7f8d78de sd-bus: Add sd_bus_get/set_property docs
  5fe63895b9 docs: introduce documentation category for user/group stuff
  bba97c98b8 Merge pull request #15376 from poettering/homed-btrfs-subvol-luks
  659f85a519 networkctl: Add support to display VXLan remote address
  2d9123cebd Merge pull request #15377 from poettering/userdb-no-shadow
  edc8dd26e2 Merge pull request #15392 from keszybz/flag-helper
  fc1d9c7b0c network: VXLan - Add support for remote address
  7f782005e5 sd-bus: sd_bus_message_append fixes
  b05e122036 docs: add some documentation about hooking up userdb/homed to desktop environments
  24e6f45842 network: use a loop for repetitive operation
  c1997a5bf7 network: add helper to extract server lists
  ddc026f303 network: define string lookup table for the DHCP info bits
  c8407baf30 sd-dhcp-server: add a meta-setter to simplify setting of server lists
  8541db8f59 sd-dhcp-lease: add a meta-getter to simplify querying of server lists
  0da965037e Add yet another tiny helper to manipulate flags
  7d6342e401 man: fix garbled paragraph in systemd.network(3)
  16c347b3b6 busctl: wrap long lines
  8722b297e5 busctl: use the pager everywhere
  562ffaca26 man: extend documentation of the suspend= switch of pam_systemd_home
  5a3033321a docs: add brief document how to convert home directories to homed
  7c9b26900c network: VXLan - fix adding Group address
  fa2cf64a91 login: Fix incorrect reporting of CanMultiSession=no on non-seat0 seats
  df91e319a9 bus: add sd_bus_message_new_method_call() helper
  a028ef14c9 bus: s/BusAddress/BusLocator/
  764bffee88 Merge pull request #15379 from poettering/homed-man-ref-add
  dc487c9801 Merge pull request #15361 from mrc0mmand/yet-another-TEST-47-tweak
  c46db6c0a2 bootctl: fix assert issue
  10eed9848d docs: fix typo now → not
  b27cb676bf docs: add missing dash
  9b3c65ed36 Merge pull request #15352 from poettering/user-group-name-valdity-rework
  611cb82612 Merge pull request #15318 from fbuihuu/inherit-umask-for-user-units
  f58921bde3 Merge pull request #15332 from keszybz/coredump-filter
  f4cfdf07c8 man: reference pam_systemd_home man page from systemd-homed man page
  5a7c4f4f3b mount: introduce mount_is_nofail() helper
  2ec15c4f8a mount: default startup dependencies and default network ones are orthogonal
  61154cf953 mount: introduce mount_add_default_ordering_dependencies()
  b3d7aef525 automount: fix handling of default dependencies for automount units
  83cdc87094 mount: let pid1 alone handle the default dependencies for mount units
  b062ca616c logind: avoid shadow lookups when doing userdb client side
  ed30170ea0 userdb: when doing client-side NSS look-ups optionally avoid shadow look-ups
  a1792d1ada pam-systemd-home: drop redundant newline
  e58cd39f63 hwdb: Fix kbd brightness keys on Acer Predator PH 315-52
  5e37d1930b pid1: by default make user units inherit their umask from the user manager
  b94fb74bae manager: also log at debug level failure to read oom_score_adj
  ad21e542b2 manager: add CoredumpFilter= setting
  4d1f2c621f Merge pull request #15345 from keszybz/systemctl-show-spaces
  b34612bd5a Add parser and printer for coredump filter mask
  0be94a199e homed: when creating home directory as btrfs inside luks volume, place subvol inside it
  82c4440ddd import: use our new btrfs_subvol_make_fallback() at two places
  d78a95d751 btrfs-util: define helper that creates a btrfs subvol if we can, and a directory as fallback
  a1db42eb0b man: add missing varname around keywords in systemd.unit.xml
  fe78538cab man: explicitly note that ExecSt*Post does count for After/Before ordering
  ce51632a35 basic/parse-util: add safe_atoux64()
  0ed4b54e05 sleep: improve log msg slightly
  302dc5b913 Merge pull request #15368 from poettering/color-fix
  f74349d88b mount-setup: change the system mount propagation to shared by default only at bootup
  241c4b6ada systemctl: show Environment entries with whitespace
  2b99f645c6 shared/escape: add new escape style with \n\t escaped
  ca03142040 Merge pull request #15331 from vcaputo/busdpi
  2c7039b316 systemd-run: add --slice-inherit
  ba45534917 man: correct the default slice for systemd-run units
  876acda0ed Merge pull request #15234 from ssahani/mud-lldp
  a45aced09a test-terminal-util: fix typo
  a851ba0795 terminal-util: fixate underlined yellow color too
  ad313ec33b catalog: add entry for SD_MESSAGE_UNSAFE_USER_NAME
  887a8fa341 docs: hook up the new USER_NAMES document everywhere
  cafed7b32c docs: add a longer document explaining our rules on user/group names
  7a8867abfa user-util: rework how we validate user names
  2aea5883f1 userdbctl: drop redundant user name validity check
  b0c1a07654 units: make sure systemd-pstore stops at shutdown
  e0f968ad96 units: drop systemd-remount-fs.service dependency from more services
  0c978faa16 units: drop dependency on systemd-remount-fs.service from systemd-pstore.service
  f3b7a79b97 core: automatically add dependency on systemd-remount-fs.service if StateDirectory= is used
  167241912f units: pull in systemd-pstore.service from sysinit.target
  e00e2e0b50 test: wait a bit after stopping the test service
  8ff8ce6284 Merge pull request #15358 from poettering/preset-clean-up
  e9a8c550c1 LLDP: Add support to transmit MUD URL
  9e27fd321c preset: let's clean up preset list a bit
  f69b4ae885 sd-lldp: Add support to receive MUD
  9afe05c149 Merge pull request #14930 from tomhughes/dnssec-canonicalise
  cabc1c6d7a units: add ProtectClock=yes
  c3362c2f97 Remove message->priority field
  6635f57d3e sysctl: enable coredump for suid binaries
  f9d29f6d06 fix manager_state
  e6b68254c2 hwdb: Add accel orientation quirk for MPMAN MPWIN895CL tablet
  602235f27d Merge pull request #15349 from keszybz/doc-work
  9aa822179b man: update rules
  326b1f897b Remove stray file
  bb288a2cb3 man: drop apostophe from section title
  9fac14980d hwdb: Update database of Bluetooth company identifiers
  219ab1fbd0 bus: introduce some sd-bus convenience helpers
  3c2a50c945 oss-fuzz: point the badge directly to our logs
  858b64593a semaphore: switch to upstream-ci
  a2f838d590 detect-virt: also detect "microsoft" as WSL
  4c39820562 Merge pull request #15298 from keszybz/show-property-value
  3d9489ee45 Merge pull request #15321 from topimiettinen/dbus-execute-add-protect-clock
  4fbf39926e Merge pull request #15290 from keszybz/unrelated-fixes
  3adb304ae6 Merge pull request #15297 from poettering/homed-no-fallocate
  5522e628f5 test: use show -P in places
  5292c24047 systemctl: add -P as short for --value --property=
  1b87e27999 Merge pull request #15315 from DaanDeMeyer/deprecate-sd-bus-priority
  c4b2371263 capability: don't skip ambient caps setup if we actually have something to set
  e30934c80f Merge pull request #15310 from poettering/repart-no-enable
  1887032f71 shared/dissect-image: log messages from cryptsetup
  aa5408e2e8 resolve: reload /etc/hosts on inode change
  b8b7b838fd dbus-execute: show also ProtectClock
  50f5e2e281 Merge pull request #15309 from poettering/strv-split
  1e9a7c44a9 sd-bus: remove unused priority logic
  11a177d9de sd-bus: Deprecate priority functions
  fdfe909123 units: run systemd-repart only if there's configuration for it
  aade0c3b6e Revert "units: make systemd-repart.service installable"
  0fc659eea9 update TODO
  82aa14e2a3 string-util: make clear that split() + FOREACH_WORD() should die
  29965a2a6e string-util: make sure we eat even half complete words in split()
  5fed82c642 string-util: some minor coding style updates
  77b19caf6b update TODO
  c83a5ead31 Merge pull request #15210 from ssahani/networkctl-up-down
  457d65932b mount: mount unit activated by automount unit should be only ordered against the automount unit
  935052a8aa sd-bus: add va_list variants of variadic convenience functions
  c51c6f2f57 Merge pull request #15252 from ssahani/dhcpv6-mud
  4e561c6200 Merge pull request #15109 from keszybz/units-make-installable
  61fd7d6720 udev: Fix SIGSEGV in AlternativeNamesPolicy handling
  e7b0ea5440 Merge pull request #15238 from rpls/canfd
  7e025e9cdb network: can: add support for CAN-FD related properties
  74a2726869 network: can: introduce a config parser function for bitrates
  2c4229221c man: mention that stdout logging works the same as stderr logging
  1e4711af5b userwork: fix signal worker sends to manager requesting more workers
  c7f9da1e4a units: do not pull in home.mount from systemd-homed.service
  3469a951fa home: fix several typos
  2c5ae0f58a homectl: fix a typo
  5eedafd01a import: Only keep RO copy if ETag header is set
  5b434d7209 nss-systemd: add missing jump to unlock mutex
  1a2f596bcb basic: Fix capability_ambient_set_apply for kernels < 4.3
  e4b7c40dca sd-journal: remove the dead code and actually fix #14695
  a0b77ea24b user-util: switch order of checks in valid_user_group_name_or_id_full()
  d71c24910d user-util: Allow names starting with a digit
  9ac3070285 Remove stale doc about PrivateNetwork and type
  d822e2a524 Add `shell` to machinectl ZSH completion
  60521ea904 Silence Wstring-plus-int warning when using clangd with GCC.
  e6fcb95f4a path-lookup: Use default value for XDG_CONFIG_DIRS if environment is not set
  e46f877c5c homed: fall back to ftruncate() if fallocate() is not supported on backing fs
  ad8f1b0f36 generator: don't generate device dependencies for extrinsic mounts
  3175a8c21b network: DHCPv6 Add support to send MUD URL
  de8d6e5563 sd-dhcpv6: Add support to set request MUD URL
  6829d8ce69 Merge pull request #15253 from DaanDeMeyer/object-vtable-error-docs
  bc9e5a4c67 fstab-util: introduce fstab_is_extrinsic()
  b862c25716 device: drop refuse_after
  e6a4e25a82 man: add note that --no-hostname has limited effect
  c083264115 Merge pull request #15278 from vcaputo/more-trivial-cleanups
  9e76a88faf man: mention that stdout logging works the same as stderr logging
  47203ed085 sd-bus: sd_bus_call docs improvements
  e3e5a6eebd sd-bus: Add sd_bus_get/set_priority docs + fixes
  b1b9e829c2 Merge pull request #15229 from ssahani/mud
  82b2281dd5 journal-remote: fix description of option
  934cf0a9c7 sd-bus: simplify bus_maybe_reply_error
  9b62e232ea sd-bus: Add note about sd_bus_reply_method_return to SD_BUS_METHOD docs
  fc91667d77 sd-bus: Add sd_bus_add_object and callback docs
  6ba8071ca1 sd-bus: Fix typos in sd_bus_add_object_vtable docs
  50b88e87c8 sd-bus: Wrap add_object_vtable docs at 100 columns
  8e06af804b *: use _cleanup_close_ with fdopendir() where trivial
  b46c3e4913 *: use _cleanup_close_ with fdopen() where trivial
  9f81a592c1 *: convert amenable fdopendir() calls to take_fdopendir()
  f61457b0fe fileio: add take_fdopendir() variant
  4fa744a35c *: convert amenable fdopen calls to take_fdopen
  3ebbb6cb39 fileio: introduce take_fdopen{_unlocked}() variant
  f5d9daaea3 Merge pull request #15268 from poettering/sigusr1-sigusr2
  286fe8ee21 units: do not pull in home.mount from systemd-homed.service
  80ace4f25e home: fix several typos
  20f938ff7f test: print path to build directory on misconfiguration
  ead7af3093 units: make systemd-userdbd.{socket,service} installable
  5ef9eda17f units: make systemd-homed.service installable
  7e1ed1f3b2 units: make systemd-repart.service installable
  73abf7ae06 run-integration-tests: only do the clean operation in the beginning
  6e5b51d94a test: run loop device cleanup in more cases
  5a89d7b39c run-integration-tests: print times
  e00fca8c2e TEST-13-*: remove containers created in test before running the test
  68a7705e35 TEST-06-*: also try the installation path for Debian
  f1416431b6 test: optionally print the journal after tests
  f9eb2d51da test: use systemd-journal-remote for journal copying, support $ARTIFACT_DIRECTORY
  8943daf813 test: use a helper function to move the journal files
  3597bf7550 run-integration-tests: add support for blacklisting
  a455e75a30 test: use systemd.status-unit-format=name in all but one test
  a85daa0dfb user-util: switch order of checks in valid_user_group_name_or_id_full()
  3aeea37d88 home: narrow scope of 'size_t n'
  36e4a8f22a homectl: fix a typo
  7b8d23a9bb network: DHCPv4 - introduce The Manufacturer Usage Description (MUD)
  d11d4a6459 sd-dhcpv4: introduce The Manufacturer Usage Description (MUD)
  1f4faf21e8 Merge pull request #15197 from ssahani/smtp-dhcp
  01262d0d9e Merge pull request #13084 from ddstreet/log_time
  6305608f1c Merge pull request #15194 from keur/import_pull_etag
  4c287f9a0b Merge pull request #14853 from floppym/issue9806
  fef7397022 Merge pull request #15251 from keszybz/coverity-fixes
  15529f5cea Merge pull request #14338 from keszybz/functional-test-rework
  e3028514ae userwork: fix signal worker sends to manager requesting more workers
  6b8d32ea7b ci: turn off FuzzBuzz
  c4ae2704b7 travis: install ninja with pip
  ad1e288013 networkctl: Add support to display DHCP SMTP servers
  c1c6ff10a1 sd-network: Add support to emit and receive SMTP server information
  f6269fe7bb network: DHCP - add support to emit and receive SMTP server information
  4a874560c5 Merge pull request #15217 from keszybz/beef-up-sd-path
  35bae98dce sd-bus: Fix pointer alignment
  45069c67ce sd-bus: Add sd_bus_slot_get_current_* docs
  a6c9f8fa6d README.md: add repology badge
  7ea4392f1e basic: Fix capability_ambient_set_apply for kernels < 4.3
  3e118d135b Merge pull request #15233 from msekletar/device-dbus
  2e129d5d6b device: don't emit PropetiesChanged needlessly
  7c4d139485 device: make sure we emit PropertiesChanged signal once we set sysfs
  37bc9dcc09 nss-systemd: use _cleanup_ for pthread_mutex_{lock,unlock}
  29d4392ca0 basic: add _cleanup_ wrappers for pthread_mutex_{lock,unlock}
  e7e9a9d0dc nss-systemd: add missing jump to unlock mutex
  42b977810d test-strv: add missing oom check
  8af10ca3fc test: print test of name in output
  e2d612a8e4 meson: use find_program() for add-git-hook.sh
  f4c7bf9e90 test: run unittests with newlines in /proc/cmdline
  1506edca91 test: stop caching loopdev
  693ad298e9 test: perform partial cleanup after each test is run
  108d00a6b2 test: simplify the Makefiles
  ec43f6862e test: run tests directly from the loopback device
  eb1290ef35 test: wipe journal files after test
  b74a306197 test: echo a message when the tests fails
  9d84eb2053 test/TEST-01: allow running w/o -Dinstall-tests=true
  8c3534b5db test: rework how images are created
  388b68a74f semaphoreci: trivial cleanup
  de0162a95a test/TEST-28: avoid race in handling of /testok
  4962ed9f33 test: make sure to reset state before starting integration tests
  8a59e79c09 test: mount root rw and drop /etc/fstab
  50b836518c test: drop cargo-cult line
  80c53fe7d5 test: improve reporting a bit
  70ce817ccb test: de-duplicate test_setup() functions
  bdfa9657d0 test: move TEST-47-* to static files
  2c75449a38 test: move TEST-46-HOMED to static files
  e29e4d5742 test: convert TEST-45 to a normal meson test
  07d16f438a test: move TEST-44-* to static files
  d0ac89a1e8 test: move TEST-43-* setup to static files
  bdfd515ad1 test: move TEST-42-EXECSTOPPOST setup to static files
  0ac5dbf3ae test/TEST-41: use a file in /tmp and reset the contents
  2b2eefee06 test: move TEST-41-ONESHOT-RESTART setup to static files
  d48b27bffd test: move TEST-40-EXEC-COMMAND-EX setup to static files
  7124ae207a test: move TEST-39-EXECRELOAD setup to static files
  4db7d044b8 test: move TEST-37-RUNTIMEDIRECTORYPRESERVE setup to static files
  534a42705b test/TEST-36: move the config files to /run
  097d8c6eb7 test: move TEST-36-NUMAPOLICY setup to static files
  fbaa11372b test: convert TEST-35-NETWORK-GENERATOR into a unit test
  01efa07960 test: move TEST-34-DYNAMICUSERMIGRATE setup to static files
  ff978cd24a test: move TEST-33-CLEAN-UNIT setup to static files
  c8937bed08 test: move TEST-32-OOMPOLICY setup to static files
  048d52d51e test: move TEST-31-DEVICE-ENUMERATION setup to static files
  7eeeab205d test: move TEST-30-ONCLOCKCHANGE setup to static files
  e578ea4df4 test: move TEST-29-UDEV-ID_RENAMING setup to static files
  94370e627f test: move TEST-28-PERCENTJ-WANTEDBY setup to static files
  468874997a test: move TEST-27-STDOUTFILE setup to static files
  dfa633ca6a test: move TEST-26-SETENV setup to static files
  68e2dc0f91 test/TEST-25: remove all images at the end of the test
  6e796683df test: move TEST-25-IMPORT setup to static files
  f4c40fd754 test: move TEST-24-UNIT-TESTS setup to static files
  30b84c78ea test-fileio: fix bogus error when /proc/cmdline contains newlines
  b49325d028 test: move TEST-23-TYPE-EXEC setup to static files
  c0b97b0fc8 test: move TEST-22-TMPFILES setup to static files
  c1d6c135bc test: move TEST-20-MAINPIDGAMES setup to static files
  e67a2644a8 test: move TEST-19-DELEGATE setup to static files
  dce2b8ce48 test: move TEST-18-FAILUREACTION setup to static files
  9911131a60 test: move TEST-17-WANTS setup to static files
  e5b0aaaf56 test/TEST-16: simplify how variables are set
  2b5981b40a test: move TEST-16-EXTEND-TIMEOUT setup to static files
  1aa0f38491 test/TEST-15: call daemon-reload in two more places
  4e2ac45a83 test/TEST-15: remove all created unit files
  2c7519c036 test: move TEST-15-DROPIN setup to static files
  afd9c55dcc test: move most of TEST-14-MACHINE-ID setup to static files
  e5badaf335 test: move most of TEST-13-NSPAWN-SMOKE setup to static files
  d10029bba4 test: move TEST-12-ISSUE-3171 setup to static files
  3ac189d8aa test: move TEST-11-ISSUE-3166 setup to static files
  8c6d58f65d test: move TEST-10-ISSUE-2467 setup to static files
  4110a6deb9 test: use shell arrays and remove duplicates
  e88302002f test: move TEST-09-ISSUE-2691 setup to static files
  c84752398b test: move TEST-08-ISSUE-2730 setup to static files and meson scripts
  58a1bdb467 test: move TEST-07-ISSUE-1981 setup to static files
  4caa1ac794 test/TEST-06: make autorelabel.service a static file too
  1c76b5b5bb test/TEST-06: skip test if no selinux
  1ed5556e56 test: move most of TEST-06-* setup to static files
  ed024e1d98 test: move TEST-05-RLIMITS setup to static files
  9901a6ad2e test: convert TEST-04-JOURNAL to generic image
  41b1b2a563 test: move TEST-03-JOBS setup to static files
  5964e39a69 test: move part of TEST-02-CRYPTSETUP setup to static files
  fe85f2bb9c test: move TEST-01-BASIC setup to static files
  2c649ca1c9 sd-dhcp: Add support to emit and retrieve SMTP server
  69d06b7acf Add a device to 60-sensor.hwdb
  8581b9f973 sd-journal: remove the dead code and actually fix #14695
  2df0df56dd Merge pull request #15237 from cgzones/improve
  3c04ed633b Merge pull request #15195 from ssahani/dhcp-option-pop-server
  9f4aafea37 networkctl: Add support to display DHCP pop3 servers
  8102b9e710 sd-network: Add support to emit and receive pop3 server information
  284e8fd0d7 DHCP: Add support to emit and retrieve POP3 server
  f678ac7e29 libsystemd-network: DHCP add support to emit and retrive DHCP POP3 server
  31c68e0277 docs: Add some notes about managing graphical user sessions
  1b7d1cae0f selinux: print enforcing state in access check debug message
  2073bf3f58 selinux: add debug logging to cache functions
  c8aa389c42 selinux: add unlikely compiler hints for cache functions
  2e09fa8906 sd-path: handle case of missing runtime dir in test
  e342055851 path: log at debug level when we can't query a variable
  f52b9131e5 man: fix typo
  f1bb691a5a sd-path: export "systemd-network-path"
  b0c8219260 network: move NETWORK_DIRS to path-lookup.h
  96d33e4ac0 Rename _PATH variables to _DIR when they refer to a directory
  9c5bb2033d path: show various systemd directories and search paths too
  ce7eb6aa84 sd-path: simplify implementation of sd_path_lookup*()
  09e6443ef4 Move path-lookup.c to src/basic
  385093b702 Split out generator directory setup to a src/core/generator-setup.c
  a7addf32a5 sd-path,strv: add simple helper to wrap oom handling around strv_split_nulstr()
  b35ed5530b man: add sd_path_lookup(3)
  557afad2b7 libsystemd: install sd-path.h and export sd_path_lookup{,_strv}
  3919ecc553 meson: run a no-op build to generate man rules
  51327bcc74 sd-path: rename the two functions
  d32014a5bb test-sd-path: basic test for the sd-path API
  4908de44b0 {systemd,udev}.pc: add names with underscores, deprecate the old ones
  009b80a48d path: align columns
  b642dfcdc2 hwdb: add Star Lite Mk II and Star LabTop Mk III (#14621)
  90c40df0a6 Add Lenovo IdeaPad Miix 300 ACCEL_MOUNT_MATRIX
  93c23c9297 user-util: Allow names starting with a digit
  acd1987a18 core/unit: print info when unit_add_name failed
  9520a0308d Remove stale doc about PrivateNetwork and type
  e730db6c90 systemd-network-generator.service: network-pre.target is a passive target unit
  72e1c0b308 Add `shell` to machinectl ZSH completion
  4047a411f4 Merge pull request #15186 from DaanDeMeyer/clangd-fix-wstring-plus-int
  c08323dcd1 Merge pull request #15236 from ssahani/br-follow-up
  4c6a4a5bfe shared- bride util allign bridge_state_table
  c30ffcee9b networkctl: Add support to set link up and down
  6281c6e56c po: update Ukrainian translation (#15228)
  1ab2033804 Merge pull request #15224 from ssahani/geneve
  f0d0698f0b path-lookup: Use default value for XDG_CONFIG_DIRS if environment is not set
  a879b6d22f Merge pull request #15214 from ssahani/networkctl-br1
  272a8864da Merge pull request #15170 from keszybz/sd-bus-resolve-magic
  ce4c73eb5d Merge pull request #15209 from anitazha/moar-cgroup-utils
  0f5047b7d3 network: DHCP lease load SIP copy paste error
  98a3494652 davfs is a network file system
  9b52ce58de units: Don't mount tracefs in LXC
  cd6ff773bd swap: check p->what for NULL
  9ac1ab1658 login: allow non-console sessions to change vt
  8f0feac20f logind: log a more accurate error when we failed at session creation
  a0b4460e49 core: add support for setting CPUAffinity= to special "numa" value
  e3b12a749d shared: split out NUMA code from cpu-set-util.c to numa-util.c
  a22e8850a8 Merge pull request #15191 from GiedriusS/feature/list-unit-files-return-1
  eeb1542b5e systemctl: exit with 1 if no unit files found
  e7b38d7d5c networkctl: Display more geneve preperties
  3039cc0281 network: Introduce geneve util
  baa358df32 cgroup-util: cg_get_xattr_malloc helper
  613328c3e2 cgroup-util: helper to cg_get_attribute and convert to uint64_t
  1b43e24602 network: attach sd-event in link_load() when creating link dhcp_client or ipv4ll
  a8389a3307 networkctl: Use string table for bridge state
  af94bb24b5 shared: Introduce bridge util
  12ef8fb6f1 networkctl: Add more bridge properties
  2e7d6d1d32 Merge pull request #15185 from ssahani/fix-sip-copy-paste
  137d448751 davfs is a network file system
  71180f8e57 Fall back to kexec when no kexec binary exists
  50dfca2eaf import: Only keep RO copy if ETag header is set
  cdc6c95737 units: Don't mount tracefs in LXC
  d4a3494e65 swap: check p->what for NULL
  992622c428 man: fix typo in loader.conf(5)
  b0f4c02e2d sd-bus: Add sd_bus_send docs + cleanups.
  1f807af6de networkctl: Add support to display SIP servers
  eb46288cca sd-network: Provice APIs to access SIP servers given by DHCP4 server
  5f28f3ddaf test: allow overriding EFI_MOUNT like other variables
  b6261be84d meson: report -Dinstall-tests in summary
  80769cb66c meson: use install_subdir() to install files
  f55198f034 test: replace symlinks with actual unit files
  f455f8633e Silence Wstring-plus-int warning when using clangd with GCC.
  be1af90585 network: DHCP lease load SIP copy paste error
  f41df6954c sd-bus: whitespace adjustments
  70bc558cc1 sd-bus: support SD_BUS_DEFAULT* and don't crash in functions where bus is optional
  501ecd670c sd-bus: make sure SD_BUS_DEFAULT* works everywhere
  60ef094297 sd-bus: Add sd_bus_reply_method_return docs + cleanups
  7b43295346 tests: move unit files to units/ subdirectory
  4bd859be95 sd-bus: add sd_bus_message_seal docs + cleanups
  b5b179e49e Fix keys on Medion Akoya P6669
  19bb87fbfa login: allow non-console sessions to change vt
  b39648ed47 logind: log a more accurate error when we failed at session creation
  677ceb0c2f Merge pull request #15153 from keszybz/man-bus-address
  7354900ddd network: Fix split in `SendOption=` on client and server
  d69b62de44 networkctl: Add support to display IPv6 addrgenmode
  194fe32296 selinux: delay mac_selinux_enforcing call after SELinux was determined to be enabled
  d1d3f2aa15 docs: Add syntax for templated units to systemd.preset man page
  3c69813c69 man: add a tiny bit of markup
  bf595e788c home: fix segfault when parsing arguments in PAM module
  e110f4dacb test: wait a bit after starting the test service
  e8df08cfdb fix journalctl regression (#15099)
  eb3a38cc23 NEWS: add late note about job trimming issue
  405f0fcfdd systemctl: hide the 'glyph' column when --no-legend is requested
  1c7de81f89 format-table: allow hiding a specific column
  b7f2308bda core: transition to FINAL_SIGTERM state after ExecStopPost=
  2867dfbf70 journalctl: show duplicate entries if they are from the same file (#14898)
  af339a3122 namespace: ignore prefix chars when comparing paths
  d58988be7f udev: fix SECLABEL{selinux} issue (#15064)
  98f8a718c1 dissect-image: avoid scanning partitions
  35c4d42040 test: ignore IAB capabilities in `test-execute`
  40737329d9 test: add a test case for migrating DynamicUser=yes to no
  7059385290 execute: Fix migration from DynamicUser=yes to no
  cc46b9d913 sd-bus: sd_bus_set/get_method_call_timeout docs + cleanups.
  9178398f2e man: say "is" not "has been"
  92b6df1d68 man: mention sd_bus_is_anonymous() and sd_bus_is_trusted()
  cc3d85eb97 sd-bus: mark sd_bus_try_close() as deprecated
  99cde098f8 bus: drop dead code for kdbus support
  9783b59bf6 man: describe sd_bus_default_flush_close()
  3f549982a5 man: add sd_bus_set_address(3)
  d3d5ff4bc2 sd-bus: make bus_set_address_user always go through sd_bus_set_address
  27622235c4 man: add sd_bus_start(3)
  b1d6fe7055 networkctl: Add support to display bond
  8c357762c7 Merge pull request #14749 from msekletar/cpu-aff-numa-v3
  953ee402cb sd-bus: sd_bus_call/sd_bus_call_async_docs + cleanups.
  b48772f6cb Merge pull request #15143 from ssahani/networkctl-tunnel-geneve
  5712d689b9 networkctl: Add support to display vti and vti6 tunnels
  ad760bc1e7 networkctl: add support to display ip6gre, ip6gretap, ip6erspan
  1f667d8a7c docs: Add syntax for templated units to systemd.preset man page
  34bc838f15 Merge pull request #15136 from yuwata/network-dhcp4-use-gateway
  52d247154b Merge pull request #15108 from keszybz/systemctl-set-default-notices
  4d75ea1ea3 networkctl: Add support to display gre gretap and erspan
  4e1a1991c6 networkctl: Add support to display geneve tunnel info
  24a3c4299f hwdb: add support for Lenovo Legion Y9000X2020 (#15127)
  0208c4bb3c po: update Polish translation
  1f5d1de269 Fix volume control keys on Lenovo Yoga S940
  12877da215 systemctl: print a notice when set-default is not effective
  dca352245b networkctl: Add support to show tunnel (ipip/sit) local and remote address
  9735c644be sd-bus: Add sd_bus_method_call/sd_bus_method_call_async docs + cleanups.
  a4f4a4e441 Merge pull request #15138 from ssahani/networkctl-vlan
  272e6b8c62 Merge pull request #15139 from DaanDeMeyer/sd-bus-remove-unused-cite
  aff618c769 sd-bus: Remove unused man cite of `sd_bus_slot_new_signal`.
  08c588d18b network: do not re-attach sd-event object
  74f0fb9095 network: can: add support for listen-only mode
  6cfef1b308 networkctl: Add support to display master device
  2b2a1ae6fb networkctl: Add support to display vlan ID
  0d7bd445d2 test-network: add a test case for DHCPv4.UseGateway=no
  b453122789 network: add a flag to ignore gateway provided by DHCP server
  e2b2fb7f56 core: add support for setting CPUAffinity= to special "numa" value
  1808f76870 shared: split out NUMA code from cpu-set-util.c to numa-util.c
  f12d19b304 home: fix segfault when parsing arguments in PAM module
  0e4daba173 NEWS: fix use of tabs instead of spaces for one item
  aaf6c75061 sd-bus: Add sd_bus_set_fd documentation along with some cleanups.
  197298ff9f test: wait a bit after starting the test service
  9790ca75fc Merge pull request #15104 from ssahani/networkctl-qdisc
  5e59431c53 systemctl: emit notice about some kernel commandline options
  cd57038a30 core: consistently emit oom warning when parsing args
  e810df37e4 networkctl: Add support to display qdisc
  8394952777 sd-netlink: Add IFLA_QDISC
  ec458d20b2 homed: replace "home directory" with "home area" in a few places
  20a7592edf shared/ask-password-api: do not show hint on echo
  8d0726fcd7 fix journalctl regression (#15099)
  557b9716f6 Merge pull request #15097 from keszybz/job-logging-and-news-update
  ddee0e815e shared/ask-password-api: do not show hint on echo
  567a530760 fstab-generator: handle systemd.swap= command-line argument
  2ca17c7801 NEWS: add late note about job trimming issue
  c86c31d9ca core: log an info line about the default target
  392a2d5148 Merge pull request #15095 from yuwata/tc-tiny-fixes
  1f58feec73 linux: update headers from v5.6
  f344a492d1 man: use include directive for Parent= or friends
  ff60129bc4 network: rename type name to ProportionalIntegralControllerEnhanced
  c3151977d7 namespace: fix MAC labels of /dev when PrivateDevices=yes
  7bda173f6a Merge pull request #15084 from yuwata/network-tc-next
  970ab1fcc0 test-network: add a test case for HHF
  7f22402007 network: TC - introduce HHF
  7e16f84ea2 sd-netlink: add HHF netlink property
  41bb371bb0 test-network: add a test case for PFIFOFast
  1a95964bfa network: TC - introduce pfifo_fast
  73136507ac test-network: add a test case for PFIFOHeadDrop
  053a2ddbb2 network: TC - introduce pfifo_head_drop
  7b1a31a3d0 test-network: add a test case for BFIFO
  c853f594d4 network: TC - introduce BFIFO
  557fa421ff test-network: add a test case for DRR
  ad365c5de7 network: tc: introduce DRR class
  f5fc04417e network: TC - introduce DRR
  5c21b46e49 sd-netlink: add DRR netlink properties
  be94e591fb test-network: add test case for PIE
  bde4ae88c8 network: tc- introduce PIE
  55d228311b sd-netlink: add support for PIE
  782a7eb719 Merge pull request #15081 from mrc0mmand/systemctl-hide-glyph-column
  88c2616509 Merge pull request #14901 from w-simon/fix-tests
  d171e679e7 systemctl: hide the 'glyph' column when --no-legend is requested
  0080964cc8 format-table: allow hiding a specific column
  f1d075dcb7 core: shorten local variable names in do_queue_default_job()
  b5947b5b10 homed: replace "home directory" with "home area" in a few places
  0b1b0a01ab man: add a tiny bit of markup
  c1566ef0d2 core: transition to FINAL_SIGTERM state after ExecStopPost=
  b6849042d6 journalctl: show duplicate entries if they are from the same file (#14898)
  693040bde5 Merge pull request #15063 from topimiettinen/execute-dont-create-tmp-dirs-if-inaccessible
  7600dbb870 udev: add debug logs for delaying and delegation of events
  0335d110af udev: fix SECLABEL{selinux} issue (#15064)
  42a739a0b5 Modified line 197 for readability. (#15071)
  4f2db15371 meson: mark test-cgroup as standard
  67da33231a test-cgroup: do not require root to pass
  efa2f3a18b execute: don't create /tmp and /var/tmp if both are inaccessible
  de46b2be07 namespace: ignore prefix chars when comparing paths
  1c132196b1 test-cgroup: fix memleak
  2a8020fe9d basic/cgroup-util: modernize cg_split_spec()
  b35e9974fa test-cgroup: split into functions as usual
  084df9c616 analyze: fix table time output
  9251cac7b2 Support compiling with clang and gnu11 standard
  ffccc15f72 Typo fix
  1777c7f70d Update Croatian translation (#15042)
  73678d2307 boot: Ensure ARM UEFI binary does not contain FP/SIMD instructions
  0108c42f59 dissect-image: avoid scanning partitions
  4b3abcd019 safe_fork: use a cleanup function to restore signal mask in parent
  d7e38115cb safe_fork: unblock most signals before waiting for child
  3b5b6826aa mount-setup: make /dev noexec
  e9cdcbed77 test: ignore IAB capabilities in `test-execute`
  908055f61f Merge pull request #15033 from yuwata/state-directory-migrate-issue
  47cc458e97 analyze: fix table time output
  36e0d89a88 Support compiling with clang and gnu11 standard
  f14266c843 meson.build: drop unused SYSTEMD_SLEEP_BINARY_PATH
  1cee1c5283 Typo fix
  51915ca447 Update Croatian translation (#15042)
  1ad6056239 boot: Ensure ARM UEFI binary does not contain FP/SIMD instructions
  a834cb5247 Merge pull request #15036 from yuwata/can-termination-mod
  084f99afce Merge pull request #15038 from lucaswerkmeister/docs
  e1ef1e5d53 docs: fix typo
  afcb3e758c docs: fix misplaced close-paren
  52aa38f14a network: add CAN Termination tristate option
  9c01b203a7 linux: add can/netlink.h
  bba1f90ff5 Merge pull request #14890 from yuwata/network-tc-next
  a34811e4ef udev: support to update flow control parameter
  5d3b801764 network: Add support to ignore foreign routes
  d739fddeb5 network: add setting to support RA without DHCPv6 client
  cd305af1fe network: Allow DHCPv6 client to start without router's managed flag.
  eec394f10b systemd-resolved: use hostname for certificate validation in DoT
  0d14eefb0d Merge pull request #14893 from benzea/benzea/generator-path-environment-variables
  a1e13c30de Merge pull request #14904 from ssahani/dhcp-server-force-renew
  5bb67b107f Merge pull request #14956 from ssahani/delegated-prefix-14474
  dfb3303b6c Merge pull request #15010 from cgzones/selinux_reload_cache_enforce
  abaaa79b22 test: add a test case for migrating DynamicUser=yes to no
  578dc69f2a execute: Fix migration from DynamicUser=yes to no
  5b058473fe man: Add documentation for generator path environment variables
  96b10a13f2 test: Add test for setting generator paths via environment
  39f7d10c24 path-lookup: Allow setting generator paths via environment
  2909f4dd28 path-lookup: Split out helper to get paths from environment
  cccf570355 core: Move environment generator path lookup into path-lookup.c
  257188f80c selinux: cache enforced status and treat retrieve failure as enforced mode
  61f3e897f1 selinux: add trigger for policy reload to refresh internal selabel cache
  f6c6af3811 test-network: add a test case for CAKE
  ad8352f4ff network: tc: introduce cake
  aa550d2a51 sd-netlink: introduce sd_netlink_message_append_s8() and friends
  f2c5c1296a test-network: add a test case for sfb
  982998b087 network: TC introduce sfb - Stochastic Fair Blue
  95edcf3fac test-network: add a test case for GRED
  609e8340bb network: TC introduce GRED, Generic Random Early Detection
  bc0769c9f7 test-network: add a test case for PFIFO
  a74760653c network: TC introduce PFIFO
  f1de1eb3e3 test-network: add test case for HTB class
  19f86a6351 network: tc: support HTB class
  4666f63bb8 network: introduce struct TClass to prepare for supporting tc class
  0ebb76de8b sd-netlink: introduce sd_rtnl_message_new_tclass() and friends
  34658df256 network: introduce TrafficControlKind to prepare for supporting tc class
  931c8c824a test-network: add a test case for HTB
  b934ac3d6e network: tc: support Hierarchy Token Bucket (HTB)
  2a09633117 network: tc: make Parent= take class id
  3c874fd79d test-network: add a test case for [IPv6Prefix] Assign=yes
  a781ddefe5 network: make use of generate_ipv6_eui_64_address
  bd6379ec57 network: introduce IPv6 prefix assign
  34332af2bc network: radv introduce sd_radv_prefix_get_prefix
  5ead535224 network: Introduce method to generate EUI-64 addresses
  3efdd6af2c network: Add support in networkctl for DHCP server forcerenew
  4e58741d55 Canonicalise names in DNS responses per RFC4034 requirements
  19be3da991 Remove dnssec_canonicalize function which is no longer used
  a32c7a4615 network: Add policy in polkit DHCP server forcenenew
  90867f6a3a network: introduce bus method forcerenew for DHCP server
  4ef0ac8f50 test: fix some failures in test-cgroup
  c5673ed0de log: add support for prefixing console log messages with current timestamp
  2526af6ddd man: remove the '=' from --log-color and --log-location as they are optional arg
  3d5f01383d man: sort log parameters in alphabetical order

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

systemd: musl fixup
---

 ...temd-boot_245.6.bb => systemd-boot_246.bb} |   0
 ...temd-conf_245.6.bb => systemd-conf_246.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 .../systemd/0001-Handle-missing-gshadow.patch |  73 ++++---
 ...tall-dependency-links-at-install-tim.patch |  34 +--
 ...-not-disable-buffer-in-writing-files.patch | 198 +++++++++---------
 ...002-don-t-use-glibc-specific-qsort_r.patch |  40 ++--
 ...k-parse_printf_format-implementation.patch |  52 +++--
 ...missing.h-check-for-missing-strndupa.patch | 175 +++++++++-------
 .../0006-Include-netinet-if_ether.h.patch     | 166 +++++++--------
 ...LOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch |  32 +--
 ..._register_atfork-for-non-glibc-build.patch |  10 +-
 ...11-Use-uintmax_t-for-handling-rlim_t.patch |  30 +--
 ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  26 +--
 ...patible-basename-for-non-glibc-syste.patch |  10 +-
 ...uffering-when-writing-to-oom_score_a.patch |  10 +-
 ...compliant-strerror_r-from-GNU-specif.patch |  20 +-
 .../systemd/0021-Handle-missing-LOCK_EX.patch |  23 ++
 ...ible-pointer-type-struct-sockaddr_un.patch |  37 ++++
 ...ader_entry_one_shot_stat-has-incompl.patch |  31 +++
 .../systemd/systemd/CVE-2020-13776.patch      |  96 ---------
 .../{systemd_245.6.bb => systemd_246.bb}      |   5 +-
 22 files changed, 539 insertions(+), 533 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_245.6.bb => systemd-boot_246.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_245.6.bb => systemd-conf_246.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0021-Handle-missing-LOCK_EX.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
 rename meta/recipes-core/systemd/{systemd_245.6.bb => systemd_246.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_245.6.bb b/meta/recipes-core/systemd/systemd-boot_246.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_245.6.bb
rename to meta/recipes-core/systemd/systemd-boot_246.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_245.6.bb b/meta/recipes-core/systemd/systemd-conf_246.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_245.6.bb
rename to meta/recipes-core/systemd/systemd-conf_246.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 8c758ab556..8ce78efbbd 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "aa0cb635f1f6a4d9b50ed2cca7782f3f751be933"
-SRCBRANCH = "v245-stable"
+SRCREV = "5c68ad14af6c89261f31f0abb4850fb1c99e8cfd"
+SRCBRANCH = "v246-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
index 26a597d45b..723cd2e52e 100644
--- a/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
@@ -14,10 +14,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/shared/userdb.c           |  6 ++++++
  3 files changed, 30 insertions(+)
 
-diff --git a/src/shared/group-record-nss.c b/src/shared/group-record-nss.c
-index 77924f1c4067..c64490253ff3 100644
---- a/src/shared/group-record-nss.c
-+++ b/src/shared/group-record-nss.c
+Index: systemd-stable/src/shared/group-record-nss.c
+===================================================================
+--- systemd-stable.orig/src/shared/group-record-nss.c
++++ systemd-stable/src/shared/group-record-nss.c
 @@ -19,8 +19,10 @@ int nss_group_to_group_record(
          if (isempty(grp->gr_name))
                  return -EINVAL;
@@ -45,7 +45,7 @@ index 77924f1c4067..c64490253ff3 100644
  
          r = json_build(&g->json, JSON_BUILD_OBJECT(
                                         JSON_BUILD_PAIR("groupName", JSON_BUILD_STRING(g->group_name)),
-@@ -76,6 +80,7 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
+@@ -76,6 +80,7 @@ int nss_sgrp_for_group(const struct grou
          assert(ret_sgrp);
          assert(ret_buffer);
  
@@ -53,7 +53,7 @@ index 77924f1c4067..c64490253ff3 100644
          for (;;) {
                  _cleanup_free_ char *buf = NULL;
                  struct sgrp sgrp, *result;
-@@ -104,6 +109,9 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
+@@ -104,6 +109,9 @@ int nss_sgrp_for_group(const struct grou
                  buflen *= 2;
                  buf = mfree(buf);
          }
@@ -62,67 +62,67 @@ index 77924f1c4067..c64490253ff3 100644
 +#endif
  }
  
- int nss_group_record_by_name(const char *name, GroupRecord **ret) {
-@@ -111,7 +119,9 @@ int nss_group_record_by_name(const char *name, GroupRecord **ret) {
+ int nss_group_record_by_name(
+@@ -115,7 +123,9 @@ int nss_group_record_by_name(
          struct group grp, *result;
          bool incomplete = false;
          size_t buflen = 4096;
 +#if ENABLE_GSHADOW
-         struct sgrp sgrp;
+         struct sgrp sgrp, *sresult = NULL;
 +#endif
          int r;
  
          assert(name);
-@@ -141,6 +151,7 @@ int nss_group_record_by_name(const char *name, GroupRecord **ret) {
+@@ -145,6 +155,7 @@ int nss_group_record_by_name(
                  buf = mfree(buf);
          }
  
 +#if ENABLE_GSHADOW
-         r = nss_sgrp_for_group(result, &sgrp, &sbuf);
-         if (r < 0) {
-                 log_debug_errno(r, "Failed to do shadow lookup for group %s, ignoring: %m", result->gr_name);
-@@ -148,6 +159,9 @@ int nss_group_record_by_name(const char *name, GroupRecord **ret) {
-         }
+         if (with_shadow) {
+                 r = nss_sgrp_for_group(result, &sgrp, &sbuf);
+                 if (r < 0) {
+@@ -156,6 +167,9 @@ int nss_group_record_by_name(
+                 incomplete = true;
  
-         r = nss_group_to_group_record(result, r >= 0 ? &sgrp : NULL, ret);
+         r = nss_group_to_group_record(result, sresult, ret);
 +#else
 +        r = nss_group_to_group_record(result, NULL, ret);
 +#endif
          if (r < 0)
                  return r;
  
-@@ -160,7 +174,9 @@ int nss_group_record_by_gid(gid_t gid, GroupRecord **ret) {
+@@ -172,7 +186,9 @@ int nss_group_record_by_gid(
          struct group grp, *result;
          bool incomplete = false;
          size_t buflen = 4096;
 +#if ENABLE_GSHADOW
-         struct sgrp sgrp;
+         struct sgrp sgrp, *sresult = NULL;
 +#endif
          int r;
  
          assert(ret);
-@@ -188,6 +204,7 @@ int nss_group_record_by_gid(gid_t gid, GroupRecord **ret) {
+@@ -200,6 +216,7 @@ int nss_group_record_by_gid(
                  buf = mfree(buf);
          }
  
 +#if ENABLE_GSHADOW
-         r = nss_sgrp_for_group(result, &sgrp, &sbuf);
-         if (r < 0) {
-                 log_debug_errno(r, "Failed to do shadow lookup for group %s, ignoring: %m", result->gr_name);
-@@ -195,6 +212,9 @@ int nss_group_record_by_gid(gid_t gid, GroupRecord **ret) {
-         }
+         if (with_shadow) {
+                 r = nss_sgrp_for_group(result, &sgrp, &sbuf);
+                 if (r < 0) {
+@@ -211,6 +228,9 @@ int nss_group_record_by_gid(
+                 incomplete = true;
  
-         r = nss_group_to_group_record(result, r >= 0 ? &sgrp : NULL, ret);
+         r = nss_group_to_group_record(result, sresult, ret);
 +#else
 +        r = nss_group_to_group_record(result, NULL, ret);
 +#endif
          if (r < 0)
                  return r;
  
-diff --git a/src/shared/group-record-nss.h b/src/shared/group-record-nss.h
-index 38b2995178ff..d7d95c44cf11 100644
---- a/src/shared/group-record-nss.h
-+++ b/src/shared/group-record-nss.h
+Index: systemd-stable/src/shared/group-record-nss.h
+===================================================================
+--- systemd-stable.orig/src/shared/group-record-nss.h
++++ systemd-stable/src/shared/group-record-nss.h
 @@ -2,7 +2,11 @@
  #pragma once
  
@@ -135,11 +135,11 @@ index 38b2995178ff..d7d95c44cf11 100644
  
  #include "group-record.h"
  
-diff --git a/src/shared/userdb.c b/src/shared/userdb.c
-index 92f8796768d7..5d912862f85c 100644
---- a/src/shared/userdb.c
-+++ b/src/shared/userdb.c
-@@ -924,13 +924,16 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+Index: systemd-stable/src/shared/userdb.c
+===================================================================
+--- systemd-stable.orig/src/shared/userdb.c
++++ systemd-stable/src/shared/userdb.c
+@@ -930,13 +930,16 @@ int groupdb_iterator_get(UserDBIterator
                  if (gr) {
                          _cleanup_free_ char *buffer = NULL;
                          bool incomplete = false;
@@ -156,7 +156,7 @@ index 92f8796768d7..5d912862f85c 100644
                          r = nss_sgrp_for_group(gr, &sgrp, &buffer);
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to acquire shadow entry for group %s, ignoring: %m", gr->gr_name);
-@@ -938,6 +941,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+@@ -944,6 +947,9 @@ int groupdb_iterator_get(UserDBIterator
                          }
  
                          r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
@@ -166,6 +166,3 @@ index 92f8796768d7..5d912862f85c 100644
                          if (r < 0)
                                  return r;
  
--- 
-2.17.1
-
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 26f70b35d0..2676c144f2 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -25,21 +25,21 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  units/systemd-binfmt.service.in         | 4 ++++
  3 files changed, 9 insertions(+), 4 deletions(-)
 
-diff --git a/units/meson.build b/units/meson.build
-index ea91f0cc9ea7..25186f88dfeb 100644
---- a/units/meson.build
-+++ b/units/meson.build
-@@ -52,8 +52,7 @@ units = [
+Index: systemd-stable/units/meson.build
+===================================================================
+--- systemd-stable.orig/units/meson.build
++++ systemd-stable/units/meson.build
+@@ -54,8 +54,7 @@ units = [
          ['poweroff.target',                     '',
-          'runlevel0.target'],
+          (with_runlevels ? 'runlevel0.target' : '')],
          ['printer.target',                      ''],
 -        ['proc-sys-fs-binfmt_misc.automount',   'ENABLE_BINFMT',
 -         'sysinit.target.wants/'],
 +        ['proc-sys-fs-binfmt_misc.automount',   'ENABLE_BINFMT'],
          ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
          ['reboot.target',                       '',
-          'runlevel6.target ctrl-alt-del.target'],
-@@ -161,8 +160,7 @@ in_units = [
+          (with_runlevels ? 'runlevel6.target ctrl-alt-del.target' : 'ctrl-alt-del.target')],
+@@ -162,8 +161,7 @@ in_units = [
          ['rc-local.service',                     'HAVE_SYSV_COMPAT'],
          ['rescue.service',                       ''],
          ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
@@ -49,10 +49,10 @@ index ea91f0cc9ea7..25186f88dfeb 100644
          ['systemd-bless-boot.service',           'ENABLE_EFI HAVE_BLKID'],
          ['systemd-boot-check-no-failures.service', ''],
          ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
-diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
-index 30a6bc991844..4231f3b70fe9 100644
---- a/units/proc-sys-fs-binfmt_misc.automount
-+++ b/units/proc-sys-fs-binfmt_misc.automount
+Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount
+===================================================================
+--- systemd-stable.orig/units/proc-sys-fs-binfmt_misc.automount
++++ systemd-stable/units/proc-sys-fs-binfmt_misc.automount
 @@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
  
  [Automount]
@@ -60,11 +60,11 @@ index 30a6bc991844..4231f3b70fe9 100644
 +
 +[Install]
 +WantedBy=sysinit.target
-diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index e54e95e11d5d..372a598614d3 100644
---- a/units/systemd-binfmt.service.in
-+++ b/units/systemd-binfmt.service.in
-@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
+Index: systemd-stable/units/systemd-binfmt.service.in
+===================================================================
+--- systemd-stable.orig/units/systemd-binfmt.service.in
++++ systemd-stable/units/systemd-binfmt.service.in
+@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc
  Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
  DefaultDependencies=no
  Conflicts=shutdown.target
diff --git a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
index 4eeec7b7da..39a975319b 100644
--- a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
@@ -40,11 +40,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/vconsole/vconsole-setup.c           |  2 +-
  18 files changed, 35 insertions(+), 35 deletions(-)
 
-diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index a5141f4cbedd..04c06e7a55cb 100644
---- a/src/basic/cgroup-util.c
-+++ b/src/basic/cgroup-util.c
-@@ -739,7 +739,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+Index: systemd-stable/src/basic/cgroup-util.c
+===================================================================
+--- systemd-stable.orig/src/basic/cgroup-util.c
++++ systemd-stable/src/basic/cgroup-util.c
+@@ -769,7 +769,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (isempty(sc)) {
@@ -53,7 +53,7 @@ index a5141f4cbedd..04c06e7a55cb 100644
                  if (r < 0)
                          return r;
          } else if (!path_equal(sc, agent))
-@@ -757,7 +757,7 @@ int cg_install_release_agent(const char *controller, const char *agent) {
+@@ -787,7 +787,7 @@ int cg_install_release_agent(const char
  
          sc = strstrip(contents);
          if (streq(sc, "0")) {
@@ -62,7 +62,7 @@ index a5141f4cbedd..04c06e7a55cb 100644
                  if (r < 0)
                          return r;
  
-@@ -784,7 +784,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -814,7 +814,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -71,7 +71,7 @@ index a5141f4cbedd..04c06e7a55cb 100644
          if (r < 0)
                  return r;
  
-@@ -794,7 +794,7 @@ int cg_uninstall_release_agent(const char *controller) {
+@@ -824,7 +824,7 @@ int cg_uninstall_release_agent(const cha
          if (r < 0)
                  return r;
  
@@ -80,7 +80,7 @@ index a5141f4cbedd..04c06e7a55cb 100644
          if (r < 0)
                  return r;
  
-@@ -1650,7 +1650,7 @@ int cg_set_attribute(const char *controller, const char *path, const char *attri
+@@ -1656,7 +1656,7 @@ int cg_set_attribute(const char *control
          if (r < 0)
                  return r;
  
@@ -89,11 +89,11 @@ index a5141f4cbedd..04c06e7a55cb 100644
  }
  
  int cg_get_attribute(const char *controller, const char *path, const char *attribute, char **ret) {
-diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index da7e836f143e..2138f20bcc03 100644
---- a/src/basic/procfs-util.c
-+++ b/src/basic/procfs-util.c
-@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limit) {
+Index: systemd-stable/src/basic/procfs-util.c
+===================================================================
+--- systemd-stable.orig/src/basic/procfs-util.c
++++ systemd-stable/src/basic/procfs-util.c
+@@ -86,13 +86,13 @@ int procfs_tasks_set_limit(uint64_t limi
           * decrease it, as threads-max is the much more relevant sysctl. */
          if (limit > pid_max-1) {
                  sprintf(buffer, "%" PRIu64, limit+1); /* Add one, since PID 0 is not a valid PID */
@@ -109,11 +109,11 @@ index da7e836f143e..2138f20bcc03 100644
          if (r < 0) {
                  uint64_t threads_max;
  
-diff --git a/src/basic/smack-util.c b/src/basic/smack-util.c
-index da9a2139d31a..5e91f5b8f5d9 100644
---- a/src/basic/smack-util.c
-+++ b/src/basic/smack-util.c
-@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label) {
+Index: systemd-stable/src/basic/smack-util.c
+===================================================================
+--- systemd-stable.orig/src/basic/smack-util.c
++++ systemd-stable/src/basic/smack-util.c
+@@ -114,7 +114,7 @@ int mac_smack_apply_pid(pid_t pid, const
                  return 0;
  
          p = procfs_file_alloca(pid, "attr/current");
@@ -122,10 +122,10 @@ index da9a2139d31a..5e91f5b8f5d9 100644
          if (r < 0)
                  return r;
  
-diff --git a/src/basic/util.c b/src/basic/util.c
-index 2b3b3918a32f..aff8d0fcd473 100644
---- a/src/basic/util.c
-+++ b/src/basic/util.c
+Index: systemd-stable/src/basic/util.c
+===================================================================
+--- systemd-stable.orig/src/basic/util.c
++++ systemd-stable/src/basic/util.c
 @@ -267,7 +267,7 @@ void disable_coredumps(void) {
          if (detect_container() > 0)
                  return;
@@ -135,11 +135,11 @@ index 2b3b3918a32f..aff8d0fcd473 100644
          if (r < 0)
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
-diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index 7ff844c78c3a..5c5721d7c2f7 100644
---- a/src/binfmt/binfmt.c
-+++ b/src/binfmt/binfmt.c
-@@ -47,7 +47,7 @@ static int delete_rule(const char *rule) {
+Index: systemd-stable/src/binfmt/binfmt.c
+===================================================================
+--- systemd-stable.orig/src/binfmt/binfmt.c
++++ systemd-stable/src/binfmt/binfmt.c
+@@ -48,7 +48,7 @@ static int delete_rule(const char *rule)
          if (!fn)
                  return log_oom();
  
@@ -148,7 +148,7 @@ index 7ff844c78c3a..5c5721d7c2f7 100644
  }
  
  static int apply_rule(const char *rule) {
-@@ -55,7 +55,7 @@ static int apply_rule(const char *rule) {
+@@ -56,7 +56,7 @@ static int apply_rule(const char *rule)
  
          (void) delete_rule(rule);
  
@@ -157,7 +157,7 @@ index 7ff844c78c3a..5c5721d7c2f7 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to add binary format: %m");
  
-@@ -212,7 +212,7 @@ static int run(int argc, char *argv[]) {
+@@ -223,7 +223,7 @@ static int run(int argc, char *argv[]) {
                  }
  
                  /* Flush out all rules */
@@ -166,11 +166,11 @@ index 7ff844c78c3a..5c5721d7c2f7 100644
  
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
-diff --git a/src/core/main.c b/src/core/main.c
-index 3c6b66e89c8e..c39ebe56a5b3 100644
---- a/src/core/main.c
-+++ b/src/core/main.c
-@@ -1312,7 +1312,7 @@ static int bump_unix_max_dgram_qlen(void) {
+Index: systemd-stable/src/core/main.c
+===================================================================
+--- systemd-stable.orig/src/core/main.c
++++ systemd-stable/src/core/main.c
+@@ -1382,7 +1382,7 @@ static int bump_unix_max_dgram_qlen(void
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -179,7 +179,7 @@ index 3c6b66e89c8e..c39ebe56a5b3 100644
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
                                        "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1536,7 +1536,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1668,7 +1668,7 @@ static void initialize_core_pattern(bool
          if (getpid_cached() != 1)
                  return;
  
@@ -188,11 +188,11 @@ index 3c6b66e89c8e..c39ebe56a5b3 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to write '%s' to /proc/sys/kernel/core_pattern, ignoring: %m", arg_early_core_pattern);
  }
-diff --git a/src/core/smack-setup.c b/src/core/smack-setup.c
-index 4427397f2715..8aeb5c829513 100644
---- a/src/core/smack-setup.c
-+++ b/src/core/smack-setup.c
-@@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy) {
+Index: systemd-stable/src/core/smack-setup.c
+===================================================================
+--- systemd-stable.orig/src/core/smack-setup.c
++++ systemd-stable/src/core/smack-setup.c
+@@ -325,17 +325,17 @@ int mac_smack_setup(bool *loaded_policy)
          }
  
  #ifdef SMACK_RUN_LABEL
@@ -214,10 +214,10 @@ index 4427397f2715..8aeb5c829513 100644
          if (r < 0)
                  log_warning_errno(r, "Failed to set SMACK netlabel rule \"127.0.0.1 -CIPSO\": %m");
  #endif
-diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-resume/hibernate-resume.c
-index 17e7cd1a009b..87a766771663 100644
---- a/src/hibernate-resume/hibernate-resume.c
-+++ b/src/hibernate-resume/hibernate-resume.c
+Index: systemd-stable/src/hibernate-resume/hibernate-resume.c
+===================================================================
+--- systemd-stable.orig/src/hibernate-resume/hibernate-resume.c
++++ systemd-stable/src/hibernate-resume/hibernate-resume.c
 @@ -45,7 +45,7 @@ int main(int argc, char *argv[]) {
                  return EXIT_FAILURE;
          }
@@ -227,11 +227,11 @@ index 17e7cd1a009b..87a766771663 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
-diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index 1f2451f8e1b4..3f676ec2841a 100644
---- a/src/libsystemd/sd-device/sd-device.c
-+++ b/src/libsystemd/sd-device/sd-device.c
-@@ -1849,7 +1849,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
+Index: systemd-stable/src/libsystemd/sd-device/sd-device.c
+===================================================================
+--- systemd-stable.orig/src/libsystemd/sd-device/sd-device.c
++++ systemd-stable/src/libsystemd/sd-device/sd-device.c
+@@ -1877,7 +1877,7 @@ _public_ int sd_device_set_sysattr_value
          if (!value)
                  return -ENOMEM;
  
@@ -240,11 +240,11 @@ index 1f2451f8e1b4..3f676ec2841a 100644
          if (r < 0) {
                  if (r == -ELOOP)
                          return -EINVAL;
-diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
-index 52a7ea3c77e9..9703de0dabee 100644
---- a/src/login/logind-dbus.c
-+++ b/src/login/logind-dbus.c
-@@ -1339,7 +1339,7 @@ static int trigger_device(Manager *m, sd_device *d) {
+Index: systemd-stable/src/login/logind-dbus.c
+===================================================================
+--- systemd-stable.orig/src/login/logind-dbus.c
++++ systemd-stable/src/login/logind-dbus.c
+@@ -1341,7 +1341,7 @@ static int trigger_device(Manager *m, sd
                  if (!t)
                          return -ENOMEM;
  
@@ -253,11 +253,11 @@ index 52a7ea3c77e9..9703de0dabee 100644
          }
  
          return 0;
-diff --git a/src/nspawn/nspawn-cgroup.c b/src/nspawn/nspawn-cgroup.c
-index f5048d9473cb..b6383ab5c97e 100644
---- a/src/nspawn/nspawn-cgroup.c
-+++ b/src/nspawn/nspawn-cgroup.c
-@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified unified_requested, uid_t uid_shift) {
+Index: systemd-stable/src/nspawn/nspawn-cgroup.c
+===================================================================
+--- systemd-stable.orig/src/nspawn/nspawn-cgroup.c
++++ systemd-stable/src/nspawn/nspawn-cgroup.c
+@@ -124,7 +124,7 @@ int sync_cgroup(pid_t pid, CGroupUnified
          fn = strjoina(tree, cgroup, "/cgroup.procs");
  
          sprintf(pid_string, PID_FMT, pid);
@@ -266,11 +266,11 @@ index f5048d9473cb..b6383ab5c97e 100644
          if (r < 0) {
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
-diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 734dee1130e0..71add9a055d2 100644
---- a/src/nspawn/nspawn.c
-+++ b/src/nspawn/nspawn.c
-@@ -2440,7 +2440,7 @@ static int reset_audit_loginuid(void) {
+Index: systemd-stable/src/nspawn/nspawn.c
+===================================================================
+--- systemd-stable.orig/src/nspawn/nspawn.c
++++ systemd-stable/src/nspawn/nspawn.c
+@@ -2493,7 +2493,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -279,7 +279,7 @@ index 734dee1130e0..71add9a055d2 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -3665,13 +3665,13 @@ static int setup_uid_map(pid_t pid) {
+@@ -3726,13 +3726,13 @@ static int setup_uid_map(pid_t pid) {
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
          xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
@@ -295,11 +295,11 @@ index 734dee1130e0..71add9a055d2 100644
          if (r < 0)
                  return log_error_errno(r, "Failed to write GID map: %m");
  
-diff --git a/src/shared/cgroup-setup.c b/src/shared/cgroup-setup.c
-index e8398cbde5ba..ba682ec0c9e7 100644
---- a/src/shared/cgroup-setup.c
-+++ b/src/shared/cgroup-setup.c
-@@ -267,7 +267,7 @@ int cg_attach(const char *controller, const char *path, pid_t pid) {
+Index: systemd-stable/src/shared/cgroup-setup.c
+===================================================================
+--- systemd-stable.orig/src/shared/cgroup-setup.c
++++ systemd-stable/src/shared/cgroup-setup.c
+@@ -267,7 +267,7 @@ int cg_attach(const char *controller, co
  
          xsprintf(c, PID_FMT "\n", pid);
  
@@ -317,11 +317,11 @@ index e8398cbde5ba..ba682ec0c9e7 100644
                          if (r < 0) {
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
-diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.c
-index 8543dbd2d05f..76162599817e 100644
---- a/src/shared/sysctl-util.c
-+++ b/src/shared/sysctl-util.c
-@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
+Index: systemd-stable/src/shared/sysctl-util.c
+===================================================================
+--- systemd-stable.orig/src/shared/sysctl-util.c
++++ systemd-stable/src/shared/sysctl-util.c
+@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, con
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -330,11 +330,11 @@ index 8543dbd2d05f..76162599817e 100644
  }
  
  int sysctl_read(const char *property, char **content) {
-diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index fbfddc0262fc..7cc2902154e9 100644
---- a/src/sleep/sleep.c
-+++ b/src/sleep/sleep.c
-@@ -47,7 +47,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+Index: systemd-stable/src/sleep/sleep.c
+===================================================================
+--- systemd-stable.orig/src/sleep/sleep.c
++++ systemd-stable/src/sleep/sleep.c
+@@ -48,7 +48,7 @@ static int write_hibernate_location_info
          assert(hibernate_location->swap);
  
          xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
@@ -343,7 +343,7 @@ index fbfddc0262fc..7cc2902154e9 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
                                         hibernate_location->swap->device, resume_str);
-@@ -74,7 +74,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+@@ -75,7 +75,7 @@ static int write_hibernate_location_info
          }
  
          xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
@@ -352,7 +352,7 @@ index fbfddc0262fc..7cc2902154e9 100644
          if (r < 0)
                  return log_debug_errno(r, "Failed to write swap file offset to /sys/power/resume_offset for '%s': '%s': %m",
                                         hibernate_location->swap->device, offset_str);
-@@ -91,7 +91,7 @@ static int write_mode(char **modes) {
+@@ -92,7 +92,7 @@ static int write_mode(char **modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
  
@@ -361,7 +361,7 @@ index fbfddc0262fc..7cc2902154e9 100644
                  if (k >= 0)
                          return 0;
  
-@@ -110,7 +110,7 @@ static int write_state(FILE **f, char **states) {
+@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -370,11 +370,11 @@ index fbfddc0262fc..7cc2902154e9 100644
                  if (k >= 0)
                          return 0;
                  log_debug_errno(k, "Failed to write '%s' to /sys/power/state: %m", *state);
-diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
-index 60c68b5029cf..fdca03d3d42c 100644
---- a/src/udev/udevadm-trigger.c
-+++ b/src/udev/udevadm-trigger.c
-@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerator *e, const char *action, Set *settle_se
+Index: systemd-stable/src/udev/udevadm-trigger.c
+===================================================================
+--- systemd-stable.orig/src/udev/udevadm-trigger.c
++++ systemd-stable/src/udev/udevadm-trigger.c
+@@ -43,7 +43,7 @@ static int exec_list(sd_device_enumerato
                  if (!filename)
                          return log_oom();
  
@@ -383,11 +383,11 @@ index 60c68b5029cf..fdca03d3d42c 100644
                  if (r < 0) {
                          bool ignore = IN_SET(r, -ENOENT, -EACCES, -ENODEV, -EROFS);
  
-diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index ca65474f2763..38780681431a 100644
---- a/src/udev/udevd.c
-+++ b/src/udev/udevd.c
-@@ -1089,7 +1089,7 @@ static int synthesize_change_one(sd_device *dev, const char *syspath) {
+Index: systemd-stable/src/udev/udevd.c
+===================================================================
+--- systemd-stable.orig/src/udev/udevd.c
++++ systemd-stable/src/udev/udevd.c
+@@ -1153,7 +1153,7 @@ static int synthesize_change_one(sd_devi
  
          filename = strjoina(syspath, "/uevent");
          log_device_debug(dev, "device is closed, synthesising 'change' on %s", syspath);
@@ -396,11 +396,11 @@ index ca65474f2763..38780681431a 100644
          if (r < 0)
                  return log_device_debug_errno(dev, r, "Failed to write 'change' to %s: %m", filename);
          return 0;
-diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
-index 9d706085fb47..30dcfa86f4d0 100644
---- a/src/vconsole/vconsole-setup.c
-+++ b/src/vconsole/vconsole-setup.c
-@@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *name, int fd, bool utf8) {
+Index: systemd-stable/src/vconsole/vconsole-setup.c
+===================================================================
+--- systemd-stable.orig/src/vconsole/vconsole-setup.c
++++ systemd-stable/src/vconsole/vconsole-setup.c
+@@ -116,7 +116,7 @@ static int toggle_utf8_vc(const char *na
  static int toggle_utf8_sysfs(bool utf8) {
          int r;
  
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index a5e41bfabf..30fe9a14df 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -17,13 +17,13 @@ Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
  src/shared/format-table.c          | 36 ++++++++++++++++++++----------
  3 files changed, 38 insertions(+), 31 deletions(-)
 
-diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index e029f8646eb0..27d68b341cf3 100644
---- a/src/basic/sort-util.h
-+++ b/src/basic/sort-util.h
-@@ -54,17 +54,3 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, __compar_fn
+Index: systemd-stable/src/basic/sort-util.h
+===================================================================
+--- systemd-stable.orig/src/basic/sort-util.h
++++ systemd-stable/src/basic/sort-util.h
+@@ -54,17 +54,3 @@ static inline void _qsort_safe(void *bas
                  int (*_func_)(const typeof(p[0])*, const typeof(p[0])*) = func; \
-                 qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
+                 _qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
          })
 -
 -static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, __compar_d_fn_t compar, void *userdata) {
@@ -39,11 +39,11 @@ index e029f8646eb0..27d68b341cf3 100644
 -                int (*_func_)(const typeof(p[0])*, const typeof(p[0])*, typeof(userdata)) = func; \
 -                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
 -        })
-diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libsystemd/sd-hwdb/hwdb-util.c
-index d790e8fd0b19..42e0fd7c9b3c 100644
---- a/src/libsystemd/sd-hwdb/hwdb-util.c
-+++ b/src/libsystemd/sd-hwdb/hwdb-util.c
-@@ -128,9 +128,13 @@ static void trie_free(struct trie *trie) {
+Index: systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
+===================================================================
+--- systemd-stable.orig/src/libsystemd/sd-hwdb/hwdb-util.c
++++ systemd-stable/src/libsystemd/sd-hwdb/hwdb-util.c
+@@ -128,9 +128,13 @@ static void trie_free(struct trie *trie)
  
  DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
  
@@ -60,7 +60,7 @@ index d790e8fd0b19..42e0fd7c9b3c 100644
  }
  
  static int trie_node_add_value(struct trie *trie, struct trie_node *node,
-@@ -158,7 +162,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -158,7 +162,10 @@ static int trie_node_add_value(struct tr
                          .value_off = v,
                  };
  
@@ -72,7 +72,7 @@ index d790e8fd0b19..42e0fd7c9b3c 100644
                  if (val) {
                          /* At this point we have 2 identical properties on the same match-string.
                           * Since we process files in order, we just replace the previous value. */
-@@ -184,7 +191,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
+@@ -184,7 +191,9 @@ static int trie_node_add_value(struct tr
                  .line_number = line_number,
          };
          node->values_count++;
@@ -83,11 +83,11 @@ index d790e8fd0b19..42e0fd7c9b3c 100644
          return 0;
  }
  
-diff --git a/src/shared/format-table.c b/src/shared/format-table.c
-index 425013046491..33c1c5a12d43 100644
---- a/src/shared/format-table.c
-+++ b/src/shared/format-table.c
-@@ -1164,31 +1164,33 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
+Index: systemd-stable/src/shared/format-table.c
+===================================================================
+--- systemd-stable.orig/src/shared/format-table.c
++++ systemd-stable/src/shared/format-table.c
+@@ -1246,31 +1246,33 @@ static int cell_data_compare(TableData *
          return CMP(index_a, index_b);
  }
  
@@ -131,7 +131,7 @@ index 425013046491..33c1c5a12d43 100644
          }
  
          /* Order identical lines by the order there were originally added in */
-@@ -1690,7 +1692,12 @@ int table_print(Table *t, FILE *f) {
+@@ -1798,7 +1800,12 @@ int table_print(Table *t, FILE *f) {
                  for (i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -145,7 +145,7 @@ index 425013046491..33c1c5a12d43 100644
          }
  
          if (t->display_map)
-@@ -2236,7 +2243,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
+@@ -2375,7 +2382,12 @@ int table_to_json(Table *t, JsonVariant
                  for (i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index 0dea933270..e65c543614 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -22,11 +22,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.c
  create mode 100644 src/basic/parse-printf-format.h
 
-diff --git a/meson.build b/meson.build
-index fc216d22da24..a25996803d64 100644
---- a/meson.build
-+++ b/meson.build
-@@ -640,6 +640,7 @@ endif
+Index: systemd-stable/meson.build
+===================================================================
+--- systemd-stable.orig/meson.build
++++ systemd-stable/meson.build
+@@ -638,6 +638,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -34,11 +34,11 @@ index fc216d22da24..a25996803d64 100644
                    'sys/auxv.h',
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
-diff --git a/src/basic/meson.build b/src/basic/meson.build
-index ccb22e159505..25c77ea6bc0e 100644
---- a/src/basic/meson.build
-+++ b/src/basic/meson.build
-@@ -313,6 +313,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
+Index: systemd-stable/src/basic/meson.build
+===================================================================
+--- systemd-stable.orig/src/basic/meson.build
++++ systemd-stable/src/basic/meson.build
+@@ -317,6 +317,11 @@ foreach item : [['af',     af_list_txt,
  endforeach
  
  basic_sources += generated_gperf_headers
@@ -50,11 +50,10 @@ index ccb22e159505..25c77ea6bc0e 100644
  basic_gcrypt_sources = files(
          'gcrypt-util.c',
          'gcrypt-util.h')
-diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
-new file mode 100644
-index 000000000000..49437e544540
+Index: systemd-stable/src/basic/parse-printf-format.c
+===================================================================
 --- /dev/null
-+++ b/src/basic/parse-printf-format.c
++++ systemd-stable/src/basic/parse-printf-format.c
 @@ -0,0 +1,273 @@
 +/*-*- Mode: C; c-basic-offset: 8; indent-tabs-mode: nil -*-*/
 +
@@ -329,11 +328,10 @@ index 000000000000..49437e544540
 +
 +        return last;
 +}
-diff --git a/src/basic/parse-printf-format.h b/src/basic/parse-printf-format.h
-new file mode 100644
-index 000000000000..47be7522d7fa
+Index: systemd-stable/src/basic/parse-printf-format.h
+===================================================================
 --- /dev/null
-+++ b/src/basic/parse-printf-format.h
++++ systemd-stable/src/basic/parse-printf-format.h
 @@ -0,0 +1,57 @@
 +/*-*- Mode: C; c-basic-offset: 8; indent-tabs-mode: nil -*-*/
 +
@@ -392,10 +390,10 @@ index 000000000000..47be7522d7fa
 +size_t parse_printf_format(const char *fmt, size_t n, int *types);
 +
 +#endif /* HAVE_PRINTF_H */
-diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
-index c3b9448d4f4f..2937aa13b178 100644
---- a/src/basic/stdio-util.h
-+++ b/src/basic/stdio-util.h
+Index: systemd-stable/src/basic/stdio-util.h
+===================================================================
+--- systemd-stable.orig/src/basic/stdio-util.h
++++ systemd-stable/src/basic/stdio-util.h
 @@ -1,13 +1,13 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  #pragma once
@@ -411,10 +409,10 @@ index c3b9448d4f4f..2937aa13b178 100644
  
  #define snprintf_ok(buf, len, fmt, ...) \
          ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
-diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
-index 912ecef73cce..43ed756bda53 100644
---- a/src/journal/journal-send.c
-+++ b/src/journal/journal-send.c
+Index: systemd-stable/src/journal/journal-send.c
+===================================================================
+--- systemd-stable.orig/src/journal/journal-send.c
++++ systemd-stable/src/journal/journal-send.c
 @@ -2,7 +2,6 @@
  
  #include <errno.h>
@@ -423,7 +421,7 @@ index 912ecef73cce..43ed756bda53 100644
  #include <stddef.h>
  #include <sys/un.h>
  #include <unistd.h>
-@@ -20,6 +19,7 @@
+@@ -21,6 +20,7 @@
  #include "stdio-util.h"
  #include "string-util.h"
  #include "tmpfile-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index ca4f0d5d62..8e7a2fb6e4 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From 85dcaad8f38521ec3dc580794072b601900eed84 Mon Sep 17 00:00:00 2001
+From 7e771de87cf728a8678f1f28f391bba3589e2496 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -25,6 +25,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/basic/missing_stdlib.h                 | 12 ++++++++++++
  src/basic/mkdir.c                          |  1 +
  src/basic/parse-util.c                     |  1 +
+ src/basic/path-lookup.c                    |  1 +
  src/basic/proc-cmdline.c                   |  1 +
  src/basic/procfs-util.c                    |  1 +
  src/basic/selinux-util.c                   |  1 +
@@ -52,6 +53,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/nss-mymachines/nss-mymachines.c        |  1 +
  src/portable/portable.c                    |  1 +
  src/resolve/resolvectl.c                   |  1 +
+ src/shared/bus-get-properties.c            |  1 +
  src/shared/bus-unit-procs.c                |  1 +
  src/shared/bus-unit-util.c                 |  1 +
  src/shared/bus-util.c                      |  1 +
@@ -59,20 +61,19 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/shared/journal-importer.c              |  1 +
  src/shared/logs-show.c                     |  1 +
  src/shared/pager.c                         |  1 +
- src/shared/path-lookup.c                   |  1 +
  src/shared/uid-range.c                     |  1 +
  src/socket-proxy/socket-proxyd.c           |  1 +
  src/test/test-hexdecoct.c                  |  1 +
  src/udev/udev-builtin-path_id.c            |  1 +
  src/udev/udev-event.c                      |  1 +
  src/udev/udev-rules.c                      |  1 +
- 49 files changed, 60 insertions(+)
+ 50 files changed, 61 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index a25996803d64..72b305b5ab58 100644
+index 9187439bdd..bea9935a91 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -529,6 +529,7 @@ foreach ident : [
+@@ -527,6 +527,7 @@ foreach ident : [
                                   #include <unistd.h>
                                   #include <signal.h>
                                   #include <sys/wait.h>'''],
@@ -81,7 +82,7 @@ index a25996803d64..72b305b5ab58 100644
  
          have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
 diff --git a/src/backlight/backlight.c b/src/backlight/backlight.c
-index 048441429025..01d74ea0ed4e 100644
+index 3a644363e1..73946a829b 100644
 --- a/src/backlight/backlight.c
 +++ b/src/backlight/backlight.c
 @@ -17,6 +17,7 @@
@@ -93,19 +94,19 @@ index 048441429025..01d74ea0ed4e 100644
  static int find_pci_or_platform_parent(sd_device *device, sd_device **ret) {
          const char *subsystem, *sysname, *value;
 diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
-index 54fc6ecf8b20..a5141f4cbedd 100644
+index e94fcfad02..856a7068b0 100644
 --- a/src/basic/cgroup-util.c
 +++ b/src/basic/cgroup-util.c
-@@ -37,6 +37,7 @@
- #include "strv.h"
+@@ -38,6 +38,7 @@
  #include "unit-name.h"
  #include "user-util.h"
+ #include "xattr-util.h"
 +#include "missing_stdlib.h"
  
  static int cg_enumerate_items(const char *controller, const char *path, FILE **_f, const char *item) {
          _cleanup_free_ char *fs = NULL;
 diff --git a/src/basic/env-util.c b/src/basic/env-util.c
-index b8dc98915f81..5049b37594bc 100644
+index b8dc98915f..5049b37594 100644
 --- a/src/basic/env-util.c
 +++ b/src/basic/env-util.c
 @@ -15,6 +15,7 @@
@@ -117,10 +118,10 @@ index b8dc98915f81..5049b37594bc 100644
  #define VALID_CHARS_ENV_NAME                    \
          DIGITS LETTERS                          \
 diff --git a/src/basic/log.c b/src/basic/log.c
-index 17557e1844b2..6cec4d324aab 100644
+index c6fe203808..b7ef932d28 100644
 --- a/src/basic/log.c
 +++ b/src/basic/log.c
-@@ -34,6 +34,7 @@
+@@ -35,6 +35,7 @@
  #include "terminal-util.h"
  #include "time-util.h"
  #include "utf8.h"
@@ -129,7 +130,7 @@ index 17557e1844b2..6cec4d324aab 100644
  #define SNDBUF_SIZE (8*1024*1024)
  
 diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
-index 188a8d44066a..1e16ec287aad 100644
+index 188a8d4406..1e16ec287a 100644
 --- a/src/basic/missing_stdlib.h
 +++ b/src/basic/missing_stdlib.h
 @@ -11,3 +11,15 @@
@@ -149,7 +150,7 @@ index 188a8d44066a..1e16ec287aad 100644
 +  })
 +#endif
 diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
-index fa682d4c438e..37902551490a 100644
+index 6ebc2b95fd..88f4359bab 100644
 --- a/src/basic/mkdir.c
 +++ b/src/basic/mkdir.c
 @@ -13,6 +13,7 @@
@@ -158,22 +159,34 @@ index fa682d4c438e..37902551490a 100644
  #include "user-util.h"
 +#include "missing_stdlib.h"
  
- int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, MkdirFlags flags, mkdir_func_t _mkdir) {
-         struct stat st;
+ int mkdir_safe_internal(
+                 const char *path,
 diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index e0094b0f370a..00da6518124b 100644
+index 44f0438cf4..54b4133343 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
-@@ -18,6 +18,7 @@
- #include "process-util.h"
+@@ -19,6 +19,7 @@
  #include "stat-util.h"
  #include "string-util.h"
+ #include "strv.h"
 +#include "missing_stdlib.h"
  
  int parse_boolean(const char *v) {
          if (!v)
+diff --git a/src/basic/path-lookup.c b/src/basic/path-lookup.c
+index 52968dee34..2f4f7e3dcd 100644
+--- a/src/basic/path-lookup.c
++++ b/src/basic/path-lookup.c
+@@ -15,6 +15,7 @@
+ #include "strv.h"
+ #include "tmpfile-util.h"
+ #include "user-util.h"
++#include "missing_stdlib.h"
+ 
+ int xdg_user_runtime_dir(char **ret, const char *suffix) {
+         const char *e;
 diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index 1af58717c686..c1020f4611d4 100644
+index ba47ca5812..8baf728fde 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -185,7 +198,7 @@ index 1af58717c686..c1020f4611d4 100644
  int proc_cmdline(char **ret) {
          const char *e;
 diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
-index 7aaf95bfced2..da7e836f143e 100644
+index 7aaf95bfce..da7e836f14 100644
 --- a/src/basic/procfs-util.c
 +++ b/src/basic/procfs-util.c
 @@ -11,6 +11,7 @@
@@ -197,10 +210,10 @@ index 7aaf95bfced2..da7e836f143e 100644
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
 diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c
-index 1095cb426cce..806ef4bd97a9 100644
+index c94ee26bd9..14e35b4653 100644
 --- a/src/basic/selinux-util.c
 +++ b/src/basic/selinux-util.c
-@@ -26,6 +26,7 @@
+@@ -27,6 +27,7 @@
  #include "selinux-util.h"
  #include "stdio-util.h"
  #include "time-util.h"
@@ -209,7 +222,7 @@ index 1095cb426cce..806ef4bd97a9 100644
  #if HAVE_SELINUX
  DEFINE_TRIVIAL_CLEANUP_FUNC(context_t, context_free);
 diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index 105584e2e72f..eb0bed47dac3 100644
+index 15cc1b8851..02bb3f01f9 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -26,6 +26,7 @@
@@ -221,7 +234,7 @@ index 105584e2e72f..eb0bed47dac3 100644
  static clockid_t map_clock_id(clockid_t c) {
  
 diff --git a/src/boot/bless-boot.c b/src/boot/bless-boot.c
-index b96e1f927fff..cba979baca3e 100644
+index b96e1f927f..cba979baca 100644
 --- a/src/boot/bless-boot.c
 +++ b/src/boot/bless-boot.c
 @@ -18,6 +18,7 @@
@@ -233,7 +246,7 @@ index b96e1f927fff..cba979baca3e 100644
  static char **arg_path = NULL;
  
 diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-cgroup.c
-index 27dc9e43c3e2..b1a83023600b 100644
+index b7d2e32639..fdbc1df95e 100644
 --- a/src/core/dbus-cgroup.c
 +++ b/src/core/dbus-cgroup.c
 @@ -15,6 +15,7 @@
@@ -245,7 +258,7 @@ index 27dc9e43c3e2..b1a83023600b 100644
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
  
 diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index d8ba3e5d9241..729e13fda64c 100644
+index 50f7ada8ce..5c760ee487 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -41,6 +41,7 @@
@@ -257,7 +270,7 @@ index d8ba3e5d9241..729e13fda64c 100644
  BUS_DEFINE_PROPERTY_GET_ENUM(bus_property_get_exec_output, exec_output, ExecOutput);
  static BUS_DEFINE_PROPERTY_GET_ENUM(property_get_exec_input, exec_input, ExecInput);
 diff --git a/src/core/dbus-util.c b/src/core/dbus-util.c
-index 7862beaacb6d..3b1ea53a5f0d 100644
+index 951450e53d..50d134e9a1 100644
 --- a/src/core/dbus-util.c
 +++ b/src/core/dbus-util.c
 @@ -7,6 +7,7 @@
@@ -269,10 +282,10 @@ index 7862beaacb6d..3b1ea53a5f0d 100644
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
 diff --git a/src/core/execute.c b/src/core/execute.c
-index 89dbf6fbd2c1..9762dc57443c 100644
+index 2a4840a3a9..d3f1e0e0f8 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -88,6 +88,7 @@
+@@ -89,6 +89,7 @@
  #include "unit.h"
  #include "user-util.h"
  #include "utmp-wtmp.h"
@@ -281,7 +294,7 @@ index 89dbf6fbd2c1..9762dc57443c 100644
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
 diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index 09ccd613e32c..f4e64fa283e9 100644
+index 09ccd613e3..f4e64fa283 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
 @@ -11,6 +11,7 @@
@@ -293,7 +306,7 @@ index 09ccd613e32c..f4e64fa283e9 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index 17f27a4abce3..e5dcc532d0ce 100644
+index 00e61945ba..1ecab28354 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -41,6 +41,7 @@
@@ -305,7 +318,7 @@ index 17f27a4abce3..e5dcc532d0ce 100644
  static const UnitActiveState state_translation_table[_SERVICE_STATE_MAX] = {
          [SERVICE_DEAD] = UNIT_INACTIVE,
 diff --git a/src/coredump/coredump-vacuum.c b/src/coredump/coredump-vacuum.c
-index 35885dfb47c4..bb9f0660a6a0 100644
+index 35885dfb47..bb9f0660a6 100644
 --- a/src/coredump/coredump-vacuum.c
 +++ b/src/coredump/coredump-vacuum.c
 @@ -16,6 +16,7 @@
@@ -317,7 +330,7 @@ index 35885dfb47c4..bb9f0660a6a0 100644
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
 diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index 88e42d3a984b..0f08376e5399 100644
+index 77dfdefd64..e21ecbeff8 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
 @@ -22,6 +22,7 @@
@@ -329,7 +342,7 @@ index 88e42d3a984b..0f08376e5399 100644
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index e5feec83bce6..c3aec1e219d7 100644
+index 8d4897b942..15476b3c83 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
 @@ -69,6 +69,7 @@
@@ -341,7 +354,7 @@ index e5feec83bce6..c3aec1e219d7 100644
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
  #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
 diff --git a/src/journal/sd-journal.c b/src/journal/sd-journal.c
-index 3fa98dfda237..e655d77e714a 100644
+index 6fb0abb419..2d94d9938e 100644
 --- a/src/journal/sd-journal.c
 +++ b/src/journal/sd-journal.c
 @@ -40,6 +40,7 @@
@@ -353,7 +366,7 @@ index 3fa98dfda237..e655d77e714a 100644
  #define JOURNAL_FILES_MAX 7168
  
 diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index 73127dfe0253..cc8635dea591 100644
+index 55e35cd902..0ed98f9224 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -21,6 +21,7 @@
@@ -365,7 +378,7 @@ index 73127dfe0253..cc8635dea591 100644
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
 diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index 6d140348ec4c..9126b8801bc5 100644
+index 6abac8822c..c74c9cd7fa 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -13,6 +13,7 @@
@@ -377,7 +390,7 @@ index 6d140348ec4c..9126b8801bc5 100644
  static int node_vtable_get_userdata(
                  sd_bus *bus,
 diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
-index 18d30d010a20..be2ab703f8ed 100644
+index fc7e8e844a..7af4dd2712 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -28,6 +28,7 @@
@@ -389,7 +402,7 @@ index 18d30d010a20..be2ab703f8ed 100644
  #define SNDBUF_SIZE (8*1024*1024)
  
 diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index 7ad03680f48d..b9d2181e4910 100644
+index 9de5e454a6..fe86c93c63 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -41,6 +41,7 @@
@@ -401,7 +414,7 @@ index 7ad03680f48d..b9d2181e4910 100644
  #define log_debug_bus_message(m)                                         \
          do {                                                             \
 diff --git a/src/libsystemd/sd-bus/test-bus-benchmark.c b/src/libsystemd/sd-bus/test-bus-benchmark.c
-index 8de0a859ee94..58044b6ba908 100644
+index 8de0a859ee..58044b6ba9 100644
 --- a/src/libsystemd/sd-bus/test-bus-benchmark.c
 +++ b/src/libsystemd/sd-bus/test-bus-benchmark.c
 @@ -14,6 +14,7 @@
@@ -413,7 +426,7 @@ index 8de0a859ee94..58044b6ba908 100644
  #define MAX_SIZE (2*1024*1024)
  
 diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
-index 30669a9359e5..6544b3722099 100644
+index 233d081300..40a32b9700 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -21,6 +21,7 @@
@@ -425,7 +438,7 @@ index 30669a9359e5..6544b3722099 100644
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
 diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index 84bea21ab7be..49720c7f742e 100644
+index 16f4289585..6c5e438b36 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
 @@ -31,6 +31,7 @@
@@ -437,7 +450,7 @@ index 84bea21ab7be..49720c7f742e 100644
  #include "parse-util.h"
  #include "path-util.h"
 diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index bed1e42697c4..e4847c2beea2 100644
+index bed1e42697..e4847c2bee 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -449,7 +462,7 @@ index bed1e42697c4..e4847c2beea2 100644
  /*
    # .network
 diff --git a/src/nspawn/nspawn-settings.c b/src/nspawn/nspawn-settings.c
-index 5fb5b49bbcc3..785ccc2da307 100644
+index d341fa25aa..91646bc2c2 100644
 --- a/src/nspawn/nspawn-settings.c
 +++ b/src/nspawn/nspawn-settings.c
 @@ -16,6 +16,7 @@
@@ -461,19 +474,19 @@ index 5fb5b49bbcc3..785ccc2da307 100644
  Settings *settings_new(void) {
          Settings *s;
 diff --git a/src/nss-mymachines/nss-mymachines.c b/src/nss-mymachines/nss-mymachines.c
-index 364356da5622..47d4ea44e40f 100644
+index 5db0dcef76..681f8677e4 100644
 --- a/src/nss-mymachines/nss-mymachines.c
 +++ b/src/nss-mymachines/nss-mymachines.c
 @@ -19,6 +19,7 @@
+ #include "nss-util.h"
  #include "signal-util.h"
  #include "string-util.h"
- #include "user-util.h"
 +#include "missing_stdlib.h"
  
  NSS_GETHOSTBYNAME_PROTOTYPES(mymachines);
  NSS_GETPW_PROTOTYPES(mymachines);
 diff --git a/src/portable/portable.c b/src/portable/portable.c
-index e18826ab2685..d9f4b81d8937 100644
+index 3a1367ec2b..f29336cb1e 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
 @@ -31,6 +31,7 @@
@@ -485,10 +498,10 @@ index e18826ab2685..d9f4b81d8937 100644
  static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
  
 diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index f20e8c44b8bc..9f6c4e8f49a7 100644
+index 3072b984e5..c46ae374bf 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
-@@ -33,6 +33,7 @@
+@@ -36,6 +36,7 @@
  #include "strv.h"
  #include "terminal-util.h"
  #include "verbs.h"
@@ -496,8 +509,20 @@ index f20e8c44b8bc..9f6c4e8f49a7 100644
  
  static int arg_family = AF_UNSPEC;
  static int arg_ifindex = 0;
+diff --git a/src/shared/bus-get-properties.c b/src/shared/bus-get-properties.c
+index 8ad4694046..da5082c02a 100644
+--- a/src/shared/bus-get-properties.c
++++ b/src/shared/bus-get-properties.c
+@@ -3,6 +3,7 @@
+ #include "bus-get-properties.h"
+ #include "rlimit-util.h"
+ #include "string-util.h"
++#include "missing_stdlib.h"
+ 
+ int bus_property_get_bool(
+                 sd_bus *bus,
 diff --git a/src/shared/bus-unit-procs.c b/src/shared/bus-unit-procs.c
-index b21fe393265f..af2640005c1d 100644
+index b21fe39326..af2640005c 100644
 --- a/src/shared/bus-unit-procs.c
 +++ b/src/shared/bus-unit-procs.c
 @@ -10,6 +10,7 @@
@@ -509,10 +534,10 @@ index b21fe393265f..af2640005c1d 100644
  struct CGroupInfo {
          char *cgroup_path;
 diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index 28d85944a8a7..4743a84a417e 100644
+index f2652ed9a5..eb019fc89f 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
-@@ -34,6 +34,7 @@
+@@ -39,6 +39,7 @@
  #include "unit-def.h"
  #include "user-util.h"
  #include "utf8.h"
@@ -521,19 +546,19 @@ index 28d85944a8a7..4743a84a417e 100644
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
 diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index 8e6a6e2ce2de..0cbf4b1997df 100644
+index 77c1c62182..5cd31f3c15 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
-@@ -30,6 +30,7 @@
+@@ -22,6 +22,7 @@
+ #include "socket-util.h"
  #include "stdio-util.h"
- #include "strv.h"
- #include "user-util.h"
+ /* #include "string-util.h" */
 +#include "missing_stdlib.h"
  
  static int name_owner_change_callback(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
          sd_event *e = userdata;
 diff --git a/src/shared/dns-domain.c b/src/shared/dns-domain.c
-index b812665315f6..8e68f7f8fc6c 100644
+index b812665315..8e68f7f8fc 100644
 --- a/src/shared/dns-domain.c
 +++ b/src/shared/dns-domain.c
 @@ -23,6 +23,7 @@
@@ -545,7 +570,7 @@ index b812665315f6..8e68f7f8fc6c 100644
  int dns_label_unescape(const char **name, char *dest, size_t sz, DNSLabelFlags flags) {
          const char *n;
 diff --git a/src/shared/journal-importer.c b/src/shared/journal-importer.c
-index 7c4fc7021dec..3fbaf5a63969 100644
+index 7c4fc7021d..3fbaf5a639 100644
 --- a/src/shared/journal-importer.c
 +++ b/src/shared/journal-importer.c
 @@ -14,6 +14,7 @@
@@ -557,19 +582,19 @@ index 7c4fc7021dec..3fbaf5a63969 100644
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
 diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index 2bfd0b60c26b..6a1bb3a0760f 100644
+index 899e894ab7..628854ac9c 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
-@@ -39,6 +39,7 @@
- #include "time-util.h"
+@@ -41,6 +41,7 @@
  #include "utf8.h"
  #include "util.h"
+ #include "web-util.h"
 +#include "missing_stdlib.h"
  
  /* up to three lines (each up to 100 characters) or 300 characters, whichever is less */
  #define PRINT_LINE_THRESHOLD 3
 diff --git a/src/shared/pager.c b/src/shared/pager.c
-index 1fe9db179176..67954b5cab93 100644
+index e03be6d23b..50e3d1f75c 100644
 --- a/src/shared/pager.c
 +++ b/src/shared/pager.c
 @@ -23,6 +23,7 @@
@@ -580,20 +605,8 @@ index 1fe9db179176..67954b5cab93 100644
  
  static pid_t pager_pid = 0;
  
-diff --git a/src/shared/path-lookup.c b/src/shared/path-lookup.c
-index 5b1620974536..0e7cd1c2af12 100644
---- a/src/shared/path-lookup.c
-+++ b/src/shared/path-lookup.c
-@@ -19,6 +19,7 @@
- #include "tmpfile-util.h"
- #include "user-util.h"
- #include "util.h"
-+#include "missing_stdlib.h"
- 
- int xdg_user_runtime_dir(char **ret, const char *suffix) {
-         const char *e;
 diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
-index 7cb7d8a477e9..8e7d7f9e7ca6 100644
+index 7cb7d8a477..8e7d7f9e7c 100644
 --- a/src/shared/uid-range.c
 +++ b/src/shared/uid-range.c
 @@ -9,6 +9,7 @@
@@ -605,7 +618,7 @@ index 7cb7d8a477e9..8e7d7f9e7ca6 100644
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
 diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
-index 2ee6fc2f0a6a..4a9934f9c14d 100644
+index b461aead60..9941695ed9 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -617,7 +630,7 @@ index 2ee6fc2f0a6a..4a9934f9c14d 100644
  #define BUFFER_SIZE (256 * 1024)
  
 diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
-index 52217429b154..70708dedf318 100644
+index 52217429b1..70708dedf3 100644
 --- a/src/test/test-hexdecoct.c
 +++ b/src/test/test-hexdecoct.c
 @@ -6,6 +6,7 @@
@@ -629,7 +642,7 @@ index 52217429b154..70708dedf318 100644
  static void test_hexchar(void) {
          assert_se(hexchar(0xa) == 'a');
 diff --git a/src/udev/udev-builtin-path_id.c b/src/udev/udev-builtin-path_id.c
-index ca38f5608791..9d8cf4d2807b 100644
+index 6c020ac0ed..10723ec46c 100644
 --- a/src/udev/udev-builtin-path_id.c
 +++ b/src/udev/udev-builtin-path_id.c
 @@ -22,6 +22,7 @@
@@ -641,7 +654,7 @@ index ca38f5608791..9d8cf4d2807b 100644
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
 diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index eb51139e519c..977cc16e9d7c 100644
+index e1c2baf7f2..62d4086802 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
 @@ -34,6 +34,7 @@
@@ -653,7 +666,7 @@ index eb51139e519c..977cc16e9d7c 100644
  typedef struct Spawn {
          sd_device *device;
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index b9b350d1ef7a..2c114cc77572 100644
+index c36f032f66..36970813d8 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -30,6 +30,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index 9142d7b45c..abc438e4ba 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -52,10 +52,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/udev/udev-builtin-net_setup_link.c    | 1 +
  19 files changed, 18 insertions(+), 4 deletions(-)
 
-diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index eac2e725cce7..1beae7ba91cc 100644
---- a/src/libsystemd-network/sd-dhcp6-client.c
-+++ b/src/libsystemd-network/sd-dhcp6-client.c
+Index: systemd-stable/src/libsystemd-network/sd-dhcp6-client.c
+===================================================================
+--- systemd-stable.orig/src/libsystemd-network/sd-dhcp6-client.c
++++ systemd-stable/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,6 @@
  
  #include <errno.h>
@@ -64,10 +64,10 @@ index eac2e725cce7..1beae7ba91cc 100644
  #include <linux/if_infiniband.h>
  
  #include "sd-dhcp6-client.h"
-diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
-index e35127a4cd2e..4f6ad9ef5886 100644
---- a/src/libsystemd/sd-netlink/netlink-types.c
-+++ b/src/libsystemd/sd-netlink/netlink-types.c
+Index: systemd-stable/src/libsystemd/sd-netlink/netlink-types.c
+===================================================================
+--- systemd-stable.orig/src/libsystemd/sd-netlink/netlink-types.c
++++ systemd-stable/src/libsystemd/sd-netlink/netlink-types.c
 @@ -3,6 +3,7 @@
  #include <netinet/in.h>
  #include <stdint.h>
@@ -76,10 +76,10 @@ index e35127a4cd2e..4f6ad9ef5886 100644
  #include <linux/can/vxcan.h>
  #include <linux/netlink.h>
  #include <linux/rtnetlink.h>
-diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index a2990452af17..5af350883c28 100644
---- a/src/machine/machine-dbus.c
-+++ b/src/machine/machine-dbus.c
+Index: systemd-stable/src/machine/machine-dbus.c
+===================================================================
+--- systemd-stable.orig/src/machine/machine-dbus.c
++++ systemd-stable/src/machine/machine-dbus.c
 @@ -3,6 +3,7 @@
  #include <errno.h>
  #include <sys/mount.h>
@@ -88,21 +88,21 @@ index a2990452af17..5af350883c28 100644
  
  /* When we include libgen.h because we need dirname() we immediately
   * undefine basename() since libgen.h defines it as a macro to the POSIX
-diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index 8df39e35843f..8d697894f970 100644
---- a/src/network/netdev/bond.c
-+++ b/src/network/netdev/bond.c
+Index: systemd-stable/src/network/netdev/bond.c
+===================================================================
+--- systemd-stable.orig/src/network/netdev/bond.c
++++ systemd-stable/src/network/netdev/bond.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
 +#include <netinet/if_ether.h>
  #include "alloc-util.h"
  #include "bond.h"
- #include "conf-parser.h"
-diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index 6b8f9944612e..7f81ec25c407 100644
---- a/src/network/netdev/bridge.c
-+++ b/src/network/netdev/bridge.c
+ #include "bond-util.h"
+Index: systemd-stable/src/network/netdev/bridge.c
+===================================================================
+--- systemd-stable.orig/src/network/netdev/bridge.c
++++ systemd-stable/src/network/netdev/bridge.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
@@ -110,10 +110,10 @@ index 6b8f9944612e..7f81ec25c407 100644
  #include <net/if.h>
  
  #include "bridge.h"
-diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index 7d1fec3afe6d..e948a335336d 100644
---- a/src/network/netdev/macsec.c
-+++ b/src/network/netdev/macsec.c
+Index: systemd-stable/src/network/netdev/macsec.c
+===================================================================
+--- systemd-stable.orig/src/network/netdev/macsec.c
++++ systemd-stable/src/network/netdev/macsec.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
@@ -121,10 +121,10 @@ index 7d1fec3afe6d..e948a335336d 100644
  #include <netinet/in.h>
  #include <linux/if_ether.h>
  #include <linux/if_macsec.h>
-diff --git a/src/network/netdev/netdev-gperf.gperf b/src/network/netdev/netdev-gperf.gperf
-index 09a5f4822e03..873299b1f98a 100644
---- a/src/network/netdev/netdev-gperf.gperf
-+++ b/src/network/netdev/netdev-gperf.gperf
+Index: systemd-stable/src/network/netdev/netdev-gperf.gperf
+===================================================================
+--- systemd-stable.orig/src/network/netdev/netdev-gperf.gperf
++++ systemd-stable/src/network/netdev/netdev-gperf.gperf
 @@ -2,6 +2,7 @@
  #if __GNUC__ >= 7
  _Pragma("GCC diagnostic ignored \"-Wimplicit-fallthrough\"")
@@ -133,21 +133,21 @@ index 09a5f4822e03..873299b1f98a 100644
  #include <stddef.h>
  #include "bond.h"
  #include "bridge.h"
-diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index f8121a48ed92..437f411c61e8 100644
---- a/src/network/netdev/netdev.c
-+++ b/src/network/netdev/netdev.c
+Index: systemd-stable/src/network/netdev/netdev.c
+===================================================================
+--- systemd-stable.orig/src/network/netdev/netdev.c
++++ systemd-stable/src/network/netdev/netdev.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
 +#include <netinet/if_ether.h>
  #include <net/if.h>
  #include <netinet/in.h>
- 
-diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
-index 41f09287f2b7..b67ce4fc8844 100644
---- a/src/network/networkd-brvlan.c
-+++ b/src/network/networkd-brvlan.c
+ #include <unistd.h>
+Index: systemd-stable/src/network/networkd-brvlan.c
+===================================================================
+--- systemd-stable.orig/src/network/networkd-brvlan.c
++++ systemd-stable/src/network/networkd-brvlan.c
 @@ -4,6 +4,7 @@
  ***/
  
@@ -156,11 +156,11 @@ index 41f09287f2b7..b67ce4fc8844 100644
  #include <linux/if_bridge.h>
  #include <stdbool.h>
  
-diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index 8664d8cdc0d4..e9f91f74c1a1 100644
---- a/src/network/networkd-dhcp-common.c
-+++ b/src/network/networkd-dhcp-common.c
-@@ -4,6 +4,7 @@
+Index: systemd-stable/src/network/networkd-dhcp-common.c
+===================================================================
+--- systemd-stable.orig/src/network/networkd-dhcp-common.c
++++ systemd-stable/src/network/networkd-dhcp-common.c
+@@ -5,6 +5,7 @@
  #include "escape.h"
  #include "in-addr-util.h"
  #include "networkd-dhcp-common.h"
@@ -168,10 +168,10 @@ index 8664d8cdc0d4..e9f91f74c1a1 100644
  #include "networkd-network.h"
  #include "parse-util.h"
  #include "string-table.h"
-diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index 13e3e32f40e8..5394399c9150 100644
---- a/src/network/networkd-dhcp4.c
-+++ b/src/network/networkd-dhcp4.c
+Index: systemd-stable/src/network/networkd-dhcp4.c
+===================================================================
+--- systemd-stable.orig/src/network/networkd-dhcp4.c
++++ systemd-stable/src/network/networkd-dhcp4.c
 @@ -1,9 +1,9 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
@@ -181,12 +181,12 @@ index 13e3e32f40e8..5394399c9150 100644
  #include <linux/if.h>
 -#include <linux/if_arp.h>
  
+ #include "escape.h"
  #include "alloc-util.h"
- #include "dhcp-client-internal.h"
-diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
-index 7304270c60b1..099064f64715 100644
---- a/src/network/networkd-dhcp6.c
-+++ b/src/network/networkd-dhcp6.c
+Index: systemd-stable/src/network/networkd-dhcp6.c
+===================================================================
+--- systemd-stable.orig/src/network/networkd-dhcp6.c
++++ systemd-stable/src/network/networkd-dhcp6.c
 @@ -3,9 +3,9 @@
    Copyright © 2014 Intel Corporation. All rights reserved.
  ***/
@@ -195,13 +195,13 @@ index 7304270c60b1..099064f64715 100644
  #include <netinet/in.h>
  #include <linux/if.h>
 -#include <linux/if_arp.h>
- #include "sd-radv.h"
  
  #include "sd-dhcp6-client.h"
-diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 99d4b29c31ec..e8b467d6ac09 100644
---- a/src/network/networkd-link.c
-+++ b/src/network/networkd-link.c
+ 
+Index: systemd-stable/src/network/networkd-link.c
+===================================================================
+--- systemd-stable.orig/src/network/networkd-link.c
++++ systemd-stable/src/network/networkd-link.c
 @@ -1,8 +1,8 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
@@ -209,13 +209,13 @@ index 99d4b29c31ec..e8b467d6ac09 100644
  #include <netinet/in.h>
  #include <linux/if.h>
 -#include <linux/if_arp.h>
+ #include <linux/if_link.h>
  #include <unistd.h>
  
- #include "alloc-util.h"
-diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
-index 2e716b291e97..56f18cea57fe 100644
---- a/src/network/networkd-network.c
-+++ b/src/network/networkd-network.c
+Index: systemd-stable/src/network/networkd-network.c
+===================================================================
+--- systemd-stable.orig/src/network/networkd-network.c
++++ systemd-stable/src/network/networkd-network.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
@@ -223,19 +223,19 @@ index 2e716b291e97..56f18cea57fe 100644
  #include <net/if.h>
  #include <netinet/in.h>
  #include <linux/netdevice.h>
-diff --git a/src/network/test-network-tables.c b/src/network/test-network-tables.c
-index 25b939639775..530e4928835c 100644
---- a/src/network/test-network-tables.c
-+++ b/src/network/test-network-tables.c
+Index: systemd-stable/src/network/test-network-tables.c
+===================================================================
+--- systemd-stable.orig/src/network/test-network-tables.c
++++ systemd-stable/src/network/test-network-tables.c
 @@ -1,3 +1,4 @@
 +#include <netinet/if_ether.h>
  #include "bond.h"
  #include "dhcp6-internal.h"
  #include "dhcp6-protocol.h"
-diff --git a/src/shared/ethtool-util.c b/src/shared/ethtool-util.c
-index 00a71d64a638..4593e89120b8 100644
---- a/src/shared/ethtool-util.c
-+++ b/src/shared/ethtool-util.c
+Index: systemd-stable/src/shared/ethtool-util.c
+===================================================================
+--- systemd-stable.orig/src/shared/ethtool-util.c
++++ systemd-stable/src/shared/ethtool-util.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
@@ -243,10 +243,10 @@ index 00a71d64a638..4593e89120b8 100644
  #include <net/if.h>
  #include <sys/ioctl.h>
  #include <linux/ethtool.h>
-diff --git a/src/shared/ethtool-util.h b/src/shared/ethtool-util.h
-index c1d5d7590ef9..b3e018bf76e9 100644
---- a/src/shared/ethtool-util.h
-+++ b/src/shared/ethtool-util.h
+Index: systemd-stable/src/shared/ethtool-util.h
+===================================================================
+--- systemd-stable.orig/src/shared/ethtool-util.h
++++ systemd-stable/src/shared/ethtool-util.h
 @@ -3,6 +3,7 @@
  
  #include <macro.h>
@@ -255,21 +255,21 @@ index c1d5d7590ef9..b3e018bf76e9 100644
  #include <linux/ethtool.h>
  
  #include "conf-parser.h"
-diff --git a/src/udev/net/link-config.c b/src/udev/net/link-config.c
-index 0332e99269c9..ff3aead4a779 100644
---- a/src/udev/net/link-config.c
-+++ b/src/udev/net/link-config.c
+Index: systemd-stable/src/udev/net/link-config.c
+===================================================================
+--- systemd-stable.orig/src/udev/net/link-config.c
++++ systemd-stable/src/udev/net/link-config.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
 +#include <netinet/if_ether.h>
  #include <linux/netdevice.h>
  #include <netinet/ether.h>
- 
-diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
-index ee3ca9fa3846..9aa4e828741f 100644
---- a/src/udev/udev-builtin-net_setup_link.c
-+++ b/src/udev/udev-builtin-net_setup_link.c
+ #include <unistd.h>
+Index: systemd-stable/src/udev/udev-builtin-net_setup_link.c
+===================================================================
+--- systemd-stable.orig/src/udev/udev-builtin-net_setup_link.c
++++ systemd-stable/src/udev/udev-builtin-net_setup_link.c
 @@ -1,5 +1,6 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
index 580c49fecf..dd6ecebeb4 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not.patch
@@ -23,10 +23,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/tmpfiles/tmpfiles.c   | 10 ++++++++++
  3 files changed, 38 insertions(+)
 
-diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
-index e3aa6c2e152b..38070b79c83a 100644
---- a/src/basic/glob-util.c
-+++ b/src/basic/glob-util.c
+Index: systemd-stable/src/basic/glob-util.c
+===================================================================
+--- systemd-stable.orig/src/basic/glob-util.c
++++ systemd-stable/src/basic/glob-util.c
 @@ -12,6 +12,12 @@
  #include "path-util.h"
  #include "strv.h"
@@ -48,7 +48,7 @@ index e3aa6c2e152b..38070b79c83a 100644
          /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
          assert(!(flags & GLOB_ALTDIRFUNC));
  
-@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
+@@ -32,9 +39,14 @@ int safe_glob(const char *path, int flag
                  pglob->gl_lstat = lstat;
          if (!pglob->gl_stat)
                  pglob->gl_stat = stat;
@@ -63,10 +63,10 @@ index e3aa6c2e152b..38070b79c83a 100644
          if (k == GLOB_NOMATCH)
                  return -ENOENT;
          if (k == GLOB_NOSPACE)
-diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
-index 667d15335fbf..76a84443aacf 100644
---- a/src/test/test-glob-util.c
-+++ b/src/test/test-glob-util.c
+Index: systemd-stable/src/test/test-glob-util.c
+===================================================================
+--- systemd-stable.orig/src/test/test-glob-util.c
++++ systemd-stable/src/test/test-glob-util.c
 @@ -12,6 +12,12 @@
  #include "rm-rf.h"
  #include "tmpfile-util.h"
@@ -114,11 +114,11 @@ index 667d15335fbf..76a84443aacf 100644
          assert_se(r == GLOB_NOMATCH);
  
          (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
-diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
-index 193ed0bc781b..2f94fd2efd8f 100644
---- a/src/tmpfiles/tmpfiles.c
-+++ b/src/tmpfiles/tmpfiles.c
-@@ -58,6 +58,12 @@
+Index: systemd-stable/src/tmpfiles/tmpfiles.c
+===================================================================
+--- systemd-stable.orig/src/tmpfiles/tmpfiles.c
++++ systemd-stable/src/tmpfiles/tmpfiles.c
+@@ -59,6 +59,12 @@
  #include "umask-util.h"
  #include "user-util.h"
  
@@ -131,7 +131,7 @@ index 193ed0bc781b..2f94fd2efd8f 100644
  /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
   * them in the file system. This is intended to be used to create
   * properly owned directories beneath /tmp, /var/tmp, /run, which are
-@@ -1850,7 +1856,9 @@ finish:
+@@ -1867,7 +1873,9 @@ finish:
  
  static int glob_item(Item *i, action_t action) {
          _cleanup_globfree_ glob_t g = {
@@ -141,7 +141,7 @@ index 193ed0bc781b..2f94fd2efd8f 100644
          };
          int r = 0, k;
          char **fn;
-@@ -1870,7 +1878,9 @@ static int glob_item(Item *i, action_t action) {
+@@ -1887,7 +1895,9 @@ static int glob_item(Item *i, action_t a
  
  static int glob_item_recursively(Item *i, fdaction_t action) {
          _cleanup_globfree_ glob_t g = {
diff --git a/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 5ee501f235..15055161fc 100644
--- a/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/basic/process-util.c | 7 +++++++
  1 file changed, 7 insertions(+)
 
-diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 5de366f830e8..644f53aee005 100644
---- a/src/basic/process-util.c
-+++ b/src/basic/process-util.c
+Index: systemd-stable/src/basic/process-util.c
+===================================================================
+--- systemd-stable.orig/src/basic/process-util.c
++++ systemd-stable/src/basic/process-util.c
 @@ -18,6 +18,9 @@
  #if HAVE_VALGRIND_VALGRIND_H
  #include <valgrind/valgrind.h>
@@ -25,7 +25,7 @@ index 5de366f830e8..644f53aee005 100644
  
  #include "alloc-util.h"
  #include "architecture.h"
-@@ -1116,11 +1119,15 @@ void reset_cached_pid(void) {
+@@ -1143,11 +1146,15 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
diff --git a/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
index e5d9515e86..a6fcd2f5da 100644
--- a/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
@@ -27,11 +27,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/core/execute.c      |  4 ++--
  3 files changed, 8 insertions(+), 14 deletions(-)
 
-diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index c47fa76ea8ff..14a78d9f5fd0 100644
---- a/src/basic/format-util.h
-+++ b/src/basic/format-util.h
-@@ -32,13 +32,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32_t));
+Index: systemd-stable/src/basic/format-util.h
+===================================================================
+--- systemd-stable.orig/src/basic/format-util.h
++++ systemd-stable/src/basic/format-util.h
+@@ -32,13 +32,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32
  #  define PRI_TIMEX "li"
  #endif
  
@@ -46,11 +46,11 @@ index c47fa76ea8ff..14a78d9f5fd0 100644
  
  #if SIZEOF_DEV_T == 8
  #  define DEV_FMT "%" PRIu64
-diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
-index 2dc13eabc30d..0633cc67f417 100644
---- a/src/basic/rlimit-util.c
-+++ b/src/basic/rlimit-util.c
-@@ -306,13 +306,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
+Index: systemd-stable/src/basic/rlimit-util.c
+===================================================================
+--- systemd-stable.orig/src/basic/rlimit-util.c
++++ systemd-stable/src/basic/rlimit-util.c
+@@ -306,13 +306,13 @@ int rlimit_format(const struct rlimit *r
          if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
                  s = strdup("infinity");
          else if (rl->rlim_cur >= RLIM_INFINITY)
@@ -77,11 +77,11 @@ index 2dc13eabc30d..0633cc67f417 100644
  
          return 1;
  }
-diff --git a/src/core/execute.c b/src/core/execute.c
-index 9762dc57443c..4a3421bb3ee6 100644
---- a/src/core/execute.c
-+++ b/src/core/execute.c
-@@ -4567,9 +4567,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+Index: systemd-stable/src/core/execute.c
+===================================================================
+--- systemd-stable.orig/src/core/execute.c
++++ systemd-stable/src/core/execute.c
+@@ -4686,9 +4686,9 @@ void exec_context_dump(const ExecContext
          for (i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
diff --git a/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index efeef07295..0a7594c068 100644
--- a/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0015-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -31,13 +31,13 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  src/shared/base-filesystem.c |  6 +++---
  2 files changed, 24 insertions(+), 4 deletions(-)
 
-diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
-index 78d68be9fd85..c5dc84d41868 100644
---- a/src/basic/fs-util.h
-+++ b/src/basic/fs-util.h
-@@ -40,7 +40,27 @@ int fchmod_opath(int fd, mode_t m);
- 
+Index: systemd-stable/src/basic/fs-util.h
+===================================================================
+--- systemd-stable.orig/src/basic/fs-util.h
++++ systemd-stable/src/basic/fs-util.h
+@@ -42,7 +42,27 @@ int fchmod_opath(int fd, mode_t m);
  int fd_warn_permissions(const char *path, int fd);
+ int stat_warn_permissions(const char *path, const struct stat *st);
  
 -#define laccess(path, mode) faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOLLOW)
 +/*
@@ -64,11 +64,11 @@ index 78d68be9fd85..c5dc84d41868 100644
  
  int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
  int touch(const char *path);
-diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
-index 657407da2d37..fbd5782d84fc 100644
---- a/src/shared/base-filesystem.c
-+++ b/src/shared/base-filesystem.c
-@@ -54,7 +54,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+Index: systemd-stable/src/shared/base-filesystem.c
+===================================================================
+--- systemd-stable.orig/src/shared/base-filesystem.c
++++ systemd-stable/src/shared/base-filesystem.c
+@@ -54,7 +54,7 @@ int base_filesystem_create(const char *r
                  return log_error_errno(errno, "Failed to open root file system: %m");
  
          for (i = 0; i < ELEMENTSOF(table); i ++) {
@@ -77,7 +77,7 @@ index 657407da2d37..fbd5782d84fc 100644
                          continue;
  
                  if (table[i].target) {
-@@ -62,7 +62,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -62,7 +62,7 @@ int base_filesystem_create(const char *r
  
                          /* check if one of the targets exists */
                          NULSTR_FOREACH(s, table[i].target) {
@@ -86,7 +86,7 @@ index 657407da2d37..fbd5782d84fc 100644
                                          continue;
  
                                  /* check if a specific file exists at the target path */
-@@ -73,7 +73,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
+@@ -73,7 +73,7 @@ int base_filesystem_create(const char *r
                                          if (!p)
                                                  return log_oom();
  
diff --git a/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 19a3eef847..67d5041917 100644
--- a/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/machine/machine-dbus.c | 5 +++++
  1 file changed, 5 insertions(+)
 
-diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index 760ccb445cd0..0df20f3864b3 100644
---- a/src/machine/machine-dbus.c
-+++ b/src/machine/machine-dbus.c
+Index: systemd-stable/src/machine/machine-dbus.c
+===================================================================
+--- systemd-stable.orig/src/machine/machine-dbus.c
++++ systemd-stable/src/machine/machine-dbus.c
 @@ -11,6 +11,11 @@
  #include <libgen.h>
  #undef basename
@@ -29,4 +29,4 @@ index 760ccb445cd0..0df20f3864b3 100644
 +
  #include "alloc-util.h"
  #include "bus-common-errors.h"
- #include "bus-internal.h"
+ #include "bus-get-properties.h"
diff --git a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 1934b783dc..3d456ec83a 100644
--- a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -24,11 +24,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  src/basic/process-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 644f53aee005..acaf13591396 100644
---- a/src/basic/process-util.c
-+++ b/src/basic/process-util.c
-@@ -1500,7 +1500,7 @@ int set_oom_score_adjust(int value) {
+Index: systemd-stable/src/basic/process-util.c
+===================================================================
+--- systemd-stable.orig/src/basic/process-util.c
++++ systemd-stable/src/basic/process-util.c
+@@ -1536,7 +1536,7 @@ int set_oom_score_adjust(int value) {
          sprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
diff --git a/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index 84a492f290..48fd007e11 100644
--- a/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0018-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -24,11 +24,11 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/libsystemd/sd-bus/bus-error.c | 5 +++++
  2 files changed, 10 insertions(+)
 
-diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
-index 43ed756bda53..227ea64dbb48 100644
---- a/src/journal/journal-send.c
-+++ b/src/journal/journal-send.c
-@@ -336,7 +336,12 @@ static int fill_iovec_perror_and_send(const char *message, int skip, struct iove
+Index: systemd-stable/src/journal/journal-send.c
+===================================================================
+--- systemd-stable.orig/src/journal/journal-send.c
++++ systemd-stable/src/journal/journal-send.c
+@@ -348,7 +348,12 @@ static int fill_iovec_perror_and_send(co
                  char* j;
  
                  errno = 0;
@@ -41,11 +41,11 @@ index 43ed756bda53..227ea64dbb48 100644
                  if (errno == 0) {
                          char error[STRLEN("ERRNO=") + DECIMAL_STR_MAX(int) + 1];
  
-diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index f760f0fdd21c..28a5159c4480 100644
---- a/src/libsystemd/sd-bus/bus-error.c
-+++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -379,7 +379,12 @@ static void bus_error_strerror(sd_bus_error *e, int error) {
+Index: systemd-stable/src/libsystemd/sd-bus/bus-error.c
+===================================================================
+--- systemd-stable.orig/src/libsystemd/sd-bus/bus-error.c
++++ systemd-stable/src/libsystemd/sd-bus/bus-error.c
+@@ -379,7 +379,12 @@ static void bus_error_strerror(sd_bus_er
                          return;
  
                  errno = 0;
diff --git a/meta/recipes-core/systemd/systemd/0021-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0021-Handle-missing-LOCK_EX.patch
new file mode 100644
index 0000000000..67d9162c08
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0021-Handle-missing-LOCK_EX.patch
@@ -0,0 +1,23 @@
+From 190854c2114dc6e74c8859dc251e3737e3c0f353 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 7 Aug 2020 15:19:27 +0000
+Subject: [PATCH] Handle missing LOCK_EX
+
+Upstream-Status: Inappropriate [musl specific]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/partition/makefs.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/partition/makefs.c b/src/partition/makefs.c
+index 97f50c9033..7f55acd229 100644
+--- a/src/partition/makefs.c
++++ b/src/partition/makefs.c
+@@ -5,6 +5,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <unistd.h>
++#include <sys/file.h>
+ 
+ #include "alloc-util.h"
+ #include "blockdev-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
new file mode 100644
index 0000000000..d57ca1fd39
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
@@ -0,0 +1,37 @@
+From 328c39fae2631deb5737dd56f46159dd6b4cdbed Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 7 Aug 2020 15:20:17 +0000
+Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
+
+| ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c: In function 'cant_be_in_netns':
+| ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c:4893:25: error: passing argument 2 of 'connect' from incompatible pointer type [-Werror=incompatible-pointer-types]
+|  4893 |         if (connect(fd, &sa.un, SOCKADDR_UN_LEN(sa.un)) < 0) {
+|       |                         ^~~~~~
+|       |                         |
+|       |                         struct sockaddr_un *
+| In file included from ../../../../../../workspace/sources/systemd/src/systemd/sd-daemon.h:22,
+|                  from ../../../../../../workspace/sources/systemd/src/nspawn/nspawn.c:21:
+| /home/ubuntu/poky/build/tmp/work/core2-64-poky-linux-musl/systemd/1_246-r0/recipe-sysroot/usr/include/sys/socket.h:384:19: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_un *'
+|   384 | int connect (int, const struct sockaddr *, socklen_t);
+|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
+| cc1: some warnings being treated as errors
+
+Upstream-Status: Inappropriate [musl specific]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/nspawn/nspawn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 0450c9f795..7305db04ef 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -4890,7 +4890,7 @@ static int cant_be_in_netns(void) {
+         if (fd < 0)
+                 return log_error_errno(errno, "Failed to allocate udev control socket: %m");
+ 
+-        if (connect(fd, &sa.un, SOCKADDR_UN_LEN(sa.un)) < 0) {
++        if (connect(fd, (struct sockaddr *)&sa.un, SOCKADDR_UN_LEN(sa.un)) < 0) {
+ 
+                 if (errno == ENOENT || ERRNO_IS_DISCONNECT(errno))
+                         return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSUPP),
diff --git a/meta/recipes-core/systemd/systemd/0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch b/meta/recipes-core/systemd/systemd/0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch
new file mode 100644
index 0000000000..78660691d3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch
@@ -0,0 +1,31 @@
+From f939d3e07e1175caac5cf4cbf54bd8a58c2f198a Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 7 Aug 2020 15:30:52 +0000
+Subject: [PATCH] Fix field 'efi_loader_entry_one_shot_stat' has incomplete
+ type
+
+| In file included from ../../../../../../workspace/sources/systemd/src/login/logind-gperf.gperf:7:
+| ../../../../../../workspace/sources/systemd/src/login/logind.h:131:21: error: field 'efi_loader_entry_one_shot_stat' has incomplete type
+|   131 |         struct stat efi_loader_entry_one_shot_stat;
+|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Inappropriate [musl specific]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/login/logind.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/login/logind.h b/src/login/logind.h
+index e64ecce8e2..2d4007d84b 100644
+--- a/src/login/logind.h
++++ b/src/login/logind.h
+@@ -2,6 +2,9 @@
+ #pragma once
+ 
+ #include <stdbool.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <unistd.h>
+ 
+ #include "sd-bus.h"
+ #include "sd-device.h"
diff --git a/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch b/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
deleted file mode 100644
index 7b5e3e7f7a..0000000000
--- a/meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 156a5fd297b61bce31630d7a52c15614bf784843 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
-Date: Sun, 31 May 2020 18:21:09 +0200
-Subject: [PATCH 1/1] basic/user-util: always use base 10 for user/group
- numbers
-
-We would parse numbers with base prefixes as user identifiers. For example,
-"0x2b3bfa0" would be interpreted as UID==45334432 and "01750" would be
-interpreted as UID==1000. This parsing was used also in cases where either a
-user/group name or number may be specified. This means that names like
-0x2b3bfa0 would be ambiguous: they are a valid user name according to our
-documented relaxed rules, but they would also be parsed as numeric uids.
-
-This behaviour is definitely not expected by users, since tools generally only
-accept decimal numbers (e.g. id, getent passwd), while other tools only accept
-user names and thus will interpret such strings as user names without even
-attempting to convert them to numbers (su, ssh). So let's follow suit and only
-accept numbers in decimal notation. Effectively this means that we will reject
-such strings as a username/uid/groupname/gid where strict mode is used, and try
-to look up a user/group with such a name in relaxed mode.
-
-Since the function changed is fairly low-level and fairly widely used, this
-affects multiple tools: loginctl show-user/enable-linger/disable-linger foo',
-the third argument in sysusers.d, fourth and fifth arguments in tmpfiles.d,
-etc.
-
-Fixes #15985.
----
- src/basic/user-util.c     |  2 +-
- src/test/test-user-util.c | 10 ++++++++++
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
---- end of commit 156a5fd297b61bce31630d7a52c15614bf784843 ---
-
-
-Add definition of safe_atou32_full() from commit b934ac3d6e7dcad114776ef30ee9098693e7ab7e
-
-CVE: CVE-2020-13776
-
-Upstream-Status: Backport [https://github.com/systemd/systemd.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
-
---- git.orig/src/basic/user-util.c
-+++ git/src/basic/user-util.c
-@@ -49,7 +49,7 @@ int parse_uid(const char *s, uid_t *ret)
-         assert(s);
- 
-         assert_cc(sizeof(uid_t) == sizeof(uint32_t));
--        r = safe_atou32(s, &uid);
-+        r = safe_atou32_full(s, 10, &uid);
-         if (r < 0)
-                 return r;
- 
---- git.orig/src/test/test-user-util.c
-+++ git/src/test/test-user-util.c
-@@ -48,9 +48,19 @@ static void test_parse_uid(void) {
- 
-         r = parse_uid("65535", &uid);
-         assert_se(r == -ENXIO);
-+        assert_se(uid == 100);
-+
-+        r = parse_uid("0x1234", &uid);
-+        assert_se(r == -EINVAL);
-+        assert_se(uid == 100);
-+
-+        r = parse_uid("01234", &uid);
-+        assert_se(r == 0);
-+        assert_se(uid == 1234);
- 
-         r = parse_uid("asdsdas", &uid);
-         assert_se(r == -EINVAL);
-+        assert_se(uid == 1234);
- }
- 
- static void test_uid_ptr(void) {
---- git.orig/src/basic/parse-util.h
-+++ git/src/basic/parse-util.h
-@@ -45,9 +45,13 @@ static inline int safe_atoux16(const cha
- 
- int safe_atoi16(const char *s, int16_t *ret);
- 
--static inline int safe_atou32(const char *s, uint32_t *ret_u) {
-+static inline int safe_atou32_full(const char *s, unsigned base, uint32_t *ret_u) {
-         assert_cc(sizeof(uint32_t) == sizeof(unsigned));
--        return safe_atou(s, (unsigned*) ret_u);
-+        return safe_atou_full(s, base, (unsigned*) ret_u);
-+}
-+
-+static inline int safe_atou32(const char *s, uint32_t *ret_u) {
-+        return safe_atou32_full(s, 0, (unsigned*) ret_u);
- }
- 
- static inline int safe_atoi32(const char *s, int32_t *ret_i) {
diff --git a/meta/recipes-core/systemd/systemd_245.6.bb b/meta/recipes-core/systemd/systemd_246.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_245.6.bb
rename to meta/recipes-core/systemd/systemd_246.bb
index cdafb98247..a463aab1e3 100644
--- a/meta/recipes-core/systemd/systemd_245.6.bb
+++ b/meta/recipes-core/systemd/systemd_246.bb
@@ -20,7 +20,9 @@ SRC_URI += "file://touchscreen.rules \
            file://99-default.preset \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
-           file://CVE-2020-13776.patch \
+           file://0021-Handle-missing-LOCK_EX.patch \
+           file://0022-Fix-incompatible-pointer-type-struct-sockaddr_un.patch \
+           file://0023-Fix-field-efi_loader_entry_one_shot_stat-has-incompl.patch \
            "
 
 # patches needed by musl
@@ -605,6 +607,7 @@ FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/v4l_id \
                ${rootlibexecdir}/udev/keymaps \
                ${rootlibexecdir}/udev/rules.d/50-udev-default.rules \
+               ${rootlibexecdir}/udev/rules.d/60-autosuspend.rules \
                ${rootlibexecdir}/udev/rules.d/60-autosuspend-chromiumos.rules \
                ${rootlibexecdir}/udev/rules.d/60-block.rules \
                ${rootlibexecdir}/udev/rules.d/60-cdrom_id.rules \
-- 
2.17.1

