Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE64EC54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 05:45:16 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5301.1785390308360968378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 22:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Tr6FjS3B;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=b+Wo0vlq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019fb18e1f88-465e0adb-d4fd-4e74-882f-0dc06a073f4b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785390309;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=UuMd1L4IFdk4Ng9baX3JaJaFRE4F+bCuz+qAI74hfpQ=;
	b=Tr6FjS3B1SKx5zVYi7aQNdto2G9XrRufBE5wGxB2hCDA9wpN0LSn4iRiEdfEjZf0
	ZPPifJPkZl9c/xw34NbZqD/S6c5FZQMEjWZDg6fzli8bqD5Nlu0ImC7j9hashywi3Gh
	ooR/HaiKxpousXnQRirNuhsrxd2KW9n5xEEO4h/Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785390309;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=UuMd1L4IFdk4Ng9baX3JaJaFRE4F+bCuz+qAI74hfpQ=;
	b=b+Wo0vlqJCXuW/i2im7iRGD7YADWj4lmpsgwvB1USCJdcPS9f93+SWrFfX1VHGgf
	Ilmz1iVpLHcAGpZIof2zVkf90d1vlIhlMJ0aLZa2xYfvII12HgRhnIq5nroe9xxte7x
	eub1AP3fOSqn+Gmz+tm4V684zR8YHJU2JbpoZfnk=
Content-Type: multipart/mixed; boundary="===============1295821172422846890=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.70.0 SUCCEEDED
Message-ID: <0101019fb18e1f88-465e0adb-d4fd-4e74-882f-0dc06a073f4b-000000@us-west-2.amazonses.com>
Date: Thu, 30 Jul 2026 05:45:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.30-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242319

--===============1295821172422846890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nghttp2* to *1.70.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nghttp2-upgrade-1.69.0-1.70.0.patch
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
From 36063f945b3eb63dc4dd395bef9a587d67a22573 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 30 Jul 2026 05:44:55 +0000
Subject: [PATCH] nghttp2: upgrade 1.69.0 -> 1.70.0

Source: ChangeLog

commit 85e300c79fb6dbcfa9c1013215c8710c1c2cd3d2
Merge: a399ab72 dedad37d
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-07-29
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-07-29

    Merge pull request #2823 from nghttp2/nghttpx-reset-quic-upstream-addr-fd

    nghttpx: Reset quic upstream addr fd to the current path

commit dedad37defa9ab3c5ae818e526679c25623732e2
AuthorDate: 2026-07-29
CommitDate: 2026-07-29

    nghttpx: Reset quic upstream addr fd to the current path

commit a399ab720d0a141d4ddccc3b0240ab602bf59c95
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-07-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-07-29
commit 53587b5a703558571f32f17dce85549f805fd171
AuthorDate: 2026-07-29
CommitDate: 2026-07-29
commit 23f26ba7f4bd85c288901dd82590ad5a05df16ab
AuthorDate: 2026-07-29
CommitDate: 2026-07-29
commit 31e206ff9e1a8d51f4b0c1718658fd5ce84c5686
AuthorDate: 2026-07-29
CommitDate: 2026-07-29
commit 333e32ddeaace68ce81e3d393a82ac2ae131359d
Merge: dcc7566e 496c2f3b
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Merge pull request #2822 from nghttp2/bump-llhttp
    Bump llhttp to v9.4.2
commit 496c2f3b8b3473ba5e5737ad8a484970299752c4
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Bump llhttp to v9.4.2
commit dcc7566e49c6b89c0c2e8cf64021dbf73c54881e
Merge: e55172da 55992354
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Merge pull request #2821 from nghttp2/bump-neverbleed
    Bump neverbleed
commit 5599235422dd0585e401f51a2cf89b67607aeb39
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Bump neverbleed
commit e55172daf9a4756b1aeac2691223cf13d06cc44c
Merge: 91ad6fdb a9461d0c
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Merge pull request #2820 from nghttp2/bump-ngtcp2
    Bump ngtcp2 and its dependencies
commit a9461d0c4b1f84ae1cdc1683b5cfe22c5f17273e
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Bump ngtcp2 and its dependencies
commit 91ad6fdbb42061f6e45c9b67da7b1804958c5877
Merge: 772b19ea e33df631
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Merge pull request #2819 from nghttp2/dependabot/go_modules/github.com/quic-go/quic-go-0.61.0
    build(deps): bump github.com/quic-go/quic-go from 0.60.0 to 0.61.0
commit e33df6313a0d05431e52a5187307cae357600d25
Author:     dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
AuthorDate: 2026-07-27
CommitDate: 2026-07-27
    build(deps): bump github.com/quic-go/quic-go from 0.60.0 to 0.61.0
    Bumps [github.com/quic-go/quic-go](https://github.com/quic-go/quic-go) from 0.60.0 to 0.61.0.
    - [Release notes](https://github.com/quic-go/quic-go/releases)
    - [Commits](https://github.com/quic-go/quic-go/compare/v0.60.0...v0.61.0)
    ---
    updated-dependencies:
    - dependency-name: github.com/quic-go/quic-go
      dependency-version: 0.61.0
      dependency-type: direct:production
      update-type: version-update:semver-minor

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../nghttp2/{nghttp2_1.69.0.bb => nghttp2_1.70.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.69.0.bb => nghttp2_1.70.0.bb} (84%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.69.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
similarity index 84%
rename from meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
index 8f3e1e4a97..1b09f91ce6 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1fb324b6ec2c56f6bde0658f4139ffd8209fa9e77ce98fd7a5f63af8d0e508ad"
+SRC_URI[sha256sum] = "e05cb1388eaca3830aded4ccf20044b6e1ac1a61411dcca11b0437c4285c8bc2"
 
 inherit cmake manpages python3native github-releases
 
-- 
2.47.1


--===============1295821172422846890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/nghttp2/nghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.29.4", added "/usr/lib/libnghttp2.so.14.29.5"
Changes to packages/x86-64-v3-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.29.4 to libnghttp2.so.14.29.5
  /usr/lib/libnghttp2.so.14.29.4 moved to /usr/lib/libnghttp2.so.14.29.5

--===============1295821172422846890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/nghttp2: PV changed from "1.69.0" to "1.70.0"
packages/x86-64-v3-poky-linux/nghttp2: PKGV changed from 1.69.0 [default] to 1.70.0 [default]
packages/x86-64-v3-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.69.0/nghttp2-1.69.0.tar.xz" to "https://github.com/nghttp2/nghttp2/releases//download/v1.70.0/nghttp2-1.70.0.tar.xz"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.69.0" to "1.70.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: FILELIST: removed "/usr/lib/.debug/libnghttp2.so.14.29.4", added "/usr/lib/.debug/libnghttp2.so.14.29.5"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.69.0 [default] to 1.70.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dbg: PKGSIZE changed from 638336 to 638680 (+0%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.69.0" to "1.70.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.69.0 [default] to 1.70.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.69.0" to "1.70.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.69.0 [default] to 1.70.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-doc: PKGSIZE changed from 49547 to 49546 (-0%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.69.0" to "1.70.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.69.0 [default] to 1.70.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PV changed from "1.69.0" to "1.70.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: FILELIST: directory renamed /usr/src/debug/nghttp2/1.69.0/lib/includes/nghttp2 -> /usr/src/debug/nghttp2/1.70.0/lib/includes/nghttp2, directory renamed /usr/src/debug/nghttp2/1.69.0/lib -> /usr/src/debug/nghttp2/1.70.0/lib
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.69.0 [default] to 1.70.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-src: PKGSIZE changed from 1063280 to 1050159 (-1%)
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.69.0" to "1.70.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.69.0 [default] to 1.70.0 [default]
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: PV changed from "1.69.0" to "1.70.0"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.29.4", added "/usr/lib/libnghttp2.so.14.29.5"
packages/x86-64-v3-poky-linux/nghttp2/nghttp2: PKGV changed from 1.69.0 [default] to 1.70.0 [default]
Changes to packages/x86-64-v3-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.29.4 to libnghttp2.so.14.29.5
  /usr/lib/libnghttp2.so.14.29.4 moved to /usr/lib/libnghttp2.so.14.29.5

--===============1295821172422846890==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.69.0-1.70.0.patch"

RnJvbSAzNjA2M2Y5NDViM2ViNjNkYzRkZDM5NWJlZjlhNTg3ZDY3YTIyNTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMzAgSnVsIDIwMjYgMDU6NDQ6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
Z2h0dHAyOiB1cGdyYWRlIDEuNjkuMCAtPiAxLjcwLjAKClNvdXJjZTogQ2hhbmdlTG9nCgpjb21t
aXQgODVlMzAwYzc5ZmI2ZGJjZmE5YzEwMTMyMTVjODcxMGMxYzJjZDNkMgpNZXJnZTogYTM5OWFi
NzIgZGVkYWQzN2QKQXV0aG9yOiAgICAgVGF0c3VoaXJvIFRzdWppa2F3YSA8NDA0NjEwK3RhdHN1
aGlyby10QHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbT4KQXV0aG9yRGF0ZTogMjAyNi0wNy0yOQpD
b21taXQ6ICAgICBHaXRIdWIgPG5vcmVwbHlAZ2l0aHViLmNvbT4KQ29tbWl0RGF0ZTogMjAyNi0w
Ny0yOQoKICAgIE1lcmdlIHB1bGwgcmVxdWVzdCAjMjgyMyBmcm9tIG5naHR0cDIvbmdodHRweC1y
ZXNldC1xdWljLXVwc3RyZWFtLWFkZHItZmQKCiAgICBuZ2h0dHB4OiBSZXNldCBxdWljIHVwc3Ry
ZWFtIGFkZHIgZmQgdG8gdGhlIGN1cnJlbnQgcGF0aAoKY29tbWl0IGRlZGFkMzdkZWZhOWFiM2M1
YWU4MThlNTI2Njc5YzI1NjIzNzMyZTIKQXV0aG9yRGF0ZTogMjAyNi0wNy0yOQpDb21taXREYXRl
OiAyMDI2LTA3LTI5CgogICAgbmdodHRweDogUmVzZXQgcXVpYyB1cHN0cmVhbSBhZGRyIGZkIHRv
IHRoZSBjdXJyZW50IHBhdGgKCmNvbW1pdCBhMzk5YWI3MjBkMGExNDFkNGRkY2NjM2IwMjQwYWI2
MDJiZjU5Yzk1CkF1dGhvcjogICAgIFRhdHN1aGlybyBUc3VqaWthd2EgPHRhdHN1aGlyby50QGdt
YWlsLmNvbT4KQXV0aG9yRGF0ZTogMjAyNi0wNy0yOQpDb21taXQ6ICAgICBUYXRzdWhpcm8gVHN1
amlrYXdhIDx0YXRzdWhpcm8udEBnbWFpbC5jb20+CkNvbW1pdERhdGU6IDIwMjYtMDctMjkKY29t
bWl0IDUzNTg3YjVhNzAzNTU4NTcxZjMyZjE3ZGNlODU1NDlmODA1ZmQxNzEKQXV0aG9yRGF0ZTog
MjAyNi0wNy0yOQpDb21taXREYXRlOiAyMDI2LTA3LTI5CmNvbW1pdCAyM2YyNmJhN2Y0YmQ4NWMy
ODg5MDFkZDgyNTkwYWQ1YTA1ZGYxNmFiCkF1dGhvckRhdGU6IDIwMjYtMDctMjkKQ29tbWl0RGF0
ZTogMjAyNi0wNy0yOQpjb21taXQgMzFlMjA2ZmY5ZTFhOGQ1MWY0YjBjMTcxODY1OGZkNWNlODRj
NTY4NgpBdXRob3JEYXRlOiAyMDI2LTA3LTI5CkNvbW1pdERhdGU6IDIwMjYtMDctMjkKY29tbWl0
IDMzM2UzMmRkZWFhY2U2OGNlODFlM2QzOTNhODJhYzJhZTEzMTM1OWQKTWVyZ2U6IGRjYzc1NjZl
IDQ5NmMyZjNiCkF1dGhvckRhdGU6IDIwMjYtMDctMjgKQ29tbWl0RGF0ZTogMjAyNi0wNy0yOAog
ICAgTWVyZ2UgcHVsbCByZXF1ZXN0ICMyODIyIGZyb20gbmdodHRwMi9idW1wLWxsaHR0cAogICAg
QnVtcCBsbGh0dHAgdG8gdjkuNC4yCmNvbW1pdCA0OTZjMmYzYjhiMzQ3M2JhNWU1NzM3YWQ4YTQ4
NDk3MDI5OTc1MmM0CkF1dGhvckRhdGU6IDIwMjYtMDctMjgKQ29tbWl0RGF0ZTogMjAyNi0wNy0y
OAogICAgQnVtcCBsbGh0dHAgdG8gdjkuNC4yCmNvbW1pdCBkY2M3NTY2ZTQ5YzZiODljMGMyZThj
ZjY0MDIxZGJmNzNjNTQ4ODFlCk1lcmdlOiBlNTUxNzJkYSA1NTk5MjM1NApBdXRob3JEYXRlOiAy
MDI2LTA3LTI4CkNvbW1pdERhdGU6IDIwMjYtMDctMjgKICAgIE1lcmdlIHB1bGwgcmVxdWVzdCAj
MjgyMSBmcm9tIG5naHR0cDIvYnVtcC1uZXZlcmJsZWVkCiAgICBCdW1wIG5ldmVyYmxlZWQKY29t
bWl0IDU1OTkyMzU0MjJkZDA1ODVlNDAxZjUxYTJjZjg5YjY3NjA3YWViMzkKQXV0aG9yRGF0ZTog
MjAyNi0wNy0yOApDb21taXREYXRlOiAyMDI2LTA3LTI4CiAgICBCdW1wIG5ldmVyYmxlZWQKY29t
bWl0IGU1NTE3MmRhZjlhNDc1NmIxYWVhYzI2OTEyMjNjZjEzZDA2Y2M0NGMKTWVyZ2U6IDkxYWQ2
ZmRiIGE5NDYxZDBjCkF1dGhvckRhdGU6IDIwMjYtMDctMjgKQ29tbWl0RGF0ZTogMjAyNi0wNy0y
OAogICAgTWVyZ2UgcHVsbCByZXF1ZXN0ICMyODIwIGZyb20gbmdodHRwMi9idW1wLW5ndGNwMgog
ICAgQnVtcCBuZ3RjcDIgYW5kIGl0cyBkZXBlbmRlbmNpZXMKY29tbWl0IGE5NDYxZDBjNGIxZjg0
YWUxY2RjMTY4M2I1Y2ZlMjJjNWYxNzI3M2UKQXV0aG9yRGF0ZTogMjAyNi0wNy0yOApDb21taXRE
YXRlOiAyMDI2LTA3LTI4CiAgICBCdW1wIG5ndGNwMiBhbmQgaXRzIGRlcGVuZGVuY2llcwpjb21t
aXQgOTFhZDZmZGJiNDIwNjFmNmU0NWM5YjY3ZGE3YjE4MDQ5NThjNTg3NwpNZXJnZTogNzcyYjE5
ZWEgZTMzZGY2MzEKQXV0aG9yRGF0ZTogMjAyNi0wNy0yOApDb21taXREYXRlOiAyMDI2LTA3LTI4
CiAgICBNZXJnZSBwdWxsIHJlcXVlc3QgIzI4MTkgZnJvbSBuZ2h0dHAyL2RlcGVuZGFib3QvZ29f
bW9kdWxlcy9naXRodWIuY29tL3F1aWMtZ28vcXVpYy1nby0wLjYxLjAKICAgIGJ1aWxkKGRlcHMp
OiBidW1wIGdpdGh1Yi5jb20vcXVpYy1nby9xdWljLWdvIGZyb20gMC42MC4wIHRvIDAuNjEuMApj
b21taXQgZTMzZGY2MzEzYTBkMDU0MzFlNTJhNTE4NzMwN2NhZTM1NzYwMGQyNQpBdXRob3I6ICAg
ICBkZXBlbmRhYm90W2JvdF0gPDQ5Njk5MzMzK2RlcGVuZGFib3RbYm90XUB1c2Vycy5ub3JlcGx5
LmdpdGh1Yi5jb20+CkF1dGhvckRhdGU6IDIwMjYtMDctMjcKQ29tbWl0RGF0ZTogMjAyNi0wNy0y
NwogICAgYnVpbGQoZGVwcyk6IGJ1bXAgZ2l0aHViLmNvbS9xdWljLWdvL3F1aWMtZ28gZnJvbSAw
LjYwLjAgdG8gMC42MS4wCiAgICBCdW1wcyBbZ2l0aHViLmNvbS9xdWljLWdvL3F1aWMtZ29dKGh0
dHBzOi8vZ2l0aHViLmNvbS9xdWljLWdvL3F1aWMtZ28pIGZyb20gMC42MC4wIHRvIDAuNjEuMC4K
ICAgIC0gW1JlbGVhc2Ugbm90ZXNdKGh0dHBzOi8vZ2l0aHViLmNvbS9xdWljLWdvL3F1aWMtZ28v
cmVsZWFzZXMpCiAgICAtIFtDb21taXRzXShodHRwczovL2dpdGh1Yi5jb20vcXVpYy1nby9xdWlj
LWdvL2NvbXBhcmUvdjAuNjAuMC4uLnYwLjYxLjApCiAgICAtLS0KICAgIHVwZGF0ZWQtZGVwZW5k
ZW5jaWVzOgogICAgLSBkZXBlbmRlbmN5LW5hbWU6IGdpdGh1Yi5jb20vcXVpYy1nby9xdWljLWdv
CiAgICAgIGRlcGVuZGVuY3ktdmVyc2lvbjogMC42MS4wCiAgICAgIGRlcGVuZGVuY3ktdHlwZTog
ZGlyZWN0OnByb2R1Y3Rpb24KICAgICAgdXBkYXRlLXR5cGU6IHZlcnNpb24tdXBkYXRlOnNlbXZl
ci1taW5vcgoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNoYXJhY3Rl
cnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVudCB0byB0
aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9uZ2h0dHAyL3tuZ2h0dHAyXzEuNjkuMC5iYiA9PiBuZ2h0
dHAyXzEuNzAuMC5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0
cDIve25naHR0cDJfMS42OS4wLmJiID0+IG5naHR0cDJfMS43MC4wLmJifSAoODQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjY5LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS43MC4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRw
Ml8xLjY5LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRw
Ml8xLjcwLjAuYmIKaW5kZXggOGYzZTFlNGE5Ny4uMWIwOWY5MWNlNiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjkuMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS43MC4wLmJiCkBAIC02LDcgKzYsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03NjRhYmRmMzBiMmVhZGQzN2Nl
NDdkY2JjZTBlYTFlYyIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
diR7UFZ9L25naHR0cDItJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWZi
MzI0YjZlYzJjNTZmNmJkZTA2NThmNDEzOWZmZDgyMDlmYTllNzdjZTk4ZmQ3YTVmNjNhZjhkMGU1
MDhhZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMDVjYjEzODhlYWNhMzgzMGFkZWQ0Y2NmMjAw
NDRiNmUxYWMxYTYxNDExZGNjYTExYjA0MzdjNDI4NWM4YmMyIgogCiBpbmhlcml0IGNtYWtlIG1h
bnBhZ2VzIHB5dGhvbjNuYXRpdmUgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============1295821172422846890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="nghttp2-changelog.txt"

Changelog for nghttp2: 1.69.0 -> 1.70.0
Source: ChangeLog

commit 85e300c79fb6dbcfa9c1013215c8710c1c2cd3d2
Merge: a399ab72 dedad37d
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-07-29
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-07-29

    Merge pull request #2823 from nghttp2/nghttpx-reset-quic-upstream-addr-fd
    
    nghttpx: Reset quic upstream addr fd to the current path

commit dedad37defa9ab3c5ae818e526679c25623732e2
AuthorDate: 2026-07-29
CommitDate: 2026-07-29

    nghttpx: Reset quic upstream addr fd to the current path

commit a399ab720d0a141d4ddccc3b0240ab602bf59c95
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-07-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-07-29
commit 53587b5a703558571f32f17dce85549f805fd171
AuthorDate: 2026-07-29
CommitDate: 2026-07-29
commit 23f26ba7f4bd85c288901dd82590ad5a05df16ab
AuthorDate: 2026-07-29
CommitDate: 2026-07-29
commit 31e206ff9e1a8d51f4b0c1718658fd5ce84c5686
AuthorDate: 2026-07-29
CommitDate: 2026-07-29
commit 333e32ddeaace68ce81e3d393a82ac2ae131359d
Merge: dcc7566e 496c2f3b
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Merge pull request #2822 from nghttp2/bump-llhttp
    Bump llhttp to v9.4.2
commit 496c2f3b8b3473ba5e5737ad8a484970299752c4
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Bump llhttp to v9.4.2
commit dcc7566e49c6b89c0c2e8cf64021dbf73c54881e
Merge: e55172da 55992354
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Merge pull request #2821 from nghttp2/bump-neverbleed
    Bump neverbleed
commit 5599235422dd0585e401f51a2cf89b67607aeb39
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Bump neverbleed
commit e55172daf9a4756b1aeac2691223cf13d06cc44c
Merge: 91ad6fdb a9461d0c
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Merge pull request #2820 from nghttp2/bump-ngtcp2
    Bump ngtcp2 and its dependencies
commit a9461d0c4b1f84ae1cdc1683b5cfe22c5f17273e
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Bump ngtcp2 and its dependencies
commit 91ad6fdbb42061f6e45c9b67da7b1804958c5877
Merge: 772b19ea e33df631
AuthorDate: 2026-07-28
CommitDate: 2026-07-28
    Merge pull request #2819 from nghttp2/dependabot/go_modules/github.com/quic-go/quic-go-0.61.0
    build(deps): bump github.com/quic-go/quic-go from 0.60.0 to 0.61.0
commit e33df6313a0d05431e52a5187307cae357600d25
Author:     dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
AuthorDate: 2026-07-27
CommitDate: 2026-07-27
    build(deps): bump github.com/quic-go/quic-go from 0.60.0 to 0.61.0
    Bumps [github.com/quic-go/quic-go](https://github.com/quic-go/quic-go) from 0.60.0 to 0.61.0.
    - [Release notes](https://github.com/quic-go/quic-go/releases)
    - [Commits](https://github.com/quic-go/quic-go/compare/v0.60.0...v0.61.0)
    ---
    updated-dependencies:
    - dependency-name: github.com/quic-go/quic-go
      dependency-version: 0.61.0
      dependency-type: direct:production
      update-type: version-update:semver-minor
    ...
    
    Signed-off-by: dependabot[bot] <support@github.com>
commit 772b19eae183fd7db24c4abc80de2e3e7639b66a
Merge: d5ab3d92 02788f1e
AuthorDate: 2026-07-26
CommitDate: 2026-07-26
    Merge pull request #2818 from nghttp2/fix-continuations-count
    Count CONTINUATIONS per its frame header
commit 02788f1e121298411bb46936702fdeae18a9421a
AuthorDate: 2026-07-26
CommitDate: 2026-07-26
    Count CONTINUATIONS per its frame header
commit d5ab3d92da24b72ec97a707d6b32c5b3beaf2857
Merge: 91a2c9c1 adc8e812
AuthorDate: 2026-07-21
CommitDate: 2026-07-21
    Merge pull request #2815 from nghttp2/dependabot/github_actions/actions/setup-go-7
    build(deps): bump actions/setup-go from 6 to 7
commit adc8e812957d97e00dcf893b061bcbc837262996
AuthorDate: 2026-07-20
CommitDate: 2026-07-20
    build(deps): bump actions/setup-go from 6 to 7
    Bumps [actions/setup-go](https://github.com/actions/setup-go) from 6 to 7.
    - [Release notes](https://github.com/actions/setup-go/releases)
    - [Commits](https://github.com/actions/setup-go/compare/v6...v7)
    - dependency-name: actions/setup-go
      dependency-version: '7'
      update-type: version-update:semver-major
commit 91a2c9c1bbb19d4bcbd91d830a850e721fa6605b
Merge: 3d5fea6d 0df35edc
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-07-16
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-07-16

    Merge pull request #2814 from nghttp2/dependabot/go_modules/golang.org/x/net-0.57.0
    
    build(deps): bump golang.org/x/net from 0.56.0 to 0.57.0

commit 0df35edc48a57d609b230185756eb2b881f3d6cd
AuthorDate: 2026-07-13
CommitDate: 2026-07-13
    build(deps): bump golang.org/x/net from 0.56.0 to 0.57.0
    Bumps [golang.org/x/net](https://github.com/golang/net) from 0.56.0 to 0.57.0.
    - [Commits](https://github.com/golang/net/compare/v0.56.0...v0.57.0)
    - dependency-name: golang.org/x/net
      dependency-version: 0.57.0
      update-type: version-update:semver-minor
commit 3d5fea6d88ee8634e25bc62fdfa61b09b4b1794a
Merge: a25ec3de 692768a6
AuthorDate: 2026-07-11
CommitDate: 2026-07-11
    Merge pull request #2813 from nghttp2/add-missing-header-value-check-for-priority
    Add the missing header value check for priority header field
commit 692768a66389ec0ea780dcc85466f0f7be9be477
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-07-11
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-07-11
    Add the missing header value check for priority header field
commit a25ec3de429d038f08f334cd3dc3b637f05fe7bf
Merge: 1b3f1e9d 4ed7e465
AuthorDate: 2026-07-05
CommitDate: 2026-07-05
    Merge pull request #2810 from nghttp2/require-nghttp3-1.17.0
    Require nghttp3 >= 1.17.0
commit 4ed7e465632c94468844b5fc388dd470353dea27
AuthorDate: 2026-07-04
CommitDate: 2026-07-04
    Require nghttp3 >= 1.17.0
commit 1b3f1e9de182417a90cf4358d95f79be148ad3b4
Merge: 1c3b5371 3851e463
AuthorDate: 2026-07-02
CommitDate: 2026-07-02
    Merge pull request #2808 from nghttp2/nghttpx-remove-unused-unordered-set-include
    nghttpx: Remove unused unordered_set include
commit 3851e463bfe6af835046eddf35da3a3e6c2bd3fe
AuthorDate: 2026-07-01
CommitDate: 2026-07-01
    nghttpx: Remove unused unordered_set include
commit 1c3b53716eb0e733f01b0aa13042cd87ec443287
Merge: 91c4cc94 aac6eb3f
AuthorDate: 2026-06-30
CommitDate: 2026-06-30
    Merge pull request #2807 from nghttp2/nghttpx-rename-completecb
    nghttpx: Rename completeCb_ to complete_cb_
commit aac6eb3f24b9e1f758b73e008c4b7bd60162fea4
AuthorDate: 2026-06-30
CommitDate: 2026-06-30
    nghttpx: Rename completeCb_ to complete_cb_
commit 91c4cc940846ae9b70ab228e87429a53a64953c0
Merge: 4f9e64b3 8955d1da
AuthorDate: 2026-06-30
CommitDate: 2026-06-30
    Merge pull request #2806 from nghttp2/nghttpx-fix-error-code
    nghttpx: NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE is not allowed in on_frame_recv_callback
commit 8955d1da47232ca19d2c4912d6f3d8c56eab97e9
AuthorDate: 2026-06-30
CommitDate: 2026-06-30
    nghttpx: NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE is not allowed in on_frame_recv_callback
commit 4f9e64b329a6e2e65359ce0025f7ca2375be34f3
Merge: 15691b8d 06a4a520
AuthorDate: 2026-06-30
CommitDate: 2026-06-30
    Merge pull request #2805 from nghttp2/gcc-16
    Gcc 16
commit 06a4a5202d1cfd15f4d55da61efe414741291040
AuthorDate: 2026-06-30
CommitDate: 2026-06-30
    src tests: Fix build error with gcc-16
commit 28d1290e347e4e8f24edd3e61e16918c37002bb6
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-06-30
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-06-30
    h2load: Fix build error with gcc-16
commit 775e7a77ca7ff2a2fdbc1175b42d71a51fa10804
AuthorDate: 2026-06-30
CommitDate: 2026-06-30
    nghttpx: Fix build error with gcc-16
commit 07dc1b55079680a0462fa0f51edd619605f18470
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-06-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-06-30
    nghttpd: Fix build error with gcc-16
commit 18e9765320edd4913a39786cbdc0a529087de3d4
AuthorDate: 2026-06-28
CommitDate: 2026-06-30
    nghttp: Fix build error with gcc-16
commit 15691b8d7cfe2dadc3e320b9af1371831f5b8cab
Merge: d376fbe5 93d5e029
AuthorDate: 2026-06-30
CommitDate: 2026-06-30
    Merge pull request #2804 from nghttp2/dependabot/github_actions/actions/cache-6
    build(deps): bump actions/cache from 5 to 6
commit 93d5e0298dd0196d0ce503eaab1602f68a121ae2
Author:     dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
AuthorDate: 2026-06-29
CommitDate: 2026-06-29
    build(deps): bump actions/cache from 5 to 6
    Bumps [actions/cache](https://github.com/actions/cache) from 5 to 6.
    - [Release notes](https://github.com/actions/cache/releases)
    - [Changelog](https://github.com/actions/cache/blob/main/RELEASES.md)
    - [Commits](https://github.com/actions/cache/compare/v5...v6)
    
    ---
    updated-dependencies:
    - dependency-name: actions/cache
      dependency-version: '6'
      dependency-type: direct:production
      update-type: version-update:semver-major
    ...
    
    Signed-off-by: dependabot[bot] <support@github.com>
commit d376fbe547247cb0da9c20a74a05210821ff1ab8
Merge: 82dc8f9a 121c73d7
AuthorDate: 2026-06-28
CommitDate: 2026-06-28
    Merge pull request #2803 from nghttp2/nghttpx-upstream-write-rate-h3
    nghttpx: Drop h3 connection when frontend write rate is too low
commit 121c73d7b10cbc029325991740d62ccd18b4790b
AuthorDate: 2026-06-07
CommitDate: 2026-06-28
    nghttpx: Drop h3 connection when frontend write rate is too low
commit 82dc8f9a4ec90c49ca11db00224ae5976dabdb1b
Merge: c39e41c8 f590c50a
AuthorDate: 2026-06-28
CommitDate: 2026-06-28
    Merge pull request #2802 from nghttp2/bump-ngtcp2
    Bump ngtcp2 and its dependencies
commit f590c50a6f5c1e16c705b87d02c2dbfe09c8f0e3
AuthorDate: 2026-06-28
CommitDate: 2026-06-28
    Bump ngtcp2 and its dependencies
commit c39e41c86bbf9d58f95473c815ea6bae2cfb70f2
Merge: c3c47b7e 1e863e78
AuthorDate: 2026-06-25
CommitDate: 2026-06-25
    Merge pull request #2800 from nghttp2/dependabot/github_actions/actions/checkout-7
    build(deps): bump actions/checkout from 6 to 7
commit 1e863e78836999f6a9c586178526348c57569dae
Author:     dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
AuthorDate: 2026-06-22
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-06-22
    build(deps): bump actions/checkout from 6 to 7
    
    Bumps [actions/checkout](https://github.com/actions/checkout) from 6 to 7.
    - [Release notes](https://github.com/actions/checkout/releases)
    - [Changelog](https://github.com/actions/checkout/blob/main/CHANGELOG.md)
    - [Commits](https://github.com/actions/checkout/compare/v6...v7)
    
    ---
    updated-dependencies:
    - dependency-name: actions/checkout
      dependency-version: '7'
      dependency-type: direct:production
      update-type: version-update:semver-major
    ...
    
    Signed-off-by: dependabot[bot] <support@github.com>
commit c3c47b7ee1861cc201a90c4a8d5b4ecfde8129dc
Merge: 2382a414 65871b62
AuthorDate: 2026-06-20
CommitDate: 2026-06-20
    Merge pull request #2799 from nghttp2/dependabot/go_modules/golang.org/x/net-0.56.0
    build(deps): bump golang.org/x/net from 0.55.0 to 0.56.0
commit 65871b62828404ed8045f8e5d6c1dafc6b6f6e6a
Author:     dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
AuthorDate: 2026-06-15
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-06-15
    build(deps): bump golang.org/x/net from 0.55.0 to 0.56.0
    
    Bumps [golang.org/x/net](https://github.com/golang/net) from 0.55.0 to 0.56.0.
    - [Commits](https://github.com/golang/net/compare/v0.55.0...v0.56.0)
    
    ---
    updated-dependencies:
    - dependency-name: golang.org/x/net
      dependency-version: 0.56.0
      dependency-type: direct:production
      update-type: version-update:semver-minor
    ...
    
    Signed-off-by: dependabot[bot] <support@github.com>
commit 2382a41456ad6ede884a35044df6e082bf72ef1d
Merge: 0a674d71 11af1e9d
AuthorDate: 2026-06-14
CommitDate: 2026-06-14
    Merge pull request #2797 from nghttp2/nghttpx-upstream-write-rate
    nghttpx: Drop connection when frontend write rate is too low
commit 11af1e9df57657d29c970ff2e9236f6332cff3fc
AuthorDate: 2026-06-09
CommitDate: 2026-06-14
    nghttpx: Drop connection when frontend write rate is too low
    
    HTTP/3 support will be added in the upcoming PR because it requires
    new API that is not available in the released nghttp3 versions.
commit 0a674d71f40c0b554583ad3915986cf2f18e664c
Merge: e96863e3 e3615b7e
AuthorDate: 2026-06-13
CommitDate: 2026-06-13
    Merge pull request #2796 from nghttp2/nghttpx-reformat-help
    nghttpx: Reformat help message to make it editor friendly
commit e3615b7e93b7e2e8c5c0af9023a053921ae2a533
AuthorDate: 2026-06-13
CommitDate: 2026-06-13
    nghttpx: Reformat help message to make it editor friendly
commit e96863e378440d559671d9daab13cc844ae23521
Merge: f6b2e49d e59b8047
AuthorDate: 2026-06-09
CommitDate: 2026-06-09
    Merge pull request #2792 from nghttp2/dependabot/go_modules/github.com/quic-go/quic-go-0.60.0
    build(deps): bump github.com/quic-go/quic-go from 0.59.1 to 0.60.0
commit f6b2e49de2f0192b4b215e339b5806fc0554890e
Merge: 09b897c4 a65a09de
AuthorDate: 2026-06-09
CommitDate: 2026-06-09
    Merge pull request #2794 from nghttp2/nghttpx-frontend-and-backend-stream-timeouts
    nghttpx: Provide frontend and backend stream timeouts
commit a65a09dec6ecb9220be1c0b7b03ffe0e9bb03587
AuthorDate: 2026-06-08
CommitDate: 2026-06-08
    nghttpx: Provide frontend and backend stream timeouts
    
    Deprecate stream-read-timeout and stream-write-timeout options.  Add
    the following options to configure these timeouts for frontend and
    backend separately:
    
    - frontend-stream-read-timeout
    - frontend-stream-write-timeout
    - backend-stream-read-timeout
    - backend-stream-write-timeout
    
    For backward compatibility, stream-read-timeout sets both
    frontend-stream-read-timeout and backend-stream-read-timeout.
    Likewise, stream-write-timeout sets both frontend-stream-write-timeout
    and backend-stream-write-timeout.
commit e59b8047bd39d096c70a7002f1c52fc5de4692ad
Author:     dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
AuthorDate: 2026-06-08
CommitDate: 2026-06-08
    build(deps): bump github.com/quic-go/quic-go from 0.59.1 to 0.60.0
    Bumps [github.com/quic-go/quic-go](https://github.com/quic-go/quic-go) from 0.59.1 to 0.60.0.
    - [Release notes](https://github.com/quic-go/quic-go/releases)
    - [Commits](https://github.com/quic-go/quic-go/compare/v0.59.1...v0.60.0)
    
    ---
    updated-dependencies:
    - dependency-name: github.com/quic-go/quic-go
      dependency-version: 0.60.0
      dependency-type: direct:production
      update-type: version-update:semver-minor
    ...
    
    Signed-off-by: dependabot[bot] <support@github.com>
commit 09b897c402e8bcb3e1d0159c39dcc14538e428d1
Merge: 411d8985 f482aa81
AuthorDate: 2026-06-07
CommitDate: 2026-06-07
    Merge pull request #2791 from nghttp2/reformat-huffman-data
    Reformat huffman data table
commit f482aa81f9460b84b8f990ed8f2e0dc858312f62
AuthorDate: 2026-06-07
CommitDate: 2026-06-07
    Reformat huffman data table
commit 411d8985892ae78d80f4844d3998f0ab02ae847e
Merge: 6d2625cb 11471474
AuthorDate: 2026-06-07
CommitDate: 2026-06-07
    Merge pull request #2790 from nghttp2/upcase-hex-literals
    bpf, examples, tests: Upper case hex integer literals
commit 11471474eef9963208d0a5239df18ea2553fa6ee
AuthorDate: 2026-06-07
CommitDate: 2026-06-07
    bpf, examples, tests: Upper case hex integer literals
commit 6d2625cbb468214c822156165a0c8241e81aab9a
Merge: 86dff0f3 85845b3f
AuthorDate: 2026-06-07
CommitDate: 2026-06-07
    Merge pull request #2789 from nghttp2/nghttpx-h2-stream-write-timeout
    Nghttpx h2 stream write timeout
commit 85845b3ff0ccfca00b6a4ad678fbc2b73d9f9e1f
AuthorDate: 2026-06-07
CommitDate: 2026-06-07
    nghttpx: No need to enable stream write timer because h2 headers are not flow controlled
commit 7d644b8289665953a003e29d449866d8c8906925
AuthorDate: 2026-06-07
CommitDate: 2026-06-07
    nghttpx: Enable downstream write timer when there are buffered data
commit 2e0d550bbdfafd84b64328c2bbbc3c0836b4efa6
AuthorDate: 2026-06-07
CommitDate: 2026-06-07
    nghttpx: Disable h2 upstream write timer only when no data are left
commit 86dff0f307453f9992294d245ac8074f5fe5dbd1
Merge: 5187b351 41004d29
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    Merge pull request #2788 from nghttp2/upcase-hex
    Upcase hex

commit 41004d2920def1c2c80e83b049d4da4dc565835c
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-06-06
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-06-06

    src: Upper case hex integer literals
commit cbaf4a730258d53696ba30c821337aa9e3cea71b
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    nghttpx: Construct ESCAPE_TBL with constexpr function
commit 3a4d39a27d8df534d54a488f414e8859e51a87a1
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    lib: Upper case hex integer literals
commit 5187b35100a5897afab076f8b3cb967e5481b1ad
Merge: 503f8c2f 20717a0e
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    Merge pull request #2787 from nghttp2/hd-huffman-upcase
    Upper case hex integer literals in huffman data table
commit 20717a0e2ee0142af6b5b1cbaa1ad29f74d83516
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    Upper case hex integer literals in huffman data table
commit 503f8c2f275389c5574b581bad10d325a2840de8
Merge: 9ffafc46 570ff0af
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    Merge pull request #2786 from nghttp2/http-designated-init-array
    http: Initialize array with designated initializers
commit 570ff0afbdfb1e8b31699f76f24d974856aa51a4
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-06-06
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-06-06
    http: Initialize array with designated initializers
commit 9ffafc46efb4103a548c7629bdd1b59f7f747550
Merge: 1006d918 36b23347
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    Merge pull request #2785 from nghttp2/reformat-downcase-tbl
    Reformat downcase table
commit 36b2334777b8cde3d008f625f024d68414847cf5
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    Reformat downcase table
commit 1006d918a97581c6daefd5e55e3f941d87932353
Merge: ddba7214 70726b35
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    Merge pull request #2784 from nghttp2/helper-designated-init-array
    helper: Initialize array with designated initializers
commit 70726b356546850fdeab236a213215443c9b18f1
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    helper: Initialize array with designated initializers
commit ddba721451e1aa5295305cc470f3de8484f6f48c
Merge: e92eb478 03048e14
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    Merge pull request #2783 from nghttp2/bump-sfparse
    Bump sfparse
commit 03048e14e45b9aca01b7af6284573b0f60bf8483
AuthorDate: 2026-06-06
CommitDate: 2026-06-06
    Bump sfparse
commit e92eb4786aa06e425f069763e2ff9291ecb0327e
Merge: 736ab7cb fdb85ec7
AuthorDate: 2026-06-04
CommitDate: 2026-06-04
    Merge pull request #2782 from nghttp2/rework-http-header-validation
    Rework HTTP header validation
commit fdb85ec7e0ab5d5e1b23171a1d6f103acc4a335d
AuthorDate: 2026-06-04
CommitDate: 2026-06-04
    Rework HTTP header validation
    
    Simplify HTTP header validation by merging multiple switch-case into
    one.
commit 736ab7cba92132970d3a4165b235ac413cf0780c
Merge: bb66f83f 24c8ebea
AuthorDate: 2026-06-04
CommitDate: 2026-06-04
    Merge pull request #2781 from nghttp2/downcase
    lib: Add nghttp2_downcase_byte
commit 24c8ebea511f9e4f1e20f91d06004b252fecb8c8
AuthorDate: 2026-06-04
CommitDate: 2026-06-04
    lib: Add nghttp2_downcase_byte
commit bb66f83f52282415088a318191dc60f6dad10e5b
Merge: 2b7c134f 6979dab1
AuthorDate: 2026-06-03
CommitDate: 2026-06-03
    Merge pull request #2780 from nghttp2/win32-bswap-macros
    net: Use macros for win32 hton*/ntoh* fallbacks
commit 6979dab1d0e2966989b0b3f997de341e53486f07
AuthorDate: 2026-06-03
CommitDate: 2026-06-03
    net: Use macros for win32 hton*/ntoh* fallbacks
commit 2b7c134f67bc2cab4457833edfd3287f60a771ae
Merge: f1241088 3be3ddc6
AuthorDate: 2026-06-03
CommitDate: 2026-06-03
    Merge pull request #2779 from nghttp2/avoid-deprecated-ngtcp2-and-nghttp3-apis
    Avoid deprecated ngtcp2 and nghttp3 apis
commit 3be3ddc6c5a2ffd1996cb76d4862852840d564b5
AuthorDate: 2026-06-03
CommitDate: 2026-06-03
    Require ngtcp2 >= v1.23.0 and avoid the deprecated API usage
commit a8a3c1f3fb6505ee616d0e19f41e6c2a0488b5c4
AuthorDate: 2026-06-03
CommitDate: 2026-06-03
    Require nghttp3 >= v1.16.0 and avoid the deprecated API usage
commit f1241088cdbe011e11843c490fbff6d7c208ef6b
Merge: 47f83cf9 12589380
AuthorDate: 2026-06-03
CommitDate: 2026-06-03
    Merge pull request #2778 from nghttp2/bump-ngtcp2
    Bump ngtcp2 and its dependencies
commit 12589380a5aa6f067678ecc7e3f7a886e78fd4fd
AuthorDate: 2026-06-02
CommitDate: 2026-06-02
    Bump ngtcp2 and its dependencies
commit 47f83cf989ae83d45a4ee0bfc8d56434e4ee2aa2
Merge: 00720169 a1e4a0b7
AuthorDate: 2026-06-02
CommitDate: 2026-06-02
    Merge pull request #2777 from nghttp2/rewrite-http-integer-parsing
    lib: Rewrite integer decoder in http
commit a1e4a0b71036215404c1dde3b3dfd71465e4269a
AuthorDate: 2026-05-30
CommitDate: 2026-05-30
    lib: Rewrite integer decoder in http
    
    This effectively tightens up HTTP status code validation by allowing 3
    digits only.  Make nghttp2_stream.status_code of type int32_t because
    int16_t does not give us any advantage.
commit 0072016972da81efba03360efed4588938387dab
Merge: 6c231ecf 4f41a2ea
AuthorDate: 2026-05-27
CommitDate: 2026-05-27
    Merge pull request #2776 from nghttp2/fix-docker-build
    Fix docker build
commit 4f41a2ea7888386b203a995d07f5cb5679c75384
AuthorDate: 2026-05-27
CommitDate: 2026-05-27
    Fix docker build
commit 6c231ecfc653852064f248408f51dd4f71d6d6b6
Merge: 2d11d9b5 41bc5143
AuthorDate: 2026-05-27
CommitDate: 2026-05-27
    Merge pull request #2775 from nghttp2/gha-cygwin
    GHA: Add Cygwin build
commit 41bc514324e503279cd0f52ba3ce1331aaebb7f3
AuthorDate: 2026-05-27
CommitDate: 2026-05-27
    GHA: Add Cygwin build
commit 2d11d9b578c7f0ae712c8f88ac1d3a61c088cf24
Merge: 8edad4ec 150427a1
AuthorDate: 2026-05-26
CommitDate: 2026-05-26
    Merge pull request #2774 from nghttp2/dependabot/go_modules/golang.org/x/net-0.55.0
    build(deps): bump golang.org/x/net from 0.54.0 to 0.55.0
commit 150427a1f6a5031f22964dab83571f57f6f6db38
AuthorDate: 2026-05-25
CommitDate: 2026-05-25
    build(deps): bump golang.org/x/net from 0.54.0 to 0.55.0
    Bumps [golang.org/x/net](https://github.com/golang/net) from 0.54.0 to 0.55.0.
    - [Commits](https://github.com/golang/net/compare/v0.54.0...v0.55.0)
      dependency-version: 0.55.0
commit 8edad4ec4a708f9ff003c16033d0d0d64fd3573c
Merge: e32c2068 35f1d362
AuthorDate: 2026-05-25
CommitDate: 2026-05-25
    Merge pull request #2773 from kmehltretter82/macos-println-cxx23
    src: Avoid zero-argument std::println
commit 35f1d362ef4175c5c96f5ef9a55191a8fd89331a
Author:     Karl Mehltretter <kmehltretter@gmail.com>
AuthorDate: 2026-05-25
Commit:     Karl Mehltretter <kmehltretter@gmail.com>
CommitDate: 2026-05-25
    src: Avoid zero-argument std::println
    
    The zero-argument overload of std::println is C++26.  Use an empty
    format string so these line-separator prints remain valid with C++23
    standard library implementations.
    
    This fixes a build failure with Apple clang 16.0.0
    (clang-1600.0.26.6) and the macOS 14.5 SDK, whose libc++ provides
    std::println(format, args...) but not std::println().
    
    Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
commit e32c2068b11c874710e389db046ebd6a567ac6d2
Merge: 51472478 005bbd0b
AuthorDate: 2026-05-24
CommitDate: 2026-05-24
    Merge pull request #2772 from nghttp2/macro-unsigned
    Make NGHTTP2_EXTPRI_INC_MASK unsigned
commit 005bbd0bbd56bef6c27700807a1d37ecc24f588e
AuthorDate: 2026-05-23
CommitDate: 2026-05-24
    Make NGHTTP2_EXTPRI_INC_MASK unsigned
commit 5147247878ea216859b8b29ade5cd6c0a06e2aed
Merge: cf971871 0b25c403
AuthorDate: 2026-05-24
CommitDate: 2026-05-24
    Merge pull request #2771 from nghttp2/define-flags-as-macros
    Define flags as macros
commit 0b25c40343b73aacb10f43731328343791901ac0
AuthorDate: 2026-05-24
CommitDate: 2026-05-24
    Make NGHTTP2_OPT_* flags macros
commit ef05c47d6e59b7136f855494feac0552156accb3
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-24
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-24
    Make NGHTTP2_HUFF_* flags macros
commit e07d71ffcd6749e4a4e1f651b776d7c102d51eb1
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-24
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-24
    Make NGHTTP2_TYPEMASK_* flags macros
commit 6bc7b3605075752f6adde7f6a6ae0ae8ea82f60d
AuthorDate: 2026-05-24
CommitDate: 2026-05-24
    Make NGHTTP2_OPTMASK_* flags macros
commit f018cd91e8f2a6dc47b53ee51792ec73a0dcc22b
AuthorDate: 2026-05-24
CommitDate: 2026-05-24
    Make NGHTTP2_GOAWAY_* flags macros
commit 71a740180ef08afb112799705f2cdb80df71769e
AuthorDate: 2026-05-24
CommitDate: 2026-05-24
    Make NGHTTP2_STREAM_FLAG_* flags macros
commit 21fba72f781b20465590f7e660a4aa8a0018a171
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-24
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-24
    Make NGHTTP2_SHUT_* flags macros
commit cf9718713fadc87907eca445f7009ca15d3ca80f
Merge: f5788781 49dee0d0
AuthorDate: 2026-05-24
CommitDate: 2026-05-24
    Merge pull request #2770 from nghttp2/http-flag-unsigned
    Make NGHTTP2_HTTP_FLAG_* macros and make them unsigned
commit 49dee0d0673d97aba59720145c35d7e409f55a0f
AuthorDate: 2026-05-23
CommitDate: 2026-05-23
    Make NGHTTP2_HTTP_FLAG_* macros and make them unsigned
commit f57887819b5311c0fdc7613b13dc85968f06bc07
Merge: 656e2cb3 6f47019d
AuthorDate: 2026-05-22
CommitDate: 2026-05-22
    Merge pull request #2769 from nghttp2/nghttpx-upgrade
    Nghttpx upgrade

commit 6f47019d78b1e2b84a5f9d0c3f09fdbe23e23c63
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-22
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-22
    integration-tests: Add more tests

commit ab28105c4a0197da24f8bfc414bc116055249e1e
AuthorDate: 2026-05-22
CommitDate: 2026-05-22
    nghttpx: Tighten up CONNECT and HTTP Upgrade handling
commit 656e2cb3222208e5500f235209ff70700b0bbde3
Merge: 494a2918 70d93a32
AuthorDate: 2026-05-22
CommitDate: 2026-05-22
    Merge pull request #2768 from nghttp2/fix-base64-oob
    Fix base64 oob
commit 70d93a32416e4129c3671ef472c86248d8cb9d8b
AuthorDate: 2026-05-20
CommitDate: 2026-05-22
    src/base64: Add tests with negative chars
commit 0262342d3a32748913d4c03814842c71466c6e89
AuthorDate: 2026-05-20
CommitDate: 2026-05-22
    src/base64: Fix out-of-bound read on negative char
commit 494a291854c1a23ec42bc29bfdb452d96f380c9b
Merge: d9a08050 38e08e25
AuthorDate: 2026-05-20
CommitDate: 2026-05-20
    Merge pull request #2767 from nghttp2/cmake-unusable-require-cxx-23
    cmake: Remove CMAKE_CXX_STANDARD 23 that is not needed there
commit 38e08e25cfab497e3577641d8d797a90f6c4260c
AuthorDate: 2026-05-15
CommitDate: 2026-05-20
    cmake: Remove CMAKE_CXX_STANDARD 23 that is not needed there
commit d9a08050c4b9a38ee55da02d4b2ff2a33500568b
Merge: fdeeb229 a91a2369
AuthorDate: 2026-05-20
CommitDate: 2026-05-20
    Merge pull request #2766 from nghttp2/fix-macos-build
    src: Fix build failure on macos26
commit a91a23693200f73b10b85b057a2a0d0c15876247
AuthorDate: 2026-05-20
CommitDate: 2026-05-20
    src: Fix build failure on macos26
commit fdeeb2291792276442d45e075f3000356e59a82c
Merge: c9420bb8 05b028e6
AuthorDate: 2026-05-13
CommitDate: 2026-05-13
    Merge pull request #2765 from nghttp2/src-allocator-fold
    src/allocator: Rewrite concat_string_ref with fold expression

commit 05b028e6d14f739d10383d8545c85da60d1e7f59
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-12
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-13
    src/allocator: Rewrite concat_string_ref with fold expression

commit c9420bb897f65a43ab3c138dd755c031ee34e5dc
Merge: 7cd8ee74 5d3c693d
AuthorDate: 2026-05-13
CommitDate: 2026-05-13
    Merge pull request #2764 from nghttp2/src-nsdmi-part3
    src: MSDMI part3
commit 5d3c693d9cea03df341b195368e8aab0825c7f48
AuthorDate: 2026-05-12
CommitDate: 2026-05-12
    src: MSDMI part3
commit 7cd8ee744d29404ac5922584f174aa10383fccbf
Merge: 441ef04c dd3fe024
AuthorDate: 2026-05-12
CommitDate: 2026-05-12
    Merge pull request #2763 from nghttp2/avoid-azure-mirror
    Avoid azure ubuntu mirror
commit dd3fe024f2dd201bb5e0dc350bc750c9a8fef1d8
AuthorDate: 2026-05-12
CommitDate: 2026-05-12
    Avoid azure ubuntu mirror
commit 441ef04ce15f4393dbc8a132b00a83adabc20075
Merge: 469a7330 f1aefd09
AuthorDate: 2026-05-12
CommitDate: 2026-05-12
    Merge pull request #2762 from nghttp2/src-nsdmi-part2
    src: MSDMI part2
commit f1aefd097b1f35406502deca4acb98cf0066a022
AuthorDate: 2026-05-12
CommitDate: 2026-05-12
    src: MSDMI part2
commit 469a733027b796e1cbd9e3019e2727cc4188f07d
Merge: 078984f0 bf48ff5c
AuthorDate: 2026-05-12
CommitDate: 2026-05-12
    Merge pull request #2761 from nghttp2/dependabot/go_modules/golang.org/x/net-0.54.0
    build(deps): bump golang.org/x/net from 0.53.0 to 0.54.0
commit bf48ff5c682b332fcc3abea77505be620cfcd6d0
AuthorDate: 2026-05-12
CommitDate: 2026-05-12
    build(deps): bump golang.org/x/net from 0.53.0 to 0.54.0
    Bumps [golang.org/x/net](https://github.com/golang/net) from 0.53.0 to 0.54.0.
    - [Commits](https://github.com/golang/net/compare/v0.53.0...v0.54.0)
    - dependency-name: golang.org/x/net
      dependency-version: 0.54.0
      update-type: version-update:semver-minor
commit 078984f0e22936b2e1d2d2263e22c3ac23eb2805
Merge: 6ab34de6 bc6aa3fe
AuthorDate: 2026-05-12
CommitDate: 2026-05-12
    Merge pull request #2760 from nghttp2/dependabot/go_modules/github.com/quic-go/quic-go-0.59.1
    build(deps): bump github.com/quic-go/quic-go from 0.59.0 to 0.59.1
commit bc6aa3feb62ce370209f8a851b75d80ddfee2282
Author:     dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
AuthorDate: 2026-05-11
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-05-11

    build(deps): bump github.com/quic-go/quic-go from 0.59.0 to 0.59.1
    
    Bumps [github.com/quic-go/quic-go](https://github.com/quic-go/quic-go) from 0.59.0 to 0.59.1.
    - [Release notes](https://github.com/quic-go/quic-go/releases)
    - [Commits](https://github.com/quic-go/quic-go/compare/v0.59.0...v0.59.1)
    
    ---
    updated-dependencies:
    - dependency-name: github.com/quic-go/quic-go
      dependency-version: 0.59.1
      dependency-type: direct:production
      update-type: version-update:semver-patch
    ...
    
    Signed-off-by: dependabot[bot] <support@github.com>

commit 6ab34de67bc8c05ad4680c2d4653c5290df3c91e
Merge: e0527776 9aae3a86
AuthorDate: 2026-05-12
CommitDate: 2026-05-12
    Merge pull request #2759 from nghttp2/src-move-ctor-noexcept
    src: Add noexcept to move ctor and assignment operator
commit 9aae3a8603de09027107c3a8b901cafb7a9a1356
AuthorDate: 2026-05-11
CommitDate: 2026-05-11
    src: Add noexcept to move ctor and assignment operator
commit e05277760f3823fdb2c5bc4f3efc23d7f34b4978
Merge: 22ce3efb cc891c81
AuthorDate: 2026-05-11
CommitDate: 2026-05-11
    Merge pull request #2758 from nghttp2/src-nsdmi-part1
    src: NSDMI part1
commit cc891c815c2598d76c66ea28634a5dc2f6538d1f
AuthorDate: 2026-05-11
CommitDate: 2026-05-11
    src: NSDMI part1
commit 22ce3efb82dc6f5da7a7d605b45434a195f4ae17
Merge: 3b681a45 7e5a9340
AuthorDate: 2026-05-10
CommitDate: 2026-05-10
    Merge pull request #2757 from nghttp2/src-make-ws-accept-token-expect
    src: Adopt std::expected for http2::make_websocket_accept_token
commit 7e5a93404c641d7f8b6c941797b551c7fde10ca9
AuthorDate: 2026-05-10
CommitDate: 2026-05-10
    src: Adopt std::expected for http2::make_websocket_accept_token
commit 3b681a4555bfdabc4ff5faa9e614de9ea50a48b3
Merge: f9a13d75 68181229
AuthorDate: 2026-05-10
CommitDate: 2026-05-10
    Merge pull request #2756 from nghttp2/src-sha
    src: Provide faster hash functions for OpenSSL forks
commit 681812294e28591e6e61b3171f689dd52451aa8e
AuthorDate: 2026-05-10
CommitDate: 2026-05-10
    src: Provide faster hash functions for OpenSSL forks
commit f9a13d75b3e1e698955e0e6e2b19707d9a24ac3c
Merge: 12aee374 e8d0fea6
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-05-10
CommitDate: 2026-05-10
    Merge pull request #2755 from nghttp2/src-optimize
    Src optimize

commit e8d0fea6badad7e57dbb83ad7f54f07e18d9becc
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-09
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-10

    nghttpx: Slight optimizations for QUIC keying material construction

commit b7c17df89c8e18173218447696b76a727e334f0f
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-09
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-10

    src: Remove unused QUIC related errors

commit 12aee374614c8d2369c17b45ee36c26bf1937029
Merge: c4146ff5 c05f33f9
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-05-10
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-05-10

    Merge pull request #2754 from nghttp2/nghttpx-qkm-unique-ptr
    nghttpx: Use std::unique_ptr for quic_keying_materials_

commit c05f33f9fa5e594f43552537dac355201014445d
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-09
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-09

    nghttpx: Use std::unique_ptr for quic_keying_materials_
    Use std::unique_ptr for quic_keying_materials_ because we do not copy
    it around.
commit c4146ff59b91a41f998f5343c760adf81050c980
Merge: 7ec98982 eb8219d9
AuthorDate: 2026-05-09
CommitDate: 2026-05-09
    Merge pull request #2753 from nghttp2/nghttpx-create-cipher-ctx-per-worker
    nghttpx: Create CID encryption ctx per worker
commit eb8219d9b78c35956d5a6412c3a16a460ec2a296
AuthorDate: 2026-05-09
CommitDate: 2026-05-09
    nghttpx: Create CID encryption ctx per worker
commit 7ec98982f61d37aad5ea85d86c9b53b0053b168a
Merge: 67e0527e 55776fd9
AuthorDate: 2026-05-09
CommitDate: 2026-05-09
    Merge pull request #2752 from nghttp2/empty-println
    src: Use std::println without argument to print just line separator
commit 55776fd9fd49ef562372bee2d8d810b420a2f6c8
AuthorDate: 2026-05-08
CommitDate: 2026-05-08
    src: Use std::println without argument to print just line separator
commit 67e0527e50f4c173071e447d3060d64d848b97ee
Merge: d36983f5 952e22e4
AuthorDate: 2026-05-08
CommitDate: 2026-05-08
    Merge pull request #2751 from nghttp2/src-avoid-fprintf
    src: Migrate fprintf to C++ counterparts
commit 952e22e4cc0c46509dd33f58c552525f55eb1dd9
AuthorDate: 2026-05-08
CommitDate: 2026-05-08
    src: Migrate fprintf to C++ counterparts
commit d36983f59be69b7666439628277cd2bdef7e64b8
Merge: a157b7ed 23920c4b
AuthorDate: 2026-05-08
CommitDate: 2026-05-08
    Merge pull request #2750 from nghttp2/src-simplify-as-string-view-usage
    src: Simplify as_string_view usage
commit 23920c4b6e965c104e81f97306e32b580f9158ef
AuthorDate: 2026-05-08
CommitDate: 2026-05-08
    src: Simplify as_string_view usage
commit a157b7ed7d9a177c45bd38d7de4bc10b5f46059d
Merge: c06ac6a0 b3d27657
AuthorDate: 2026-05-08
CommitDate: 2026-05-08
    Merge pull request #2749 from nghttp2/src-migrate-print
    src: Migrate std::cout to std::print
commit b3d276572371cf2b4ed1ac160295c769969f6be2
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-08
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-08

    src: Migrate std::cout to std::print

commit c06ac6a0d2fd713f566f5c48e1ecf3a3ed3d899c
Merge: 114581b3 75f52223
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-05-06
CommitDate: 2026-05-06
    Merge pull request #2748 from nghttp2/nghttpd-print
    Nghttpd print
commit 75f52223c4012b4b50e4245b7b51098f6cb5ebf5
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-06
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-06

    nghttpd: Migrate std::cout to std::print

commit 75a0341898c8f3f453c9d8784c93ca746da6add9
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-06
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-06

    nghttpd: Migrate std::cerr to std::print

commit 114581b3466b6eb0b6edd1ccee092cded1063cc1
Merge: 710eb1ed 491be47e
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-05-06
CommitDate: 2026-05-06
    Merge pull request #2747 from nghttp2/nghttp-print
    Nghttp print

commit 491be47eba11a47dee706ddf00cfe3ed760f51e2
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-06
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-06

    nghttp: Migrate std::cout to std::print

commit 305b053fd5c1cf87801ffdf82dddd35da1cce55c
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-06
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-06

    nghttp: Migrate std::cerr to std::print

commit 710eb1ed70fd976dc2741546eaffc1a14b8f9726
Merge: 68004f0d c200922f
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-05-06
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-05-06

    Merge pull request #2746 from nghttp2/nghttpx-print
    nghttpx: Migrate to std::print

commit c200922f676bf6faac84c1104a0cbde03fd3aa1e
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-06
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-06

    nghttpx: Migrate to std::print

commit 68004f0d9cdd7777ff8fbe93ef365f107fc3aa3e
Merge: f15f7992 99174ebf
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-05-06
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-05-06

    Merge pull request #2745 from nghttp2/h2load-cout-print
    h2load: Replace std::cout with std::print

commit 99174ebfb2429f1b07796a7623f074b7989680b6
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-06
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-06

    h2load: Replace std::cout with std::print
commit f15f799275bfe057f7b71f7400fed79b037a3c5d
Merge: 4007c4f7 b972d438
AuthorDate: 2026-05-06
CommitDate: 2026-05-06
    Merge pull request #2744 from nghttp2/h2load-cerr-print
    h2load: Replace std::cerr with std::print

commit b972d438bc557351f4268daea9bea694a4bd15ae
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-05
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-06

    h2load: Replace std::cerr with std::print

commit 4007c4f7518474fe1d55c58b0f12aac567b8849a
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-03
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-03

    clang-format
commit 2f18f4dc4d42779ca53aef346affb0bf750e5517
Merge: 4dff4647 89505dde
AuthorDate: 2026-05-03
CommitDate: 2026-05-03
    Merge pull request #2741 from zhanhb/partition-header
    
    nghttp: put pseudo headers before normal headers
commit 4dff4647f73831b412c7e1b05bf7ba71216198ea
Merge: 285af898 9bdb3193
AuthorDate: 2026-05-03
CommitDate: 2026-05-03
    Merge pull request #2742 from nghttp2/size_t-literals
    src: Adopt size_t literal suffix
commit 9bdb31932bf7f5dec517a35d94ea615d8ed2869d
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-03
    src: Adopt size_t literal suffix
commit 285af898287ca90571fca14f99fba5ecf707ed0f
Merge: 69e23db7 f71189f5
AuthorDate: 2026-05-03
CommitDate: 2026-05-03
    Merge pull request #2740 from nghttp2/htmlparser-expected
    HtmlParser: Adopt std::expected

commit 89505ddeee00489e5ce81958dc73bfe794e17f92
Author:     Huangbin Zhan <zhanhb88@gmail.com>
AuthorDate: 2026-05-03
Commit:     Huangbin Zhan <zhanhb88@gmail.com>
CommitDate: 2026-05-03

    nghttp: put pseudo headers before normal headers
commit f71189f508766d9ce25836427ba46af0f8f0870b
AuthorDate: 2026-05-01
CommitDate: 2026-05-03
    HtmlParser: Adopt std::expected
commit 69e23db7d05f8493e37da1193e020202a277d48e
Merge: 29b2bcfe 17ca1e30
AuthorDate: 2026-05-03
CommitDate: 2026-05-03
    Merge pull request #2739 from nghttp2/nghttpd-expected
    nghttpd: Adopt std::expected
commit 17ca1e30b4bd03e0e867973bc33e246b5620e76c
AuthorDate: 2026-05-01
CommitDate: 2026-05-03
    nghttpd: Adopt std::expected
commit 29b2bcfe33c7ace426b1cbb38c91d087b54de926
Merge: b51b6078 cb86a5a3
AuthorDate: 2026-05-03
CommitDate: 2026-05-03
    Merge pull request #2738 from nghttp2/nghttp-expected
    nghttp: Adopt std::expected
commit cb86a5a3d52ca35cd551b01406633abf8ec4efde
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-03

    nghttp: Adopt std::expected

commit b51b60787b9303c221ebde934426f22698431806
Merge: 9e8011a2 85ece96c
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-05-03
CommitDate: 2026-05-03
    Merge pull request #2737 from nghttp2/h2load-expected
    H2load expected

commit 85ece96c69cbfa6b2cd5b7304212dd3a8e60cdd0
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Adopt std::expected for Http3Session

commit eb5d4432bcb36d5671fb3335f953ef6732bee4c0
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Adopt std::expected for Client QUIC functions

commit 3e423ac7ed31aa408ef919870f362d98458c6102
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Client::send_blocked_packet never fail

commit 2b28caba1b087712041746b94ab96f415e902751
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Adopt std::expected for Client::quic_init

commit bed8fec81c7cac82b39657de1b6e3bb433831629
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Adopt std::expected for Client read/write functions

commit 9911d2f556a08db721b6ffd8ecb03b9daecf62a2
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Adopt std::expected for Client::terminate_session

commit 7e0ab878ab30ec5af58ea47706ead22175c4120e
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Adopt std::expected for Client::submit_request

commit 0e96f467415b9d4118cb3eae23fb9601358ae819
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Adopt std::expected for Client::try_again_or_fail

commit 85b767c50c97b1d2bf77b7474fea7384d69f174d
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Adopt std::expected for Client::connect

commit 440039a4d0affc48e5ce0bbe152742b4ee67bccc
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Adopt std::expected for Client::make_socket

commit d33b6d8715a2aada78073307b900a5a2bff9756a
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    h2load: Adopt std::expected for Session read/write functions

commit 2d24d2cac2d349993f92ecf83a37064bf14751b3
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01
    h2load: Adopt std::expected for Session::submit_request

commit 9e8011a27a872e81f2a4347ef82d09d978006851
Merge: a1bea974 e7b588f0
AuthorDate: 2026-05-01
CommitDate: 2026-05-01
    Merge pull request #2736 from nghttp2/nghttpx-main-expected
    nghttpx: Adopt std::expected for main routines

commit e7b588f0721cdeeeba86e48135115026e87fca9d
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    nghttpx: Fix file descriptor leak

commit 0ce0ec717a0da71ccc73d1198140be6538bac909
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    nghttpx: Return error when pid cannot be extracted from env

commit c1112397cdfb4c86a8a4fdfeea5feb8f10ca269c
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01
    nghttpx: Adopt std::expected for main routines

commit a1bea9744f1f083b0206365aef3487fe2557e75a
Merge: d6487a03 5be2b7b5
AuthorDate: 2026-05-01
CommitDate: 2026-05-01

    Merge pull request #2735 from nghttp2/src-fixup
    
    Src fixup

commit 5be2b7b529e0045c0324ceffcfd12ca2b551f46e
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    src: Pass time_point by value

commit 63d8ae08e8949cc803c31e5d51aeb4649a8cad1e
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    nghttpx: Propagate error

commit 0126b69daab25e29281994c2fb2508e6dc71207d
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    src/util: Simplify

commit 08c85c09fc2afd26bc729e41577b694617a52e19
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    src: Provide Address(const sockaddr *) constructor

commit 02d5cab33e8c1e8a446b0e8ff29e6b535af12848
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-05-01
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01
    nghttpx: Optimize affinity hash generation
commit d6487a0375d2eca763eefd9452f32c3777a9dd5b
Merge: 6a7d08ca b62eedc1
AuthorDate: 2026-05-01
CommitDate: 2026-05-01
    Merge pull request #2734 from nghttp2/nghttpx-config-expected
    Nghttpx config expected
commit b62eedc13deacbc8b2ce5a45eeb7a0486b08acec
AuthorDate: 2026-04-30
CommitDate: 2026-05-01
    nghttpx: Adopt std::expected for resolve_hostname

commit c305317ae46f80327480f44e7e2a4f5d220d78d1
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-30
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    nghttpx: Adopt std::expected for configure_downstream_group

commit 1f55dfbe49a94fce67c81c9c6670837714e756e7
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-30
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-05-01

    nghttpx: Adopt std::expected for open_file_for_write
commit 6a7d08cab82baef9d0f16b0192d7f75d8c3794b5
Merge: a47b24ae 9bb37c4c
AuthorDate: 2026-05-01
CommitDate: 2026-05-01
    Merge pull request #2733 from nghttp2/nghttpx-parse-config-expected
    nghttpx: Adopt std::expected for parse_config

commit 9bb37c4c896a2a218816b101e196cdc3cd9d0703
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-30
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-30

    nghttpx: Adopt std::expected for parse_config
commit a47b24ae18b7f5a4e2af1976d8c57725017b8a04
Merge: afa2dd42 46e2f28f
AuthorDate: 2026-04-30
CommitDate: 2026-04-30
    Merge pull request #2732 from nghttp2/nghttpx-worker-process-expected
    nghttpx: Adopt std::expected for worker_process_event_loop

commit 46e2f28fe7ed887bd0faa716eb1c666552139668
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-30

    nghttpx: Adopt std::expected for worker_process_event_loop
commit afa2dd42727984768947f3a33202a655336443d1
Merge: 6d9e61b5 7acde7d0
AuthorDate: 2026-04-30
CommitDate: 2026-04-30
    Merge pull request #2731 from nghttp2/nghttpx-workerevent
    nghttpx: Pass WorkerEvent without explicit std::move
commit 7acde7d0068bc21f81a6ad13133c29646992409e
AuthorDate: 2026-04-29
CommitDate: 2026-04-30
    nghttpx: Pass WorkerEvent without explicit std::move
commit 6d9e61b51e24ca7719d76a01a508b7e092c05c3c
Merge: 8793d282 b99914f4
AuthorDate: 2026-04-30
CommitDate: 2026-04-30
    Merge pull request #2730 from nghttp2/nghttpx-connhandler-expected
    Nghttpx connhandler expected
commit b99914f4ae888c5647abc13ce0c466fa0ede2230
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-30

    nghttpx: Adopt std::expected for ConnectionHandler::quic_ipc_read

commit ece6c450ced43cbe6e6320b39812f011c9e24383
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-30

    nghttpx: Adopt std::expected for ConnectionHandler::forward_quic_packet_to_lingering_worker_process

commit 7ad4954395ca1cabcc9b41c7676ef29e3f10f724
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-30

    nghttpx: Adopt std::expected for ConnectionHandler::match_quic_lingering_worker_process_worker_id

commit 9fc5757b97db7c8518da2d6756ea677fc979f110
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-30

    nghttpx: Adopt std::expected for ConnectionHandler::forward_quic_packet

commit 97c7d6f982470a1ddc5a91041ec59e535281d06b
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-30

    nghttpx: Adopt std::expected for ConnectionHandler::create_worker_thread

commit dbd95fa9b416c58e8c6de8f8bdb4190789dd95e1
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-30

    nghttpx: Adopt std::expected for ConnectionHandler::create_single_worker

commit 2c5fa32d91e855c96f56bf225f08ab6dba554ae8
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-30

    nghttpx: Adopt std::expected for ConnectionHandler::find_worker

commit 8793d282499f25449e8875f26d5b91d51209338c
Merge: 06bfb1bc 9d53f764
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-29
CommitDate: 2026-04-29
    Merge pull request #2729 from nghttp2/nghttpx-worker-expected
    Nghttpx worker expected

commit 9d53f764f888c38e11e5c9e4d46bad81de77d1ae
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for Worker::find_quic_upstream_addr

commit 23d80a65f99e2217a7c11e7121633af960432145
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for Worker::handle_connection

commit c14c7a8d095647ddd8984c13bf6c958627554d17
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for Worker::setup_quic_server_socket

commit c855b4c06f70cbaa44b5f512cc6a7dddb1bdc668
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for Worker::setup_server_socket

commit f01627ca12e5d01d118e148dafe2f926864afd17
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for Worker::create_mruby_context

commit 06bfb1bc4dde7d64cfa6fb151fe43429845fe5e7
Merge: 298ef87f 5d6c3008
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-29
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-29

    Merge pull request #2728 from nghttp2/nghttpx-misc-expected
    
    Nghttpx misc expected

commit 5d6c3008dda92b76444918ec224eee3d16953a4b
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for AcceptHandler

commit 4a3c273af3b72b90cd028dd763ab4aaa1214cc18
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for Router

commit bdf08d572a4f7212f3d8d3af5e2680ef93e6e0fb
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for signal functions

commit 319d28b4968720d3b2164a4578e97748445bbfe0
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for logger

commit 298ef87f2985bc66cf7f99605879732c869b759b
Merge: 6f634548 90cd9737
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-29
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-29

    Merge pull request #2727 from nghttp2/nghttpx-memcached-expected
    
    Nghttpx memcached expected

commit 90cd97374afa54949ad03f0a7bae77d19c04da97
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for MemcachedDispatcher::add_request

commit 8105221bab57aa7ea05716897a3aafbe015914f8
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for MemcachedConnection::parse_packet

commit 08ba0a6573c595ad7cde384c6775b4e346b778c9
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for MemcachedConnection::connected

commit fed5257a0a2a4b340ca290804e58203fbe6a1c7f
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for MemcachedConnection::initiate_connection

commit 3d2342b7948a440f3f7e0be8bc8f10f1089579b3
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for MemcachedConnection::add_request

commit 6f634548498c7b7d3ea194b17c798a407aaf51a8
Merge: 33cd60eb c0a84794
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-29
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-29

    Merge pull request #2726 from nghttp2/nghttpx-dns-expected
    
    Nghttpx dns expected

commit c0a84794135b9518b6537fff3126bdfef2a587ac
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for DualDNSResolver::resolve

commit 4e84c8c0341ff4b68e0914b3daccc9bfee180353
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for DNSResolver read/write functions

commit 8a873c91c814b94784fb22c25f8d4eba98fb59a3
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for DNSResolver::resolve

commit 33cd60eb4b617bfc8d2400d0c659cfc7d0d4229a
Merge: bc05fb48 96df3c0e
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-29
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-29

    Merge pull request #2725 from nghttp2/nghttpx-livecheck-expected
    
    Nghttpx livecheck expected

commit 96df3c0ea3b9739fc9744e0a526b9688b6051dd7
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for LiveCheck::connection_made

commit 206eb30b651ca3727880b1077f096e8bc8ae7468
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for LiveCheck read/write functions

commit a9b7de272d8c85dabc67060b2835a2e6d5325cd9
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-29
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Adopt std::expected for LiveCheck::initiate_connection

commit bc05fb484912e37cbcda4ceba40eb4ee0cf56553
Merge: 1f848125 def27523
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-29
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-29

    Merge pull request #2724 from nghttp2/nghttpx-rewrite-time-from-asn1-time
    
    nghttpx: Rewrite time_t_from_asn1_time with ASN1_TIME_diff for boringssl

commit def27523ab601c82ab8252f2cd2873919e4d154a
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-29

    nghttpx: Rewrite time_t_from_asn1_time with ASN1_TIME_diff for boringssl
    
    Meanwhile, aws-lc implements ASN1_TIME_to_tm.

commit 1f8481251cb28848b45d950de6cad6a1311eedf5
Merge: 801d4021 f81c2342
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-28
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-28

    Merge pull request #2723 from nghttp2/nghttpx-tls-expected
    
    Nghttpx tls expected

commit f81c23428b7b40feec8914129b895ceb2efb58a1
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for get_servername

commit ed9df9fcbb0f0b5e67005c780edf2545d036884c
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for tls::get_x509_not_before and get_x509_not_after

commit 486710eb52b7bd0d0ce5c105c8f52dd961235780
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for tls::get_x509_fingerprint

commit d962bf33ad963af383f30499c0d5248efecbaf77
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for tls::proto_version_from_string

commit 321cdbddbf4881a124f06a09e3779d4f163c82f1
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Remove unused tls::load_certificate

commit c01ad134d6030e5fa0fb576292d7abb1d73c3c61
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for tls::reuse_tls_session

commit fb467ad31e87ca1b813bfd85dd4fba22cf935c73
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for tls::set_alpn_prefs

commit f6ecd4d9ba47f892bbed3bc730c791b0f8e5d68c
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: tls::cert_lookup_tree_add_ssl_ctx never fail

commit aa05907977ab42d4b63ef44cb1af929269f9395b
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for tls::CertLookupTree

commit c9270e58f3dd0f706d414d086ae8e185790f81fc
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for get_common_name

commit ca3d823ba62484418db70f5fc96b679dc25d897a
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for tls::check_cert

commit b7983d841651d6a49bd45c2fdee60f37bd5b7839
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for tls::accept_connection

commit f7fd0077cde5cde6cf92f4b4aa9b598dfd5f8fc8
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for tls::create_ssl

commit 801d40211e75fe753c20492af0b0e2506b87b70e
Merge: 620188b7 0cad430f
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-28
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-28

    Merge pull request #2722 from nghttp2/nghttpx-quicconnhandler-expected
    
    nghttpx: Adopt std::expected for QUICConnectionHandler

commit 0cad430f2d96207e3a14a40c39013c8cc008e8d1
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for QUICConnectionHandler

commit 620188b7c958fd2e13957d5a12c071a4866ed542
Merge: fb43c170 471a9561
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-28
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-28

    Merge pull request #2721 from nghttp2/nghttpx-quic-expected
    
    Nghttpx quic expected

commit 471a9561dd3f91d1c9f555dbab1981542b5b7b27
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for generate_quic_connection_id_encryption_key

commit b01cc03a4a6158afc3cd8ce82fb21f79b53e2000
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Switch to newer QUIC token generators

commit 2c584a1a6131b41fce824dc7f89e76e25f45acf9
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Adopt std::expected for QUIC utility functions

commit 92881b37ba00c41aa27a4225cd5beb8707177e06
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-28
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-28

    nghttpx: Simplify QUIC packet sender

commit fb43c1707f7c6072dc3ed98273c858c04ca86ccd
Merge: 7af89ab7 18e75033
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-28
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-28

    Merge pull request #2720 from nghttp2/nghttpx-mruby-expected
    
    Nghttpx mruby expected

commit 18e750337c122490f5afe1196095b6a42e0b4299
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for mruby hook

commit 4ded6b50985958c7eac643ca997558fcea2c1af8
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for mruby context generation

commit 7af89ab7671615b7214ff092e38657b1abc2f5ab
Merge: 8994c752 6340628f
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-27
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-27

    Merge pull request #2719 from nghttp2/nghttpx-http3upstream-expected
    
    Nghttpx http3upstream expected

commit 6340628fd9946b6703fd474a5b794b2523b0573c
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream::open_qlog_file

commit 01cc19e2cf9e10321b7bc3224dda6dca7e8ca524
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream::shutdown_stream

commit 50fd43e5fa17cba252ac478795d805353582b5c6
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream nghttp3 callbacks

commit 422da43ff0ea3ef08d7ac4fd2b167c25546c02a4
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream ngtcp2 callbacks

commit 30952a0f04c3ddd820fe31c1ec61151b04bf9135
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream::send_new_token

commit 0c8950de1e5ffafb0ee34f01320d1cdb523b8a95
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream::submit_goaway

commit 72c42407409b5b5724d87af1809e6d06040fa426
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream::start_graceful_shutdown

commit 4ae81dc9444d5b09befcc9acc40f772db2df7889
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream::error_reply

commit 24ba5cc8bf294b56a87e2149b5bda44988a16ce8
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream::setup_httpconn

commit 1f60172a4b7f986b00b936416bbdb8df47a03699
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream::init

commit 63e7894fda67a9ea86aeec8345be81c2c934bfd6
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http3Upstream::on_read

commit 8994c752a13e624df0969926c0c3be3a9f4268d1
Merge: cc1c2279 9b35e592
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-27
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-27

    Merge pull request #2718 from nghttp2/nghttpx-http2upstream-expected
    
    Nghttpx http2upstream expected

commit 9b35e592c883d81be28aded8f6453743ea6a0e38
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http2Upstream::on_request_headers

commit 2f99b1681c10dd7b81859b17cf73939235b993e7
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http2Upstream::prepare_push_promise

commit a7615114ea82217d19a8c6665852c0541c571fd6
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http2Upstream::upgrade_upstream

commit c905f821d19818dcae72e059284fdb1e550fb8a6
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http2Upstream::error_reply and redirect_to_https

commit 51e3a5ca958754f77684dc0fa731838f269db916
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http2Upstream::terminate_session

commit a95d38371d546ed64914f29e0d0ca087adb4960b
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for Http2Upstream::rst_stream

commit cc1c22799932cb7c1abcedf591c4d9ba7e614e8c
Merge: 005a50d1 cd534b76
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-27
Commit:     GitHub <noreply@github.com>
CommitDate: 2026-04-27

    Merge pull request #2717 from nghttp2/nghttpx-expected
    
    Nghttpx expected

commit cd534b7691b4f9f286d21564248a5baba17e00f9
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for HttpsUpstream::redirect_to_https

commit 34cce2b8b7fc315d737dbe724464c0e39a86fae0
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Adopt std::expected for APIDownstreamConnection::send_reply

commit eaf2410a0f4bf5cece2358e449ed4dd62da75a2b
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27

    nghttpx: Remove unused Http2DownstreamConnection::send
commit 005a50d149e93aed48ece15a4ed5f2164ddce6a6
Merge: e560a4a3 52df56c6
AuthorDate: 2026-04-27
CommitDate: 2026-04-27
    Merge pull request #2716 from nghttp2/nghttpx-httpdownstreamconnection-expected
    Nghttpx httpdownstreamconnection expected
commit 52df56c6727d7b22d67bede202447e0893f29a3c
AuthorDate: 2026-04-27
CommitDate: 2026-04-27
    nghttpx: Use Error::HTTP1 for llhttp related error in HttpDownstreamConnection
commit 37fa4d160fba69ce26a989410b4750a3eb3605ea
AuthorDate: 2026-04-27
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for HttpDownstreamConnection max fields
commit 6afffd18ad1e683e823e67ea3f1cf66aacc6528d
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27
    nghttpx: HttpDownstreamConnection::process_blocked_request_buf never fail
commit 2ba45a966420348cc565120f68cf6264fd371be8
AuthorDate: 2026-04-27
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for HttpDownstreamConnection::connected
commit e560a4a38b352f5f9b5ad5519be6728eb69d0cc7
Merge: d74749e3 e2716d7a
AuthorDate: 2026-04-27
CommitDate: 2026-04-27
    Merge pull request #2715 from nghttp2/nghttpx-clienthandler-expected
    Nghttpx clienthandler expected
commit e2716d7a2d676aa23637b53d9d6a3a2dd79f52a8
AuthorDate: 2026-04-27
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for ClientHandler::perform_http2_upgrade
commit f96b23bd311f9a64d3e473fc1c89e4461b46b28b
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for ClientHandler::validate_next_proto
commit 8b9906cbb486be7023a53ec712378d45ce11e6d6
AuthorDate: 2026-04-27
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for ClientHandler read/write functions
commit d74749e3d7d4db355e3a66b27a696d977f21aa85
Merge: 2a30faa0 a57907bb
AuthorDate: 2026-04-27
CommitDate: 2026-04-27
    Merge pull request #2714 from nghttp2/nghttpx-upstream-expected
    Nghttpx upstream expected
commit a57907bbd241686e811826665b1492e866709f59
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for Upstream::on_downstream_push_promise_complete
commit c9864e38738075442d4a0a0df19f9b3380d49bb9
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for Upstream::initiate_push
commit c74dd1d5ea56fbec801754089b3e344b5dab9e0f
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for Upstream::send_reply
commit 567a1e3faf25cebd67a690cdfa31a00ca620254f
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for Upstream::resume_read
commit 86cfa1fe8162711a83e382a007614cfa455722b0
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for Upstream::on_downstream_reset
commit 20028f7e82253067d1db19934f1ba57b2e7fb1ee
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for Upstream::on_downstream_body_complete
commit 9b1b7452df1f0ea13392aff74d1b9824a92203a4
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for Upstream::on_downstream_header_complete
commit ee2fd12b7d1e6cbc0cabb2ec96bd48a8177b31fc
AuthorDate: 2026-04-27
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for Upstream::on_downstream_abort_*
commit 0b3dab11459720d24af77a89399fce654fb57f44
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-27
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for Upstream::on_timeout
commit 50c0845310a5c406aa6b188a4a9f27ae2b703540
AuthorDate: 2026-04-27
CommitDate: 2026-04-27
    nghttpx: Adopt std::expected for Upstream read/write functions
commit 2a30faa0be35748211c78e6b6133f532e44c47d1
Merge: f752c453 5e2cf69a
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    Merge pull request #2713 from nghttp2/nghttpx-http2session-expected
    Nghttpx http2session expected
commit 5e2cf69ad59d26f99dcfdb0552a88770413da73d
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for Http2Session::handle_downstream_push_promise
commit 0ca134596b9e52fd6c36c443fd3b906c1da83e8c
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-26
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for Http2Session read/write functions
commit 4312582d022d2c45090f45d684205392da11da03
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for Http2Session::connection_made
commit 709ffafb0a03641a3c633e89b91a1efff6d152a3
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-26
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for Http2Session::terminate_session

commit 4381b854f202f27650a2a92cc7ef73a0c4f5b1bd
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-26
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for Http2Session::resolve_name

commit 18accf8061c82fa769ce094e4f74cc8398a70493
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for Http2Session::initiate_connection
commit f752c4535aa1fb7eb42f604c077a24c45834c321
Merge: dcafadc4 b1f1868c
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    Merge pull request #2712 from nghttp2/nghttpx-downstream-expected
    Nghttpx downstream expected
commit b1f1868c1b89c27257b29961850a6145bb5df0a8
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for FieldStore::parse_content_length
commit 39ffd9d41d0fae334f7dcc6949a73aa366ec93be
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-26
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for Downstream::attach_downstream_connection
commit dcafadc431b2381875eeca64929247fe9d3c0796
Merge: 562245a7 d51e8d20
Author:     Tatsuhiro Tsujikawa <404610+tatsuhiro-t@users.noreply.github.com>
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    Merge pull request #2711 from nghttp2/nghttpx-dconn-expected
    Nghttpx dconn expected
commit d51e8d202d89961686d7e2344bcf97883f977652
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-26
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for DownstreamConnection::resume_read
commit 387bff54bf11f8999fd66257a0defad5390569c0
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for DownstreamConnection::end_upload_data
commit 21216472fbeba9a4c92bd5ea400f56be42ce9037
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-26
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for DownstreamConnection::push_upload_data_chunk
commit 3e8afece8cd702323b17a0468960ec2518873e39
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-26
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for DownstreamConnection::push_request_headers
commit d201ba184a45211cdfccaf31717ff207d0a5b64c
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-26
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for DownstreamConnection::on_timeout
commit 5505e1fb0803e416d6041359c63ad05a92336e5e
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-26
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for DownstreamConnection::attach_downstream
commit 562245a74b61a65fcee58b6ff8ed5737ba1094ac
Merge: fca7843c 1b10d9a3
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    Merge pull request #2710 from nghttp2/nghttpx-connection-rw-expected
    nghttpx: Adopt std::expected for Connection read/write
commit 1b10d9a30ff028359edea54796d83c09811f8916
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    nghttpx: Adopt std::expected for Connection read/write
commit fca7843c469802ee1a2e612aa39d4f9fe7dc5a7c
Merge: 03d5b605 df427d28
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    Merge pull request #2709 from nghttp2/src-tls-expected
    src/tls: Adopt std::expected
commit df427d2805f3e41785dda85a7e1303b20737baa1
AuthorDate: 2026-04-25
CommitDate: 2026-04-26
    src/tls: Adopt std::expected
commit 03d5b605d4eec94682e88ee10dfcf98a52eee702
Merge: 7d8e587a 6924b34a
AuthorDate: 2026-04-26
CommitDate: 2026-04-26
    Merge pull request #2708 from nghttp2/src-http2-expected
    src/http2: Adopt std::expected
commit 6924b34a5bb9e1373f788d866ad64f95ad4cd6ba
AuthorDate: 2026-04-25
CommitDate: 2026-04-25
    src/http2: Adopt std::expected
commit 7d8e587ad4e8da4b772725bd345d48ec0d42b2ec
Merge: a48ebab5 747f0b76
AuthorDate: 2026-04-25
CommitDate: 2026-04-25
    Merge pull request #2707 from nghttp2/src-modernize-header
    src: Modernize Header and HeaderRef
commit 747f0b7681fddf5cc3cbf4b9a0159d840b0515ac
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-25
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-25
    src: Modernize Header and HeaderRef
commit a48ebab59dd0114e529ae9d6185bee711113c7e7
Merge: 05c41b8f 0b1ef943
AuthorDate: 2026-04-25
CommitDate: 2026-04-25
    Merge pull request #2705 from nghttp2/get-rid-of-sstream
    src: Get rid of std::stringstream
commit 0b1ef943d32358e3c98e0c98e4ed9de7bc3e14ad
AuthorDate: 2026-04-25
CommitDate: 2026-04-25
    src: Get rid of std::stringstream
commit 05c41b8f18e3386c7ee004edf83cd03ad34e783e
Merge: 457bb183 ea97829e
AuthorDate: 2026-04-25
CommitDate: 2026-04-25
    Merge pull request #2704 from nghttp2/src-stream-error
    src: Use util::stream_error
commit ea97829e43c7f01e00fe91b548622d5ab07a9025
AuthorDate: 2026-04-25
CommitDate: 2026-04-25
    src: Use util::stream_error
commit 457bb183e7554430ad1400d7ce4a6ead8c123eae
Merge: 8a2b3133 1bc4f4f7
AuthorDate: 2026-04-25
CommitDate: 2026-04-25
    Merge pull request #2703 from nghttp2/get_sock_error-errno
    get_socket_error: Return errno of getsockopt if it fails

commit 1bc4f4f756f1496f5e2c42b25fc9afc2caf069c3
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-24
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-25
    get_socket_error: Return errno of getsockopt if it fails

commit 8a2b313331648e2103ef2d80c0164d652c084d8e
Merge: ce15f166 4d0d9f19
AuthorDate: 2026-04-24
CommitDate: 2026-04-24
    Merge pull request #2702 from nghttp2/src-util-expected
    src/util: Adopt std::expected for error handling
commit 4d0d9f19787360ba2b9e41f9e5b5f19edf43a2b4
AuthorDate: 2026-04-24
CommitDate: 2026-04-24
    src/util: Adopt std::expected for error handling
commit ce15f16694633830a0285407a3a0808f4cdd7f29
Merge: a42bf854 3504732d
AuthorDate: 2026-04-24
CommitDate: 2026-04-24
    Merge pull request #2701 from nghttp2/src-replace-optional-with-expected
    src: Replace std::optional with std::expected
commit 3504732d1a5087bf61ee28743021a4c56e766c25
AuthorDate: 2026-04-23
CommitDate: 2026-04-24
    src: Replace std::optional with std::expected
commit a42bf854531cf463e6a2aaa45a605e5e3c8dd6e3
Merge: c365c0c0 d24fb238
AuthorDate: 2026-04-24
CommitDate: 2026-04-24
    Merge pull request #2700 from nghttp2/src-udl-noexcept
    src: Add noexcept to user-defined literals
commit d24fb238a1c08fc36f0eedee65f0dedc5865ca36
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-23
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-24
    src: Add [[nodiscard]] and noexcept to user-defined literals
commit c365c0c079da20ac6ec6ab34ba847722a41ac619
Merge: 05581a01 5aa8fa6f
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    Merge pull request #2699 from nghttp2/src-avoid-hi-res-clock
    src: Avoid std::chrono::high_resolution_clock
commit 5aa8fa6f2eb9a606b74a7766103729ad69ef6b1e
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    src: Avoid std::chrono::high_resolution_clock
    
    std::chrono::high_resolution_clock is not guaranteed to be steady,
    that makes it not suitable for our use.
commit 05581a01fea5ccb57f3e2b381a1f110ad086d422
Merge: f01d4068 4fcf4ac8
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    Merge pull request #2698 from nghttp2/c-style-comments
    lib, tests: Use C-style comment
commit 4fcf4ac82d0236c590fe90950fc11226dd173660
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    lib, tests: Use C-style comment
commit f01d4068aa5b7080682138188021f0e7316cfbf9
Merge: fdaa52f8 acf5022a
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    Merge pull request #2697 from nghttp2/src-fix-cxx23-warnings
    src: Fix warning "space between quotes and suffix is deprecated in C++23"
commit acf5022aa54002e8e700e4d5ef129fa5118bfade
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    src: Fix warning "space between quotes and suffix is deprecated in C++23"
commit fdaa52f85df32d9985f78fd94ce3117c74f25281
Merge: cd7fb0d2 7a2efed3
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    Merge pull request #2696 from nghttp2/bump-mruby
    Bump mruby to 4.0.0
commit 7a2efed3b42bcbba9aa1e27353e0c47e3bc7247f
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    Bump mruby to 4.0.0
commit cd7fb0d20aff27cc157cdc0203e3904827b23cef
Merge: b2ea204a adcbc1dc
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    Merge pull request #2695 from nghttp2/src-chrono-pass-by-value
    src: Pass std::chrono::{time_point,duration} by value
commit adcbc1dcc65fec987b7390af4ea2f05229b1cff7
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    src: Pass std::chrono::{time_point,duration} by value
commit b2ea204ac853e1179428e1f4ff7e7eb124c05bb9
Merge: bd4b3d20 19f22c39
AuthorDate: 2026-04-23
CommitDate: 2026-04-23
    Merge pull request #2694 from nghttp2/src-adopt-string-resize_and_overwrite
    src: Adopt std::string::resize_and_overwrite
commit 19f22c39ac26422227b3c02cb763e0a8a3484bbf
AuthorDate: 2026-04-22
CommitDate: 2026-04-22
    src: Adopt std::string::resize_and_overwrite
commit bd4b3d206397b163c92e69a4dc2a4f36d1704e7c
Merge: a699e736 ee37e156
AuthorDate: 2026-04-22
CommitDate: 2026-04-22
    Merge pull request #2693 from nghttp2/src-rewrite-util-split_str
    src: Rewrite util::split_str and its variants
commit ee37e1562ed55c640b0ee0a023f00fe20098345c
AuthorDate: 2026-04-22
CommitDate: 2026-04-22
    cmake: Require C++23
commit a1d41c1c848131542ffd06a334c65649c6e400a3
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-22
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-22
    src: Rewrite util::split_str and its variants
    Now these functions return an empty string if an empty string is
    given.  This breaking change is handled on the call sites.
commit a699e73618c2aa117e6a437bda9e40c7de76223e
Merge: 1d0c2605 ad5ce144
AuthorDate: 2026-04-22
CommitDate: 2026-04-22
    Merge pull request #2692 from nghttp2/tests-const
    tests: Make const values static const
commit ad5ce1448d9adc281c1d4123abe820783fbeb572
AuthorDate: 2026-04-22
CommitDate: 2026-04-22
    tests: Make const values static const
commit 1d0c2605e87d1b95df8e81088cfaf63d9c71ce59
Merge: 177d77a3 734d41fe
AuthorDate: 2026-04-22
CommitDate: 2026-04-22
    Merge pull request #2691 from nghttp2/designated-initializers-part3
    Adopt Designated initializers part3
commit 734d41fe31491367f33dc0997034fea2e1d62741
AuthorDate: 2026-04-21
CommitDate: 2026-04-22
    Adopt Designated initializers part3
commit 177d77a3a88113f1554448b2b40f08d6893110ab
Merge: c0f05e86 2d969082
AuthorDate: 2026-04-22
CommitDate: 2026-04-22
    Merge pull request #2690 from nghttp2/designated-initializers-part2
    Adopt Designated initializers part2
commit 2d969082056f91a01c5257d497e6b98e31f119b5
AuthorDate: 2026-04-21
CommitDate: 2026-04-22
    Adopt Designated initializers part2
commit c0f05e86451d3ca9e798164636c47830cfc236ea
Merge: 994d1839 1015b794
AuthorDate: 2026-04-21
CommitDate: 2026-04-21
    Merge pull request #2689 from nghttp2/designated-initializers-part1
    Adopt Designated initializers part1
commit 1015b794ff382b42a0c9e538c95c3710e58c04eb
Author:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
AuthorDate: 2026-04-21
Commit:     Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
CommitDate: 2026-04-21
    Adopt Designated initializers part1
commit 994d183964b542856a9f553a6ae950a37d8816bc
Merge: 4944ae62 a5900d5a
AuthorDate: 2026-04-19
CommitDate: 2026-04-19
    Merge pull request #2688 from nghttp2/require-c++23
    Require C++23
commit a5900d5a2912ce2a07b370c69acb71484e938838
AuthorDate: 2026-04-19
CommitDate: 2026-04-19
    Require C++23
commit 4944ae624af983d1256f617acf0a2fc0034d6c7d
AuthorDate: 2026-04-19
CommitDate: 2026-04-19

--===============1295821172422846890==--

