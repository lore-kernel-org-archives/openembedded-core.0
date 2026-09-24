Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD52C98304
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:34:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1370.1790228074074779015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 22:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Q9rkuvyo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mzyYP3Iu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0d1e88a5e-e9a3d072-4565-4da6-a759-78570e71d704-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790228073;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0td61FU15bgikYJ9hvnaQ56sItNxti3JIa4uR87eSLo=;
	b=Q9rkuvyoNyXHv2b2ZDBihEC1IYj7zhirWhpZdUqlwB+7yqln8pArKRShIVSTJacX
	bH/TyrlD6uGC6kJUA4S6KsYl2nw0Udde1L+CzxLxDg+PLY1K8tCP+qRHJIB71+ysLml
	Jb11l4OYib4KrjPnpKLoMtDmGHDw4OWpOlppXX9o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790228073;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0td61FU15bgikYJ9hvnaQ56sItNxti3JIa4uR87eSLo=;
	b=mzyYP3Iuhe09XHQ9AR48CGxT0uqxfoJUlSVYD9Kh2GMb3UTzxr7Zqf0zeeNeWSRD
	Wjx0PlGB+jyDmWI4bAHAsQx8YTpjb7CMOxZHWckkMdtp2Va0mAeThUi/e5ywXIgYGGn
	OwLaQ3eUAt55RMPa7kpK7FCMEXEtl5/EhtoO3+2o=
Content-Type: multipart/mixed; boundary="===============7893539000075192539=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.5.0 SUCCEEDED
Message-ID: <010101a0d1e88a5e-e9a3d072-4565-4da6-a759-78570e71d704-000000@us-west-2.amazonses.com>
Date: Thu, 24 Sep 2026 05:34:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.24-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 05:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246564

--===============7893539000075192539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-2.4.0-2.5.0.patch
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
From 45150f15abe163ed7f1d174e11838f76feb1eafb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 24 Sep 2026 05:21:20 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 2.4.0 -> 2.5.0

## 2.5.0 (2026-09-23)
### Added

- Add `discover_file_workdir()`, which finds the checkout a project sits in for
  the purpose of listing files. `discover_workdir()` answers which checkout
  defines the version, scoped by `root` and `search_parent_directories`; which
  files a project ships is a separate question, and a project in a subdirectory
  of a checkout still ships that checkout's files. ([#1543]( ))

### Fixed

- Accept the `tool` keyword in `_version_missing()` again. setuptools-scm 10.1.0
  through 10.2.3 pass it and allow any `vcs-versioning<3`; since 2.4.1 removed
  it,
  a build without a detectable version failed with
  `TypeError: _version_missing() got an unexpected keyword argument 'tool'`
  instead of the `LookupError` that says how to set a version. The keyword is
  ignored; the tool is taken from the configuration's environment. ([#1550]( ))

## 2.4.1 (2026-09-16)
### Fixed

- The error raised when a `.jj/` directory is found but `jj` is not installed
  now names the environment variables that actually disable jj discovery
  (`SETUPTOOLS_SCM_DISABLE_JJ=1` / `VCS_VERSIONING_DISABLE_JJ=1`) instead of an
  unprefixed `DISABLE_JJ=1`, which was never read. ([#1537]( ))
- The "unable to detect version" error now names the environment variables the
  running integration actually reads. It previously suggested
  `SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${NORMALIZED_DIST_NAME}` unconditionally,
  which is not read by `vcs-versioning` on its own (or by any other integrator),
  and it named setuptools-scm as the failing tool regardless of which one ran.

  When the distribution name is known the suggested variable is spelled out in
  full. When it is not, the generic variables are suggested instead, with a note
  that the per-distribution `..._FOR_<DIST>` form needs a dist name to match --
  the previous message offered a `${NORMALIZED_DIST_NAME}` template that could
  never be filled in. ([#1539]( ))
- Warn when file discovery is suppressed while a VCS marker sits in the
  project directory. `scm_search_known_failed()` means an integrator already
  looked and found no checkout, so a `.git`, `.hg` or `.jj` right there
  contradicts it and the artifact is about to lose every tracked file. That
  combination was the signature of the pretend-version regression and stayed
  invisible for three releases. Parent directories are not searched, since an
  unpacked sdist inside an unrelated checkout is the case the suppression
  exists for, and roots listed in `IGNORE_VCS_ROOTS` are skipped. ([#1540]( ))

### Miscellaneous

- Environment variable names are now built in one place (`env_var_name` /
  `EnvReader.candidate_names`), shared by the lookup in `EnvReader.read` and by
  every error message that suggests a variable, so a message cannot name a
  variable the lookup would not honour.

  The "repository found in a parent directory" error no longer offers a
  `get_version(relative_to=...)` call to integrators that do not ship one; the
  remaining options are renumbered instead. ([#1539]( ))
---
 ...-vcs-versioning_2.4.0.bb => python3-vcs-versioning_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.4.0.bb => python3-vcs-versioning_2.5.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.5.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.5.0.bb
index e66a7ce7b0..16e009c16d 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.5.0.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "cc4b66c02ae4cfb51e843910024f7142464c3391bb1f7e04608578b45046891b"
+SRC_URI[sha256sum] = "956a796e31f80fe714d219d6d1df15a6bf247d10f6d851bf4b98279d0a42da55"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============7893539000075192539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info

--===============7893539000075192539==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-2.4.0-2.5.0.patch"

RnJvbSA0NTE1MGYxNWFiZTE2M2VkN2YxZDE3NGUxMTgzOGY3NmZlYjFlYWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjQgU2VwIDIwMjYgMDU6MjE6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXZjcy12ZXJzaW9uaW5nOiB1cGdyYWRlIDIuNC4wIC0+IDIuNS4wCgojIyAyLjUuMCAo
MjAyNi0wOS0yMykKIyMjIEFkZGVkCgotIEFkZCBgZGlzY292ZXJfZmlsZV93b3JrZGlyKClgLCB3
aGljaCBmaW5kcyB0aGUgY2hlY2tvdXQgYSBwcm9qZWN0IHNpdHMgaW4gZm9yCiAgdGhlIHB1cnBv
c2Ugb2YgbGlzdGluZyBmaWxlcy4gYGRpc2NvdmVyX3dvcmtkaXIoKWAgYW5zd2VycyB3aGljaCBj
aGVja291dAogIGRlZmluZXMgdGhlIHZlcnNpb24sIHNjb3BlZCBieSBgcm9vdGAgYW5kIGBzZWFy
Y2hfcGFyZW50X2RpcmVjdG9yaWVzYDsgd2hpY2gKICBmaWxlcyBhIHByb2plY3Qgc2hpcHMgaXMg
YSBzZXBhcmF0ZSBxdWVzdGlvbiwgYW5kIGEgcHJvamVjdCBpbiBhIHN1YmRpcmVjdG9yeQogIG9m
IGEgY2hlY2tvdXQgc3RpbGwgc2hpcHMgdGhhdCBjaGVja291dCdzIGZpbGVzLiAoWyMxNTQzXSgg
KSkKCiMjIyBGaXhlZAoKLSBBY2NlcHQgdGhlIGB0b29sYCBrZXl3b3JkIGluIGBfdmVyc2lvbl9t
aXNzaW5nKClgIGFnYWluLiBzZXR1cHRvb2xzLXNjbSAxMC4xLjAKICB0aHJvdWdoIDEwLjIuMyBw
YXNzIGl0IGFuZCBhbGxvdyBhbnkgYHZjcy12ZXJzaW9uaW5nPDNgOyBzaW5jZSAyLjQuMSByZW1v
dmVkCiAgaXQsCiAgYSBidWlsZCB3aXRob3V0IGEgZGV0ZWN0YWJsZSB2ZXJzaW9uIGZhaWxlZCB3
aXRoCiAgYFR5cGVFcnJvcjogX3ZlcnNpb25fbWlzc2luZygpIGdvdCBhbiB1bmV4cGVjdGVkIGtl
eXdvcmQgYXJndW1lbnQgJ3Rvb2wnYAogIGluc3RlYWQgb2YgdGhlIGBMb29rdXBFcnJvcmAgdGhh
dCBzYXlzIGhvdyB0byBzZXQgYSB2ZXJzaW9uLiBUaGUga2V5d29yZCBpcwogIGlnbm9yZWQ7IHRo
ZSB0b29sIGlzIHRha2VuIGZyb20gdGhlIGNvbmZpZ3VyYXRpb24ncyBlbnZpcm9ubWVudC4gKFsj
MTU1MF0oICkpCgojIyAyLjQuMSAoMjAyNi0wOS0xNikKIyMjIEZpeGVkCgotIFRoZSBlcnJvciBy
YWlzZWQgd2hlbiBhIGAuamovYCBkaXJlY3RvcnkgaXMgZm91bmQgYnV0IGBqamAgaXMgbm90IGlu
c3RhbGxlZAogIG5vdyBuYW1lcyB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGVzIHRoYXQgYWN0dWFs
bHkgZGlzYWJsZSBqaiBkaXNjb3ZlcnkKICAoYFNFVFVQVE9PTFNfU0NNX0RJU0FCTEVfSko9MWAg
LyBgVkNTX1ZFUlNJT05JTkdfRElTQUJMRV9KSj0xYCkgaW5zdGVhZCBvZiBhbgogIHVucHJlZml4
ZWQgYERJU0FCTEVfSko9MWAsIHdoaWNoIHdhcyBuZXZlciByZWFkLiAoWyMxNTM3XSggKSkKLSBU
aGUgInVuYWJsZSB0byBkZXRlY3QgdmVyc2lvbiIgZXJyb3Igbm93IG5hbWVzIHRoZSBlbnZpcm9u
bWVudCB2YXJpYWJsZXMgdGhlCiAgcnVubmluZyBpbnRlZ3JhdGlvbiBhY3R1YWxseSByZWFkcy4g
SXQgcHJldmlvdXNseSBzdWdnZXN0ZWQKICBgU0VUVVBUT09MU19TQ01fUFJFVEVORF9WRVJTSU9O
X0ZPUl8ke05PUk1BTElaRURfRElTVF9OQU1FfWAgdW5jb25kaXRpb25hbGx5LAogIHdoaWNoIGlz
IG5vdCByZWFkIGJ5IGB2Y3MtdmVyc2lvbmluZ2Agb24gaXRzIG93biAob3IgYnkgYW55IG90aGVy
IGludGVncmF0b3IpLAogIGFuZCBpdCBuYW1lZCBzZXR1cHRvb2xzLXNjbSBhcyB0aGUgZmFpbGlu
ZyB0b29sIHJlZ2FyZGxlc3Mgb2Ygd2hpY2ggb25lIHJhbi4KCiAgV2hlbiB0aGUgZGlzdHJpYnV0
aW9uIG5hbWUgaXMga25vd24gdGhlIHN1Z2dlc3RlZCB2YXJpYWJsZSBpcyBzcGVsbGVkIG91dCBp
bgogIGZ1bGwuIFdoZW4gaXQgaXMgbm90LCB0aGUgZ2VuZXJpYyB2YXJpYWJsZXMgYXJlIHN1Z2dl
c3RlZCBpbnN0ZWFkLCB3aXRoIGEgbm90ZQogIHRoYXQgdGhlIHBlci1kaXN0cmlidXRpb24gYC4u
Ll9GT1JfPERJU1Q+YCBmb3JtIG5lZWRzIGEgZGlzdCBuYW1lIHRvIG1hdGNoIC0tCiAgdGhlIHBy
ZXZpb3VzIG1lc3NhZ2Ugb2ZmZXJlZCBhIGAke05PUk1BTElaRURfRElTVF9OQU1FfWAgdGVtcGxh
dGUgdGhhdCBjb3VsZAogIG5ldmVyIGJlIGZpbGxlZCBpbi4gKFsjMTUzOV0oICkpCi0gV2FybiB3
aGVuIGZpbGUgZGlzY292ZXJ5IGlzIHN1cHByZXNzZWQgd2hpbGUgYSBWQ1MgbWFya2VyIHNpdHMg
aW4gdGhlCiAgcHJvamVjdCBkaXJlY3RvcnkuIGBzY21fc2VhcmNoX2tub3duX2ZhaWxlZCgpYCBt
ZWFucyBhbiBpbnRlZ3JhdG9yIGFscmVhZHkKICBsb29rZWQgYW5kIGZvdW5kIG5vIGNoZWNrb3V0
LCBzbyBhIGAuZ2l0YCwgYC5oZ2Agb3IgYC5qamAgcmlnaHQgdGhlcmUKICBjb250cmFkaWN0cyBp
dCBhbmQgdGhlIGFydGlmYWN0IGlzIGFib3V0IHRvIGxvc2UgZXZlcnkgdHJhY2tlZCBmaWxlLiBU
aGF0CiAgY29tYmluYXRpb24gd2FzIHRoZSBzaWduYXR1cmUgb2YgdGhlIHByZXRlbmQtdmVyc2lv
biByZWdyZXNzaW9uIGFuZCBzdGF5ZWQKICBpbnZpc2libGUgZm9yIHRocmVlIHJlbGVhc2VzLiBQ
YXJlbnQgZGlyZWN0b3JpZXMgYXJlIG5vdCBzZWFyY2hlZCwgc2luY2UgYW4KICB1bnBhY2tlZCBz
ZGlzdCBpbnNpZGUgYW4gdW5yZWxhdGVkIGNoZWNrb3V0IGlzIHRoZSBjYXNlIHRoZSBzdXBwcmVz
c2lvbgogIGV4aXN0cyBmb3IsIGFuZCByb290cyBsaXN0ZWQgaW4gYElHTk9SRV9WQ1NfUk9PVFNg
IGFyZSBza2lwcGVkLiAoWyMxNTQwXSggKSkKCiMjIyBNaXNjZWxsYW5lb3VzCgotIEVudmlyb25t
ZW50IHZhcmlhYmxlIG5hbWVzIGFyZSBub3cgYnVpbHQgaW4gb25lIHBsYWNlIChgZW52X3Zhcl9u
YW1lYCAvCiAgYEVudlJlYWRlci5jYW5kaWRhdGVfbmFtZXNgKSwgc2hhcmVkIGJ5IHRoZSBsb29r
dXAgaW4gYEVudlJlYWRlci5yZWFkYCBhbmQgYnkKICBldmVyeSBlcnJvciBtZXNzYWdlIHRoYXQg
c3VnZ2VzdHMgYSB2YXJpYWJsZSwgc28gYSBtZXNzYWdlIGNhbm5vdCBuYW1lIGEKICB2YXJpYWJs
ZSB0aGUgbG9va3VwIHdvdWxkIG5vdCBob25vdXIuCgogIFRoZSAicmVwb3NpdG9yeSBmb3VuZCBp
biBhIHBhcmVudCBkaXJlY3RvcnkiIGVycm9yIG5vIGxvbmdlciBvZmZlcnMgYQogIGBnZXRfdmVy
c2lvbihyZWxhdGl2ZV90bz0uLi4pYCBjYWxsIHRvIGludGVncmF0b3JzIHRoYXQgZG8gbm90IHNo
aXAgb25lOyB0aGUKICByZW1haW5pbmcgb3B0aW9ucyBhcmUgcmVudW1iZXJlZCBpbnN0ZWFkLiAo
WyMxNTM5XSggKSkKLS0tCiAuLi4tdmNzLXZlcnNpb25pbmdfMi40LjAuYmIgPT4gcHl0aG9uMy12
Y3MtdmVyc2lvbmluZ18yLjUuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3tweXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNC4wLmJiID0+IHB5dGhvbjMtdmNzLXZlcnNpb25p
bmdfMi41LjAuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy12
Y3MtdmVyc2lvbmluZ18yLjQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuNS4wLmJiCmluZGV4IGU2NmE3Y2U3YjAuLjE2
ZTAwOWMxNmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My12Y3MtdmVyc2lvbmluZ18yLjQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi41LjAuYmIKQEAgLTUsNyArNSw3IEBAIGxpYnJh
cnkgdGhhdCBjYW4gYmUgdXNlZCBpbmRlcGVuZGVudGx5IG9mIHNldHVwdG9vbHMuIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9Yzli
MDZhZDJlYmQ3ZTJlODJkMzRiM2NhZjM1M2U3ZDUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJj
YzRiNjZjMDJhZTRjZmI1MWU4NDM5MTAwMjRmNzE0MjQ2NGMzMzkxYmIxZjdlMDQ2MDg1NzhiNDUw
NDY4OTFiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk1NmE3OTZlMzFmODBmZTcxNGQyMTlkNmQx
ZGYxNWE2YmYyNDdkMTBmNmQ4NTFiZjRiOTgyNzlkMGE0MmRhNTUiCiAKIFNSQ19VUkkgKz0gIlwK
ICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKLS0gCjIuNDcuMQoK

--===============7893539000075192539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning: PV changed from "2.4.0" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.4.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.5.0.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PV changed from "2.4.0" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PV changed from "2.4.0" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PV changed from "2.4.0" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PV changed from "2.4.0" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGSIZE changed from 299016 to 311194 (+4%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PV changed from "2.4.0" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PV changed from "2.4.0" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PV changed from "2.4.0" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGSIZE changed from 815292 to 831820 (+2%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PV changed from "2.4.0" to "2.5.0"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGV changed from 2.4.0 [default] to 2.5.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.4.0.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.5.0.dist-info

--===============7893539000075192539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-vcs-versioning-changelog.txt"

## 2.5.0 (2026-09-23)
### Added

- Add `discover_file_workdir()`, which finds the checkout a project sits in for
  the purpose of listing files. `discover_workdir()` answers which checkout
  defines the version, scoped by `root` and `search_parent_directories`; which
  files a project ships is a separate question, and a project in a subdirectory
  of a checkout still ships that checkout's files. ([#1543]( ))

### Fixed

- Accept the `tool` keyword in `_version_missing()` again. setuptools-scm 10.1.0
  through 10.2.3 pass it and allow any `vcs-versioning<3`; since 2.4.1 removed
  it,
  a build without a detectable version failed with
  `TypeError: _version_missing() got an unexpected keyword argument 'tool'`
  instead of the `LookupError` that says how to set a version. The keyword is
  ignored; the tool is taken from the configuration's environment. ([#1550]( ))

## 2.4.1 (2026-09-16)
### Fixed

- The error raised when a `.jj/` directory is found but `jj` is not installed
  now names the environment variables that actually disable jj discovery
  (`SETUPTOOLS_SCM_DISABLE_JJ=1` / `VCS_VERSIONING_DISABLE_JJ=1`) instead of an
  unprefixed `DISABLE_JJ=1`, which was never read. ([#1537]( ))
- The "unable to detect version" error now names the environment variables the
  running integration actually reads. It previously suggested
  `SETUPTOOLS_SCM_PRETEND_VERSION_FOR_${NORMALIZED_DIST_NAME}` unconditionally,
  which is not read by `vcs-versioning` on its own (or by any other integrator),
  and it named setuptools-scm as the failing tool regardless of which one ran.

  When the distribution name is known the suggested variable is spelled out in
  full. When it is not, the generic variables are suggested instead, with a note
  that the per-distribution `..._FOR_<DIST>` form needs a dist name to match --
  the previous message offered a `${NORMALIZED_DIST_NAME}` template that could
  never be filled in. ([#1539]( ))
- Warn when file discovery is suppressed while a VCS marker sits in the
  project directory. `scm_search_known_failed()` means an integrator already
  looked and found no checkout, so a `.git`, `.hg` or `.jj` right there
  contradicts it and the artifact is about to lose every tracked file. That
  combination was the signature of the pretend-version regression and stayed
  invisible for three releases. Parent directories are not searched, since an
  unpacked sdist inside an unrelated checkout is the case the suppression
  exists for, and roots listed in `IGNORE_VCS_ROOTS` are skipped. ([#1540]( ))

### Miscellaneous

- Environment variable names are now built in one place (`env_var_name` /
  `EnvReader.candidate_names`), shared by the lookup in `EnvReader.read` and by
  every error message that suggests a variable, so a message cannot name a
  variable the lookup would not honour.

  The "repository found in a parent directory" error no longer offers a
  `get_version(relative_to=...)` call to integrators that do not ship one; the
  remaining options are renumbered instead. ([#1539]( ))

--===============7893539000075192539==--

