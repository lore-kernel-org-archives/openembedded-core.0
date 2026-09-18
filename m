Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892A7C88E75
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 05:47:27 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4956.1789710433625615250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 22:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kOwRDU+O;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3+kDheKT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0b30e0db2-db85192c-00c8-4c65-838a-234fef0a179b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789710437;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r/Huke6YUevRgFQ95HFQuwqXZuIkYlZa/wa9geLEGFM=;
	b=kOwRDU+OarZ+0tCRU/w4zV2SDdFoubzu1SUzGWjM1V4JnooSl/i/yuBWnJfctkUF
	wvdLuOp3uxOVPFqgj+ANZrnO2UTkHfcSnYQxvLHXgewR2qUpjTiu/E2FfoHpJetNYOA
	8+H2/LU8ux4g8uLBV+C1p/SxEmF9b5YmyxduNxQg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789710437;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r/Huke6YUevRgFQ95HFQuwqXZuIkYlZa/wa9geLEGFM=;
	b=3+kDheKTNxVDAMK2RxvHIXIigHPnyITimyRqWCtUVnBktBRHUlc2RLDTr3toXPWU
	0nnPjn5juymxgrphvzl1/ztXHsLFFwn7ZDcMOuYHT2Sni9PNAMcNluh9nADvGsmJAK8
	B4gQcLBKH9UU5x3hrqJ+Mv4AiYh2VWhneP3502lA=
Content-Type: multipart/mixed; boundary="===============3328283949310490558=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sumanth Gavini <sumanth.gavini@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 710 SUCCEEDED
Message-ID: <010101a0b30e0db2-db85192c-00c8-4c65-838a-234fef0a179b-000000@us-west-2.amazonses.com>
Date: Fri, 18 Sep 2026 05:47:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 05:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246187

--===============3328283949310490558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *less* to *710* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-704-710.patch
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
From e89d1a69e32dbdbba081ed84979874f5cb9a3ec3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 18 Sep 2026 05:45:33 +0000
Subject: [PATCH] less: upgrade 704 -> 710

Source: NEWS

======================================================================

	Major changes between "less" versions 704 and 710

* Add || command.

* In | and || commands, ^N allows entering line number instead of mark letter.

* Add "ESC-]" / "ESC-RIGHTARROW" (right-limit-scroll) command (github #783).

* In lesskey files, add \k^x syntax for control chars and \k+x syntax
  for shifted chars.

* Underline OSC 8 links in text.

* Add -DO for custom coloring of OSC 8 links.

* Add LESSMSG, which allows translation of messages into other languages.

* Add LESSSECURE_DISALLOW.

* Add LESS_SHELL_COPTION.

* Add %G, %y, and %% in prompt strings.

* Add lesskey support for shift-uparrow, shift-downarrow, shift-pageup,
  shift-pagedown, ctl-uparrow, ctl-downarrow, ctl-pageup, ctl-pagedown,
  shift-delete.

* Change "make check" to use nonstandard object and binary file names,
  to avoid accidentally installing test binaries (github #791).

* Fix issues on systems with volatile getenv return values.

* Improve error handling for malformed binary lesskey file.

* Improve messaging when using __mouse after --emouse (github #808).

* Remove support for obsolete pre-241 lesskey binary format.

* Remove obsolete lesskey program.

* Move lesskey man page to section 5.

* Update display when resize window while in F mode on Windows.

* Fix missing "END" message at end of &-filtered output (github #774).

* Fix missing bell with G command at end of &-filtered output (github #774).

* Don't reset signal handlers in a subprocess on Windows.

* Fix ' command to not modify the mark when given a numeric argument
  (github #799).

* Fix erroneous message from --rscroll command when rscroll char is non-ASCII.

* Fix unexpected exit when TERM is invalid (github #809).

* Fix possible crash when use ":e #" after ":d" (github #810).

* Fix infinite loop if invalid option letter in LESS_UNSUPPORT.

* Fix crash if run !! command with no previous ! command (github #812).

* Fix inability to run a shell command starting with "!" character.

* Fix bugs using ^S search modifier (github #814).

* Fix display bugs when a status message contains non-ASCII chars
  or is displayed on a very narrow screen (github #816).

* Fix bug defining command which has a built-in command as a prefix
  (github #795).

* Fix string overrrun if input contains "\e\0".

* Fix memory leak when using ${...} in lesskey file.

* Fix status column display when long line is marked (github #820).
---
 meta/recipes-extended/less/{less_704.bb => less_710.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_704.bb => less_710.bb} (94%)

diff --git a/meta/recipes-extended/less/less_704.bb b/meta/recipes-extended/less/less_710.bb
similarity index 94%
rename from meta/recipes-extended/less/less_704.bb
rename to meta/recipes-extended/less/less_710.bb
index dc841a9ae6..f3f5ebd6a1 100644
--- a/meta/recipes-extended/less/less_704.bb
+++ b/meta/recipes-extended/less/less_710.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb"
+SRC_URI[sha256sum] = "d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.47.1


--===============3328283949310490558==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-704-710.patch"

RnJvbSBlODlkMWE2OWUzMmRiZGJiYTA4MWVkODQ5Nzk4NzRmNWNiOWEzZWMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTggU2VwIDIwMjYgMDU6NDU6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
ZXNzOiB1cGdyYWRlIDcwNCAtPiA3MTAKClNvdXJjZTogTkVXUwoKPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKCU1h
am9yIGNoYW5nZXMgYmV0d2VlbiAibGVzcyIgdmVyc2lvbnMgNzA0IGFuZCA3MTAKCiogQWRkIHx8
IGNvbW1hbmQuCgoqIEluIHwgYW5kIHx8IGNvbW1hbmRzLCBeTiBhbGxvd3MgZW50ZXJpbmcgbGlu
ZSBudW1iZXIgaW5zdGVhZCBvZiBtYXJrIGxldHRlci4KCiogQWRkICJFU0MtXSIgLyAiRVNDLVJJ
R0hUQVJST1ciIChyaWdodC1saW1pdC1zY3JvbGwpIGNvbW1hbmQgKGdpdGh1YiAjNzgzKS4KCiog
SW4gbGVzc2tleSBmaWxlcywgYWRkIFxrXnggc3ludGF4IGZvciBjb250cm9sIGNoYXJzIGFuZCBc
ayt4IHN5bnRheAogIGZvciBzaGlmdGVkIGNoYXJzLgoKKiBVbmRlcmxpbmUgT1NDIDggbGlua3Mg
aW4gdGV4dC4KCiogQWRkIC1ETyBmb3IgY3VzdG9tIGNvbG9yaW5nIG9mIE9TQyA4IGxpbmtzLgoK
KiBBZGQgTEVTU01TRywgd2hpY2ggYWxsb3dzIHRyYW5zbGF0aW9uIG9mIG1lc3NhZ2VzIGludG8g
b3RoZXIgbGFuZ3VhZ2VzLgoKKiBBZGQgTEVTU1NFQ1VSRV9ESVNBTExPVy4KCiogQWRkIExFU1Nf
U0hFTExfQ09QVElPTi4KCiogQWRkICVHLCAleSwgYW5kICUlIGluIHByb21wdCBzdHJpbmdzLgoK
KiBBZGQgbGVzc2tleSBzdXBwb3J0IGZvciBzaGlmdC11cGFycm93LCBzaGlmdC1kb3duYXJyb3cs
IHNoaWZ0LXBhZ2V1cCwKICBzaGlmdC1wYWdlZG93biwgY3RsLXVwYXJyb3csIGN0bC1kb3duYXJy
b3csIGN0bC1wYWdldXAsIGN0bC1wYWdlZG93biwKICBzaGlmdC1kZWxldGUuCgoqIENoYW5nZSAi
bWFrZSBjaGVjayIgdG8gdXNlIG5vbnN0YW5kYXJkIG9iamVjdCBhbmQgYmluYXJ5IGZpbGUgbmFt
ZXMsCiAgdG8gYXZvaWQgYWNjaWRlbnRhbGx5IGluc3RhbGxpbmcgdGVzdCBiaW5hcmllcyAoZ2l0
aHViICM3OTEpLgoKKiBGaXggaXNzdWVzIG9uIHN5c3RlbXMgd2l0aCB2b2xhdGlsZSBnZXRlbnYg
cmV0dXJuIHZhbHVlcy4KCiogSW1wcm92ZSBlcnJvciBoYW5kbGluZyBmb3IgbWFsZm9ybWVkIGJp
bmFyeSBsZXNza2V5IGZpbGUuCgoqIEltcHJvdmUgbWVzc2FnaW5nIHdoZW4gdXNpbmcgX19tb3Vz
ZSBhZnRlciAtLWVtb3VzZSAoZ2l0aHViICM4MDgpLgoKKiBSZW1vdmUgc3VwcG9ydCBmb3Igb2Jz
b2xldGUgcHJlLTI0MSBsZXNza2V5IGJpbmFyeSBmb3JtYXQuCgoqIFJlbW92ZSBvYnNvbGV0ZSBs
ZXNza2V5IHByb2dyYW0uCgoqIE1vdmUgbGVzc2tleSBtYW4gcGFnZSB0byBzZWN0aW9uIDUuCgoq
IFVwZGF0ZSBkaXNwbGF5IHdoZW4gcmVzaXplIHdpbmRvdyB3aGlsZSBpbiBGIG1vZGUgb24gV2lu
ZG93cy4KCiogRml4IG1pc3NpbmcgIkVORCIgbWVzc2FnZSBhdCBlbmQgb2YgJi1maWx0ZXJlZCBv
dXRwdXQgKGdpdGh1YiAjNzc0KS4KCiogRml4IG1pc3NpbmcgYmVsbCB3aXRoIEcgY29tbWFuZCBh
dCBlbmQgb2YgJi1maWx0ZXJlZCBvdXRwdXQgKGdpdGh1YiAjNzc0KS4KCiogRG9uJ3QgcmVzZXQg
c2lnbmFsIGhhbmRsZXJzIGluIGEgc3VicHJvY2VzcyBvbiBXaW5kb3dzLgoKKiBGaXggJyBjb21t
YW5kIHRvIG5vdCBtb2RpZnkgdGhlIG1hcmsgd2hlbiBnaXZlbiBhIG51bWVyaWMgYXJndW1lbnQK
ICAoZ2l0aHViICM3OTkpLgoKKiBGaXggZXJyb25lb3VzIG1lc3NhZ2UgZnJvbSAtLXJzY3JvbGwg
Y29tbWFuZCB3aGVuIHJzY3JvbGwgY2hhciBpcyBub24tQVNDSUkuCgoqIEZpeCB1bmV4cGVjdGVk
IGV4aXQgd2hlbiBURVJNIGlzIGludmFsaWQgKGdpdGh1YiAjODA5KS4KCiogRml4IHBvc3NpYmxl
IGNyYXNoIHdoZW4gdXNlICI6ZSAjIiBhZnRlciAiOmQiIChnaXRodWIgIzgxMCkuCgoqIEZpeCBp
bmZpbml0ZSBsb29wIGlmIGludmFsaWQgb3B0aW9uIGxldHRlciBpbiBMRVNTX1VOU1VQUE9SVC4K
CiogRml4IGNyYXNoIGlmIHJ1biAhISBjb21tYW5kIHdpdGggbm8gcHJldmlvdXMgISBjb21tYW5k
IChnaXRodWIgIzgxMikuCgoqIEZpeCBpbmFiaWxpdHkgdG8gcnVuIGEgc2hlbGwgY29tbWFuZCBz
dGFydGluZyB3aXRoICIhIiBjaGFyYWN0ZXIuCgoqIEZpeCBidWdzIHVzaW5nIF5TIHNlYXJjaCBt
b2RpZmllciAoZ2l0aHViICM4MTQpLgoKKiBGaXggZGlzcGxheSBidWdzIHdoZW4gYSBzdGF0dXMg
bWVzc2FnZSBjb250YWlucyBub24tQVNDSUkgY2hhcnMKICBvciBpcyBkaXNwbGF5ZWQgb24gYSB2
ZXJ5IG5hcnJvdyBzY3JlZW4gKGdpdGh1YiAjODE2KS4KCiogRml4IGJ1ZyBkZWZpbmluZyBjb21t
YW5kIHdoaWNoIGhhcyBhIGJ1aWx0LWluIGNvbW1hbmQgYXMgYSBwcmVmaXgKICAoZ2l0aHViICM3
OTUpLgoKKiBGaXggc3RyaW5nIG92ZXJycnVuIGlmIGlucHV0IGNvbnRhaW5zICJcZVwwIi4KCiog
Rml4IG1lbW9yeSBsZWFrIHdoZW4gdXNpbmcgJHsuLi59IGluIGxlc3NrZXkgZmlsZS4KCiogRml4
IHN0YXR1cyBjb2x1bW4gZGlzcGxheSB3aGVuIGxvbmcgbGluZSBpcyBtYXJrZWQgKGdpdGh1YiAj
ODIwKS4KLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy97bGVzc183MDQuYmIgPT4gbGVz
c183MTAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3Mve2xlc3NfNzA0LmJiID0+
IGxlc3NfNzEwLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
ZXNzL2xlc3NfNzA0LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc183MTAuYmIK
c2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xl
c3MvbGVzc183MDQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3Nf
NzEwLmJiCmluZGV4IGRjODQxYTlhZTYuLmYzZjVlYmQ2YTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNzA0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9sZXNzL2xlc3NfNzEwLmJiCkBAIC0yOSw3ICsyOSw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL3d3
dy5ncmVlbndvb2Rzb2Z0d2FyZS5jb20vJHtCUE59LyR7QlBOfS0ke1BWfS50YXIuZ3ogXAogICAg
ICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMjBhMGIwYTJiYjI1MjVmYTUzYzdlZWU5YmViODU0YjRjOWNmMTcyZWFiYjIwOWFm
NzAyMDc0MzU0N2JmZTlmYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkMTAwOGZiNzhkY2FlMTMy
M2RkYWI2NjRiY2IzNTJhNjFmMDIyYjFiMTMxYmQ4MDE4NTQ4ZTAyMWQ5NzVlYzdhIgogCiBVUFNU
UkVBTV9DSEVDS19VUkkgPSAiaHR0cDovL3d3dy5ncmVlbndvb2Rzb2Z0d2FyZS5jb20vbGVzcy9k
b3dubG9hZC5odG1sIgogCi0tIAoyLjQ3LjEKCg==

--===============3328283949310490558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/less/less-dev: RRECOMMENDS: removed "update-alternatives-opkg-dev"
packages/x86-64-v3-poky-linux/less/less-doc: FILELIST: removed "/usr/share/man/man1/lesskey.1", added "/usr/share/man/man5/lesskey.5"
packages/x86-64-v3-poky-linux/less/less-ptest: FILELIST: added "/usr/lib/less/ptest/lt/osc8-hilite.lt"
packages/x86-64-v3-poky-linux/less/less: FILELIST: removed "/usr/libexec/lessecho /usr/bin/less.less /usr/bin/lesskey", added "/usr/bin/less_t /usr/libexec/lessecho_t"
packages/x86-64-v3-poky-linux/less/less: RDEPENDS: removed all items "update-alternatives-opkg"
packages/x86-64-v3-poky-linux/less/less: pkg_postinst cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --install /usr/bin/less less /usr/bin/less.less 100
  --
packages/x86-64-v3-poky-linux/less/less: pkg_prerm cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --remove  less /usr/bin/less.less
  --

--===============3328283949310490558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-704.tar.gz file://run-ptest" to "http://www.greenwoodsoftware.com/less/less-710.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/less: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-dbg: FILELIST: removed "/usr/libexec/.debug/lessecho /usr/bin/.debug/less.less /usr/bin/.debug/lesskey", added "/usr/bin/.debug/less_t /usr/libexec/.debug/lessecho_t"
packages/x86-64-v3-poky-linux/less/less-dbg: PKGSIZE changed from 982408 to 1024616 (+4%)
packages/x86-64-v3-poky-linux/less/less-dbg: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-dbg: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-dev: RRECOMMENDS: removed "update-alternatives-opkg-dev"
packages/x86-64-v3-poky-linux/less/less-dev: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-dev: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-doc: FILELIST: removed "/usr/share/man/man1/lesskey.1", added "/usr/share/man/man5/lesskey.5"
packages/x86-64-v3-poky-linux/less/less-doc: PKGSIZE changed from 131257 to 135750 (+3%)
packages/x86-64-v3-poky-linux/less/less-doc: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-doc: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-locale: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-locale: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-ptest: FILELIST: added "/usr/lib/less/ptest/lt/osc8-hilite.lt"
packages/x86-64-v3-poky-linux/less/less-ptest: PKGSIZE changed from 11603240 to 11927302 (+3%)
packages/x86-64-v3-poky-linux/less/less-ptest: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-ptest: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-src: FILELIST: directory renamed /usr/src/debug/less/704/lesstest -> /usr/src/debug/less/710/lesstest, removed "/usr/src/debug/less/704/version.c /usr/src/debug/less/704/lang.h /usr/src/debug/less/704/tags.c /usr/src/debug/less/704/command.c /usr/src/debug/less/704/charset.c /usr/src/debug/less/704/brac.c /usr/src/debug/less/704/signal.c /usr/src/debug/less/704/pattern.c /usr/src/debug/less/704/lesskey_parse.c /usr/src/debug/less/704/optfunc.c /usr/src/debug/less/704/cmdbuf.c /usr/src/debug/less/704/prompt.c /usr/src/debug/less/704/output.c /usr/src/debug/less/704/option.h /usr/src/debug/less/704/decode.c /usr/src/debug/less/704/help.c /usr/src/debug/less/704/os.c /usr/src/debug/less/704/position.c /usr/src/debug/less/704/ifile.c /usr/src/debug/less/704/option.c /usr/src/debug/less/704/screen.c /usr/src/debug/less/704/main.c /usr/src/debug/less/704/xbuf.h /usr/src/debug/less/704/mark.c /usr/src/debug/less/704/xbuf.c /usr/src/debug/less/704/optt
 bl.c /usr/src/debug/less/704/funcs.h /usr/src/debug/less/704/lesskey.h /usr/src/debug/less/704/search.c /usr/src/debug/less/704/ch.c /usr/src/debug/less/704/cvt.c /usr/src/debug/less/704/line.c /usr/src/debug/less/704/edit.c /usr/src/debug/less/704/filename.c /usr/src/debug/less/704/forwback.c /usr/src/debug/less/704/lesskey.c /usr/src/debug/less/704/linenum.c /usr/src/debug/less/704/lsystem.c /usr/src/debug/less/704/input.c /usr/src/debug/less/704/less.h /usr/src/debug/less/704/jump.c /usr/src/debug/less/704/evar.c /usr/src/debug/less/704/ttyin.c /usr/src/debug/less/704/lessecho.c", added "/usr/src/debug/less/710/version.c /usr/src/debug/less/710/lang.h /usr/src/debug/less/710/tags.c /usr/src/debug/less/710/command.c /usr/src/debug/less/710/charset.c /usr/src/debug/less/710/brac.c /usr/src/debug/less/710/signal.c /usr/src/debug/less/710/pattern.c /usr/src/debug/less/710/lesskey_parse.c /usr/src/debug/less/710/lmsg.h /usr/src/debug/less/710/optfunc.c /usr/src/debug/less/710/cmdbuf.c
  /usr/src/debug/less/710/prompt.c /usr/src/debug/less/710/output.c /usr/src/debug/less/710/lmsg.c /usr/src/debug/less/710/option.h /usr/src/debug/less/710/decode.c /usr/src/debug/less/710/help.c /usr/src/debug/less/710/os.c /usr/src/debug/less/710/position.c /usr/src/debug/less/710/ifile.c /usr/src/debug/less/710/option.c /usr/src/debug/less/710/screen.c /usr/src/debug/less/710/main.c /usr/src/debug/less/710/xbuf.h /usr/src/debug/less/710/mark.c /usr/src/debug/less/710/xbuf.c /usr/src/debug/less/710/opttbl.c /usr/src/debug/less/710/funcs.h /usr/src/debug/less/710/lesskey.h /usr/src/debug/less/710/search.c /usr/src/debug/less/710/ch.c /usr/src/debug/less/710/cvt.c /usr/src/debug/less/710/line.c /usr/src/debug/less/710/edit.c /usr/src/debug/less/710/filename.c /usr/src/debug/less/710/forwback.c /usr/src/debug/less/710/linenum.c /usr/src/debug/less/710/lsystem.c /usr/src/debug/less/710/input.c /usr/src/debug/less/710/less.h /usr/src/debug/less/710/jump.c /usr/src/debug/less/710/evar.c 
 /usr/src/debug/less/710/ttyin.c /usr/src/debug/less/710/lessecho.c"
packages/x86-64-v3-poky-linux/less/less-src: PKGSIZE changed from 940404 to 955595 (+2%)
packages/x86-64-v3-poky-linux/less/less-src: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-src: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less-staticdev: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less-staticdev: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less: FILELIST: removed "/usr/bin/lesskey /usr/libexec/lessecho /usr/bin/less.less", added "/usr/libexec/lessecho_t /usr/bin/less_t"
packages/x86-64-v3-poky-linux/less/less: RDEPENDS: removed all items "update-alternatives-opkg"
packages/x86-64-v3-poky-linux/less/less: PKGSIZE changed from 317987 to 328211 (+3%)
packages/x86-64-v3-poky-linux/less/less: PV changed from "704" to "710"
packages/x86-64-v3-poky-linux/less/less: PKGV changed from 704 [default] to 710 [default]
packages/x86-64-v3-poky-linux/less/less: pkg_postinst cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --install /usr/bin/less less /usr/bin/less.less 100
  --
packages/x86-64-v3-poky-linux/less/less: pkg_prerm cleared:
  @@ -1,3 +0,0 @@
  -#!/bin/sh
  -set -e
  -	update-alternatives --remove  less /usr/bin/less.less
  --

--===============3328283949310490558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="less-changelog.txt"

Changelog for less: 704 -> 710
Source: NEWS

======================================================================

	Major changes between "less" versions 704 and 710

* Add || command.

* In | and || commands, ^N allows entering line number instead of mark letter.

* Add "ESC-]" / "ESC-RIGHTARROW" (right-limit-scroll) command (github #783).

* In lesskey files, add \k^x syntax for control chars and \k+x syntax
  for shifted chars.

* Underline OSC 8 links in text.

* Add -DO for custom coloring of OSC 8 links.

* Add LESSMSG, which allows translation of messages into other languages.

* Add LESSSECURE_DISALLOW.

* Add LESS_SHELL_COPTION.

* Add %G, %y, and %% in prompt strings.

* Add lesskey support for shift-uparrow, shift-downarrow, shift-pageup,
  shift-pagedown, ctl-uparrow, ctl-downarrow, ctl-pageup, ctl-pagedown,
  shift-delete.

* Change "make check" to use nonstandard object and binary file names,
  to avoid accidentally installing test binaries (github #791).

* Fix issues on systems with volatile getenv return values.

* Improve error handling for malformed binary lesskey file.

* Improve messaging when using __mouse after --emouse (github #808).

* Remove support for obsolete pre-241 lesskey binary format.

* Remove obsolete lesskey program.

* Move lesskey man page to section 5.

* Update display when resize window while in F mode on Windows.

* Fix missing "END" message at end of &-filtered output (github #774).

* Fix missing bell with G command at end of &-filtered output (github #774).

* Don't reset signal handlers in a subprocess on Windows.

* Fix ' command to not modify the mark when given a numeric argument
  (github #799).

* Fix erroneous message from --rscroll command when rscroll char is non-ASCII.

* Fix unexpected exit when TERM is invalid (github #809).

* Fix possible crash when use ":e #" after ":d" (github #810).

* Fix infinite loop if invalid option letter in LESS_UNSUPPORT.

* Fix crash if run !! command with no previous ! command (github #812).

* Fix inability to run a shell command starting with "!" character.

* Fix bugs using ^S search modifier (github #814).

* Fix display bugs when a status message contains non-ASCII chars
  or is displayed on a very narrow screen (github #816).

* Fix bug defining command which has a built-in command as a prefix
  (github #795).

* Fix string overrrun if input contains "\e\0".

* Fix memory leak when using ${...} in lesskey file.

* Fix status column display when long line is marked (github #820).

--===============3328283949310490558==--

