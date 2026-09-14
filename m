Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175A9C88E6C
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 05:40:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13725.1789364445331283161
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 22:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=p328ZZLR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UYuYnGcL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a09e6e9cf7-a69a3cbc-564d-4285-95ab-a4099e18523f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789364444;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FIEnEETVGN1/IGZdqFExWFH9CfoUjSAHlEc/IvuC5zU=;
	b=p328ZZLR+ZX1uwNFTEo6nanLim5QLWOLiKYszD5o7rD7x9YQJFqc5yX0Mi2iEqtj
	29U9IkkcmUDb+LHvCm7utmIKn+iy56v05+ojo0us0QMVdOeuoQffZAZgwpiUn6vYuxi
	M/GDb1jiLtNmQPMN6CkGQ+lb4V1A9SCTcIlMZ4Tc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789364444;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FIEnEETVGN1/IGZdqFExWFH9CfoUjSAHlEc/IvuC5zU=;
	b=UYuYnGcLnJkSWi98jOaeLW+05rhD1F98XElZY8IHSENuC2anDLp1P922CbU9vbjc
	iARHTKgpDG/R5uZCPpflgcYgyCDPhNyR3l1XHDISdWm2sjtLrIOEWdrYM5QzrrqBIDE
	NG34U4sNr1jBcs9kGwF3YWTobt5oXjnGMxuHhTmA=
Content-Type: multipart/mixed; boundary="===============4479275268467151917=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.4.0 SUCCEEDED
Message-ID: <010101a09e6e9cf7-a69a3cbc-564d-4285-95ab-a4099e18523f-000000@us-west-2.amazonses.com>
Date: Mon, 14 Sep 2026 05:40:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.14-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245755

--===============4479275268467151917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-2.3.4-2.4.0.patch
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
From 8e9c7b4238086925e620dd5574e93fa943ef2066 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 14 Sep 2026 05:26:43 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 2.3.4 -> 2.4.0

Source: CHANGELOG.md

## 2.4.0 (2026-09-12)

### Added

- Add `scm.git.distance_scope` and `scm.git.distance_count`, restricting the distance count to the commits that touch a monorepo project (and optionally further shared directories) instead of every commit in the repository. Counting uses `--full-history` by default, or `--first-parent`; git's default history simplification is not offered because it can make the distance shrink across a merge. Git only. ([#1056](https://github.com/pypa/setuptools-scm/issues/1056))

### Fixed

- Select file finders by the VCS marker their entry point is named for (`.git`, `.hg`, `.jj`) instead of running every backend's command in turn. A tree with no VCS marker -- an unpacked sdist, say -- now spawns no subprocess at all, so a slow `hg` on `PATH` can no longer fail an unrelated build.

  The finders also survive a subprocess timeout: `subprocess.TimeoutExpired` was uncaught and aborted the build, and is now treated like any other failed probe. ([#1212](https://github.com/pypa/setuptools-scm/issues/1212))
- Prefer the fallback metadata nearest the project directory. A `.git_archival.txt` or `PKG-INFO` at the VCS root no longer shadows a monorepo project's own, which silently produced the root project's version. ([#1522](https://github.com/pypa/setuptools-scm/issues/1522))
---
 ...-vcs-versioning_2.3.4.bb => python3-vcs-versioning_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.3.4.bb => python3-vcs-versioning_2.4.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
index e358c722d7..e66a7ce7b0 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "f3443da15a34a32755b04324e33c6166add300c7661f45902225190c9337f711"
+SRC_URI[sha256sum] = "cc4b66c02ae4cfb51e843910024f7142464c3391bb1f7e04608578b45046891b"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============4479275268467151917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: FILELIST: added "/usr/lib/python3-vcs-versioning/ptest/testing_vcs/test_git_distance_scope.py"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info

--===============4479275268467151917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning: PV changed from "2.3.4" to "2.4.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PKGV changed from 2.3.4 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.3.4.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.4.0.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PV changed from "2.3.4" to "2.4.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PKGV changed from 2.3.4 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PV changed from "2.3.4" to "2.4.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PKGV changed from 2.3.4 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PV changed from "2.3.4" to "2.4.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PKGV changed from 2.3.4 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PV changed from "2.3.4" to "2.4.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PKGV changed from 2.3.4 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGSIZE changed from 278380 to 299016 (+7%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: FILELIST: added "/usr/lib/python3-vcs-versioning/ptest/testing_vcs/test_git_distance_scope.py"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PV changed from "2.3.4" to "2.4.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGV changed from 2.3.4 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PV changed from "2.3.4" to "2.4.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PKGV changed from 2.3.4 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PV changed from "2.3.4" to "2.4.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PKGV changed from 2.3.4 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGSIZE changed from 777583 to 815292 (+5%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PV changed from "2.3.4" to "2.4.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGV changed from 2.3.4 [default] to 2.4.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.4.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info

--===============4479275268467151917==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-2.3.4-2.4.0.patch"

RnJvbSA4ZTljN2I0MjM4MDg2OTI1ZTYyMGRkNTU3NGU5M2ZhOTQzZWYyMDY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTQgU2VwIDIwMjYgMDU6MjY6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXZjcy12ZXJzaW9uaW5nOiB1cGdyYWRlIDIuMy40IC0+IDIuNC4wCgpTb3VyY2U6IENI
QU5HRUxPRy5tZAoKIyMgMi40LjAgKDIwMjYtMDktMTIpCgojIyMgQWRkZWQKCi0gQWRkIGBzY20u
Z2l0LmRpc3RhbmNlX3Njb3BlYCBhbmQgYHNjbS5naXQuZGlzdGFuY2VfY291bnRgLCByZXN0cmlj
dGluZyB0aGUgZGlzdGFuY2UgY291bnQgdG8gdGhlIGNvbW1pdHMgdGhhdCB0b3VjaCBhIG1vbm9y
ZXBvIHByb2plY3QgKGFuZCBvcHRpb25hbGx5IGZ1cnRoZXIgc2hhcmVkIGRpcmVjdG9yaWVzKSBp
bnN0ZWFkIG9mIGV2ZXJ5IGNvbW1pdCBpbiB0aGUgcmVwb3NpdG9yeS4gQ291bnRpbmcgdXNlcyBg
LS1mdWxsLWhpc3RvcnlgIGJ5IGRlZmF1bHQsIG9yIGAtLWZpcnN0LXBhcmVudGA7IGdpdCdzIGRl
ZmF1bHQgaGlzdG9yeSBzaW1wbGlmaWNhdGlvbiBpcyBub3Qgb2ZmZXJlZCBiZWNhdXNlIGl0IGNh
biBtYWtlIHRoZSBkaXN0YW5jZSBzaHJpbmsgYWNyb3NzIGEgbWVyZ2UuIEdpdCBvbmx5LiAoWyMx
MDU2XShodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzLXNjbS9pc3N1ZXMvMTA1Nikp
CgojIyMgRml4ZWQKCi0gU2VsZWN0IGZpbGUgZmluZGVycyBieSB0aGUgVkNTIG1hcmtlciB0aGVp
ciBlbnRyeSBwb2ludCBpcyBuYW1lZCBmb3IgKGAuZ2l0YCwgYC5oZ2AsIGAuampgKSBpbnN0ZWFk
IG9mIHJ1bm5pbmcgZXZlcnkgYmFja2VuZCdzIGNvbW1hbmQgaW4gdHVybi4gQSB0cmVlIHdpdGgg
bm8gVkNTIG1hcmtlciAtLSBhbiB1bnBhY2tlZCBzZGlzdCwgc2F5IC0tIG5vdyBzcGF3bnMgbm8g
c3VicHJvY2VzcyBhdCBhbGwsIHNvIGEgc2xvdyBgaGdgIG9uIGBQQVRIYCBjYW4gbm8gbG9uZ2Vy
IGZhaWwgYW4gdW5yZWxhdGVkIGJ1aWxkLgoKICBUaGUgZmluZGVycyBhbHNvIHN1cnZpdmUgYSBz
dWJwcm9jZXNzIHRpbWVvdXQ6IGBzdWJwcm9jZXNzLlRpbWVvdXRFeHBpcmVkYCB3YXMgdW5jYXVn
aHQgYW5kIGFib3J0ZWQgdGhlIGJ1aWxkLCBhbmQgaXMgbm93IHRyZWF0ZWQgbGlrZSBhbnkgb3Ro
ZXIgZmFpbGVkIHByb2JlLiAoWyMxMjEyXShodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRv
b2xzLXNjbS9pc3N1ZXMvMTIxMikpCi0gUHJlZmVyIHRoZSBmYWxsYmFjayBtZXRhZGF0YSBuZWFy
ZXN0IHRoZSBwcm9qZWN0IGRpcmVjdG9yeS4gQSBgLmdpdF9hcmNoaXZhbC50eHRgIG9yIGBQS0ct
SU5GT2AgYXQgdGhlIFZDUyByb290IG5vIGxvbmdlciBzaGFkb3dzIGEgbW9ub3JlcG8gcHJvamVj
dCdzIG93biwgd2hpY2ggc2lsZW50bHkgcHJvZHVjZWQgdGhlIHJvb3QgcHJvamVjdCdzIHZlcnNp
b24uIChbIzE1MjJdKGh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vl
cy8xNTIyKSkKLS0tCiAuLi4tdmNzLXZlcnNpb25pbmdfMi4zLjQuYmIgPT4gcHl0aG9uMy12Y3Mt
dmVyc2lvbmluZ18yLjQuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tw
eXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMy40LmJiID0+IHB5dGhvbjMtdmNzLXZlcnNpb25pbmdf
Mi40LjAuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMy40LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNC4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12Y3Mt
dmVyc2lvbmluZ18yLjMuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNC4wLmJiCmluZGV4IGUzNThjNzIyZDcuLmU2NmE3
Y2U3YjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12
Y3MtdmVyc2lvbmluZ18yLjMuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi40LjAuYmIKQEAgLTUsNyArNSw3IEBAIGxpYnJhcnkg
dGhhdCBjYW4gYmUgdXNlZCBpbmRlcGVuZGVudGx5IG9mIHNldHVwdG9vbHMuIgogTElDRU5TRSA9
ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9YzliMDZh
ZDJlYmQ3ZTJlODJkMzRiM2NhZjM1M2U3ZDUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmMzQ0
M2RhMTVhMzRhMzI3NTViMDQzMjRlMzNjNjE2NmFkZDMwMGM3NjYxZjQ1OTAyMjI1MTkwYzkzMzdm
NzExIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNjNGI2NmMwMmFlNGNmYjUxZTg0MzkxMDAyNGY3
MTQyNDY0YzMzOTFiYjFmN2UwNDYwODU3OGI0NTA0Njg5MWIiCiAKIFNSQ19VUkkgKz0gIlwKICAg
ICBmaWxlOi8vcnVuLXB0ZXN0IFwKLS0gCjIuNDcuMQoK

--===============4479275268467151917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-vcs-versioning-changelog.txt"

Changelog for python3-vcs-versioning: 2.3.4 -> 2.4.0
Source: CHANGELOG.md

## 2.4.0 (2026-09-12)

### Added

- Add `scm.git.distance_scope` and `scm.git.distance_count`, restricting the distance count to the commits that touch a monorepo project (and optionally further shared directories) instead of every commit in the repository. Counting uses `--full-history` by default, or `--first-parent`; git's default history simplification is not offered because it can make the distance shrink across a merge. Git only. ([#1056](https://github.com/pypa/setuptools-scm/issues/1056))

### Fixed

- Select file finders by the VCS marker their entry point is named for (`.git`, `.hg`, `.jj`) instead of running every backend's command in turn. A tree with no VCS marker -- an unpacked sdist, say -- now spawns no subprocess at all, so a slow `hg` on `PATH` can no longer fail an unrelated build.

  The finders also survive a subprocess timeout: `subprocess.TimeoutExpired` was uncaught and aborted the build, and is now treated like any other failed probe. ([#1212](https://github.com/pypa/setuptools-scm/issues/1212))
- Prefer the fallback metadata nearest the project directory. A `.git_archival.txt` or `PKG-INFO` at the VCS root no longer shadows a monorepo project's own, which silently produced the root project's version. ([#1522](https://github.com/pypa/setuptools-scm/issues/1522))

--===============4479275268467151917==--

