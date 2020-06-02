Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.52.1591109560822736383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 07:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WBdW4dLX;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id q11so3727119wrp.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dq4UHrKBqUMgbyiO3jYcvyO5KShi+df16jUe0NqwEmg=;
        b=WBdW4dLXI4RuDR1OWgrgroHzOOtWkHPmGEls5yMc8POO+tQsXRyTEv9LKQf5F5/WeV
         PEBwfbLjXpgvs0nxyn3IAGrH0oVx572KnUFJw9hgHGmk2aRGoTz04wTAr3Ijr+bQjnqv
         3TfbB8kwYGobMM1rEuICUu3YYDh6pXa9/RATE+ML73pcsawqc9CrLLrvaL2fGWLTkuWB
         KM67AHmY7rNiULwX4tV++vZLO9SXa5wNR69PDwXvNtEjWb0oAlm59p4lvGVFwvy8dhE8
         kK7LXjXZrz+wMLclPQ4xNg+GmfzgI33HN83LRYnlt10Z0c3y/dZXIgxW37wINrzAnFzB
         OVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dq4UHrKBqUMgbyiO3jYcvyO5KShi+df16jUe0NqwEmg=;
        b=sfgD69uAX0pIEGAXUQq6g7qpSPlGdY01iun3ebnrSdNJw7jG3xbwXRGSTSbQpEc8PN
         aqwQNgOeDe+4NgDDQEXvqtS1iVCXNOqdIBNCw29F2Mwv89JQWcKeKIFx1m/fY/36rOwm
         vtEoAHKjsbMGAh0W6LCifUB01AJRxOYb4fWA8oTkkorMPXTZEp84qighImPr7V4K/mw+
         Dj/Nqb3LUFp/wu+qBYfWKCw1gUl0aWuNOJjNRAug3Eqc+oiZ1d0UZSACydkIN1IJknmu
         69nDM4lTo3mmNMzTpJBRfOQI7xyo5tfqLd2YgN/Tc7YJ20jhweAc86qEoVOQxU7ilik0
         Tn5g==
X-Gm-Message-State: AOAM532dylk+2x5KHAhRL+bP/evM+hIiEIJ70p4t4ayZr0v6dYUDWGIn
	hKXmZccPfqiVxIMr7iCnb0Zn4knTbxw=
X-Google-Smtp-Source: ABdhPJzBQ9NeUjJL/I++NJP8Bac3Uis1pRqJxP5uXEhmSKUTUjnbWFlpui5rgHo1qR1PQS+e89vctA==
X-Received: by 2002:a05:6000:4c:: with SMTP id k12mr26278409wrx.215.1591109558610;
        Tue, 02 Jun 2020 07:52:38 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id s132sm48880wmf.12.2020.06.02.07.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 07:52:37 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] systemd: upgrade v245.5 -> v245.6
Date: Tue,  2 Jun 2020 15:51:20 +0100
Message-Id: <20200602145120.124331-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commits:

  aa0cb635f1f6 network: L2TP fix crash
  9774347b5775 Fix typo.
  2cac801f0f37 stat-util: trivial empty_or_null() tweaks
  b054e69bf98e Check ambient set against bounding set prior to applying ambient set
  bed695375abc udev: when the BSD lock on a block device is taken, don't complain
  66fcfdfde7d9 core: add forgotten return in error path
  05dd19fad320 shared/efi-loader: remove check that uses absolute tick value
  753a71ad1d0e gpt: include homed GPT partition type in well-known partition table
  366872204933 units: don't set PrivateNetwork= in systemd-homed.service
  2bca2d77d37d resolved-dns-query: remove dns_query_candidate_is_routable
  a3f60204325a sd-network: fix inverted error message
  a7a9fe3c930d network: allow empty assignment to PreferredLifetime=
  8df6fc1241d1 Update resolvectl zsh completion
  c1a83277d086 shared: treat generator units as vendor units
  1f382d818dd0 tree-wide: fix bad errno checks
  667c2076838f bus-message: immediately reject messages with invalid type
  116a8eadb6ad bus-message: fix negative offset with ~empty message
  4d5779d886d0 load-fragment: fix a typo
  c8b6de003a07 NEWS: retroactively document Family=
  cf6b8e6ec524 man: fix dir name in sysctl.d(5)
  6d009b7a25b1 journalctl,elsewhere: make sure --file=foo fails with sane error msg if foo is not readable
  cf786ef1643e makefs: log about OOM condition
  0b1839822f9e blockdev: propagate one more unexpected error
  d78ce949d001 repart: don't insist on coming up on partition label ourselves
  9e1363fcc65f journal: fix dropping first record during upload to remote journal
  50cb4e418dab meson: initialize time-epoch to reproducible builds compatible value
  76abe079b79a limit-util: quieten a very common debug message that is misleading
  b3e484a3b133 shared: fix integer overflow in calendarspec
  0c29eea9691d repart: suppress complaints about lack of BLKRRPART when operating on regular file
  3db52f5ed840 repart: explain when we exit early and don't do a thing
  d99cba3aaa8c mount: introduce mount_is_nofail() helper
  7bc4bcea15aa mount: default startup dependencies and default network ones are orthogonal
  7fe617fa5381 mount: introduce mount_add_default_ordering_dependencies()
  e1c091b6d4c5 automount: fix handling of default dependencies for automount units
  ae05a137c9d4 mount: let pid1 alone handle the default dependencies for mount units
  f1fb1971767d mount: mount unit activated by automount unit should be only ordered against the automount unit
  c9bcc69703c1 generator: don't generate device dependencies for extrinsic mounts
  ebac09ea0a4e fstab-util: introduce fstab_is_extrinsic()
  a20e4ea0ed98 device: drop refuse_after
  2799fffac1eb man: drop some left-over mentions of StandardOutput=syslog
  144aff9c3beb sd-netlink: remove unused RTNL_WQUEUE_MAX define
  34ca8df8e131 test: Add return 0 to main() function (even it is not strictly necessary)
  6e03f328a939 network: 'cur' variable cannot be null, so simplify code
  8d0c97f6ca3c tree-wide: Initialize _cleanup_ variables if needed
  4f174e49aef8 netlink: Fix assert condition on n_containers
  3905ce532c86 journald: Increase stdout buffer size sooner, when almost full
  5a37eb7c6155 core: don't bind varlink socket if running in test mode
  33fff72ce665 pam_systemd: also print debug lines when ending a session
  ba9af79ccbab pam_systemd_home: use correct macro for converting ptr to fd
  619923548961 Fix misuse of PAM_PROMPT_ECHO_OFF in systemd-homed
  c180a2c4520e shared/ethtool-util: hush gcc warnings about array bounds
  1addba4aac47 core: fix compilation with gcc -O3
  9c46b97161c7 random-util: use ERRNO_IS_NOT_SUPPORTED() macro
  d85f9093d2f5 tmpfiles: clarify that "!" lines are filtered before collisions are checked
  2fac966a5ca3 man: mention the exclamation mark and minus sign literally, to make things searchable
  4f61be3373e3 man: clarify that exit status name mappings are unaffected by SuccessExitStatus=
  b747d74a4102 seccomp-util: add new syscalls from kernel 5.6 to syscall filter table
  c30d8caf8b3d tree-wide: Replace assert() by assert_se() when there is side effect
  b6e8e3be7e48 networkctl: use uint64_t for link speed throughout
  be66ce60891d tree-wide: use CMSG_SPACE() (and not CMSG_LEN()) to allocate control buffers
  1cb197798a40 man: suffix pam options with "=" where arg is required too
  a5fe01d3da4c test: Use assert_se() where variables are only checked by assert
  6960efd19892 tree-wide: Fix, replace assert() by assert_se() when there is side effect
  93c1b0307496 tree-wide: Mark as _unused_ variables that are only used in assert()
  c7679d7a9f01 tree-wide: Workaround -Wnonnull GCC bug
  073b257fd760 man: bring example PAM snippet of pam_systemd and pam_systemd_home back in sync
  855291a81ca6 man: highlight relevant lines in pam_systemd_home.so example PAM snippet
  f89ad7c0fdd9 login: include pam_systemd_home.so in the default PAM snippet we ship for user@.service
  9357f9466f80 test: Skip test-boot-timestamps on permission denied
  cad4ebe14e9e sysusers: be extra careful when locking accounts
  551e6f233a52 shared/install: print name of offending file in error
  c6a2e5123206 systemctl: fix --root support in querying presets
  6f1eedbfdda5 systemctl: fix hint when 'systemctl help' is given
  925521df7c86 shared/unit-file: fix resolution of absoulute symlinks with --root
  756ba362e873 man: mention that ProtectSystem= also takes care of /efi
  4f77cf43b5de man: systemd.service: systemd-analyze exit-codes -> exit-status
  7c6ea7a0534c man: expand on the star…end/repetition time expressions
  e06b9407928c calendarspec: be more graceful with two kinds of calendar expressions
  f3dd0b476d9d calendarspec: minor simplification
  3581c16d5681 shutdown: fix spacing in shutdown error message
  9556255349ff nspawn: mount custom paths before writing to /etc
  37447b7e78ad repart: fix partition maximum size segfault
  7f231ba503e7 link: Add units and fix typo in (Rx|Tx)BufferSize= manpage. Clean up the implementation slightly
  e75d2cdb0b22 main: bump RLIMIT_MEMLOCK by physical RAM size
  e16b9a1e31bf nspawn: be more careful with creating/chowning directories to overmount
  765d184a6976 homectl: say "home area" in more places
  c11bff4fa72b userdbctl: make --help fit in 80 columns
  0e56c2ef3fe3 shell-completion/zsh: update systemd-analyze completions
  2bb580f9942d zsh: fix disable/enable completion
  607a19a30936 cgroup-util: check for SYSFS_MAGIC when detecting cgroup format
  ddb3c38efce1 stat-util: no need to open a file to check fs type
  bd8842304c87 sysusers,tmpfiles: always mention error when failing to replace specifiers
  bdea9b65d21a sysusers: add accidentally forgotten 'return'
  17b059774dd4 man: document binfmt's new --unregister switch
  560380d8ec94 binfmt: also unregister binfmt entries from unit
  80835d9c51bd binfmt: modernize code a bit
  a1745741b82f shutdown: unregister all binfmt_misc entries before entering shutdown loop
  b637445950c8 shared: add common helper for unregistering all binfmt entries
  0215625e9927 home: fix strv NUL termination
  038988baa14e networkd: don't do lldp rx nor tx on bond devices
  9512d576d9f3 sd-bus: Fix typo in sd_bus_message_append_array docs
  63cef71dd068 shared: add NULL callback check in one more place
  6b91ca22a2e5 core: fix unused variable warning when !HAVE_SECCOMP
  f7c1c79c576d udev: prepare memory for extra NUL termination for NULSTR
  69e0ef0d99ec tree-wide: use recvmsg_safe() at various places
  cd0a84d4e956 socket-util: add recvmsg_safe() wrapper that handles MSG_CTRUNC
  2bb48c704b8d sd-bus: work around ubsan warning
  c147bba1fb4a shared: Don't try calling NULL callback in bus_wait_for_units_clear
  f907491463ac run: don't wait for start job to complete when running interactively anyway
  d3d1550a5d98 man: Fix typo "multiplied with" -> "multiplied by"
  ae5a9f27c5e5 core: make sure we don't get confused when setting TERM for a tty fd
  a07d3eaf7657 man: document that VirtualEthernetExtra= has nothing to do with Bridge=
  35fe81078eb1 core: add debug log when a job in the activation queue is not runnable
  a0cd882be891 core: add log_get_max_level check optimization in log_unit_full
  2a6ad1093c3c util: return the correct correct wd from inotify helpers
  9ec244c5c121 core: minor error code handling fixes
  a799283c91f6 man: document how to get the boot menu with zero time-out
  7263e86c8dd8 resolved: return org.freedesktop.resolve1.DnsError.NXDOMAIN on LLMNR resolution failure
  6eab4c2b3ece man: use manpages.ubuntu.com for resolvconf(8) link
  75ccec5cde54 man: add a note that resolvconf updates /etc/resolv.conf in specific circumstances
  3e3a31743a45 resolvectl: fix indentation of hexdump'ed packets
  6576058fab75 journald: add configuration option for enabling/disabling audit during journald startup
  52c5909f15ff man/systemd-service: clarify env variable expansion
  ac08df59c0db resolved: fix typo in an unused function and add comment

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../{systemd-boot_245.5.bb => systemd-boot_245.6.bb}      | 0
 .../{systemd-conf_245.5.bb => systemd-conf_245.6.bb}      | 0
 meta/recipes-core/systemd/systemd.inc                     | 2 +-
 ...mt-Don-t-install-dependency-links-at-install-tim.patch | 8 ++++----
 .../systemd/{systemd_245.5.bb => systemd_245.6.bb}        | 0
 5 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_245.5.bb => systemd-boot_245.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_245.5.bb => systemd-conf_245.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_245.5.bb => systemd_245.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_245.5.bb b/meta/recipes-core/systemd/systemd-boot_245.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_245.5.bb
rename to meta/recipes-core/systemd/systemd-boot_245.6.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_245.5.bb b/meta/recipes-core/systemd/systemd-conf_245.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_245.5.bb
rename to meta/recipes-core/systemd/systemd-conf_245.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 0f825803619e..8c758ab55644 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "9a506b7e9291d997a920af9ac299e7b834368119"
+SRCREV = "aa0cb635f1f6a4d9b50ed2cca7782f3f751be933"
 SRCBRANCH = "v245-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index d098084b2ec6..26f70b35d014 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From e9c993816077c1ae67d25d464f2ece2a090f30b8 Mon Sep 17 00:00:00 2001
+From 564830719be2017c4953589d50f21a9e856a4ecc Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time for
@@ -61,7 +61,7 @@ index 30a6bc991844..4231f3b70fe9 100644
 +[Install]
 +WantedBy=sysinit.target
 diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index 0c0f26451b67..763c4c466c16 100644
+index e54e95e11d5d..372a598614d3 100644
 --- a/units/systemd-binfmt.service.in
 +++ b/units/systemd-binfmt.service.in
 @@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
@@ -72,9 +72,9 @@ index 0c0f26451b67..763c4c466c16 100644
  After=proc-sys-fs-binfmt_misc.automount
  After=proc-sys-fs-binfmt_misc.mount
  Before=sysinit.target shutdown.target
-@@ -29,3 +30,6 @@ Type=oneshot
- RemainAfterExit=yes
+@@ -30,3 +31,6 @@ RemainAfterExit=yes
  ExecStart=@rootlibexecdir@/systemd-binfmt
+ ExecStop=@rootlibexecdir@/systemd-binfmt --unregister
  TimeoutSec=90s
 +
 +[Install]
diff --git a/meta/recipes-core/systemd/systemd_245.5.bb b/meta/recipes-core/systemd/systemd_245.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_245.5.bb
rename to meta/recipes-core/systemd/systemd_245.6.bb
-- 
2.17.1

