Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C9BC88E67
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 05:40:45 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13723.1789364442220361769
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 22:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eABXHwXW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0Xd6knen;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a09e6e905f-ba4aec7c-5bc9-4205-978f-f7ef0bab803f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789364441;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AMum/paZgRQTzJPcZSeT0Wpr5A7yBnBd9wkZX2mNNsQ=;
	b=eABXHwXWPIbPDW5NfxuUTGrLElVzTwoGmc0QQ9bZ9HuAw5c4jtlGrjCyinFr1GUU
	jTEVIwWZ3tKpxguw1W1ut2FPpvLPMqTIG/9gdV+4PsYvc7Mn0oz0oaSpGVkJnTgmeJO
	Nn3H+XMjNWETx2YbIJVic/hQ0p4EI9CjohDTxKGA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789364441;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AMum/paZgRQTzJPcZSeT0Wpr5A7yBnBd9wkZX2mNNsQ=;
	b=0Xd6knenWoVqdw4q1bqsidsbORCE5qAG3S/WhxGw/E03FGjruOYy5IRZjmj8S7Em
	P+PlJV0zkGeAPh8iFHwCm+drDXkI7/aYQ+prSsDPsPSVzRuIOC5pNNQmy9vCaphKHvp
	FrxryNebUiPfTUyLX88eI/oOlCAjwuRVh2ydKc5c=
Content-Type: multipart/mixed; boundary="===============8453561346291479598=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.29.1 SUCCEEDED
Message-ID: <010101a09e6e905f-ba4aec7c-5bc9-4205-978f-f7ef0bab803f-000000@us-west-2.amazonses.com>
Date: Mon, 14 Sep 2026 05:40:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.14-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245750

--===============8453561346291479598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.29.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.29.0-2.29.1.patch
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
From 1fb10767a188eb0e3af20f5aa2e8fe544f342dbf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 14 Sep 2026 05:17:08 +0000
Subject: [PATCH] python3-pdm: upgrade 2.29.0 -> 2.29.1

Source: CHANGELOG.md

## Release v2.29.1 (2026-09-14)

### Features & Improvements

- Explain missing lockfile groups and provide group-selection recovery guidance when installing, syncing, or updating groups. ([#2682](https://github.com/pdm-project/pdm/issues/2682))
- Allow package-specific overrides for `exclude-newer` resolution limits. ([#3809](https://github.com/pdm-project/pdm/issues/3809))

### Bug Fixes

- Keep the separating comma out of the operator and accept a `v` prefix when converting Poetry version constraints. ([#3860](https://github.com/pdm-project/pdm/issues/3860))
- Escape glob characters in the virtualenv lookup prefix, so a project whose directory name contains `[` or `]` can find its own virtualenv. ([#3869](https://github.com/pdm-project/pdm/issues/3869))
- Write `pyproject.toml` and lockfiles atomically to prevent interrupted writes from truncating them. ([#3870](https://github.com/pdm-project/pdm/issues/3870))
- Resolve the workspace root before making member paths relative, so a root given as a relative path or reached through a symlink no longer raises `ValueError`. ([#3874](https://github.com/pdm-project/pdm/issues/3874))
- Replace the destination of an atomic write instead of unlinking it first, so an interrupted write can no longer destroy `pyproject.toml` or the lockfile. ([#3878](https://github.com/pdm-project/pdm/issues/3878))
- Report the version part that could not be read, instead of blaming a postrelease for every parse failure. ([#3880](https://github.com/pdm-project/pdm/issues/3880))
- Keep quoted local paths that contain `` - `` when parsing requirements files. ([#3885](https://github.com/pdm-project/pdm/issues/3885))

### Documentation

- Clarify dependency command effects on project declarations, lock metadata, and installed packages in the guide and CLI help. ([#2681](https://github.com/pdm-project/pdm/issues/2681))
---
 .../python/{python3-pdm_2.29.0.bb => python3-pdm_2.29.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.29.0.bb => python3-pdm_2.29.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.29.0.bb b/meta/recipes-devtools/python/python3-pdm_2.29.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.29.0.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.1.bb
index faf9b63a3d..4520e677ee 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.29.0.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "28c520267a15d7a3921b934ec4bfc2d1dc18379fbb653bb20d8e840b2788be6b"
+SRC_URI[sha256sum] = "6bb5d893d301edb2b83d46042039634bf36c96c57cc7edad22a59521a41df9f8"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============8453561346291479598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info

--===============8453561346291479598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.29.0 [default] to 2.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.29.0" to "2.29.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.29.0 [default] to 2.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.29.0" to "2.29.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.29.0 [default] to 2.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.29.0" to "2.29.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.29.0 [default] to 2.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.29.0" to "2.29.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.29.0 [default] to 2.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.29.0" to "2.29.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.29.0 [default] to 2.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.29.0" to "2.29.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.29.0 [default] to 2.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.29.0" to "2.29.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.29.0 [default] to 2.29.1 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.29.0" to "2.29.1"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2537026 to 2554566 (+1%)
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.0.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.1.dist-info

--===============8453561346291479598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pdm-changelog.txt"

Changelog for python3-pdm: 2.29.0 -> 2.29.1
Source: CHANGELOG.md

## Release v2.29.1 (2026-09-14)

### Features & Improvements

- Explain missing lockfile groups and provide group-selection recovery guidance when installing, syncing, or updating groups. ([#2682](https://github.com/pdm-project/pdm/issues/2682))
- Allow package-specific overrides for `exclude-newer` resolution limits. ([#3809](https://github.com/pdm-project/pdm/issues/3809))

### Bug Fixes

- Keep the separating comma out of the operator and accept a `v` prefix when converting Poetry version constraints. ([#3860](https://github.com/pdm-project/pdm/issues/3860))
- Escape glob characters in the virtualenv lookup prefix, so a project whose directory name contains `[` or `]` can find its own virtualenv. ([#3869](https://github.com/pdm-project/pdm/issues/3869))
- Write `pyproject.toml` and lockfiles atomically to prevent interrupted writes from truncating them. ([#3870](https://github.com/pdm-project/pdm/issues/3870))
- Resolve the workspace root before making member paths relative, so a root given as a relative path or reached through a symlink no longer raises `ValueError`. ([#3874](https://github.com/pdm-project/pdm/issues/3874))
- Replace the destination of an atomic write instead of unlinking it first, so an interrupted write can no longer destroy `pyproject.toml` or the lockfile. ([#3878](https://github.com/pdm-project/pdm/issues/3878))
- Report the version part that could not be read, instead of blaming a postrelease for every parse failure. ([#3880](https://github.com/pdm-project/pdm/issues/3880))
- Keep quoted local paths that contain `` - `` when parsing requirements files. ([#3885](https://github.com/pdm-project/pdm/issues/3885))

### Documentation

- Clarify dependency command effects on project declarations, lock metadata, and installed packages in the guide and CLI help. ([#2681](https://github.com/pdm-project/pdm/issues/2681))

--===============8453561346291479598==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.29.0-2.29.1.patch"

RnJvbSAxZmIxMDc2N2ExODhlYjBlM2FmMjBmNWFhMmU4ZmU1NDRmMzQyZGJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTQgU2VwIDIwMjYgMDU6MTc6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI5LjAgLT4gMi4yOS4xCgpTb3VyY2U6IENIQU5HRUxPRy5t
ZAoKIyMgUmVsZWFzZSB2Mi4yOS4xICgyMDI2LTA5LTE0KQoKIyMjIEZlYXR1cmVzICYgSW1wcm92
ZW1lbnRzCgotIEV4cGxhaW4gbWlzc2luZyBsb2NrZmlsZSBncm91cHMgYW5kIHByb3ZpZGUgZ3Jv
dXAtc2VsZWN0aW9uIHJlY292ZXJ5IGd1aWRhbmNlIHdoZW4gaW5zdGFsbGluZywgc3luY2luZywg
b3IgdXBkYXRpbmcgZ3JvdXBzLiAoWyMyNjgyXShodHRwczovL2dpdGh1Yi5jb20vcGRtLXByb2pl
Y3QvcGRtL2lzc3Vlcy8yNjgyKSkKLSBBbGxvdyBwYWNrYWdlLXNwZWNpZmljIG92ZXJyaWRlcyBm
b3IgYGV4Y2x1ZGUtbmV3ZXJgIHJlc29sdXRpb24gbGltaXRzLiAoWyMzODA5XShodHRwczovL2dp
dGh1Yi5jb20vcGRtLXByb2plY3QvcGRtL2lzc3Vlcy8zODA5KSkKCiMjIyBCdWcgRml4ZXMKCi0g
S2VlcCB0aGUgc2VwYXJhdGluZyBjb21tYSBvdXQgb2YgdGhlIG9wZXJhdG9yIGFuZCBhY2NlcHQg
YSBgdmAgcHJlZml4IHdoZW4gY29udmVydGluZyBQb2V0cnkgdmVyc2lvbiBjb25zdHJhaW50cy4g
KFsjMzg2MF0oaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS9pc3N1ZXMvMzg2MCkp
Ci0gRXNjYXBlIGdsb2IgY2hhcmFjdGVycyBpbiB0aGUgdmlydHVhbGVudiBsb29rdXAgcHJlZml4
LCBzbyBhIHByb2plY3Qgd2hvc2UgZGlyZWN0b3J5IG5hbWUgY29udGFpbnMgYFtgIG9yIGBdYCBj
YW4gZmluZCBpdHMgb3duIHZpcnR1YWxlbnYuIChbIzM4NjldKGh0dHBzOi8vZ2l0aHViLmNvbS9w
ZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4NjkpKQotIFdyaXRlIGBweXByb2plY3QudG9tbGAgYW5k
IGxvY2tmaWxlcyBhdG9taWNhbGx5IHRvIHByZXZlbnQgaW50ZXJydXB0ZWQgd3JpdGVzIGZyb20g
dHJ1bmNhdGluZyB0aGVtLiAoWyMzODcwXShodHRwczovL2dpdGh1Yi5jb20vcGRtLXByb2plY3Qv
cGRtL2lzc3Vlcy8zODcwKSkKLSBSZXNvbHZlIHRoZSB3b3Jrc3BhY2Ugcm9vdCBiZWZvcmUgbWFr
aW5nIG1lbWJlciBwYXRocyByZWxhdGl2ZSwgc28gYSByb290IGdpdmVuIGFzIGEgcmVsYXRpdmUg
cGF0aCBvciByZWFjaGVkIHRocm91Z2ggYSBzeW1saW5rIG5vIGxvbmdlciByYWlzZXMgYFZhbHVl
RXJyb3JgLiAoWyMzODc0XShodHRwczovL2dpdGh1Yi5jb20vcGRtLXByb2plY3QvcGRtL2lzc3Vl
cy8zODc0KSkKLSBSZXBsYWNlIHRoZSBkZXN0aW5hdGlvbiBvZiBhbiBhdG9taWMgd3JpdGUgaW5z
dGVhZCBvZiB1bmxpbmtpbmcgaXQgZmlyc3QsIHNvIGFuIGludGVycnVwdGVkIHdyaXRlIGNhbiBu
byBsb25nZXIgZGVzdHJveSBgcHlwcm9qZWN0LnRvbWxgIG9yIHRoZSBsb2NrZmlsZS4gKFsjMzg3
OF0oaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS9pc3N1ZXMvMzg3OCkpCi0gUmVw
b3J0IHRoZSB2ZXJzaW9uIHBhcnQgdGhhdCBjb3VsZCBub3QgYmUgcmVhZCwgaW5zdGVhZCBvZiBi
bGFtaW5nIGEgcG9zdHJlbGVhc2UgZm9yIGV2ZXJ5IHBhcnNlIGZhaWx1cmUuIChbIzM4ODBdKGh0
dHBzOi8vZ2l0aHViLmNvbS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4ODApKQotIEtlZXAgcXVv
dGVkIGxvY2FsIHBhdGhzIHRoYXQgY29udGFpbiBgYCAtIGBgIHdoZW4gcGFyc2luZyByZXF1aXJl
bWVudHMgZmlsZXMuIChbIzM4ODVdKGh0dHBzOi8vZ2l0aHViLmNvbS9wZG0tcHJvamVjdC9wZG0v
aXNzdWVzLzM4ODUpKQoKIyMjIERvY3VtZW50YXRpb24KCi0gQ2xhcmlmeSBkZXBlbmRlbmN5IGNv
bW1hbmQgZWZmZWN0cyBvbiBwcm9qZWN0IGRlY2xhcmF0aW9ucywgbG9jayBtZXRhZGF0YSwgYW5k
IGluc3RhbGxlZCBwYWNrYWdlcyBpbiB0aGUgZ3VpZGUgYW5kIENMSSBoZWxwLiAoWyMyNjgxXSho
dHRwczovL2dpdGh1Yi5jb20vcGRtLXByb2plY3QvcGRtL2lzc3Vlcy8yNjgxKSkKLS0tCiAuLi4v
cHl0aG9uL3tweXRob24zLXBkbV8yLjI5LjAuYmIgPT4gcHl0aG9uMy1wZG1fMi4yOS4xLmJifSAg
ICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBkbV8yLjI5LjAu
YmIgPT4gcHl0aG9uMy1wZG1fMi4yOS4xLmJifSAoODAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yOS4wLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI5LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4
MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8y
LjI5LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
ZG1fMi4yOS4xLmJiCmluZGV4IGZhZjliNjNhM2QuLjQ1MjBlNjc3ZWUgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yOS4wLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yOS4xLmJiCkBAIC00LDcg
KzQsNyBAQCBMSUNFTlNFID0gIk1JVCIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MmViMzFhMmNjMWE3NThjMzRiNDk5ZjI4
N2RkMDRlZjIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyOGM1MjAyNjdhMTVkN2EzOTIxYjkz
NGVjNGJmYzJkMWRjMTgzNzlmYmI2NTNiYjIwZDhlODQwYjI3ODhiZTZiIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjZiYjVkODkzZDMwMWVkYjJiODNkNDYwNDIwMzk2MzRiZjM2Yzk2YzU3Y2M3ZWRh
ZDIyYTU5NTIxYTQxZGY5ZjgiCiAKIGluaGVyaXQgcHlwaSBweXRob25fcGRtCiAKLS0gCjIuNDcu
MQoK

--===============8453561346291479598==--

