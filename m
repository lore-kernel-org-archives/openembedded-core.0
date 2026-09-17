Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B45C982D2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:10:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33967.1789629011037217502
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=l8ro+FF/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fRC2ZEin;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0ae339118-94350f8d-c3c0-4b5f-8536-c43be5a770c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789629010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6D+4c0kGPyQjOWrGzOazXTGTyhnDPiwmHKWEDtoclYU=;
	b=l8ro+FF/F+QufNQ9NpHnRPa6kx20AiqgIctQMQvsid4zCN24pEYsmicSvz8Qwkj9
	PXKOrPewrnRbIc6/GWQeq/kPKtpxePJod2Xu3LbfMLPltSfsDauMQ0cUkwtf1XGtEWr
	oA+AlUw/ZOemkl8KHcZf3ohjVJxH2EVpZfm6Nog8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789629010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6D+4c0kGPyQjOWrGzOazXTGTyhnDPiwmHKWEDtoclYU=;
	b=fRC2ZEinPu0vooza7iG7XE1tVNZJOea0R2mzI0t+ayi8sE/Jzkns0fTfQ3mog/CC
	x3BhNvwUUdMmL/0q86D7z+Bl0PLWiRf1e/18yuN1M0vDiWth5/K9aVkWxr0GznfFRWn
	WJ4h53VM4ixi1VOVi0dZ3GDjXahxWJloID+dAZ0Y=
Content-Type: multipart/mixed; boundary="===============2937655011081174155=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.4.1 SUCCEEDED
Message-ID: <010101a0ae339118-94350f8d-c3c0-4b5f-8536-c43be5a770c6-000000@us-west-2.amazonses.com>
Date: Thu, 17 Sep 2026 07:10:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.17-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246035

--===============2937655011081174155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-2.4.0-2.4.1.patch
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
From 9b5114a27cab5acc711030f446ea6b4039012af1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 17 Sep 2026 06:21:16 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 2.4.0 -> 2.4.1

Source: CHANGELOG.md

## 2.4.1 (2026-09-16)

### Fixed

- The error raised when a `.jj/` directory is found but `jj` is not installed now names the environment variables that actually disable jj discovery (`SETUPTOOLS_SCM_DISABLE_JJ=1` / `VCS_VERSIONING_DISABLE_JJ=1`) instead of an unprefixed `DISABLE_JJ=1`, which was never read. ([#1537](https://github.com/pypa/setuptools-scm/issues/1537))
- The "unable to detect version" error now names the environment variables the
  running integration actually reads. It previously suggested
  `SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${NORMALIZED_DIST_NAME}` unconditionally,
  which is not read by `vcs-versioning` on its own (or by any other integrator),
  and it named setuptools-scm as the failing tool regardless of which one ran.

  When the distribution name is known the suggested variable is spelled out in
  full. When it is not, the generic variables are suggested instead, with a note
  that the per-distribution `..._FOR_<DIST>` form needs a dist name to match --
  the previous message offered a `${NORMALIZED_DIST_NAME}` template that could
  never be filled in. ([#1539](https://github.com/pypa/setuptools-scm/issues/1539))
- Warn when file discovery is suppressed while a VCS marker sits in the
  project directory. `scm_search_known_failed()` means an integrator already
  looked and found no checkout, so a `.git`, `.hg` or `.jj` right there
  contradicts it and the artifact is about to lose every tracked file. That
  combination was the signature of the pretend-version regression and stayed
  invisible for three releases. Parent directories are not searched, since an
  unpacked sdist inside an unrelated checkout is the case the suppression
  exists for, and roots listed in `IGNORE_VCS_ROOTS` are skipped. ([#1540](https://github.com/pypa/setuptools-scm/issues/1540))

### Miscellaneous

- Environment variable names are now built in one place (`env_var_name` /
  `EnvReader.candidate_names`), shared by the lookup in `EnvReader.read` and by
  every error message that suggests a variable, so a message cannot name a
  variable the lookup would not honour.

  The "repository found in a parent directory" error no longer offers a
  `get_version(relative_to=...)` call to integrators that do not ship one; the
  remaining options are renumbered instead. ([#1539](https://github.com/pypa/setuptools-scm/issues/1539))
---
 ...-vcs-versioning_2.4.0.bb => python3-vcs-versioning_2.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.4.0.bb => python3-vcs-versioning_2.4.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
index e66a7ce7b0..36bb2856a0 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "cc4b66c02ae4cfb51e843910024f7142464c3391bb1f7e04608578b45046891b"
+SRC_URI[sha256sum] = "d4575de3115ec9434393c87c80ffb0eb98a16056bfe2b11ce0f3a97aff67fe0a"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============2937655011081174155==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-2.4.0-2.4.1.patch"

RnJvbSA5YjUxMTRhMjdjYWI1YWNjNzExMDMwZjQ0NmVhNmI0MDM5MDEyYWYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTcgU2VwIDIwMjYgMDY6MjE6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXZjcy12ZXJzaW9uaW5nOiB1cGdyYWRlIDIuNC4wIC0+IDIuNC4xCgpTb3VyY2U6IENI
QU5HRUxPRy5tZAoKIyMgMi40LjEgKDIwMjYtMDktMTYpCgojIyMgRml4ZWQKCi0gVGhlIGVycm9y
IHJhaXNlZCB3aGVuIGEgYC5qai9gIGRpcmVjdG9yeSBpcyBmb3VuZCBidXQgYGpqYCBpcyBub3Qg
aW5zdGFsbGVkIG5vdyBuYW1lcyB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGVzIHRoYXQgYWN0dWFs
bHkgZGlzYWJsZSBqaiBkaXNjb3ZlcnkgKGBTRVRVUFRPT0xTX1NDTV9ESVNBQkxFX0pKPTFgIC8g
YFZDU19WRVJTSU9OSU5HX0RJU0FCTEVfSko9MWApIGluc3RlYWQgb2YgYW4gdW5wcmVmaXhlZCBg
RElTQUJMRV9KSj0xYCwgd2hpY2ggd2FzIG5ldmVyIHJlYWQuIChbIzE1MzddKGh0dHBzOi8vZ2l0
aHViLmNvbS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNTM3KSkKLSBUaGUgInVuYWJsZSB0
byBkZXRlY3QgdmVyc2lvbiIgZXJyb3Igbm93IG5hbWVzIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJs
ZXMgdGhlCiAgcnVubmluZyBpbnRlZ3JhdGlvbiBhY3R1YWxseSByZWFkcy4gSXQgcHJldmlvdXNs
eSBzdWdnZXN0ZWQKICBgU0VUVVBUT09MU19TQ01fUFJFVEVORF9WRVJTSU9OX0ZPUl8ke05PUk1B
TElaRURfRElTVF9OQU1FfWAgdW5jb25kaXRpb25hbGx5LAogIHdoaWNoIGlzIG5vdCByZWFkIGJ5
IGB2Y3MtdmVyc2lvbmluZ2Agb24gaXRzIG93biAob3IgYnkgYW55IG90aGVyIGludGVncmF0b3Ip
LAogIGFuZCBpdCBuYW1lZCBzZXR1cHRvb2xzLXNjbSBhcyB0aGUgZmFpbGluZyB0b29sIHJlZ2Fy
ZGxlc3Mgb2Ygd2hpY2ggb25lIHJhbi4KCiAgV2hlbiB0aGUgZGlzdHJpYnV0aW9uIG5hbWUgaXMg
a25vd24gdGhlIHN1Z2dlc3RlZCB2YXJpYWJsZSBpcyBzcGVsbGVkIG91dCBpbgogIGZ1bGwuIFdo
ZW4gaXQgaXMgbm90LCB0aGUgZ2VuZXJpYyB2YXJpYWJsZXMgYXJlIHN1Z2dlc3RlZCBpbnN0ZWFk
LCB3aXRoIGEgbm90ZQogIHRoYXQgdGhlIHBlci1kaXN0cmlidXRpb24gYC4uLl9GT1JfPERJU1Q+
YCBmb3JtIG5lZWRzIGEgZGlzdCBuYW1lIHRvIG1hdGNoIC0tCiAgdGhlIHByZXZpb3VzIG1lc3Nh
Z2Ugb2ZmZXJlZCBhIGAke05PUk1BTElaRURfRElTVF9OQU1FfWAgdGVtcGxhdGUgdGhhdCBjb3Vs
ZAogIG5ldmVyIGJlIGZpbGxlZCBpbi4gKFsjMTUzOV0oaHR0cHM6Ly9naXRodWIuY29tL3B5cGEv
c2V0dXB0b29scy1zY20vaXNzdWVzLzE1MzkpKQotIFdhcm4gd2hlbiBmaWxlIGRpc2NvdmVyeSBp
cyBzdXBwcmVzc2VkIHdoaWxlIGEgVkNTIG1hcmtlciBzaXRzIGluIHRoZQogIHByb2plY3QgZGly
ZWN0b3J5LiBgc2NtX3NlYXJjaF9rbm93bl9mYWlsZWQoKWAgbWVhbnMgYW4gaW50ZWdyYXRvciBh
bHJlYWR5CiAgbG9va2VkIGFuZCBmb3VuZCBubyBjaGVja291dCwgc28gYSBgLmdpdGAsIGAuaGdg
IG9yIGAuampgIHJpZ2h0IHRoZXJlCiAgY29udHJhZGljdHMgaXQgYW5kIHRoZSBhcnRpZmFjdCBp
cyBhYm91dCB0byBsb3NlIGV2ZXJ5IHRyYWNrZWQgZmlsZS4gVGhhdAogIGNvbWJpbmF0aW9uIHdh
cyB0aGUgc2lnbmF0dXJlIG9mIHRoZSBwcmV0ZW5kLXZlcnNpb24gcmVncmVzc2lvbiBhbmQgc3Rh
eWVkCiAgaW52aXNpYmxlIGZvciB0aHJlZSByZWxlYXNlcy4gUGFyZW50IGRpcmVjdG9yaWVzIGFy
ZSBub3Qgc2VhcmNoZWQsIHNpbmNlIGFuCiAgdW5wYWNrZWQgc2Rpc3QgaW5zaWRlIGFuIHVucmVs
YXRlZCBjaGVja291dCBpcyB0aGUgY2FzZSB0aGUgc3VwcHJlc3Npb24KICBleGlzdHMgZm9yLCBh
bmQgcm9vdHMgbGlzdGVkIGluIGBJR05PUkVfVkNTX1JPT1RTYCBhcmUgc2tpcHBlZC4gKFsjMTU0
MF0oaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvc2V0dXB0b29scy1zY20vaXNzdWVzLzE1NDApKQoK
IyMjIE1pc2NlbGxhbmVvdXMKCi0gRW52aXJvbm1lbnQgdmFyaWFibGUgbmFtZXMgYXJlIG5vdyBi
dWlsdCBpbiBvbmUgcGxhY2UgKGBlbnZfdmFyX25hbWVgIC8KICBgRW52UmVhZGVyLmNhbmRpZGF0
ZV9uYW1lc2ApLCBzaGFyZWQgYnkgdGhlIGxvb2t1cCBpbiBgRW52UmVhZGVyLnJlYWRgIGFuZCBi
eQogIGV2ZXJ5IGVycm9yIG1lc3NhZ2UgdGhhdCBzdWdnZXN0cyBhIHZhcmlhYmxlLCBzbyBhIG1l
c3NhZ2UgY2Fubm90IG5hbWUgYQogIHZhcmlhYmxlIHRoZSBsb29rdXAgd291bGQgbm90IGhvbm91
ci4KCiAgVGhlICJyZXBvc2l0b3J5IGZvdW5kIGluIGEgcGFyZW50IGRpcmVjdG9yeSIgZXJyb3Ig
bm8gbG9uZ2VyIG9mZmVycyBhCiAgYGdldF92ZXJzaW9uKHJlbGF0aXZlX3RvPS4uLilgIGNhbGwg
dG8gaW50ZWdyYXRvcnMgdGhhdCBkbyBub3Qgc2hpcCBvbmU7IHRoZQogIHJlbWFpbmluZyBvcHRp
b25zIGFyZSByZW51bWJlcmVkIGluc3RlYWQuIChbIzE1MzldKGh0dHBzOi8vZ2l0aHViLmNvbS9w
eXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNTM5KSkKLS0tCiAuLi4tdmNzLXZlcnNpb25pbmdf
Mi40LjAuYmIgPT4gcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjQuMS5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNC4wLmJiID0+
IHB5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi40LjEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNC4wLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIu
NC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjQuMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNC4xLmJi
CmluZGV4IGU2NmE3Y2U3YjAuLjM2YmIyODU2YTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjQuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi40LjEuYmIK
QEAgLTUsNyArNSw3IEBAIGxpYnJhcnkgdGhhdCBjYW4gYmUgdXNlZCBpbmRlcGVuZGVudGx5IG9m
IHNldHVwdG9vbHMuIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLnR4dDttZDU9YzliMDZhZDJlYmQ3ZTJlODJkMzRiM2NhZjM1M2U3ZDUiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJjYzRiNjZjMDJhZTRjZmI1MWU4NDM5MTAwMjRmNzE0MjQ2NGMz
MzkxYmIxZjdlMDQ2MDg1NzhiNDUwNDY4OTFiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ0NTc1
ZGUzMTE1ZWM5NDM0MzkzYzg3YzgwZmZiMGViOThhMTYwNTZiZmUyYjExY2UwZjNhOTdhZmY2N2Zl
MGEiCiAKIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKLS0gCjIuNDcuMQoK

--===============2937655011081174155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.4.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.4.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.4.1.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.4.1.dist-info

--===============2937655011081174155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.4.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.4.1.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PV changed from "2.4.0" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PV changed from "2.4.0" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PV changed from "2.4.0" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PV changed from "2.4.0" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PV changed from "2.4.0" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PV changed from "2.4.0" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGSIZE changed from 299016 to 307187 (+3%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PV changed from "2.4.0" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PV changed from "2.4.0" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PV changed from "2.4.0" to "2.4.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGSIZE changed from 815292 to 827296 (+1%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.4.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.4.1.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.4.1.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.4.1.dist-info

--===============2937655011081174155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-vcs-versioning-changelog.txt"

Changelog for python3-vcs-versioning: 2.4.0 -> 2.4.1
Source: CHANGELOG.md

## 2.4.1 (2026-09-16)

### Fixed

- The error raised when a `.jj/` directory is found but `jj` is not installed now names the environment variables that actually disable jj discovery (`SETUPTOOLS_SCM_DISABLE_JJ=1` / `VCS_VERSIONING_DISABLE_JJ=1`) instead of an unprefixed `DISABLE_JJ=1`, which was never read. ([#1537](https://github.com/pypa/setuptools-scm/issues/1537))
- The "unable to detect version" error now names the environment variables the
  running integration actually reads. It previously suggested
  `SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${NORMALIZED_DIST_NAME}` unconditionally,
  which is not read by `vcs-versioning` on its own (or by any other integrator),
  and it named setuptools-scm as the failing tool regardless of which one ran.

  When the distribution name is known the suggested variable is spelled out in
  full. When it is not, the generic variables are suggested instead, with a note
  that the per-distribution `..._FOR_<DIST>` form needs a dist name to match --
  the previous message offered a `${NORMALIZED_DIST_NAME}` template that could
  never be filled in. ([#1539](https://github.com/pypa/setuptools-scm/issues/1539))
- Warn when file discovery is suppressed while a VCS marker sits in the
  project directory. `scm_search_known_failed()` means an integrator already
  looked and found no checkout, so a `.git`, `.hg` or `.jj` right there
  contradicts it and the artifact is about to lose every tracked file. That
  combination was the signature of the pretend-version regression and stayed
  invisible for three releases. Parent directories are not searched, since an
  unpacked sdist inside an unrelated checkout is the case the suppression
  exists for, and roots listed in `IGNORE_VCS_ROOTS` are skipped. ([#1540](https://github.com/pypa/setuptools-scm/issues/1540))

### Miscellaneous

- Environment variable names are now built in one place (`env_var_name` /
  `EnvReader.candidate_names`), shared by the lookup in `EnvReader.read` and by
  every error message that suggests a variable, so a message cannot name a
  variable the lookup would not honour.

  The "repository found in a parent directory" error no longer offers a
  `get_version(relative_to=...)` call to integrators that do not ship one; the
  remaining options are renumbered instead. ([#1539](https://github.com/pypa/setuptools-scm/issues/1539))

--===============2937655011081174155==--

