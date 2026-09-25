Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73145C9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 06:53:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2752.1790319178273097719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 23:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UJEAdBkM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JlavPVCr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0d756ae24-cde5a55d-12f9-4f45-b3c4-4a1d3e289f50-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790319177;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sAF0xqOmU9HC0OvMP2jEOVdAqfYrVJOaZK98c+qVEs0=;
	b=UJEAdBkMXKPYzgiMBbMHpSKSiSOVwGeEW1hEuFSRaFDZz1iViVy1DD9a8OqjgVO2
	bOPNdhqdTsxPHQJb3zKfbMQcoNB8XcGZ3256N0zX9tJH+rWU/7Cigny7TqMLf3uu0VI
	odXP2R5M9aq+OaESLuF1cRCbvj1bh8A6vO0/Qv3s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790319177;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sAF0xqOmU9HC0OvMP2jEOVdAqfYrVJOaZK98c+qVEs0=;
	b=JlavPVCrsCEdY/IUhVxhxInKZf8ssOCLbJ44go08h9rZEH50i56pG2N8lrXG4JR1
	JspMEAZvKHTg8XP+2Dm3yuKZ0GfHACBrar3e6X791Hydx/ysGfSQYr6z+RhXkTKTHUU
	dD+TuaM1ymZO8knScHX2g7jVweCnhkzTaCp8/Kek=
Content-Type: multipart/mixed; boundary="===============5540898413467964950=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] parted: upgrading to 3.8 SUCCEEDED
Message-ID: <010101a0d756ae24-cde5a55d-12f9-4f45-b3c4-4a1d3e289f50-000000@us-west-2.amazonses.com>
Date: Fri, 25 Sep 2026 06:52:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.25-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 06:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246605

--===============5540898413467964950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *parted* to *3.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-parted-upgrade-3.7-3.8.patch
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
From 7a9e1dc5a9715d0bfa64d94810aacfdd0c6add19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 25 Sep 2026 05:39:05 +0000
Subject: [PATCH] parted: upgrade 3.7 -> 3.8

version 3.8
NEWS: Releasing stable version 3.8
maint: Update to latest gnulib
maint: post-release administrivia
version 3.7.14
maint: Update to latest gnulib
NEWS: Update news for next release

hurd: Fix gnu_read problems with block size > 512b
This fixes offset calculations when the block size is larger than 512b
by checking for negative offsets, and skips the copy of the length is
zero.

NOTE: This error was found by an AI scan of parted by AISLE, and the
patch is mostly the patch suggested by the analysis. It has been
reviewed by Samuel and I.

Assisted-by: AISLE in partnership with Red Hat
maint: post-release administrivia
version 3.7.13
NEWS: Update news for next release

maint: Update copyright statements to 2026
by running make update-copyright

maint: Update to latest gnulib and bootstrap script

parted: Fix partition number allocation in do_print
GPT can have up to 8192 partitions, but we only allocate 4 bytes (two of
which are for a space and a \0). Increase this to 6 so that more than 99
partitions doesn't overflow the temporary variable.

fdasd: Make sure data set name is positive
Passing a negative value, eg. PART-999, to atoi could result in passing
a negative value to the setpos call when it writes f1_counter.

This adds an exception check to ensure the result of the atoi is always
positive, and it preserves the rest of the logic which depends on n being
1 less than the value.

resize: Make sure hfsc_new_cachetable cannot overflow on 32bit
Add a couple of PED_ASSERT checks on size to make sure the ped_malloc
call doesn't allocate less than expected.

resize: Make sure 32bit build cannot overflow frag_count
Add a couple of PED_ASSERT checks to fat_op_context_new that make sure
the frag_count value can be allocated. Does not effect 64bit
architectures.

libparted: Catch FAT metadata triggered errors
Bad metadata can trigger a buffer overflow in fat resize code. Trigger
an assert when the sector count is too large, or malloc is called with a
size of 0

Adds a new test that checks to make sure that the assert is triggered.
This includes a test for deep directory traversal which should be caught
by glibc and reported as 'buffer overflow detected'.

This also includes a check on the flag_traverse_dir dir_name length to
prevent an overflow of the 4k buffer with deeply nested directories.
Also include a test for this assertion.

WARNING: parted should be build with debug enabled (which is the
default) this enables a large number of PED_ASSERT checks which catch
various conditions like these.

This fixes two CVE's:
 - CVE-2026-89085 - heap buffer overflow in _init_fats / fat_table_read
 - CVE-2026-89088 - heap buffer overflow in duplicate_legacy_root_dir

Adding support for ExFAT filesystem
Added and registered exfat probing function
Updated msdos label probe to properly detect full-disk exfat fs
Reflected ExFAT support in doc
Added ExFAT detection test in t1700-probe-fs.sh

Cleanup zero as null pointer constant warnings
Pointer types should be set to NULL, not zero. gcc is now warning about
these with:
  warning: zero as null pointer constant [-Wzero-as-null-pointer-constant]

This cleans up all the uses found when running make with gcc 16.0.1
README-release: Fix typos in doxygen instructions

maint: Distribute Doxyfile
This makes it easier for downstream packages to ship API documentation
(see e.g. https://bugs.debian.org/1119679).

bug#80795: [PATCH] build: mark functions with const attribute, per gcc warnings
fixes warning since glibc-2.43

For ISO C23, the functions wcschr that return pointers into their
input arrays now have definitions as macros that return a pointer
to a const-qualified type when the input argument is a pointer to a
const-qualified type.

../../parted/strlist.c: In function 'wchar_strchr':
../../parted/strlist.c:61:16: warning: return discards 'const' qualifier from
pointer target type [-Wdiscarded-qualifiers]
   61 |         return wcschr (str, ch);
      |                ^~~~~~

maint: post-release administrivia
---
 ...1-t9042-dos-partition-limit.sh-unconditionally-skip.patch | 5 +----
 meta/recipes-extended/parted/files/fix-doc-mandir.patch      | 2 +-
 .../recipes-extended/parted/{parted_3.7.bb => parted_3.8.bb} | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/parted/{parted_3.7.bb => parted_3.8.bb} (96%)

diff --git a/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch b/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch
index bec7eabebe..d5d3481b47 100644
--- a/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch
+++ b/meta/recipes-extended/parted/files/0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch
@@ -1,4 +1,4 @@
-From b03c399e392c492782e680f66dd47bd34b325ab9 Mon Sep 17 00:00:00 2001
+From c8168ea990a1048eb01b20433b754244cdf0c475 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Wed, 8 Jul 2026 09:45:06 -0400
 Subject: [PATCH] t9042-dos-partition-limit.sh: unconditionally skip
@@ -26,6 +26,3 @@ index 87a32df..d6e8d75 100644
  grep '^#define USE_BLKID 1' "$CONFIG_HEADER" > /dev/null ||
    skip_ 'this system lacks a new-enough libblkid'
  
--- 
-2.55.0
-
diff --git a/meta/recipes-extended/parted/files/fix-doc-mandir.patch b/meta/recipes-extended/parted/files/fix-doc-mandir.patch
index 76551f0b6e..65c78d4e46 100644
--- a/meta/recipes-extended/parted/files/fix-doc-mandir.patch
+++ b/meta/recipes-extended/parted/files/fix-doc-mandir.patch
@@ -1,4 +1,4 @@
-From fe0f3729a7b6396b0d9cc54897955c1af56fc9db Mon Sep 17 00:00:00 2001
+From b41b5d85eb38efc12e17def65ff172036844c8b1 Mon Sep 17 00:00:00 2001
 From: Andreas Oberritter <obi@opendreambox.org>
 Date: Thu, 15 Mar 2012 23:17:52 +0100
 Subject: [PATCH] parted: update to version 3.1
diff --git a/meta/recipes-extended/parted/parted_3.7.bb b/meta/recipes-extended/parted/parted_3.8.bb
similarity index 96%
rename from meta/recipes-extended/parted/parted_3.7.bb
rename to meta/recipes-extended/parted/parted_3.8.bb
index a669919dd7..13115a20c6 100644
--- a/meta/recipes-extended/parted/parted_3.7.bb
+++ b/meta/recipes-extended/parted/parted_3.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
 SRC_URI:append:riscv64 = " file://0001-t9042-dos-partition-limit.sh-unconditionally-skip.patch \
                            "
 
-SRC_URI[sha256sum] = "008de57561a4f3c25a0648e66ed11e7b30be493889b64334a6d70f2c1951ef7b"
+SRC_URI[sha256sum] = "a2b7811f47b0ddb1f7b1d0aa456f7c1270da70708ce231c2fe054c7199eafa63"
 
 inherit autotools pkgconfig gettext texinfo ptest
 
-- 
2.47.1


--===============5540898413467964950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/parted/parted-ptest: FILELIST: added "/usr/lib/parted/ptest/tests/t3001-buffer.sh"
packages/x86-64-v3-poky-linux/parted/parted-src: PKGSIZE changed from 2804932 to 3172162 (+13%)
packages/x86-64-v3-poky-linux/parted/parted: PKGSIZE changed from 629534 to 715582 (+14%)

--===============5540898413467964950==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-parted-upgrade-3.7-3.8.patch"

RnJvbSA3YTllMWRjNWE5NzE1ZDBiZmE2NGQ5NDgxMGFhY2ZkZDBjNmFkZDE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjUgU2VwIDIwMjYgMDU6Mzk6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
YXJ0ZWQ6IHVwZ3JhZGUgMy43IC0+IDMuOAoKdmVyc2lvbiAzLjgKTkVXUzogUmVsZWFzaW5nIHN0
YWJsZSB2ZXJzaW9uIDMuOAptYWludDogVXBkYXRlIHRvIGxhdGVzdCBnbnVsaWIKbWFpbnQ6IHBv
c3QtcmVsZWFzZSBhZG1pbmlzdHJpdmlhCnZlcnNpb24gMy43LjE0Cm1haW50OiBVcGRhdGUgdG8g
bGF0ZXN0IGdudWxpYgpORVdTOiBVcGRhdGUgbmV3cyBmb3IgbmV4dCByZWxlYXNlCgpodXJkOiBG
aXggZ251X3JlYWQgcHJvYmxlbXMgd2l0aCBibG9jayBzaXplID4gNTEyYgpUaGlzIGZpeGVzIG9m
ZnNldCBjYWxjdWxhdGlvbnMgd2hlbiB0aGUgYmxvY2sgc2l6ZSBpcyBsYXJnZXIgdGhhbiA1MTJi
CmJ5IGNoZWNraW5nIGZvciBuZWdhdGl2ZSBvZmZzZXRzLCBhbmQgc2tpcHMgdGhlIGNvcHkgb2Yg
dGhlIGxlbmd0aCBpcwp6ZXJvLgoKTk9URTogVGhpcyBlcnJvciB3YXMgZm91bmQgYnkgYW4gQUkg
c2NhbiBvZiBwYXJ0ZWQgYnkgQUlTTEUsIGFuZCB0aGUKcGF0Y2ggaXMgbW9zdGx5IHRoZSBwYXRj
aCBzdWdnZXN0ZWQgYnkgdGhlIGFuYWx5c2lzLiBJdCBoYXMgYmVlbgpyZXZpZXdlZCBieSBTYW11
ZWwgYW5kIEkuCgpBc3Npc3RlZC1ieTogQUlTTEUgaW4gcGFydG5lcnNoaXAgd2l0aCBSZWQgSGF0
Cm1haW50OiBwb3N0LXJlbGVhc2UgYWRtaW5pc3RyaXZpYQp2ZXJzaW9uIDMuNy4xMwpORVdTOiBV
cGRhdGUgbmV3cyBmb3IgbmV4dCByZWxlYXNlCgptYWludDogVXBkYXRlIGNvcHlyaWdodCBzdGF0
ZW1lbnRzIHRvIDIwMjYKYnkgcnVubmluZyBtYWtlIHVwZGF0ZS1jb3B5cmlnaHQKCm1haW50OiBV
cGRhdGUgdG8gbGF0ZXN0IGdudWxpYiBhbmQgYm9vdHN0cmFwIHNjcmlwdAoKcGFydGVkOiBGaXgg
cGFydGl0aW9uIG51bWJlciBhbGxvY2F0aW9uIGluIGRvX3ByaW50CkdQVCBjYW4gaGF2ZSB1cCB0
byA4MTkyIHBhcnRpdGlvbnMsIGJ1dCB3ZSBvbmx5IGFsbG9jYXRlIDQgYnl0ZXMgKHR3byBvZgp3
aGljaCBhcmUgZm9yIGEgc3BhY2UgYW5kIGEgXDApLiBJbmNyZWFzZSB0aGlzIHRvIDYgc28gdGhh
dCBtb3JlIHRoYW4gOTkKcGFydGl0aW9ucyBkb2Vzbid0IG92ZXJmbG93IHRoZSB0ZW1wb3Jhcnkg
dmFyaWFibGUuCgpmZGFzZDogTWFrZSBzdXJlIGRhdGEgc2V0IG5hbWUgaXMgcG9zaXRpdmUKUGFz
c2luZyBhIG5lZ2F0aXZlIHZhbHVlLCBlZy4gUEFSVC05OTksIHRvIGF0b2kgY291bGQgcmVzdWx0
IGluIHBhc3NpbmcKYSBuZWdhdGl2ZSB2YWx1ZSB0byB0aGUgc2V0cG9zIGNhbGwgd2hlbiBpdCB3
cml0ZXMgZjFfY291bnRlci4KClRoaXMgYWRkcyBhbiBleGNlcHRpb24gY2hlY2sgdG8gZW5zdXJl
IHRoZSByZXN1bHQgb2YgdGhlIGF0b2kgaXMgYWx3YXlzCnBvc2l0aXZlLCBhbmQgaXQgcHJlc2Vy
dmVzIHRoZSByZXN0IG9mIHRoZSBsb2dpYyB3aGljaCBkZXBlbmRzIG9uIG4gYmVpbmcKMSBsZXNz
IHRoYW4gdGhlIHZhbHVlLgoKcmVzaXplOiBNYWtlIHN1cmUgaGZzY19uZXdfY2FjaGV0YWJsZSBj
YW5ub3Qgb3ZlcmZsb3cgb24gMzJiaXQKQWRkIGEgY291cGxlIG9mIFBFRF9BU1NFUlQgY2hlY2tz
IG9uIHNpemUgdG8gbWFrZSBzdXJlIHRoZSBwZWRfbWFsbG9jCmNhbGwgZG9lc24ndCBhbGxvY2F0
ZSBsZXNzIHRoYW4gZXhwZWN0ZWQuCgpyZXNpemU6IE1ha2Ugc3VyZSAzMmJpdCBidWlsZCBjYW5u
b3Qgb3ZlcmZsb3cgZnJhZ19jb3VudApBZGQgYSBjb3VwbGUgb2YgUEVEX0FTU0VSVCBjaGVja3Mg
dG8gZmF0X29wX2NvbnRleHRfbmV3IHRoYXQgbWFrZSBzdXJlCnRoZSBmcmFnX2NvdW50IHZhbHVl
IGNhbiBiZSBhbGxvY2F0ZWQuIERvZXMgbm90IGVmZmVjdCA2NGJpdAphcmNoaXRlY3R1cmVzLgoK
bGlicGFydGVkOiBDYXRjaCBGQVQgbWV0YWRhdGEgdHJpZ2dlcmVkIGVycm9ycwpCYWQgbWV0YWRh
dGEgY2FuIHRyaWdnZXIgYSBidWZmZXIgb3ZlcmZsb3cgaW4gZmF0IHJlc2l6ZSBjb2RlLiBUcmln
Z2VyCmFuIGFzc2VydCB3aGVuIHRoZSBzZWN0b3IgY291bnQgaXMgdG9vIGxhcmdlLCBvciBtYWxs
b2MgaXMgY2FsbGVkIHdpdGggYQpzaXplIG9mIDAKCkFkZHMgYSBuZXcgdGVzdCB0aGF0IGNoZWNr
cyB0byBtYWtlIHN1cmUgdGhhdCB0aGUgYXNzZXJ0IGlzIHRyaWdnZXJlZC4KVGhpcyBpbmNsdWRl
cyBhIHRlc3QgZm9yIGRlZXAgZGlyZWN0b3J5IHRyYXZlcnNhbCB3aGljaCBzaG91bGQgYmUgY2F1
Z2h0CmJ5IGdsaWJjIGFuZCByZXBvcnRlZCBhcyAnYnVmZmVyIG92ZXJmbG93IGRldGVjdGVkJy4K
ClRoaXMgYWxzbyBpbmNsdWRlcyBhIGNoZWNrIG9uIHRoZSBmbGFnX3RyYXZlcnNlX2RpciBkaXJf
bmFtZSBsZW5ndGggdG8KcHJldmVudCBhbiBvdmVyZmxvdyBvZiB0aGUgNGsgYnVmZmVyIHdpdGgg
ZGVlcGx5IG5lc3RlZCBkaXJlY3Rvcmllcy4KQWxzbyBpbmNsdWRlIGEgdGVzdCBmb3IgdGhpcyBh
c3NlcnRpb24uCgpXQVJOSU5HOiBwYXJ0ZWQgc2hvdWxkIGJlIGJ1aWxkIHdpdGggZGVidWcgZW5h
YmxlZCAod2hpY2ggaXMgdGhlCmRlZmF1bHQpIHRoaXMgZW5hYmxlcyBhIGxhcmdlIG51bWJlciBv
ZiBQRURfQVNTRVJUIGNoZWNrcyB3aGljaCBjYXRjaAp2YXJpb3VzIGNvbmRpdGlvbnMgbGlrZSB0
aGVzZS4KClRoaXMgZml4ZXMgdHdvIENWRSdzOgogLSBDVkUtMjAyNi04OTA4NSAtIGhlYXAgYnVm
ZmVyIG92ZXJmbG93IGluIF9pbml0X2ZhdHMgLyBmYXRfdGFibGVfcmVhZAogLSBDVkUtMjAyNi04
OTA4OCAtIGhlYXAgYnVmZmVyIG92ZXJmbG93IGluIGR1cGxpY2F0ZV9sZWdhY3lfcm9vdF9kaXIK
CkFkZGluZyBzdXBwb3J0IGZvciBFeEZBVCBmaWxlc3lzdGVtCkFkZGVkIGFuZCByZWdpc3RlcmVk
IGV4ZmF0IHByb2JpbmcgZnVuY3Rpb24KVXBkYXRlZCBtc2RvcyBsYWJlbCBwcm9iZSB0byBwcm9w
ZXJseSBkZXRlY3QgZnVsbC1kaXNrIGV4ZmF0IGZzClJlZmxlY3RlZCBFeEZBVCBzdXBwb3J0IGlu
IGRvYwpBZGRlZCBFeEZBVCBkZXRlY3Rpb24gdGVzdCBpbiB0MTcwMC1wcm9iZS1mcy5zaAoKQ2xl
YW51cCB6ZXJvIGFzIG51bGwgcG9pbnRlciBjb25zdGFudCB3YXJuaW5ncwpQb2ludGVyIHR5cGVz
IHNob3VsZCBiZSBzZXQgdG8gTlVMTCwgbm90IHplcm8uIGdjYyBpcyBub3cgd2FybmluZyBhYm91
dAp0aGVzZSB3aXRoOgogIHdhcm5pbmc6IHplcm8gYXMgbnVsbCBwb2ludGVyIGNvbnN0YW50IFst
V3plcm8tYXMtbnVsbC1wb2ludGVyLWNvbnN0YW50XQoKVGhpcyBjbGVhbnMgdXAgYWxsIHRoZSB1
c2VzIGZvdW5kIHdoZW4gcnVubmluZyBtYWtlIHdpdGggZ2NjIDE2LjAuMQpSRUFETUUtcmVsZWFz
ZTogRml4IHR5cG9zIGluIGRveHlnZW4gaW5zdHJ1Y3Rpb25zCgptYWludDogRGlzdHJpYnV0ZSBE
b3h5ZmlsZQpUaGlzIG1ha2VzIGl0IGVhc2llciBmb3IgZG93bnN0cmVhbSBwYWNrYWdlcyB0byBz
aGlwIEFQSSBkb2N1bWVudGF0aW9uCihzZWUgZS5nLiBodHRwczovL2J1Z3MuZGViaWFuLm9yZy8x
MTE5Njc5KS4KCmJ1ZyM4MDc5NTogW1BBVENIXSBidWlsZDogbWFyayBmdW5jdGlvbnMgd2l0aCBj
b25zdCBhdHRyaWJ1dGUsIHBlciBnY2Mgd2FybmluZ3MKZml4ZXMgd2FybmluZyBzaW5jZSBnbGli
Yy0yLjQzCgpGb3IgSVNPIEMyMywgdGhlIGZ1bmN0aW9ucyB3Y3NjaHIgdGhhdCByZXR1cm4gcG9p
bnRlcnMgaW50byB0aGVpcgppbnB1dCBhcnJheXMgbm93IGhhdmUgZGVmaW5pdGlvbnMgYXMgbWFj
cm9zIHRoYXQgcmV0dXJuIGEgcG9pbnRlcgp0byBhIGNvbnN0LXF1YWxpZmllZCB0eXBlIHdoZW4g
dGhlIGlucHV0IGFyZ3VtZW50IGlzIGEgcG9pbnRlciB0byBhCmNvbnN0LXF1YWxpZmllZCB0eXBl
LgoKLi4vLi4vcGFydGVkL3N0cmxpc3QuYzogSW4gZnVuY3Rpb24gJ3djaGFyX3N0cmNocic6Ci4u
Ly4uL3BhcnRlZC9zdHJsaXN0LmM6NjE6MTY6IHdhcm5pbmc6IHJldHVybiBkaXNjYXJkcyAnY29u
c3QnIHF1YWxpZmllciBmcm9tCnBvaW50ZXIgdGFyZ2V0IHR5cGUgWy1XZGlzY2FyZGVkLXF1YWxp
ZmllcnNdCiAgIDYxIHwgICAgICAgICByZXR1cm4gd2NzY2hyIChzdHIsIGNoKTsKICAgICAgfCAg
ICAgICAgICAgICAgICBefn5+fn4KCm1haW50OiBwb3N0LXJlbGVhc2UgYWRtaW5pc3RyaXZpYQot
LS0KIC4uLjEtdDkwNDItZG9zLXBhcnRpdGlvbi1saW1pdC5zaC11bmNvbmRpdGlvbmFsbHktc2tp
cC5wYXRjaCB8IDUgKy0tLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvZmlsZXMvZml4
LWRvYy1tYW5kaXIucGF0Y2ggICAgICB8IDIgKy0KIC4uLi9yZWNpcGVzLWV4dGVuZGVkL3BhcnRl
ZC97cGFydGVkXzMuNy5iYiA9PiBwYXJ0ZWRfMy44LmJifSB8IDIgKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9wYXJ0ZWQve3BhcnRlZF8zLjcuYmIgPT4gcGFydGVkXzMuOC5iYn0gKDk2JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFydGVkL2ZpbGVzLzAwMDEtdDkwNDIt
ZG9zLXBhcnRpdGlvbi1saW1pdC5zaC11bmNvbmRpdGlvbmFsbHktc2tpcC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvZmlsZXMvMDAwMS10OTA0Mi1kb3MtcGFydGl0aW9uLWxp
bWl0LnNoLXVuY29uZGl0aW9uYWxseS1za2lwLnBhdGNoCmluZGV4IGJlYzdlYWJlYmUuLmQ1ZDM0
ODFiNDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvZmlsZXMvMDAw
MS10OTA0Mi1kb3MtcGFydGl0aW9uLWxpbWl0LnNoLXVuY29uZGl0aW9uYWxseS1za2lwLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvZmlsZXMvMDAwMS10OTA0Mi1kb3Mt
cGFydGl0aW9uLWxpbWl0LnNoLXVuY29uZGl0aW9uYWxseS1za2lwLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBiMDNjMzk5ZTM5MmM0OTI3ODJlNjgwZjY2ZGQ0N2JkMzRiMzI1YWI5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjODE2OGVhOTkwYTEwNDhlYjAxYjIwNDMzYjc1NDI0
NGNkZjBjNDc1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHJldm9yIEdhbWJsaW4g
PHRnYW1ibGluQGJheWxpYnJlLmNvbT4KIERhdGU6IFdlZCwgOCBKdWwgMjAyNiAwOTo0NTowNiAt
MDQwMAogU3ViamVjdDogW1BBVENIXSB0OTA0Mi1kb3MtcGFydGl0aW9uLWxpbWl0LnNoOiB1bmNv
bmRpdGlvbmFsbHkgc2tpcApAQCAtMjYsNiArMjYsMyBAQCBpbmRleCA4N2EzMmRmLi5kNmU4ZDc1
IDEwMDY0NAogIGdyZXAgJ14jZGVmaW5lIFVTRV9CTEtJRCAxJyAiJENPTkZJR19IRUFERVIiID4g
L2Rldi9udWxsIHx8CiAgICBza2lwXyAndGhpcyBzeXN0ZW0gbGFja3MgYSBuZXctZW5vdWdoIGxp
YmJsa2lkJwogIAotLS0gCi0yLjU1LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3BhcnRlZC9maWxlcy9maXgtZG9jLW1hbmRpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9wYXJ0ZWQvZmlsZXMvZml4LWRvYy1tYW5kaXIucGF0Y2gKaW5kZXggNzY1NTFmMGI2ZS4u
NjVjNzhkNGU0NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhcnRlZC9maWxl
cy9maXgtZG9jLW1hbmRpci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFydGVk
L2ZpbGVzL2ZpeC1kb2MtbWFuZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmZTBmMzcy
OWE3YjYzOTZiMGQ5Y2M1NDg5Nzk1NWMxYWY1NmZjOWRiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBiNDFiNWQ4NWViMzhlZmMxMmUxN2RlZjY1ZmYxNzIwMzY4NDRjOGIxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmVhcyBPYmVycml0dGVyIDxvYmlAb3BlbmRyZWFt
Ym94Lm9yZz4KIERhdGU6IFRodSwgMTUgTWFyIDIwMTIgMjM6MTc6NTIgKzAxMDAKIFN1YmplY3Q6
IFtQQVRDSF0gcGFydGVkOiB1cGRhdGUgdG8gdmVyc2lvbiAzLjEKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvcGFydGVkXzMuNy5iYiBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9wYXJ0ZWQvcGFydGVkXzMuOC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFydGVkL3BhcnRlZF8zLjcuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvcGFydGVkXzMuOC5iYgppbmRleCBhNjY5OTE5ZGQ3
Li4xMzExNWEyMGM2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFydGVkL3Bh
cnRlZF8zLjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhcnRlZC9wYXJ0ZWRfMy44
LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9wYXJ0ZWQvcGFy
dGVkLSR7UFZ9LnRhci54eiBcCiBTUkNfVVJJOmFwcGVuZDpyaXNjdjY0ID0gIiBmaWxlOi8vMDAw
MS10OTA0Mi1kb3MtcGFydGl0aW9uLWxpbWl0LnNoLXVuY29uZGl0aW9uYWxseS1za2lwLnBhdGNo
IFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjAwOGRlNTc1NjFhNGYzYzI1YTA2NDhlNjZlZDExZTdiMzBiZTQ5Mzg4OWI2NDMzNGE2ZDcwZjJj
MTk1MWVmN2IiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTJiNzgxMWY0N2IwZGRiMWY3YjFkMGFh
NDU2ZjdjMTI3MGRhNzA3MDhjZTIzMWMyZmUwNTRjNzE5OWVhZmE2MyIKIAogaW5oZXJpdCBhdXRv
dG9vbHMgcGtnY29uZmlnIGdldHRleHQgdGV4aW5mbyBwdGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============5540898413467964950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="parted-changelog.txt"

version 3.8
NEWS: Releasing stable version 3.8
maint: Update to latest gnulib
maint: post-release administrivia
version 3.7.14
maint: Update to latest gnulib
NEWS: Update news for next release

hurd: Fix gnu_read problems with block size > 512b
This fixes offset calculations when the block size is larger than 512b
by checking for negative offsets, and skips the copy of the length is
zero.

NOTE: This error was found by an AI scan of parted by AISLE, and the
patch is mostly the patch suggested by the analysis. It has been
reviewed by Samuel and I.

Assisted-by: AISLE in partnership with Red Hat
maint: post-release administrivia
version 3.7.13
NEWS: Update news for next release

maint: Update copyright statements to 2026
by running make update-copyright

maint: Update to latest gnulib and bootstrap script

parted: Fix partition number allocation in do_print
GPT can have up to 8192 partitions, but we only allocate 4 bytes (two of
which are for a space and a \0). Increase this to 6 so that more than 99
partitions doesn't overflow the temporary variable.

fdasd: Make sure data set name is positive
Passing a negative value, eg. PART-999, to atoi could result in passing
a negative value to the setpos call when it writes f1_counter.

This adds an exception check to ensure the result of the atoi is always
positive, and it preserves the rest of the logic which depends on n being
1 less than the value.

resize: Make sure hfsc_new_cachetable cannot overflow on 32bit
Add a couple of PED_ASSERT checks on size to make sure the ped_malloc
call doesn't allocate less than expected.

resize: Make sure 32bit build cannot overflow frag_count
Add a couple of PED_ASSERT checks to fat_op_context_new that make sure
the frag_count value can be allocated. Does not effect 64bit
architectures.

libparted: Catch FAT metadata triggered errors
Bad metadata can trigger a buffer overflow in fat resize code. Trigger
an assert when the sector count is too large, or malloc is called with a
size of 0

Adds a new test that checks to make sure that the assert is triggered.
This includes a test for deep directory traversal which should be caught
by glibc and reported as 'buffer overflow detected'.

This also includes a check on the flag_traverse_dir dir_name length to
prevent an overflow of the 4k buffer with deeply nested directories.
Also include a test for this assertion.

WARNING: parted should be build with debug enabled (which is the
default) this enables a large number of PED_ASSERT checks which catch
various conditions like these.

This fixes two CVE's:
 - CVE-2026-89085 - heap buffer overflow in _init_fats / fat_table_read
 - CVE-2026-89088 - heap buffer overflow in duplicate_legacy_root_dir

Adding support for ExFAT filesystem
Added and registered exfat probing function
Updated msdos label probe to properly detect full-disk exfat fs
Reflected ExFAT support in doc
Added ExFAT detection test in t1700-probe-fs.sh

Cleanup zero as null pointer constant warnings
Pointer types should be set to NULL, not zero. gcc is now warning about
these with:
  warning: zero as null pointer constant [-Wzero-as-null-pointer-constant]

This cleans up all the uses found when running make with gcc 16.0.1
README-release: Fix typos in doxygen instructions

maint: Distribute Doxyfile
This makes it easier for downstream packages to ship API documentation
(see e.g. https://bugs.debian.org/1119679).

bug#80795: [PATCH] build: mark functions with const attribute, per gcc warnings
fixes warning since glibc-2.43

For ISO C23, the functions wcschr that return pointers into their
input arrays now have definitions as macros that return a pointer
to a const-qualified type when the input argument is a pointer to a
const-qualified type.

../../parted/strlist.c: In function 'wchar_strchr':
../../parted/strlist.c:61:16: warning: return discards 'const' qualifier from
pointer target type [-Wdiscarded-qualifiers]
   61 |         return wcschr (str, ch);
      |                ^~~~~~

maint: post-release administrivia

--===============5540898413467964950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/parted: SRC_URI changed from "https://ftpmirror.gnu.org//parted/parted-3.7.tar.xz file://fix-doc-mandir.patch file://run-ptest" to "https://ftpmirror.gnu.org//parted/parted-3.8.tar.xz file://fix-doc-mandir.patch file://run-ptest"
packages/x86-64-v3-poky-linux/parted: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-dbg: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-dbg: PKGSIZE changed from 2129416 to 2254288 (+6%)
packages/x86-64-v3-poky-linux/parted/parted-dbg: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-dev: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-dev: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-doc: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-doc: PKGSIZE changed from 77211 to 77238 (+0%)
packages/x86-64-v3-poky-linux/parted/parted-doc: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-ca: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-ca: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-cs: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-cs: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-da: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-da: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-de: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-de: PKGSIZE changed from 74589 to 75670 (+1%)
packages/x86-64-v3-poky-linux/parted/parted-locale-de: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-es: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-es: PKGSIZE changed from 74052 to 73976 (-0%)
packages/x86-64-v3-poky-linux/parted/parted-locale-es: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-fi: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-fi: PKGSIZE changed from 68927 to 70680 (+3%)
packages/x86-64-v3-poky-linux/parted/parted-locale-fi: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-fr: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-fr: PKGSIZE changed from 71144 to 71082 (-0%)
packages/x86-64-v3-poky-linux/parted/parted-locale-fr: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-fur: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-fur: PKGSIZE changed from 73574 to 73514 (-0%)
packages/x86-64-v3-poky-linux/parted/parted-locale-fur: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-gl: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-gl: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-hu: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-hu: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-id: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-id: PKGSIZE changed from 71173 to 72150 (+1%)
packages/x86-64-v3-poky-linux/parted/parted-locale-id: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-it: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-it: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-ja: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-ja: PKGSIZE changed from 82384 to 83609 (+1%)
packages/x86-64-v3-poky-linux/parted/parted-locale-ja: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-ka: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-ka: PKGSIZE changed from 77216 to 77092 (-0%)
packages/x86-64-v3-poky-linux/parted/parted-locale-ka: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-ko: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-ko: PKGSIZE changed from 76838 to 78055 (+2%)
packages/x86-64-v3-poky-linux/parted/parted-locale-ko: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-nl: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-nl: PKGSIZE changed from 69793 to 73846 (+6%)
packages/x86-64-v3-poky-linux/parted/parted-locale-nl: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-nn: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-nn: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-pl: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-pl: PKGSIZE changed from 73407 to 74306 (+1%)
packages/x86-64-v3-poky-linux/parted/parted-locale-pl: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-pt-br: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-pt-br: PKGSIZE changed from 72291 to 72151 (-0%)
packages/x86-64-v3-poky-linux/parted/parted-locale-pt-br: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-pt: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-pt: PKGSIZE changed from 71586 to 72663 (+2%)
packages/x86-64-v3-poky-linux/parted/parted-locale-pt: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-ro: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-ro: PKGSIZE changed from 75684 to 76900 (+2%)
packages/x86-64-v3-poky-linux/parted/parted-locale-ro: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-ru: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-ru: PKGSIZE changed from 92148 to 92050 (-0%)
packages/x86-64-v3-poky-linux/parted/parted-locale-ru: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-rw: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-rw: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-sk: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-sk: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-sl: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-sl: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-sr: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-sr: PKGSIZE changed from 92402 to 93736 (+1%)
packages/x86-64-v3-poky-linux/parted/parted-locale-sr: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-sv: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-sv: PKGSIZE changed from 71853 to 72928 (+1%)
packages/x86-64-v3-poky-linux/parted/parted-locale-sv: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-tr: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-tr: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-uk: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-uk: PKGSIZE changed from 93199 to 94552 (+1%)
packages/x86-64-v3-poky-linux/parted/parted-locale-uk: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-vi: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-vi: PKGSIZE changed from 77819 to 77672 (-0%)
packages/x86-64-v3-poky-linux/parted/parted-locale-vi: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-zh-cn: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-zh-cn: PKGSIZE changed from 67246 to 68275 (+2%)
packages/x86-64-v3-poky-linux/parted/parted-locale-zh-cn: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-locale-zh-tw: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-locale-zh-tw: PKGSIZE changed from 67999 to 67941 (-0%)
packages/x86-64-v3-poky-linux/parted/parted-locale-zh-tw: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-ptest: FILELIST: added "/usr/lib/parted/ptest/tests/t3001-buffer.sh"
packages/x86-64-v3-poky-linux/parted/parted-ptest: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-ptest: PKGSIZE changed from 672126 to 681074 (+1%)
packages/x86-64-v3-poky-linux/parted/parted-ptest: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-src: FILELIST: directory renamed /usr/src/debug/parted/3.7/libparted/fs/nilfs2 -> /usr/src/debug/parted/3.8/libparted/fs/nilfs2, directory renamed /usr/src/debug/parted/3.7/libparted/fs/reiserfs -> /usr/src/debug/parted/3.8/libparted/fs/reiserfs, directory renamed /usr/src/debug/parted/3.7/libparted/fs/linux_swap -> /usr/src/debug/parted/3.8/libparted/fs/linux_swap, directory renamed /usr/src/debug/parted/3.7/libparted/fs/amiga -> /usr/src/debug/parted/3.8/libparted/fs/amiga, directory renamed /usr/src/debug/parted/3.7/tests -> /usr/src/debug/parted/3.8/tests, directory renamed /usr/src/debug/parted/3.7/libparted -> /usr/src/debug/parted/3.8/libparted, directory renamed /usr/src/debug/parted/3.7/lib/malloc -> /usr/src/debug/parted/3.8/lib/malloc, directory renamed /usr/src/debug/parted/3.7/libparted/fs/ntfs -> /usr/src/debug/parted/3.8/libparted/fs/ntfs, directory renamed /usr/src/debug/parted/3.7/libparted/fs/fat -> /usr/src/debug/parted/3
 .8/libparted/fs/fat, directory renamed /usr/src/debug/parted/3.7/libparted/fs/ext2 -> /usr/src/debug/parted/3.8/libparted/fs/ext2, directory renamed /usr/src/debug/parted/3.7/libparted/fs/f2fs -> /usr/src/debug/parted/3.8/libparted/fs/f2fs, directory renamed /usr/src/debug/parted/3.7/libparted/cs -> /usr/src/debug/parted/3.8/libparted/cs, directory renamed /usr/src/debug/parted/3.7/libparted/fs/hfs -> /usr/src/debug/parted/3.8/libparted/fs/hfs, directory renamed /usr/src/debug/parted/3.7/include/parted -> /usr/src/debug/parted/3.8/include/parted, directory renamed /usr/src/debug/parted/3.7/libparted/fs/jfs -> /usr/src/debug/parted/3.8/libparted/fs/jfs, directory renamed /usr/src/debug/parted/3.7/libparted/fs/ufs -> /usr/src/debug/parted/3.8/libparted/fs/ufs, directory renamed /usr/src/debug/parted/3.7/libparted/fs/xfs -> /usr/src/debug/parted/3.8/libparted/fs/xfs, directory renamed /usr/src/debug/parted/3.7/libparted/arch -> /usr/src/debug/parted/3.8/libparted/arch, directory rename
 d /usr/src/debug/parted/3.7/parted -> /usr/src/debug/parted/3.8/parted, directory renamed /usr/src/debug/parted/3.7/partprobe -> /usr/src/debug/parted/3.8/partprobe, directory renamed /usr/src/debug/parted/3.7/libparted/labels -> /usr/src/debug/parted/3.8/libparted/labels, directory renamed /usr/src/debug/parted/3.7/libparted/fs/r/hfs -> /usr/src/debug/parted/3.8/libparted/fs/r/hfs, directory renamed /usr/src/debug/parted/3.7/libparted/fs/r -> /usr/src/debug/parted/3.8/libparted/fs/r, directory renamed /usr/src/debug/parted/3.7/libparted/fs/udf -> /usr/src/debug/parted/3.8/libparted/fs/udf, directory renamed /usr/src/debug/parted/3.7/libparted/fs/r/fat -> /usr/src/debug/parted/3.8/libparted/fs/r/fat, directory renamed /usr/src/debug/parted/3.7/lib/glthread -> /usr/src/debug/parted/3.8/lib/glthread, directory renamed /usr/src/debug/parted/3.7/libparted/fs/btrfs -> /usr/src/debug/parted/3.8/libparted/fs/btrfs, removed "/usr/src/debug/parted/3.7/lib/unitypes.h /usr/src/debug/parted/3.7
 /lib/nl_langinfo.c /usr/src/debug/parted/3.7/lib/btowc.c /usr/src/debug/parted/3.7/lib/regex_internal.c /usr/src/debug/parted/3.7/lib/version-etc-fsf.c /usr/src/debug/parted/3.7/lib/version-etc.h /usr/src/debug/parted/3.7/lib/version-etc.c /usr/src/debug/parted/3.7/lib/regex_internal.h /usr/src/debug/parted/3.7/lib/regexec.c /usr/src/debug/parted/3.7/lib/ialloc.h /usr/src/debug/parted/3.7/lib/exitfail.h /usr/src/debug/parted/3.7/lib/xalloc.h /usr/src/debug/parted/3.7/lib/dirname.h /usr/src/debug/parted/3.7/lib/exitfail.c /usr/src/debug/parted/3.7/lib/idx.h /usr/src/debug/parted/3.7/lib/dirname.c /usr/src/debug/parted/3.7/lib/getopt.c /usr/src/debug/parted/3.7/lib/string.h /usr/src/debug/parted/3.7/lib/unictype/bitmap.h /usr/src/debug/parted/3.7/lib/setlocale_null.c /usr/src/debug/parted/3.7/lib/closeout.h /usr/src/debug/parted/3.7/lib/setlocale_null.h /usr/src/debug/parted/3.7/lib/setlocale_null-unlocked.c /usr/src/debug/parted/3.7/lib/closeout.c /usr/src/debug/parted/3.7/lib/argmat
 ch.h /usr/src/debug/parted/3.7/lib/malloca.c /usr/src/debug/parted/3.7/lib/xstrtol.c /usr/src/debug/parted/3.7/lib/sys-limits.h /usr/src/debug/parted/3.7/lib/malloca.h /usr/src/debug/parted/3.7/lib/argmatch.c /usr/src/debug/parted/3.7/lib/xstrtol.h /usr/src/debug/parted/3.7/lib/issymlink.h /usr/src/debug/parted/3.7/lib/getprogname.c /usr/src/debug/parted/3.7/lib/c-ctype.h /usr/src/debug/parted/3.7/lib/c32is-impl.h /usr/src/debug/parted/3.7/lib/langinfo.h /usr/src/debug/parted/3.7/lib/long-options.c /usr/src/debug/parted/3.7/lib/mbrtowc.c /usr/src/debug/parted/3.7/lib/basename-lgpl.h /usr/src/debug/parted/3.7/lib/mbrtoc32.c /usr/src/debug/parted/3.7/lib/getopt1.c /usr/src/debug/parted/3.7/lib/basename-lgpl.c /usr/src/debug/parted/3.7/lib/xalloc-die.c /usr/src/debug/parted/3.7/lib/getopt-ext.h /usr/src/debug/parted/3.7/lib/getopt_int.h /usr/src/debug/parted/3.7/lib/hard-locale.c /usr/src/debug/parted/3.7/lib/stripslash.c /usr/src/debug/parted/3.7/lib/stdio.h /usr/src/debug/parted/3.7/
 lib/stdlib.h /usr/src/debug/parted/3.7/lib/hard-locale.h /usr/src/debug/parted/3.7/lib/unictype/ctype_print.h /usr/src/debug/parted/3.7/lib/cloexec.c /usr/src/debug/parted/3.7/lib/unictype/ctype_print.c /usr/src/debug/parted/3.7/lib/uchar.h /usr/src/debug/parted/3.7/lib/wchar.h /usr/src/debug/parted/3.7/lib/xmalloc.c /usr/src/debug/parted/3.7/lib/fcntl.h /usr/src/debug/parted/3.7/lib/fcntl.c /usr/src/debug/parted/3.7/lib/quote.h /usr/src/debug/parted/3.7/lib/close-stream.c /usr/src/debug/parted/3.7/lib/close-stream.h /usr/src/debug/parted/3.7/lib/regcomp.c /usr/src/debug/parted/3.7/lib/c-strcasecmp.c /usr/src/debug/parted/3.7/lib/reallocarray.c /usr/src/debug/parted/3.7/lib/strtol.c /usr/src/debug/parted/3.7/lib/localcharset.c /usr/src/debug/parted/3.7/lib/getopt-core.h /usr/src/debug/parted/3.7/lib/quotearg.h /usr/src/debug/parted/3.7/lib/safe-read.c /usr/src/debug/parted/3.7/lib/quotearg.c /usr/src/debug/parted/3.7/lib/regex.h /usr/src/debug/parted/3.7/lib/progname.c /usr/src/debu
 g/parted/3.7/lib/c-strncasecmp.c /usr/src/debug/parted/3.7/lib/progname.h /usr/src/debug/parted/3.7/lib/tempname.c /usr/src/debug/parted/3.7/lib/fseterr.c /usr/src/debug/parted/3.7/lib/dirname-lgpl.c /usr/src/debug/parted/3.7/lib/stat-time.h /usr/src/debug/parted/3.7/lib/basename.c", added "/usr/src/debug/parted/3.8/lib/c32_apply_type_test.c /usr/src/debug/parted/3.8/lib/long-options.c /usr/src/debug/parted/3.8/lib/unictype/ctype_print.c /usr/src/debug/parted/3.8/lib/mbrtowc.c /usr/src/debug/parted/3.8/lib/unictype/ctype_print.h /usr/src/debug/parted/3.8/lib/unictype/ctype_cntrl.h /usr/src/debug/parted/3.8/lib/stripslash.c /usr/src/debug/parted/3.8/lib/xstrtol.c /usr/src/debug/parted/3.8/lib/getopt-core.h /usr/src/debug/parted/3.8/lib/unictype/ctype_cntrl.c /usr/src/debug/parted/3.8/lib/xstrtol.h /usr/src/debug/parted/3.8/lib/unictype/ctype_space.c /usr/src/debug/parted/3.8/lib/stdlib.h /usr/src/debug/parted/3.8/lib/string.h /usr/src/debug/parted/3.8/lib/unictype/ctype_space.h /usr/
 src/debug/parted/3.8/lib/mbrtoc32.c /usr/src/debug/parted/3.8/lib/setlocale_null-unlocked.c /usr/src/debug/parted/3.8/lib/getopt.c /usr/src/debug/parted/3.8/lib/langinfo.h /usr/src/debug/parted/3.8/lib/unictype/ctype_punct.c /usr/src/debug/parted/3.8/lib/c32is-impl.h /usr/src/debug/parted/3.8/lib/unictype/ctype_punct.h /usr/src/debug/parted/3.8/lib/hard-locale.h /usr/src/debug/parted/3.8/lib/hard-locale.c /usr/src/debug/parted/3.8/lib/quote.h /usr/src/debug/parted/3.8/lib/uchar.h /usr/src/debug/parted/3.8/lib/wchar.h /usr/src/debug/parted/3.8/lib/close-stream.c /usr/src/debug/parted/3.8/lib/unictype/ctype_blank.h /usr/src/debug/parted/3.8/lib/close-stream.h /usr/src/debug/parted/3.8/lib/unictype/ctype_blank.c /usr/src/debug/parted/3.8/lib/unicase/tolower.h /usr/src/debug/parted/3.8/lib/c-strcasecmp.c /usr/src/debug/parted/3.8/lib/malloca.c /usr/src/debug/parted/3.8/lib/btowc.c /usr/src/debug/parted/3.8/lib/malloca.h /usr/src/debug/parted/3.8/lib/unictype/ctype_xdigit.h /usr/src/debu
 g/parted/3.8/lib/getopt-ext.h /usr/src/debug/parted/3.8/lib/getopt_int.h /usr/src/debug/parted/3.8/lib/regex_internal.h /usr/src/debug/parted/3.8/lib/stat-time.h /usr/src/debug/parted/3.8/lib/regex_internal.c /usr/src/debug/parted/3.8/lib/sys-limits.h /usr/src/debug/parted/3.8/lib/unictype/ctype_xdigit.c /usr/src/debug/parted/3.8/lib/ialloc.h /usr/src/debug/parted/3.8/lib/xalloc.h /usr/src/debug/parted/3.8/lib/issymlink.h /usr/src/debug/parted/3.8/lib/quotearg.h /usr/src/debug/parted/3.8/lib/quotearg.c /usr/src/debug/parted/3.8/lib/nl_langinfo.c /usr/src/debug/parted/3.8/lib/localcharset.c /usr/src/debug/parted/3.8/lib/unicase/toupper.h /usr/src/debug/parted/3.8/lib/unitypes.h /usr/src/debug/parted/3.8/lib/c32rtomb.c /usr/src/debug/parted/3.8/lib/basename-lgpl.c /usr/src/debug/parted/3.8/lib/c-ctype.h /usr/src/debug/parted/3.8/lib/basename-lgpl.h /usr/src/debug/parted/3.8/lib/unictype/ctype_digit.c /usr/src/debug/parted/3.8/lib/version-etc-fsf.c /usr/src/debug/parted/3.8/lib/xmalloc
 .c /usr/src/debug/parted/3.8/lib/unictype/ctype_digit.h /usr/src/debug/parted/3.8/lib/regex.h /usr/src/debug/parted/3.8/lib/fseterr.c /usr/src/debug/parted/3.8/lib/progname.c /usr/src/debug/parted/3.8/lib/c32_get_type_test.c /usr/src/debug/parted/3.8/lib/progname.h /usr/src/debug/parted/3.8/lib/getprogname.c /usr/src/debug/parted/3.8/lib/unictype/ctype_graph.c /usr/src/debug/parted/3.8/lib/getopt1.c /usr/src/debug/parted/3.8/lib/btoc32.c /usr/src/debug/parted/3.8/lib/unictype/ctype_graph.h /usr/src/debug/parted/3.8/lib/setlocale_null.h /usr/src/debug/parted/3.8/lib/unictype/ctype_alnum.h /usr/src/debug/parted/3.8/lib/unictype/ctype_alpha.h /usr/src/debug/parted/3.8/lib/unictype/ctype_alpha.c /usr/src/debug/parted/3.8/lib/setlocale_null.c /usr/src/debug/parted/3.8/lib/unictype/ctype_alnum.c /usr/src/debug/parted/3.8/lib/strtol.c /usr/src/debug/parted/3.8/lib/version-etc.h /usr/src/debug/parted/3.8/lib/version-etc.c /usr/src/debug/parted/3.8/lib/fcntl.h /usr/src/debug/parted/3.8/lib/t
 empname.c /usr/src/debug/parted/3.8/lib/fcntl.c /usr/src/debug/parted/3.8/lib/c32to-impl.h /usr/src/debug/parted/3.8/lib/closeout.c /usr/src/debug/parted/3.8/lib/unictype/ctype_lower.h /usr/src/debug/parted/3.8/lib/unictype/ctype_upper.h /usr/src/debug/parted/3.8/lib/xalloc-die.c /usr/src/debug/parted/3.8/libparted/fs/exfat/exfat.c /usr/src/debug/parted/3.8/lib/closeout.h /usr/src/debug/parted/3.8/lib/unictype/ctype_lower.c /usr/src/debug/parted/3.8/lib/unictype/ctype_upper.c /usr/src/debug/parted/3.8/lib/exitfail.h /usr/src/debug/parted/3.8/lib/cloexec.c /usr/src/debug/parted/3.8/lib/idx.h /usr/src/debug/parted/3.8/lib/exitfail.c /usr/src/debug/parted/3.8/lib/regcomp.c /usr/src/debug/parted/3.8/lib/wcrtomb.c /usr/src/debug/parted/3.8/lib/reallocarray.c /usr/src/debug/parted/3.8/lib/dirname.c /usr/src/debug/parted/3.8/lib/dirname.h /usr/src/debug/parted/3.8/lib/localeinfo.c /usr/src/debug/parted/3.8/lib/stdio.h /usr/src/debug/parted/3.8/lib/unictype/bitmap.h /usr/src/debug/parted/3.
 8/lib/localeinfo.h /usr/src/debug/parted/3.8/lib/dirname-lgpl.c /usr/src/debug/parted/3.8/lib/regexec.c /usr/src/debug/parted/3.8/lib/unicase/simple-mapping.h /usr/src/debug/parted/3.8/lib/argmatch.h /usr/src/debug/parted/3.8/lib/safe-read.c /usr/src/debug/parted/3.8/lib/argmatch.c /usr/src/debug/parted/3.8/lib/basename.c /usr/src/debug/parted/3.8/lib/c-strncasecmp.c"
packages/x86-64-v3-poky-linux/parted/parted-src: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-src: PKGSIZE changed from 2804932 to 3172162 (+13%)
packages/x86-64-v3-poky-linux/parted/parted-src: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted-staticdev: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted-staticdev: PV changed from "3.7" to "3.8"
packages/x86-64-v3-poky-linux/parted/parted: PKGV changed from 3.7 [default] to 3.8 [default]
packages/x86-64-v3-poky-linux/parted/parted: PKGSIZE changed from 629534 to 715582 (+14%)
packages/x86-64-v3-poky-linux/parted/parted: PV changed from "3.7" to "3.8"

--===============5540898413467964950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1994 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-3cf80ea7d8354d7cb9af11eff3a9f12e56872b10"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:3cf80ea7d8354d7cb9af11eff3a9f12e56872b10"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 812 Local 630 Mirrors 0 Missed 182 Current 227 (77% match, 82% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 252 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 276 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 295 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 297 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_populate_lic_setscene)
NOTE: Running setscene task 316 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 334 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 338 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 369 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 376 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pigz/pigz_2.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 390 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 398 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 405 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe parted-3.8-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe vim-9.2.0993-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe kmod-native-34.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 407 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 414 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 417 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 431 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 432 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_packagedata_setscene)
NOTE: recipe parted-3.8-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 437 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 438 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-native-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 444 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 456 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 462 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe kmod-native-34.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 473 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pigz-native-2.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bc-native-1.08.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 481 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-native-2.42.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 482 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pigz/pigz_2.8.bb:do_recipe_qa_setscene)
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 484 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_recipe_qa_setscene)
NOTE: recipe bc-native-1.08.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 488 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 496 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 506 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-native-2.42.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 510 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 515 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-native-1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 516 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx_setscene)
NOTE: recipe vim-9.2.0993-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bc-1.08.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iproute2-7.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-4.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-native-1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 518 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-native-34.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 519 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bc-native-1.08.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe pigz-native-2.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-native-5.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe iproute2-7.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 521 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: Running setscene task 522 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe vim-9.2.0993-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 524 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe grep-3.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 528 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe procps-4.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 530 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe kmod-native-34.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 531 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe bc-native-1.08.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe btrfs-tools-7.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 534 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: recipe xz-native-5.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 535 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe socat-1.8.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 542 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe gawk-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 543 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe btrfs-tools-7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 545 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 549 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe socat-1.8.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.42.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-native-2.42.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-native-4.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 565 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 566 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 567 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 569 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 573 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_package_setscene)
NOTE: Running setscene task 575 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 579 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 581 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-native-4.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 583 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe iptables-1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe diffutils-3.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-native-5.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe iptables-1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 588 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_spdx_setscene)
NOTE: recipe grep-3.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe diffutils-3.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 600 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kern-tools-native-0.3+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 609 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 616 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-native-5.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 622 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe bc-native-1.08.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-native-4.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 632 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 634 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 637 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bc-native-1.08.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe openssl-native-4.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 650 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 651 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.4.1-r0: task do_package_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_package_setscene: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 655 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 660 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 663 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 664 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-native-6.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 667 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.55.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-native-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 674 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 676 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe git-native-2.55.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 682 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 696 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xorgproto-native-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 697 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 706 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 712 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 715 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kern-tools-native-0.3+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 720 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 722 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 725 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bc-native-1.08.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 728 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 735 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bc-native-1.08.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_package_setscene: Started
NOTE: Running setscene task 739 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 740 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 741 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 742 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 745 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xorgproto-native-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.196-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 748 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-native-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 750 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 752 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 757 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 758 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 759 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 764 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 767 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 768 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe git-native-2.55.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 772 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 773 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 774 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 775 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 779 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 781 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 784 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 791 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 796 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 799 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 800 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 804 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 805 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 806 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 810 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 812 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 813 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.4.1-r0: task do_package_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 816 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 818 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/git/git_2.55.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 826 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 828 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package_setscene)
NOTE: recipe make-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 830 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 837 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 839 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 844 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe elfutils-0.196-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 849 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_setscene: Started
NOTE: recipe git-native-2.55.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 852 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe perlcross-native-1.6.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 858 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.196-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: recipe git-native-2.55.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 860 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 861 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 862 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 867 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 868 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 869 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 870 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_package_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 872 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 874 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 876 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 877 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 878 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_package_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_package_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_package_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 888 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 889 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 890 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.44.0-r0: task do_package_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 893 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 894 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 895 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 897 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 899 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 903 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 908 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 911 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 912 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_package_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 915 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 916 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 919 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 920 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 921 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 925 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 927 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 929 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 932 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 938 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 941 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 942 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 943 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 945 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_package_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 947 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 948 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 949 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 950 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 955 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 957 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 859 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_fetch)
NOTE: Running task 868 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 906 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_fetch)
NOTE: Running task 909 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_fetch)
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 958 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_recipe_qa_setscene)
NOTE: Running task 950 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 959 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_package_setscene)
NOTE: Running task 951 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_recipe_qa)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_fetch: Started
NOTE: Running setscene task 962 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: Running setscene task 965 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 966 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 967 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 998 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: Running task 1024 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Started
NOTE: Running task 1035 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: recipe libpcre2-10.48-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1036 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_unpack)
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Succeeded
NOTE: Running task 1037 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_package_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_recipe_qa: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_fetch: Succeeded
NOTE: Running task 1050 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_fetch)
NOTE: Running task 1051 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_write_config: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_unpack: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1057 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: Running task 1062 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1069 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Started
NOTE: Running task 1075 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1081 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_unpack: Started
NOTE: Running task 1099 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_fetch: Started
NOTE: Running task 1100 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe coreutils-9.11-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1115 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_unpack)
NOTE: Running setscene task 973 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_fetch: Started
NOTE: Running task 1125 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_fetch)
NOTE: Running task 1133 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_recipe_qa)
NOTE: Running task 1134 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe xorgproto-2025.1-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.47.4-r0: task do_fetch: Started
NOTE: Running task 1135 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_unpack)
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: recipe gawk-5.4.1-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Started
NOTE: recipe gawk-5.4.1-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1139 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_unpack)
NOTE: Running task 1140 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe coreutils-9.11-r0: task do_unpack: Started
NOTE: recipe parted-3.8-r0: task do_recipe_qa: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_fetch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1142 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_recipe_qa)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1149 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: recipe readline-8.3-r0: task do_patch: Started
NOTE: recipe gawk-5.4.1-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.48-r0: task do_unpack: Succeeded
NOTE: Running task 1150 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_package_setscene: Succeeded
NOTE: Running task 1152 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_patch)
NOTE: Running setscene task 974 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dosfstools-4.2-r0: task do_recipe_qa: Started
NOTE: recipe parted-3.8-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 975 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.48-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 976 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1154 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_fetch)
NOTE: recipe xorgproto-2025.1-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_unpack: Succeeded
NOTE: Running task 1159 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_fetch)
NOTE: Running task 1165 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_patch)
NOTE: Running task 1166 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe readline-8.3-r0: task do_patch: Succeeded
NOTE: Running task 1179 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 977 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: Running task 1193 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_write_config)
NOTE: recipe gawk-5.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1194 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_patch)
NOTE: recipe parted-3.8-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe parted-3.8-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_patch: Started
NOTE: Running task 1195 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1204 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe diffutils-3.12-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1212 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_unpack)
NOTE: recipe xorgproto-2025.1-r0: task do_write_config: Started
NOTE: recipe gawk-5.4.1-r0: task do_patch: Started
NOTE: recipe diffutils-3.12-r0: task do_fetch: Succeeded
NOTE: Running task 1215 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe coreutils-9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1216 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_patch)
NOTE: recipe parted-3.8-r0: task do_unpack: Started
NOTE: recipe xorgproto-2025.1-r0: task do_write_config: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1218 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Succeeded
NOTE: Running task 1222 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_unpack)
NOTE: Running task 1223 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_patch: Started
NOTE: Running task 1224 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Started
NOTE: recipe diffutils-3.12-r0: task do_unpack: Started
NOTE: recipe gawk-5.4.1-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: Running task 1228 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_fetch)
NOTE: Running task 1229 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe dosfstools-4.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1230 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1231 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe parted-3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1232 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: Running task 1233 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Succeeded
NOTE: Running task 1237 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_fetch: Started
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_fetch: Succeeded
NOTE: recipe parted-3.8-r0: task do_patch: Started
NOTE: Running task 1264 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: Running task 1265 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 1266 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe diffutils-3.12-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: Running task 1267 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1268 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1269 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1274 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_patch: Started
NOTE: Running task 1275 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: recipe coreutils-9.11-r0: task do_patch: Succeeded
NOTE: recipe parted-3.8-r0: task do_patch: Succeeded
NOTE: Running task 1277 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1278 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dosfstools-4.2-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: Running task 1279 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libpam/1.7.2/temp/log.do_packagedata_setscene.2710953
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: Running setscene task 978 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_package_setscene)
NOTE: Running task 1280 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1281 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_write_config)
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: Running task 1287 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.6.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_patch: Succeeded
NOTE: Running task 1288 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_unpack: Succeeded
NOTE: Running task 1289 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_patch)
NOTE: recipe parted-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1290 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_patch)
NOTE: recipe dosfstools-4.2-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1292 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.2-r0: task do_package_setscene: Started
NOTE: Running task 1293 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1294 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_patch: Started
NOTE: Running task 1297 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe diffutils-3.12-r0: task do_patch: Succeeded
NOTE: Running task 1302 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe bc-1.08.2-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_fetch: Succeeded
NOTE: Running task 1305 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: Running task 1306 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch unihash changed to 5e4e61096da6c544ceede89a5ade4b796ff809f25e5af084048c21a338a0e57b
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: Running task 1307 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1308 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: Running task 1311 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1312 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_unpack)
NOTE: recipe parted-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_deploy_source_date_epoch unihash changed to f3c7de4d8044863ee717838dd0802d0ada8bd4d3a939326cfcea8ebaae4f4be6
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe dosfstools-4.2-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: Running task 1313 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1315 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1318 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: Running task 1337 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: Running task 1338 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1340 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: recipe bc-1.08.2-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1341 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: Running task 1342 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe bc-1.08.2-r0: task do_unpack: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1343 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: Running task 1344 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_write_config)
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: Running task 1351 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: Running task 1352 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe libx11-1_1.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 1356 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe bc-1.08.2-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_write_config: Started
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 1367 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: recipe procps-4.0.7-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1368 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: Running task 1370 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_unpack)
NOTE: Running task 1377 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe bc-1.08.2-r0: task do_patch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1378 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1379 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_fetch)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1381 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_fetch)
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_unpack: Started
NOTE: Running task 1382 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_patch: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Started
NOTE: Running task 1383 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1384 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 1394 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_fetch)
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1400 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx)
NOTE: Running task 1403 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe iptables-1.8.13-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_unpack)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: recipe iptables-1.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 1406 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_fetch: Succeeded
NOTE: Running task 1407 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_unpack)
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe grep-3.12-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1408 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe grep-3.12-r0: task do_fetch: Succeeded
NOTE: Running task 1409 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Started
NOTE: Running task 1412 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_unpack)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.13-r0: task do_unpack: Started
NOTE: Running task 1416 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_patch)
NOTE: Running task 1424 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: recipe bc-1.08.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1443 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_fetch)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_unpack: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_deploy_source_date_epoch unihash changed to 98bf474d1f66ee853f4e4daae79d61ed4d8afb7d026abd2e19dc8e77b52537bf
NOTE: Running task 1444 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_fetch)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1445 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe grep-3.12-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_patch: Started
NOTE: recipe iptables-1.8.13-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: Running task 1446 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_patch)
NOTE: recipe vim-9.2.0993-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1447 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe iproute2-7.2.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Started
NOTE: recipe iproute2-7.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1448 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: Running task 1449 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.13-r0: task do_patch: Started
NOTE: Running task 1450 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_fetch)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.12-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.7-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_deploy_source_date_epoch unihash changed to f3c7de4d8044863ee717838dd0802d0ada8bd4d3a939326cfcea8ebaae4f4be6
NOTE: recipe socat-1.8.1.3-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: Running task 1451 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_unpack)
NOTE: Running task 1452 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_patch)
NOTE: Running task 1455 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe socat-1.8.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1474 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe btrfs-tools-7.1-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.13-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: Running task 1481 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_unpack)
NOTE: Running task 1482 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1483 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1484 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1486 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1492 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe grep-3.12-r0: task do_patch: Started
NOTE: recipe procps-4.0.7-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: recipe iptables-1.8.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-7.2.0-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe socat-1.8.1.3-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: Running task 1493 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: Running task 1499 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_recipe_spdx)
NOTE: recipe grep-3.12-r0: task do_patch: Succeeded
NOTE: Running task 1528 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-7.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1529 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: Running task 1530 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe socat-1.8.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1531 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_patch)
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe iptables-1.8.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_deploy_source_date_epoch unihash changed to 173358e5e1dabb3e4a38455309526549f67cc5abd67320a7efd77ff477428b23
NOTE: recipe iproute2-7.2.0-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch unihash changed to 12abc4b3cf2acb9dab2fc74f7c6e898a956f34979126a641001b33a817eaa406
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe socat-1.8.1.3-r0: task do_patch: Started
NOTE: Running task 1534 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1535 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1554 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx)
NOTE: Running task 1578 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_recipe_spdx)
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1580 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_create_recipe_spdx)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Started
NOTE: recipe perl-5.44.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe iproute2-7.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_create_recipe_spdx)
NOTE: recipe gawk-5.4.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1582 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.8.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1583 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe parted-3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-7.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1584 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_patch)
NOTE: recipe socat-1.8.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.44.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1585 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_recipe_spdx)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1587 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_recipe_spdx)
NOTE: recipe procps-4.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1588 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.4-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1589 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_create_recipe_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch unihash changed to b62ab07934976d29e3de56f351ab56c6c22bff5364c175a14c5aa3f4ef76611d
NOTE: recipe make-4.4.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gawk-5.4.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1590 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: Running task 1591 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_create_recipe_spdx)
NOTE: recipe iproute2-7.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_deploy_source_date_epoch unihash changed to 05790a14a94067cf032c45150e195b0d6d13cb591914406ab56e59a51f39c88e
NOTE: recipe parted-3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe socat-1.8.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.4-r0: task do_create_recipe_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_deploy_source_date_epoch unihash changed to f24de31a55bfe81dca1ac07cf837a8dbb5a9f1b4a9ff2252ac002657917d7822
NOTE: recipe procps-4.0.7-r0: task do_patch: Started
NOTE: Running task 1592 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_create_recipe_spdx)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.11-r0: task do_create_recipe_spdx: Started
NOTE: recipe dosfstools-4.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1595 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe procps-4.0.7-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe e2fsprogs-1.47.4-r0: task do_patch: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1597 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1598 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch unihash changed to d97074e787dc3adfb4f991e4100393505fe935acd951fe6601b6167f9d6f4f3e
NOTE: recipe btrfs-tools-7.1-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1599 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_unpack)
NOTE: Running task 1600 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe btrfs-tools-7.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1601 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libpam-1.7.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 979 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot unihash changed to 15ee9a748b52383299dfe3d939157e38e9db6636bf1883486aab8fad535e2f47
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 980 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 985223ca2ac734bda283da77e0384a6b5bb6a64a11e8468b89ea102becc227b3 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f76067ae5c8e194de66522044324324ed6151c45261395c3135358efa1b40d31', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '985223ca2ac734bda283da77e0384a6b5bb6a64a11e8468b89ea102becc227b3'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed f76067ae5c8e194de66522044324324ed6151c45261395c3135358efa1b40d31 -> 985223ca2ac734bda283da77e0384a6b5bb6a64a11e8468b89ea102becc227b3 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1605 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1606 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe btrfs-tools-7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1607 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-7.1-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1608 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe btrfs-tools-7.1-r0: task do_patch: Succeeded
NOTE: Running task 1609 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe btrfs-tools-7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_deploy_source_date_epoch unihash changed to b38d51c8a66985ff0f4ae0ba186cb19d4f3130a0a33dece77ec96fbc46b1b6e9
NOTE: recipe vim-9.2.0993-r0: task do_fetch: Succeeded
NOTE: Running task 1611 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_unpack)
NOTE: recipe vim-9.2.0993-r0: task do_unpack: Started
NOTE: recipe perl-5.44.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 981 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 984 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 985 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 986 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 987 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 988 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 994 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 996 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 998 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1000 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1613 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 1629 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1005 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1007 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.44.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1009 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1011 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1013 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe vim-9.2.0993-r0: task do_unpack: Succeeded
NOTE: Running task 1640 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_patch)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vim-9.2.0993-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1016 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1017 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1018 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1019 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1021 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_patch: Succeeded
NOTE: Running task 1643 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_patch)
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1026 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1027 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.44.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1035 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1037 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1039 of 1039 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.44.0-r0: task do_patch: Succeeded
NOTE: Running task 1774 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1858 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1960 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1965 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1970 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1984 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata)
NOTE: Running task 1986 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2030 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.42.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2025.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2044 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2060 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata: Started
NOTE: recipe gawk-5.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2087 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2088 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2096 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2102 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2119 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2120 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_configure)
NOTE: recipe procps-4.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2121 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_configure)
NOTE: recipe coreutils-9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2122 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_configure)
NOTE: recipe perl-5.44.0-r0: task do_configure: Started
NOTE: recipe gawk-5.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2123 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_configure)
NOTE: recipe libpcre2-10.48-r0: task do_configure: Started
NOTE: recipe diffutils-3.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2124 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: recipe xtrans-1_1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2125 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_configure)
NOTE: recipe make-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2126 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure)
NOTE: recipe bc-1.08.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_configure: Started
NOTE: Running task 2127 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_configure)
NOTE: recipe gawk-5.4.1-r0: task do_configure: Started
NOTE: Running task 2128 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure)
NOTE: Running task 2129 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_configure)
NOTE: recipe procps-4.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: Running task 2130 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_configure)
NOTE: Running task 2131 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_configure)
NOTE: recipe xtrans-1_1.6.0-r0: task do_configure: Started
NOTE: recipe diffutils-3.12-r0: task do_configure: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure: Started
NOTE: recipe bc-1.08.2-r0: task do_configure: Started
NOTE: recipe util-linux-2.42.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2132 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_configure)
NOTE: recipe procps-4.0.7-r0: task do_configure: Started
NOTE: recipe xorgproto-2025.1-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2133 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_configure)
NOTE: recipe util-linux-2.42.4-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2141 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2142 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2144 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_configure)
NOTE: recipe iptables-1.8.13-r0: task do_configure: Started
NOTE: recipe xorgproto-2025.1-r0: task do_configure: Succeeded
NOTE: Running task 2145 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_compile)
NOTE: recipe xorgproto-2025.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2025.1-r0: task do_compile: Succeeded
NOTE: Running task 2146 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_install)
NOTE: recipe xorgproto-2025.1-r0: task do_install: Started
NOTE: recipe xorgproto-2025.1-r0: task do_install: Succeeded
NOTE: Running task 2147 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2148 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_package)
NOTE: recipe xorgproto-2025.1-r0: task do_package: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2149 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Running task 2150 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_configure)
NOTE: Running task 2151 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2152 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_configure)
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Started
NOTE: recipe xorgproto-2025.1-r0: task do_package: Succeeded
NOTE: Running task 2153 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata)
NOTE: recipe dosfstools-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2154 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_configure_ptest_base)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe dosfstools-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2155 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata unihash changed to aa45488d2f17d638cfd4a80ac7c523031e4030a19e53ee78011625d3569e9404
NOTE: Setscene tasks completed
NOTE: Running task 2156 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_compile)
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2157 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_compile)
NOTE: Running task 2158 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: recipe xtrans-1_1.6.0-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_compile: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: Running task 2159 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_install)
NOTE: Running task 2160 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_install)
NOTE: recipe xtrans-1_1.6.0-r0: task do_install: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Started
NOTE: recipe bc-1.08.2-r0: task do_configure: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2161 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: Running task 2162 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_compile_ptest_base)
NOTE: recipe xtrans-1_1.6.0-r0: task do_install: Succeeded
NOTE: Running task 2163 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2164 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install)
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2165 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: Running task 2166 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot)
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2167 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2168 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_install)
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dosfstools-4.2-r0: task do_install: Succeeded
NOTE: Running task 2169 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_configure_ptest_base)
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Started
NOTE: recipe bc-1.08.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2170 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_configure)
NOTE: Running task 2171 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_compile)
NOTE: recipe libice-1_1.1.2-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_compile: Started
NOTE: Running task 2172 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2173 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2174 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_install_ptest_base)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2175 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2176 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2177 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package)
NOTE: recipe dosfstools-4.2-r0: task do_package: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Started
NOTE: recipe bc-1.08.2-r0: task do_compile: Succeeded
NOTE: Running task 2178 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package)
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Started
NOTE: recipe iptables-1.8.13-r0: task do_configure: Succeeded
NOTE: Running task 2179 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Succeeded
NOTE: Running task 2180 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe libpcre2-10.48-r0: task do_configure: Succeeded
NOTE: Running task 2181 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_configure_ptest_base)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe libpcre2-10.48-r0: task do_configure_ptest_base: Started
NOTE: recipe make-4.4.1-r0: task do_configure: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2182 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_compile)
NOTE: Running task 2183 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_compile)
NOTE: recipe xtrans-1_1.6.0-r0: task do_package: Succeeded
NOTE: Running task 2184 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata)
NOTE: recipe make-4.4.1-r0: task do_compile: Started
NOTE: recipe libpcre2-10.48-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2185 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata unihash changed to 756975536be077b91e6741e1d4efb3ed62ecc50a6b39949750911ba5915524b1
NOTE: Setscene tasks completed
NOTE: Running task 2186 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata unihash changed to 34d7ad2acaceca7ad5234d27912d5e9e786911048e4e3a63e7d0c8b341f7c3f7
NOTE: Setscene tasks completed
NOTE: Running task 2188 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_compile)
NOTE: recipe iptables-1.8.13-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2215 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_compile_ptest_base)
NOTE: recipe bc-1.08.2-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.08.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2218 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_install)
NOTE: recipe bc-1.08.2-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: recipe make-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata)
NOTE: Running task 2220 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_install)
NOTE: recipe dosfstools-4.2-r0: task do_package: Succeeded
NOTE: Running task 2221 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata: Started
NOTE: recipe make-4.4.1-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata unihash changed to 91fcbb07acfc5f7e70deea20f376dba9c3234da413529c524824413d41458e52
NOTE: Setscene tasks completed
NOTE: Running task 2222 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx)
NOTE: recipe dosfstools-4.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2232 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe bc-1.08.2-r0: task do_install: Succeeded
NOTE: Running task 2242 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2243 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-4.4.1-r0: task do_install: Succeeded
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2260 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_spdx)
NOTE: recipe socat-1.8.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx: Started
NOTE: recipe socat-1.8.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2261 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_configure)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx: Succeeded
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.8.1.3-r0: task do_configure: Started
NOTE: Running task 2262 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_install_ptest_base)
NOTE: Running task 2263 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe bc-1.08.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2268 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx)
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx: Started
NOTE: recipe bc-1.08.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2269 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_package)
NOTE: recipe bc-1.08.2-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2270 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_compile)
NOTE: recipe readline-8.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2285 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.78-r0: task do_create_spdx: Succeeded
NOTE: Running task 2286 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2287 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_install)
NOTE: recipe procps-4.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2288 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Started
NOTE: recipe procps-4.0.7-r0: task do_compile: Started
NOTE: recipe iptables-1.8.13-r0: task do_compile: Succeeded
NOTE: Running task 2289 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2294 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_populate_sysroot)
NOTE: Running task 2295 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.13-r0: task do_install: Started
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe make-4.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2296 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2297 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2298 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_configure)
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Started
NOTE: recipe iptables-1.8.13-r0: task do_install: Succeeded
NOTE: Running task 2299 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.13-r0: task do_populate_sysroot: Started
NOTE: recipe bc-1.08.2-r0: task do_package: Succeeded
NOTE: Running task 2300 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_package)
NOTE: recipe iptables-1.8.13-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: Running task 2301 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2302 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: recipe iptables-1.8.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2303 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bc/bc_1.08.2.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe bc-1.08.2-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.2-r0: task do_configure: Succeeded
NOTE: recipe bc-1.08.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2305 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_populate_sysroot)
NOTE: Setscene tasks completed
NOTE: Running task 2306 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_compile)
NOTE: recipe dosfstools-4.2-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.2-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2307 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: Running task 2308 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2309 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe libpcre2-10.48-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata: Started
NOTE: Running task 2310 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_compile_ptest_base)
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: Running task 2313 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: recipe procps-4.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2314 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_install)
NOTE: recipe libpcre2-10.48-r0: task do_compile_ptest_base: Started
NOTE: recipe libpcre2-10.48-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Started
NOTE: Running task 2315 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_install)
NOTE: recipe procps-4.0.7-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2317 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_create_spdx)
NOTE: recipe libpcre2-10.48-r0: task do_install: Started
NOTE: recipe dosfstools-4.2-r0: task do_create_spdx: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2318 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_compile: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe dosfstools-4.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2320 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_install)
NOTE: Running task 2321 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: Running task 2322 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk)
NOTE: recipe libice-1_1.1.2-r0: task do_install: Started
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk: Started
NOTE: recipe libpcre2-10.48-r0: task do_install: Succeeded
NOTE: Running task 2323 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_install_ptest_base)
NOTE: recipe libpcre2-10.48-r0: task do_install_ptest_base: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2324 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 2325 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot)
NOTE: recipe iproute2-7.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.48-r0: task do_install_ptest_base: Succeeded
NOTE: recipe procps-4.0.7-r0: task do_install: Succeeded
NOTE: recipe iproute2-7.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2326 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_populate_sysroot)
NOTE: Running task 2327 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_package)
NOTE: Running task 2328 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_package)
NOTE: recipe libpcre2-10.48-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.48-r0: task do_package: Started
NOTE: recipe procps-4.0.7-r0: task do_package: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2329 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.4.1-r0: task do_configure: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2330 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2331 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_compile)
NOTE: recipe libsm-1_1.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2332 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_configure)
NOTE: Running task 2333 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.4.1-r0: task do_compile: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_configure: Started
NOTE: Running task 2334 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2335 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_configure)
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2337 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_configure)
NOTE: recipe grep-3.12-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Running task 2338 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_configure)
NOTE: recipe iproute2-7.2.0-r0: task do_configure: Started
NOTE: recipe iproute2-7.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2339 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_compile)
NOTE: recipe iproute2-7.2.0-r0: task do_compile: Started
NOTE: recipe procps-4.0.7-r0: task do_package: Succeeded
NOTE: Running task 2340 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.7.bb:do_packagedata)
NOTE: recipe procps-4.0.7-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe procps-4.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2342 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2343 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata)
NOTE: recipe libpcre2-10.48-r0: task do_package: Succeeded
NOTE: Running task 2344 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_packagedata)
NOTE: recipe kmod-34.2-r0: task do_packagedata: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2345 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb)
NOTE: recipe libpcre2-10.48-r0: task do_packagedata: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2346 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm)
NOTE: recipe libpcre2-10.48-r0: task do_packagedata: Succeeded
NOTE: Running task 2347 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe make-4.4.1-r0: task do_package_qa: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa unihash changed to 198e038ab7e49c7fd32b7645ca147378ccccf027757080df5ed2730afcbac803
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iptables-1.8.13-r0: task do_package: Succeeded
NOTE: Running task 2352 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_packagedata)
NOTE: recipe iptables-1.8.13-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_compile)
NOTE: recipe util-linux-2.42.4-r0: task do_configure: Succeeded
NOTE: Running task 2354 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_compile_ptest_base)
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Started
NOTE: recipe gawk-5.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.42.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2356 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_compile)
NOTE: Running task 2357 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_install)
NOTE: recipe util-linux-2.42.4-r0: task do_compile: Started
NOTE: recipe gawk-5.4.1-r0: task do_install: Started
NOTE: recipe iptables-1.8.13-r0: task do_packagedata: Succeeded
NOTE: recipe diffutils-3.12-r0: task do_configure: Succeeded
NOTE: Running task 2358 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_configure_ptest_base)
NOTE: recipe diffutils-3.12-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2359 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_compile)
NOTE: recipe libsm-1_1.2.6-r0: task do_configure: Succeeded
NOTE: Running task 2360 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_compile)
NOTE: recipe diffutils-3.12-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_install)
NOTE: recipe gawk-5.4.1-r0: task do_install: Succeeded
NOTE: Running task 2362 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_install_ptest_base)
NOTE: recipe libxcb-1.17.0-r0: task do_install: Started
NOTE: recipe gawk-5.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_compile: Succeeded
NOTE: Running task 2363 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_install)
NOTE: recipe libsm-1_1.2.6-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_install: Succeeded
NOTE: Running task 2364 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot)
NOTE: Running task 2365 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package: Started
NOTE: recipe iproute2-7.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_install)
NOTE: recipe iproute2-7.2.0-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-7.2.0-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_package)
NOTE: recipe iproute2-7.2.0-r0: task do_package: Started
NOTE: recipe socat-1.8.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_compile)
NOTE: recipe socat-1.8.1.3-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 2369 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot)
NOTE: Running task 2370 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package: Succeeded
NOTE: Running task 2371 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2375 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_populate_sysroot)
NOTE: recipe gawk-5.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe socat-1.8.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_install)
NOTE: recipe libx11-1_1.8.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_configure)
NOTE: recipe socat-1.8.1.3-r0: task do_install: Started
NOTE: recipe diffutils-3.12-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_compile_ptest_base)
NOTE: recipe libx11-1_1.8.13-r0: task do_configure: Started
NOTE: recipe diffutils-3.12-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2379 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_install)
NOTE: recipe socat-1.8.1.3-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_package)
NOTE: recipe gawk-5.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_create_spdx)
NOTE: recipe diffutils-3.12-r0: task do_install: Started
NOTE: recipe socat-1.8.1.3-r0: task do_package: Started
NOTE: recipe gawk-5.4.1-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.42.4-r0: task do_compile: Succeeded
NOTE: Running task 2382 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.42.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure: Succeeded
NOTE: Running task 2383 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2385 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_compile)
NOTE: recipe diffutils-3.12-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile: Started
NOTE: recipe diffutils-3.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2386 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_package)
NOTE: recipe diffutils-3.12-r0: task do_package: Started
NOTE: recipe iproute2-7.2.0-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_packagedata)
NOTE: recipe util-linux-2.42.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2388 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_install)
NOTE: recipe iproute2-7.2.0-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.42.4-r0: task do_install: Started
NOTE: recipe socat-1.8.1.3-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/socat/socat_1.8.1.3.bb:do_packagedata)
NOTE: recipe iproute2-7.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe socat-1.8.1.3-r0: task do_packagedata: Started
NOTE: recipe socat-1.8.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.42.4-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.12-r0: task do_package: Succeeded
NOTE: Running task 2391 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/diffutils/diffutils_3.12.bb:do_packagedata)
NOTE: recipe diffutils-3.12-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.42.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2392 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_package)
NOTE: recipe util-linux-2.42.4-r0: task do_package: Started
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot: Started
NOTE: recipe diffutils-3.12-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2394 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2395 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_package: Succeeded
NOTE: recipe e2fsprogs-1.47.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe parted-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2396 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata: Started
NOTE: recipe parted-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_configure)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_configure)
NOTE: recipe parted-3.8-r0: task do_configure: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_configure: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile: Succeeded
NOTE: Running task 2399 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2400 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_install)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_configure: Succeeded
NOTE: Running task 2401 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_compile)
NOTE: recipe grep-3.12-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_compile)
NOTE: recipe libx11-1_1.8.13-r0: task do_compile: Started
NOTE: recipe grep-3.12-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install: Succeeded
NOTE: Running task 2403 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2404 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2405 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.11-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.11-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2407 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_compile)
NOTE: recipe coreutils-9.11-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2408 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe grep-3.12-r0: task do_compile: Succeeded
NOTE: Running task 2409 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_install)
NOTE: recipe grep-3.12-r0: task do_install: Started
NOTE: recipe grep-3.12-r0: task do_install: Succeeded
NOTE: Running task 2410 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_package)
NOTE: recipe grep-3.12-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe coreutils-9.11-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.11-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2413 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_install)
NOTE: recipe coreutils-9.11-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_configure: Succeeded
NOTE: Running task 2414 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_configure_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2415 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_compile)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_compile: Started
NOTE: recipe grep-3.12-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_packagedata)
NOTE: recipe grep-3.12-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_compile: Succeeded
NOTE: Running task 2417 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_install)
NOTE: recipe perl-5.44.0-r0: task do_configure: Succeeded
NOTE: Running task 2418 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_configure_ptest_base)
NOTE: recipe libx11-1_1.8.13-r0: task do_install: Started
NOTE: recipe coreutils-9.11-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_install_ptest_base)
NOTE: recipe perl-5.44.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.44.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2420 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_compile)
NOTE: recipe coreutils-9.11-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.44.0-r0: task do_compile: Started
NOTE: recipe grep-3.12-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 2421 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_install: Succeeded
NOTE: Running task 2422 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot)
NOTE: Running task 2423 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: Running task 2425 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2426 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2427 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2428 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_configure)
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2429 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2432 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_populate_sysroot)
NOTE: Running task 2437 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_package_write_ipk)
NOTE: Running task 2438 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_package_write_deb)
NOTE: Running task 2439 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_package_write_rpm)
NOTE: Running task 2440 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_package_qa)
NOTE: recipe coreutils-9.11-r0: task do_populate_sysroot: Started
NOTE: recipe gawk-5.4.1-r0: task do_package_write_ipk: Started
NOTE: recipe gawk-5.4.1-r0: task do_package_write_deb: Started
NOTE: recipe gawk-5.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.4.1-r0: task do_package_qa: Started
NOTE: recipe coreutils-9.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2441 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_create_spdx)
NOTE: recipe coreutils-9.11-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Running task 2442 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_create_spdx: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_package_qa unihash changed to 2b19cb888a2a26e3851630f62e52f862d8021358577e051441f1425eefafde50
NOTE: recipe util-linux-2.42.4-r0: task do_package: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2443 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_packagedata)
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_package: Succeeded
NOTE: Running task 2444 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2445 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_spdx)
NOTE: recipe util-linux-2.42.4-r0: task do_create_spdx: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_compile: Succeeded
NOTE: Running task 2446 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_compile_ptest_base)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_compile_ptest_base: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2447 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_install)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_install: Started
NOTE: recipe parted-3.8-r0: task do_configure: Succeeded
NOTE: Running task 2448 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_configure_ptest_base)
NOTE: recipe parted-3.8-r0: task do_configure_ptest_base: Started
NOTE: recipe parted-3.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2449 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_compile)
NOTE: recipe util-linux-2.42.4-r0: task do_create_spdx: Succeeded
NOTE: recipe parted-3.8-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2450 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_compile)
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_install: Succeeded
NOTE: Running task 2451 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_install_ptest_base)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_install_ptest_base: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2452 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_install)
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2453 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_package)
NOTE: Running task 2454 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 2456 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_package)
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2457 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_configure)
NOTE: recipe btrfs-tools-7.1-r0: task do_configure: Started
NOTE: recipe parted-3.8-r0: task do_compile: Succeeded
NOTE: Running task 2459 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_compile_ptest_base)
NOTE: recipe parted-3.8-r0: task do_compile_ptest_base: Started
NOTE: recipe parted-3.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2460 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_install)
NOTE: recipe parted-3.8-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Succeeded
NOTE: Running task 2461 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure: Succeeded
NOTE: Running task 2462 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2463 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_compile)
NOTE: recipe parted-3.8-r0: task do_install: Succeeded
NOTE: Running task 2464 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile: Started
NOTE: recipe parted-3.8-r0: task do_install_ptest_base: Started
NOTE: recipe parted-3.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2465 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_package)
NOTE: Running task 2466 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_populate_sysroot)
NOTE: recipe parted-3.8-r0: task do_package: Started
NOTE: recipe parted-3.8-r0: task do_populate_sysroot: Started
NOTE: recipe parted-3.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-7.1-r0: task do_configure: Succeeded
NOTE: Running task 2467 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_compile)
NOTE: recipe btrfs-tools-7.1-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_packagedata: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2469 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_spdx)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_create_spdx: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_create_spdx: Succeeded
NOTE: recipe parted-3.8-r0: task do_package: Succeeded
NOTE: Running task 2470 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_packagedata)
NOTE: recipe parted-3.8-r0: task do_packagedata: Started
NOTE: recipe parted-3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2471 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_create_spdx)
NOTE: recipe parted-3.8-r0: task do_create_spdx: Started
NOTE: recipe parted-3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe btrfs-tools-7.1-r0: task do_compile: Succeeded
NOTE: Running task 2472 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_install)
NOTE: recipe btrfs-tools-7.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-7.1-r0: task do_install: Succeeded
NOTE: Running task 2473 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_package)
NOTE: recipe btrfs-tools-7.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-7.1-r0: task do_package: Succeeded
NOTE: Running task 2474 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-7.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-7.1-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile: Succeeded
NOTE: Running task 2475 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2476 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2478 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot)
NOTE: Running task 2479 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2480 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2481 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: Running task 2482 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 2483 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Running task 2484 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2485 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.2.0993-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.2.0993-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2486 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_configure)
NOTE: recipe vim-9.2.0993-r0: task do_configure: Started
NOTE: recipe perl-5.44.0-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.44.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.44.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2488 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_install)
NOTE: recipe perl-5.44.0-r0: task do_install: Started
NOTE: recipe vim-9.2.0993-r0: task do_configure: Succeeded
NOTE: Running task 2489 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_compile)
NOTE: recipe vim-9.2.0993-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package: Succeeded
NOTE: Running task 2490 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2491 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: Running task 2492 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.2.0993-r0: task do_compile: Succeeded
NOTE: Running task 2493 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_install)
NOTE: recipe vim-9.2.0993-r0: task do_install: Started
NOTE: recipe vim-9.2.0993-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_package)
NOTE: recipe vim-9.2.0993-r0: task do_package: Started
NOTE: recipe vim-9.2.0993-r0: task do_package: Succeeded
NOTE: Running task 2495 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/vim/vim_9.2.bb:do_packagedata)
NOTE: recipe vim-9.2.0993-r0: task do_packagedata: Started
NOTE: recipe vim-9.2.0993-r0: task do_packagedata: Succeeded
NOTE: Running task 2496 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_ipk)
NOTE: Running task 2497 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_deb)
NOTE: Running task 2498 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_write_rpm)
NOTE: Running task 2499 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb:do_package_qa)
NOTE: recipe dosfstools-4.2-r0: task do_package_write_ipk: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_deb: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_qa: Started
NOTE: recipe dosfstools-4.2-r0: task do_package_qa: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dosfstools-4.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_install: Succeeded
NOTE: Running task 2500 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.44.0-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.44.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2503 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_populate_sysroot)
NOTE: Running task 2504 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk)
NOTE: Running task 2505 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb)
NOTE: Running task 2506 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm)
NOTE: Running task 2507 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa)
NOTE: Running task 2508 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_write_ipk)
NOTE: Running task 2509 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_write_deb)
NOTE: recipe perl-5.44.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2510 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_write_rpm)
NOTE: Running task 2511 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_qa)
NOTE: Running task 2512 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_package_write_ipk)
NOTE: Running task 2513 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_package_write_deb)
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Started
NOTE: Running task 2514 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_package_write_rpm)
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2515 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_package_qa)
NOTE: recipe bash-5.3-r0: task do_package_qa: Started
NOTE: Running task 2516 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_package_write_ipk)
NOTE: Running task 2517 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_package_write_deb)
NOTE: recipe coreutils-9.11-r0: task do_package_write_ipk: Started
NOTE: recipe coreutils-9.11-r0: task do_package_write_deb: Started
NOTE: recipe coreutils-9.11-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.11-r0: task do_package_qa: Started
NOTE: recipe perl-5.44.0-r0: task do_package_write_ipk: Started
NOTE: recipe perl-5.44.0-r0: task do_package_write_deb: Started
NOTE: recipe perl-5.44.0-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.44.0-r0: task do_package_qa: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_package_write_deb: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_package_write_ipk: Started
NOTE: recipe perl-5.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2518 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_spdx)
NOTE: recipe perl-5.44.0-r0: task do_create_spdx: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk unihash changed to 4c991b7d59d7b2612eaed3568b3a2ec434c2854dcb6f8b402fd8cdfa47c6defb
NOTE: Running task 2519 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.11-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_write_ipk unihash changed to fc30f1a2b5b88dee1a0c52e15ad5d9f4a882f9806a4db9894023afa5290e57e9
NOTE: Running task 2520 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_package_qa)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_package_qa: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb unihash changed to c60101bc944842a63350b9c42a7674ba11aa2a0ac81355642c2a31f68c2e3800
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm unihash changed to a0b8f3eb977b9118195745d4e8cea073a2c59c56c28a963f5a1abd77c38467ef
NOTE: recipe bash-5.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa unihash changed to 4f16542957729f024ad6e82fd5383ffbceffc7651bdd9d8f8a82d9042b9d0d53
NOTE: recipe e2fsprogs-1.47.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_write_rpm unihash changed to 2c7dc04328d22fd4c85b16d0d1086fd7f55ad72b4e1fbb4e9a6cdba8d5f78697
NOTE: recipe e2fsprogs-1.47.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_package_qa unihash changed to 351f6a6b0d2376658f5f22e1e411f6f4e379e01fffa03243ced168ceac334a92
NOTE: recipe e2fsprogs-1.47.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_write_deb unihash changed to 0ca5c5084176e8cfc2f0ca9dd37ccb6fdb4bc2253465f479169dae542bdc493a
NOTE: recipe coreutils-9.11-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_package_qa unihash changed to 277524ec1b840673f2af1b74b12b97f4fb339f32334dbe939a8dcaaff45a2f4c
NOTE: recipe perl-5.44.0-r0: task do_create_spdx: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_package_qa unihash changed to 165022d270df2ce5f090f4e689bfd0b046d84255dd2b6a776afb64d88a2ad509
NOTE: recipe perl-5.44.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2521 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_unpack)
NOTE: Running task 2522 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_unpack: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_unpack: Succeeded
NOTE: Running task 2523 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2524 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_kernel_checkout)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_checkout: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_checkout: Succeeded
NOTE: Running task 2525 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_validate_branches)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_validate_branches: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_validate_branches: Succeeded
NOTE: Running task 2526 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_kernel_metadata)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_metadata: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2527 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_patch)
NOTE: Running task 2528 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_patch: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_patch: Succeeded
NOTE: Running task 2529 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2530 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_kernel_configme)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2531 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_configure)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_configure: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_configure: Succeeded
NOTE: Running task 2532 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_configcheck: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2533 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_compile)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_compile: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_shared_workdir)
NOTE: Running task 2535 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_kernel_link_images)
NOTE: Running task 2536 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_transform_kernel)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_transform_kernel: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_transform_kernel: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_shared_workdir: Succeeded
NOTE: Running task 2537 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_compile_kernelmodules)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_compile_kernelmodules: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 2538 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_strip)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_strip: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_strip: Succeeded
NOTE: Running task 2539 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_sizecheck)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_sizecheck: Succeeded
NOTE: Running task 2540 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_install)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_install: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_install: Succeeded
NOTE: Running task 2541 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_package)
NOTE: Running task 2542 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_package: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_package: Succeeded
NOTE: Running task 2543 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_packagedata)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_packagedata: Succeeded
NOTE: Running task 2544 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_create_spdx)
NOTE: Running task 2545 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_deploy)
NOTE: Running task 2546 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_package_write_ipk)
NOTE: Running task 2547 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_package_write_deb)
NOTE: Running task 2548 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_package_write_rpm)
NOTE: Running task 2549 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux/linux-yocto_7.2.bb:do_package_qa)
NOTE: Running task 2550 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_package_write_ipk)
NOTE: Running task 2551 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_package_write_deb)
NOTE: Running task 2552 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_package_write_rpm)
NOTE: Running task 2553 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_package_qa)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_create_spdx: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_deploy: Started
NOTE: Running task 2554 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_package_write_ipk)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_package_write_ipk: Started
NOTE: Running task 2555 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_package_write_deb)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_package_write_deb: Started
NOTE: Running task 2556 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_package_write_rpm)
NOTE: Running task 2557 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_package_qa)
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_package_qa: Started
NOTE: recipe util-linux-2.42.4-r0: task do_package_write_deb: Started
NOTE: recipe util-linux-2.42.4-r0: task do_package_write_ipk: Started
NOTE: recipe util-linux-2.42.4-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.42.4-r0: task do_package_qa: Started
NOTE: recipe parted-3.8-r0: task do_package_write_ipk: Started
NOTE: recipe parted-3.8-r0: task do_package_write_deb: Started
NOTE: recipe parted-3.8-r0: task do_package_write_rpm: Started
NOTE: recipe parted-3.8-r0: task do_package_qa: Started
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_deploy: Succeeded
NOTE: recipe parted-3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe parted-3.8-r0: task do_package_qa: Succeeded
NOTE: recipe parted-3.8-r0: task do_package_write_ipk: Succeeded
NOTE: recipe parted-3.8-r0: task do_package_write_deb: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2558 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_create_package_spdx)
NOTE: recipe parted-3.8-r0: task do_create_package_spdx: Started
NOTE: recipe util-linux-2.42.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe parted-3.8-r0: task do_create_package_spdx: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_package_qa unihash changed to eea5b457c4b857de79497397b2b14d2536180a7eb7c2e8245a578b28b9d504c1
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_package_qa: Succeeded
NOTE: recipe linux-yocto-7.2.6+git-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2559 of 2559 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/parted/parted_3.8.bb:do_build)
NOTE: Tasks Summary: Attempted 2559 tasks of which 2040 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 132 ERROR messages, returning a non-zero exit code.
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-src went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-dbg went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-xauth went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-wheel went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-warn went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-usertype went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-unix went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-umask went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-timestamp went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-time went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-succeed-if went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-stress went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-shells went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-setquota went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-securetty went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-rootok went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-pwhistory went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-permit went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-nologin went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-namespace went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-motd went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-mkhomedir went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-mail went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-loginuid went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-localuser went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-listfile went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-limits went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-keyinit went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-issue went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-group went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-ftp went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-filter went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-faillock went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-faildelay went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-exec went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-env went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-echo went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-deny went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-debug went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-canonicalize-user went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-plugin-access went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-ptest went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-staticdev went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-dev went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-doc went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-af went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-am went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ar went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-as went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-az went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-be went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-bg went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-bn went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-bn-in went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-bs went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ca went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-cs went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-cy went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-da went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-de went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-de-ch went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-el went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-eo went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-es went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-et went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-eu went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-fa went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-fi went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-fr went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ga went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-gl went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-gu went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-he went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-hi went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-hr went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-hu went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ia went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-id went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-is went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-it went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ja went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ka went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-kk went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-km went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-kn went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ko went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-kw-gb went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ky went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-lt went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-lv went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-mk went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ml went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-mn went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-mr went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ms went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-my went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-nb went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ne went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-nl went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-nn went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-or went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-pa went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-pl went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-pt went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-pt-br went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ro went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ru went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-si went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-sk went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-sl went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-sq went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-sr went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-sr+latin went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-sv went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ta went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-te went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-tg went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-th went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-tr went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-uk went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-ur went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-vi went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-yo went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-zh-cn went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-zh-hk went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-zh-tw went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-locale-zu went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-runtime went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package libpam-xtests went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: QA Issue: Package version for package pam-filter-upperlower went backwards which would break package feeds (from 0:1.7.3-r0 to 0:1.7.2-r0) [version-going-backwards]
ERROR: libpam-1.7.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5540898413467964950==--

