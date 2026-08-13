Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9D1C5DF6B
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 05:56:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12996.1786600551674333918
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 22:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=V73yqE/9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oSy/UdAK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ff9b0f126-51dac1bb-78ba-4a28-bd72-3321ffb5f333-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786600550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u0j9EroOVSF+fRTR75DalvaK8GOiwKO82W2nxWMxpok=;
	b=V73yqE/9cRE2R+BHe5E8Tn61L9CpVJQ7gQCPJQBX6OybaTAOF96CRRk2JxAzyFtj
	TYKKySjrPXqePXSvuQRIhN5gta1YlBT5ycpDPRn1i0d3h7CVUmBXNtA7V/oGBliaWF8
	IjBTlGV5NnlpqylVHmfz7o0vr/S8l+y2NOsejXIg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786600550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u0j9EroOVSF+fRTR75DalvaK8GOiwKO82W2nxWMxpok=;
	b=oSy/UdAK5OnaplmeuWK3ORGX9Dib7jrtVDb0yNZbTTo2iwIkAVCoFGsOu8CvGICI
	2CwSd6Mr/yiVV/h7Sr5afR8dqnBDysKcDnsg43tXbDwxe48q5MVI41t3DUDYT7sMuq/
	rUs43BTPvhrQasO1krWwlw0RtEECx7zuUs8qINCs=
Content-Type: multipart/mixed; boundary="===============2378001075974061096=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.5.0 SUCCEEDED
Message-ID: <0101019ff9b0f126-51dac1bb-78ba-4a28-bd72-3321ffb5f333-000000@us-west-2.amazonses.com>
Date: Thu, 13 Aug 2026 05:55:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.13-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 05:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243326

--===============2378001075974061096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rsync* to *3.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.4.4-3.5.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From e80bf8769d1c091525c39ae1ae76d5753fbf4782 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 13 Aug 2026 05:15:34 +0000
Subject: [PATCH] rsync: upgrade 3.4.4 -> 3.5.0

Source: NEWS.md

# NEWS for rsync 3.5.0 (13 Aug 2026)

## Changes in this version:

### Thanks!

This has been an extraordinary release developed over several months
and I'd like to thank everyone who has helped make it possible. The
volume of security issues we had to deal with would have been quite
overwhelming without the help that I've received.

I'm particularly grateful to Zen Dodd (Tao), Omar Elsayed (seks99x),
Will Sargeant, Paul Mackerras, Aleksa Sarai and Leonid Bugaev (buger)
who joined the rsync admins group helping to triage all the issues,
develop new tests, review PRs and helped develop the guidelines we used
for where to draw the line between a security issue and expected
behaviour (a surprisingly difficult thing to do in some cases). You've
all been a huge help and rsync is much better off for your assistance.

A big thank you also to Filipe Casal from Trail of Bits who worked with
us on the "Patch the Planet" program. Filipe provided a huge trove of
valuable tests and security reports.

Also a big thank you to Greg Kroah-Hartman for invaluable advice and
security reports and to Stuart Inglis for particularly high quality
bug reports and testing.

Many thanks to everyone who submitted bug reports, credits are listed
below against individual items.

Finally, thank you to everyone who joined in the discussion and
testing on the rsync-security mailing list, and to the rsync user
community for your patience in waiting for this release.

### SECURITY FIXES:

This release fixes 33 security issues found during a focused audit of rsync's
path handling and daemon protocol, a companion daemon-protocol fuzzing pass, and
reports from external researchers -- plus several robustness hardenings.  CVE
IDs were assigned by VulnCheck (CNA); the precise "introduced in" version ranges
accompany each advisory, and many are much narrower than "everything before
3.5.0".  Every fix ships with a regression test in the test suite that fails on
the unfixed tree.  Many thanks to the external researchers credited below.

Link following (CWE-59/61) -- a local user who controls a path component plants
a symlink that a privileged rsync then follows:

- CVE-2026-53802 (HIGH): Arbitrary file read / transfer-shaping via symlinked
  operator-supplied input files.  rsync followed attacker-planted symlinks in
  `--filter` merge files (including per-directory merges and `-C` `.cvsignore`),
  `--files-from` / `--include-from` / `--exclude-from`, and the client
  `--password-file` / daemon secrets file -- reading an arbitrary file as filter
  rules, or sending a victim file's contents as the daemon authentication
  response.  Operator-supplied paths are now resolved component-by-component with
  `openat(O_PATH|O_NOFOLLOW)`, allowing a symlink component only when it is owned
  by uid 0 or the effective uid.

- CVE-2026-53803 (HIGH): Arbitrary file write / privilege escalation via
  symlinked operator-supplied output paths -- `--log-file`,
  `--write-batch`/`--read-batch`

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...g-prototypes-to-function-declarations.patch | 18 +++++++++---------
 .../rsync/files/determism.patch                |  4 ++--
 .../rsync/files/makefile-no-rebuild.patch      |  6 +++---
 .../rsync/{rsync_3.4.4.bb => rsync_3.5.0.bb}   |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.4.4.bb => rsync_3.5.0.bb} (97%)

diff --git a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
index ede0238b2e..5aed93e458 100644
--- a/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
+++ b/meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
@@ -1,4 +1,4 @@
-From c05cc113f925bda645c8e51b83e9dc30b0543bad Mon Sep 17 00:00:00 2001
+From 64e62c659649593239ed39ed40a3ae689bf2d593 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 29 Aug 2022 19:53:28 -0700
 Subject: [PATCH] Add missing prototypes to function declarations
@@ -24,10 +24,10 @@ Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
  4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/checksum.c b/checksum.c
-index 24e46bf..6ae3178 100644
+index 4c91c2b..b3635a0 100644
 --- a/checksum.c
 +++ b/checksum.c
-@@ -778,7 +778,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
+@@ -796,7 +796,7 @@ static void verify_digest(struct name_num_item *nni, BOOL check_auth_list)
  }
  #endif
  
@@ -37,10 +37,10 @@ index 24e46bf..6ae3178 100644
  #if defined SUPPORT_XXH3 || defined USE_OPENSSL
  	struct name_num_item *nni;
 diff --git a/exclude.c b/exclude.c
-index 24de64f..a787488 100644
+index 7476f6a..b939a0c 100644
 --- a/exclude.c
 +++ b/exclude.c
-@@ -363,7 +363,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
+@@ -460,7 +460,7 @@ void implied_include_partial_string(const char *s_start, const char *s_end)
  	memcpy(partial_string_buf, s_start, partial_string_len);
  }
  
@@ -50,10 +50,10 @@ index 24de64f..a787488 100644
  	if (partial_string_buf) {
  		if (partial_string_len)
 diff --git a/log.c b/log.c
-index b948f16..afca81d 100644
+index 889b57b..19e5e98 100644
 --- a/log.c
 +++ b/log.c
-@@ -131,7 +131,7 @@ static void logit(int priority, const char *buf)
+@@ -140,7 +140,7 @@ static void logit(int priority, const char *buf)
  	}
  }
  
@@ -63,10 +63,10 @@ index b948f16..afca81d 100644
  	int options = LOG_PID;
  
 diff --git a/main.c b/main.c
-index 229a889..aa158ad 100644
+index 6050d0e..45722c4 100644
 --- a/main.c
 +++ b/main.c
-@@ -246,7 +246,7 @@ void read_del_stats(int f)
+@@ -250,7 +250,7 @@ void read_del_stats(int f)
  	stats.deleted_files += stats.deleted_specials = read_varint_bounded(f, 0, MAX_WIRE_DEL_STAT, "deleted_specials");
  }
  
diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
index a8fee5ba0a..2eea267bb2 100644
--- a/meta/recipes-devtools/rsync/files/determism.patch
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -1,4 +1,4 @@
-From 32852028e95cdf78d09f1bd867f3b46b4728f9e3 Mon Sep 17 00:00:00 2001
+From c4c9b52a864c3b9ff67771b9d881a78276448100 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 21 Feb 2021 09:45:48 +0000
 Subject: [PATCH] rsync: Fix a file sorting determinism issue
@@ -25,7 +25,7 @@ https://github.com/WayneD/rsync/commit/d3085f7add38a5cf833a0b31cb0637ff46c80f8d
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 0ba2d5c..b9c5438 100644
+index 91807d6..c18b4be 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -27,6 +27,11 @@ MKDIR_P=@MKDIR_P@
diff --git a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
index 914b50a7b7..4ff070ea3c 100644
--- a/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
+++ b/meta/recipes-devtools/rsync/files/makefile-no-rebuild.patch
@@ -1,4 +1,4 @@
-From 50ef5ccd9149cee27bae29e767ff1c2e76bdc879 Mon Sep 17 00:00:00 2001
+From bab7abb3c7c1c1db8ef6c3084c1ffb5152f5bf1e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 12 Apr 2016 15:51:54 +0100
 Subject: [PATCH] rsync: remove upstream's rebuild logic
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 54 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 79060b3..0ba2d5c 100644
+index 801e864..91807d6 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -200,60 +200,6 @@ conf: configure.sh config.h.in
+@@ -265,60 +265,6 @@ conf: configure.sh config.h.in
  .PHONY: gen
  gen: conf proto.h man git-version.h
  
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.4.bb b/meta/recipes-devtools/rsync/rsync_3.5.0.bb
similarity index 97%
rename from meta/recipes-devtools/rsync/rsync_3.4.4.bb
rename to meta/recipes-devtools/rsync/rsync_3.5.0.bb
index fa9a61778f..d9a4884d96 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.4.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.5.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            "
-SRC_URI[sha256sum] = "bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96"
+SRC_URI[sha256sum] = "c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33"
 
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-- 
2.47.1


--===============2378001075974061096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/rsync: SRC_URI changed from "https://download.samba.org/pub/rsync/src/rsync-3.4.4.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch" to "https://download.samba.org/pub/rsync/src/rsync-3.5.0.tar.gz file://rsyncd.conf file://makefile-no-rebuild.patch file://determism.patch file://0001-Add-missing-prototypes-to-function-declarations.patch"
packages/x86-64-v3-poky-linux/rsync: PKGV changed from 3.4.4 [default] to 3.5.0 [default]
packages/x86-64-v3-poky-linux/rsync: PV changed from "3.4.4" to "3.5.0"
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1436000 to 1633480 (+14%)
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGV changed from 3.4.4 [default] to 3.5.0 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PV changed from "3.4.4" to "3.5.0"
packages/x86-64-v3-poky-linux/rsync/rsync-dev: PKGV changed from 3.4.4 [default] to 3.5.0 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-dev: PV changed from "3.4.4" to "3.5.0"
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PKGSIZE changed from 300231 to 325256 (+8%)
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PKGV changed from 3.4.4 [default] to 3.5.0 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-doc: PV changed from "3.4.4" to "3.5.0"
packages/x86-64-v3-poky-linux/rsync/rsync-locale: PKGV changed from 3.4.4 [default] to 3.5.0 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-locale: PV changed from "3.4.4" to "3.5.0"
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGSIZE changed from 1309251 to 1570067 (+20%)
packages/x86-64-v3-poky-linux/rsync/rsync-src: FILELIST: removed "/usr/src/debug/rsync/3.4.4/checksum.c /usr/src/debug/rsync/3.4.4/acls.c /usr/src/debug/rsync/3.4.4/compat.c /usr/src/debug/rsync/3.4.4/lib/sysacls.c /usr/src/debug/rsync/3.4.4/main.c /usr/src/debug/rsync/3.4.4/pipe.c /usr/src/debug/rsync/3.4.4/byteorder.h /usr/src/debug/rsync/3.4.4/hlink.c /usr/src/debug/rsync/3.4.4/match.c /usr/src/debug/rsync/3.4.4/rsync.c /usr/src/debug/rsync/3.4.4/daemon-parm.h /usr/src/debug/rsync/3.4.4/socket.c /usr/src/debug/rsync/3.4.4/lib/sysacls.h /usr/src/debug/rsync/3.4.4/token.c /usr/src/debug/rsync/3.4.4/usage.c /usr/src/debug/rsync/3.4.4/util1.c /usr/src/debug/rsync/3.4.4/flist.c /usr/src/debug/rsync/3.4.4/sender.c /usr/src/debug/rsync/3.4.4/util2.c /usr/src/debug/rsync/3.4.4/exclude.c /usr/src/debug/rsync/3.4.4/lib/pool_alloc.c /usr/src/debug/rsync/3.4.4/chmod.c /usr/src/debug/rsync/3.4.4/lib/pool_alloc.h /usr/src/debug/rsync/3.4.4/io.h /usr/src/debug/rsync/3.4.4/clientname.c /usr/src/d
 ebug/rsync/3.4.4/cleanup.c /usr/src/debug/rsync/3.4.4/io.c /usr/src/debug/rsync/3.4.4/lib/sysxattrs.h /usr/src/debug/rsync/3.4.4/connection.c /usr/src/debug/rsync/3.4.4/authenticate.c /usr/src/debug/rsync/3.4.4/help-rsyncd.h /usr/src/debug/rsync/3.4.4/lib/snprintf.c /usr/src/debug/rsync/3.4.4/syscall.c /usr/src/debug/rsync/3.4.4/lib/sysxattrs.c /usr/src/debug/rsync/3.4.4/hashtable.c /usr/src/debug/rsync/3.4.4/ifuncs.h /usr/src/debug/rsync/3.4.4/itypes.h /usr/src/debug/rsync/3.4.4/backup.c /usr/src/debug/rsync/3.4.4/access.c /usr/src/debug/rsync/3.4.4/generator.c /usr/src/debug/rsync/3.4.4/params.c /usr/src/debug/rsync/3.4.4/lib/mdfour.c /usr/src/debug/rsync/3.4.4/progress.c /usr/src/debug/rsync/3.4.4/xattrs.c /usr/src/debug/rsync/3.4.4/receiver.c /usr/src/debug/rsync/3.4.4/lib/permstring.c /usr/src/debug/rsync/3.4.4/fileio.c /usr/src/debug/rsync/3.4.4/lib/permstring.h /usr/src/debug/rsync/3.4.4/lib/wildmatch.h /usr/src/debug/rsync/3.4.4/lib/mdigest.h /usr/src/debug/rsync/3.4.4/help-
 rsync.h /usr/src/debug/rsync/3.4.4/lib/md5.c /usr/src/debug/rsync/3.4.4/android.c /usr/src/debug/rsync/3.4.4/log.c /usr/src/debug/rsync/3.4.4/lib/wildmatch.c /usr/src/debug/rsync/3.4.4/loadparm.c /usr/src/debug/rsync/3.4.4/rsync.h /usr/src/debug/rsync/3.4.4/uidlist.c /usr/src/debug/rsync/3.4.4/inums.h /usr/src/debug/rsync/3.4.4/clientserver.c /usr/src/debug/rsync/3.4.4/delete.c /usr/src/debug/rsync/3.4.4/proto.h /usr/src/debug/rsync/3.4.4/lib/compat.c /usr/src/debug/rsync/3.4.4/options.c /usr/src/debug/rsync/3.4.4/batch.c", added "/usr/src/debug/rsync/3.5.0/checksum.c /usr/src/debug/rsync/3.5.0/acls.c /usr/src/debug/rsync/3.5.0/compat.c /usr/src/debug/rsync/3.5.0/lib/sysacls.c /usr/src/debug/rsync/3.5.0/main.c /usr/src/debug/rsync/3.5.0/lib/acl.c /usr/src/debug/rsync/3.5.0/byteorder.h /usr/src/debug/rsync/3.5.0/pipe.c /usr/src/debug/rsync/3.5.0/socket.c /usr/src/debug/rsync/3.5.0/daemon-parm.h /usr/src/debug/rsync/3.5.0/lib/acl.h /usr/src/debug/rsync/3.5.0/lib/sysacls.h /usr/src/deb
 ug/rsync/3.5.0/proto.h /usr/src/debug/rsync/3.5.0/inums.h /usr/src/debug/rsync/3.5.0/sender.c /usr/src/debug/rsync/3.5.0/exclude.c /usr/src/debug/rsync/3.5.0/lib/pool_alloc.c /usr/src/debug/rsync/3.5.0/log.c /usr/src/debug/rsync/3.5.0/lib/pool_alloc.h /usr/src/debug/rsync/3.5.0/clientname.c /usr/src/debug/rsync/3.5.0/batch.c /usr/src/debug/rsync/3.5.0/cleanup.c /usr/src/debug/rsync/3.5.0/hlink.c /usr/src/debug/rsync/3.5.0/match.c /usr/src/debug/rsync/3.5.0/rsync.c /usr/src/debug/rsync/3.5.0/token.c /usr/src/debug/rsync/3.5.0/usage.c /usr/src/debug/rsync/3.5.0/util1.c /usr/src/debug/rsync/3.5.0/lib/sysxattrs.h /usr/src/debug/rsync/3.5.0/util2.c /usr/src/debug/rsync/3.5.0/connection.c /usr/src/debug/rsync/3.5.0/authenticate.c /usr/src/debug/rsync/3.5.0/help-rsyncd.h /usr/src/debug/rsync/3.5.0/lib/snprintf.c /usr/src/debug/rsync/3.5.0/syscall.c /usr/src/debug/rsync/3.5.0/lib/sysxattrs.c /usr/src/debug/rsync/3.5.0/chmod.c /usr/src/debug/rsync/3.5.0/ifuncs.h /usr/src/debug/rsync/3.5.0/it
 ypes.h /usr/src/debug/rsync/3.5.0/backup.c /usr/src/debug/rsync/3.5.0/access.c /usr/src/debug/rsync/3.5.0/generator.c /usr/src/debug/rsync/3.5.0/params.c /usr/src/debug/rsync/3.5.0/lib/mdfour.c /usr/src/debug/rsync/3.5.0/progress.c /usr/src/debug/rsync/3.5.0/xattrs.c /usr/src/debug/rsync/3.5.0/receiver.c /usr/src/debug/rsync/3.5.0/lib/permstring.c /usr/src/debug/rsync/3.5.0/hashtable.c /usr/src/debug/rsync/3.5.0/fileio.c /usr/src/debug/rsync/3.5.0/lib/permstring.h /usr/src/debug/rsync/3.5.0/lib/wildmatch.h /usr/src/debug/rsync/3.5.0/lib/mdigest.h /usr/src/debug/rsync/3.5.0/help-rsync.h /usr/src/debug/rsync/3.5.0/lib/md5.c /usr/src/debug/rsync/3.5.0/lib/wildmatch.c /usr/src/debug/rsync/3.5.0/loadparm.c /usr/src/debug/rsync/3.5.0/uidlist.c /usr/src/debug/rsync/3.5.0/clientserver.c /usr/src/debug/rsync/3.5.0/delete.c /usr/src/debug/rsync/3.5.0/rsync.h /usr/src/debug/rsync/3.5.0/lib/compat.c /usr/src/debug/rsync/3.5.0/io.h /usr/src/debug/rsync/3.5.0/options.c /usr/src/debug/rsync/3.5.0/
 flist.c /usr/src/debug/rsync/3.5.0/io.c"
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGV changed from 3.4.4 [default] to 3.5.0 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-src: PV changed from "3.4.4" to "3.5.0"
packages/x86-64-v3-poky-linux/rsync/rsync-staticdev: PKGV changed from 3.4.4 [default] to 3.5.0 [default]
packages/x86-64-v3-poky-linux/rsync/rsync-staticdev: PV changed from "3.4.4" to "3.5.0"
packages/x86-64-v3-poky-linux/rsync/rsync: PKGSIZE changed from 550914 to 610203 (+11%)
packages/x86-64-v3-poky-linux/rsync/rsync: PKGV changed from 3.4.4 [default] to 3.5.0 [default]
packages/x86-64-v3-poky-linux/rsync/rsync: PV changed from "3.4.4" to "3.5.0"

--===============2378001075974061096==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.4.4-3.5.0.patch"

RnJvbSBlODBiZjg3NjlkMWMwOTE1MjVjMzlhZTFhZTc2ZDU3NTNmYmY0NzgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTMgQXVnIDIwMjYgMDU6MTU6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
c3luYzogdXBncmFkZSAzLjQuNCAtPiAzLjUuMAoKU291cmNlOiBORVdTLm1kCgojIE5FV1MgZm9y
IHJzeW5jIDMuNS4wICgxMyBBdWcgMjAyNikKCiMjIENoYW5nZXMgaW4gdGhpcyB2ZXJzaW9uOgoK
IyMjIFRoYW5rcyEKClRoaXMgaGFzIGJlZW4gYW4gZXh0cmFvcmRpbmFyeSByZWxlYXNlIGRldmVs
b3BlZCBvdmVyIHNldmVyYWwgbW9udGhzCmFuZCBJJ2QgbGlrZSB0byB0aGFuayBldmVyeW9uZSB3
aG8gaGFzIGhlbHBlZCBtYWtlIGl0IHBvc3NpYmxlLiBUaGUKdm9sdW1lIG9mIHNlY3VyaXR5IGlz
c3VlcyB3ZSBoYWQgdG8gZGVhbCB3aXRoIHdvdWxkIGhhdmUgYmVlbiBxdWl0ZQpvdmVyd2hlbG1p
bmcgd2l0aG91dCB0aGUgaGVscCB0aGF0IEkndmUgcmVjZWl2ZWQuCgpJJ20gcGFydGljdWxhcmx5
IGdyYXRlZnVsIHRvIFplbiBEb2RkIChUYW8pLCBPbWFyIEVsc2F5ZWQgKHNla3M5OXgpLApXaWxs
IFNhcmdlYW50LCBQYXVsIE1hY2tlcnJhcywgQWxla3NhIFNhcmFpIGFuZCBMZW9uaWQgQnVnYWV2
IChidWdlcikKd2hvIGpvaW5lZCB0aGUgcnN5bmMgYWRtaW5zIGdyb3VwIGhlbHBpbmcgdG8gdHJp
YWdlIGFsbCB0aGUgaXNzdWVzLApkZXZlbG9wIG5ldyB0ZXN0cywgcmV2aWV3IFBScyBhbmQgaGVs
cGVkIGRldmVsb3AgdGhlIGd1aWRlbGluZXMgd2UgdXNlZApmb3Igd2hlcmUgdG8gZHJhdyB0aGUg
bGluZSBiZXR3ZWVuIGEgc2VjdXJpdHkgaXNzdWUgYW5kIGV4cGVjdGVkCmJlaGF2aW91ciAoYSBz
dXJwcmlzaW5nbHkgZGlmZmljdWx0IHRoaW5nIHRvIGRvIGluIHNvbWUgY2FzZXMpLiBZb3UndmUK
YWxsIGJlZW4gYSBodWdlIGhlbHAgYW5kIHJzeW5jIGlzIG11Y2ggYmV0dGVyIG9mZiBmb3IgeW91
ciBhc3Npc3RhbmNlLgoKQSBiaWcgdGhhbmsgeW91IGFsc28gdG8gRmlsaXBlIENhc2FsIGZyb20g
VHJhaWwgb2YgQml0cyB3aG8gd29ya2VkIHdpdGgKdXMgb24gdGhlICJQYXRjaCB0aGUgUGxhbmV0
IiBwcm9ncmFtLiBGaWxpcGUgcHJvdmlkZWQgYSBodWdlIHRyb3ZlIG9mCnZhbHVhYmxlIHRlc3Rz
IGFuZCBzZWN1cml0eSByZXBvcnRzLgoKQWxzbyBhIGJpZyB0aGFuayB5b3UgdG8gR3JlZyBLcm9h
aC1IYXJ0bWFuIGZvciBpbnZhbHVhYmxlIGFkdmljZSBhbmQKc2VjdXJpdHkgcmVwb3J0cyBhbmQg
dG8gU3R1YXJ0IEluZ2xpcyBmb3IgcGFydGljdWxhcmx5IGhpZ2ggcXVhbGl0eQpidWcgcmVwb3J0
cyBhbmQgdGVzdGluZy4KCk1hbnkgdGhhbmtzIHRvIGV2ZXJ5b25lIHdobyBzdWJtaXR0ZWQgYnVn
IHJlcG9ydHMsIGNyZWRpdHMgYXJlIGxpc3RlZApiZWxvdyBhZ2FpbnN0IGluZGl2aWR1YWwgaXRl
bXMuCgpGaW5hbGx5LCB0aGFuayB5b3UgdG8gZXZlcnlvbmUgd2hvIGpvaW5lZCBpbiB0aGUgZGlz
Y3Vzc2lvbiBhbmQKdGVzdGluZyBvbiB0aGUgcnN5bmMtc2VjdXJpdHkgbWFpbGluZyBsaXN0LCBh
bmQgdG8gdGhlIHJzeW5jIHVzZXIKY29tbXVuaXR5IGZvciB5b3VyIHBhdGllbmNlIGluIHdhaXRp
bmcgZm9yIHRoaXMgcmVsZWFzZS4KCiMjIyBTRUNVUklUWSBGSVhFUzoKClRoaXMgcmVsZWFzZSBm
aXhlcyAzMyBzZWN1cml0eSBpc3N1ZXMgZm91bmQgZHVyaW5nIGEgZm9jdXNlZCBhdWRpdCBvZiBy
c3luYydzCnBhdGggaGFuZGxpbmcgYW5kIGRhZW1vbiBwcm90b2NvbCwgYSBjb21wYW5pb24gZGFl
bW9uLXByb3RvY29sIGZ1enppbmcgcGFzcywgYW5kCnJlcG9ydHMgZnJvbSBleHRlcm5hbCByZXNl
YXJjaGVycyAtLSBwbHVzIHNldmVyYWwgcm9idXN0bmVzcyBoYXJkZW5pbmdzLiAgQ1ZFCklEcyB3
ZXJlIGFzc2lnbmVkIGJ5IFZ1bG5DaGVjayAoQ05BKTsgdGhlIHByZWNpc2UgImludHJvZHVjZWQg
aW4iIHZlcnNpb24gcmFuZ2VzCmFjY29tcGFueSBlYWNoIGFkdmlzb3J5LCBhbmQgbWFueSBhcmUg
bXVjaCBuYXJyb3dlciB0aGFuICJldmVyeXRoaW5nIGJlZm9yZQozLjUuMCIuICBFdmVyeSBmaXgg
c2hpcHMgd2l0aCBhIHJlZ3Jlc3Npb24gdGVzdCBpbiB0aGUgdGVzdCBzdWl0ZSB0aGF0IGZhaWxz
IG9uCnRoZSB1bmZpeGVkIHRyZWUuICBNYW55IHRoYW5rcyB0byB0aGUgZXh0ZXJuYWwgcmVzZWFy
Y2hlcnMgY3JlZGl0ZWQgYmVsb3cuCgpMaW5rIGZvbGxvd2luZyAoQ1dFLTU5LzYxKSAtLSBhIGxv
Y2FsIHVzZXIgd2hvIGNvbnRyb2xzIGEgcGF0aCBjb21wb25lbnQgcGxhbnRzCmEgc3ltbGluayB0
aGF0IGEgcHJpdmlsZWdlZCByc3luYyB0aGVuIGZvbGxvd3M6CgotIENWRS0yMDI2LTUzODAyIChI
SUdIKTogQXJiaXRyYXJ5IGZpbGUgcmVhZCAvIHRyYW5zZmVyLXNoYXBpbmcgdmlhIHN5bWxpbmtl
ZAogIG9wZXJhdG9yLXN1cHBsaWVkIGlucHV0IGZpbGVzLiAgcnN5bmMgZm9sbG93ZWQgYXR0YWNr
ZXItcGxhbnRlZCBzeW1saW5rcyBpbgogIGAtLWZpbHRlcmAgbWVyZ2UgZmlsZXMgKGluY2x1ZGlu
ZyBwZXItZGlyZWN0b3J5IG1lcmdlcyBhbmQgYC1DYCBgLmN2c2lnbm9yZWApLAogIGAtLWZpbGVz
LWZyb21gIC8gYC0taW5jbHVkZS1mcm9tYCAvIGAtLWV4Y2x1ZGUtZnJvbWAsIGFuZCB0aGUgY2xp
ZW50CiAgYC0tcGFzc3dvcmQtZmlsZWAgLyBkYWVtb24gc2VjcmV0cyBmaWxlIC0tIHJlYWRpbmcg
YW4gYXJiaXRyYXJ5IGZpbGUgYXMgZmlsdGVyCiAgcnVsZXMsIG9yIHNlbmRpbmcgYSB2aWN0aW0g
ZmlsZSdzIGNvbnRlbnRzIGFzIHRoZSBkYWVtb24gYXV0aGVudGljYXRpb24KICByZXNwb25zZS4g
IE9wZXJhdG9yLXN1cHBsaWVkIHBhdGhzIGFyZSBub3cgcmVzb2x2ZWQgY29tcG9uZW50LWJ5LWNv
bXBvbmVudCB3aXRoCiAgYG9wZW5hdChPX1BBVEh8T19OT0ZPTExPVylgLCBhbGxvd2luZyBhIHN5
bWxpbmsgY29tcG9uZW50IG9ubHkgd2hlbiBpdCBpcyBvd25lZAogIGJ5IHVpZCAwIG9yIHRoZSBl
ZmZlY3RpdmUgdWlkLgoKLSBDVkUtMjAyNi01MzgwMyAoSElHSCk6IEFyYml0cmFyeSBmaWxlIHdy
aXRlIC8gcHJpdmlsZWdlIGVzY2FsYXRpb24gdmlhCiAgc3ltbGlua2VkIG9wZXJhdG9yLXN1cHBs
aWVkIG91dHB1dCBwYXRocyAtLSBgLS1sb2ctZmlsZWAsCiAgYC0td3JpdGUtYmF0Y2hgL2AtLXJl
YWQtYmF0Y2hgCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hhcmFj
dGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50IHRv
IHRoZSBBVUggZW1haWxdCi0tLQogLi4uZy1wcm90b3R5cGVzLXRvLWZ1bmN0aW9uLWRlY2xhcmF0
aW9ucy5wYXRjaCB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogLi4uL3JzeW5jL2ZpbGVzL2RldGVy
bWlzbS5wYXRjaCAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIC4uLi9yc3luYy9maWxlcy9tYWtl
ZmlsZS1uby1yZWJ1aWxkLnBhdGNoICAgICAgfCAgNiArKystLS0KIC4uLi9yc3luYy97cnN5bmNf
My40LjQuYmIgPT4gcnN5bmNfMy41LjAuYmJ9ICAgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnN5bmMve3JzeW5jXzMuNC40LmJiID0+IHJzeW5jXzMuNS4wLmJifSAoOTclKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxlcy8wMDAxLUFkZC1taXNz
aW5nLXByb3RvdHlwZXMtdG8tZnVuY3Rpb24tZGVjbGFyYXRpb25zLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzLzAwMDEtQWRkLW1pc3NpbmctcHJvdG90eXBlcy10by1m
dW5jdGlvbi1kZWNsYXJhdGlvbnMucGF0Y2gKaW5kZXggZWRlMDIzOGIyZS4uNWFlZDkzZTQ1OCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzLzAwMDEtQWRkLW1p
c3NpbmctcHJvdG90eXBlcy10by1mdW5jdGlvbi1kZWNsYXJhdGlvbnMucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzLzAwMDEtQWRkLW1pc3NpbmctcHJvdG90eXBl
cy10by1mdW5jdGlvbi1kZWNsYXJhdGlvbnMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMw
NWNjMTEzZjkyNWJkYTY0NWM4ZTUxYjgzZTlkYzMwYjA1NDNiYWQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDY0ZTYyYzY1OTY0OTU5MzIzOWVkMzllZDQwYTNhZTY4OWJmMmQ1OTMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogTW9uLCAyOSBBdWcgMjAyMiAxOTo1MzoyOCAtMDcwMAogU3ViamVjdDogW1BBVENI
XSBBZGQgbWlzc2luZyBwcm90b3R5cGVzIHRvIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucwpAQCAtMjQs
MTAgKzI0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFyY2hhbmEgUG9sYW1wYWxsaSA8YXJjaGFuYS5w
b2xhbXBhbGxpQHdpbmRyaXZlci5jb20+CiAgNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jaGVja3N1bS5jIGIvY2hlY2tzdW0u
YwotaW5kZXggMjRlNDZiZi4uNmFlMzE3OCAxMDA2NDQKK2luZGV4IDRjOTFjMmIuLmIzNjM1YTAg
MTAwNjQ0CiAtLS0gYS9jaGVja3N1bS5jCiArKysgYi9jaGVja3N1bS5jCi1AQCAtNzc4LDcgKzc3
OCw3IEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9kaWdlc3Qoc3RydWN0IG5hbWVfbnVtX2l0ZW0gKm5u
aSwgQk9PTCBjaGVja19hdXRoX2xpc3QpCitAQCAtNzk2LDcgKzc5Niw3IEBAIHN0YXRpYyB2b2lk
IHZlcmlmeV9kaWdlc3Qoc3RydWN0IG5hbWVfbnVtX2l0ZW0gKm5uaSwgQk9PTCBjaGVja19hdXRo
X2xpc3QpCiAgfQogICNlbmRpZgogIApAQCAtMzcsMTAgKzM3LDEwIEBAIGluZGV4IDI0ZTQ2YmYu
LjZhZTMxNzggMTAwNjQ0CiAgI2lmIGRlZmluZWQgU1VQUE9SVF9YWEgzIHx8IGRlZmluZWQgVVNF
X09QRU5TU0wKICAJc3RydWN0IG5hbWVfbnVtX2l0ZW0gKm5uaTsKIGRpZmYgLS1naXQgYS9leGNs
dWRlLmMgYi9leGNsdWRlLmMKLWluZGV4IDI0ZGU2NGYuLmE3ODc0ODggMTAwNjQ0CitpbmRleCA3
NDc2ZjZhLi5iOTM5YTBjIDEwMDY0NAogLS0tIGEvZXhjbHVkZS5jCiArKysgYi9leGNsdWRlLmMK
LUBAIC0zNjMsNyArMzYzLDcgQEAgdm9pZCBpbXBsaWVkX2luY2x1ZGVfcGFydGlhbF9zdHJpbmco
Y29uc3QgY2hhciAqc19zdGFydCwgY29uc3QgY2hhciAqc19lbmQpCitAQCAtNDYwLDcgKzQ2MCw3
IEBAIHZvaWQgaW1wbGllZF9pbmNsdWRlX3BhcnRpYWxfc3RyaW5nKGNvbnN0IGNoYXIgKnNfc3Rh
cnQsIGNvbnN0IGNoYXIgKnNfZW5kKQogIAltZW1jcHkocGFydGlhbF9zdHJpbmdfYnVmLCBzX3N0
YXJ0LCBwYXJ0aWFsX3N0cmluZ19sZW4pOwogIH0KICAKQEAgLTUwLDEwICs1MCwxMCBAQCBpbmRl
eCAyNGRlNjRmLi5hNzg3NDg4IDEwMDY0NAogIAlpZiAocGFydGlhbF9zdHJpbmdfYnVmKSB7CiAg
CQlpZiAocGFydGlhbF9zdHJpbmdfbGVuKQogZGlmZiAtLWdpdCBhL2xvZy5jIGIvbG9nLmMKLWlu
ZGV4IGI5NDhmMTYuLmFmY2E4MWQgMTAwNjQ0CitpbmRleCA4ODliNTdiLi4xOWU1ZTk4IDEwMDY0
NAogLS0tIGEvbG9nLmMKICsrKyBiL2xvZy5jCi1AQCAtMTMxLDcgKzEzMSw3IEBAIHN0YXRpYyB2
b2lkIGxvZ2l0KGludCBwcmlvcml0eSwgY29uc3QgY2hhciAqYnVmKQorQEAgLTE0MCw3ICsxNDAs
NyBAQCBzdGF0aWMgdm9pZCBsb2dpdChpbnQgcHJpb3JpdHksIGNvbnN0IGNoYXIgKmJ1ZikKICAJ
fQogIH0KICAKQEAgLTYzLDEwICs2MywxMCBAQCBpbmRleCBiOTQ4ZjE2Li5hZmNhODFkIDEwMDY0
NAogIAlpbnQgb3B0aW9ucyA9IExPR19QSUQ7CiAgCiBkaWZmIC0tZ2l0IGEvbWFpbi5jIGIvbWFp
bi5jCi1pbmRleCAyMjlhODg5Li5hYTE1OGFkIDEwMDY0NAoraW5kZXggNjA1MGQwZS4uNDU3MjJj
NCAxMDA2NDQKIC0tLSBhL21haW4uYwogKysrIGIvbWFpbi5jCi1AQCAtMjQ2LDcgKzI0Niw3IEBA
IHZvaWQgcmVhZF9kZWxfc3RhdHMoaW50IGYpCitAQCAtMjUwLDcgKzI1MCw3IEBAIHZvaWQgcmVh
ZF9kZWxfc3RhdHMoaW50IGYpCiAgCXN0YXRzLmRlbGV0ZWRfZmlsZXMgKz0gc3RhdHMuZGVsZXRl
ZF9zcGVjaWFscyA9IHJlYWRfdmFyaW50X2JvdW5kZWQoZiwgMCwgTUFYX1dJUkVfREVMX1NUQVQs
ICJkZWxldGVkX3NwZWNpYWxzIik7CiAgfQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JzeW5jL2ZpbGVzL2RldGVybWlzbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yc3luYy9maWxlcy9kZXRlcm1pc20ucGF0Y2gKaW5kZXggYThmZWU1YmEwYS4uMmVlYTI2N2Ji
MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzL2RldGVybWlz
bS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvZmlsZXMvZGV0ZXJtaXNt
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMjg1MjAyOGU5NWNkZjc4ZDA5ZjFiZDg2N2Yz
YjQ2YjQ3MjhmOWUzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNGM5YjUyYTg2NGMz
YjlmZjY3NzcxYjlkODgxYTc4Mjc2NDQ4MTAwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBE
YXRlOiBTdW4sIDIxIEZlYiAyMDIxIDA5OjQ1OjQ4ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJz
eW5jOiBGaXggYSBmaWxlIHNvcnRpbmcgZGV0ZXJtaW5pc20gaXNzdWUKQEAgLTI1LDcgKzI1LDcg
QEAgaHR0cHM6Ly9naXRodWIuY29tL1dheW5lRC9yc3luYy9jb21taXQvZDMwODVmN2FkZDM4YTVj
ZjgzM2EwYjMxY2IwNjM3ZmY0NmM4MGY4ZAogIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKIAogZGlmZiAtLWdpdCBhL01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWluZGV4IDBiYTJk
NWMuLmI5YzU0MzggMTAwNjQ0CitpbmRleCA5MTgwN2Q2Li5jMThiNGJlIDEwMDY0NAogLS0tIGEv
TWFrZWZpbGUuaW4KICsrKyBiL01ha2VmaWxlLmluCiBAQCAtMjcsNiArMjcsMTEgQEAgTUtESVJf
UD1ATUtESVJfUEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9maWxl
cy9tYWtlZmlsZS1uby1yZWJ1aWxkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5j
L2ZpbGVzL21ha2VmaWxlLW5vLXJlYnVpbGQucGF0Y2gKaW5kZXggOTE0YjUwYTdiNy4uNGZmMDcw
ZWEzYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2ZpbGVzL21ha2Vm
aWxlLW5vLXJlYnVpbGQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL2Zp
bGVzL21ha2VmaWxlLW5vLXJlYnVpbGQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDUwZWY1
Y2NkOTE0OWNlZTI3YmFlMjllNzY3ZmYxYzJlNzZiZGM4NzkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGJhYjdhYmIzYzdjMWMxZGI4ZWY2YzMwODRjMWZmYjUxNTJmNWJmMWUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwu
Y29tPgogRGF0ZTogVHVlLCAxMiBBcHIgMjAxNiAxNTo1MTo1NCArMDEwMAogU3ViamVjdDogW1BB
VENIXSByc3luYzogcmVtb3ZlIHVwc3RyZWFtJ3MgcmVidWlsZCBsb2dpYwpAQCAtMTMsMTAgKzEz
LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDU0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZp
bGUuaW4gYi9NYWtlZmlsZS5pbgotaW5kZXggNzkwNjBiMy4uMGJhMmQ1YyAxMDA2NDQKK2luZGV4
IDgwMWU4NjQuLjkxODA3ZDYgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5pbgogKysrIGIvTWFrZWZp
bGUuaW4KLUBAIC0yMDAsNjAgKzIwMCw2IEBAIGNvbmY6IGNvbmZpZ3VyZS5zaCBjb25maWcuaC5p
bgorQEAgLTI2NSw2MCArMjY1LDYgQEAgY29uZjogY29uZmlndXJlLnNoIGNvbmZpZy5oLmluCiAg
LlBIT05ZOiBnZW4KICBnZW46IGNvbmYgcHJvdG8uaCBtYW4gZ2l0LXZlcnNpb24uaAogIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuNC40LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuNS4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18zLjQuNC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzMuNS4wLmJiCmlu
ZGV4IGZhOWE2MTc3OGYuLmQ5YTQ4ODRkOTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9yc3luYy9yc3luY18zLjQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5
bmMvcnN5bmNfMy41LjAuYmIKQEAgLTE2LDcgKzE2LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Rv
d25sb2FkLnNhbWJhLm9yZy9wdWIvJHtCUE59L3NyYy8ke0JQfS50YXIuZ3ogXAogICAgICAgICAg
ICBmaWxlOi8vZGV0ZXJtaXNtLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLW1p
c3NpbmctcHJvdG90eXBlcy10by1mdW5jdGlvbi1kZWNsYXJhdGlvbnMucGF0Y2ggXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmQ4OGNmODJmYTY1M2RhMzIzMTRmYjIyOTEz
NjQwN2M1YzkwZjgwZDE3NThkOGY0YjA5MTc2Nzg3N2Q4ZmE5NiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjN2ZmZDFlZjY1M2U5OTU0MGY2NjFlNDdjYjAwYjdmOWNhZDFlZTZiOTcyMzk5YjE2Zjkz
ZDY3MjY1NmUwZDMzIgogCiAjIE91dC1vZi10cmVlIGJ1aWxkcyBkb24ndCBpbnN0YWxsIHRoZSBk
b2N1bWVudGF0aW9uIGN1cnJlbnRseQogIyBodHRwczovL2dpdGh1Yi5jb20vUnN5bmNQcm9qZWN0
L3JzeW5jL2lzc3Vlcy84NDYKLS0gCjIuNDcuMQoK

--===============2378001075974061096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1436000 to 1633480 (+14%)
packages/x86-64-v3-poky-linux/rsync/rsync-src: PKGSIZE changed from 1309251 to 1570067 (+20%)
packages/x86-64-v3-poky-linux/rsync/rsync: PKGSIZE changed from 550914 to 610203 (+11%)

--===============2378001075974061096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="rsync-changelog.txt"

Changelog for rsync: 3.4.4 -> 3.5.0
Source: NEWS.md

# NEWS for rsync 3.5.0 (13 Aug 2026)

## Changes in this version:

### Thanks!

This has been an extraordinary release developed over several months
and I'd like to thank everyone who has helped make it possible. The
volume of security issues we had to deal with would have been quite
overwhelming without the help that I've received.

I'm particularly grateful to Zen Dodd (Tao), Omar Elsayed (seks99x),
Will Sargeant, Paul Mackerras, Aleksa Sarai and Leonid Bugaev (buger)
who joined the rsync admins group helping to triage all the issues,
develop new tests, review PRs and helped develop the guidelines we used
for where to draw the line between a security issue and expected
behaviour (a surprisingly difficult thing to do in some cases). You've
all been a huge help and rsync is much better off for your assistance.

A big thank you also to Filipe Casal from Trail of Bits who worked with
us on the "Patch the Planet" program. Filipe provided a huge trove of
valuable tests and security reports.

Also a big thank you to Greg Kroah-Hartman for invaluable advice and
security reports and to Stuart Inglis for particularly high quality
bug reports and testing.

Many thanks to everyone who submitted bug reports, credits are listed
below against individual items.

Finally, thank you to everyone who joined in the discussion and
testing on the rsync-security mailing list, and to the rsync user
community for your patience in waiting for this release.

### SECURITY FIXES:

This release fixes 33 security issues found during a focused audit of rsync's
path handling and daemon protocol, a companion daemon-protocol fuzzing pass, and
reports from external researchers -- plus several robustness hardenings.  CVE
IDs were assigned by VulnCheck (CNA); the precise "introduced in" version ranges
accompany each advisory, and many are much narrower than "everything before
3.5.0".  Every fix ships with a regression test in the test suite that fails on
the unfixed tree.  Many thanks to the external researchers credited below.

Link following (CWE-59/61) -- a local user who controls a path component plants
a symlink that a privileged rsync then follows:

- CVE-2026-53802 (HIGH): Arbitrary file read / transfer-shaping via symlinked
  operator-supplied input files.  rsync followed attacker-planted symlinks in
  `--filter` merge files (including per-directory merges and `-C` `.cvsignore`),
  `--files-from` / `--include-from` / `--exclude-from`, and the client
  `--password-file` / daemon secrets file -- reading an arbitrary file as filter
  rules, or sending a victim file's contents as the daemon authentication
  response.  Operator-supplied paths are now resolved component-by-component with
  `openat(O_PATH|O_NOFOLLOW)`, allowing a symlink component only when it is owned
  by uid 0 or the effective uid.

- CVE-2026-53803 (HIGH): Arbitrary file write / privilege escalation via
  symlinked operator-supplied output paths -- `--log-file`,
  `--write-batch`/`--read-batch`, and the daemon's motd / lock / early-input /
  `--config` opens.  A planted symlink (or parent component) could redirect the
  write, e.g. append the log to `authorized_keys`; `--read-batch` could also feed
  chosen bytes to the protocol parser.  Same trusted-owner path walk, plus an
  `S_ISREG` check on the `--read-batch` file.

- CVE-2026-53785 (HIGH): Under `--relative`, the receiver's implied-parent
  creation (`make_path()`) built the parent chain with a plain `mkdir()` on the
  full path, so a planted parent symlink placed the new directories and file
  outside the destination tree.  `make_path()` now creates each component through
  the held-directory-fd primitive.  Reported by Omar Elsayed (seks99x).

- CVE-2026-53784 (HIGH): Daemon module-root chdir escape under `use chroot =
  no`: a plain `chdir()` followed a planted parent-component symlink, serving
  files from outside the module.  The module-root chdir now goes through the
  secure resolver.

- CVE-2026-53793 (HIGH): Chroot `/./` inner-module escape -- a symlinked
  parent component inside the inner module reached a sibling outside it (the
  generator basis stat, the receiver write/finish path, the module chdir, and the
  receiver's delta-basis open).  The secure resolver is now engaged for all of
  those paths.

- CVE-2026-53795 (HIGH): An absolute `--temp-dir` or `--link-dest` disabled
  the receiver's rename/link confinement.  `do_rename_at()`/`do_link_at()` bailed
  to the unconfined path-based call whenever *either* path was absolute, so an
  absolute source (the temp file, or the link-dest basis) let `finish_transfer()`'s
  tmp->final rename -- or a hard-link create -- follow a destination parent
  component an attacker flipped to a symlink mid-transfer, writing the file outside
  the tree.  Each side is now confined independently.  Reported by Omar Elsayed
  (seks99x).

- CVE-2026-53796 (MEDIUM): A non-daemon receiver's one-time `chdir()` into the
  operator-named destination was not fully confined (a relative destination took a
  plain `chdir()`), so an attacker who raced the named destination from a directory
  to a symlink moved the receiver's CWD -- and every file it then created --
  outside the tree.  The destination chdir now uses the same ownership-checked
  `O_NOFOLLOW` walk as the daemon module chdir (see BEHAVIOR CHANGES).  Reported by
  Omar Elsayed (seks99x).

- CVE-2026-53797 (MEDIUM): A non-daemon sender opened each transferred file's
  content by path (leaf `O_NOFOLLOW` only), so a source parent component an
  unprivileged user raced to a symlink after the file-list scan was followed --
  reading a file from outside the source tree into an attacker-readable
  destination.  The content open is now anchored at the transfer root with
  `secure_relative_open()`; `-L` / `--copy-unsafe-links` / `-k` still follow, and
  `--insecure-links` restores the legacy open.

- CVE-2026-53799 (MEDIUM): Receiver ACL/xattr metadata application followed a
  symlink race -> arbitrary ACL set (local privilege escalation).  When preserving
  metadata (`-A`/`--acls`, `-X`/`--xattrs`, or fake-super ACL-as-xattr), the
  receiver applied each entry's ACL/xattrs by path via `acl_set_file()` /
  `setxattr()`.  A local user who raced a just-received entry (or a parent) into a
  symlink before the apply could redirect an attacker-chosen ACL -- the bytes are
  carried in the source entry -- onto a victim inode outside the destination tree,
  granting rwx on a root-owned file.  The apply now pins each entry's inode with an
  `O_RDONLY|O_NOFOLLOW` fd and sets all metadata on the held inode (Linux 6.13+
  `*xattrat` syscalls, or a patched libacl's `*_at` bindings, else the
  `/proc/self/fd` compat path).  Where neither primitive exists (the BSDs, Solaris,
  macOS, or a `/proc`-less Linux container) it falls back to the path-based apply to
  keep `--acls` functional -- a documented residual, refusable via `refuse options =
  acls`.

- CVE-2026-53800 (MEDIUM): Sender `--remove-source-files` unlink followed a
  parent-component symlink race -> arbitrary file deletion outside the source tree.
  The post-send unlink and its same-file safety re-stat resolved by path relative to
  the process CWD, so an unprivileged user who raced a source parent into a symlink
  after the file was sent could make a higher-authority sender (a root
  `--remove-source-files` run, or a daemon module not refusing the option) delete a
  file outside the served tree.  The removal is now resolved through the secure
  held-dirfd walk anchored at the served module root (daemon) or transfer-root CWD
  (local sender), the safety re-stat is confined likewise, and the per-file dev/ino
  is only computed when `--remove-source-files` is in effect.

- CVE-2026-53801 (MEDIUM): Sender/daemon directory-scan enumeration escaped the
  transfer root / module -> out-of-tree disclosure.  The sender enumerated each
  source directory with a plain `opendir()` on the accumulated path, not through the
  secure resolver (the enumeration sibling of the previous item, which confined only
  the content open).  A parent component raced to a symlink between the file-list
  scan and the recursive `opendir()` -- or, in daemon following mode
  (`-L`/`--copy-dirlinks`/`--copy-unsafe-links`), an in-module symlinked directory
  pointing outside the module -- let a higher-authority sender enumerate an
  out-of-tree directory and copy its entry names, metadata and symlink targets.  The
  directory scan is now confined through a held `opendir` fd anchored at the transfer
  root / module.

`support/rrsync` (the restricted SSH wrapper):

- CVE-2026-53783 (HIGH): rrsync restricted-directory escape.  It validated each
  argument with `realpath()` and then exec'd rsync against the same name (a
  TOCTOU window), and left dangerous options enabled in a restricted subdir.
  rrsync now inode-pins the validated path and roots the argument it hands rsync
  at that pinned fd, denies `--copy-unsafe-links`, forces `--no-D`, and refuses a
  symlinked `--log-file`.  The pin relies on Linux's `/proc/self/fd` magic links
  being bound to the open inode, so it is Linux-only; on the BSDs, macOS, Solaris
  and Cygwin rrsync passes the `realpath()`-validated name as it always did.
  Two limits are worth stating: under `--relative` only the anchor the
  transmitted name starts from is pinned, so a component below it can still be
  raced, and the final component of an ordinary sender argument is not pinned
  either (rsync does not follow a symlink there, and the options that would
  change that are refused in a restricted dir).

- A filter rule that failed to parse was echoed back verbatim, including when
  the rule came from a merge file's contents.  A per-directory merge rule names
  a file the peer chooses and travels over the protocol rather than in an
  argument, so this let a peer read back any line of any file the server process
  could open that is not valid filter syntax -- through an `rrsync` restricted
  account as well as a daemon module, since neither confined a merge open that
  the wrapper never sees.  A syntax error in a rule read from a file now reports
  the file and line rather than the text; a rule given as an argument is still
  shown.  The `--debug=FILTER` traces print the same file-derived text, so
  `rrsync` now refuses a peer-selected `--debug` (a stock client never sends
  one).  An operator who turns debugging on for their own server still sees the
  rule text.

- Redacting those diagnostics did not close the merge route on its own, because
  the worst shape produces no diagnostic at all: an exclude-only merge (the `-`
  modifier) makes every line of the file a pattern, so nothing fails to parse
  and the peer reads the contents off which of its own names went missing from
  the file list.  Through an `rrsync` restricted account that needs no
  `--delete` and no verbosity on a pull.  The open is now confined rather than
  the disclosure suppressed: rsync gained `--confine-root=DIR`, which refuses an
  operator- or peer-supplied path that resolves outside DIR, and `rrsync` passes
  its restricted directory.  A merge file inside that directory keeps working.
  A daemon already had this through its module root and is unaffected.

Daemon protocol / identity:

- CVE-2026-53786 (MEDIUM): A client-supplied `--filter` merge file bypassed
  the module filter list (it was checked against the module-prefixed path, which
  never matched a module rule).  The module-dir prefix is now stripped before the
  check.  Reported by Mitchell Benjamin (Revamp Studio).

- CVE-2026-53798 (MEDIUM): The daemon name converter mapped an unknown name to
  uid/gid 0 (an empty response was read as `atol("") == 0`); with `fake super =
  yes` the stored metadata became root-owned.  An empty/non-numeric response is
  now treated as a lookup failure.  Reported by Mitchell Benjamin (Revamp
  Studio).

- CVE-2026-53788 (MEDIUM): A peer-controlled name containing a newline/CR was
  written verbatim into the name-converter line protocol, allowing request
  injection.  Converter tokens containing control characters are now rejected.
  Reported by Mitchell Benjamin (Revamp Studio).

- CVE-2026-53789 (MEDIUM): A malicious daemon-sender could widen `--delete`
  scope by omitting the "no content dir" flag on an implied parent, making the
  receiver run `delete_in_dir()` on it.  Implied-parent directories are now
  forced non-content on the receiver.  Reported by Mitchell Benjamin (Revamp
  Studio).

- CVE-2026-53791 (CRITICAL): With `proxy protocol = true`, a client connecting
  directly (not via the trusted proxy) could send a PROXY header to spoof its
  source address and bypass host-based access control.  A forwarded address is
  now honoured only from a configured trusted-proxy peer.

Injection and memory safety:

- CVE-2026-53790 (HIGH): Command / argument injection via unquoted peer- or
  host-controlled values -- the `RSYNC_CONNECT_PROG` `%H` host substitution, the
  daemon exec-hook `%RSYNC_*%` expansions, rsync-ssl hostspecs, and a missing
  newline/CR in remote-shell argument quoting.  Each sink is now quoted or
  validated (the hook escaping is confined to the shell-executed hooks, so
  ordinary daemon string parameters such as `path` are unaffected).

- CVE-2026-53792 (MEDIUM): A malicious receiver sending a checksum header with a
  block count > 0 but block length == 0 drove the sender's rolling-match
  arithmetic negative.  A zero block length is now rejected.

- CVE-2026-53794 (MEDIUM): `--max-alloc=0` disabled the per-allocation size
  cap (the defense behind CVE-2024-12084) and could be forwarded on the wire to
  an unpatched daemon.  A zero max-alloc is now rejected at both the client and
  the daemon.  Reported by Azizcan Dastan (Milenium Security).

Peer-triggerable memory corruption in the daemon protocol, found by a
daemon-protocol fuzzing pass and reported by Greg Kroah-Hartman.  Each is a
WRITE reachable from the wire, which is why these were split out from the
crash-only findings in the same pass:

- CVE-2026-70461 (HIGH): a one-byte heap out-of-bounds write in
  `add_implied_include()`, driven by a peer-supplied filter rule whose trailing
  backslash was not counted when sizing the copy.

- CVE-2026-70458 (HIGH): an out-of-bounds write from a file entry marked
  `FLAG_HLINKED` that the receiver accepted even though `-H` was not in effect,
  so the hard-link extra slots it then wrote were never allocated.

- CVE-2026-70456 (HIGH): an out-of-bounds heap write in `read_args()` when the
  peer's argument count lands exactly on `maxargs` -- the trailing NULL went one
  past the end of the array.

- CVE-2026-70457 (MEDIUM): an attacker-chosen-offset write in
  `parse_size_arg()`'s error formatting, reachable through an over-large
  `--max-size` / `--min-size` / `--max-alloc` forwarded to a daemon.

- CVE-2026-70459 (MEDIUM): a wild-pointer read crashing the per-connection
  daemon child, from a crafted first incremental file list whose transfer root
  is "." with a non-directory mode -- `parent_ndx` stayed 0 while `dir_flist`
  was still empty, so the generator dereferenced a never-written slot.
  Companion to CVE-2026-43620; reproduced on released 3.2.7, 3.4.0 and 3.4.1.

Daemon availability and access control:

- CVE-2026-70464 (HIGH): an unauthenticated peer could complete the `@RSYNCD`
  greeting and then stall forever -- sending a line with no terminator, or
  trickling NUL-terminated arguments into `read_args()` one byte at a time --
  holding a per-connection child open past the module's `max connections`
  limit.  The `timeout` parameter did not cover it, because `set_io_timeout()`
  ran after the `read_args()` calls that needed covering.  A separate deadline
  now spans both, and the early-protocol argument count is bounded.  Reported
  independently by Chamal De Silva and by Michal Ruprich (Red Hat QE).

- CVE-2026-70455 (HIGH): a daemon client could request an arbitrary Zstandard
  worker count via `--compress-threads`; 256 was measured as 257 threads in a
  single connection.  Now capped at 8 on a daemon, while local and
  remote-shell invocations keep the operator's value.  Reported, fixed and
  tested by Filipe Casal of Trail of Bits, in collaboration with OpenAI.

- CVE-2026-70453 (HIGH): quadratic CPU exhaustion in `hash_search()` from a
  crafted chain of equal weak checksums.  The chain walk is now bounded.  First
  reported as a performance problem in public rsync issue #217 by heyciao
  (2021); recognised as a security issue, bounded and regression-tested by
  Stuart Inglis.  This one was already public and was not embargoed.

- CVE-2026-70452 (HIGH): `hosts deny` failed OPEN when a configured hostname
  could not be resolved -- with `forward lookup` enabled, which is the default,
  an unresolvable deny token admitted the host it was meant to block.  It now
  fails closed.  Sibling of CVE-2026-43617.  Reported by Leonid Bugaev.

- CVE-2026-70463 (HIGH): `auth users` ignored its documented comma-only
  parsing.  With a leading comma the split should be on commas alone, so that a
  group name containing a space can be written; it split on whitespace too, so
  a `deny` or `:ro` rule naming such a group was broken into two meaningless
  tokens and never fired.  Reported by Andres Berbescu.

- CVE-2026-70460 (HIGH): a peer-supplied `--partial-dir` or `--backup-dir` was
  resolved by pathname, so an in-module symlink could redirect it and place
  files outside the daemon's module root.  Those paths are now confined.
  Reported by Omar Elsayed (seks99x).

Client-side:

- CVE-2026-70462 (MEDIUM): a peer-supplied `MSG_IO_TIMEOUT` defeated the
  client's own I/O timeout -- a large value overflowed signed arithmetic, and a
  non-positive value disabled the timeout outright.  The value is now capped on
  receipt and the arithmetic made overflow-safe.  Reported by Z3R0S! (z3r0s6);
  the non-positive case was reported by Leonid Bugaev.

- CVE-2026-70454 (MEDIUM): `rsync-ssl` established an unauthenticated TLS
  connection.  In stunnel mode it neither required CA verification nor bound
  the certificate to the requested hostname, so an active network attacker
  could impersonate the server; the openssl backend had a matching hostname
  gap in 3.2.0 through 3.2.3 (found and fixed in 2020 by Matt McCutchen).
  stunnel mode now requires certificate verification and hostname binding
  unless an explicit insecure opt-out is set, and the GnuTLS backend is
  refused conservatively rather than used unverified (Greg Kroah-Hartman).

Robustness hardening (no CVE assigned): the `RSYNC_PROXY` CONNECT request and
proxy response headers are length-bounded, and peer-requested xattr expansion is
capped.

A second-pass source audit (reported by Leonid Bugaev) hardened several memory-
safety and robustness paths: the hashtable and file-list size computations are
guarded against a 32-bit integer overflow that a peer's entry count could
otherwise wrap into an under-allocation, and the
`SIGUSR2` handler is now async-signal-safe (it only sets a flag, deferring the
summary/close-out work to safe poll points).  Separately, the xattr/ACL metadata
copy now reads the *source* through a held no-follow fd as well as writing the
destination through one -- closing a parent-symlink race on the `--copy-dest` and
backup source -- and the cross-tree operator-path metadata apply is now fd-pinned
under `--fake-super` too (previously it fell back to a path-based set for a
`fake super = yes` daemon staging through an absolute `--temp-dir`/`--backup-dir`).

### SECURITY RELATED:

- Mask a peer-supplied I/O-error value to the defined `IOERR_*` bits, both the
  incoming `MSG_IO_ERROR` message (`io.c`) and the file-list trailer (`flist.c`),
  so a malicious peer cannot set arbitrary (undefined) error flags that would be
  stored in the local `io_error` and re-forwarded upstream.  (Undefined bits
  never reached the exit code, which maps only the defined bits.)  Reported by
  Leonid Bugaev.

- Escape control characters in filenames written to the log file (CWE-117 log
  injection): a transferred name containing control bytes -- C0 (tab excepted)
  and C1 `0x80`-`0x9f`, including CSI `0x9b` -- could otherwise inject terminal
  escape sequences into an administrator's terminal when the log is viewed.
  Reported by Leonid Bugaev.

- Stop `safe_arg()` leaking an uninitialized byte into a quoted filename.  In
  filename mode the writer suppresses the escaping backslash before a wildcard,
  but the counter that sized the buffer reserved a slot for every backslash, so
  the two disagreed and left an uninitialized heap byte in the returned string
  -- which is handed to the remote shell when `--protect-args` is off.  The
  counter now mirrors the writer, and guarding the wildcard test with `f[1]`
  also fixes a trailing backslash (previously `strchr()` matched the string
  terminator, so the backslash was not doubled).  Reported by Leonid Bugaev.

- Close a `--safe-links` bypass in `--backup`: when symlinks can be hard-linked,
  `make_backup()`'s link/rename fast path hard-linked an unsafe (out-of-tree)
  symlink into the backup area and skipped the `safe_symlinks` check the copy
  path applies, silently preserving a link `--safe-links` was meant to drop.  The
  safe-links check now runs before the fast path, and a symlink whose target is
  unreadable is failed closed rather than backed up unchecked.  Reported by
  Leonid Bugaev.

- Extend the operator-directory ownership walk to the backup leaf sinks:
  `do_symlink_at()` (backing a symlink up into an operator `--backup-dir`) and
  `do_rmdir_at()` (removing a pre-existing backup directory) now resolve their
  parent through the same ownership walk, so a foreign-owned parent symlink no
  longer redirects the backup symlink-create or directory-removal outside the
  backup tree.  `--insecure-links` (or a module's `insecure links = yes`) restores
  the legacy follow.  Reported by Omar Elsayed (seks99x).

- Confine an absolute operator source/destination through the ownership walk in
  `robust_rename()`'s cross-filesystem (EXDEV) copy fallback, so a raced parent
  symlink cannot redirect the fallback copy or its source unlink out of the tree.
  Reported by Leonid Bugaev.

- Bound the number of equal-weak-checksum blocks examined per offset in
  `hash_search()` (issue #217), so a crafted or degenerate checksum set with a
  very long equal-checksum chain cannot drive the sender's per-offset
  match-verify into a quadratic blow-up (CPU DoS).  Fix by Stuart Inglis.

### BUG FIXES:

- Fix an off-by-one in `clean_fname()`'s `..`-collapse path normalization.
  Reported by Leonid Bugaev.

- The AVX2 rolling-checksum assembly (`--enable-roll-asm`) read up to 64 bytes
  past the end of the buffer it was given.  The loop is software-pipelined and
  preloaded the 64 bytes after the ones it was folding in, so its last iteration
  always reached beyond the data -- the remainder is by construction under 64
  bytes.  It normally landed in slack inside rsync's map window and went
  unnoticed; where the buffer ended at a page boundary it was a SIGSEGV mid
  transfer, reported on macOS x86-64 by Roland Kletzing.  Reported checksums are
  unchanged.

- `--link-dest` no longer fails the transfer when the destination refuses to
  hard-link a symlink, device node, FIFO or socket.  Whether rsync hard-links
  those at all was decided at build time, on whatever filesystem the source tree
  happened to sit on, and one host can hold both answers -- macOS builds on
  APFS, which can, and backs up to HFS+, which returns ENOTSUP.  Such an entry
  is now copied, exactly as it already is in a build that cannot link them and
  as a regular file in the same position already was; the run used to exit 23
  even though the entry was then created correctly.  The fallback covers any
  refusal, since the error does not identify one on its own: link(2) documents
  EPERM both for a filesystem without hard links and for a permission refusal.
  Still outstanding: under `-H`, a group of such entries hard-linked to each
  other also needs a link within the destination, and where the destination
  cannot hard-link the type at all, the members after the first are still lost.

- `--out-format` / `--log-file-format` now emit a literal `%` for `%%` instead of
  mis-parsing the following character (added by Leonid Bugaev); a follow-up bounds
  `log_format_has()`'s width-digit scan to match `log_formatted()`, closing a `%C`
  read past the checksum field.

- A CVS `.cvsignore` (or `-C`) file containing a `!` clear-list token no longer
  aborts with a spurious "rule has trailing characters" error.  Reported by
  Leonid Bugaev.

- `--chmod=a+s` now sets both the setuid and setgid bits, matching `chmod(1)`
  (it previously set setuid only).  Reported by Leonid Bugaev.

- Case-insensitive wildcard matching (used by daemon `hosts allow`/`hosts deny`
  rules) now folds characters inside a `[...]` bracket expression, not just
  literal pattern characters.  Reported by Leonid Bugaev.

### BEHAVIOR CHANGES:

- A non-daemon receiver follows an operator-named symlinked destination directory
  only when the symlink is owned by root or the running user (e.g. `rsync -a src/
  /backup/` where `/backup -> /mnt/disk`); a destination symlinked by another uid
  is now refused, closing a chdir TOCTOU where an attacker raced the named
  destination into a symlink.  `--insecure-links` restores the unconditional
  follow.

- On platforms without a race-safe way to create a unix socket in a subdirectory
  (the BSDs, macOS, Solaris, which lack `bindat()`), a nested socket transferred
  under `--specials` is skipped with a warning instead of failing the whole
  transfer.  Top-level sockets are unaffected.

- `proxy protocol = true` with no `proxy protocol hosts` rejects all connections
  (fail-closed); the daemon now warns about this at startup.

- `support/rrsync` in a restricted subdirectory forces `--no-D` (device/special
  semantics are stripped, so a plain `rsync -a` still works) and denies
  `--copy-unsafe-links`.

- The path resolver now follows in-tree directory symlinks uniformly on every
  platform via a single race-free per-component `O_NOFOLLOW` walk, so `-K` /
  `-L` / `-k` and `-R` through an in-tree symlinked parent behave the same
  everywhere.

- Fixed a bypass of `--safe-links` when `--backup` is also used on a system that supports hard-linking symlinks (Linux, macOS).  An escaping symlink that should have been skipped was silently preserved in the backup area.

- Fixed a spurious abort when using `-C` (cvs-exclude) mode with a `.cvsignore` file that contained a `!` (clear-list) token.

- Updated the `--max-alloc` documentation to reflect that 0 is now rejected (CVE-2026-53794).

- Fixed the EXIT VALUES table: removed nonexistent code 6, added missing codes 15/16/19, corrected SIGUSR1 classification.

| 13 Aug 2026  | 3.5.0  |                  | 32          |

--===============2378001075974061096==--

