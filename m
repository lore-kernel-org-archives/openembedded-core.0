Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A6FC5DF89
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 07:23:06 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1813.1787210582297835795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 00:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oOHWW+kF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DAdh6gbz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a01e0d43e5-0a137982-1c03-4440-b500-541a8aa6d4cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787210581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JtWa35M3298VRZERkjzj5Yg0fwNFswafaxXT5VOWmso=;
	b=oOHWW+kFXeujwDHiZaQ+eS7yJIVmY88++3s+FEK6bgB7UhqtnEWjJmkkKN7OSE+L
	zwWJjglbzkAt35FdjnS7ltioGxLjm8mADoPlIQLXHCR3rsYxlpwCICzr8WWAqLMz12L
	uLxF5iT4RAxbiy+e6nv5pudllEHMyESFpnC//HRs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787210581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JtWa35M3298VRZERkjzj5Yg0fwNFswafaxXT5VOWmso=;
	b=DAdh6gbz5F80M4oEWMYMjgRnTuMH5zqfsYcCZHOMdMZ7fbz8SyXXXrNEtG3eoNv5
	QS+lG2SuT7k6rRT/VyOuwvrJklSpJ3LzKyOtKftL4O6sv0UpQHEI2ttbxQ90oB5d5ZE
	gsTwmPQbkr4zg1TjGLuRzFta20xM+s/AamNq+Sr0=
Content-Type: multipart/mixed; boundary="===============3415406063965782760=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-vcs-versioning: upgrading to 2.3.1 SUCCEEDED
Message-ID: <010101a01e0d43e5-0a137982-1c03-4440-b500-541a8aa6d4cd-000000@us-west-2.amazonses.com>
Date: Thu, 20 Aug 2026 07:23:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.20-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 07:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243815

--===============3415406063965782760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-vcs-versioning* to *2.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-vcs-versioning-upgrade-2.2.4-2.3.1.patch
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
From 5d9a00e8b6a1508ea7b15e9bacbfae9d013b8cce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 20 Aug 2026 05:25:48 +0000
Subject: [PATCH] python3-vcs-versioning: upgrade 2.2.4 -> 2.3.1

Source: CHANGELOG.md

## 2.3.1 (2026-08-19)

### Fixed

- Fix a `FileNotFoundError` crash in the git file finder when a submodule is tracked in the index but its working tree directory does not exist - such gitlinks are now skipped like not checked out submodules. ([#1500](https://github.com/pypa/setuptools-scm/issues/1500))

## 2.3.0 (2026-08-13)

### Added

- Add a ``vcs_versioning.dynamic_metadata`` provider for the [dynamic-metadata](https://github.com/scikit-build/dynamic-metadata) system. ([#1465](https://github.com/pypa/setuptools-scm/issues/1465))

### Fixed

- Make the `tag.strict` and `scm.git.describe_command` diagnostics actionable and non-conflicting.

  The `tag.strict` future-default notice is now reported by the git backend rather than at configuration time, and only when the future default would actually select a different tag for the repository -- the message names both the current and the future version string. Projects the change cannot affect are silent, and setting an explicit `describe_command` no longer triggers it at all, so the two warnings can no longer contradict each other.

  The `describe_command` notice is likewise limited to the case where it and an explicit `tag.strict` really disagree, and no longer claims that `tag.prefix` has no effect -- prefix stripping applies regardless of how the tag was selected.

  Both are logged at warning level instead of raised as warnings, so `SETUPTOOLS_SCM_DEBUG=ERROR` silences them. ([#1429](https://github.com/pypa/setuptools-scm/issues/1429))
- Honour `export-ignore` on directories and submodules again in the git file finder.

  The switch from `git archive` to `git ls-files --recurse-submodules` lost two parts of the archive semantics: `--recurse-submodules` listed every submodule regardless of `export-ignore`, and the `:(exclude,attr:export-ignore)` pathspec only matches files, so an `export-ignore` on a directory no longer excluded the files below it. Projects that kept vendored submodules in an `export-ignore`d directory suddenly shipped them in their sdists.

  The finder now lists a repository without recursion, checks `export-ignore` for directories via `git check-attr` (which is what `git archive` effectively does when it skips a tree), and only then descends into the submodules that survived. Submodule contents are still listed - with their own `.gitattributes` applied - so `export-ignore` in the parent repository now controls exactly which submodules get packaged. Submodules that are not checked out are skipped instead of failing the listing. ([#1469](https://github.com/pypa/setuptools-scm/issues/1469))
- Honour `tag.strict` on Mercurial changesets that carry tags of their own, and report the coming strict default for Mercurial repositories.

  `tag.strict` was only applied when looking for the latest tag, so a checked-out changeset tagged `event-2024` still produced version `2024` even with `tag.strict = true`, while git rejected the same tag. Strict matching now app

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...-vcs-versioning_2.2.4.bb => python3-vcs-versioning_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-vcs-versioning_2.2.4.bb => python3-vcs-versioning_2.3.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb
rename to meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb
index c8665d90c9..1800475dff 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.3.1.bb
@@ -5,7 +5,7 @@ library that can be used independently of setuptools."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c9b06ad2ebd7e2e82d34b3caf353e7d5"
 
-SRC_URI[sha256sum] = "ed718fdee42170e128a8add6f23f53aa64dc7d9ab2de87d3083a691df881a809"
+SRC_URI[sha256sum] = "806635bd0ea653c96af98a70624be758d408a989f2cd0b390e63474d99f96b63"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.47.1


--===============3415406063965782760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: FILELIST: added "/usr/lib/python3-vcs-versioning/ptest/testing_vcs/test_dynamic_metadata.py /usr/lib/python3-vcs-versioning/ptest/testing_vcs/test_hg_tag_strict.py /usr/lib/python3-vcs-versioning/ptest/testing_vcs/test_tag_strict_diagnostics.py"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info/licenses, added "/usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_dynamic_metadata.cpython-314.pyc /usr/lib/python3.14/site-packages/vcs_versioning/_dynamic_metadata.py"
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info
  /usr/lib/python3.14/site-packages/vcs_versioning/_dynamic_metadata.py was added
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_dynamic_metadata.cpython-314.pyc was added

--===============3415406063965782760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-vcs-versioning-changelog.txt"

Changelog for python3-vcs-versioning: 2.2.4 -> 2.3.1
Source: CHANGELOG.md

## 2.3.1 (2026-08-19)

### Fixed

- Fix a `FileNotFoundError` crash in the git file finder when a submodule is tracked in the index but its working tree directory does not exist - such gitlinks are now skipped like not checked out submodules. ([#1500](https://github.com/pypa/setuptools-scm/issues/1500))

## 2.3.0 (2026-08-13)

### Added

- Add a ``vcs_versioning.dynamic_metadata`` provider for the [dynamic-metadata](https://github.com/scikit-build/dynamic-metadata) system. ([#1465](https://github.com/pypa/setuptools-scm/issues/1465))

### Fixed

- Make the `tag.strict` and `scm.git.describe_command` diagnostics actionable and non-conflicting.

  The `tag.strict` future-default notice is now reported by the git backend rather than at configuration time, and only when the future default would actually select a different tag for the repository -- the message names both the current and the future version string. Projects the change cannot affect are silent, and setting an explicit `describe_command` no longer triggers it at all, so the two warnings can no longer contradict each other.

  The `describe_command` notice is likewise limited to the case where it and an explicit `tag.strict` really disagree, and no longer claims that `tag.prefix` has no effect -- prefix stripping applies regardless of how the tag was selected.

  Both are logged at warning level instead of raised as warnings, so `SETUPTOOLS_SCM_DEBUG=ERROR` silences them. ([#1429](https://github.com/pypa/setuptools-scm/issues/1429))
- Honour `export-ignore` on directories and submodules again in the git file finder.

  The switch from `git archive` to `git ls-files --recurse-submodules` lost two parts of the archive semantics: `--recurse-submodules` listed every submodule regardless of `export-ignore`, and the `:(exclude,attr:export-ignore)` pathspec only matches files, so an `export-ignore` on a directory no longer excluded the files below it. Projects that kept vendored submodules in an `export-ignore`d directory suddenly shipped them in their sdists.

  The finder now lists a repository without recursion, checks `export-ignore` for directories via `git check-attr` (which is what `git archive` effectively does when it skips a tree), and only then descends into the submodules that survived. Submodule contents are still listed - with their own `.gitattributes` applied - so `export-ignore` in the parent repository now controls exactly which submodules get packaged. Submodules that are not checked out are skipped instead of failing the listing. ([#1469](https://github.com/pypa/setuptools-scm/issues/1469))
- Honour `tag.strict` on Mercurial changesets that carry tags of their own, and report the coming strict default for Mercurial repositories.

  `tag.strict` was only applied when looking for the latest tag, so a checked-out changeset tagged `event-2024` still produced version `2024` even with `tag.strict = true`, while git rejected the same tag. Strict matching now applies to the tags on the changeset too: a changeset carrying only event-style tags is treated as untagged and versioning continues from the last real version tag, matching `git describe --match`. When several tags sit on one changeset, the version-shaped one is now selected instead of whichever Mercurial happened to list first.

  The `tag.strict` divergence diagnostic added in #1429 now covers Mercurial as well, naming the current and future version whenever the coming default would change them. Both backends share the message, and the git-only helpers moved to `_backends/_scm_workdir.py`.

  Note that the Mercurial backend required a dot in version tags before setuptools-scm 9, so for Mercurial projects the coming strict default restores the historical behavior. ([#1495](https://github.com/pypa/setuptools-scm/issues/1495))

--===============3415406063965782760==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-vcs-versioning-upgrade-2.2.4-2.3.1.patch"

RnJvbSA1ZDlhMDBlOGI2YTE1MDhlYTdiMTVlOWJhY2JmYWU5ZDAxM2I4Y2NlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjAgQXVnIDIwMjYgMDU6MjU6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXZjcy12ZXJzaW9uaW5nOiB1cGdyYWRlIDIuMi40IC0+IDIuMy4xCgpTb3VyY2U6IENI
QU5HRUxPRy5tZAoKIyMgMi4zLjEgKDIwMjYtMDgtMTkpCgojIyMgRml4ZWQKCi0gRml4IGEgYEZp
bGVOb3RGb3VuZEVycm9yYCBjcmFzaCBpbiB0aGUgZ2l0IGZpbGUgZmluZGVyIHdoZW4gYSBzdWJt
b2R1bGUgaXMgdHJhY2tlZCBpbiB0aGUgaW5kZXggYnV0IGl0cyB3b3JraW5nIHRyZWUgZGlyZWN0
b3J5IGRvZXMgbm90IGV4aXN0IC0gc3VjaCBnaXRsaW5rcyBhcmUgbm93IHNraXBwZWQgbGlrZSBu
b3QgY2hlY2tlZCBvdXQgc3VibW9kdWxlcy4gKFsjMTUwMF0oaHR0cHM6Ly9naXRodWIuY29tL3B5
cGEvc2V0dXB0b29scy1zY20vaXNzdWVzLzE1MDApKQoKIyMgMi4zLjAgKDIwMjYtMDgtMTMpCgoj
IyMgQWRkZWQKCi0gQWRkIGEgYGB2Y3NfdmVyc2lvbmluZy5keW5hbWljX21ldGFkYXRhYGAgcHJv
dmlkZXIgZm9yIHRoZSBbZHluYW1pYy1tZXRhZGF0YV0oaHR0cHM6Ly9naXRodWIuY29tL3NjaWtp
dC1idWlsZC9keW5hbWljLW1ldGFkYXRhKSBzeXN0ZW0uIChbIzE0NjVdKGh0dHBzOi8vZ2l0aHVi
LmNvbS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNDY1KSkKCiMjIyBGaXhlZAoKLSBNYWtl
IHRoZSBgdGFnLnN0cmljdGAgYW5kIGBzY20uZ2l0LmRlc2NyaWJlX2NvbW1hbmRgIGRpYWdub3N0
aWNzIGFjdGlvbmFibGUgYW5kIG5vbi1jb25mbGljdGluZy4KCiAgVGhlIGB0YWcuc3RyaWN0YCBm
dXR1cmUtZGVmYXVsdCBub3RpY2UgaXMgbm93IHJlcG9ydGVkIGJ5IHRoZSBnaXQgYmFja2VuZCBy
YXRoZXIgdGhhbiBhdCBjb25maWd1cmF0aW9uIHRpbWUsIGFuZCBvbmx5IHdoZW4gdGhlIGZ1dHVy
ZSBkZWZhdWx0IHdvdWxkIGFjdHVhbGx5IHNlbGVjdCBhIGRpZmZlcmVudCB0YWcgZm9yIHRoZSBy
ZXBvc2l0b3J5IC0tIHRoZSBtZXNzYWdlIG5hbWVzIGJvdGggdGhlIGN1cnJlbnQgYW5kIHRoZSBm
dXR1cmUgdmVyc2lvbiBzdHJpbmcuIFByb2plY3RzIHRoZSBjaGFuZ2UgY2Fubm90IGFmZmVjdCBh
cmUgc2lsZW50LCBhbmQgc2V0dGluZyBhbiBleHBsaWNpdCBgZGVzY3JpYmVfY29tbWFuZGAgbm8g
bG9uZ2VyIHRyaWdnZXJzIGl0IGF0IGFsbCwgc28gdGhlIHR3byB3YXJuaW5ncyBjYW4gbm8gbG9u
Z2VyIGNvbnRyYWRpY3QgZWFjaCBvdGhlci4KCiAgVGhlIGBkZXNjcmliZV9jb21tYW5kYCBub3Rp
Y2UgaXMgbGlrZXdpc2UgbGltaXRlZCB0byB0aGUgY2FzZSB3aGVyZSBpdCBhbmQgYW4gZXhwbGlj
aXQgYHRhZy5zdHJpY3RgIHJlYWxseSBkaXNhZ3JlZSwgYW5kIG5vIGxvbmdlciBjbGFpbXMgdGhh
dCBgdGFnLnByZWZpeGAgaGFzIG5vIGVmZmVjdCAtLSBwcmVmaXggc3RyaXBwaW5nIGFwcGxpZXMg
cmVnYXJkbGVzcyBvZiBob3cgdGhlIHRhZyB3YXMgc2VsZWN0ZWQuCgogIEJvdGggYXJlIGxvZ2dl
ZCBhdCB3YXJuaW5nIGxldmVsIGluc3RlYWQgb2YgcmFpc2VkIGFzIHdhcm5pbmdzLCBzbyBgU0VU
VVBUT09MU19TQ01fREVCVUc9RVJST1JgIHNpbGVuY2VzIHRoZW0uIChbIzE0MjldKGh0dHBzOi8v
Z2l0aHViLmNvbS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNDI5KSkKLSBIb25vdXIgYGV4
cG9ydC1pZ25vcmVgIG9uIGRpcmVjdG9yaWVzIGFuZCBzdWJtb2R1bGVzIGFnYWluIGluIHRoZSBn
aXQgZmlsZSBmaW5kZXIuCgogIFRoZSBzd2l0Y2ggZnJvbSBgZ2l0IGFyY2hpdmVgIHRvIGBnaXQg
bHMtZmlsZXMgLS1yZWN1cnNlLXN1Ym1vZHVsZXNgIGxvc3QgdHdvIHBhcnRzIG9mIHRoZSBhcmNo
aXZlIHNlbWFudGljczogYC0tcmVjdXJzZS1zdWJtb2R1bGVzYCBsaXN0ZWQgZXZlcnkgc3VibW9k
dWxlIHJlZ2FyZGxlc3Mgb2YgYGV4cG9ydC1pZ25vcmVgLCBhbmQgdGhlIGA6KGV4Y2x1ZGUsYXR0
cjpleHBvcnQtaWdub3JlKWAgcGF0aHNwZWMgb25seSBtYXRjaGVzIGZpbGVzLCBzbyBhbiBgZXhw
b3J0LWlnbm9yZWAgb24gYSBkaXJlY3Rvcnkgbm8gbG9uZ2VyIGV4Y2x1ZGVkIHRoZSBmaWxlcyBi
ZWxvdyBpdC4gUHJvamVjdHMgdGhhdCBrZXB0IHZlbmRvcmVkIHN1Ym1vZHVsZXMgaW4gYW4gYGV4
cG9ydC1pZ25vcmVgZCBkaXJlY3Rvcnkgc3VkZGVubHkgc2hpcHBlZCB0aGVtIGluIHRoZWlyIHNk
aXN0cy4KCiAgVGhlIGZpbmRlciBub3cgbGlzdHMgYSByZXBvc2l0b3J5IHdpdGhvdXQgcmVjdXJz
aW9uLCBjaGVja3MgYGV4cG9ydC1pZ25vcmVgIGZvciBkaXJlY3RvcmllcyB2aWEgYGdpdCBjaGVj
ay1hdHRyYCAod2hpY2ggaXMgd2hhdCBgZ2l0IGFyY2hpdmVgIGVmZmVjdGl2ZWx5IGRvZXMgd2hl
biBpdCBza2lwcyBhIHRyZWUpLCBhbmQgb25seSB0aGVuIGRlc2NlbmRzIGludG8gdGhlIHN1Ym1v
ZHVsZXMgdGhhdCBzdXJ2aXZlZC4gU3VibW9kdWxlIGNvbnRlbnRzIGFyZSBzdGlsbCBsaXN0ZWQg
LSB3aXRoIHRoZWlyIG93biBgLmdpdGF0dHJpYnV0ZXNgIGFwcGxpZWQgLSBzbyBgZXhwb3J0LWln
bm9yZWAgaW4gdGhlIHBhcmVudCByZXBvc2l0b3J5IG5vdyBjb250cm9scyBleGFjdGx5IHdoaWNo
IHN1Ym1vZHVsZXMgZ2V0IHBhY2thZ2VkLiBTdWJtb2R1bGVzIHRoYXQgYXJlIG5vdCBjaGVja2Vk
IG91dCBhcmUgc2tpcHBlZCBpbnN0ZWFkIG9mIGZhaWxpbmcgdGhlIGxpc3RpbmcuIChbIzE0Njld
KGh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNDY5KSkKLSBI
b25vdXIgYHRhZy5zdHJpY3RgIG9uIE1lcmN1cmlhbCBjaGFuZ2VzZXRzIHRoYXQgY2FycnkgdGFn
cyBvZiB0aGVpciBvd24sIGFuZCByZXBvcnQgdGhlIGNvbWluZyBzdHJpY3QgZGVmYXVsdCBmb3Ig
TWVyY3VyaWFsIHJlcG9zaXRvcmllcy4KCiAgYHRhZy5zdHJpY3RgIHdhcyBvbmx5IGFwcGxpZWQg
d2hlbiBsb29raW5nIGZvciB0aGUgbGF0ZXN0IHRhZywgc28gYSBjaGVja2VkLW91dCBjaGFuZ2Vz
ZXQgdGFnZ2VkIGBldmVudC0yMDI0YCBzdGlsbCBwcm9kdWNlZCB2ZXJzaW9uIGAyMDI0YCBldmVu
IHdpdGggYHRhZy5zdHJpY3QgPSB0cnVlYCwgd2hpbGUgZ2l0IHJlamVjdGVkIHRoZSBzYW1lIHRh
Zy4gU3RyaWN0IG1hdGNoaW5nIG5vdyBhcHAKCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4
Y2VlZHMgMzAwMCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGlu
IGFuIGF0dGFjaG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi4tdmNzLXZlcnNpb25pbmdf
Mi4yLjQuYmIgPT4gcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjMuMS5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMi40LmJiID0+
IHB5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4zLjEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMi40LmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIu
My4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjIuNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXZjcy12ZXJzaW9uaW5nXzIuMy4xLmJi
CmluZGV4IGM4NjY1ZDkwYzkuLjE4MDA0NzVkZmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy12Y3MtdmVyc2lvbmluZ18yLjIuNC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdmNzLXZlcnNpb25pbmdfMi4zLjEuYmIK
QEAgLTUsNyArNSw3IEBAIGxpYnJhcnkgdGhhdCBjYW4gYmUgdXNlZCBpbmRlcGVuZGVudGx5IG9m
IHNldHVwdG9vbHMuIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLnR4dDttZDU9YzliMDZhZDJlYmQ3ZTJlODJkMzRiM2NhZjM1M2U3ZDUiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJlZDcxOGZkZWU0MjE3MGUxMjhhOGFkZDZmMjNmNTNhYTY0ZGM3
ZDlhYjJkZTg3ZDMwODNhNjkxZGY4ODFhODA5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgwNjYz
NWJkMGVhNjUzYzk2YWY5OGE3MDYyNGJlNzU4ZDQwOGE5ODlmMmNkMGIzOTBlNjM0NzRkOTlmOTZi
NjMiCiAKIFNSQ19VUkkgKz0gIlwKICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKLS0gCjIuNDcuMQoK

--===============3415406063965782760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-vcs-versioning: PKGV changed from 2.2.4 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning: SRC_URI changed from "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.2.4.tar.gz;downloadfilename=vcs_versioning-2.2.4.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/v/vcs_versioning/vcs_versioning-2.3.1.tar.gz;downloadfilename=vcs_versioning-2.3.1.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/python3-vcs-versioning: PV changed from "2.2.4" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PKGV changed from 2.2.4 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dbg: PV changed from "2.2.4" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PKGV changed from 2.2.4 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-dev: PV changed from "2.2.4" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PKGV changed from 2.2.4 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-doc: PV changed from "2.2.4" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PKGV changed from 2.2.4 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-locale: PV changed from "2.2.4" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: FILELIST: added "/usr/lib/python3-vcs-versioning/ptest/testing_vcs/test_dynamic_metadata.py /usr/lib/python3-vcs-versioning/ptest/testing_vcs/test_tag_strict_diagnostics.py /usr/lib/python3-vcs-versioning/ptest/testing_vcs/test_hg_tag_strict.py"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGV changed from 2.2.4 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PKGSIZE changed from 248397 to 271966 (+9%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-ptest: PV changed from "2.2.4" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PKGV changed from 2.2.4 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-src: PV changed from "2.2.4" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PKGV changed from 2.2.4 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning-staticdev: PV changed from "2.2.4" to "2.3.1"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: FILELIST: directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info -> /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info, added "/usr/lib/python3.14/site-packages/vcs_versioning/_dynamic_metadata.py /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_dynamic_metadata.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGV changed from 2.2.4 [default] to 2.3.1 [default]
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PKGSIZE changed from 735834 to 774001 (+5%)
packages/x86-64-v3-poky-linux/python3-vcs-versioning/python3-vcs-versioning: PV changed from "2.2.4" to "2.3.1"
Changes to packages/x86-64-v3-poky-linux/python3-vcs-versioning (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.4.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-2.3.1.dist-info
  /usr/lib/python3.14/site-packages/vcs_versioning/_dynamic_metadata.py was added
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_dynamic_metadata.cpython-314.pyc was added

--===============3415406063965782760==--

