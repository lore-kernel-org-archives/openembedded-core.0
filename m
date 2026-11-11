Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3801.1794377113394396000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BJemdRoa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jHTxQxFC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1c935db71-67e4bb45-c2bb-4ad5-a389-0acda6258f53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2aEkso7A5XLzfj8D3atni29toC01KVu1a2NnY6Jgssg=;
	b=BJemdRoaFxWV74JthtbSc896IbsBNXeAK/I0cdifCxJoJOOc0+KSZa4n2/1DY1kj
	YjKDPsevUeTzQriFinXvm0K/8UdEZ3vuvXcvKi8IHhSTPnBhjo5tiCOolOUfscRQ7DF
	bKlShTH7UkvZvEBhTjWx3lSeXORLUym6xdrMz0rA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2aEkso7A5XLzfj8D3atni29toC01KVu1a2NnY6Jgssg=;
	b=jHTxQxFCaoAdk/BKWTS0MHHQW+tSVLBP5De7rYGsY6f6vVdIeDZnkUJnDpwNmmbe
	rzkG7imenOWVKJqKJ+lFnxoJN/jAnnmR/DcxXaZQwPCWDqkleq+GmSq4vjgVVsJr7ST
	I/tU9pAC+5oQ9KwjZXMkqu2hfcUD1GdtOZajAawk=
Content-Type: multipart/mixed; boundary="===============2254148407742662233=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxmlb: upgrading to 0.3.30 SUCCEEDED
Message-ID: <010101a1c935db71-67e4bb45-c2bb-4ad5-a389-0acda6258f53-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249963

--===============2254148407742662233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxmlb* to *0.3.30* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxmlb-upgrade-0.3.29-0.3.30.patch
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
From fb654892d0e4b8a35a7a6b1a3134dc85a3d19649 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 05:40:48 +0000
Subject: [PATCH] libxmlb: upgrade 0.3.29 -> 0.3.30

Version 0.3.30
~~~~~~~~~~~~~~
Released: 2026-11-10

New Features:
 - Add support for the XPath normalize-space() function (Richard Hughes)
 - Increase the maximum number of node attributes and tokens (Richard Hughes)
 - Record in the silo if the node was added as external info (Richard Hughes)

Bugfixes:
 - Convert xml:lang tags to POSIX form when required (Richard Hughes)
 - Fix OR branches still being evaluated after the limit is reached (Richard
   Hughes)
 - Fix XbLzmaDecompressor reset leaving the stream unusable (Richard Hughes)
 - Fix a bound value losing its level inside a tuple (Richard Hughes)
 - Fix a crash when a query value was never bound (Richard Hughes)
 - Fix a crash when searching one silo from several threads (car12o)
 - Fix comma-separated function arguments being parsed in reverse (Richard
   Hughes)
 - Fix escaped tab and newline not decoding in query parsing (Richard Hughes)
 - Fix literal backslashes not surviving the query escape round-trip (Richard
   Hughes)
 - Fix mixed-type comparisons swapping their operands (Richard Hughes)
 - Fix parser depth leaking from one failed source to the next (Richard Hughes)
 - Fix unbound query variables silently comparing against zero (Richard Hughes)
 - Fix unfinished predicates being ignored at the start of a section (Richard
   Hughes)
 - Fix xb_query_context_copy() silently dropping bindings after a gap (Richard
   Hughes)
 - Fix xb_silo_stem() returning the unstemmed string on equal length (Richard
   Hughes)
 - Fix xb_value_bindings_copy() aborting when a slot is unbound (Richard Hughes)
---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.29.bb => libxmlb_0.3.30.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.29.bb => libxmlb_0.3.30.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index f0db37031e..82ec03bd64 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From d4aa8d857e1b18dff8bc23cc810c56b4dba3aa95 Mon Sep 17 00:00:00 2001
+From 361bbfeb5b7bb6d89a022986746f8063e6df25b2 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 795167d..ab2b582 100644
+index ddc4c9d..4b46161 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -3329,7 +3329,7 @@ xb_speed_precompiled_func(void)
+@@ -14,7 +14,7 @@
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb
index b070cbf99c..16089a3187 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "d942cd68a7d78e35b312b9299e69f68f9cd2e503"
+SRCREV = "35e0ece96ae9438ccdfe9fca5f11c161e396a481"
 
 DEPENDS = "glib-2.0 xz zstd"
 
-- 
2.47.1


--===============2254148407742662233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGSIZE changed from 297574 to 347590 (+17%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 540120 to 597294 (+11%)

--===============2254148407742662233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libxmlb: PKGV changed from 0.3.29 [default] to 0.3.30 [default]
packages/x86-64-v3-poky-linux/libxmlb: SRC_URI changed from "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https;tag=0.3.29 file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch file://run-ptest" to "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https;tag=0.3.30 file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libxmlb: PV changed from "0.3.29" to "0.3.30"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PV changed from "0.3.29" to "0.3.30"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-bin: PKGV changed from 0.3.29 [default] to 0.3.30 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PV changed from "0.3.29" to "0.3.30"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGSIZE changed from 2033192 to 2206672 (+9%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dbg: PKGV changed from 0.3.29 [default] to 0.3.30 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PV changed from "0.3.29" to "0.3.30"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGSIZE changed from 358274 to 364415 (+2%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-dev: PKGV changed from 0.3.29 [default] to 0.3.30 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PV changed from "0.3.29" to "0.3.30"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PKGSIZE changed from 624 to 625 (+0%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-doc: PKGV changed from 0.3.29 [default] to 0.3.30 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PV changed from "0.3.29" to "0.3.30"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-locale: PKGV changed from 0.3.29 [default] to 0.3.30 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PV changed from "0.3.29" to "0.3.30"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGSIZE changed from 297574 to 347590 (+17%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-ptest: PKGV changed from 0.3.29 [default] to 0.3.30 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PV changed from "0.3.29" to "0.3.30"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGSIZE changed from 540120 to 597294 (+11%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: FILELIST: removed "/usr/src/debug/libxmlb/0.3.29/src/xb-query-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-silo-query.c /usr/src/debug/libxmlb/0.3.29/src/xb-opcode-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-silo-query.h /usr/src/debug/libxmlb/0.3.29/src/xb-string-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-lzma-decompressor.h /usr/src/debug/libxmlb/0.3.29/src/xb-builder-source-ctx.c /usr/src/debug/libxmlb/0.3.29/src/xb-version.c /usr/src/debug/libxmlb/0.3.29/src/xb-common.c /usr/src/debug/libxmlb/0.3.29/src/xb-tool.c /usr/src/debug/libxmlb/0.3.29/src/xb-builder-source-ctx.h /usr/src/debug/libxmlb/0.3.29/src/xb-lzma-decompressor.c /usr/src/debug/libxmlb/0.3.29/src/xb-machine.c /usr/src/debug/libxmlb/0.3.29/src/xb-node-silo.h /usr/src/debug/libxmlb/0.3.29/src/xb-stack.c /usr/src/debug/libxmlb/0.3.29/src/xb-silo-node.h /usr/src/debug/libxmlb/0.3.29/src/xb-builder-source.h /usr/src/debug/libxmlb/0.3.29/src/xb-version.h /usr/src/
 debug/libxmlb/0.3.29/src/xb-builder-fixup.c /usr/src/debug/libxmlb/0.3.29/src/xb-silo-node.c /usr/src/debug/libxmlb/0.3.29/src/xb-stack.h /usr/src/debug/libxmlb/0.3.29/src/xb-machine.h /usr/src/debug/libxmlb/0.3.29/src/xb-builder-fixup.h /usr/src/debug/libxmlb/0.3.29/src/xb-builder-source.c /usr/src/debug/libxmlb/0.3.29/src/xb-builder.h /usr/src/debug/libxmlb/0.3.29/src/xb-string.c /usr/src/debug/libxmlb/0.3.29/src/xb-value-bindings.c /usr/src/debug/libxmlb/0.3.29/src/xb-zstd-decompressor.h /usr/src/debug/libxmlb/0.3.29/src/xb-node.h /usr/src/debug/libxmlb/0.3.29/src/xb-value-bindings.h /usr/src/debug/libxmlb/0.3.29/src/xb-string.h /usr/src/debug/libxmlb/0.3.29/src/xb-builder.c /usr/src/debug/libxmlb/0.3.29/src/xb-zstd-decompressor.c /usr/src/debug/libxmlb/0.3.29/src/xb-silo-export-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-node-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-node.c /usr/src/debug/libxmlb/0.3.29/src/xb-common-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-query.c
  /usr/src/debug/libxmlb/0.3.29/src/xb-opcode.h /usr/src/debug/libxmlb/0.3.29/src/xb-query-context.c /usr/src/debug/libxmlb/0.3.29/src/xb-query.h /usr/src/debug/libxmlb/0.3.29/src/xb-builder-node-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-silo-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-query-context.h /usr/src/debug/libxmlb/0.3.29/src/xb-opcode.c /usr/src/debug/libxmlb/0.3.29/src/xb-builder-source-ctx-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-silo-query-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-silo.c /usr/src/debug/libxmlb/0.3.29/src/xb-value-bindings-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-machine-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-self-test.c /usr/src/debug/libxmlb/0.3.29/src/xb-builder-source-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-stack-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-silo.h /usr/src/debug/libxmlb/0.3.29/src/xb-node-query.c /usr/src/debug/libxmlb/0.3.29/src/xb-builder-node.h /usr/src/debug/libxmlb/0.3.29/src/xb-node-quer
 y.h /usr/src/debug/libxmlb/0.3.29/src/xb-silo-export.h /usr/src/debug/libxmlb/0.3.29/src/xb-builder-node.c /usr/src/debug/libxmlb/0.3.29/src/xb-builder-fixup-private.h /usr/src/debug/libxmlb/0.3.29/src/xb-silo-export.c", added "/usr/src/debug/libxmlb/0.3.30/src/xb-test-common.h /usr/src/debug/libxmlb/0.3.30/src/xb-xpath-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-builder-fixup-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-builder-source-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-test-common.c /usr/src/debug/libxmlb/0.3.30/src/xb-query-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-silo-query.c /usr/src/debug/libxmlb/0.3.30/src/xb-opcode-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-threading-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-silo-query.h /usr/src/debug/libxmlb/0.3.30/src/xb-string-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-xpath-limit-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-lzma-decompressor.h /usr/src/debug/libxmlb/0.3.30/src/xb-builder-source-ctx.c /usr/src/de
 bug/libxmlb/0.3.30/src/xb-version.c /usr/src/debug/libxmlb/0.3.30/src/xb-common.c /usr/src/debug/libxmlb/0.3.30/src/xb-tool.c /usr/src/debug/libxmlb/0.3.30/src/xb-builder-source-ctx.h /usr/src/debug/libxmlb/0.3.30/src/xb-common-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-lzma-decompressor.c /usr/src/debug/libxmlb/0.3.30/src/xb-machine.c /usr/src/debug/libxmlb/0.3.30/src/xb-node-silo.h /usr/src/debug/libxmlb/0.3.30/src/xb-silo-node.h /usr/src/debug/libxmlb/0.3.30/src/xb-builder-source.h /usr/src/debug/libxmlb/0.3.30/src/xb-stack.c /usr/src/debug/libxmlb/0.3.30/src/xb-version.h /usr/src/debug/libxmlb/0.3.30/src/xb-builder-fixup.c /usr/src/debug/libxmlb/0.3.30/src/xb-silo-node.c /usr/src/debug/libxmlb/0.3.30/src/xb-stack.h /usr/src/debug/libxmlb/0.3.30/src/xb-opcode-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-machine.h /usr/src/debug/libxmlb/0.3.30/src/xb-builder-fixup.h /usr/src/debug/libxmlb/0.3.30/src/xb-builder-source.c /usr/src/debug/libxmlb/0.3.30/src/xb-builder.h /usr/src/debug/
 libxmlb/0.3.30/src/xb-string.c /usr/src/debug/libxmlb/0.3.30/src/xb-value-bindings.c /usr/src/debug/libxmlb/0.3.30/src/xb-zstd-decompressor.h /usr/src/debug/libxmlb/0.3.30/src/xb-node.h /usr/src/debug/libxmlb/0.3.30/src/xb-value-bindings.h /usr/src/debug/libxmlb/0.3.30/src/xb-string.h /usr/src/debug/libxmlb/0.3.30/src/xb-builder.c /usr/src/debug/libxmlb/0.3.30/src/xb-zstd-decompressor.c /usr/src/debug/libxmlb/0.3.30/src/xb-silo-export-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-node-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-builder-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-node-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-common-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-node.c /usr/src/debug/libxmlb/0.3.30/src/xb-query.c /usr/src/debug/libxmlb/0.3.30/src/xb-opcode.h /usr/src/debug/libxmlb/0.3.30/src/xb-query-context.c /usr/src/debug/libxmlb/0.3.30/src/xb-query.h /usr/src/debug/libxmlb/0.3.30/src/xb-builder-node-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-silo-privat
 e.h /usr/src/debug/libxmlb/0.3.30/src/xb-query-context.h /usr/src/debug/libxmlb/0.3.30/src/xb-opcode.c /usr/src/debug/libxmlb/0.3.30/src/xb-builder-node-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-builder-source-ctx-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-silo-query-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-silo.c /usr/src/debug/libxmlb/0.3.30/src/xb-value-bindings-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-self-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-builder-source-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-stack-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-xpath-predicate-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-silo.h /usr/src/debug/libxmlb/0.3.30/src/xb-node-query.c /usr/src/debug/libxmlb/0.3.30/src/xb-builder-node.h /usr/src/debug/libxmlb/0.3.30/src/xb-speed-test.c /usr/src/debug/libxmlb/0.3.30/src/xb-node-query.h /usr/src/debug/libxmlb/0.3.30/src/xb-silo-export.h /usr/src/debug/libxmlb/0.3.30/src/xb-builder-node.c /usr/src/debug/libxmlb/0.3.30/src/
 xb-machine-private.h /usr/src/debug/libxmlb/0.3.30/src/xb-silo-export.c"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-src: PKGV changed from 0.3.29 [default] to 0.3.30 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PV changed from "0.3.29" to "0.3.30"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb-staticdev: PKGV changed from 0.3.29 [default] to 0.3.30 [default]
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PV changed from "0.3.29" to "0.3.30"
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGSIZE changed from 207784 to 211988 (+2%)
packages/x86-64-v3-poky-linux/libxmlb/libxmlb: PKGV changed from 0.3.29 [default] to 0.3.30 [default]

--===============2254148407742662233==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxmlb-upgrade-0.3.29-0.3.30.patch"

RnJvbSBmYjY1NDg5MmQwZTRiOGEzNWE3YTZiMWEzMTM0ZGM4NWEzZDE5NjQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDU6NDA6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4bWxiOiB1cGdyYWRlIDAuMy4yOSAtPiAwLjMuMzAKClZlcnNpb24gMC4zLjMwCn5+fn5+fn5+
fn5+fn5+ClJlbGVhc2VkOiAyMDI2LTExLTEwCgpOZXcgRmVhdHVyZXM6CiAtIEFkZCBzdXBwb3J0
IGZvciB0aGUgWFBhdGggbm9ybWFsaXplLXNwYWNlKCkgZnVuY3Rpb24gKFJpY2hhcmQgSHVnaGVz
KQogLSBJbmNyZWFzZSB0aGUgbWF4aW11bSBudW1iZXIgb2Ygbm9kZSBhdHRyaWJ1dGVzIGFuZCB0
b2tlbnMgKFJpY2hhcmQgSHVnaGVzKQogLSBSZWNvcmQgaW4gdGhlIHNpbG8gaWYgdGhlIG5vZGUg
d2FzIGFkZGVkIGFzIGV4dGVybmFsIGluZm8gKFJpY2hhcmQgSHVnaGVzKQoKQnVnZml4ZXM6CiAt
IENvbnZlcnQgeG1sOmxhbmcgdGFncyB0byBQT1NJWCBmb3JtIHdoZW4gcmVxdWlyZWQgKFJpY2hh
cmQgSHVnaGVzKQogLSBGaXggT1IgYnJhbmNoZXMgc3RpbGwgYmVpbmcgZXZhbHVhdGVkIGFmdGVy
IHRoZSBsaW1pdCBpcyByZWFjaGVkIChSaWNoYXJkCiAgIEh1Z2hlcykKIC0gRml4IFhiTHptYURl
Y29tcHJlc3NvciByZXNldCBsZWF2aW5nIHRoZSBzdHJlYW0gdW51c2FibGUgKFJpY2hhcmQgSHVn
aGVzKQogLSBGaXggYSBib3VuZCB2YWx1ZSBsb3NpbmcgaXRzIGxldmVsIGluc2lkZSBhIHR1cGxl
IChSaWNoYXJkIEh1Z2hlcykKIC0gRml4IGEgY3Jhc2ggd2hlbiBhIHF1ZXJ5IHZhbHVlIHdhcyBu
ZXZlciBib3VuZCAoUmljaGFyZCBIdWdoZXMpCiAtIEZpeCBhIGNyYXNoIHdoZW4gc2VhcmNoaW5n
IG9uZSBzaWxvIGZyb20gc2V2ZXJhbCB0aHJlYWRzIChjYXIxMm8pCiAtIEZpeCBjb21tYS1zZXBh
cmF0ZWQgZnVuY3Rpb24gYXJndW1lbnRzIGJlaW5nIHBhcnNlZCBpbiByZXZlcnNlIChSaWNoYXJk
CiAgIEh1Z2hlcykKIC0gRml4IGVzY2FwZWQgdGFiIGFuZCBuZXdsaW5lIG5vdCBkZWNvZGluZyBp
biBxdWVyeSBwYXJzaW5nIChSaWNoYXJkIEh1Z2hlcykKIC0gRml4IGxpdGVyYWwgYmFja3NsYXNo
ZXMgbm90IHN1cnZpdmluZyB0aGUgcXVlcnkgZXNjYXBlIHJvdW5kLXRyaXAgKFJpY2hhcmQKICAg
SHVnaGVzKQogLSBGaXggbWl4ZWQtdHlwZSBjb21wYXJpc29ucyBzd2FwcGluZyB0aGVpciBvcGVy
YW5kcyAoUmljaGFyZCBIdWdoZXMpCiAtIEZpeCBwYXJzZXIgZGVwdGggbGVha2luZyBmcm9tIG9u
ZSBmYWlsZWQgc291cmNlIHRvIHRoZSBuZXh0IChSaWNoYXJkIEh1Z2hlcykKIC0gRml4IHVuYm91
bmQgcXVlcnkgdmFyaWFibGVzIHNpbGVudGx5IGNvbXBhcmluZyBhZ2FpbnN0IHplcm8gKFJpY2hh
cmQgSHVnaGVzKQogLSBGaXggdW5maW5pc2hlZCBwcmVkaWNhdGVzIGJlaW5nIGlnbm9yZWQgYXQg
dGhlIHN0YXJ0IG9mIGEgc2VjdGlvbiAoUmljaGFyZAogICBIdWdoZXMpCiAtIEZpeCB4Yl9xdWVy
eV9jb250ZXh0X2NvcHkoKSBzaWxlbnRseSBkcm9wcGluZyBiaW5kaW5ncyBhZnRlciBhIGdhcCAo
UmljaGFyZAogICBIdWdoZXMpCiAtIEZpeCB4Yl9zaWxvX3N0ZW0oKSByZXR1cm5pbmcgdGhlIHVu
c3RlbW1lZCBzdHJpbmcgb24gZXF1YWwgbGVuZ3RoIChSaWNoYXJkCiAgIEh1Z2hlcykKIC0gRml4
IHhiX3ZhbHVlX2JpbmRpbmdzX2NvcHkoKSBhYm9ydGluZyB3aGVuIGEgc2xvdCBpcyB1bmJvdW5k
IChSaWNoYXJkIEh1Z2hlcykKLS0tCiAuLi4vbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFy
ZGNvZGUtR19URVNUX1NSQ0RJUi5wYXRjaCB8IDYgKysrLS0tCiAuLi4vbGlieG1sYi97bGlieG1s
Yl8wLjMuMjkuYmIgPT4gbGlieG1sYl8wLjMuMzAuYmJ9ICAgICAgICB8IDIgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1nbm9tZS9saWJ4bWxiL3tsaWJ4bWxiXzAuMy4yOS5iYiA9PiBsaWJ4bWxiXzAuMy4zMC5i
Yn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxi
LzAwMDEteGItc2VsZnRlc3QuYy1oYXJkY29kZS1HX1RFU1RfU1JDRElSLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWdub21lL2xpYnhtbGIvbGlieG1sYi8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNvZGUt
R19URVNUX1NSQ0RJUi5wYXRjaAppbmRleCBmMGRiMzcwMzFlLi44MmVjMDNiZDY0IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiLzAwMDEteGItc2VsZnRlc3Qu
Yy1oYXJkY29kZS1HX1RFU1RfU1JDRElSLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9s
aWJ4bWxiL2xpYnhtbGIvMDAwMS14Yi1zZWxmdGVzdC5jLWhhcmRjb2RlLUdfVEVTVF9TUkNESVIu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ0YWE4ZDg1N2UxYjE4ZGZmOGJjMjNjYzgxMGM1
NmI0ZGJhM2FhOTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDM2MWJiZmViNWI3YmI2
ZDg5YTAyMjk4Njc0NmY4MDYzZTZkZjI1YjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBNYXJrdXMgVm9sayA8Zl9sX2tAdC1vbmxpbmUuZGU+CiBEYXRlOiBTYXQsIDE2IFNlcCAyMDIz
IDE0OjAyOjU3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHhiLXNlbGYtdGVzdC5jOiBoYXJkY29k
ZSBHX1RFU1RfU1JDRElSCkBAIC0xOCwxMCArMTgsMTAgQEAgU2lnbmVkLW9mZi1ieTogTWFya3Vz
IFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3hiLXNlbGYtdGVzdC5jIGIvc3Jj
L3hiLXNlbGYtdGVzdC5jCi1pbmRleCA3OTUxNjdkLi5hYjJiNTgyIDEwMDY0NAoraW5kZXggZGRj
NGM5ZC4uNGI0NjE2MSAxMDA2NDQKIC0tLSBhL3NyYy94Yi1zZWxmLXRlc3QuYwogKysrIGIvc3Jj
L3hiLXNlbGYtdGVzdC5jCi1AQCAtMzMyOSw3ICszMzI5LDcgQEAgeGJfc3BlZWRfcHJlY29tcGls
ZWRfZnVuYyh2b2lkKQorQEAgLTE0LDcgKzE0LDcgQEAKICBpbnQKICBtYWluKGludCBhcmdjLCBj
aGFyICoqYXJndikKICB7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9s
aWJ4bWxiXzAuMy4yOS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9saWJ4bWxiL2xpYnhtbGJfMC4z
LjMwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9t
ZS9saWJ4bWxiL2xpYnhtbGJfMC4zLjI5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUv
bGlieG1sYi9saWJ4bWxiXzAuMy4zMC5iYgppbmRleCBiMDcwY2JmOTljLi4xNjA4OWEzMTg3IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4yOS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvbGlieG1sYi9saWJ4bWxiXzAuMy4zMC5iYgpAQCAtOCw3
ICs4LDcgQEAgU1JDX1VSSSA9ICIgXAogCWZpbGU6Ly8wMDAxLXhiLXNlbGZ0ZXN0LmMtaGFyZGNv
ZGUtR19URVNUX1NSQ0RJUi5wYXRjaCBcCiAJZmlsZTovL3J1bi1wdGVzdCBcCiAiCi1TUkNSRVYg
PSAiZDk0MmNkNjhhN2Q3OGUzNWIzMTJiOTI5OWU2OWY2OGY5Y2QyZTUwMyIKK1NSQ1JFViA9ICIz
NWUwZWNlOTZhZTk0MzhjY2RmZTlmY2E1ZjExYzE2MWUzOTZhNDgxIgogCiBERVBFTkRTID0gImds
aWItMi4wIHh6IHpzdGQiCiAKLS0gCjIuNDcuMQoK

--===============2254148407742662233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libxmlb-changelog.txt"

Version 0.3.30
~~~~~~~~~~~~~~
Released: 2026-11-10

New Features:
 - Add support for the XPath normalize-space() function (Richard Hughes)
 - Increase the maximum number of node attributes and tokens (Richard Hughes)
 - Record in the silo if the node was added as external info (Richard Hughes)

Bugfixes:
 - Convert xml:lang tags to POSIX form when required (Richard Hughes)
 - Fix OR branches still being evaluated after the limit is reached (Richard
   Hughes)
 - Fix XbLzmaDecompressor reset leaving the stream unusable (Richard Hughes)
 - Fix a bound value losing its level inside a tuple (Richard Hughes)
 - Fix a crash when a query value was never bound (Richard Hughes)
 - Fix a crash when searching one silo from several threads (car12o)
 - Fix comma-separated function arguments being parsed in reverse (Richard
   Hughes)
 - Fix escaped tab and newline not decoding in query parsing (Richard Hughes)
 - Fix literal backslashes not surviving the query escape round-trip (Richard
   Hughes)
 - Fix mixed-type comparisons swapping their operands (Richard Hughes)
 - Fix parser depth leaking from one failed source to the next (Richard Hughes)
 - Fix unbound query variables silently comparing against zero (Richard Hughes)
 - Fix unfinished predicates being ignored at the start of a section (Richard
   Hughes)
 - Fix xb_query_context_copy() silently dropping bindings after a gap (Richard
   Hughes)
 - Fix xb_silo_stem() returning the unstemmed string on equal length (Richard
   Hughes)
 - Fix xb_value_bindings_copy() aborting when a slot is unbound (Richard Hughes)

--===============2254148407742662233==--
