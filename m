Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A71C79F83
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 05:38:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7601.1788500298778436090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 22:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uqZgzuvM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tLWMGz4n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a06aecc7d4-f40962bf-8fc3-4c1d-abf5-cf4cbfbabca8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788500297;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=wIdzb0YJ+fr1lgZsAeUY1H8THgiD/Mw+kMU5zXPZK4U=;
	b=uqZgzuvMjX+s5kx7pyavnXT5RJpgYMVX56NvAvWO9DECdLP3bS9ExOtwVRJ5rTrP
	2ZofhNqnQUXoNhfzTo1AwEZZbM/MB+MgE7OLQOmzwYE0s6vGxbHZN5jxOsHX3xOvT7f
	TXJgmzAlil/D+yrMkWYtCDgSIscGqzKwGrv4YCUE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788500297;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=wIdzb0YJ+fr1lgZsAeUY1H8THgiD/Mw+kMU5zXPZK4U=;
	b=tLWMGz4nn+Lr0qqOrrj8J7W25iNJ4pjzQ+W1qNdhgavkVRsVZyuvqwz7kkiqGDsb
	FzXH3lFCyUtuje5BwAJk+dC4weII8BzOcq3hNP41dNfCo4cELMaDExZgq+ac/A2uFle
	n2NzQUmGzHxBCA8w42EBNoVc1yWOJ6s3PPHsic98=
Content-Type: multipart/mixed; boundary="===============4411896072618796015=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] enchant2: upgrading to 2.8.21 SUCCEEDED
Message-ID: <010101a06aecc7d4-f40962bf-8fc3-4c1d-abf5-cf4cbfbabca8-000000@us-west-2.amazonses.com>
Date: Fri, 4 Sep 2026 05:38:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.04-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 05:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245060

--===============4411896072618796015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *enchant2* to *2.8.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-enchant2-upgrade-2.8.19-2.8.21.patch
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
From bc90bf10a2e44465b4bb5e388211d84e907f4644 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 4 Sep 2026 05:38:11 +0000
Subject: [PATCH] enchant2: upgrade 2.8.19 -> 2.8.21

Source: NEWS

2.8.21 (September 3, 2026)
--------------------------

This release fixes two bugs in composite dictionaries: first, if any
dictionary creation failed during creation of a composite dictionary,
dictionaries already created would be leaked; and secondly, the broker error
status could end up indicating an error incorrectly when one provider or
language failed and a fallback later succeeded. Thanks to @lpyuu for the
report and fixes.

2.8.20 (August 25, 2026)
------------------------

This release improves the man page for enchant(1), mostly by documenting
Ispell command-line options and pipe-mode commands that it ignores.
---
 .../enchant/{enchant2_2.8.19.bb => enchant2_2.8.21.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.19.bb => enchant2_2.8.21.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.8.19.bb b/meta/recipes-support/enchant/enchant2_2.8.21.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.19.bb
rename to meta/recipes-support/enchant/enchant2_2.8.21.bb
index f5d5897fd0..49d953a6c8 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.19.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.21.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "c8d70991d544ee39274b96bd01d2858a009fe732ff43f2aaf605fd61ecd06f60"
+SRC_URI[sha256sum] = "dd2a762697c463148a8f59867089a5ebf2dd1449d869f93764b76c12bcf8acc0"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 
-- 
2.47.1


--===============4411896072618796015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="enchant2-changelog.txt"

Changelog for enchant2: 2.8.19 -> 2.8.21
Source: NEWS

2.8.21 (September 3, 2026)
--------------------------

This release fixes two bugs in composite dictionaries: first, if any
dictionary creation failed during creation of a composite dictionary,
dictionaries already created would be leaked; and secondly, the broker error
status could end up indicating an error incorrectly when one provider or
language failed and a fallback later succeeded. Thanks to @lpyuu for the
report and fixes.

2.8.20 (August 25, 2026)
------------------------

This release improves the man page for enchant(1), mostly by documenting
Ispell command-line options and pipe-mode commands that it ignores.

--===============4411896072618796015==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-enchant2-upgrade-2.8.19-2.8.21.patch"

RnJvbSBiYzkwYmYxMGEyZTQ0NDY1YjRiYjVlMzg4MjExZDg0ZTkwN2Y0NjQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNCBTZXAgMjAyNiAwNTozODoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVu
Y2hhbnQyOiB1cGdyYWRlIDIuOC4xOSAtPiAyLjguMjEKClNvdXJjZTogTkVXUwoKMi44LjIxIChT
ZXB0ZW1iZXIgMywgMjAyNikKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KClRoaXMgcmVsZWFz
ZSBmaXhlcyB0d28gYnVncyBpbiBjb21wb3NpdGUgZGljdGlvbmFyaWVzOiBmaXJzdCwgaWYgYW55
CmRpY3Rpb25hcnkgY3JlYXRpb24gZmFpbGVkIGR1cmluZyBjcmVhdGlvbiBvZiBhIGNvbXBvc2l0
ZSBkaWN0aW9uYXJ5LApkaWN0aW9uYXJpZXMgYWxyZWFkeSBjcmVhdGVkIHdvdWxkIGJlIGxlYWtl
ZDsgYW5kIHNlY29uZGx5LCB0aGUgYnJva2VyIGVycm9yCnN0YXR1cyBjb3VsZCBlbmQgdXAgaW5k
aWNhdGluZyBhbiBlcnJvciBpbmNvcnJlY3RseSB3aGVuIG9uZSBwcm92aWRlciBvcgpsYW5ndWFn
ZSBmYWlsZWQgYW5kIGEgZmFsbGJhY2sgbGF0ZXIgc3VjY2VlZGVkLiBUaGFua3MgdG8gQGxweXV1
IGZvciB0aGUKcmVwb3J0IGFuZCBmaXhlcy4KCjIuOC4yMCAoQXVndXN0IDI1LCAyMDI2KQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KClRoaXMgcmVsZWFzZSBpbXByb3ZlcyB0aGUgbWFuIHBhZ2Ug
Zm9yIGVuY2hhbnQoMSksIG1vc3RseSBieSBkb2N1bWVudGluZwpJc3BlbGwgY29tbWFuZC1saW5l
IG9wdGlvbnMgYW5kIHBpcGUtbW9kZSBjb21tYW5kcyB0aGF0IGl0IGlnbm9yZXMuCi0tLQogLi4u
L2VuY2hhbnQve2VuY2hhbnQyXzIuOC4xOS5iYiA9PiBlbmNoYW50Ml8yLjguMjEuYmJ9ICAgICAg
ICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvZW5jaGFudC97ZW5jaGFudDJfMi44LjE5LmJi
ID0+IGVuY2hhbnQyXzIuOC4yMS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xOS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2VuY2hhbnQvZW5jaGFudDJfMi44LjIxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2VuY2hhbnQvZW5jaGFudDJfMi44LjE5LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9lbmNoYW50L2VuY2hhbnQyXzIuOC4yMS5iYgppbmRl
eCBmNWQ1ODk3ZmQwLi40OWQ5NTNhNmM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9lbmNoYW50L2VuY2hhbnQyXzIuOC4xOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9l
bmNoYW50L2VuY2hhbnQyXzIuOC4yMS5iYgpAQCAtMTIsNyArMTIsNyBAQCBERVBFTkRTID0gImds
aWItMi4wIGdyb2ZmLW5hdGl2ZSIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnaXRodWIt
cmVsZWFzZXMKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9
L2VuY2hhbnQtJHtQVn0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM4ZDcwOTkxZDU0
NGVlMzkyNzRiOTZiZDAxZDI4NThhMDA5ZmU3MzJmZjQzZjJhYWY2MDVmZDYxZWNkMDZmNjAiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZGQyYTc2MjY5N2M0NjMxNDhhOGY1OTg2NzA4OWE1ZWJmMmRk
MTQ0OWQ4NjlmOTM3NjRiNzZjMTJiY2Y4YWNjMCIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9ycnRob21hcy9lbmNoYW50L3JlbGVhc2VzIgogCi0tIAoyLjQ3LjEKCg==

--===============4411896072618796015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PV changed from "2.8.19" to "2.8.21"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGV changed from 2.8.19 [default] to 2.8.21 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: FILELIST: removed "/usr/lib/.debug/libenchant-2.so.2.8.19", added "/usr/lib/.debug/libenchant-2.so.2.8.21"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dbg: PKGSIZE changed from 532048 to 532984 (+0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PV changed from "2.8.19" to "2.8.21"
packages/x86-64-v3-poky-linux/enchant2/enchant2-dev: PKGV changed from 2.8.19 [default] to 2.8.21 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PV changed from "2.8.19" to "2.8.21"
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGV changed from 2.8.19 [default] to 2.8.21 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGSIZE changed from 23419 to 25766 (+10%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PV changed from "2.8.19" to "2.8.21"
packages/x86-64-v3-poky-linux/enchant2/enchant2-locale: PKGV changed from 2.8.19 [default] to 2.8.21 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PV changed from "2.8.19" to "2.8.21"
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGV changed from 2.8.19 [default] to 2.8.21 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: FILELIST: directory renamed /usr/src/debug/enchant2/2.8.19/lib -> /usr/src/debug/enchant2/2.8.21/lib, directory renamed /usr/src/debug/enchant2/2.8.19/libgnu -> /usr/src/debug/enchant2/2.8.21/libgnu, directory renamed /usr/src/debug/enchant2/2.8.19/src -> /usr/src/debug/enchant2/2.8.21/src, directory renamed /usr/src/debug/enchant2/2.8.19/providers -> /usr/src/debug/enchant2/2.8.21/providers
packages/x86-64-v3-poky-linux/enchant2/enchant2-src: PKGSIZE changed from 621519 to 622793 (+0%)
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PV changed from "2.8.19" to "2.8.21"
packages/x86-64-v3-poky-linux/enchant2/enchant2-staticdev: PKGV changed from 2.8.19 [default] to 2.8.21 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: PV changed from "2.8.19" to "2.8.21"
packages/x86-64-v3-poky-linux/enchant2/enchant2: PKGV changed from 2.8.19 [default] to 2.8.21 [default]
packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.19", added "/usr/lib/libenchant-2.so.2.8.21"
packages/x86-64-v3-poky-linux/enchant2: SRC_URI changed from "https://github.com/rrthomas/enchant/releases/download/v2.8.19/enchant-2.8.19.tar.gz" to "https://github.com/rrthomas/enchant/releases/download/v2.8.21/enchant-2.8.21.tar.gz"
packages/x86-64-v3-poky-linux/enchant2: PV changed from "2.8.19" to "2.8.21"
packages/x86-64-v3-poky-linux/enchant2: PKGV changed from 2.8.19 [default] to 2.8.21 [default]
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.19 to libenchant-2.so.2.8.21
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.19 to libenchant-2.so.2.8.21
  /usr/lib/libenchant-2.so.2.8.19 moved to /usr/lib/libenchant-2.so.2.8.21

--===============4411896072618796015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/enchant2/enchant2-doc: PKGSIZE changed from 23419 to 25766 (+10%)
packages/x86-64-v3-poky-linux/enchant2/enchant2: FILELIST: removed "/usr/lib/libenchant-2.so.2.8.19", added "/usr/lib/libenchant-2.so.2.8.21"
Changes to packages/x86-64-v3-poky-linux/enchant2 (sysroot):
  /usr/lib/libenchant-2.so.2 changed symlink target from libenchant-2.so.2.8.19 to libenchant-2.so.2.8.21
  /usr/lib/libenchant-2.so changed symlink target from libenchant-2.so.2.8.19 to libenchant-2.so.2.8.21
  /usr/lib/libenchant-2.so.2.8.19 moved to /usr/lib/libenchant-2.so.2.8.21

--===============4411896072618796015==--

