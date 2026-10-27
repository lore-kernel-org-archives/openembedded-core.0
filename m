Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12720.1793079635692073963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 22:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=keu0RTT6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EFuaCSRD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a17bdfeaef-fa4c1a98-97ab-40de-9b15-01850821a0bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793079634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1bzYPwdKY0sLpZ2jPF1s7N/lxVYrpWPWJIDHduBYaKg=;
	b=keu0RTT6MAUPLfdSJ3AZBXyP44oUMyGN65K29AjU3Vex4xlHkgxHctSRD1CkQlqy
	xbofFe+YVJkK51A1BI+/kmk6/WInzEhFoCOrZ61pZDx+jgqihwNjbCDUnjBgOn+ZB5d
	85t2qr7Dp/9UnlTw0BxV3Ya0uuNf9TH0XzbcA5J0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793079634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1bzYPwdKY0sLpZ2jPF1s7N/lxVYrpWPWJIDHduBYaKg=;
	b=EFuaCSRDwIWMZ7JbTftfOf762bzCaQkuHkzfbfsNBY49803vw7eRzZLoiZtBp+2W
	tcCiuD+J7JtLJVoPCUhwwFt3GRNbA2QYhuaT1y2ePAinQIqMq6SJwb1TFzqjbOOfJPP
	1cMN+qo0hMgDtzQCokod6TpHUTtS7DsVNQTykmqA=
Content-Type: multipart/mixed; boundary="===============0619216310488778045=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.29.4 SUCCEEDED
Message-ID: <010101a17bdfeaef-fa4c1a98-97ab-40de-9b15-01850821a0bd-000000@us-west-2.amazonses.com>
Date: Tue, 27 Oct 2026 05:40:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.27-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 05:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248709

--===============0619216310488778045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.29.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.29.2-2.29.4.patch
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
From 9b7492ab240334e4aa7065a383a66261fd801392 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 27 Oct 2026 05:34:26 +0000
Subject: [PATCH] python3-pdm: upgrade 2.29.2 -> 2.29.4

## Release v2.29.4 (2026-10-27)
### Features & Improvements

- Allow specifying `lock.format` in `pyproject.toml` via the `[tool.pdm.lock]`
  table. ([#3958]( ))

### Bug Fixes

- Import a requirements file that starts with a UTF-8 BOM, which failed with a
  `RequirementError`. ([#3937]( ))
- Treat a `Pipfile` version without an operator, such as `requests = "2.31.0"`,
  as an exact `==` pin when importing, like pipenv does, instead of failing with
  an invalid specifier error. ([#3939]( ))
- Preserve Poetry include entries targeting both source and wheel distributions
  when importing a project. ([#3941]( ))
- Preserve version and description when importing Flit projects with a `src/`
  layout or an annotated `__version__`. ([#3942]( ))
- Require `certifi>=2026.10.19`, which removes the `emSign ECC Root CA - G3`
  root whose eMudhra intermediates had their private keys compromised. ([#3944](
  ))
- `pdm outdated` no longer lists a package whose installed version is newer than
  the latest one found on the index, such as an installed pre-release or local
  build. ([#3945]( ))
- Fix `pdm lock --check` reporting an outdated lockfile when a group is declared
  in both `[dependency-groups]` and `[tool.pdm.dev-dependencies]`. ([#3947]( ))
- Show the license from `License-Expression` (PEP 639) in `pdm show` and `pdm
  list --fields licenses`. ([#3948]( ))
- Stop `pdm lock` from excluding packages from a lock target when another target
  shares its OS and architecture, e.g. manylinux and musllinux. ([#3950]( ))
- Fix a crash when a `python_version` marker compares against a wildcard version
  such as `python_version == "3.*"`. ([#3951]( ))
- Send `License-Expression` and `License-File` with the upload in `pdm publish`,
  so PyPI shows the license of PEP 639 packages. ([#3952]( ))
- Preserve the subdirectory fragment in source archive requirements when
  resolving dependencies and serializing requirement URLs. ([#3954]( ))
- Preserve archive hashes when reading pylock.toml so they remain available for
  exports. ([#3956]( ))
- Fix detection of responses served from the HTTP cache, so cached downloads and
  index pages are reported as cached again. ([#3961]( ))

### Dependencies

- Install the download dependencies of pbs-installer so Python installation
  works with its latest releases. ([#3959]( ))
- Upgrade `unearth` to `>=0.19` and migrate the HTTP client from `httpx` to
  `httpx2`. `pdm.models.session.PDMPyPIClient` and the transports in
  `pdm.pytest` are now built on `httpx2`, so plugins interacting with them
  should import `httpx2` instead of `httpx`. ([#3962]( ))

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
- Strip every leading and trailing `.`, `_` and `-` when `pdm

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../python/{python3-pdm_2.29.2.bb => python3-pdm_2.29.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.29.2.bb => python3-pdm_2.29.4.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.29.2.bb b/meta/recipes-devtools/python/python3-pdm_2.29.4.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.29.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.4.bb
index 83e9508612..2a2c6d4c82 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.29.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "bad9705e9482e7d877a53380ff25273b01e9c1d313ee6ce7b215a6562a9d8bdd"
+SRC_URI[sha256sum] = "48d013ba869b85538fea268107cd7a2c18fd91a6abf785fa4d7ed5951808582d"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============0619216310488778045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.29.2 [default] to 2.29.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.29.2" to "2.29.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.29.2 [default] to 2.29.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.29.2" to "2.29.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.29.2 [default] to 2.29.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.29.2" to "2.29.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.29.2 [default] to 2.29.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.29.2" to "2.29.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.29.2 [default] to 2.29.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.29.2" to "2.29.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.29.2 [default] to 2.29.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.29.2" to "2.29.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.29.2 [default] to 2.29.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.29.2" to "2.29.4"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2554870 to 2581866 (+1%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.29.2 [default] to 2.29.4 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.29.2" to "2.29.4"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info

--===============0619216310488778045==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.29.2-2.29.4.patch"

RnJvbSA5Yjc0OTJhYjI0MDMzNGU0YWE3MDY1YTM4M2E2NjI2MWZkODAxMzkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjcgT2N0IDIwMjYgMDU6MzQ6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI5LjIgLT4gMi4yOS40CgojIyBSZWxlYXNlIHYyLjI5LjQg
KDIwMjYtMTAtMjcpCiMjIyBGZWF0dXJlcyAmIEltcHJvdmVtZW50cwoKLSBBbGxvdyBzcGVjaWZ5
aW5nIGBsb2NrLmZvcm1hdGAgaW4gYHB5cHJvamVjdC50b21sYCB2aWEgdGhlIGBbdG9vbC5wZG0u
bG9ja11gCiAgdGFibGUuIChbIzM5NThdKCApKQoKIyMjIEJ1ZyBGaXhlcwoKLSBJbXBvcnQgYSBy
ZXF1aXJlbWVudHMgZmlsZSB0aGF0IHN0YXJ0cyB3aXRoIGEgVVRGLTggQk9NLCB3aGljaCBmYWls
ZWQgd2l0aCBhCiAgYFJlcXVpcmVtZW50RXJyb3JgLiAoWyMzOTM3XSggKSkKLSBUcmVhdCBhIGBQ
aXBmaWxlYCB2ZXJzaW9uIHdpdGhvdXQgYW4gb3BlcmF0b3IsIHN1Y2ggYXMgYHJlcXVlc3RzID0g
IjIuMzEuMCJgLAogIGFzIGFuIGV4YWN0IGA9PWAgcGluIHdoZW4gaW1wb3J0aW5nLCBsaWtlIHBp
cGVudiBkb2VzLCBpbnN0ZWFkIG9mIGZhaWxpbmcgd2l0aAogIGFuIGludmFsaWQgc3BlY2lmaWVy
IGVycm9yLiAoWyMzOTM5XSggKSkKLSBQcmVzZXJ2ZSBQb2V0cnkgaW5jbHVkZSBlbnRyaWVzIHRh
cmdldGluZyBib3RoIHNvdXJjZSBhbmQgd2hlZWwgZGlzdHJpYnV0aW9ucwogIHdoZW4gaW1wb3J0
aW5nIGEgcHJvamVjdC4gKFsjMzk0MV0oICkpCi0gUHJlc2VydmUgdmVyc2lvbiBhbmQgZGVzY3Jp
cHRpb24gd2hlbiBpbXBvcnRpbmcgRmxpdCBwcm9qZWN0cyB3aXRoIGEgYHNyYy9gCiAgbGF5b3V0
IG9yIGFuIGFubm90YXRlZCBgX192ZXJzaW9uX19gLiAoWyMzOTQyXSggKSkKLSBSZXF1aXJlIGBj
ZXJ0aWZpPj0yMDI2LjEwLjE5YCwgd2hpY2ggcmVtb3ZlcyB0aGUgYGVtU2lnbiBFQ0MgUm9vdCBD
QSAtIEczYAogIHJvb3Qgd2hvc2UgZU11ZGhyYSBpbnRlcm1lZGlhdGVzIGhhZCB0aGVpciBwcml2
YXRlIGtleXMgY29tcHJvbWlzZWQuIChbIzM5NDRdKAogICkpCi0gYHBkbSBvdXRkYXRlZGAgbm8g
bG9uZ2VyIGxpc3RzIGEgcGFja2FnZSB3aG9zZSBpbnN0YWxsZWQgdmVyc2lvbiBpcyBuZXdlciB0
aGFuCiAgdGhlIGxhdGVzdCBvbmUgZm91bmQgb24gdGhlIGluZGV4LCBzdWNoIGFzIGFuIGluc3Rh
bGxlZCBwcmUtcmVsZWFzZSBvciBsb2NhbAogIGJ1aWxkLiAoWyMzOTQ1XSggKSkKLSBGaXggYHBk
bSBsb2NrIC0tY2hlY2tgIHJlcG9ydGluZyBhbiBvdXRkYXRlZCBsb2NrZmlsZSB3aGVuIGEgZ3Jv
dXAgaXMgZGVjbGFyZWQKICBpbiBib3RoIGBbZGVwZW5kZW5jeS1ncm91cHNdYCBhbmQgYFt0b29s
LnBkbS5kZXYtZGVwZW5kZW5jaWVzXWAuIChbIzM5NDddKCApKQotIFNob3cgdGhlIGxpY2Vuc2Ug
ZnJvbSBgTGljZW5zZS1FeHByZXNzaW9uYCAoUEVQIDYzOSkgaW4gYHBkbSBzaG93YCBhbmQgYHBk
bQogIGxpc3QgLS1maWVsZHMgbGljZW5zZXNgLiAoWyMzOTQ4XSggKSkKLSBTdG9wIGBwZG0gbG9j
a2AgZnJvbSBleGNsdWRpbmcgcGFja2FnZXMgZnJvbSBhIGxvY2sgdGFyZ2V0IHdoZW4gYW5vdGhl
ciB0YXJnZXQKICBzaGFyZXMgaXRzIE9TIGFuZCBhcmNoaXRlY3R1cmUsIGUuZy4gbWFueWxpbnV4
IGFuZCBtdXNsbGludXguIChbIzM5NTBdKCApKQotIEZpeCBhIGNyYXNoIHdoZW4gYSBgcHl0aG9u
X3ZlcnNpb25gIG1hcmtlciBjb21wYXJlcyBhZ2FpbnN0IGEgd2lsZGNhcmQgdmVyc2lvbgogIHN1
Y2ggYXMgYHB5dGhvbl92ZXJzaW9uID09ICIzLioiYC4gKFsjMzk1MV0oICkpCi0gU2VuZCBgTGlj
ZW5zZS1FeHByZXNzaW9uYCBhbmQgYExpY2Vuc2UtRmlsZWAgd2l0aCB0aGUgdXBsb2FkIGluIGBw
ZG0gcHVibGlzaGAsCiAgc28gUHlQSSBzaG93cyB0aGUgbGljZW5zZSBvZiBQRVAgNjM5IHBhY2th
Z2VzLiAoWyMzOTUyXSggKSkKLSBQcmVzZXJ2ZSB0aGUgc3ViZGlyZWN0b3J5IGZyYWdtZW50IGlu
IHNvdXJjZSBhcmNoaXZlIHJlcXVpcmVtZW50cyB3aGVuCiAgcmVzb2x2aW5nIGRlcGVuZGVuY2ll
cyBhbmQgc2VyaWFsaXppbmcgcmVxdWlyZW1lbnQgVVJMcy4gKFsjMzk1NF0oICkpCi0gUHJlc2Vy
dmUgYXJjaGl2ZSBoYXNoZXMgd2hlbiByZWFkaW5nIHB5bG9jay50b21sIHNvIHRoZXkgcmVtYWlu
IGF2YWlsYWJsZSBmb3IKICBleHBvcnRzLiAoWyMzOTU2XSggKSkKLSBGaXggZGV0ZWN0aW9uIG9m
IHJlc3BvbnNlcyBzZXJ2ZWQgZnJvbSB0aGUgSFRUUCBjYWNoZSwgc28gY2FjaGVkIGRvd25sb2Fk
cyBhbmQKICBpbmRleCBwYWdlcyBhcmUgcmVwb3J0ZWQgYXMgY2FjaGVkIGFnYWluLiAoWyMzOTYx
XSggKSkKCiMjIyBEZXBlbmRlbmNpZXMKCi0gSW5zdGFsbCB0aGUgZG93bmxvYWQgZGVwZW5kZW5j
aWVzIG9mIHBicy1pbnN0YWxsZXIgc28gUHl0aG9uIGluc3RhbGxhdGlvbgogIHdvcmtzIHdpdGgg
aXRzIGxhdGVzdCByZWxlYXNlcy4gKFsjMzk1OV0oICkpCi0gVXBncmFkZSBgdW5lYXJ0aGAgdG8g
YD49MC4xOWAgYW5kIG1pZ3JhdGUgdGhlIEhUVFAgY2xpZW50IGZyb20gYGh0dHB4YCB0bwogIGBo
dHRweDJgLiBgcGRtLm1vZGVscy5zZXNzaW9uLlBETVB5UElDbGllbnRgIGFuZCB0aGUgdHJhbnNw
b3J0cyBpbgogIGBwZG0ucHl0ZXN0YCBhcmUgbm93IGJ1aWx0IG9uIGBodHRweDJgLCBzbyBwbHVn
aW5zIGludGVyYWN0aW5nIHdpdGggdGhlbQogIHNob3VsZCBpbXBvcnQgYGh0dHB4MmAgaW5zdGVh
ZCBvZiBgaHR0cHhgLiAoWyMzOTYyXSggKSkKCiMjIFJlbGVhc2UgdjIuMjkuMyAoMjAyNi0xMC0x
OSkKIyMjIEZlYXR1cmVzICYgSW1wcm92ZW1lbnRzCgotIEFkZCB0aGUgYC0tdmVudmAgb3B0aW9u
IHRvIGBwZG0gb3V0ZGF0ZWRgLCBsaWtlIHRoZSBvdGhlciBjb21tYW5kcyB0aGF0IHJlYWQKICB0
aGUgaW5zdGFsbGVkIHBhY2thZ2VzLiAoWyMzOTA0XSggKSkKCiMjIyBCdWcgRml4ZXMKCi0gRml4
IGlzb2xhdGVkIFBFUCA1MTcgYnVpbGRzIHNraXBwaW5nIHBhY2thZ2VzIHRoYXQgYXJlIG9ubHkg
dmlzaWJsZSB2aWEgdGhlCiAgaG9zdCB2ZW52J3MgYC0tc3lzdGVtLXNpdGUtcGFja2FnZXNgLiAo
WyMzODk1XSggKSkKLSBGaXggYHBkbSBpbXBvcnRgIG9mIFBvZXRyeSBwcm9qZWN0cyBkcm9wcGlu
ZyBvcHRpb25hbCBkZXBlbmRlbmNpZXMgd2hvc2UKICBleHRyYXMgZW50cnkgaXMgc3BlbGxlZCBk
aWZmZXJlbnRseSwgYW5kIGltcG9ydGluZyBvcHRpb25hbCBkZXBlbmRlbmNpZXMgd2l0aAogIG11
bHRpcGxlIGNvbnN0cmFpbnRzIGFzIHJlcXVpcmVkIG9uZXMuIChbIzM4OTldKCApKQotIEtlZXAg
dGhlIHBsYWluIHJlcXVpcmVtZW50IGluIGBwZG0gZXhwb3J0YCB3aGVuIHRoZSBzYW1lIHBhY2th
Z2UgaXMgYWxzbwogIGxvY2tlZCB3aXRoIGV4dHJhcyB1bmRlciBhIG5hcnJvd2VyIG1hcmtlciwg
c28gaXQgaXMgbm8gbG9uZ2VyIG1pc3NpbmcgZnJvbQogIGByZXF1aXJlbWVudHMudHh0YCBvbiB0
aGUgb3RoZXIgcGxhdGZvcm1zLiAoWyMzOTAwXSggKSkKLSBGaXggYHB5dGhvbl92ZXJzaW9uIDw9
ICJYLlkiYCBtYXJrZXJzIGV4Y2x1ZGluZyB0aGUgcGF0Y2ggcmVsZWFzZXMgb2YgYFguWWAsCiAg
c28gYHBkbSBpbnN0YWxsYCBza2lwcGVkIHN1Y2ggZGVwZW5kZW5jaWVzLiAoWyMzOTAyXSggKSkK
LSBGaXggZW52aXJvbm1lbnQgdmFyaWFibGVzIHNldCBieSBvbmUgdGFzayBvZiBhIGNvbXBvc2l0
ZSBzY3JpcHQsIHZpYSBgZW52YCBvcgogIGBlbnZfZmlsZWAsIGxlYWtpbmcgaW50byB0aGUgdGFz
a3MgdGhhdCBydW4gYWZ0ZXIgaXQuIChbIzM5MDNdKCApKQotIENvbnZlcnQgZmxpdCdzIGNvbW1h
LXNlcGFyYXRlZCBga2V5d29yZHNgIGFuZCBvYnNvbGV0ZSBgZGV2LXJlcXVpcmVzYCBpbnRvCiAg
dmFsaWQgUEVQIDYyMSBmaWVsZHMgd2hlbiBpbXBvcnRpbmcgYSBmbGl0IHByb2plY3QuIChbIzM5
MDddKCApKQotIEltcG9ydCBjdXN0b20gUGlwZmlsZSBwYWNrYWdlIGNhdGVnb3JpZXMsIHN1Y2gg
YXMgYFtkb2NzXWAsIGFzIGRlcGVuZGVuY3kKICBncm91cHMgaW5zdGVhZCBvZiBkcm9wcGluZyB0
aGVtLiAoWyMzOTA5XSggKSkKLSBLZWVwIGVkaXRhYmxlIHJlcXVpcmVtZW50cyBpbiBgW3Rvb2wu
cGRtLmRldi1kZXBlbmRlbmNpZXNdYCBvbiBgcGRtIGltcG9ydGAsCiAgc28gdGhlIHdyaXR0ZW4g
YFtkZXBlbmRlbmN5LWdyb3Vwc11gIHRhYmxlIHN0YXlzIHZhbGlkIHBlciBQRVAgNzM1LiAoWyMz
OTEwXSgKICApKQotIEtlZXAgUG9ldHJ5J3MgYGRldmVsb3AgPSB0cnVlYCBhcyBhbiBlZGl0YWJs
ZSByZXF1aXJlbWVudCB3aGVuIGltcG9ydGluZwogIGRlcGVuZGVuY3kgZ3JvdXBzLiAoWyMzOTEz
XSggKSkKLSBGaXggYHBkbSBpbXBvcnRgIG9mIHRoZSBwcm9qZWN0J3Mgb3duIFBvZXRyeSBgcHlw
cm9qZWN0LnRvbWxgIHdyaXRpbmcgZWFjaAogIGRlcGVuZGVuY3kgZ3JvdXAgdG8gYm90aCBgW3Rv
b2wucGRtLmRldi1kZXBlbmRlbmNpZXNdYCBhbmQgYFtkZXBlbmRlbmN5LQogIGdyb3Vwc11gLiAo
WyMzOTE1XSggKSkKLSBJbXBvcnQgUGlwZmlsZSBwYWNrYWdlcyBkZWNsYXJlZCB3aXRoIGEgYGZp
bGVgIFVSTCwgc3VjaCBhcyBge2ZpbGUgPQogICJodHRwczovLy4uLiJ9YCwgYXMgVVJMIHJlcXVp
cmVtZW50cyBpbnN0ZWFkIG9mIGRyb3BwaW5nIHRoZSBVUkwuIChbIzM5MThdKCApKQotIFByZXNl
cnZlIFBvZXRyeSBwbGF0Zm9ybSByZXN0cmljdGlvbnMgYXMgZW52aXJvbm1lbnQgbWFya2VycyB3
aGVuIGltcG9ydGluZwogIGRlcGVuZGVuY2llcy4gKFsjMzkyMF0oICkpCi0gUmVhZCBhbiBgZXhj
bHVkZS1uZXdlcmAgdGltZXN0YW1wIHdpdGhvdXQgYSBVVEMgb2Zmc2V0IGFzIFVUQywgc28gYHBk
bSBsb2NrYAogIG5vIGxvbmdlciBmYWlscyB3aXRoIGEgYFR5cGVFcnJvcmAgY29tcGFyaW5nIG5h
aXZlIGFuZCBhd2FyZSBkYXRldGltZXMuCiAgKFsjMzkyMl0oICkpCi0gRG8gbm90IHdyaXRlIGVt
cHR5IGRlcGVuZGVuY3kgZ3JvdXBzLCBzdWNoIGFzIGBkZXYgPSBbXWAgZnJvbSBhbiBlbXB0eSBg
W2Rldi0KICBwYWNrYWdlc11gIHRhYmxlLCB3aGVuIGltcG9ydGluZyBmcm9tIGFub3RoZXIgZm9y
bWF0LiAoWyMzOTI1XSggKSkKLSBTdHJpcCBldmVyeSBsZWFkaW5nIGFuZCB0cmFpbGluZyBgLmAs
IGBfYCBhbmQgYC1gIHdoZW4gYHBkbQoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVk
cyA1MDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4g
YXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9weXRob24ve3B5dGhvbjMtcGRt
XzIuMjkuMi5iYiA9PiBweXRob24zLXBkbV8yLjI5LjQuYmJ9ICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjkuMi5iYiA9PiBweXRob24zLXBkbV8y
LjI5LjQuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBkbV8yLjI5LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGRtXzIuMjkuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjkuMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI5LjQuYmIKaW5kZXgg
ODNlOTUwODYxMi4uMmEyYzZkNGM4MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBkbV8yLjI5LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBkbV8yLjI5LjQuYmIKQEAgLTQsNyArNCw3IEBAIExJQ0VOU0UgPSAi
TUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImJhZDk3MDVlOTQ4MmU3ZDg3N2E1MzM4MGZmMjUyNzNiMDFlOWMxZDMx
M2VlNmNlN2IyMTVhNjU2MmE5ZDhiZGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDhkMDEzYmE4
NjliODU1MzhmZWEyNjgxMDdjZDdhMmMxOGZkOTFhNmFiZjc4NWZhNGQ3ZWQ1OTUxODA4NTgyZCIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0KIAotLSAKMi40Ny4xCgo=

--===============0619216310488778045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info

--===============0619216310488778045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pdm-changelog.txt"

## Release v2.29.4 (2026-10-27)
### Features & Improvements

- Allow specifying `lock.format` in `pyproject.toml` via the `[tool.pdm.lock]`
  table. ([#3958]( ))

### Bug Fixes

- Import a requirements file that starts with a UTF-8 BOM, which failed with a
  `RequirementError`. ([#3937]( ))
- Treat a `Pipfile` version without an operator, such as `requests = "2.31.0"`,
  as an exact `==` pin when importing, like pipenv does, instead of failing with
  an invalid specifier error. ([#3939]( ))
- Preserve Poetry include entries targeting both source and wheel distributions
  when importing a project. ([#3941]( ))
- Preserve version and description when importing Flit projects with a `src/`
  layout or an annotated `__version__`. ([#3942]( ))
- Require `certifi>=2026.10.19`, which removes the `emSign ECC Root CA - G3`
  root whose eMudhra intermediates had their private keys compromised. ([#3944](
  ))
- `pdm outdated` no longer lists a package whose installed version is newer than
  the latest one found on the index, such as an installed pre-release or local
  build. ([#3945]( ))
- Fix `pdm lock --check` reporting an outdated lockfile when a group is declared
  in both `[dependency-groups]` and `[tool.pdm.dev-dependencies]`. ([#3947]( ))
- Show the license from `License-Expression` (PEP 639) in `pdm show` and `pdm
  list --fields licenses`. ([#3948]( ))
- Stop `pdm lock` from excluding packages from a lock target when another target
  shares its OS and architecture, e.g. manylinux and musllinux. ([#3950]( ))
- Fix a crash when a `python_version` marker compares against a wildcard version
  such as `python_version == "3.*"`. ([#3951]( ))
- Send `License-Expression` and `License-File` with the upload in `pdm publish`,
  so PyPI shows the license of PEP 639 packages. ([#3952]( ))
- Preserve the subdirectory fragment in source archive requirements when
  resolving dependencies and serializing requirement URLs. ([#3954]( ))
- Preserve archive hashes when reading pylock.toml so they remain available for
  exports. ([#3956]( ))
- Fix detection of responses served from the HTTP cache, so cached downloads and
  index pages are reported as cached again. ([#3961]( ))

### Dependencies

- Install the download dependencies of pbs-installer so Python installation
  works with its latest releases. ([#3959]( ))
- Upgrade `unearth` to `>=0.19` and migrate the HTTP client from `httpx` to
  `httpx2`. `pdm.models.session.PDMPyPIClient` and the transports in
  `pdm.pytest` are now built on `httpx2`, so plugins interacting with them
  should import `httpx2` instead of `httpx`. ([#3962]( ))

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

--===============0619216310488778045==--
