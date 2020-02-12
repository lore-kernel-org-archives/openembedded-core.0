Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC076069C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 09:44:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r11so1347896wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 01:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N9U7//InH525mOpMG+ofwemN5SPK+bz9wOGzd/dBzZM=;
	b=Q3ZS6uTxthLLIiRoQyeP1ovXiELbwNaXXNqt38+URaQuL7A7NpQROtMICFRU4Qyqzg
	H1lnlLJl1+Sb1GPu88tg9OaCIvLraOJRfeYu5Q29jpN3nkC385mmkuZlruWKVXuuQ/kb
	I5A9a4rghBDWkSF+BJslI458OBoTTQZjWT1v90/zxzC9whNbLMcnKRTBNCT6tF4KzMnD
	Hhbn2neG6Fbp2+dHXaEQdV+tpiaQl8BNB3V6Hajz+8TFl1XCrMe79nfaQhBN8p/Ybkst
	ZmSxLJm+ZI0zGMw6oOrXLqIzB3k3+nWD/W526exm/t6IJe2mj7C4x8Jr4lygErgz7YGd
	EPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N9U7//InH525mOpMG+ofwemN5SPK+bz9wOGzd/dBzZM=;
	b=QpAo8gxN6zsGvJivUsy/V9erp6Z+zrn85YoHqAtOrkgYgA+2mil8XWJ5GMrEhpUll9
	xiJTLif1GmWGETlZ6/POwZ4jXH1Bi9Ub+ldICQ4LUQx6XIjJuR3eN9jgaLqo+qfcRf62
	ZiEGdLMT2mosRB2DBj9/36NoEb75Joa1kuNbfllEY8e6NdtVvEbyrRCn5VXLonHwospl
	2bLH23Cw/Ry/KjMOW2ua6Agf0zWMj4wGtIEZuHQKXRWS6DeICxTBCn9hF3xVbGSns+T2
	LLVp0Y+pIepGZhlLf/vJf/a7wDMDRbwdaVxJD6XcgViST8gUoaBY2cBAUeMB3/SXGCl6
	pQaA==
X-Gm-Message-State: APjAAAUxGLq/pooTTjKun7Yrq309VN/zQaiolDzSwRyy6qlva+6U2j2o
	2xZq4bUBPytqRz3VztLjo9MB+xI4
X-Google-Smtp-Source: APXvYqxJEQ1b0dHmW0VTidYoG8WrheXMrRitl/K9QVucidETkEI+gzmqcqfz8Hp4ivqO5xc5nOaLLg==
X-Received: by 2002:adf:9dc9:: with SMTP id q9mr13710829wre.286.1581500680382; 
	Wed, 12 Feb 2020 01:44:40 -0800 (PST)
Received: from localhost.localdomain ([195.89.163.130])
	by smtp.gmail.com with ESMTPSA id j5sm9115814wrw.24.2020.02.12.01.44.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 01:44:39 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 09:44:34 +0000
Message-Id: <20200212094434.118167-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] systemd: upgrade v244.1 -> v244.3
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
X-List-Received-Date: Wed, 12 Feb 2020 09:44:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commits from v244-stable:

  c4280c342bbf Revert "Support Plugable UD-PRO8 dock"
  bb598b56eb3c hibernate-resume-generator: wait "infinitely" for the resume device
  77c04ce5c270 hwdb: update to v245-rc1
  b4eb8848240c Fix typo in function name
  e2d4cb9843c5 polkit: when authorizing via PK let's re-resolve callback/userdata instead of caching it
  83bfc0d8dd02 sd-bus: introduce API for re-enqueuing incoming messages
  5926f9f1723f polkit: use structured initialization
  0697d0d972c8 polkit: on async pk requests, re-validate action/details
  2589995acdb2 polkit: reuse some common bus message appending code
  5b2442d5c3ec bus-polkit: rename return error parameter to ret_error
  0a19ff7004e4 shared: split out polkit stuff from bus-util.c → bus-polkit.c
  1325dfb5778d test: adapt to the new capsh format
  3538fafb4714 meson: update efi path detection to gnu-efi-3.0.11
  3034855a5b62 presets: "disable" all passive targets by default
  c2e304681929 shared/sysctl-util: normalize repeated slashes or dots to a single value
  6f4364046f90 dhcp6: do not use T1 and T2 longer than one provided by the lease
  0ed6cda28dff network: fix implicit type conversion warning by GCC-10
  f6a5c02d26b1 bootspec: parse random-seed-mode line in loader.conf
  ddc5dca8a73b sd-boot: fix typo
  2bbbe9ae41ab test: Synchronize journal before reading from it
  072485d661d7 sd-bus: fix introspection bug in signal parameter names
  80af3cf5e36b efi: fix build.
  d7ede1ade564 generator: order growfs for the root fs after systemd-remount-fs
  e9904998213d loginctl: use /org/freedesktop/login1/session/auto when "lock-session" is called without argument
  82dd4caf014c Documentation update for x-systemd.{before,after}
  a60459764d9d man: fix typo in systemd.netdev Xfrm example
  fc053e2dfb3f timesyncd: log louder when we refuse a server due to root distance
  af0e630693fa resolved: drop DNSSEC root key that is not valid anymore
  ae59f1666ca6 journal: don't use startswith() on something that is not a NUL-terminated string
  536ef6d72bc6 test: add test for https://github.com/systemd/systemd/issues/14560
  b78fe3c1b1a8 core: make sure StandardInput=file: doesn't get dup'ed to stdout/stderr by default
  a1561a08f2d5 pkgconf: add full generator paths
  e5f2d11489ec tree-wide: we forgot to destroy some bus errors
  ea67fd42067b mount: make checks on perpetual mount units more lax
  2f23c648bce4 core: never allow perpetual units to be masked
  9ba11dffb09a typo: "May modify to" -> "May modify"
  84c048799a78 Disable reading SystemdOptions EFI Var when in SecureBoot mode
  4c2d72b53091 sysctl: downgrade message when we have no permission
  c001a285a3a2 Clarify journald.conf MaxLevelStore documentation
  45d52c7615fd logind: refuse overriding idle hint on tty sessions
  b1a0be45b4ee cgroup: update only siblings that got realized once
  e6d694254fe1 mount: mark an existing "mounting" unit from /proc/self/mountinfo as "just_mounted"
  d8fd38769c36 journalctl: Correctly handle combination of --reverse and --lines (fixes #1596)
  cd19bd31d808 journalctl: Correctly handle --show-cursor in combination with --until or --since and --reverse
  1320aa92dc0a core: fix re-realization of cgroup siblings
  14164ec6bc77 core: propagate service state to socket in more load states
  c22bf6b31a45 man: describe "symlink" and "systemctl link" explicitly in UNIT FILE LOAD PATH
  26f3a534f1ab core: be more restrictive on the dependency types we allow to be created transiently
  377cc5d91ea5 udev: don't import parent ID_FS_ data on partitions
  7d5060d53994 man: fix option name
  98c03090274a Support Plugable UD-PRO8 dock
  e9687d09dccf gpt-auto: don't assume XBOOTLDR is vfat
  7057fe863007 man: fix documentation of IBM VIO device naming
  f8d1df1045be man: slightly extend documentation on difference between ID_NET_NAME_ONBOARD and ID_NET_LABEL_ONBOARD
  1faf5dde4d4a boot: fix osrel parser
  65d247af1786 udev: do not use exact match of file permission
  6da978f89b48 network: lower the log-level of harmless message
  5d8a614f926c hwdb: ignore keys added in kernel 5.5
  8b1bd1746989 systemctl: skip non-existent units in the 'cat' verb
  b2f342f92b54 systemd.exec: document the file system for EnvironmentFile paths
  945f3a231f6f systemd-analyze: fixed typo in documentation
  2c8ae283b0ee test-condition: fix group check condition
  6b48479f4582 umount: show correct error message
  faba5b2ba8c9 Revert "Drop dbus activation stub service"
  3dd98f1998f9 man: add section about user manager units
  1c80a8ced006 man: add remote-*.targets to the bootup sequence
  9afd65f15e93 time-util: also use 32bit hack on EOVERFLOW
  561923291383 [man] note which UID ranges will get user journals
  588a23ef2684 [man] fix URL
  0130a03179f6 analyze: badness if neither of RootImage and RootDirectory exists
  93074c962e3a network: introduce AddPrefixRoute= and deprecate PrefixRoute=
  a8ad020ea0ba shared/dropin: fix assert for invalid drop-in
  946cdba156dd initrd: make udev cleanup service confict trigger and settle too
  c0a8a92e6027 man: we support growing xfs too these days
  608d88273494 time-util: deal with systems where userspace has 64bit time_t but kernel does not
  cfced59a4bd8 [import] fix stdin/stdout pipe behavior in import/export tar/raw
  73435b219553 systemctl: show what verbs support --dry-run in the help page
  dc56b94e1308 cryptsetup-generator: unconfuse writing of the device timeout
  0757ad565573 shared/install: log syntax error for invalid DefaultInstance=
  d2471109d999 shared/install: provide a nicer error message for invalid WantedBy=/Required= values

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../systemd/{systemd-boot_244.1.bb => systemd-boot_244.3.bb} | 0
 .../systemd/{systemd-conf_244.1.bb => systemd-conf_244.3.bb} | 0
 meta/recipes-core/systemd/systemd.inc                        | 5 +++--
 .../systemd/{systemd_244.1.bb => systemd_244.3.bb}           | 0
 4 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_244.1.bb => systemd-boot_244.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_244.1.bb => systemd-conf_244.3.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_244.1.bb => systemd_244.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_244.1.bb b/meta/recipes-core/systemd/systemd-boot_244.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_244.1.bb
rename to meta/recipes-core/systemd/systemd-boot_244.3.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_244.1.bb b/meta/recipes-core/systemd/systemd-conf_244.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_244.1.bb
rename to meta/recipes-core/systemd/systemd-conf_244.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 8c05a96ecc4f..6861767f82fa 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,9 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "639dc9f4bfd2c09535bee079ae9bc7006b520a66"
+SRCREV = "b7ed902b2394f94e7f1fbe6c3194b5cd9a9429e6"
 SRCBRANCH = "v244-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
+# v244.3 failed to push the branch, undo nobranch=1 when next updating
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;nobranch=1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd_244.1.bb b/meta/recipes-core/systemd/systemd_244.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_244.1.bb
rename to meta/recipes-core/systemd/systemd_244.3.bb
-- 
2.17.1


