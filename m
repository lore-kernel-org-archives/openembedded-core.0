Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D47C61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 05:33:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3842.1788067977266615345
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2026 22:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mxBWIpMr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BLvDMCpz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0512814b8-6d229d59-a3fd-4047-8a4b-1f8cb6fb449c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788067976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tUn4woDWM2YIq7d0bPG42FWCVAepPlHgp4LK8Svw5yg=;
	b=mxBWIpMr2sJQ9mfMAFueHqM/7YfZJuMciXHisd9SRFaLVbb+Sizics+F3yzLYbgF
	IoCM9DU7OT9tvp6oL21BYpwcTe0R7DGmmKgAX1lwoIZV01Gl9uBPRgqikPOQSZ2UTmJ
	HUpk87g1h6epPmf1hUGPHQufJ4mvhDmF8xvq1QWU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788067976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tUn4woDWM2YIq7d0bPG42FWCVAepPlHgp4LK8Svw5yg=;
	b=BLvDMCpz2MnsrtchCGrEPQYCv9wBpMzsod1Dtpr4k6CIjaUKd7/HCk5Zz2/ZcafO
	sXuUm/h1lG+y9PHhm6paX6HlGtcNhIDo5eTcKG/r5MgXHthe3KEHe+8Z5Xjhd7uSnHT
	lZBs6+hfpE8phCDZoeHiVn2EdTvt7RI8LmLcpShU=
Content-Type: multipart/mixed; boundary="===============7564846606415333013=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.29.0 SUCCEEDED
Message-ID: <010101a0512814b8-6d229d59-a3fd-4047-8a4b-1f8cb6fb449c-000000@us-west-2.amazonses.com>
Date: Sun, 30 Aug 2026 05:32:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.30-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 05:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244640

--===============7564846606415333013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.29.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.28.2-2.29.0.patch
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
From 87ada15997dac94815ff594d2aff3f4ced1c7a0c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 30 Aug 2026 05:20:35 +0000
Subject: [PATCH] python3-pdm: upgrade 2.28.2 -> 2.29.0

Source: CHANGELOG.md

## Release v2.29.0 (2026-08-29)

### Features & Improvements

- Export editable local dependencies with relative paths in requirements files. ([#3294](https://github.com/pdm-project/pdm/issues/3294))
- Extend `pdm run` with `--env`, `--env-file` and `--working-dir` options to set or override the corresponding script options dynamically. ([#3829](https://github.com/pdm-project/pdm/issues/3829))

### Bug Fixes

- Restrict a locked package to the platform it was resolved for when it doesn't belong to every lock target, so `pdm lock --platform ... --append` no longer adds entries that get installed on the other targets. ([#3261](https://github.com/pdm-project/pdm/issues/3261))
- Keep Poetry `include` entries restricted to the sdist format when importing, writing them to `tool.pdm.build.source-includes` instead of dropping them. ([#3854](https://github.com/pdm-project/pdm/issues/3854))
- Accept `--no-verify-ssl` on `pdm publish`, which was misspelled as `--no-very-ssl`. The old spelling keeps working as an alias. ([#3857](https://github.com/pdm-project/pdm/issues/3857))
- Convert Poetry tilde constraints with fewer than three components to the bounds Poetry means: `~1.2` becomes `<1.3` rather than `<2.0`, and `~1` no longer produces an invalid `~=1` specifier that aborts the import. ([#3858](https://github.com/pdm-project/pdm/issues/3858))
- Keep the separating comma out of the operator and accept a `v` prefix when converting Poetry version constraints. ([#3860](https://github.com/pdm-project/pdm/issues/3860))
- Keep importing a Poetry project when an author or maintainer entry does not fit the `Name <email>` pattern. ([#3861](https://github.com/pdm-project/pdm/issues/3861))
- Skip `requires-python` when a Pipfile `[requires]` table has no python version, instead of writing `>=None`. ([#3862](https://github.com/pdm-project/pdm/issues/3862))
- Leave the version and description empty instead of aborting when a flit module cannot be parsed. ([#3864](https://github.com/pdm-project/pdm/issues/3864))
- Respect dependency group selection options when exporting to `pylock.toml`, producing a single-use lock file that contains only the selected packages. ([#3866](https://github.com/pdm-project/pdm/issues/3866))
---
 .../python/{python3-pdm_2.28.2.bb => python3-pdm_2.29.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.28.2.bb => python3-pdm_2.29.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.28.2.bb b/meta/recipes-devtools/python/python3-pdm_2.29.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.28.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.0.bb
index 7dd74040ed..faf9b63a3d 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.28.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "dc31c1d11c2e90564207181f87ca3d6fc16ee6584d703c0a9e0c03ba287a925a"
+SRC_URI[sha256sum] = "28c520267a15d7a3921b934ec4bfc2d1dc18379fbb653bb20d8e840b2788be6b"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============7564846606415333013==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.28.2-2.29.0.patch"

RnJvbSA4N2FkYTE1OTk3ZGFjOTQ4MTVmZjU5NGQyYWZmM2Y0Y2VkMWM3YTBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMzAgQXVnIDIwMjYgMDU6MjA6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI4LjIgLT4gMi4yOS4wCgpTb3VyY2U6IENIQU5HRUxPRy5t
ZAoKIyMgUmVsZWFzZSB2Mi4yOS4wICgyMDI2LTA4LTI5KQoKIyMjIEZlYXR1cmVzICYgSW1wcm92
ZW1lbnRzCgotIEV4cG9ydCBlZGl0YWJsZSBsb2NhbCBkZXBlbmRlbmNpZXMgd2l0aCByZWxhdGl2
ZSBwYXRocyBpbiByZXF1aXJlbWVudHMgZmlsZXMuIChbIzMyOTRdKGh0dHBzOi8vZ2l0aHViLmNv
bS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzMyOTQpKQotIEV4dGVuZCBgcGRtIHJ1bmAgd2l0aCBg
LS1lbnZgLCBgLS1lbnYtZmlsZWAgYW5kIGAtLXdvcmtpbmctZGlyYCBvcHRpb25zIHRvIHNldCBv
ciBvdmVycmlkZSB0aGUgY29ycmVzcG9uZGluZyBzY3JpcHQgb3B0aW9ucyBkeW5hbWljYWxseS4g
KFsjMzgyOV0oaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS9pc3N1ZXMvMzgyOSkp
CgojIyMgQnVnIEZpeGVzCgotIFJlc3RyaWN0IGEgbG9ja2VkIHBhY2thZ2UgdG8gdGhlIHBsYXRm
b3JtIGl0IHdhcyByZXNvbHZlZCBmb3Igd2hlbiBpdCBkb2Vzbid0IGJlbG9uZyB0byBldmVyeSBs
b2NrIHRhcmdldCwgc28gYHBkbSBsb2NrIC0tcGxhdGZvcm0gLi4uIC0tYXBwZW5kYCBubyBsb25n
ZXIgYWRkcyBlbnRyaWVzIHRoYXQgZ2V0IGluc3RhbGxlZCBvbiB0aGUgb3RoZXIgdGFyZ2V0cy4g
KFsjMzI2MV0oaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS9pc3N1ZXMvMzI2MSkp
Ci0gS2VlcCBQb2V0cnkgYGluY2x1ZGVgIGVudHJpZXMgcmVzdHJpY3RlZCB0byB0aGUgc2Rpc3Qg
Zm9ybWF0IHdoZW4gaW1wb3J0aW5nLCB3cml0aW5nIHRoZW0gdG8gYHRvb2wucGRtLmJ1aWxkLnNv
dXJjZS1pbmNsdWRlc2AgaW5zdGVhZCBvZiBkcm9wcGluZyB0aGVtLiAoWyMzODU0XShodHRwczov
L2dpdGh1Yi5jb20vcGRtLXByb2plY3QvcGRtL2lzc3Vlcy8zODU0KSkKLSBBY2NlcHQgYC0tbm8t
dmVyaWZ5LXNzbGAgb24gYHBkbSBwdWJsaXNoYCwgd2hpY2ggd2FzIG1pc3NwZWxsZWQgYXMgYC0t
bm8tdmVyeS1zc2xgLiBUaGUgb2xkIHNwZWxsaW5nIGtlZXBzIHdvcmtpbmcgYXMgYW4gYWxpYXMu
IChbIzM4NTddKGh0dHBzOi8vZ2l0aHViLmNvbS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4NTcp
KQotIENvbnZlcnQgUG9ldHJ5IHRpbGRlIGNvbnN0cmFpbnRzIHdpdGggZmV3ZXIgdGhhbiB0aHJl
ZSBjb21wb25lbnRzIHRvIHRoZSBib3VuZHMgUG9ldHJ5IG1lYW5zOiBgfjEuMmAgYmVjb21lcyBg
PDEuM2AgcmF0aGVyIHRoYW4gYDwyLjBgLCBhbmQgYH4xYCBubyBsb25nZXIgcHJvZHVjZXMgYW4g
aW52YWxpZCBgfj0xYCBzcGVjaWZpZXIgdGhhdCBhYm9ydHMgdGhlIGltcG9ydC4gKFsjMzg1OF0o
aHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS9pc3N1ZXMvMzg1OCkpCi0gS2VlcCB0
aGUgc2VwYXJhdGluZyBjb21tYSBvdXQgb2YgdGhlIG9wZXJhdG9yIGFuZCBhY2NlcHQgYSBgdmAg
cHJlZml4IHdoZW4gY29udmVydGluZyBQb2V0cnkgdmVyc2lvbiBjb25zdHJhaW50cy4gKFsjMzg2
MF0oaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS9pc3N1ZXMvMzg2MCkpCi0gS2Vl
cCBpbXBvcnRpbmcgYSBQb2V0cnkgcHJvamVjdCB3aGVuIGFuIGF1dGhvciBvciBtYWludGFpbmVy
IGVudHJ5IGRvZXMgbm90IGZpdCB0aGUgYE5hbWUgPGVtYWlsPmAgcGF0dGVybi4gKFsjMzg2MV0o
aHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS9pc3N1ZXMvMzg2MSkpCi0gU2tpcCBg
cmVxdWlyZXMtcHl0aG9uYCB3aGVuIGEgUGlwZmlsZSBgW3JlcXVpcmVzXWAgdGFibGUgaGFzIG5v
IHB5dGhvbiB2ZXJzaW9uLCBpbnN0ZWFkIG9mIHdyaXRpbmcgYD49Tm9uZWAuIChbIzM4NjJdKGh0
dHBzOi8vZ2l0aHViLmNvbS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4NjIpKQotIExlYXZlIHRo
ZSB2ZXJzaW9uIGFuZCBkZXNjcmlwdGlvbiBlbXB0eSBpbnN0ZWFkIG9mIGFib3J0aW5nIHdoZW4g
YSBmbGl0IG1vZHVsZSBjYW5ub3QgYmUgcGFyc2VkLiAoWyMzODY0XShodHRwczovL2dpdGh1Yi5j
b20vcGRtLXByb2plY3QvcGRtL2lzc3Vlcy8zODY0KSkKLSBSZXNwZWN0IGRlcGVuZGVuY3kgZ3Jv
dXAgc2VsZWN0aW9uIG9wdGlvbnMgd2hlbiBleHBvcnRpbmcgdG8gYHB5bG9jay50b21sYCwgcHJv
ZHVjaW5nIGEgc2luZ2xlLXVzZSBsb2NrIGZpbGUgdGhhdCBjb250YWlucyBvbmx5IHRoZSBzZWxl
Y3RlZCBwYWNrYWdlcy4gKFsjMzg2Nl0oaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3Bk
bS9pc3N1ZXMvMzg2NikpCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yOC4yLmJiID0+
IHB5dGhvbjMtcGRtXzIuMjkuMC5iYn0gICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi97cHl0aG9uMy1wZG1fMi4yOC4yLmJiID0+IHB5dGhvbjMtcGRtXzIuMjkuMC5iYn0gKDgw
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRt
XzIuMjguMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4y
OS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjkuMC5iYgppbmRleCA3ZGQ3NDA0MGVkLi5m
YWY5YjYzYTNkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGRtXzIuMjguMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGRtXzIuMjkuMC5iYgpAQCAtNCw3ICs0LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBTRUNUSU9O
ID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZGMzMWMxZDExYzJlOTA1NjQyMDcxODFmODdjYTNkNmZjMTZlZTY1ODRkNzAzYzBhOWUwYzAz
YmEyODdhOTI1YSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyOGM1MjAyNjdhMTVkN2EzOTIxYjkz
NGVjNGJmYzJkMWRjMTgzNzlmYmI2NTNiYjIwZDhlODQwYjI3ODhiZTZiIgogCiBpbmhlcml0IHB5
cGkgcHl0aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============7564846606415333013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.28.2.tar.gz;downloadfilename=pdm-2.28.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.0.tar.gz;downloadfilename=pdm-2.29.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.28.2" to "2.29.0"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.28.2" to "2.29.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.28.2" to "2.29.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.28.2" to "2.29.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.28.2" to "2.29.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.28.2" to "2.29.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.28.2" to "2.29.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/pdm/models/search.py /usr/lib/python3.14/site-packages/pdm/models/__pycache__/search.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.28.2" to "2.29.0"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2527974 to 2537026 (+0%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.28.2 [default] to 2.29.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info
  /usr/lib/python3.14/site-packages/pdm/models/__pycache__/search.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pdm/models/search.py was removed

--===============7564846606415333013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pdm-changelog.txt"

Changelog for python3-pdm: 2.28.2 -> 2.29.0
Source: CHANGELOG.md

## Release v2.29.0 (2026-08-29)

### Features & Improvements

- Export editable local dependencies with relative paths in requirements files. ([#3294](https://github.com/pdm-project/pdm/issues/3294))
- Extend `pdm run` with `--env`, `--env-file` and `--working-dir` options to set or override the corresponding script options dynamically. ([#3829](https://github.com/pdm-project/pdm/issues/3829))

### Bug Fixes

- Restrict a locked package to the platform it was resolved for when it doesn't belong to every lock target, so `pdm lock --platform ... --append` no longer adds entries that get installed on the other targets. ([#3261](https://github.com/pdm-project/pdm/issues/3261))
- Keep Poetry `include` entries restricted to the sdist format when importing, writing them to `tool.pdm.build.source-includes` instead of dropping them. ([#3854](https://github.com/pdm-project/pdm/issues/3854))
- Accept `--no-verify-ssl` on `pdm publish`, which was misspelled as `--no-very-ssl`. The old spelling keeps working as an alias. ([#3857](https://github.com/pdm-project/pdm/issues/3857))
- Convert Poetry tilde constraints with fewer than three components to the bounds Poetry means: `~1.2` becomes `<1.3` rather than `<2.0`, and `~1` no longer produces an invalid `~=1` specifier that aborts the import. ([#3858](https://github.com/pdm-project/pdm/issues/3858))
- Keep the separating comma out of the operator and accept a `v` prefix when converting Poetry version constraints. ([#3860](https://github.com/pdm-project/pdm/issues/3860))
- Keep importing a Poetry project when an author or maintainer entry does not fit the `Name <email>` pattern. ([#3861](https://github.com/pdm-project/pdm/issues/3861))
- Skip `requires-python` when a Pipfile `[requires]` table has no python version, instead of writing `>=None`. ([#3862](https://github.com/pdm-project/pdm/issues/3862))
- Leave the version and description empty instead of aborting when a flit module cannot be parsed. ([#3864](https://github.com/pdm-project/pdm/issues/3864))
- Respect dependency group selection options when exporting to `pylock.toml`, producing a single-use lock file that contains only the selected packages. ([#3866](https://github.com/pdm-project/pdm/issues/3866))

--===============7564846606415333013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/pdm/models/search.py /usr/lib/python3.14/site-packages/pdm/models/__pycache__/search.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info
  /usr/lib/python3.14/site-packages/pdm/models/__pycache__/search.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pdm/models/search.py was removed

--===============7564846606415333013==--

