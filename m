Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0930CA551E
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:29:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7604.1694597348774987896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="120251961"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="120251961"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:29:05 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BEF46C68E5
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:29:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 04057D20B6
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:29:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6ED3E2007471E;
	Wed, 13 Sep 2023 18:29:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] coreutils: upgrade 9.3 -> 9.4
Date: Wed, 13 Sep 2023 17:28:50 +0800
Message-Id: <1694597330-21229-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--14.251800-10.000000
X-TMASE-MatchedRID: /GXJm9kUVEujz0nOeth/yb9A3Bl1/DcVkdS3kPlaZyXkABvhO7aBvplA
	4IpB7gNO1wHmmK+WQ44ZgUTtI4MiD7Ud2R7XKvn38Jb881FGn9nYUDvAr2Y/12Pmof2X7OSi65p
	3wbuggrm7NbSZc60NuTFTm2Y2SkL+f7OyDqSnYLe4u3nS+3EEDqCDl9vXDTLXUn7py4ufdkZvGS
	JtubGn7V+2TZ8bogGewp/HWNAj9uTBEHYItXXAwMVUBXy8OM3/P7uiVpnmLFj0lLwT367HfaBfL
	bsI68j49/Qn8y+r241EFcYZxWcTrjD/AoSI5EfiC8FMH3T6F77AmOfzKotTomO0yVK/5Lmcg7cf
	JQw9FsfOY118IB2Cc+ekeq05qUHxfKYHnHTy1mXviU6inwt536qqvWsAC6cQyIKHzIGoT63k9Fj
	UWr/w+Wjc2J836wPUqbVtTzN1rOECeZfoqf1EFwrcxrzwsv5uWfgivgcUPZOShgRC2KxiPIPcXu
	ILVCbaNYCBzzxsUnvGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyU2ZWOmuJUS2bgbJOZ434Bs2LPE1
	6PQlRNRYt/xlbxiNRr4VwoL73EnMmKtY96TOflNsVUJg8FOpuhb4uR0VkQ0Ed+K6O5Nt52KZcKn
	HH+X8D6mnFry3Gla2L7G8QVY2+K8FWDghTh72UNF5tKVli5Ka/fioJ9l4HjKIvPVW1z+lZ6ba/D
	5x6cp4vM1YF6AJbZT3DhdVcNYJgtuKBGekqUpI/NGWt0UYPArLR01iXQonE5hkn3eMMiodrC5dK
	YNaemG2qsXTmKbFFYpyEJCU4h4
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187559

From: Wang Mingyu <wangmy@fujitsu.com>

stdlib-mb-cur-max.patch
removed since it's included in 9.4.

Changelog:
==========
** Bug fixes
------------
  On GNU/Linux s390x and alpha, programs like 'cp' and 'ls' no longer
  fail on files with inode numbers that do not fit into 32 bits.

  'b2sum --check' will no longer read unallocated memory when
  presented with malformed checksum lines.

  'cp --parents' again succeeds when preserving mode for absolute directories.

  'cp --sparse=never' will avoid copy-on-write (reflinking) and copy offloading,
  to ensure no holes present in the destination copy.

  cksum again diagnoses read errors in its default CRC32 mode.

  'cksum --check' now ensures filenames with a leading backslash character
  are escaped appropriately in the status output.

  dd again supports more than two multipliers for numbers.
  Previously numbers of the form '1024x1024x32' gave "invalid number" errors.

  factor, numfmt, and tsort now diagnose read errors on the input.

  'install --strip' now supports installing to files with a leading hyphen.
  Previously such file names would have caused the strip process to fail.

  ls now shows symlinks specified on the command line that can't be traversed.
  Previously a "Too many levels of symbolic links" diagnostic was given.

  pinky, uptime, users, and who no longer misbehave on 32-bit GNU/Linux
  platforms like x86 and ARM where time_t was historically 32 bits.

  'pr --length=1 --double-space' no longer enters an infinite loop.

  shred again operates on Solaris when built for 64 bits.
  Previously it would have exited with a "getrandom: Invalid argument" error.

  tac now handles short reads on its input.  Previously it may have exited
  erroneously, especially with large input files with no separators.

  'uptime' no longer incorrectly prints "0 users" on OpenBSD,
  and is being built again on FreeBSD and Haiku.

  'wc -l' and 'cksum' no longer crash with an "Illegal instruction" error
  on x86 Linux kernels that disable XSAVE YMM.  This was seen on Xen VMs.

** Changes in behavior
-----------------------
  'cp -v' and 'mv -v' will no longer output a message for each file skipped
  due to -i, or -u.  Instead they only output this information with --debug.

  'cksum -b' no longer prints base64-encoded checksums.

  'mv dir x' now complains differently if x/dir is a nonempty directory.

** Improvements
-------------------
  cp, mv, and install now avoid copy_file_range on linux kernels before 5.3
  irrespective of which kernel version coreutils is built against,
  reinstating that behavior from coreutils-9.0.

  comm, cut, join, od, and uniq will now exit immediately upon receiving a
  write error, which is significant when reading large / unbounded inputs.

  split now uses more tuned access patterns for its potentially large input.
  This was seen to improve throughput by 5% when reading from SSD.

  split now supports a configurable $TMPDIR for handling any temporary files.

  tac now falls back to '/tmp' if a configured $TMPDIR is unavailable.

  'who -a' now displays the boot time on Alpine Linux, OpenBSD,
  Cygwin, Haiku, and some Android distributions

  'uptime' now succeeds on some Android distributions, and now counts
  VM saved/sleep time on GNU (Linux, Hurd, kFreeBSD), NetBSD, OpenBSD,
  Minix, and Cygwin.

  On GNU/Linux platforms where utmp-format files have 32-bit timestamps,
  pinky, uptime, and who can now work for times after the year 2038,
  so long as systemd is installed, you configure with a new, experimental
  option --enable-systemd, and you use the programs without file arguments.
  (For example, with systemd 'who /var/log/wtmp' does not work because
  systemd does not support the equivalent of /var/log/wtmp.)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../coreutils/stdlib-mb-cur-max.patch         | 33 -------------------
 .../{coreutils_9.3.bb => coreutils_9.4.bb}    |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patch
 rename meta/recipes-core/coreutils/{coreutils_9.3.bb => coreutils_9.4.bb} (98%)

diff --git a/meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patch b/meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patch
deleted file mode 100644
index 732fa5b6f2..0000000000
--- a/meta/recipes-core/coreutils/coreutils/stdlib-mb-cur-max.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ca6c179226864bff23f2b062518cf885bb42ce56 Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Thu, 27 Apr 2023 15:26:37 +0200
-Subject: [PATCH] stdlib: Fix error when cross-compiling.
-
-Reported by Pierre Labastie <pierre.labastie@neuf.fr> in
-<https://lists.gnu.org/archive/html/bug-gnulib/2023-04/msg00220.html>.
-
-* m4/stdlib_h.m4 (gl_STDLIB_H): Provide a 4th argument to AC_RUN_IFELSE.
----
- ChangeLog      | 7 +++++++
- m4/stdlib_h.m4 | 4 ++--
- 2 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/m4/stdlib_h.m4 b/m4/stdlib_h.m4
-index 3274ea4948..f47c1eb37b 100644
---- a/m4/stdlib_h.m4
-+++ b/m4/stdlib_h.m4
-@@ -66,7 +66,7 @@ int main ()
-   return result;
- }]])],
-           [gl_cv_macro_MB_CUR_MAX_good=yes],
--          [gl_cv_macro_MB_CUR_MAX_good=no]
-+          [gl_cv_macro_MB_CUR_MAX_good=no],
-           [:])
-       fi
-     ])
--- 
-2.34.1
-
diff --git a/meta/recipes-core/coreutils/coreutils_9.3.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
similarity index 98%
rename from meta/recipes-core/coreutils/coreutils_9.3.bb
rename to meta/recipes-core/coreutils/coreutils_9.4.bb
index ba38169f05..a998584248 100644
--- a/meta/recipes-core/coreutils/coreutils_9.3.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -16,11 +16,10 @@ inherit autotools gettext texinfo
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
-           file://stdlib-mb-cur-max.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "adbcfcfe899235b71e8768dcf07cd532520b7f54f9a8064843f8d199a904bbaa"
+SRC_URI[sha256sum] = "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 # 
-- 
2.34.1


