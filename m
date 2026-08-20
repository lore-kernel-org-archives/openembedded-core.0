Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51958C5DF85
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 07:23:06 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1809.1787210578852687036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 00:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jVvg2zDr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gn6i1noQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a01e0d3782-fdaedf5e-b933-4322-af0f-8b86d0620e6b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787210578;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=6VcP5A0GUYva3FABw34siB9vej9ha1vWx2IoJqkLnZ0=;
	b=jVvg2zDrftO73u6yT+E8bOxPZfCIiuXMeT+DsJK0lYdAhmHSFbZglvSHC2RIK347
	0VcfVUZsN7EO8L2fDrNiaZ+3TskUKT9Td8zXH1WDp9fCaZffO/7LYk4MrzPX2/mC8Ki
	UdLbfmM033ZOi4XAAeSOUHbxIq5lI7B8R+doNn14=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787210578;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=6VcP5A0GUYva3FABw34siB9vej9ha1vWx2IoJqkLnZ0=;
	b=gn6i1noQN6AuerxG/+oQUNau04YnjWpEg7CkLO+yBcH047sH7AW3+2mHVCOThzgm
	CrpcVUwyUVVvjAVeJ3Ny4fZ41JTC9egT1JZmS8fQqUxqIfIakXmGHySR0rhoKV0nfFY
	De6eocJ7VBd/OVOdBuUp8kNJyDMcGu/56cKQwTX8=
Content-Type: multipart/mixed; boundary="===============5219983942070688333=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] erofs-utils: upgrading to 1.9.4 SUCCEEDED
Message-ID: <010101a01e0d3782-fdaedf5e-b933-4322-af0f-8b86d0620e6b-000000@us-west-2.amazonses.com>
Date: Thu, 20 Aug 2026 07:22:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.20-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 07:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243809

--===============5219983942070688333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *erofs-utils* to *1.9.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.9.3-1.9.4.patch
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
From bbfc6890473098ba6b0382734f8ea7f84b69fd9a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 20 Aug 2026 05:12:56 +0000
Subject: [PATCH] erofs-utils: upgrade 1.9.3 -> 1.9.4

Source: ChangeLog

erofs-utils 1.9.4

* A quick maintenance release includes the following fixes:

 - (fsck.erofs, dump.erofs) Fix image extraction when `-Efragments` is
                            enabled (Seula Lee);
 - (mkfs.erofs) Fix multi-threaded compression crashes on macOS
                (Isaiah DeRose-Wilson).

 -- Gao Xiang <xiang@kernel.org>  Wed, 19 Aug 2026 19:30:00 +0800
---
 .../erofs-utils/{erofs-utils_1.9.3.bb => erofs-utils_1.9.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.9.3.bb => erofs-utils_1.9.4.bb} (93%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.3.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
similarity index 93%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.9.3.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
index 2b849f2a4e..45339656b5 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.3.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.4.bb
@@ -4,7 +4,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=63afa010baddc7d0905f9c31ac759f51"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "7db78788b000999e2de88decd2ba90654f26171c"
+SRCREV = "f36cadb5c563995ab3aa8572a60ed6b721b9557d"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https;tag=v${PV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.47.1


--===============5219983942070688333==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.9.3-1.9.4.patch"

RnJvbSBiYmZjNjg5MDQ3MzA5OGJhNmIwMzgyNzM0ZjhlYTdmODRiNjlmZDlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjAgQXVnIDIwMjYgMDU6MTI6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cm9mcy11dGlsczogdXBncmFkZSAxLjkuMyAtPiAxLjkuNAoKU291cmNlOiBDaGFuZ2VMb2cKCmVy
b2ZzLXV0aWxzIDEuOS40CgoqIEEgcXVpY2sgbWFpbnRlbmFuY2UgcmVsZWFzZSBpbmNsdWRlcyB0
aGUgZm9sbG93aW5nIGZpeGVzOgoKIC0gKGZzY2suZXJvZnMsIGR1bXAuZXJvZnMpIEZpeCBpbWFn
ZSBleHRyYWN0aW9uIHdoZW4gYC1FZnJhZ21lbnRzYCBpcwogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZW5hYmxlZCAoU2V1bGEgTGVlKTsKIC0gKG1rZnMuZXJvZnMpIEZpeCBtdWx0aS10aHJl
YWRlZCBjb21wcmVzc2lvbiBjcmFzaGVzIG9uIG1hY09TCiAgICAgICAgICAgICAgICAoSXNhaWFo
IERlUm9zZS1XaWxzb24pLgoKIC0tIEdhbyBYaWFuZyA8eGlhbmdAa2VybmVsLm9yZz4gIFdlZCwg
MTkgQXVnIDIwMjYgMTk6MzA6MDAgKzA4MDAKLS0tCiAuLi4vZXJvZnMtdXRpbHMve2Vyb2ZzLXV0
aWxzXzEuOS4zLmJiID0+IGVyb2ZzLXV0aWxzXzEuOS40LmJifSAgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZXJvZnMtdXRpbHMve2Vyb2ZzLXV0aWxzXzEuOS4zLmJiID0+IGVyb2ZzLXV0aWxz
XzEuOS40LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9m
cy11dGlscy9lcm9mcy11dGlsc18xLjkuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9m
cy11dGlscy9lcm9mcy11dGlsc18xLjkuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNfMS45LjMu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11dGls
c18xLjkuNC5iYgppbmRleCAyYjg0OWYyYTRlLi40NTMzOTY1NmI1IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNfMS45LjMuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuOS40LmJiCkBA
IC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT02M2FmYTAxMGJhZGRjN2QwOTA1ZjljMzFhYzc1OWY1MSIKIEhPTUVQQUdF
ID0gImh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hpYW5n
L2Vyb2ZzLXV0aWxzLmdpdC90cmVlL1JFQURNRSIKIAotU1JDUkVWID0gIjdkYjc4Nzg4YjAwMDk5
OWUyZGU4OGRlY2QyYmE5MDY1NGYyNjE3MWMiCitTUkNSRVYgPSAiZjM2Y2FkYjVjNTYzOTk1YWIz
YWE4NTcyYTYwZWQ2YjcyMWI5NTU3ZCIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdDticmFuY2g9bWFz
dGVyO3Byb3RvY29sPWh0dHBzO3RhZz12JHtQVn0iCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JF
R0VYID0gInYoP1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKLS0gCjIuNDcuMQoK

--===============5219983942070688333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="erofs-utils-changelog.txt"

Changelog for erofs-utils: 1.9.3 -> 1.9.4
Source: ChangeLog

erofs-utils 1.9.4

* A quick maintenance release includes the following fixes:

 - (fsck.erofs, dump.erofs) Fix image extraction when `-Efragments` is
                            enabled (Seula Lee);
 - (mkfs.erofs) Fix multi-threaded compression crashes on macOS
                (Isaiah DeRose-Wilson).

 -- Gao Xiang <xiang@kernel.org>  Wed, 19 Aug 2026 19:30:00 +0800

--===============5219983942070688333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 2748304 to 2749240 (+0%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 806689 to 806862 (+0%)
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-src: FILELIST: directory renamed /usr/src/debug/erofs-utils/1.9.3/lib/remotes -> /usr/src/debug/erofs-utils/1.9.4/lib/remotes, directory renamed /usr/src/debug/erofs-utils/1.9.3/mkfs -> /usr/src/debug/erofs-utils/1.9.4/mkfs, directory renamed /usr/src/debug/erofs-utils/1.9.3/fsck -> /usr/src/debug/erofs-utils/1.9.4/fsck, directory renamed /usr/src/debug/erofs-utils/1.9.3/mount -> /usr/src/debug/erofs-utils/1.9.4/mount, directory renamed /usr/src/debug/erofs-utils/1.9.3/include/erofs -> /usr/src/debug/erofs-utils/1.9.4/include/erofs, directory renamed /usr/src/debug/erofs-utils/1.9.3/lib/backends -> /usr/src/debug/erofs-utils/1.9.4/lib/backends, directory renamed /usr/src/debug/erofs-utils/1.9.3/dump -> /usr/src/debug/erofs-utils/1.9.4/dump, directory renamed /usr/src/debug/erofs-utils/1.9.3/include -> /usr/src/debug/erofs-utils/1.9.4/include, directory renamed /usr/src/debug/erofs-utils/1.9.3/lib -> /usr/src/debug/erofs-utils/1.9.
 4/lib
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.9.3 [default] to 1.9.4 [default]
packages/x86-64-v3-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 764832 to 768928 (+1%)
packages/x86-64-v3-poky-linux/erofs-utils: SRC_URI changed from "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https;tag=v1.9.3" to "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https;tag=v1.9.4"
packages/x86-64-v3-poky-linux/erofs-utils: PV changed from "1.9.3" to "1.9.4"
packages/x86-64-v3-poky-linux/erofs-utils: PKGV changed from 1.9.3 [default] to 1.9.4 [default]

--===============5219983942070688333==--

