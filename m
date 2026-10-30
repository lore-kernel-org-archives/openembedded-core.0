Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6326.1793344582995740128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uvjVI/mI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=g6dg2yfA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a18baab185-e2287af6-2677-487a-9cb3-aff4215f8014-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793344582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JQ63v/EJ9DREdMaw/oA0QD+D+h07EizmMkH++ekwnOc=;
	b=uvjVI/mI3Ubb/yD5yJxRI/dxwUMROFTpbB/ilr1tBnPb9dnw0kBkKHU7yxUf29uv
	OD/LnnbjljyJLGD4j9/K8gS2cn+d4gqH4v3Nw5xQwupDt5ovqmtdnD2mz5X2BDt4kby
	at4QZgUWORAPgTN9sXazAUJllPjMArI/SkPhiyh4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793344582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JQ63v/EJ9DREdMaw/oA0QD+D+h07EizmMkH++ekwnOc=;
	b=g6dg2yfAobpH1YNHokHufHWU3UfoZdGvkjE27AX6t2k4H8olIYJZRSo1XwmEp8Hs
	8b7tIb5UmBLZr486LXV3Bxq5ezl6Z+SpjPdsoKNyxjRrdV1co8bS+dbIcEhN5dpTBh7
	xxP+6pj4DNPM9yt5xDw/Od0FeN5VWpYjA3nUuof4=
Content-Type: multipart/mixed; boundary="===============5117004926558084890=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fribidi: upgrading to 1.0.18 SUCCEEDED
Message-ID: <010101a18baab185-e2287af6-2677-487a-9cb3-aff4215f8014-000000@us-west-2.amazonses.com>
Date: Fri, 30 Oct 2026 07:16:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.30-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248998

--===============5117004926558084890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fribidi* to *1.0.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fribidi-upgrade-1.0.17-1.0.18.patch
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
From 46d077e10da614df4921ef4a4b2ed4aef159ac0e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 30 Oct 2026 07:16:15 +0000
Subject: [PATCH] fribidi: upgrade 1.0.17 -> 1.0.18

Overview of changes between 1.0.17 and 1.0.18
=============================================
---
 .../fribidi/{fribidi_1.0.17.bb => fribidi_1.0.18.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.17.bb => fribidi_1.0.18.bb} (89%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.17.bb b/meta/recipes-support/fribidi/fribidi_1.0.18.bb
similarity index 89%
rename from meta/recipes-support/fribidi/fribidi_1.0.17.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.18.bb
index 427f6dd760..02d5154627 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.17.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.18.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] = "6949dcde27d41cebad1fd741fcafc36d55a1020d2d872d4a6eb3914caabbada2"
+SRC_URI[sha256sum] = "1de5e8073d035388b71d0b2d452b1da1f8caeea8a7702997b401fe1b6250727f"
 
 inherit meson lib_package pkgconfig github-releases
 
-- 
2.47.1


--===============5117004926558084890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fribidi/fribidi-bin: PV changed from "1.0.17" to "1.0.18"
packages/x86-64-v3-poky-linux/fribidi/fribidi-bin: PKGV changed from 1.0.17 [default] to 1.0.18 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-dbg: PKGSIZE changed from 239344 to 241968 (+1%)
packages/x86-64-v3-poky-linux/fribidi/fribidi-dbg: PV changed from "1.0.17" to "1.0.18"
packages/x86-64-v3-poky-linux/fribidi/fribidi-dbg: PKGV changed from 1.0.17 [default] to 1.0.18 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-dev: PV changed from "1.0.17" to "1.0.18"
packages/x86-64-v3-poky-linux/fribidi/fribidi-dev: PKGV changed from 1.0.17 [default] to 1.0.18 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-doc: PKGSIZE changed from 70733 to 70731 (-0%)
packages/x86-64-v3-poky-linux/fribidi/fribidi-doc: PV changed from "1.0.17" to "1.0.18"
packages/x86-64-v3-poky-linux/fribidi/fribidi-doc: PKGV changed from 1.0.17 [default] to 1.0.18 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-locale: PV changed from "1.0.17" to "1.0.18"
packages/x86-64-v3-poky-linux/fribidi/fribidi-locale: PKGV changed from 1.0.17 [default] to 1.0.18 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-src: PKGSIZE changed from 873453 to 880047 (+1%)
packages/x86-64-v3-poky-linux/fribidi/fribidi-src: FILELIST: directory renamed /usr/src/debug/fribidi/1.0.17/bin -> /usr/src/debug/fribidi/1.0.18/bin, directory renamed /usr/src/debug/fribidi/1.0.17/lib -> /usr/src/debug/fribidi/1.0.18/lib
packages/x86-64-v3-poky-linux/fribidi/fribidi-src: PV changed from "1.0.17" to "1.0.18"
packages/x86-64-v3-poky-linux/fribidi/fribidi-src: PKGV changed from 1.0.17 [default] to 1.0.18 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi-staticdev: PV changed from "1.0.17" to "1.0.18"
packages/x86-64-v3-poky-linux/fribidi/fribidi-staticdev: PKGV changed from 1.0.17 [default] to 1.0.18 [default]
packages/x86-64-v3-poky-linux/fribidi/fribidi: PV changed from "1.0.17" to "1.0.18"
packages/x86-64-v3-poky-linux/fribidi/fribidi: PKGV changed from 1.0.17 [default] to 1.0.18 [default]
packages/x86-64-v3-poky-linux/fribidi: SRC_URI changed from "https://github.com/fribidi/fribidi/releases//download/v1.0.17/fribidi-1.0.17.tar.xz" to "https://github.com/fribidi/fribidi/releases//download/v1.0.18/fribidi-1.0.18.tar.xz"
packages/x86-64-v3-poky-linux/fribidi: PV changed from "1.0.17" to "1.0.18"
packages/x86-64-v3-poky-linux/fribidi: PKGV changed from 1.0.17 [default] to 1.0.18 [default]

--===============5117004926558084890==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fribidi-upgrade-1.0.17-1.0.18.patch"

RnJvbSA0NmQwNzdlMTBkYTYxNGRmNDkyMWVmNGE0YjJlZDRhZWYxNTlhYzBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzAgT2N0IDIwMjYgMDc6MTY6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
cmliaWRpOiB1cGdyYWRlIDEuMC4xNyAtPiAxLjAuMTgKCk92ZXJ2aWV3IG9mIGNoYW5nZXMgYmV0
d2VlbiAxLjAuMTcgYW5kIDEuMC4xOAo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KLS0tCiAuLi4vZnJpYmlkaS97ZnJpYmlkaV8xLjAuMTcuYmIgPT4gZnJpYmlk
aV8xLjAuMTguYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9mcmliaWRp
L3tmcmliaWRpXzEuMC4xNy5iYiA9PiBmcmliaWRpXzEuMC4xOC5iYn0gKDg5JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9mcmliaWRpL2ZyaWJpZGlfMS4wLjE3LmJiIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZnJpYmlkaS9mcmliaWRpXzEuMC4xOC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9mcmliaWRpL2ZyaWJpZGlf
MS4wLjE3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9mcmliaWRpL2ZyaWJpZGlf
MS4wLjE4LmJiCmluZGV4IDQyN2Y2ZGQ3NjAuLjAyZDUxNTQ2MjcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2ZyaWJpZGkvZnJpYmlkaV8xLjAuMTcuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZnJpYmlkaS9mcmliaWRpXzEuMC4xOC5iYgpAQCAtMTEsNyArMTEsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT00YmY2NjFjMWUzNzkzZTU1Yzhk
MTA1MWJjNWUwYWUyMSIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
diR7UFZ9LyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI2OTQ5ZGNkZTI3ZDQxY2ViYWQxZmQ3NDFmY2FmYzM2ZDU1YTEwMjBkMmQ4NzJkNGE2ZWIzOTE0
Y2FhYmJhZGEyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFkZTVlODA3M2QwMzUzODhiNzFkMGIy
ZDQ1MmIxZGExZjhjYWVlYThhNzcwMjk5N2I0MDFmZTFiNjI1MDcyN2YiCiAKIGluaGVyaXQgbWVz
b24gbGliX3BhY2thZ2UgcGtnY29uZmlnIGdpdGh1Yi1yZWxlYXNlcwogCi0tIAoyLjQ3LjEKCg==

--===============5117004926558084890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fribidi-changelog.txt"

Overview of changes between 1.0.17 and 1.0.18
=============================================

--===============5117004926558084890==--
