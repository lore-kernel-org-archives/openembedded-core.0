Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.470.1793944900078027307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 22:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kThcq4Bb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RCKN37F/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a1af72cecc-d2d77fa3-993b-4a6f-aa9c-78fa645ae8c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793944899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=a3mhBwtPZlbslWJKXbOCz/2pznBha9qidarGARzD5KI=;
	b=kThcq4BbfnsDhIVu5/3rMiAYiILt7D0GNJO5ipDfHTf4Y/W9sdwWz/rX9jV48ttd
	T5VVVR+sH5mOkeQJeV8wbp7xsHdHRxBGHbtLooEjk9Z6K80ybrwR/X5+hd5TtNR/WY7
	zpp76p8+k2ZP7JiynhU3FRo+vfQg2AIUpxxb1LI4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793944899;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=a3mhBwtPZlbslWJKXbOCz/2pznBha9qidarGARzD5KI=;
	b=RCKN37F/c0z6USd/ZFbtVF4T9TsFIbx0e42Apc9R+Z1nDGOXMRI/8sPtuhgks/6X
	pW5rUA4NF9NwkTCPW+0HQhjrS0zwAYEinN0F6oKTVSL59lgXmnx0vVrvijlzMZ0vl3I
	10dwaAQLKWcVKroYHB/CBSyccQ/FJgJ1aTCKXl40=
Content-Type: multipart/mixed; boundary="===============6209996518674695145=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.29.7 SUCCEEDED
Message-ID: <010101a1af72cecc-d2d77fa3-993b-4a6f-aa9c-78fa645ae8c5-000000@us-west-2.amazonses.com>
Date: Fri, 6 Nov 2026 06:01:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.06-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249591

--===============6209996518674695145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.29.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.29.4-2.29.7.patch
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
From f2a1576f896873eaade530cee0fd9070870604f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 6 Nov 2026 05:53:25 +0000
Subject: [PATCH] python3-pdm: upgrade 2.29.4 -> 2.29.7

## Release v2.29.7 (2026-11-06)
### Bug Fixes
- Upgrade hishel to support version 2 or greater. ([#3995]( ))
## Release v2.29.6 (2026-11-05)
### Bug Fixes

- Fix the uv mode failing when `pyproject.toml` or `uv.lock` cannot be renamed,
  as happens when they are bind mounts in a container, by falling back to
  restoring their content in place. ([#3292]( ))
- Percent-encode the source username and password in the index URLs passed to
  uv, so `use_uv` works with credentials that contain characters like `#`, `/`
  or `%`. ([#3974]( ))
- Honor local wheel and sdist paths in pylock.toml, preferring them over URLs
  while preserving explicit artifact filenames. ([#3975]( ))
- Fix the Python range pdm derives from a `python_version` marker that compares
  against a three-part version, such as `python_version >= "3.8.1"`. ([#3978](
  ))
- Save prompted credentials only after a successful package upload response.
  ([#3982]( ))
- Keep the version from `pyproject.toml` or `setup.cfg` when a later `setup.cfg`
  or `setup.py` sets none, instead of resetting it to `0.0.0` while parsing
  project files. ([#3983]( ))
- Allow `pdm config` to set an explicitly provided empty string value instead of
  treating it as a read operation. ([#3984]( ))
- Fix PEP 582 setup for Bash-compatible shells when the installation path
  contains an apostrophe. ([#3986]( ))
- Remove the downloaded archive after `pdm python install` installs an
  interpreter, instead of leaving it in the temporary directory. ([#3988]( ))
- Quote Poetry platform constraints verbatim instead of using `repr()` when
  converting them to environment markers, so they stay valid under stricter
  marker string parsing. ([#3993]( ))

### Documentation
- Fix two dead links in the project and template usage docs. ([#3976]( ))
### Miscellany

- Publish releases with `pypa/gh-action-pypi-publish` to attach PEP 740
  provenance attestations on PyPI. ([#3979]( ))

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
---
 .../python/{python3-pdm_2.29.4.bb => python3-pdm_2.29.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.29.4.bb => python3-pdm_2.29.7.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.29.4.bb b/meta/recipes-devtools/python/python3-pdm_2.29.7.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.29.4.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.7.bb
index 2a2c6d4c82..49f23893c1 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.29.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "48d013ba869b85538fea268107cd7a2c18fd91a6abf785fa4d7ed5951808582d"
+SRC_URI[sha256sum] = "cc58224755ef310d2c7f0f0276782b0068da9a7d5bc70da995c1bf55c1a8296a"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============6209996518674695145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.29.4 [default] to 2.29.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.29.7.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.29.4" to "2.29.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.29.4 [default] to 2.29.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.29.4" to "2.29.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.29.4 [default] to 2.29.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.29.4" to "2.29.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.29.4 [default] to 2.29.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.29.4" to "2.29.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.29.4 [default] to 2.29.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.29.4" to "2.29.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.29.4 [default] to 2.29.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.29.4" to "2.29.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.29.4 [default] to 2.29.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.29.4" to "2.29.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.29.4 [default] to 2.29.7 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.7.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.29.4" to "2.29.7"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2581866 to 2600675 (+1%)
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.7.dist-info

--===============6209996518674695145==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.29.4-2.29.7.patch"

RnJvbSBmMmExNTc2Zjg5Njg3M2VhYWRlNTMwY2VlMGZkOTA3MDg3MDYwNGYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNiBOb3YgMjAyNiAwNTo1MzoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjkuNCAtPiAyLjI5LjcKCiMjIFJlbGVhc2UgdjIuMjkuNyAo
MjAyNi0xMS0wNikKIyMjIEJ1ZyBGaXhlcwotIFVwZ3JhZGUgaGlzaGVsIHRvIHN1cHBvcnQgdmVy
c2lvbiAyIG9yIGdyZWF0ZXIuIChbIzM5OTVdKCApKQojIyBSZWxlYXNlIHYyLjI5LjYgKDIwMjYt
MTEtMDUpCiMjIyBCdWcgRml4ZXMKCi0gRml4IHRoZSB1diBtb2RlIGZhaWxpbmcgd2hlbiBgcHlw
cm9qZWN0LnRvbWxgIG9yIGB1di5sb2NrYCBjYW5ub3QgYmUgcmVuYW1lZCwKICBhcyBoYXBwZW5z
IHdoZW4gdGhleSBhcmUgYmluZCBtb3VudHMgaW4gYSBjb250YWluZXIsIGJ5IGZhbGxpbmcgYmFj
ayB0bwogIHJlc3RvcmluZyB0aGVpciBjb250ZW50IGluIHBsYWNlLiAoWyMzMjkyXSggKSkKLSBQ
ZXJjZW50LWVuY29kZSB0aGUgc291cmNlIHVzZXJuYW1lIGFuZCBwYXNzd29yZCBpbiB0aGUgaW5k
ZXggVVJMcyBwYXNzZWQgdG8KICB1diwgc28gYHVzZV91dmAgd29ya3Mgd2l0aCBjcmVkZW50aWFs
cyB0aGF0IGNvbnRhaW4gY2hhcmFjdGVycyBsaWtlIGAjYCwgYC9gCiAgb3IgYCVgLiAoWyMzOTc0
XSggKSkKLSBIb25vciBsb2NhbCB3aGVlbCBhbmQgc2Rpc3QgcGF0aHMgaW4gcHlsb2NrLnRvbWws
IHByZWZlcnJpbmcgdGhlbSBvdmVyIFVSTHMKICB3aGlsZSBwcmVzZXJ2aW5nIGV4cGxpY2l0IGFy
dGlmYWN0IGZpbGVuYW1lcy4gKFsjMzk3NV0oICkpCi0gRml4IHRoZSBQeXRob24gcmFuZ2UgcGRt
IGRlcml2ZXMgZnJvbSBhIGBweXRob25fdmVyc2lvbmAgbWFya2VyIHRoYXQgY29tcGFyZXMKICBh
Z2FpbnN0IGEgdGhyZWUtcGFydCB2ZXJzaW9uLCBzdWNoIGFzIGBweXRob25fdmVyc2lvbiA+PSAi
My44LjEiYC4gKFsjMzk3OF0oCiAgKSkKLSBTYXZlIHByb21wdGVkIGNyZWRlbnRpYWxzIG9ubHkg
YWZ0ZXIgYSBzdWNjZXNzZnVsIHBhY2thZ2UgdXBsb2FkIHJlc3BvbnNlLgogIChbIzM5ODJdKCAp
KQotIEtlZXAgdGhlIHZlcnNpb24gZnJvbSBgcHlwcm9qZWN0LnRvbWxgIG9yIGBzZXR1cC5jZmdg
IHdoZW4gYSBsYXRlciBgc2V0dXAuY2ZnYAogIG9yIGBzZXR1cC5weWAgc2V0cyBub25lLCBpbnN0
ZWFkIG9mIHJlc2V0dGluZyBpdCB0byBgMC4wLjBgIHdoaWxlIHBhcnNpbmcKICBwcm9qZWN0IGZp
bGVzLiAoWyMzOTgzXSggKSkKLSBBbGxvdyBgcGRtIGNvbmZpZ2AgdG8gc2V0IGFuIGV4cGxpY2l0
bHkgcHJvdmlkZWQgZW1wdHkgc3RyaW5nIHZhbHVlIGluc3RlYWQgb2YKICB0cmVhdGluZyBpdCBh
cyBhIHJlYWQgb3BlcmF0aW9uLiAoWyMzOTg0XSggKSkKLSBGaXggUEVQIDU4MiBzZXR1cCBmb3Ig
QmFzaC1jb21wYXRpYmxlIHNoZWxscyB3aGVuIHRoZSBpbnN0YWxsYXRpb24gcGF0aAogIGNvbnRh
aW5zIGFuIGFwb3N0cm9waGUuIChbIzM5ODZdKCApKQotIFJlbW92ZSB0aGUgZG93bmxvYWRlZCBh
cmNoaXZlIGFmdGVyIGBwZG0gcHl0aG9uIGluc3RhbGxgIGluc3RhbGxzIGFuCiAgaW50ZXJwcmV0
ZXIsIGluc3RlYWQgb2YgbGVhdmluZyBpdCBpbiB0aGUgdGVtcG9yYXJ5IGRpcmVjdG9yeS4gKFsj
Mzk4OF0oICkpCi0gUXVvdGUgUG9ldHJ5IHBsYXRmb3JtIGNvbnN0cmFpbnRzIHZlcmJhdGltIGlu
c3RlYWQgb2YgdXNpbmcgYHJlcHIoKWAgd2hlbgogIGNvbnZlcnRpbmcgdGhlbSB0byBlbnZpcm9u
bWVudCBtYXJrZXJzLCBzbyB0aGV5IHN0YXkgdmFsaWQgdW5kZXIgc3RyaWN0ZXIKICBtYXJrZXIg
c3RyaW5nIHBhcnNpbmcuIChbIzM5OTNdKCApKQoKIyMjIERvY3VtZW50YXRpb24KLSBGaXggdHdv
IGRlYWQgbGlua3MgaW4gdGhlIHByb2plY3QgYW5kIHRlbXBsYXRlIHVzYWdlIGRvY3MuIChbIzM5
NzZdKCApKQojIyMgTWlzY2VsbGFueQoKLSBQdWJsaXNoIHJlbGVhc2VzIHdpdGggYHB5cGEvZ2gt
YWN0aW9uLXB5cGktcHVibGlzaGAgdG8gYXR0YWNoIFBFUCA3NDAKICBwcm92ZW5hbmNlIGF0dGVz
dGF0aW9ucyBvbiBQeVBJLiAoWyMzOTc5XSggKSkKCiMjIFJlbGVhc2UgdjIuMjkuNSAoMjAyNi0x
MC0zMCkKIyMjIEJ1ZyBGaXhlcwoKLSBQcmVzZXJ2ZSBhcmNoaXZlIHN1YmRpcmVjdG9yaWVzIHdo
ZW4gd3JpdGluZyBvciBleHBvcnRpbmcgcHlsb2NrLnRvbWwuCiAgKFsjMzk2NF0oICkpCi0gUHJl
c2VydmUgZXh0cmFzIGFuZCBlbnZpcm9ubWVudCBtYXJrZXJzIG9uIGxvY2FsLCBVUkwsIEdpdCwg
YW5kIHdvcmtzcGFjZSBmaWxlCiAgcmVxdWlyZW1lbnRzIHdoZW4gdHJhbnNsYXRpbmcgZGVwZW5k
ZW5jaWVzIGZvciB1di4gKFsjMzk2NV0oICkpCi0gUHJlc2VydmUgR2l0IHNvdXJjZSBzdWJkaXJl
Y3RvcmllcyBhbmQgZW5jb2RlZCByZWZzIHdoZW4gZ2VuZXJhdGluZywgcmV1c2luZywKICBhbmQg
cmVhZGluZyB1diBsb2NrZmlsZXMuIChbIzM5NjZdKCApKQotIEFsbG93IHNvcnRpbmcgaW5zdGFs
bGVkIHBhY2thZ2VzIGJ5IG9wdGlvbmFsIG1ldGFkYXRhIHN1Y2ggYXMgaG9tZXBhZ2Ugd2hlbgog
IHNvbWUgdmFsdWVzIGFyZSBtaXNzaW5nIG9yIHVua25vd24uIChbIzM5NjddKCApKQotIEZpbGwg
dGhlIEhvbWVwYWdlIGluIGBwZG0gc2hvd2AgZnJvbSB0aGUgYEhvbWVwYWdlYCBQcm9qZWN0LVVS
TCwgYW5kIHN0b3AgYHBkbQogIHNob3dgIGZhaWxpbmcgb24gYSBQcm9qZWN0LVVSTCB0aGF0IGNv
bnRhaW5zIGEgY29tbWEuIChbIzM5NjhdKCApKQotIFF1b3RlIHRoZSBhY3RpdmF0aW9uIHNjcmlw
dCBwYXRoIHRoYXQgYHBkbSB2ZW52IGFjdGl2YXRlYCBwcmludHMgZm9yCiAgUG93ZXJTaGVsbCwg
c28gYEludm9rZS1FeHByZXNzaW9uIChwZG0gdmVudiBhY3RpdmF0ZSlgIHdvcmtzIHdoZW4gdGhl
IHBhdGgKICBjb250YWlucyBzcGFjZXMgb3IgYXBvc3Ryb3BoZXMuIChbIzM5NzBdKCApKQotIE9u
IFdpbmRvd3MsIHF1b3RlIHRoZSBleHRyYSBhcmd1bWVudHMgb2YgYSBgc2hlbGxgIHNjcmlwdCwg
YW5kIHRoZSBge2FyZ3N9YAogIHBsYWNlaG9sZGVyIGluIGl0LCBmb3IgYGNtZC5leGVgIGluc3Rl
YWQgb2Ygd2l0aCBQT1NJWCBzaW5nbGUgcXVvdGVzLgogIChbIzM5NzFdKCApKQotIE9taXQgbWlz
c2luZyBwYWNrYWdlIHZlcnNpb25zIHdoZW4gZXhwb3J0aW5nIHRvIGBweWxvY2sudG9tbGAuIChb
IzM5NzJdKCApKQotIEZpbGwgdGhlIEhvbWVwYWdlIGluIGBwZG0gbGlzdGAgZnJvbSB0aGUgYEhv
bWVwYWdlYCBQcm9qZWN0LVVSTCB3aGVuIGBIb21lLQogIHBhZ2VgIGlzIG1pc3Npbmcgb3IgdW5r
bm93bi4gKFsjMzk3M10oICkpCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yOS40LmJi
ID0+IHB5dGhvbjMtcGRtXzIuMjkuNy5iYn0gICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yOS40LmJiID0+IHB5dGhvbjMtcGRtXzIuMjkuNy5iYn0g
KDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cGRtXzIuMjkuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1f
Mi4yOS43LmJiCnNpbWlsYXJpdHkgaW5kZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yOS40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjkuNy5iYgppbmRleCAyYTJjNmQ0Yzgy
Li40OWYyMzg5M2MxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGRtXzIuMjkuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGRtXzIuMjkuNy5iYgpAQCAtNCw3ICs0LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBTRUNU
SU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNDhkMDEzYmE4NjliODU1MzhmZWEyNjgxMDdjZDdhMmMxOGZkOTFhNmFiZjc4NWZhNGQ3
ZWQ1OTUxODA4NTgyZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjYzU4MjI0NzU1ZWYzMTBkMmM3
ZjBmMDI3Njc4MmIwMDY4ZGE5YTdkNWJjNzBkYTk5NWMxYmY1NWMxYTgyOTZhIgogCiBpbmhlcml0
IHB5cGkgcHl0aG9uX3BkbQogCi0tIAoyLjQ3LjEKCg==

--===============6209996518674695145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pdm-changelog.txt"

## Release v2.29.7 (2026-11-06)
### Bug Fixes
- Upgrade hishel to support version 2 or greater. ([#3995]( ))
## Release v2.29.6 (2026-11-05)
### Bug Fixes

- Fix the uv mode failing when `pyproject.toml` or `uv.lock` cannot be renamed,
  as happens when they are bind mounts in a container, by falling back to
  restoring their content in place. ([#3292]( ))
- Percent-encode the source username and password in the index URLs passed to
  uv, so `use_uv` works with credentials that contain characters like `#`, `/`
  or `%`. ([#3974]( ))
- Honor local wheel and sdist paths in pylock.toml, preferring them over URLs
  while preserving explicit artifact filenames. ([#3975]( ))
- Fix the Python range pdm derives from a `python_version` marker that compares
  against a three-part version, such as `python_version >= "3.8.1"`. ([#3978](
  ))
- Save prompted credentials only after a successful package upload response.
  ([#3982]( ))
- Keep the version from `pyproject.toml` or `setup.cfg` when a later `setup.cfg`
  or `setup.py` sets none, instead of resetting it to `0.0.0` while parsing
  project files. ([#3983]( ))
- Allow `pdm config` to set an explicitly provided empty string value instead of
  treating it as a read operation. ([#3984]( ))
- Fix PEP 582 setup for Bash-compatible shells when the installation path
  contains an apostrophe. ([#3986]( ))
- Remove the downloaded archive after `pdm python install` installs an
  interpreter, instead of leaving it in the temporary directory. ([#3988]( ))
- Quote Poetry platform constraints verbatim instead of using `repr()` when
  converting them to environment markers, so they stay valid under stricter
  marker string parsing. ([#3993]( ))

### Documentation
- Fix two dead links in the project and template usage docs. ([#3976]( ))
### Miscellany

- Publish releases with `pypa/gh-action-pypi-publish` to attach PEP 740
  provenance attestations on PyPI. ([#3979]( ))

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

--===============6209996518674695145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.29.7.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.29.7.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.29.4.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.29.7.dist-info

--===============6209996518674695145==--
