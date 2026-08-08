Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902E1C5AD55
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 06:06:44 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.827.1786169198938884701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 23:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=quwyuNjC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KcOB7051;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019fdffb0563-7116a5ec-1908-4c44-b5b0-105eaa4d8b4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786169198;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hiZDFqthRxeE1/qyl+zF866rX0bHyS0wMVL7JqD+tic=;
	b=quwyuNjCjMmeDIltj+SDgiAS2oDJ9Xwk/OcjyeSrekF1FsmgA+ej5ptyguoCWSN+
	Mxv1vBcXwKM0tlGQRm+xomS0UwmUSTTrV+GE55pSmt4WNkhsQYNulMzNMAtdiBtmSXE
	wj4AR56wR1/8/YgevuG9ib8Xv7PvZsVxkrOcHPdc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786169198;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hiZDFqthRxeE1/qyl+zF866rX0bHyS0wMVL7JqD+tic=;
	b=KcOB7051hP8D+g2tK7Yr5iZ6uN6mAQPNkUXvI9SyIUDnK6oV4QLUYg2hmUculFqG
	92rje6DduTACWIRhwRIUYLQiO3ENb6aguu+AiyK2kl9LGcRj54Z4NQKAlQ2N/aqYvvf
	YWVGHBZkNfyYGIL6B8+lKLCp223MMg4AS68LgjFQ=
Content-Type: multipart/mixed; boundary="===============5775827796809166667=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.2.4 SUCCEEDED
Message-ID: <0101019fdffb0563-7116a5ec-1908-4c44-b5b0-105eaa4d8b4f-000000@us-west-2.amazonses.com>
Date: Sat, 8 Aug 2026 06:06:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.08-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 06:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243032

--===============5775827796809166667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-2.2.3-2.2.4.patch
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
From ca3a04f6664b96a3ed6bdce5a9b6df062cf364fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 8 Aug 2026 05:56:21 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 2.2.3 -> 2.2.4

Source: CHANGELOG.md

## 2.2.4 (2026-08-07)

### Fixed

- Speed up jujutsu version inference in large repositories.

  The jj backend filtered whole-ancestry revsets with `empty()`, which makes
  jj diff every commit in the history and took minutes on large repos.  The
  scan for the newest real commit is now bounded to the most recent
  generations, distances are counted without the filter, and the working copy
  is snapshotted only once per run (later queries pass
  `--ignore-working-copy`).

  As a side effect distances now match `git describe --long`: merge commits
  count even though jj considers them empty. ([#1477](https://github.com/pypa/setuptools-scm/issues/1477))
- Improve reproducibility of scm_file_list.json ([#1488](https://github.com/pypa/setuptools-scm/issues/1488))
- Route the hg-git tag mismatch warning through the module logger instead of the root logger. ([#1489](https://github.com/pypa/setuptools-scm/issues/1489))
---
 ...-vcs-versioning_2.2.3.bb => python3-vcs-versioning_2.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.2.3.bb => python3-vcs-versioning_2.2.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb
index eb81e4d4d3..c8665d90c9 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.3.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "c21e284aa98c8269996791a19d6173baf953cf9996ef42ec3ebcbdc151e18b9b"
+SRC_URI[sha256sum] = "ed718fdee42170e128a8add6f23f53aa64dc7d9ab2de87d3083a691df881a809"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============5775827796809166667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-vcs-versioning-changelog.txt"

Changelog for python3-vcs-versioning: 2.2.3 -> 2.2.4
Source: CHANGELOG.md

## 2.2.4 (2026-08-07)

### Fixed

- Speed up jujutsu version inference in large repositories.

  The jj backend filtered whole-ancestry revsets with `empty()`, which makes
  jj diff every commit in the history and took minutes on large repos.  The
  scan for the newest real commit is now bounded to the most recent
  generations, distances are counted without the filter, and the working copy
  is snapshotted only once per run (later queries pass
  `--ignore-working-copy`).

  As a side effect distances now match `git describe --long`: merge commits
  count even though jj considers them empty. ([#1477](https://github.com/pypa/setuptools-scm/issues/1477))
- Improve reproducibility of scm_file_list.json ([#1488](https://github.com/pypa/setuptools-scm/issues/1488))
- Route the hg-git tag mismatch warning through the module logger instead of the root logger. ([#1489](https://github.com/pypa/setuptools-scm/issues/1489))

--===============5775827796809166667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info

--===============5775827796809166667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.2.3.tar.gz;downloadfilename=vcs_versioning-2.2.3.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.2.4.tar.gz;downloadfilename=vcs_versioning-2.2.4.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PV changed from "2.2.3" to "2.2.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PV changed from "2.2.3" to "2.2.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PV changed from "2.2.3" to "2.2.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PV changed from "2.2.3" to "2.2.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PV changed from "2.2.3" to "2.2.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PV changed from "2.2.3" to "2.2.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGSIZE changed from 246443 to 248397 (+1%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PV changed from "2.2.3" to "2.2.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PV changed from "2.2.3" to "2.2.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PV changed from "2.2.3" to "2.2.4"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGV changed from 2.2.3 [default] to 2.2.4 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGSIZE changed from 732655 to 735834 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.3.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info

--===============5775827796809166667==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-2.2.3-2.2.4.patch"

RnJvbSBjYTNhMDRmNjY2NGI5NmEzZWQ2YmRjZTVhOWI2ZGYwNjJjZjM2NGZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgOCBBdWcgMjAyNiAwNTo1NjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdmNzLXZlcnNpb25pbmc6IHVwZ3JhZGUgMi4yLjMgLT4gMi4yLjQKClNvdXJjZTogQ0hB
TkdFTE9HLm1kCgojIyAyLjIuNCAoMjAyNi0wOC0wNykKCiMjIyBGaXhlZAoKLSBTcGVlZCB1cCBq
dWp1dHN1IHZlcnNpb24gaW5mZXJlbmNlIGluIGxhcmdlIHJlcG9zaXRvcmllcy4KCiAgVGhlIGpq
IGJhY2tlbmQgZmlsdGVyZWQgd2hvbGUtYW5jZXN0cnkgcmV2c2V0cyB3aXRoIGBlbXB0eSgpYCwg
d2hpY2ggbWFrZXMKICBqaiBkaWZmIGV2ZXJ5IGNvbW1pdCBpbiB0aGUgaGlzdG9yeSBhbmQgdG9v
ayBtaW51dGVzIG9uIGxhcmdlIHJlcG9zLiAgVGhlCiAgc2NhbiBmb3IgdGhlIG5ld2VzdCByZWFs
IGNvbW1pdCBpcyBub3cgYm91bmRlZCB0byB0aGUgbW9zdCByZWNlbnQKICBnZW5lcmF0aW9ucywg
ZGlzdGFuY2VzIGFyZSBjb3VudGVkIHdpdGhvdXQgdGhlIGZpbHRlciwgYW5kIHRoZSB3b3JraW5n
IGNvcHkKICBpcyBzbmFwc2hvdHRlZCBvbmx5IG9uY2UgcGVyIHJ1biAobGF0ZXIgcXVlcmllcyBw
YXNzCiAgYC0taWdub3JlLXdvcmtpbmctY29weWApLgoKICBBcyBhIHNpZGUgZWZmZWN0IGRpc3Rh
bmNlcyBub3cgbWF0Y2ggYGdpdCBkZXNjcmliZSAtLWxvbmdgOiBtZXJnZSBjb21taXRzCiAgY291
bnQgZXZlbiB0aG91Z2ggamogY29uc2lkZXJzIHRoZW0gZW1wdHkuIChbIzE0NzddKGh0dHBzOi8v
Z2l0aHViLmNvbS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNDc3KSkKLSBJbXByb3ZlIHJl
cHJvZHVjaWJpbGl0eSBvZiBzY21fZmlsZV9saXN0Lmpzb24gKFsjMTQ4OF0oaHR0cHM6Ly9naXRo
dWIuY29tL3B5cGEvc2V0dXB0b29scy1zY20vaXNzdWVzLzE0ODgpKQotIFJvdXRlIHRoZSBoZy1n
aXQgdGFnIG1pc21hdGNoIHdhcm5pbmcgdGhyb3VnaCB0aGUgbW9kdWxlIGxvZ2dlciBpbnN0ZWFk
IG9mIHRoZSByb290IGxvZ2dlci4gKFsjMTQ4OV0oaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvc2V0
dXB0b29scy1zY20vaXNzdWVzLzE0ODkpKQotLS0KIC4uLi12Y3MtdmVyc2lvbmluZ18yLjIuMy5i
YiA9PiBweXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMi40LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24ve3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4yLjMuYmIgPT4gcHl0aG9u
My12Y3MtdmVyc2lvbmluZ18yLjIuNC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4yLjMuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4yLjQuYmIK
c2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4yLjQuYmIKaW5kZXgg
ZWI4MWU0ZDRkMy4uYzg2NjVkOTBjOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMi4zLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjIuNC5iYgpAQCAtNSw3
ICs1LDcgQEAgbGlicmFyeSB0aGF0IGNhbiBiZSB1c2VkIGluZGVwZW5kZW50bHkgb2Ygc2V0dXB0
b29scy4iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UudHh0O21kNT1jOWIwNmFkMmViZDdlMmU4MmQzNGIzY2FmMzUzZTdkNSIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImMyMWUyODRhYTk4YzgyNjk5OTY3OTFhMTlkNjE3M2JhZjk1M2NmOTk5NmVm
NDJlYzNlYmNiZGMxNTFlMThiOWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWQ3MThmZGVlNDIx
NzBlMTI4YThhZGQ2ZjIzZjUzYWE2NGRjN2Q5YWIyZGU4N2QzMDgzYTY5MWRmODgxYTgwOSIKIAog
U1JDX1VSSSArPSAiXAogICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAotLSAKMi40Ny4xCgo=

--===============5775827796809166667==--

