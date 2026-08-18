Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08048C5DF82
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:28:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2754.1787030925121593991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iOGQSXEj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rUnYYggV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a01357eb81-e1bf1d3b-573f-4bc6-9369-c9860f6034be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787030924;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=81GGn5Sl3b6228e7AMPVEIMenU3CBF+WfI1Q5gxoG/g=;
	b=iOGQSXEjs2siyFGDkiIsRklZ2OhhFcqcPUZ76IdMidUlI4KAdJlAnpRuC7Od3+cX
	ZMWds1qqU4zRt6L1exkXwKRtZSHQ43RxFTQAaBj23vjVt6uxgyuVnjwWCcq/yn1av5e
	x82BPKoBIsieOt7H77haWC3wFVGN9NejqhkgvO9I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787030924;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=81GGn5Sl3b6228e7AMPVEIMenU3CBF+WfI1Q5gxoG/g=;
	b=rUnYYggViHfABsxfHcd35kdbtSgitdrYC2REZ4Y0P0r/woyzWiT6UxZ9eqWQRdse
	Uzgs5jbN+LAAzz2tEg62aWp2IoXYMn9UFusODQ5OLwESFHg8nTPEb2+0VLyMSQwjbLS
	UTMRf22KLWqrxAluuPIWGwqpQekc8MCVdkdSselg=
Content-Type: multipart/mixed; boundary="===============5323727490645865471=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.28.2 SUCCEEDED
Message-ID: <010101a01357eb81-e1bf1d3b-573f-4bc6-9369-c9860f6034be-000000@us-west-2.amazonses.com>
Date: Tue, 18 Aug 2026 05:28:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243645

--===============5323727490645865471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.28.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.28.0-2.28.2.patch
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
From 99215f7ad2f82cd7b4909dfd4aa12a84a28a7769 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 18 Aug 2026 05:22:09 +0000
Subject: [PATCH] python3-pdm: upgrade 2.28.0 -> 2.28.2

Source: CHANGELOG.md

## Release v2.28.2 (2026-08-18)

### Bug Fixes

- Keep environment inspection working for Python 3.9 targets when PDM uses dep-logic 0.7 or newer. ([#3838](https://github.com/pdm-project/pdm/issues/3838))
- Cache the update check timestamp even when the version lookup fails, so that pdm no longer appears to hang on every command when PyPI is unreachable. ([#3840](https://github.com/pdm-project/pdm/issues/3840))
- Don't crash with an `IndexError` when listing scripts and one of them is blank. A blank script is now listed as `<BLANK_SCRIPT>`. ([#3842](https://github.com/pdm-project/pdm/issues/3842))
- Keep the whole template URL when `pdm new` is given an `ssh://` or credentialed Git URL, instead of truncating it at the userinfo `@`. ([#3843](https://github.com/pdm-project/pdm/issues/3843))
- Strip comments preceded by any whitespace, not only a plain space, when importing a `requirements.txt` file. ([#3844](https://github.com/pdm-project/pdm/issues/3844))
- Match `--trusted-host` on host and port when importing a `requirements.txt` file, and keep the port when exporting one. ([#3845](https://github.com/pdm-project/pdm/issues/3845))
- Expand a `~` prefix in the `venv.location` config so `pdm venv list/remove/activate/purge` find virtualenvs created under it. ([#3847](https://github.com/pdm-project/pdm/issues/3847))
- Convert a Poetry caret constraint on a `0.x` version to the upper bound Poetry documents, so `^0.2.3` becomes `<0.3.0` and `^0.0.3` becomes `<0.0.4` instead of `<1.0.0`. ([#3848](https://github.com/pdm-project/pdm/issues/3848))
- Fill in a placeholder `project.name` and `project.version` for the `pyproject.toml` generated for `uv`, so `pdm lock`/`pdm install` work with `use_uv` on a project that declares neither. ([#3849](https://github.com/pdm-project/pdm/issues/3849))
- Resolve nested requirement paths relative to remote requirements file URLs. ([#3850](https://github.com/pdm-project/pdm/issues/3850))

## Release v2.28.1 (2026-08-11)

### Features & Improvements

- Defer command action and Python installer imports until their corresponding runtime paths execute. ([#3673](https://github.com/pdm-project/pdm/issues/3673))
- Add `{run_cwd}` placeholder for scripts to reference the original working directory. ([#3734](https://github.com/pdm-project/pdm/issues/3734))
- Add opt-in canonical lock input freshness via `tool.pdm.resolution.lock_inputs` while retaining sticky lockfile behavior and legacy hash fallback for existing lock files. ([#3821](https://github.com/pdm-project/pdm/issues/3821))
- Integrate `argcomplete` for simplified command-line completion scripts. ([#3823](https://github.com/pdm-project/pdm/issues/3823))

### Bug Fixes

- Keep workspace members in their explicitly declared dependency groups instead of adding them to ``default`` in the lockfile. ([#3816](https://github.com/pdm-project/pdm/issues/3816))
- Keep the cached parsed version intact when stripping the local segment in `comparable_version()`.

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../python/{python3-pdm_2.28.0.bb => python3-pdm_2.28.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.28.0.bb => python3-pdm_2.28.2.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.28.0.bb b/meta/recipes-devtools/python/python3-pdm_2.28.2.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.28.0.bb
rename to meta/recipes-devtools/python/python3-pdm_2.28.2.bb
index 23d2f9e521..7dd74040ed 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.28.0.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.28.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "ca7d21548955086985070d2fe4334a55e59093a466b25eebc6bb0769a0539e89"
+SRC_URI[sha256sum] = "dc31c1d11c2e90564207181f87ca3d6fc16ee6584d703c0a9e0c03ba287a925a"
 
 inherit pypi python_pdm
 
-- 
2.47.1


--===============5323727490645865471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pdm: PV changed from "2.28.0" to "2.28.2"
packages/x86-64-v3-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.28.0.tar.gz;downloadfilename=pdm-2.28.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.28.2.tar.gz;downloadfilename=pdm-2.28.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-pdm: PKGV changed from 2.28.0 [default] to 2.28.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.28.0" to "2.28.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.28.0 [default] to 2.28.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.28.0" to "2.28.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.28.0 [default] to 2.28.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.28.0" to "2.28.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.28.0 [default] to 2.28.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.28.0" to "2.28.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.28.0 [default] to 2.28.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.28.0" to "2.28.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.28.0 [default] to 2.28.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.28.0" to "2.28.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.28.0 [default] to 2.28.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PV changed from "2.28.0" to "2.28.2"
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2551788 to 2527974 (-1%)
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.28.0 [default] to 2.28.2 [default]
packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info, added "/usr/lib/python3.14/site-packages/pdm/project/lockfile/freshness.py /usr/lib/python3.14/site-packages/pdm/project/__pycache__/workspace.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/project/workspace.py /usr/lib/python3.14/site-packages/pdm/project/lockfile/__pycache__/freshness.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info
  /usr/lib/python3.14/site-packages/pdm/project/lockfile/freshness.py was added
  /usr/lib/python3.14/site-packages/pdm/project/lockfile/__pycache__/freshness.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/project/__pycache__/workspace.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/project/workspace.py was added

--===============5323727490645865471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info -> /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info/licenses, added "/usr/lib/python3.14/site-packages/pdm/project/lockfile/__pycache__/freshness.cpython-314.pyc /usr/lib/python3.14/site-packages/pdm/project/lockfile/freshness.py /usr/lib/python3.14/site-packages/pdm/project/workspace.py /usr/lib/python3.14/site-packages/pdm/project/__pycache__/workspace.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.14/site-packages/pdm-2.28.0.dist-info moved to /usr/lib/python3.14/site-packages/pdm-2.28.2.dist-info
  /usr/lib/python3.14/site-packages/pdm/project/lockfile/freshness.py was added
  /usr/lib/python3.14/site-packages/pdm/project/lockfile/__pycache__/freshness.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/project/__pycache__/workspace.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pdm/project/workspace.py was added

--===============5323727490645865471==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.28.0-2.28.2.patch"

RnJvbSA5OTIxNWY3YWQyZjgyY2Q3YjQ5MDlkZmQ0YWExMmE4NGEyOGE3NzY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTggQXVnIDIwMjYgMDU6MjI6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBkbTogdXBncmFkZSAyLjI4LjAgLT4gMi4yOC4yCgpTb3VyY2U6IENIQU5HRUxPRy5t
ZAoKIyMgUmVsZWFzZSB2Mi4yOC4yICgyMDI2LTA4LTE4KQoKIyMjIEJ1ZyBGaXhlcwoKLSBLZWVw
IGVudmlyb25tZW50IGluc3BlY3Rpb24gd29ya2luZyBmb3IgUHl0aG9uIDMuOSB0YXJnZXRzIHdo
ZW4gUERNIHVzZXMgZGVwLWxvZ2ljIDAuNyBvciBuZXdlci4gKFsjMzgzOF0oaHR0cHM6Ly9naXRo
dWIuY29tL3BkbS1wcm9qZWN0L3BkbS9pc3N1ZXMvMzgzOCkpCi0gQ2FjaGUgdGhlIHVwZGF0ZSBj
aGVjayB0aW1lc3RhbXAgZXZlbiB3aGVuIHRoZSB2ZXJzaW9uIGxvb2t1cCBmYWlscywgc28gdGhh
dCBwZG0gbm8gbG9uZ2VyIGFwcGVhcnMgdG8gaGFuZyBvbiBldmVyeSBjb21tYW5kIHdoZW4gUHlQ
SSBpcyB1bnJlYWNoYWJsZS4gKFsjMzg0MF0oaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0
L3BkbS9pc3N1ZXMvMzg0MCkpCi0gRG9uJ3QgY3Jhc2ggd2l0aCBhbiBgSW5kZXhFcnJvcmAgd2hl
biBsaXN0aW5nIHNjcmlwdHMgYW5kIG9uZSBvZiB0aGVtIGlzIGJsYW5rLiBBIGJsYW5rIHNjcmlw
dCBpcyBub3cgbGlzdGVkIGFzIGA8QkxBTktfU0NSSVBUPmAuIChbIzM4NDJdKGh0dHBzOi8vZ2l0
aHViLmNvbS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4NDIpKQotIEtlZXAgdGhlIHdob2xlIHRl
bXBsYXRlIFVSTCB3aGVuIGBwZG0gbmV3YCBpcyBnaXZlbiBhbiBgc3NoOi8vYCBvciBjcmVkZW50
aWFsZWQgR2l0IFVSTCwgaW5zdGVhZCBvZiB0cnVuY2F0aW5nIGl0IGF0IHRoZSB1c2VyaW5mbyBg
QGAuIChbIzM4NDNdKGh0dHBzOi8vZ2l0aHViLmNvbS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4
NDMpKQotIFN0cmlwIGNvbW1lbnRzIHByZWNlZGVkIGJ5IGFueSB3aGl0ZXNwYWNlLCBub3Qgb25s
eSBhIHBsYWluIHNwYWNlLCB3aGVuIGltcG9ydGluZyBhIGByZXF1aXJlbWVudHMudHh0YCBmaWxl
LiAoWyMzODQ0XShodHRwczovL2dpdGh1Yi5jb20vcGRtLXByb2plY3QvcGRtL2lzc3Vlcy8zODQ0
KSkKLSBNYXRjaCBgLS10cnVzdGVkLWhvc3RgIG9uIGhvc3QgYW5kIHBvcnQgd2hlbiBpbXBvcnRp
bmcgYSBgcmVxdWlyZW1lbnRzLnR4dGAgZmlsZSwgYW5kIGtlZXAgdGhlIHBvcnQgd2hlbiBleHBv
cnRpbmcgb25lLiAoWyMzODQ1XShodHRwczovL2dpdGh1Yi5jb20vcGRtLXByb2plY3QvcGRtL2lz
c3Vlcy8zODQ1KSkKLSBFeHBhbmQgYSBgfmAgcHJlZml4IGluIHRoZSBgdmVudi5sb2NhdGlvbmAg
Y29uZmlnIHNvIGBwZG0gdmVudiBsaXN0L3JlbW92ZS9hY3RpdmF0ZS9wdXJnZWAgZmluZCB2aXJ0
dWFsZW52cyBjcmVhdGVkIHVuZGVyIGl0LiAoWyMzODQ3XShodHRwczovL2dpdGh1Yi5jb20vcGRt
LXByb2plY3QvcGRtL2lzc3Vlcy8zODQ3KSkKLSBDb252ZXJ0IGEgUG9ldHJ5IGNhcmV0IGNvbnN0
cmFpbnQgb24gYSBgMC54YCB2ZXJzaW9uIHRvIHRoZSB1cHBlciBib3VuZCBQb2V0cnkgZG9jdW1l
bnRzLCBzbyBgXjAuMi4zYCBiZWNvbWVzIGA8MC4zLjBgIGFuZCBgXjAuMC4zYCBiZWNvbWVzIGA8
MC4wLjRgIGluc3RlYWQgb2YgYDwxLjAuMGAuIChbIzM4NDhdKGh0dHBzOi8vZ2l0aHViLmNvbS9w
ZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4NDgpKQotIEZpbGwgaW4gYSBwbGFjZWhvbGRlciBgcHJv
amVjdC5uYW1lYCBhbmQgYHByb2plY3QudmVyc2lvbmAgZm9yIHRoZSBgcHlwcm9qZWN0LnRvbWxg
IGdlbmVyYXRlZCBmb3IgYHV2YCwgc28gYHBkbSBsb2NrYC9gcGRtIGluc3RhbGxgIHdvcmsgd2l0
aCBgdXNlX3V2YCBvbiBhIHByb2plY3QgdGhhdCBkZWNsYXJlcyBuZWl0aGVyLiAoWyMzODQ5XSho
dHRwczovL2dpdGh1Yi5jb20vcGRtLXByb2plY3QvcGRtL2lzc3Vlcy8zODQ5KSkKLSBSZXNvbHZl
IG5lc3RlZCByZXF1aXJlbWVudCBwYXRocyByZWxhdGl2ZSB0byByZW1vdGUgcmVxdWlyZW1lbnRz
IGZpbGUgVVJMcy4gKFsjMzg1MF0oaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS9p
c3N1ZXMvMzg1MCkpCgojIyBSZWxlYXNlIHYyLjI4LjEgKDIwMjYtMDgtMTEpCgojIyMgRmVhdHVy
ZXMgJiBJbXByb3ZlbWVudHMKCi0gRGVmZXIgY29tbWFuZCBhY3Rpb24gYW5kIFB5dGhvbiBpbnN0
YWxsZXIgaW1wb3J0cyB1bnRpbCB0aGVpciBjb3JyZXNwb25kaW5nIHJ1bnRpbWUgcGF0aHMgZXhl
Y3V0ZS4gKFsjMzY3M10oaHR0cHM6Ly9naXRodWIuY29tL3BkbS1wcm9qZWN0L3BkbS9pc3N1ZXMv
MzY3MykpCi0gQWRkIGB7cnVuX2N3ZH1gIHBsYWNlaG9sZGVyIGZvciBzY3JpcHRzIHRvIHJlZmVy
ZW5jZSB0aGUgb3JpZ2luYWwgd29ya2luZyBkaXJlY3RvcnkuIChbIzM3MzRdKGh0dHBzOi8vZ2l0
aHViLmNvbS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM3MzQpKQotIEFkZCBvcHQtaW4gY2Fub25p
Y2FsIGxvY2sgaW5wdXQgZnJlc2huZXNzIHZpYSBgdG9vbC5wZG0ucmVzb2x1dGlvbi5sb2NrX2lu
cHV0c2Agd2hpbGUgcmV0YWluaW5nIHN0aWNreSBsb2NrZmlsZSBiZWhhdmlvciBhbmQgbGVnYWN5
IGhhc2ggZmFsbGJhY2sgZm9yIGV4aXN0aW5nIGxvY2sgZmlsZXMuIChbIzM4MjFdKGh0dHBzOi8v
Z2l0aHViLmNvbS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4MjEpKQotIEludGVncmF0ZSBgYXJn
Y29tcGxldGVgIGZvciBzaW1wbGlmaWVkIGNvbW1hbmQtbGluZSBjb21wbGV0aW9uIHNjcmlwdHMu
IChbIzM4MjNdKGh0dHBzOi8vZ2l0aHViLmNvbS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4MjMp
KQoKIyMjIEJ1ZyBGaXhlcwoKLSBLZWVwIHdvcmtzcGFjZSBtZW1iZXJzIGluIHRoZWlyIGV4cGxp
Y2l0bHkgZGVjbGFyZWQgZGVwZW5kZW5jeSBncm91cHMgaW5zdGVhZCBvZiBhZGRpbmcgdGhlbSB0
byBgYGRlZmF1bHRgYCBpbiB0aGUgbG9ja2ZpbGUuIChbIzM4MTZdKGh0dHBzOi8vZ2l0aHViLmNv
bS9wZG0tcHJvamVjdC9wZG0vaXNzdWVzLzM4MTYpKQotIEtlZXAgdGhlIGNhY2hlZCBwYXJzZWQg
dmVyc2lvbiBpbnRhY3Qgd2hlbiBzdHJpcHBpbmcgdGhlIGxvY2FsIHNlZ21lbnQgaW4gYGNvbXBh
cmFibGVfdmVyc2lvbigpYC4KCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgMzAw
MCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFuIGF0dGFj
aG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi4vcHl0aG9uL3tweXRob24zLXBkbV8yLjI4
LjAuYmIgPT4gcHl0aG9uMy1wZG1fMi4yOC4yLmJifSAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3tweXRob24zLXBkbV8yLjI4LjAuYmIgPT4gcHl0aG9uMy1wZG1fMi4yOC4y
LmJifSAoODAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1wZG1fMi4yOC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXBkbV8yLjI4LjIuYmIKc2ltaWxhcml0eSBpbmRleCA4MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBkbV8yLjI4LjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yOC4yLmJiCmluZGV4IDIzZDJm
OWU1MjEuLjdkZDc0MDQwZWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wZG1fMi4yOC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wZG1fMi4yOC4yLmJiCkBAIC00LDcgKzQsNyBAQCBMSUNFTlNFID0gIk1JVCIK
IFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9MmViMzFhMmNjMWE3NThjMzRiNDk5ZjI4N2RkMDRlZjIiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJjYTdkMjE1NDg5NTUwODY5ODUwNzBkMmZlNDMzNGE1NWU1OTA5M2E0NjZiMjVl
ZWJjNmJiMDc2OWEwNTM5ZTg5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImRjMzFjMWQxMWMyZTkw
NTY0MjA3MTgxZjg3Y2EzZDZmYzE2ZWU2NTg0ZDcwM2MwYTllMGMwM2JhMjg3YTkyNWEiCiAKIGlu
aGVyaXQgcHlwaSBweXRob25fcGRtCiAKLS0gCjIuNDcuMQoK

--===============5323727490645865471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pdm-changelog.txt"

Changelog for python3-pdm: 2.28.0 -> 2.28.2
Source: CHANGELOG.md

## Release v2.28.2 (2026-08-18)

### Bug Fixes

- Keep environment inspection working for Python 3.9 targets when PDM uses dep-logic 0.7 or newer. ([#3838](https://github.com/pdm-project/pdm/issues/3838))
- Cache the update check timestamp even when the version lookup fails, so that pdm no longer appears to hang on every command when PyPI is unreachable. ([#3840](https://github.com/pdm-project/pdm/issues/3840))
- Don't crash with an `IndexError` when listing scripts and one of them is blank. A blank script is now listed as `<BLANK_SCRIPT>`. ([#3842](https://github.com/pdm-project/pdm/issues/3842))
- Keep the whole template URL when `pdm new` is given an `ssh://` or credentialed Git URL, instead of truncating it at the userinfo `@`. ([#3843](https://github.com/pdm-project/pdm/issues/3843))
- Strip comments preceded by any whitespace, not only a plain space, when importing a `requirements.txt` file. ([#3844](https://github.com/pdm-project/pdm/issues/3844))
- Match `--trusted-host` on host and port when importing a `requirements.txt` file, and keep the port when exporting one. ([#3845](https://github.com/pdm-project/pdm/issues/3845))
- Expand a `~` prefix in the `venv.location` config so `pdm venv list/remove/activate/purge` find virtualenvs created under it. ([#3847](https://github.com/pdm-project/pdm/issues/3847))
- Convert a Poetry caret constraint on a `0.x` version to the upper bound Poetry documents, so `^0.2.3` becomes `<0.3.0` and `^0.0.3` becomes `<0.0.4` instead of `<1.0.0`. ([#3848](https://github.com/pdm-project/pdm/issues/3848))
- Fill in a placeholder `project.name` and `project.version` for the `pyproject.toml` generated for `uv`, so `pdm lock`/`pdm install` work with `use_uv` on a project that declares neither. ([#3849](https://github.com/pdm-project/pdm/issues/3849))
- Resolve nested requirement paths relative to remote requirements file URLs. ([#3850](https://github.com/pdm-project/pdm/issues/3850))

## Release v2.28.1 (2026-08-11)

### Features & Improvements

- Defer command action and Python installer imports until their corresponding runtime paths execute. ([#3673](https://github.com/pdm-project/pdm/issues/3673))
- Add `{run_cwd}` placeholder for scripts to reference the original working directory. ([#3734](https://github.com/pdm-project/pdm/issues/3734))
- Add opt-in canonical lock input freshness via `tool.pdm.resolution.lock_inputs` while retaining sticky lockfile behavior and legacy hash fallback for existing lock files. ([#3821](https://github.com/pdm-project/pdm/issues/3821))
- Integrate `argcomplete` for simplified command-line completion scripts. ([#3823](https://github.com/pdm-project/pdm/issues/3823))

### Bug Fixes

- Keep workspace members in their explicitly declared dependency groups instead of adding them to ``default`` in the lockfile. ([#3816](https://github.com/pdm-project/pdm/issues/3816))
- Keep the cached parsed version intact when stripping the local segment in `comparable_version()`. ([#3817](https://github.com/pdm-project/pdm/issues/3817))
- Make `use_uv` support adding local files. ([#3822](https://github.com/pdm-project/pdm/issues/3822))
- Add a Poetry optional dependency to every extra that lists it when importing, instead of only the first one. ([#3831](https://github.com/pdm-project/pdm/issues/3831))
- Do not write null values into the generated `pyproject.toml` when importing a flit project that omits `author-email`/`maintainer-email` or sets only one of `include` and `exclude` in `[tool.flit.sdist]`. ([#3832](https://github.com/pdm-project/pdm/issues/3832))

### Miscellany

- Add Python 3.15 preview version to the CI matrix. ([#3827](https://github.com/pdm-project/pdm/issues/3827))

--===============5323727490645865471==--

