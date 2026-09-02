Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF85C61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:31:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5601.1788327107620048266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cY5Eyx4C;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2xh+8F/g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0609a1892-6e0867be-feb3-44fe-a3b7-9a35ce24a6cf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788327106;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DLc6KQPoHH5K8dqWsw9WjCaPgVw1wCrk5waPo3O1Puk=;
	b=cY5Eyx4CeffKFiqnU9qhztCx5bTyVyUFtbFvd0KdpXGQHxHAyFq25jdOpv4vE8Ee
	FWP/HuD3usAwK1JWCINN8NKV4U2G78sZRPEofi34Or+7C4cKRW45oNDiTPTlP1OQcrM
	/Db8trAmril0H0LK//4Z1KdS4JpC6Z4O1SakHyR8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788327106;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DLc6KQPoHH5K8dqWsw9WjCaPgVw1wCrk5waPo3O1Puk=;
	b=2xh+8F/gn83KWDq6lW8Zpy53x3cV85kXWAR9OqWm9AID4VkxrfFFV5uZ5Lrp4pro
	nOCm9uevIQd59dIoGwZol4YXVC6sPzFzNbM7UPf1SWQ/czsJwgI1WyHvRdwgHVO+Urh
	fcecBiJnb8YKIQuntb4BFxFHkbsWkO9EyhWPOZLc=
Content-Type: multipart/mixed; boundary="===============1235722531246857595=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.3.2 SUCCEEDED
Message-ID: <010101a0609a1892-6e0867be-feb3-44fe-a3b7-9a35ce24a6cf-000000@us-west-2.amazonses.com>
Date: Wed, 2 Sep 2026 05:31:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244882

--===============1235722531246857595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-2.3.1-2.3.2.patch
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
From 96da56b1aa705084ef62e167ceeaa1ff233d9e1a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 2 Sep 2026 05:23:34 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 2.3.1 -> 2.3.2

Source: CHANGELOG.md

## 2.3.2 (2026-09-01)

### Fixed

- Register the `pkginfo` workdir discovery factory in vcs-versioning itself. `PKG-INFO` is standard sdist metadata, not a setuptools artifact, but its factory was only registered by setuptools-scm -- so a standalone vcs-versioning install could not infer a version from an sdist. This broke sdist builds for non-setuptools backends, e.g. meson-python calling `python -m vcs_versioning` from `project()`.

  Fallback workdir candidates are now ordered by how much metadata they carry (egg-info, then archival, then `PKG-INFO`) instead of by entry point iteration order, so a setuptools built sdist keeps using its `scm_version.json` now that the two factories ship from different distributions. ([#1507](https://github.com/pypa/setuptools-scm/issues/1507))

### Miscellaneous

- Stop shipping a per-package `uv.lock` in the sdist. It could not be generated correctly whenever `setuptools-scm` required an unreleased `vcs-versioning`, which broke the release proposal workflow. ([#1509](https://github.com/pypa/setuptools-scm/issues/1509))
---
 ...-vcs-versioning_2.3.1.bb => python3-vcs-versioning_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.3.1.bb => python3-vcs-versioning_2.3.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb
index 1800475dff..57ea6a9227 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.2.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "806635bd0ea653c96af98a70624be758d408a989f2cd0b390e63474d99f96b63"
+SRC_URI[sha256sum] = "24abddff97aecf44cf3fec727eae8d76d9c6f70f5acb39afc41f824d69f2aac5"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============1235722531246857595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.3.1.tar.gz;downloadfilename=vcs_versioning-2.3.1.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.3.2.tar.gz;downloadfilename=vcs_versioning-2.3.2.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGSIZE changed from 271966 to 278538 (+2%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PV changed from "2.3.1" to "2.3.2"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGV changed from 2.3.1 [default] to 2.3.2 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGSIZE changed from 774001 to 777152 (+0%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PV changed from "2.3.1" to "2.3.2"
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info

--===============1235722531246857595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-vcs-versioning-changelog.txt"

Changelog for python3-vcs-versioning: 2.3.1 -> 2.3.2
Source: CHANGELOG.md

## 2.3.2 (2026-09-01)

### Fixed

- Register the `pkginfo` workdir discovery factory in vcs-versioning itself. `PKG-INFO` is standard sdist metadata, not a setuptools artifact, but its factory was only registered by setuptools-scm -- so a standalone vcs-versioning install could not infer a version from an sdist. This broke sdist builds for non-setuptools backends, e.g. meson-python calling `python -m vcs_versioning` from `project()`.

  Fallback workdir candidates are now ordered by how much metadata they carry (egg-info, then archival, then `PKG-INFO`) instead of by entry point iteration order, so a setuptools built sdist keeps using its `scm_version.json` now that the two factories ship from different distributions. ([#1507](https://github.com/pypa/setuptools-scm/issues/1507))

### Miscellaneous

- Stop shipping a per-package `uv.lock` in the sdist. It could not be generated correctly whenever `setuptools-scm` required an unreleased `vcs-versioning`, which broke the release proposal workflow. ([#1509](https://github.com/pypa/setuptools-scm/issues/1509))

--===============1235722531246857595==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-2.3.1-2.3.2.patch"

RnJvbSA5NmRhNTZiMWFhNzA1MDg0ZWY2MmUxNjdjZWVhYTFmZjIzM2Q5ZTFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMiBTZXAgMjAyNiAwNToyMzozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdmNzLXZlcnNpb25pbmc6IHVwZ3JhZGUgMi4zLjEgLT4gMi4zLjIKClNvdXJjZTogQ0hB
TkdFTE9HLm1kCgojIyAyLjMuMiAoMjAyNi0wOS0wMSkKCiMjIyBGaXhlZAoKLSBSZWdpc3RlciB0
aGUgYHBrZ2luZm9gIHdvcmtkaXIgZGlzY292ZXJ5IGZhY3RvcnkgaW4gdmNzLXZlcnNpb25pbmcg
aXRzZWxmLiBgUEtHLUlORk9gIGlzIHN0YW5kYXJkIHNkaXN0IG1ldGFkYXRhLCBub3QgYSBzZXR1
cHRvb2xzIGFydGlmYWN0LCBidXQgaXRzIGZhY3Rvcnkgd2FzIG9ubHkgcmVnaXN0ZXJlZCBieSBz
ZXR1cHRvb2xzLXNjbSAtLSBzbyBhIHN0YW5kYWxvbmUgdmNzLXZlcnNpb25pbmcgaW5zdGFsbCBj
b3VsZCBub3QgaW5mZXIgYSB2ZXJzaW9uIGZyb20gYW4gc2Rpc3QuIFRoaXMgYnJva2Ugc2Rpc3Qg
YnVpbGRzIGZvciBub24tc2V0dXB0b29scyBiYWNrZW5kcywgZS5nLiBtZXNvbi1weXRob24gY2Fs
bGluZyBgcHl0aG9uIC1tIHZjc192ZXJzaW9uaW5nYCBmcm9tIGBwcm9qZWN0KClgLgoKICBGYWxs
YmFjayB3b3JrZGlyIGNhbmRpZGF0ZXMgYXJlIG5vdyBvcmRlcmVkIGJ5IGhvdyBtdWNoIG1ldGFk
YXRhIHRoZXkgY2FycnkgKGVnZy1pbmZvLCB0aGVuIGFyY2hpdmFsLCB0aGVuIGBQS0ctSU5GT2Ap
IGluc3RlYWQgb2YgYnkgZW50cnkgcG9pbnQgaXRlcmF0aW9uIG9yZGVyLCBzbyBhIHNldHVwdG9v
bHMgYnVpbHQgc2Rpc3Qga2VlcHMgdXNpbmcgaXRzIGBzY21fdmVyc2lvbi5qc29uYCBub3cgdGhh
dCB0aGUgdHdvIGZhY3RvcmllcyBzaGlwIGZyb20gZGlmZmVyZW50IGRpc3RyaWJ1dGlvbnMuIChb
IzE1MDddKGh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNTA3
KSkKCiMjIyBNaXNjZWxsYW5lb3VzCgotIFN0b3Agc2hpcHBpbmcgYSBwZXItcGFja2FnZSBgdXYu
bG9ja2AgaW4gdGhlIHNkaXN0LiBJdCBjb3VsZCBub3QgYmUgZ2VuZXJhdGVkIGNvcnJlY3RseSB3
aGVuZXZlciBgc2V0dXB0b29scy1zY21gIHJlcXVpcmVkIGFuIHVucmVsZWFzZWQgYHZjcy12ZXJz
aW9uaW5nYCwgd2hpY2ggYnJva2UgdGhlIHJlbGVhc2UgcHJvcG9zYWwgd29ya2Zsb3cuIChbIzE1
MDldKGh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNTA5KSkK
LS0tCiAuLi4tdmNzLXZlcnNpb25pbmdfMi4zLjEuYmIgPT4gcHl0aG9uMy12Y3MtdmVyc2lvbmlu
Z18yLjMuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXZj
cy12ZXJzaW9uaW5nXzIuMy4xLmJiID0+IHB5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4zLjIuYmJ9
ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXZjcy12ZXJzaW9uaW5nXzIuMy4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMy4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lvbmlu
Z18yLjMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXZjcy12ZXJzaW9uaW5nXzIuMy4yLmJiCmluZGV4IDE4MDA0NzVkZmYuLjU3ZWE2YTkyMjcgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lv
bmluZ18yLjMuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dmNzLXZlcnNpb25pbmdfMi4zLjIuYmIKQEAgLTUsNyArNSw3IEBAIGxpYnJhcnkgdGhhdCBjYW4g
YmUgdXNlZCBpbmRlcGVuZGVudGx5IG9mIHNldHVwdG9vbHMuIgogTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9YzliMDZhZDJlYmQ3ZTJl
ODJkMzRiM2NhZjM1M2U3ZDUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4MDY2MzViZDBlYTY1
M2M5NmFmOThhNzA2MjRiZTc1OGQ0MDhhOTg5ZjJjZDBiMzkwZTYzNDc0ZDk5Zjk2YjYzIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjI0YWJkZGZmOTdhZWNmNDRjZjNmZWM3MjdlYWU4ZDc2ZDljNmY3
MGY1YWNiMzlhZmM0MWY4MjRkNjlmMmFhYzUiCiAKIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8v
cnVuLXB0ZXN0IFwKLS0gCjIuNDcuMQoK

--===============1235722531246857595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.3.2.dist-info

--===============1235722531246857595==--

