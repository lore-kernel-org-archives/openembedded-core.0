Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F150CCF2DF
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:03:02 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28522.1792389776573450058
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VgAPUNE1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MMdGQDPt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a152c181a9-f74cfb28-464d-41bc-bd06-dd00f5671939-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792389775;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kwZVXk+ytHWfnOAtNHSv4acukdjxdJMJShR5zzdkEOA=;
	b=VgAPUNE1rGOFAkTax4oJY8m7W8xmzT5m/YUxmnfShWwJl4mwg5VHuL5M3AslRJXO
	7nkb6QaR3rwNV3Zv62CmE1ho5ce4M3ziJpFsdisxldn6k3xBbMCr/bUQi6dbARYdLBE
	c7qGye+YT9epWgY1rfxHqnp/2sr1FaoFscZoLWHw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792389775;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kwZVXk+ytHWfnOAtNHSv4acukdjxdJMJShR5zzdkEOA=;
	b=MMdGQDPtqcD8UStUF6O5LmRfTQPRmitcIZYrdqRUpgMlpGyVf8HwNVeYaLrKUmmj
	aSocVw57JLo1Sk/orhn7BcTPbVNen5Bak+8VY6P+2kMpdo7n9PMSkB4qV4Zg4czig3G
	FbZ+vhzArTIaRKAstDs/7WSnqB5Ol5Vk8IcdE6CQ=
Content-Type: multipart/mixed; boundary="===============7223551490499276148=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.29.3 SUCCEEDED
Message-ID: <010101a152c181a9-f74cfb28-464d-41bc-bd06-dd00f5671939-000000@us-west-2.amazonses.com>
Date: Mon, 19 Oct 2026 06:02:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.19-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248124

--===============7223551490499276148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.29.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.29.2-2.29.3.patch
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
From 2708151d3c93a1a609b192b951bd5a9ea58f266a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 19 Oct 2026 05:41:23 +0000
Subject: [PATCH] python3-pdm: upgrade 2.29.2 -> 2.29.3

## Release v2.29.3 (2026-10-19)
### Features & Improvements

- Add the `--venv` option to `pdm outdated`, like the other commands that read
  the installed packages. ([#3904]( ))

### Bug Fixes

- Fix isolated PEP 517 builds skipping packages that are only visible via the
  host venv's `--system-site-packages`. ([#3895]( ))
- Fix `pdm import` of Poetry projects dropping optional dependencies whose
  extras entry is spelled differently, and importing optional dependencies with
  multiple constraints as required ones. ([#3899]( ))
- Keep the plain requirement in `pdm export` when the same package is also
  locked with extras under a narrower marker, so it is no longer missing from
  `requirements.txt` on the other platforms. ([#3900]( ))
- Fix `python_version <= "X.Y"` markers excluding the patch releases of `X.Y`,
  so `pdm install` skipped such dependencies. ([#3902]( ))
- Fix environment variables set by one task of a composite script, via `env` or
  `env_file`, leaking into the tasks that run after it. ([#3903]( ))
- Convert flit's comma-separated `keywords` and obsolete `dev-requires` into
  valid PEP 621 fields when importing a flit project. ([#3907]( ))
- Import custom Pipfile package categories, such as `[docs]`, as dependency
  groups instead of dropping them. ([#3909]( ))
- Keep editable requirements in `[tool.pdm.dev-dependencies]` on `pdm import`,
  so the written `[dependency-groups]` table stays valid per PEP 735. ([#3910](
  ))
- Keep Poetry's `develop = true` as an editable requirement when importing
  dependency groups. ([#3913]( ))
- Fix `pdm import` of the project's own Poetry `pyproject.toml` writing each
  dependency group to both `[tool.pdm.dev-dependencies]` and `[dependency-
  groups]`. ([#3915]( ))
- Import Pipfile packages declared with a `file` URL, such as `{file =
  "https://..."}`, as URL requirements instead of dropping the URL. ([#3918]( ))
- Preserve Poetry platform restrictions as environment markers when importing
  dependencies. ([#3920]( ))
- Read an `exclude-newer` timestamp without a UTC offset as UTC, so `pdm lock`
  no longer fails with a `TypeError` comparing naive and aware datetimes.
  ([#3922]( ))
- Do not write empty dependency groups, such as `dev = []` from an empty `[dev-
  packages]` table, when importing from another format. ([#3925]( ))
- Strip every leading and trailing `.`, `_` and `-` when `pdm init` derives the
  project name from the directory, so a folder like `__demo__` no longer
  produces the invalid name `_demo_`. ([#3927]( ))
- `pdm init` now writes `project.license` as a license expression string instead
  of a `{text = ...}` table, and no longer rewrites an existing `{file = ...}`
  table or license expression into a value the build backend rejects. ([#3929](
  ))
- Read the inline metadata of a script that starts with a UTF-8 BOM, which `pdm
  run` ignored. ([#3931]( ))
- Convert a space-separated Poetry version constraint such as `>=1.0 <2.0` like
  the comma-separated form instead of aborting the import. ([#3934]( ))
- Resolve relative `path` entries in a `Pipfile` against the directory of the
  `Pipfile` when importing, instead of the current working directory. ([#3935](
  ))

### Documentation

- Document what to cache and which install command to use when running PDM on CI
  platforms other than GitHub Actions. ([#2472]( ))
---
 .../python/{python3-pdm_2.29.2.bb => python3-pdm_2.29.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.29.2.bb => python3-pdm_2.29.3.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.29.2.bb b/meta/recipes-devtools/python/python3-pdm_2.29.3.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.29.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.3.bb
index 83e9508612..6fa7831e00 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.29.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "bad9705e9482e7d877a53380ff25273b01e9c1d313ee6ce7b215a6562a9d8bdd"
+SRC_URI[sha256sum] = "320df1661a60a4e29ce813992dcd5c8c5583c1bf27d36b713895cf38f4c49e9e"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============7223551490499276148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.3.dist-info

--===============7223551490499276148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pdm-changelog.txt"

## Release v2.29.3 (2026-10-19)
### Features & Improvements

- Add the `--venv` option to `pdm outdated`, like the other commands that read
  the installed packages. ([#3904]( ))

### Bug Fixes

- Fix isolated PEP 517 builds skipping packages that are only visible via the
  host venv's `--system-site-packages`. ([#3895]( ))
- Fix `pdm import` of Poetry projects dropping optional dependencies whose
  extras entry is spelled differently, and importing optional dependencies with
  multiple constraints as required ones. ([#3899]( ))
- Keep the plain requirement in `pdm export` when the same package is also
  locked with extras under a narrower marker, so it is no longer missing from
  `requirements.txt` on the other platforms. ([#3900]( ))
- Fix `python_version <= "X.Y"` markers excluding the patch releases of `X.Y`,
  so `pdm install` skipped such dependencies. ([#3902]( ))
- Fix environment variables set by one task of a composite script, via `env` or
  `env_file`, leaking into the tasks that run after it. ([#3903]( ))
- Convert flit's comma-separated `keywords` and obsolete `dev-requires` into
  valid PEP 621 fields when importing a flit project. ([#3907]( ))
- Import custom Pipfile package categories, such as `[docs]`, as dependency
  groups instead of dropping them. ([#3909]( ))
- Keep editable requirements in `[tool.pdm.dev-dependencies]` on `pdm import`,
  so the written `[dependency-groups]` table stays valid per PEP 735. ([#3910](
  ))
- Keep Poetry's `develop = true` as an editable requirement when importing
  dependency groups. ([#3913]( ))
- Fix `pdm import` of the project's own Poetry `pyproject.toml` writing each
  dependency group to both `[tool.pdm.dev-dependencies]` and `[dependency-
  groups]`. ([#3915]( ))
- Import Pipfile packages declared with a `file` URL, such as `{file =
  "https://..."}`, as URL requirements instead of dropping the URL. ([#3918]( ))
- Preserve Poetry platform restrictions as environment markers when importing
  dependencies. ([#3920]( ))
- Read an `exclude-newer` timestamp without a UTC offset as UTC, so `pdm lock`
  no longer fails with a `TypeError` comparing naive and aware datetimes.
  ([#3922]( ))
- Do not write empty dependency groups, such as `dev = []` from an empty `[dev-
  packages]` table, when importing from another format. ([#3925]( ))
- Strip every leading and trailing `.`, `_` and `-` when `pdm init` derives the
  project name from the directory, so a folder like `__demo__` no longer
  produces the invalid name `_demo_`. ([#3927]( ))
- `pdm init` now writes `project.license` as a license expression string instead
  of a `{text = ...}` table, and no longer rewrites an existing `{file = ...}`
  table or license expression into a value the build backend rejects. ([#3929](
  ))
- Read the inline metadata of a script that starts with a UTF-8 BOM, which `pdm
  run` ignored. ([#3931]( ))
- Convert a space-separated Poetry version constraint such as `>=1.0 <2.0` like
  the comma-separated form instead of aborting the import. ([#3934]( ))
- Resolve relative `path` entries in a `Pipfile` against the directory of the
  `Pipfile` when importing, instead of the current working directory. ([#3935](
  ))

### Documentation

- Document what to cache and which install command to use when running PDM on CI
  platforms other than GitHub Actions. ([#2472]( ))

--===============7223551490499276148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.29.2" to "2.29.3"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.29.2" to "2.29.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.29.2" to "2.29.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.29.2" to "2.29.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.29.2" to "2.29.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.29.2" to "2.29.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.29.2" to "2.29.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.29.2" to "2.29.3"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2554870 to 2573755 (+1%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.3.dist-info

--===============7223551490499276148==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.29.2-2.29.3.patch"

RnJvbSAyNzA4MTUxZDNjOTNhMWE2MDliMTkyYjk1MWJkNWE5ZWE1OGYyNjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTkgT2N0IDIwMjYgMDU6NDE6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI5LjIgLT4gMi4yOS4zCgojIyBSZWxlYXNlIHYyLjI5LjMg
KDIwMjYtMTAtMTkpCiMjIyBGZWF0dXJlcyAmIEltcHJvdmVtZW50cwoKLSBBZGQgdGhlIGAtLXZl
bnZgIG9wdGlvbiB0byBgcGRtIG91dGRhdGVkYCwgbGlrZSB0aGUgb3RoZXIgY29tbWFuZHMgdGhh
dCByZWFkCiAgdGhlIGluc3RhbGxlZCBwYWNrYWdlcy4gKFsjMzkwNF0oICkpCgojIyMgQnVnIEZp
eGVzCgotIEZpeCBpc29sYXRlZCBQRVAgNTE3IGJ1aWxkcyBza2lwcGluZyBwYWNrYWdlcyB0aGF0
IGFyZSBvbmx5IHZpc2libGUgdmlhIHRoZQogIGhvc3QgdmVudidzIGAtLXN5c3RlbS1zaXRlLXBh
Y2thZ2VzYC4gKFsjMzg5NV0oICkpCi0gRml4IGBwZG0gaW1wb3J0YCBvZiBQb2V0cnkgcHJvamVj
dHMgZHJvcHBpbmcgb3B0aW9uYWwgZGVwZW5kZW5jaWVzIHdob3NlCiAgZXh0cmFzIGVudHJ5IGlz
IHNwZWxsZWQgZGlmZmVyZW50bHksIGFuZCBpbXBvcnRpbmcgb3B0aW9uYWwgZGVwZW5kZW5jaWVz
IHdpdGgKICBtdWx0aXBsZSBjb25zdHJhaW50cyBhcyByZXF1aXJlZCBvbmVzLiAoWyMzODk5XSgg
KSkKLSBLZWVwIHRoZSBwbGFpbiByZXF1aXJlbWVudCBpbiBgcGRtIGV4cG9ydGAgd2hlbiB0aGUg
c2FtZSBwYWNrYWdlIGlzIGFsc28KICBsb2NrZWQgd2l0aCBleHRyYXMgdW5kZXIgYSBuYXJyb3dl
ciBtYXJrZXIsIHNvIGl0IGlzIG5vIGxvbmdlciBtaXNzaW5nIGZyb20KICBgcmVxdWlyZW1lbnRz
LnR4dGAgb24gdGhlIG90aGVyIHBsYXRmb3Jtcy4gKFsjMzkwMF0oICkpCi0gRml4IGBweXRob25f
dmVyc2lvbiA8PSAiWC5ZImAgbWFya2VycyBleGNsdWRpbmcgdGhlIHBhdGNoIHJlbGVhc2VzIG9m
IGBYLllgLAogIHNvIGBwZG0gaW5zdGFsbGAgc2tpcHBlZCBzdWNoIGRlcGVuZGVuY2llcy4gKFsj
MzkwMl0oICkpCi0gRml4IGVudmlyb25tZW50IHZhcmlhYmxlcyBzZXQgYnkgb25lIHRhc2sgb2Yg
YSBjb21wb3NpdGUgc2NyaXB0LCB2aWEgYGVudmAgb3IKICBgZW52X2ZpbGVgLCBsZWFraW5nIGlu
dG8gdGhlIHRhc2tzIHRoYXQgcnVuIGFmdGVyIGl0LiAoWyMzOTAzXSggKSkKLSBDb252ZXJ0IGZs
aXQncyBjb21tYS1zZXBhcmF0ZWQgYGtleXdvcmRzYCBhbmQgb2Jzb2xldGUgYGRldi1yZXF1aXJl
c2AgaW50bwogIHZhbGlkIFBFUCA2MjEgZmllbGRzIHdoZW4gaW1wb3J0aW5nIGEgZmxpdCBwcm9q
ZWN0LiAoWyMzOTA3XSggKSkKLSBJbXBvcnQgY3VzdG9tIFBpcGZpbGUgcGFja2FnZSBjYXRlZ29y
aWVzLCBzdWNoIGFzIGBbZG9jc11gLCBhcyBkZXBlbmRlbmN5CiAgZ3JvdXBzIGluc3RlYWQgb2Yg
ZHJvcHBpbmcgdGhlbS4gKFsjMzkwOV0oICkpCi0gS2VlcCBlZGl0YWJsZSByZXF1aXJlbWVudHMg
aW4gYFt0b29sLnBkbS5kZXYtZGVwZW5kZW5jaWVzXWAgb24gYHBkbSBpbXBvcnRgLAogIHNvIHRo
ZSB3cml0dGVuIGBbZGVwZW5kZW5jeS1ncm91cHNdYCB0YWJsZSBzdGF5cyB2YWxpZCBwZXIgUEVQ
IDczNS4gKFsjMzkxMF0oCiAgKSkKLSBLZWVwIFBvZXRyeSdzIGBkZXZlbG9wID0gdHJ1ZWAgYXMg
YW4gZWRpdGFibGUgcmVxdWlyZW1lbnQgd2hlbiBpbXBvcnRpbmcKICBkZXBlbmRlbmN5IGdyb3Vw
cy4gKFsjMzkxM10oICkpCi0gRml4IGBwZG0gaW1wb3J0YCBvZiB0aGUgcHJvamVjdCdzIG93biBQ
b2V0cnkgYHB5cHJvamVjdC50b21sYCB3cml0aW5nIGVhY2gKICBkZXBlbmRlbmN5IGdyb3VwIHRv
IGJvdGggYFt0b29sLnBkbS5kZXYtZGVwZW5kZW5jaWVzXWAgYW5kIGBbZGVwZW5kZW5jeS0KICBn
cm91cHNdYC4gKFsjMzkxNV0oICkpCi0gSW1wb3J0IFBpcGZpbGUgcGFja2FnZXMgZGVjbGFyZWQg
d2l0aCBhIGBmaWxlYCBVUkwsIHN1Y2ggYXMgYHtmaWxlID0KICAiaHR0cHM6Ly8uLi4ifWAsIGFz
IFVSTCByZXF1aXJlbWVudHMgaW5zdGVhZCBvZiBkcm9wcGluZyB0aGUgVVJMLiAoWyMzOTE4XSgg
KSkKLSBQcmVzZXJ2ZSBQb2V0cnkgcGxhdGZvcm0gcmVzdHJpY3Rpb25zIGFzIGVudmlyb25tZW50
IG1hcmtlcnMgd2hlbiBpbXBvcnRpbmcKICBkZXBlbmRlbmNpZXMuIChbIzM5MjBdKCApKQotIFJl
YWQgYW4gYGV4Y2x1ZGUtbmV3ZXJgIHRpbWVzdGFtcCB3aXRob3V0IGEgVVRDIG9mZnNldCBhcyBV
VEMsIHNvIGBwZG0gbG9ja2AKICBubyBsb25nZXIgZmFpbHMgd2l0aCBhIGBUeXBlRXJyb3JgIGNv
bXBhcmluZyBuYWl2ZSBhbmQgYXdhcmUgZGF0ZXRpbWVzLgogIChbIzM5MjJdKCApKQotIERvIG5v
dCB3cml0ZSBlbXB0eSBkZXBlbmRlbmN5IGdyb3Vwcywgc3VjaCBhcyBgZGV2ID0gW11gIGZyb20g
YW4gZW1wdHkgYFtkZXYtCiAgcGFja2FnZXNdYCB0YWJsZSwgd2hlbiBpbXBvcnRpbmcgZnJvbSBh
bm90aGVyIGZvcm1hdC4gKFsjMzkyNV0oICkpCi0gU3RyaXAgZXZlcnkgbGVhZGluZyBhbmQgdHJh
aWxpbmcgYC5gLCBgX2AgYW5kIGAtYCB3aGVuIGBwZG0gaW5pdGAgZGVyaXZlcyB0aGUKICBwcm9q
ZWN0IG5hbWUgZnJvbSB0aGUgZGlyZWN0b3J5LCBzbyBhIGZvbGRlciBsaWtlIGBfX2RlbW9fX2Ag
bm8gbG9uZ2VyCiAgcHJvZHVjZXMgdGhlIGludmFsaWQgbmFtZSBgX2RlbW9fYC4gKFsjMzkyN10o
ICkpCi0gYHBkbSBpbml0YCBub3cgd3JpdGVzIGBwcm9qZWN0LmxpY2Vuc2VgIGFzIGEgbGljZW5z
ZSBleHByZXNzaW9uIHN0cmluZyBpbnN0ZWFkCiAgb2YgYSBge3RleHQgPSAuLi59YCB0YWJsZSwg
YW5kIG5vIGxvbmdlciByZXdyaXRlcyBhbiBleGlzdGluZyBge2ZpbGUgPSAuLi59YAogIHRhYmxl
IG9yIGxpY2Vuc2UgZXhwcmVzc2lvbiBpbnRvIGEgdmFsdWUgdGhlIGJ1aWxkIGJhY2tlbmQgcmVq
ZWN0cy4gKFsjMzkyOV0oCiAgKSkKLSBSZWFkIHRoZSBpbmxpbmUgbWV0YWRhdGEgb2YgYSBzY3Jp
cHQgdGhhdCBzdGFydHMgd2l0aCBhIFVURi04IEJPTSwgd2hpY2ggYHBkbQogIHJ1bmAgaWdub3Jl
ZC4gKFsjMzkzMV0oICkpCi0gQ29udmVydCBhIHNwYWNlLXNlcGFyYXRlZCBQb2V0cnkgdmVyc2lv
biBjb25zdHJhaW50IHN1Y2ggYXMgYD49MS4wIDwyLjBgIGxpa2UKICB0aGUgY29tbWEtc2VwYXJh
dGVkIGZvcm0gaW5zdGVhZCBvZiBhYm9ydGluZyB0aGUgaW1wb3J0LiAoWyMzOTM0XSggKSkKLSBS
ZXNvbHZlIHJlbGF0aXZlIGBwYXRoYCBlbnRyaWVzIGluIGEgYFBpcGZpbGVgIGFnYWluc3QgdGhl
IGRpcmVjdG9yeSBvZiB0aGUKICBgUGlwZmlsZWAgd2hlbiBpbXBvcnRpbmcsIGluc3RlYWQgb2Yg
dGhlIGN1cnJlbnQgd29ya2luZyBkaXJlY3RvcnkuIChbIzM5MzVdKAogICkpCgojIyMgRG9jdW1l
bnRhdGlvbgoKLSBEb2N1bWVudCB3aGF0IHRvIGNhY2hlIGFuZCB3aGljaCBpbnN0YWxsIGNvbW1h
bmQgdG8gdXNlIHdoZW4gcnVubmluZyBQRE0gb24gQ0kKICBwbGF0Zm9ybXMgb3RoZXIgdGhhbiBH
aXRIdWIgQWN0aW9ucy4gKFsjMjQ3Ml0oICkpCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1wZG1f
Mi4yOS4yLmJiID0+IHB5dGhvbjMtcGRtXzIuMjkuMy5iYn0gICAgIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yOS4yLmJiID0+IHB5dGhvbjMtcGRtXzIu
MjkuMy5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcGRtXzIuMjkuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1wZG1fMi4yOS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yOS4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjkuMy5iYgppbmRleCA4
M2U5NTA4NjEyLi42ZmE3ODMxZTAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjkuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGRtXzIuMjkuMy5iYgpAQCAtNCw3ICs0LDcgQEAgTElDRU5TRSA9ICJN
SVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYmFkOTcwNWU5NDgyZTdkODc3YTUzMzgwZmYyNTI3M2IwMWU5YzFkMzEz
ZWU2Y2U3YjIxNWE2NTYyYTlkOGJkZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMjBkZjE2NjFh
NjBhNGUyOWNlODEzOTkyZGNkNWM4YzU1ODNjMWJmMjdkMzZiNzEzODk1Y2YzOGY0YzQ5ZTllIgog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============7223551490499276148==--

