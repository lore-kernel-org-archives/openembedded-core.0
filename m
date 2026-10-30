Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6324.1793344582889430502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GMbqJv3B;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LgYsxTeI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a18baab1a3-bb5a143e-ce35-4c37-949c-8a0ec5bf6837-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793344582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TFo1bVcxXZ2cYq6WjOiPhYZmqGyHH4Cmfn81v1ncCrs=;
	b=GMbqJv3BoHyWIf5Lh6c+BfxlBp6i7RjcryWnrVbDNkw7c4YDctRbxwjy3FxQ9knc
	x83GdUhFR5dDLYp6DketEV3sTGq50KVhgVWQgSzTLuYuiE5zdLY5WU0WNHhYGfChhLn
	2GpuQou6QCLwUzmop8BRcz7jDPvRqiZuWwdF8JUo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793344582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TFo1bVcxXZ2cYq6WjOiPhYZmqGyHH4Cmfn81v1ncCrs=;
	b=LgYsxTeIE0q4C48yv2S12GRJX8g60aw0y2f6hIjXXluEbwZlmU4oFgyTHdIRqe3t
	9J4Qk0pKrP4c+5hZHL57k7yQpe/19eu3z7VbXYN3LBp7tUic7Q9Ya6UJhP774WUB/47
	qkatcZSsC+PuCugh1GGhFNJjAtVMqOE6q5DFlA30=
Content-Type: multipart/mixed; boundary="===============7145730419188336557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.29.5 SUCCEEDED
Message-ID: <010101a18baab1a3-bb5a143e-ce35-4c37-949c-8a0ec5bf6837-000000@us-west-2.amazonses.com>
Date: Fri, 30 Oct 2026 07:16:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.30-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248997

--===============7145730419188336557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.29.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.29.2-2.29.5.patch
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
From 75d0fb01291874b988d6f61e58ae002262d1df92 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 30 Oct 2026 05:54:43 +0000
Subject: [PATCH] python3-pdm: upgrade 2.29.2 -> 2.29.5

## Release v2.29.5 (2026-10-30)
### Bug Fixes

- Preserve archive subdirectories when writing or exporting pylock.toml.
  ([#3964]( ))
- Preserve extras and environment markers on local, URL, Git, and workspace file
  requirements when translating dependencies for uv. ([#3965]( ))
- Preserve Git source subdirectories and encoded refs when generating, reusing,
  and reading uv lockfiles. ([#3966]( ))
- Allow sorting installed packages by optional metadata such as homepage when
  some values are missing or unknown. ([#3967]( ))
- Fill the Homepage in `pdm show` from the `Homepage` Project-URL, and stop `pdm
  show` failing on a Project-URL that contains a comma. ([#3968]( ))
- Quote the activation script path that `pdm venv activate` prints for
  PowerShell, so `Invoke-Expression (pdm venv activate)` works when the path
  contains spaces or apostrophes. ([#3970]( ))
- On Windows, quote the extra arguments of a `shell` script, and the `{args}`
  placeholder in it, for `cmd.exe` instead of with POSIX single quotes.
  ([#3971]( ))
- Omit missing package versions when exporting to `pylock.toml`. ([#3972]( ))
- Fill the Homepage in `pdm list` from the `Homepage` Project-URL when `Home-
  page` is missing or unknown. ([#3973]( ))

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
  valid PEP 621 fields when importi

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../python/{python3-pdm_2.29.2.bb => python3-pdm_2.29.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.29.2.bb => python3-pdm_2.29.5.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.29.2.bb b/meta/recipes-devtools/python/python3-pdm_2.29.5.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.29.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.5.bb
index 83e9508612..f6b789c756 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.29.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "bad9705e9482e7d877a53380ff25273b01e9c1d313ee6ce7b215a6562a9d8bdd"
+SRC_URI[sha256sum] = "39048cbf7f34cf586e2905b99a05f633fc892753d443181151787725542ee19c"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============7145730419188336557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.29.2 [default] to 2.29.5 [default]
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.5.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.29.2" to "2.29.5"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.29.2 [default] to 2.29.5 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.29.2" to "2.29.5"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.29.2 [default] to 2.29.5 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.29.2" to "2.29.5"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.29.2 [default] to 2.29.5 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.29.2" to "2.29.5"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.29.2 [default] to 2.29.5 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.29.2" to "2.29.5"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.29.2 [default] to 2.29.5 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.29.2" to "2.29.5"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.29.2 [default] to 2.29.5 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.29.2" to "2.29.5"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.5.dist-info
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.29.2 [default] to 2.29.5 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2554870 to 2590526 (+1%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.29.2" to "2.29.5"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.5.dist-info

--===============7145730419188336557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pdm-changelog.txt"

## Release v2.29.5 (2026-10-30)
### Bug Fixes

- Preserve archive subdirectories when writing or exporting pylock.toml.
  ([#3964]( ))
- Preserve extras and environment markers on local, URL, Git, and workspace file
  requirements when translating dependencies for uv. ([#3965]( ))
- Preserve Git source subdirectories and encoded refs when generating, reusing,
  and reading uv lockfiles. ([#3966]( ))
- Allow sorting installed packages by optional metadata such as homepage when
  some values are missing or unknown. ([#3967]( ))
- Fill the Homepage in `pdm show` from the `Homepage` Project-URL, and stop `pdm
  show` failing on a Project-URL that contains a comma. ([#3968]( ))
- Quote the activation script path that `pdm venv activate` prints for
  PowerShell, so `Invoke-Expression (pdm venv activate)` works when the path
  contains spaces or apostrophes. ([#3970]( ))
- On Windows, quote the extra arguments of a `shell` script, and the `{args}`
  placeholder in it, for `cmd.exe` instead of with POSIX single quotes.
  ([#3971]( ))
- Omit missing package versions when exporting to `pylock.toml`. ([#3972]( ))
- Fill the Homepage in `pdm list` from the `Homepage` Project-URL when `Home-
  page` is missing or unknown. ([#3973]( ))

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

--===============7145730419188336557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.29.2-2.29.5.patch"

RnJvbSA3NWQwZmIwMTI5MTg3NGI5ODhkNmY2MWU1OGFlMDAyMjYyZDFkZjkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzAgT2N0IDIwMjYgMDU6NTQ6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI5LjIgLT4gMi4yOS41CgojIyBSZWxlYXNlIHYyLjI5LjUg
KDIwMjYtMTAtMzApCiMjIyBCdWcgRml4ZXMKCi0gUHJlc2VydmUgYXJjaGl2ZSBzdWJkaXJlY3Rv
cmllcyB3aGVuIHdyaXRpbmcgb3IgZXhwb3J0aW5nIHB5bG9jay50b21sLgogIChbIzM5NjRdKCAp
KQotIFByZXNlcnZlIGV4dHJhcyBhbmQgZW52aXJvbm1lbnQgbWFya2VycyBvbiBsb2NhbCwgVVJM
LCBHaXQsIGFuZCB3b3Jrc3BhY2UgZmlsZQogIHJlcXVpcmVtZW50cyB3aGVuIHRyYW5zbGF0aW5n
IGRlcGVuZGVuY2llcyBmb3IgdXYuIChbIzM5NjVdKCApKQotIFByZXNlcnZlIEdpdCBzb3VyY2Ug
c3ViZGlyZWN0b3JpZXMgYW5kIGVuY29kZWQgcmVmcyB3aGVuIGdlbmVyYXRpbmcsIHJldXNpbmcs
CiAgYW5kIHJlYWRpbmcgdXYgbG9ja2ZpbGVzLiAoWyMzOTY2XSggKSkKLSBBbGxvdyBzb3J0aW5n
IGluc3RhbGxlZCBwYWNrYWdlcyBieSBvcHRpb25hbCBtZXRhZGF0YSBzdWNoIGFzIGhvbWVwYWdl
IHdoZW4KICBzb21lIHZhbHVlcyBhcmUgbWlzc2luZyBvciB1bmtub3duLiAoWyMzOTY3XSggKSkK
LSBGaWxsIHRoZSBIb21lcGFnZSBpbiBgcGRtIHNob3dgIGZyb20gdGhlIGBIb21lcGFnZWAgUHJv
amVjdC1VUkwsIGFuZCBzdG9wIGBwZG0KICBzaG93YCBmYWlsaW5nIG9uIGEgUHJvamVjdC1VUkwg
dGhhdCBjb250YWlucyBhIGNvbW1hLiAoWyMzOTY4XSggKSkKLSBRdW90ZSB0aGUgYWN0aXZhdGlv
biBzY3JpcHQgcGF0aCB0aGF0IGBwZG0gdmVudiBhY3RpdmF0ZWAgcHJpbnRzIGZvcgogIFBvd2Vy
U2hlbGwsIHNvIGBJbnZva2UtRXhwcmVzc2lvbiAocGRtIHZlbnYgYWN0aXZhdGUpYCB3b3JrcyB3
aGVuIHRoZSBwYXRoCiAgY29udGFpbnMgc3BhY2VzIG9yIGFwb3N0cm9waGVzLiAoWyMzOTcwXSgg
KSkKLSBPbiBXaW5kb3dzLCBxdW90ZSB0aGUgZXh0cmEgYXJndW1lbnRzIG9mIGEgYHNoZWxsYCBz
Y3JpcHQsIGFuZCB0aGUgYHthcmdzfWAKICBwbGFjZWhvbGRlciBpbiBpdCwgZm9yIGBjbWQuZXhl
YCBpbnN0ZWFkIG9mIHdpdGggUE9TSVggc2luZ2xlIHF1b3Rlcy4KICAoWyMzOTcxXSggKSkKLSBP
bWl0IG1pc3NpbmcgcGFja2FnZSB2ZXJzaW9ucyB3aGVuIGV4cG9ydGluZyB0byBgcHlsb2NrLnRv
bWxgLiAoWyMzOTcyXSggKSkKLSBGaWxsIHRoZSBIb21lcGFnZSBpbiBgcGRtIGxpc3RgIGZyb20g
dGhlIGBIb21lcGFnZWAgUHJvamVjdC1VUkwgd2hlbiBgSG9tZS0KICBwYWdlYCBpcyBtaXNzaW5n
IG9yIHVua25vd24uIChbIzM5NzNdKCApKQoKIyMgUmVsZWFzZSB2Mi4yOS40ICgyMDI2LTEwLTI3
KQojIyMgRmVhdHVyZXMgJiBJbXByb3ZlbWVudHMKCi0gQWxsb3cgc3BlY2lmeWluZyBgbG9jay5m
b3JtYXRgIGluIGBweXByb2plY3QudG9tbGAgdmlhIHRoZSBgW3Rvb2wucGRtLmxvY2tdYAogIHRh
YmxlLiAoWyMzOTU4XSggKSkKCiMjIyBCdWcgRml4ZXMKCi0gSW1wb3J0IGEgcmVxdWlyZW1lbnRz
IGZpbGUgdGhhdCBzdGFydHMgd2l0aCBhIFVURi04IEJPTSwgd2hpY2ggZmFpbGVkIHdpdGggYQog
IGBSZXF1aXJlbWVudEVycm9yYC4gKFsjMzkzN10oICkpCi0gVHJlYXQgYSBgUGlwZmlsZWAgdmVy
c2lvbiB3aXRob3V0IGFuIG9wZXJhdG9yLCBzdWNoIGFzIGByZXF1ZXN0cyA9ICIyLjMxLjAiYCwK
ICBhcyBhbiBleGFjdCBgPT1gIHBpbiB3aGVuIGltcG9ydGluZywgbGlrZSBwaXBlbnYgZG9lcywg
aW5zdGVhZCBvZiBmYWlsaW5nIHdpdGgKICBhbiBpbnZhbGlkIHNwZWNpZmllciBlcnJvci4gKFsj
MzkzOV0oICkpCi0gUHJlc2VydmUgUG9ldHJ5IGluY2x1ZGUgZW50cmllcyB0YXJnZXRpbmcgYm90
aCBzb3VyY2UgYW5kIHdoZWVsIGRpc3RyaWJ1dGlvbnMKICB3aGVuIGltcG9ydGluZyBhIHByb2pl
Y3QuIChbIzM5NDFdKCApKQotIFByZXNlcnZlIHZlcnNpb24gYW5kIGRlc2NyaXB0aW9uIHdoZW4g
aW1wb3J0aW5nIEZsaXQgcHJvamVjdHMgd2l0aCBhIGBzcmMvYAogIGxheW91dCBvciBhbiBhbm5v
dGF0ZWQgYF9fdmVyc2lvbl9fYC4gKFsjMzk0Ml0oICkpCi0gUmVxdWlyZSBgY2VydGlmaT49MjAy
Ni4xMC4xOWAsIHdoaWNoIHJlbW92ZXMgdGhlIGBlbVNpZ24gRUNDIFJvb3QgQ0EgLSBHM2AKICBy
b290IHdob3NlIGVNdWRocmEgaW50ZXJtZWRpYXRlcyBoYWQgdGhlaXIgcHJpdmF0ZSBrZXlzIGNv
bXByb21pc2VkLiAoWyMzOTQ0XSgKICApKQotIGBwZG0gb3V0ZGF0ZWRgIG5vIGxvbmdlciBsaXN0
cyBhIHBhY2thZ2Ugd2hvc2UgaW5zdGFsbGVkIHZlcnNpb24gaXMgbmV3ZXIgdGhhbgogIHRoZSBs
YXRlc3Qgb25lIGZvdW5kIG9uIHRoZSBpbmRleCwgc3VjaCBhcyBhbiBpbnN0YWxsZWQgcHJlLXJl
bGVhc2Ugb3IgbG9jYWwKICBidWlsZC4gKFsjMzk0NV0oICkpCi0gRml4IGBwZG0gbG9jayAtLWNo
ZWNrYCByZXBvcnRpbmcgYW4gb3V0ZGF0ZWQgbG9ja2ZpbGUgd2hlbiBhIGdyb3VwIGlzIGRlY2xh
cmVkCiAgaW4gYm90aCBgW2RlcGVuZGVuY3ktZ3JvdXBzXWAgYW5kIGBbdG9vbC5wZG0uZGV2LWRl
cGVuZGVuY2llc11gLiAoWyMzOTQ3XSggKSkKLSBTaG93IHRoZSBsaWNlbnNlIGZyb20gYExpY2Vu
c2UtRXhwcmVzc2lvbmAgKFBFUCA2MzkpIGluIGBwZG0gc2hvd2AgYW5kIGBwZG0KICBsaXN0IC0t
ZmllbGRzIGxpY2Vuc2VzYC4gKFsjMzk0OF0oICkpCi0gU3RvcCBgcGRtIGxvY2tgIGZyb20gZXhj
bHVkaW5nIHBhY2thZ2VzIGZyb20gYSBsb2NrIHRhcmdldCB3aGVuIGFub3RoZXIgdGFyZ2V0CiAg
c2hhcmVzIGl0cyBPUyBhbmQgYXJjaGl0ZWN0dXJlLCBlLmcuIG1hbnlsaW51eCBhbmQgbXVzbGxp
bnV4LiAoWyMzOTUwXSggKSkKLSBGaXggYSBjcmFzaCB3aGVuIGEgYHB5dGhvbl92ZXJzaW9uYCBt
YXJrZXIgY29tcGFyZXMgYWdhaW5zdCBhIHdpbGRjYXJkIHZlcnNpb24KICBzdWNoIGFzIGBweXRo
b25fdmVyc2lvbiA9PSAiMy4qImAuIChbIzM5NTFdKCApKQotIFNlbmQgYExpY2Vuc2UtRXhwcmVz
c2lvbmAgYW5kIGBMaWNlbnNlLUZpbGVgIHdpdGggdGhlIHVwbG9hZCBpbiBgcGRtIHB1Ymxpc2hg
LAogIHNvIFB5UEkgc2hvd3MgdGhlIGxpY2Vuc2Ugb2YgUEVQIDYzOSBwYWNrYWdlcy4gKFsjMzk1
Ml0oICkpCi0gUHJlc2VydmUgdGhlIHN1YmRpcmVjdG9yeSBmcmFnbWVudCBpbiBzb3VyY2UgYXJj
aGl2ZSByZXF1aXJlbWVudHMgd2hlbgogIHJlc29sdmluZyBkZXBlbmRlbmNpZXMgYW5kIHNlcmlh
bGl6aW5nIHJlcXVpcmVtZW50IFVSTHMuIChbIzM5NTRdKCApKQotIFByZXNlcnZlIGFyY2hpdmUg
aGFzaGVzIHdoZW4gcmVhZGluZyBweWxvY2sudG9tbCBzbyB0aGV5IHJlbWFpbiBhdmFpbGFibGUg
Zm9yCiAgZXhwb3J0cy4gKFsjMzk1Nl0oICkpCi0gRml4IGRldGVjdGlvbiBvZiByZXNwb25zZXMg
c2VydmVkIGZyb20gdGhlIEhUVFAgY2FjaGUsIHNvIGNhY2hlZCBkb3dubG9hZHMgYW5kCiAgaW5k
ZXggcGFnZXMgYXJlIHJlcG9ydGVkIGFzIGNhY2hlZCBhZ2Fpbi4gKFsjMzk2MV0oICkpCgojIyMg
RGVwZW5kZW5jaWVzCgotIEluc3RhbGwgdGhlIGRvd25sb2FkIGRlcGVuZGVuY2llcyBvZiBwYnMt
aW5zdGFsbGVyIHNvIFB5dGhvbiBpbnN0YWxsYXRpb24KICB3b3JrcyB3aXRoIGl0cyBsYXRlc3Qg
cmVsZWFzZXMuIChbIzM5NTldKCApKQotIFVwZ3JhZGUgYHVuZWFydGhgIHRvIGA+PTAuMTlgIGFu
ZCBtaWdyYXRlIHRoZSBIVFRQIGNsaWVudCBmcm9tIGBodHRweGAgdG8KICBgaHR0cHgyYC4gYHBk
bS5tb2RlbHMuc2Vzc2lvbi5QRE1QeVBJQ2xpZW50YCBhbmQgdGhlIHRyYW5zcG9ydHMgaW4KICBg
cGRtLnB5dGVzdGAgYXJlIG5vdyBidWlsdCBvbiBgaHR0cHgyYCwgc28gcGx1Z2lucyBpbnRlcmFj
dGluZyB3aXRoIHRoZW0KICBzaG91bGQgaW1wb3J0IGBodHRweDJgIGluc3RlYWQgb2YgYGh0dHB4
YC4gKFsjMzk2Ml0oICkpCgojIyBSZWxlYXNlIHYyLjI5LjMgKDIwMjYtMTAtMTkpCiMjIyBGZWF0
dXJlcyAmIEltcHJvdmVtZW50cwoKLSBBZGQgdGhlIGAtLXZlbnZgIG9wdGlvbiB0byBgcGRtIG91
dGRhdGVkYCwgbGlrZSB0aGUgb3RoZXIgY29tbWFuZHMgdGhhdCByZWFkCiAgdGhlIGluc3RhbGxl
ZCBwYWNrYWdlcy4gKFsjMzkwNF0oICkpCgojIyMgQnVnIEZpeGVzCgotIEZpeCBpc29sYXRlZCBQ
RVAgNTE3IGJ1aWxkcyBza2lwcGluZyBwYWNrYWdlcyB0aGF0IGFyZSBvbmx5IHZpc2libGUgdmlh
IHRoZQogIGhvc3QgdmVudidzIGAtLXN5c3RlbS1zaXRlLXBhY2thZ2VzYC4gKFsjMzg5NV0oICkp
Ci0gRml4IGBwZG0gaW1wb3J0YCBvZiBQb2V0cnkgcHJvamVjdHMgZHJvcHBpbmcgb3B0aW9uYWwg
ZGVwZW5kZW5jaWVzIHdob3NlCiAgZXh0cmFzIGVudHJ5IGlzIHNwZWxsZWQgZGlmZmVyZW50bHks
IGFuZCBpbXBvcnRpbmcgb3B0aW9uYWwgZGVwZW5kZW5jaWVzIHdpdGgKICBtdWx0aXBsZSBjb25z
dHJhaW50cyBhcyByZXF1aXJlZCBvbmVzLiAoWyMzODk5XSggKSkKLSBLZWVwIHRoZSBwbGFpbiBy
ZXF1aXJlbWVudCBpbiBgcGRtIGV4cG9ydGAgd2hlbiB0aGUgc2FtZSBwYWNrYWdlIGlzIGFsc28K
ICBsb2NrZWQgd2l0aCBleHRyYXMgdW5kZXIgYSBuYXJyb3dlciBtYXJrZXIsIHNvIGl0IGlzIG5v
IGxvbmdlciBtaXNzaW5nIGZyb20KICBgcmVxdWlyZW1lbnRzLnR4dGAgb24gdGhlIG90aGVyIHBs
YXRmb3Jtcy4gKFsjMzkwMF0oICkpCi0gRml4IGBweXRob25fdmVyc2lvbiA8PSAiWC5ZImAgbWFy
a2VycyBleGNsdWRpbmcgdGhlIHBhdGNoIHJlbGVhc2VzIG9mIGBYLllgLAogIHNvIGBwZG0gaW5z
dGFsbGAgc2tpcHBlZCBzdWNoIGRlcGVuZGVuY2llcy4gKFsjMzkwMl0oICkpCi0gRml4IGVudmly
b25tZW50IHZhcmlhYmxlcyBzZXQgYnkgb25lIHRhc2sgb2YgYSBjb21wb3NpdGUgc2NyaXB0LCB2
aWEgYGVudmAgb3IKICBgZW52X2ZpbGVgLCBsZWFraW5nIGludG8gdGhlIHRhc2tzIHRoYXQgcnVu
IGFmdGVyIGl0LiAoWyMzOTAzXSggKSkKLSBDb252ZXJ0IGZsaXQncyBjb21tYS1zZXBhcmF0ZWQg
YGtleXdvcmRzYCBhbmQgb2Jzb2xldGUgYGRldi1yZXF1aXJlc2AgaW50bwogIHZhbGlkIFBFUCA2
MjEgZmllbGRzIHdoZW4gaW1wb3J0aQoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVk
cyA1MDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4g
YXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9weXRob24ve3B5dGhvbjMtcGRt
XzIuMjkuMi5iYiA9PiBweXRob24zLXBkbV8yLjI5LjUuYmJ9ICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGRtXzIuMjkuMi5iYiA9PiBweXRob24zLXBkbV8y
LjI5LjUuYmJ9ICg4MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBkbV8yLjI5LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGRtXzIuMjkuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjkuMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI5LjUuYmIKaW5kZXgg
ODNlOTUwODYxMi4uZjZiNzg5Yzc1NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBkbV8yLjI5LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBkbV8yLjI5LjUuYmIKQEAgLTQsNyArNCw3IEBAIExJQ0VOU0UgPSAi
TUlUIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT0yZWIzMWEyY2MxYTc1OGMzNGI0OTlmMjg3ZGQwNGVmMiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImJhZDk3MDVlOTQ4MmU3ZDg3N2E1MzM4MGZmMjUyNzNiMDFlOWMxZDMx
M2VlNmNlN2IyMTVhNjU2MmE5ZDhiZGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzkwNDhjYmY3
ZjM0Y2Y1ODZlMjkwNWI5OWEwNWY2MzNmYzg5Mjc1M2Q0NDMxODExNTE3ODc3MjU1NDJlZTE5YyIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9wZG0KIAotLSAKMi40Ny4xCgo=

--===============7145730419188336557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.5.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.5.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.2.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.5.dist-info

--===============7145730419188336557==--
