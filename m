Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AFCC5DF9B
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 05:25:50 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1717.1787376339867872828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 22:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DTq5Pgyu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GqK/65Yg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a027ee87f2-c27fe271-de8f-46ef-a4e3-33d844fa5a39-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787376339;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=6Bnn4Z1XLNjkWreS+Ws5bFdYqK6Iqa3g7pcYEhdf2hg=;
	b=DTq5Pgyu95EYTkbwAkiAHpSltpVD7skC1CfDn7FEdZgoIn4gX4SoA7pWFHj7Kr7R
	RGO4KN7e3GWSuw4GJQugMB57zznmtdwSo14f8OklFazlapJOj1CTOcMc1U2ZynZq8xm
	wbbmtReKiWLmS6Oe32dH34IO7H4LTyvlRjaQzIC8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787376339;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=6Bnn4Z1XLNjkWreS+Ws5bFdYqK6Iqa3g7pcYEhdf2hg=;
	b=GqK/65Yg+/0FpryH557JZL5j7fRPXWtXEOavHJGujh7+TNZqwW/zGNfOhLRXgugp
	sXOOIA36dWfG4W1xprhGRqSsJFZPBc3z+FFZP5lLp9vauuoKpDVC9PI7Rz9AnQ9w+t1
	PmjZrvT555ZMhZt57ltGM336Io5oBFfwceweqL7s=
Content-Type: multipart/mixed; boundary="===============1129397396522694553=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ed: upgrading to 1.22.6 SUCCEEDED
Message-ID: <010101a027ee87f2-c27fe271-de8f-46ef-a4e3-33d844fa5a39-000000@us-west-2.amazonses.com>
Date: Sat, 22 Aug 2026 05:25:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.22-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 05:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243964

--===============1129397396522694553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ed* to *1.22.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ed-upgrade-1.22.5-1.22.6.patch
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
From 40b81da8da9becc9177f2eba2f5833184866d924 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 22 Aug 2026 05:18:58 +0000
Subject: [PATCH] ed: upgrade 1.22.5 -> 1.22.6

Source: NEWS

Changes in version 1.22.6:

Some changes have been made to the code to pacify gcc's static analyzer.
(Reported by Mikel Olasagasti Uranga).

'regex(7)' has been added to the --help output and to section 'SEE ALSO' in
the man page.

It has been documented in the manual that the cut buffer is deleted when a
new file is read with 'e' or 'E'. (Reported by Tim Chase).

It has been documented in the manual that using a regular expression inside
the command-list of a global command may cause the "last regular expression
processed" to differ between the first and subsequent executions of the
command-list. (Reported by Artyom Bologov).
---
 meta/recipes-extended/ed/{ed_1.22.5.bb => ed_1.22.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.22.5.bb => ed_1.22.6.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.22.5.bb b/meta/recipes-extended/ed/ed_1.22.6.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.22.5.bb
rename to meta/recipes-extended/ed/ed_1.22.6.bb
index 0301dd42c9..e65fe835ab 100644
--- a/meta/recipes-extended/ed/ed_1.22.5.bb
+++ b/meta/recipes-extended/ed/ed_1.22.6.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "56e107ddc2f29dad6690376c15bf9751509e1ee3b8241710e44edbe5c3a158cc"
+SRC_URI[sha256sum] = "3f33b22135219c39c3c695f7b7171c2567d3e2a17c798c0a90607320cbb268f2"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.47.1


--===============1129397396522694553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ed/ed-dbg: PV changed from "1.22.5" to "1.22.6"
packages/x86-64-v3-poky-linux/ed/ed-dbg: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/x86-64-v3-poky-linux/ed/ed-dbg: PKGSIZE changed from 183672 to 183632 (-0%)
packages/x86-64-v3-poky-linux/ed/ed-dev: PV changed from "1.22.5" to "1.22.6"
packages/x86-64-v3-poky-linux/ed/ed-dev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/x86-64-v3-poky-linux/ed/ed-doc: PV changed from "1.22.5" to "1.22.6"
packages/x86-64-v3-poky-linux/ed/ed-doc: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/x86-64-v3-poky-linux/ed/ed-doc: PKGSIZE changed from 76080 to 76427 (+0%)
packages/x86-64-v3-poky-linux/ed/ed-locale: PV changed from "1.22.5" to "1.22.6"
packages/x86-64-v3-poky-linux/ed/ed-locale: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/x86-64-v3-poky-linux/ed/ed-src: PV changed from "1.22.5" to "1.22.6"
packages/x86-64-v3-poky-linux/ed/ed-src: FILELIST: directory renamed /usr/src/debug/ed/1.22.5 -> /usr/src/debug/ed/1.22.6
packages/x86-64-v3-poky-linux/ed/ed-src: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/x86-64-v3-poky-linux/ed/ed-src: PKGSIZE changed from 117015 to 117058 (+0%)
packages/x86-64-v3-poky-linux/ed/ed-staticdev: PV changed from "1.22.5" to "1.22.6"
packages/x86-64-v3-poky-linux/ed/ed-staticdev: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/x86-64-v3-poky-linux/ed/ed: PV changed from "1.22.5" to "1.22.6"
packages/x86-64-v3-poky-linux/ed/ed: PKGV changed from 1.22.5 [default] to 1.22.6 [default]
packages/x86-64-v3-poky-linux/ed: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/ed/ed-1.22.5.tar.lz" to "https://ftpmirror.gnu.org/gnu/ed/ed-1.22.6.tar.lz"
packages/x86-64-v3-poky-linux/ed: PV changed from "1.22.5" to "1.22.6"
packages/x86-64-v3-poky-linux/ed: PKGV changed from 1.22.5 [default] to 1.22.6 [default]

--===============1129397396522694553==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ed-upgrade-1.22.5-1.22.6.patch"

RnJvbSA0MGI4MWRhOGRhOWJlY2M5MTc3ZjJlYmEyZjU4MzMxODQ4NjZkOTI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjIgQXVnIDIwMjYgMDU6MTg6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
ZDogdXBncmFkZSAxLjIyLjUgLT4gMS4yMi42CgpTb3VyY2U6IE5FV1MKCkNoYW5nZXMgaW4gdmVy
c2lvbiAxLjIyLjY6CgpTb21lIGNoYW5nZXMgaGF2ZSBiZWVuIG1hZGUgdG8gdGhlIGNvZGUgdG8g
cGFjaWZ5IGdjYydzIHN0YXRpYyBhbmFseXplci4KKFJlcG9ydGVkIGJ5IE1pa2VsIE9sYXNhZ2Fz
dGkgVXJhbmdhKS4KCidyZWdleCg3KScgaGFzIGJlZW4gYWRkZWQgdG8gdGhlIC0taGVscCBvdXRw
dXQgYW5kIHRvIHNlY3Rpb24gJ1NFRSBBTFNPJyBpbgp0aGUgbWFuIHBhZ2UuCgpJdCBoYXMgYmVl
biBkb2N1bWVudGVkIGluIHRoZSBtYW51YWwgdGhhdCB0aGUgY3V0IGJ1ZmZlciBpcyBkZWxldGVk
IHdoZW4gYQpuZXcgZmlsZSBpcyByZWFkIHdpdGggJ2UnIG9yICdFJy4gKFJlcG9ydGVkIGJ5IFRp
bSBDaGFzZSkuCgpJdCBoYXMgYmVlbiBkb2N1bWVudGVkIGluIHRoZSBtYW51YWwgdGhhdCB1c2lu
ZyBhIHJlZ3VsYXIgZXhwcmVzc2lvbiBpbnNpZGUKdGhlIGNvbW1hbmQtbGlzdCBvZiBhIGdsb2Jh
bCBjb21tYW5kIG1heSBjYXVzZSB0aGUgImxhc3QgcmVndWxhciBleHByZXNzaW9uCnByb2Nlc3Nl
ZCIgdG8gZGlmZmVyIGJldHdlZW4gdGhlIGZpcnN0IGFuZCBzdWJzZXF1ZW50IGV4ZWN1dGlvbnMg
b2YgdGhlCmNvbW1hbmQtbGlzdC4gKFJlcG9ydGVkIGJ5IEFydHlvbSBCb2xvZ292KS4KLS0tCiBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQve2VkXzEuMjIuNS5iYiA9PiBlZF8xLjIyLjYuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2VkL3tlZF8xLjIyLjUuYmIgPT4gZWRfMS4yMi42LmJi
fSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIyLjUu
YmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMi42LmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIyLjUuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIyLjYuYmIKaW5kZXggMDMw
MWRkNDJjOS4uZTY1ZmU4MzVhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Vk
L2VkXzEuMjIuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQvZWRfMS4yMi42LmJi
CkBAIC0xOSw3ICsxOSw3IEBAIGJpbmRpciA9ICIke2Jhc2VfYmluZGlyfSIKIFNSQ19VUkkgPSAi
JHtHTlVfTUlSUk9SfS9lZC8ke0JQfS50YXIubHoiCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiJHtH
TlVfTUlSUk9SfS9lZC8iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NmUxMDdkZGMyZjI5ZGFk
NjY5MDM3NmMxNWJmOTc1MTUwOWUxZWUzYjgyNDE3MTBlNDRlZGJlNWMzYTE1OGNjIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjNmMzNiMjIxMzUyMTljMzljM2M2OTVmN2I3MTcxYzI1NjdkM2UyYTE3
Yzc5OGMwYTkwNjA3MzIwY2JiMjY4ZjIiCiAKIEVYVFJBX09FTUFLRSA9ICItZSBNQUtFRkxBR1M9
IgogCi0tIAoyLjQ3LjEKCg==

--===============1129397396522694553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ed-changelog.txt"

Changelog for ed: 1.22.5 -> 1.22.6
Source: NEWS

Changes in version 1.22.6:

Some changes have been made to the code to pacify gcc's static analyzer.
(Reported by Mikel Olasagasti Uranga).

'regex(7)' has been added to the --help output and to section 'SEE ALSO' in
the man page.

It has been documented in the manual that the cut buffer is deleted when a
new file is read with 'e' or 'E'. (Reported by Tim Chase).

It has been documented in the manual that using a regular expression inside
the command-list of a global command may cause the "last regular expression
processed" to differ between the first and subsequent executions of the
command-list. (Reported by Artyom Bologov).

--===============1129397396522694553==--

