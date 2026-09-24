Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFF1C98318
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 05:34:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1368.1790228071274808456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 22:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KST8nyIt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rFPwAuWc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0d1e87f31-01b6628e-8097-4ace-9b95-a23d29d9808e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790228070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AAmFxC1NJteBPWBBl7P9xhYmzHciFYEzR3VOUc0wyXg=;
	b=KST8nyItvr3uWgv6U9Jh1V3YqB8GDcUpA+9EzIOk8341yptvHK8oyewDTipLnYsk
	a38x11b192+NXPgxaUjmZuRMpUrcOUTwsP1q3jFt+/9M4yXz0wkpa7D0BTLAbgLUODW
	5CxME7qi34xULd7Q9wedzVyLEMaQBj7sRuyHOpDg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790228070;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AAmFxC1NJteBPWBBl7P9xhYmzHciFYEzR3VOUc0wyXg=;
	b=rFPwAuWc8EhdJ+OaV3UrMcsPXuZ6z74/CBCQk1v38NLzX4g2sSa3wky1kwM766hL
	qeWPSN0QDt9kQeSbx/sYL6WCB6OJSXvrmngb2nkEhYr88nTAZO+3S7tRsMRDeFOjXXN
	MeKYm7aZp4aMZLVdUMcqX9kavuZEU9U44W8dLJ1Y=
Content-Type: multipart/mixed; boundary="===============4394245469785121268=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 10.3.4 FAILED
Message-ID: <010101a0d1e87f31-01b6628e-8097-4ace-9b95-a23d29d9808e-000000@us-west-2.amazonses.com>
Date: Thu, 24 Sep 2026 05:34:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.24-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 05:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246561

--===============4394245469785121268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *10.3.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-10.2.3-10.3.4.patch
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
From 1a17031af146f7cb8d7ad376e628bad0d4de2338 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 24 Sep 2026 05:15:56 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 10.2.3 -> 10.3.4

## 10.3.4 (2026-09-23)
### Fixed

- Ship the tracked files of projects whose `pyproject.toml` sits in a
  subdirectory
  of the checkout. `root` defaults to the project directory, so version
  inference
  correctly finds no SCM there and answers from `SETUPTOOLS_SCM_PRETEND_VERSION`
  or `fallback_version` -- but that says nothing about which files git tracks,
  and
  the sdist and wheel came out with none of them. This was the 10.3.0 regression
  fixed in 10.3.3, surviving in the subdirectory layout.

  File discovery now follows the checkout the project sits in, independently of
  the `root` that scopes versioning, and records `scm_file_list.json` in the
  egg-info as a root-level project already did. ([#1543]( ))
- Require `vcs-versioning>=2.5.0`. The subdirectory file-discovery fix (#1543)
  imports
  `discover_file_workdir`, which no earlier release has, while the declared
  floor still
  named 2.4.0 -- an install against a published vcs-versioning raised
  `ImportError`
  during the build. ([#1546]( ))

## 10.3.3 (2026-09-16)
### Fixed

- Keep file discovery working when the version is pretended.
  `SETUPTOOLS_SCM_PRETEND_VERSION` and its scoped `_FOR_<DIST>` form made
  version inference return before discovering a workdir, and the `egg_info`
  mixin read the absent workdir as "searched, found no checkout" -- the signal
  it acts on by suppressing the `setuptools.file_finders` chain. Every
  SCM-tracked file that setuptools' own package discovery does not find was
  then dropped from the sdist and the wheel, silently, since the build
  succeeded and the version was correct.

  A pretended version still skips discovery, because most builds only want a
  version and probing for a checkout nobody asks about costs subprocesses for
  nothing. What no longer happens is passing that off as an answer: "nobody
  looked yet" is now distinct from "looked and found nothing", and the workdir
  is discovered on demand the first time a consumer needs a file list.

  `scm_file_list.json` is now written to the egg-info for pretended builds as
  well. It describes which files the checkout tracks, which a pretended
  version says nothing about. `scm_version.json` stays absent there, because
  a pretended version must not be recorded as what the SCM said. ([#1540]( ))

## 10.3.2 (2026-09-14)
### Fixed

- Stop the command mixins from reordering a project's own ``build_py``,
  ``egg_info``
  or ``bdist_wheel`` MRO. ``ScmVersionFileMixin`` and friends inherited from the
  corresponding setuptools command, so wrapping a project class built on a
  disjoint
  hierarchy -- ``distutils.command.build_py``, or the standalone ``wheel``
  package's
  ``bdist_wheel`` -- placed setuptools' command *ahead* of the project's class.
  ``setuptools.build_py.run()`` does not delegate any further, so the project's
  ``run()`` was silently skipped, surfacing as
  ``error: package directory '...' does not exist``. The mixins now carry no
  runtime
  base class and linearise to ``(wrapped, mixin, *project_command.__mro__)``.
  ([#1531]( ))
- Leave a project's ``cmdclass`` alone when setuptools-scm is installed but not
  actually inferring a version. ``build_py``, ``egg_info`` and ``bdist_wheel``
  are
  now registered only once version inference has stored data on the distribution
  --
  the precondition for any of the mixins doing something. Previously every
  project
  with a ``pyproject.toml`` had its commands wrapped, including projects with no
  ``[tool.setuptools_scm]`` section at all.

  Note for projects that *used* to configure setuptools-scm and no longer do: a
  ``scm_version.json`` left behind in a stale ``*.egg-info`` directory is no
  longer
  stripped from built wheels, because the ``bdist_wheel`` mixin that strips it
  is no
  longer registered either. Remove the stale ``*.egg-info`` directory. ([#1533](
  ))

## 10.3.1 (2026-09-14)
### Fixed

- Require ``vcs-versioning>=2.4.0``. setuptools-scm 10.3.0 declared ``>=2.3.2``
  but
  imports ``vcs_versioning._file_finders.scm_search_known_failed``, which vcs-
  versioning
  only gained in 2.4.0, so installing it alongside an older vcs-versioning
  failed with
  ``ImportError``. CI now installs setuptools-scm against the oldest vcs-
  versioning its
  metadata permits, so the lower bound can no longer go stale unnoticed.
  ([#1528]( ))

## 10.3.0 (2026-09-12)
### Deprecated

- Emit a ``DeprecationWarning`` when the ``setuptools.file_finders`` entry point
  is invoked for a project that does not configure setuptools-scm. The entry
  point will be removed in a future major release. ([#1407]( ))

### Fixed

- Run the `setuptools.file_finders` hook inside a setuptools-scm override
  context. It previously resolved settings under the `VCS_VERSIONING` prefix
  only, so documented variables such as `SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT` and
  `SETUPTOOLS_SCM_HG_COMMAND` were ignored when finding files.

  When version inference has already run and found no SCM checkout, the
  `egg_info` mixin

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...etuptools-scm_10.2.3.bb => python3-setuptools-scm_10.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.2.3.bb => python3-setuptools-scm_10.3.4.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb
index 0af4bd24f5..db9a565439 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "f179ed3e2a63cf5823e5ee9aa9ca08386219400443a0553224d72dde3f206b44"
+SRC_URI[sha256sum] = "a69f28bfc245608781205e912faae437c2b2165773afa4e7b979d77447a69dd2"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.47.1


--===============4394245469785121268==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-10.2.3-10.3.4.patch"

RnJvbSAxYTE3MDMxYWYxNDZmN2NiOGQ3YWQzNzZlNjI4YmFkMGQ0ZGUyMzM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjQgU2VwIDIwMjYgMDU6MTU6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDEwLjIuMyAtPiAxMC4zLjQKCiMjIDEwLjMu
NCAoMjAyNi0wOS0yMykKIyMjIEZpeGVkCgotIFNoaXAgdGhlIHRyYWNrZWQgZmlsZXMgb2YgcHJv
amVjdHMgd2hvc2UgYHB5cHJvamVjdC50b21sYCBzaXRzIGluIGEKICBzdWJkaXJlY3RvcnkKICBv
ZiB0aGUgY2hlY2tvdXQuIGByb290YCBkZWZhdWx0cyB0byB0aGUgcHJvamVjdCBkaXJlY3Rvcnks
IHNvIHZlcnNpb24KICBpbmZlcmVuY2UKICBjb3JyZWN0bHkgZmluZHMgbm8gU0NNIHRoZXJlIGFu
ZCBhbnN3ZXJzIGZyb20gYFNFVFVQVE9PTFNfU0NNX1BSRVRFTkRfVkVSU0lPTmAKICBvciBgZmFs
bGJhY2tfdmVyc2lvbmAgLS0gYnV0IHRoYXQgc2F5cyBub3RoaW5nIGFib3V0IHdoaWNoIGZpbGVz
IGdpdCB0cmFja3MsCiAgYW5kCiAgdGhlIHNkaXN0IGFuZCB3aGVlbCBjYW1lIG91dCB3aXRoIG5v
bmUgb2YgdGhlbS4gVGhpcyB3YXMgdGhlIDEwLjMuMCByZWdyZXNzaW9uCiAgZml4ZWQgaW4gMTAu
My4zLCBzdXJ2aXZpbmcgaW4gdGhlIHN1YmRpcmVjdG9yeSBsYXlvdXQuCgogIEZpbGUgZGlzY292
ZXJ5IG5vdyBmb2xsb3dzIHRoZSBjaGVja291dCB0aGUgcHJvamVjdCBzaXRzIGluLCBpbmRlcGVu
ZGVudGx5IG9mCiAgdGhlIGByb290YCB0aGF0IHNjb3BlcyB2ZXJzaW9uaW5nLCBhbmQgcmVjb3Jk
cyBgc2NtX2ZpbGVfbGlzdC5qc29uYCBpbiB0aGUKICBlZ2ctaW5mbyBhcyBhIHJvb3QtbGV2ZWwg
cHJvamVjdCBhbHJlYWR5IGRpZC4gKFsjMTU0M10oICkpCi0gUmVxdWlyZSBgdmNzLXZlcnNpb25p
bmc+PTIuNS4wYC4gVGhlIHN1YmRpcmVjdG9yeSBmaWxlLWRpc2NvdmVyeSBmaXggKCMxNTQzKQog
IGltcG9ydHMKICBgZGlzY292ZXJfZmlsZV93b3JrZGlyYCwgd2hpY2ggbm8gZWFybGllciByZWxl
YXNlIGhhcywgd2hpbGUgdGhlIGRlY2xhcmVkCiAgZmxvb3Igc3RpbGwKICBuYW1lZCAyLjQuMCAt
LSBhbiBpbnN0YWxsIGFnYWluc3QgYSBwdWJsaXNoZWQgdmNzLXZlcnNpb25pbmcgcmFpc2VkCiAg
YEltcG9ydEVycm9yYAogIGR1cmluZyB0aGUgYnVpbGQuIChbIzE1NDZdKCApKQoKIyMgMTAuMy4z
ICgyMDI2LTA5LTE2KQojIyMgRml4ZWQKCi0gS2VlcCBmaWxlIGRpc2NvdmVyeSB3b3JraW5nIHdo
ZW4gdGhlIHZlcnNpb24gaXMgcHJldGVuZGVkLgogIGBTRVRVUFRPT0xTX1NDTV9QUkVURU5EX1ZF
UlNJT05gIGFuZCBpdHMgc2NvcGVkIGBfRk9SXzxESVNUPmAgZm9ybSBtYWRlCiAgdmVyc2lvbiBp
bmZlcmVuY2UgcmV0dXJuIGJlZm9yZSBkaXNjb3ZlcmluZyBhIHdvcmtkaXIsIGFuZCB0aGUgYGVn
Z19pbmZvYAogIG1peGluIHJlYWQgdGhlIGFic2VudCB3b3JrZGlyIGFzICJzZWFyY2hlZCwgZm91
bmQgbm8gY2hlY2tvdXQiIC0tIHRoZSBzaWduYWwKICBpdCBhY3RzIG9uIGJ5IHN1cHByZXNzaW5n
IHRoZSBgc2V0dXB0b29scy5maWxlX2ZpbmRlcnNgIGNoYWluLiBFdmVyeQogIFNDTS10cmFja2Vk
IGZpbGUgdGhhdCBzZXR1cHRvb2xzJyBvd24gcGFja2FnZSBkaXNjb3ZlcnkgZG9lcyBub3QgZmlu
ZCB3YXMKICB0aGVuIGRyb3BwZWQgZnJvbSB0aGUgc2Rpc3QgYW5kIHRoZSB3aGVlbCwgc2lsZW50
bHksIHNpbmNlIHRoZSBidWlsZAogIHN1Y2NlZWRlZCBhbmQgdGhlIHZlcnNpb24gd2FzIGNvcnJl
Y3QuCgogIEEgcHJldGVuZGVkIHZlcnNpb24gc3RpbGwgc2tpcHMgZGlzY292ZXJ5LCBiZWNhdXNl
IG1vc3QgYnVpbGRzIG9ubHkgd2FudCBhCiAgdmVyc2lvbiBhbmQgcHJvYmluZyBmb3IgYSBjaGVj
a291dCBub2JvZHkgYXNrcyBhYm91dCBjb3N0cyBzdWJwcm9jZXNzZXMgZm9yCiAgbm90aGluZy4g
V2hhdCBubyBsb25nZXIgaGFwcGVucyBpcyBwYXNzaW5nIHRoYXQgb2ZmIGFzIGFuIGFuc3dlcjog
Im5vYm9keQogIGxvb2tlZCB5ZXQiIGlzIG5vdyBkaXN0aW5jdCBmcm9tICJsb29rZWQgYW5kIGZv
dW5kIG5vdGhpbmciLCBhbmQgdGhlIHdvcmtkaXIKICBpcyBkaXNjb3ZlcmVkIG9uIGRlbWFuZCB0
aGUgZmlyc3QgdGltZSBhIGNvbnN1bWVyIG5lZWRzIGEgZmlsZSBsaXN0LgoKICBgc2NtX2ZpbGVf
bGlzdC5qc29uYCBpcyBub3cgd3JpdHRlbiB0byB0aGUgZWdnLWluZm8gZm9yIHByZXRlbmRlZCBi
dWlsZHMgYXMKICB3ZWxsLiBJdCBkZXNjcmliZXMgd2hpY2ggZmlsZXMgdGhlIGNoZWNrb3V0IHRy
YWNrcywgd2hpY2ggYSBwcmV0ZW5kZWQKICB2ZXJzaW9uIHNheXMgbm90aGluZyBhYm91dC4gYHNj
bV92ZXJzaW9uLmpzb25gIHN0YXlzIGFic2VudCB0aGVyZSwgYmVjYXVzZQogIGEgcHJldGVuZGVk
IHZlcnNpb24gbXVzdCBub3QgYmUgcmVjb3JkZWQgYXMgd2hhdCB0aGUgU0NNIHNhaWQuIChbIzE1
NDBdKCApKQoKIyMgMTAuMy4yICgyMDI2LTA5LTE0KQojIyMgRml4ZWQKCi0gU3RvcCB0aGUgY29t
bWFuZCBtaXhpbnMgZnJvbSByZW9yZGVyaW5nIGEgcHJvamVjdCdzIG93biBgYGJ1aWxkX3B5YGAs
CiAgYGBlZ2dfaW5mb2BgCiAgb3IgYGBiZGlzdF93aGVlbGBgIE1STy4gYGBTY21WZXJzaW9uRmls
ZU1peGluYGAgYW5kIGZyaWVuZHMgaW5oZXJpdGVkIGZyb20gdGhlCiAgY29ycmVzcG9uZGluZyBz
ZXR1cHRvb2xzIGNvbW1hbmQsIHNvIHdyYXBwaW5nIGEgcHJvamVjdCBjbGFzcyBidWlsdCBvbiBh
CiAgZGlzam9pbnQKICBoaWVyYXJjaHkgLS0gYGBkaXN0dXRpbHMuY29tbWFuZC5idWlsZF9weWBg
LCBvciB0aGUgc3RhbmRhbG9uZSBgYHdoZWVsYGAKICBwYWNrYWdlJ3MKICBgYGJkaXN0X3doZWVs
YGAgLS0gcGxhY2VkIHNldHVwdG9vbHMnIGNvbW1hbmQgKmFoZWFkKiBvZiB0aGUgcHJvamVjdCdz
IGNsYXNzLgogIGBgc2V0dXB0b29scy5idWlsZF9weS5ydW4oKWBgIGRvZXMgbm90IGRlbGVnYXRl
IGFueSBmdXJ0aGVyLCBzbyB0aGUgcHJvamVjdCdzCiAgYGBydW4oKWBgIHdhcyBzaWxlbnRseSBz
a2lwcGVkLCBzdXJmYWNpbmcgYXMKICBgYGVycm9yOiBwYWNrYWdlIGRpcmVjdG9yeSAnLi4uJyBk
b2VzIG5vdCBleGlzdGBgLiBUaGUgbWl4aW5zIG5vdyBjYXJyeSBubwogIHJ1bnRpbWUKICBiYXNl
IGNsYXNzIGFuZCBsaW5lYXJpc2UgdG8gYGAod3JhcHBlZCwgbWl4aW4sICpwcm9qZWN0X2NvbW1h
bmQuX19tcm9fXylgYC4KICAoWyMxNTMxXSggKSkKLSBMZWF2ZSBhIHByb2plY3QncyBgYGNtZGNs
YXNzYGAgYWxvbmUgd2hlbiBzZXR1cHRvb2xzLXNjbSBpcyBpbnN0YWxsZWQgYnV0IG5vdAogIGFj
dHVhbGx5IGluZmVycmluZyBhIHZlcnNpb24uIGBgYnVpbGRfcHlgYCwgYGBlZ2dfaW5mb2BgIGFu
ZCBgYGJkaXN0X3doZWVsYGAKICBhcmUKICBub3cgcmVnaXN0ZXJlZCBvbmx5IG9uY2UgdmVyc2lv
biBpbmZlcmVuY2UgaGFzIHN0b3JlZCBkYXRhIG9uIHRoZSBkaXN0cmlidXRpb24KICAtLQogIHRo
ZSBwcmVjb25kaXRpb24gZm9yIGFueSBvZiB0aGUgbWl4aW5zIGRvaW5nIHNvbWV0aGluZy4gUHJl
dmlvdXNseSBldmVyeQogIHByb2plY3QKICB3aXRoIGEgYGBweXByb2plY3QudG9tbGBgIGhhZCBp
dHMgY29tbWFuZHMgd3JhcHBlZCwgaW5jbHVkaW5nIHByb2plY3RzIHdpdGggbm8KICBgYFt0b29s
LnNldHVwdG9vbHNfc2NtXWBgIHNlY3Rpb24gYXQgYWxsLgoKICBOb3RlIGZvciBwcm9qZWN0cyB0
aGF0ICp1c2VkKiB0byBjb25maWd1cmUgc2V0dXB0b29scy1zY20gYW5kIG5vIGxvbmdlciBkbzog
YQogIGBgc2NtX3ZlcnNpb24uanNvbmBgIGxlZnQgYmVoaW5kIGluIGEgc3RhbGUgYGAqLmVnZy1p
bmZvYGAgZGlyZWN0b3J5IGlzIG5vCiAgbG9uZ2VyCiAgc3RyaXBwZWQgZnJvbSBidWlsdCB3aGVl
bHMsIGJlY2F1c2UgdGhlIGBgYmRpc3Rfd2hlZWxgYCBtaXhpbiB0aGF0IHN0cmlwcyBpdAogIGlz
IG5vCiAgbG9uZ2VyIHJlZ2lzdGVyZWQgZWl0aGVyLiBSZW1vdmUgdGhlIHN0YWxlIGBgKi5lZ2ct
aW5mb2BgIGRpcmVjdG9yeS4gKFsjMTUzM10oCiAgKSkKCiMjIDEwLjMuMSAoMjAyNi0wOS0xNCkK
IyMjIEZpeGVkCgotIFJlcXVpcmUgYGB2Y3MtdmVyc2lvbmluZz49Mi40LjBgYC4gc2V0dXB0b29s
cy1zY20gMTAuMy4wIGRlY2xhcmVkIGBgPj0yLjMuMmBgCiAgYnV0CiAgaW1wb3J0cyBgYHZjc192
ZXJzaW9uaW5nLl9maWxlX2ZpbmRlcnMuc2NtX3NlYXJjaF9rbm93bl9mYWlsZWRgYCwgd2hpY2gg
dmNzLQogIHZlcnNpb25pbmcKICBvbmx5IGdhaW5lZCBpbiAyLjQuMCwgc28gaW5zdGFsbGluZyBp
dCBhbG9uZ3NpZGUgYW4gb2xkZXIgdmNzLXZlcnNpb25pbmcKICBmYWlsZWQgd2l0aAogIGBgSW1w
b3J0RXJyb3JgYC4gQ0kgbm93IGluc3RhbGxzIHNldHVwdG9vbHMtc2NtIGFnYWluc3QgdGhlIG9s
ZGVzdCB2Y3MtCiAgdmVyc2lvbmluZyBpdHMKICBtZXRhZGF0YSBwZXJtaXRzLCBzbyB0aGUgbG93
ZXIgYm91bmQgY2FuIG5vIGxvbmdlciBnbyBzdGFsZSB1bm5vdGljZWQuCiAgKFsjMTUyOF0oICkp
CgojIyAxMC4zLjAgKDIwMjYtMDktMTIpCiMjIyBEZXByZWNhdGVkCgotIEVtaXQgYSBgYERlcHJl
Y2F0aW9uV2FybmluZ2BgIHdoZW4gdGhlIGBgc2V0dXB0b29scy5maWxlX2ZpbmRlcnNgYCBlbnRy
eSBwb2ludAogIGlzIGludm9rZWQgZm9yIGEgcHJvamVjdCB0aGF0IGRvZXMgbm90IGNvbmZpZ3Vy
ZSBzZXR1cHRvb2xzLXNjbS4gVGhlIGVudHJ5CiAgcG9pbnQgd2lsbCBiZSByZW1vdmVkIGluIGEg
ZnV0dXJlIG1ham9yIHJlbGVhc2UuIChbIzE0MDddKCApKQoKIyMjIEZpeGVkCgotIFJ1biB0aGUg
YHNldHVwdG9vbHMuZmlsZV9maW5kZXJzYCBob29rIGluc2lkZSBhIHNldHVwdG9vbHMtc2NtIG92
ZXJyaWRlCiAgY29udGV4dC4gSXQgcHJldmlvdXNseSByZXNvbHZlZCBzZXR0aW5ncyB1bmRlciB0
aGUgYFZDU19WRVJTSU9OSU5HYCBwcmVmaXgKICBvbmx5LCBzbyBkb2N1bWVudGVkIHZhcmlhYmxl
cyBzdWNoIGFzIGBTRVRVUFRPT0xTX1NDTV9TVUJQUk9DRVNTX1RJTUVPVVRgIGFuZAogIGBTRVRV
UFRPT0xTX1NDTV9IR19DT01NQU5EYCB3ZXJlIGlnbm9yZWQgd2hlbiBmaW5kaW5nIGZpbGVzLgoK
ICBXaGVuIHZlcnNpb24gaW5mZXJlbmNlIGhhcyBhbHJlYWR5IHJ1biBhbmQgZm91bmQgbm8gU0NN
IGNoZWNrb3V0LCB0aGUKICBgZWdnX2luZm9gIG1peGluCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBh
cyBpdCBleGNlZWRzIDUwMDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBm
b3VuZCBpbiBhbiBhdHRhY2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uZXR1cHRvb2xz
LXNjbV8xMC4yLjMuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4zLjQuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4y
LjMuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4zLjQuYmJ9ICg4OSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2Nt
XzEwLjIuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRv
b2xzLXNjbV8xMC4zLjQuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzEwLjIuMy5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMt
c2NtXzEwLjMuNC5iYgppbmRleCAwYWY0YmQyNGY1Li5kYjlhNTY1NDM5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21fMTAuMi4z
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV8xMC4zLjQuYmIKQEAgLTYsNyArNiw3IEBAIGFyZ3VtZW50IG9yIGluIGEgU0NNIG1hbmFn
ZWQgZmlsZS4iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTgzOGMzNjZmNjliNzJjNWRmMDVjOTZkZmY3OWIzNWYyIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZjE3OWVkM2UyYTYzY2Y1ODIzZTVlZTlhYTljYTA4Mzg2MjE5NDAwNDQzYTA1
NTMyMjRkNzJkZGUzZjIwNmI0NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNjlmMjhiZmMyNDU2
MDg3ODEyMDVlOTEyZmFhZTQzN2MyYjIxNjU3NzNhZmE0ZTdiOTc5ZDc3NDQ3YTY5ZGQyIgogCiBQ
WVBJX1BBQ0tBR0UgPSAic2V0dXB0b29sc19zY20iCiAKLS0gCjIuNDcuMQoK

--===============4394245469785121268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-setuptools-scm-changelog.txt"

## 10.3.4 (2026-09-23)
### Fixed

- Ship the tracked files of projects whose `pyproject.toml` sits in a
  subdirectory
  of the checkout. `root` defaults to the project directory, so version
  inference
  correctly finds no SCM there and answers from `SETUPTOOLS_SCM_PRETEND_VERSION`
  or `fallback_version` -- but that says nothing about which files git tracks,
  and
  the sdist and wheel came out with none of them. This was the 10.3.0 regression
  fixed in 10.3.3, surviving in the subdirectory layout.

  File discovery now follows the checkout the project sits in, independently of
  the `root` that scopes versioning, and records `scm_file_list.json` in the
  egg-info as a root-level project already did. ([#1543]( ))
- Require `vcs-versioning>=2.5.0`. The subdirectory file-discovery fix (#1543)
  imports
  `discover_file_workdir`, which no earlier release has, while the declared
  floor still
  named 2.4.0 -- an install against a published vcs-versioning raised
  `ImportError`
  during the build. ([#1546]( ))

## 10.3.3 (2026-09-16)
### Fixed

- Keep file discovery working when the version is pretended.
  `SETUPTOOLS_SCM_PRETEND_VERSION` and its scoped `_FOR_<DIST>` form made
  version inference return before discovering a workdir, and the `egg_info`
  mixin read the absent workdir as "searched, found no checkout" -- the signal
  it acts on by suppressing the `setuptools.file_finders` chain. Every
  SCM-tracked file that setuptools' own package discovery does not find was
  then dropped from the sdist and the wheel, silently, since the build
  succeeded and the version was correct.

  A pretended version still skips discovery, because most builds only want a
  version and probing for a checkout nobody asks about costs subprocesses for
  nothing. What no longer happens is passing that off as an answer: "nobody
  looked yet" is now distinct from "looked and found nothing", and the workdir
  is discovered on demand the first time a consumer needs a file list.

  `scm_file_list.json` is now written to the egg-info for pretended builds as
  well. It describes which files the checkout tracks, which a pretended
  version says nothing about. `scm_version.json` stays absent there, because
  a pretended version must not be recorded as what the SCM said. ([#1540]( ))

## 10.3.2 (2026-09-14)
### Fixed

- Stop the command mixins from reordering a project's own ``build_py``,
  ``egg_info``
  or ``bdist_wheel`` MRO. ``ScmVersionFileMixin`` and friends inherited from the
  corresponding setuptools command, so wrapping a project class built on a
  disjoint
  hierarchy -- ``distutils.command.build_py``, or the standalone ``wheel``
  package's
  ``bdist_wheel`` -- placed setuptools' command *ahead* of the project's class.
  ``setuptools.build_py.run()`` does not delegate any further, so the project's
  ``run()`` was silently skipped, surfacing as
  ``error: package directory '...' does not exist``. The mixins now carry no
  runtime
  base class and linearise to ``(wrapped, mixin, *project_command.__mro__)``.
  ([#1531]( ))
- Leave a project's ``cmdclass`` alone when setuptools-scm is installed but not
  actually inferring a version. ``build_py``, ``egg_info`` and ``bdist_wheel``
  are
  now registered only once version inference has stored data on the distribution
  --
  the precondition for any of the mixins doing something. Previously every
  project
  with a ``pyproject.toml`` had its commands wrapped, including projects with no
  ``[tool.setuptools_scm]`` section at all.

  Note for projects that *used* to configure setuptools-scm and no longer do: a
  ``scm_version.json`` left behind in a stale ``*.egg-info`` directory is no
  longer
  stripped from built wheels, because the ``bdist_wheel`` mixin that strips it
  is no
  longer registered either. Remove the stale ``*.egg-info`` directory. ([#1533](
  ))

## 10.3.1 (2026-09-14)
### Fixed

- Require ``vcs-versioning>=2.4.0``. setuptools-scm 10.3.0 declared ``>=2.3.2``
  but
  imports ``vcs_versioning._file_finders.scm_search_known_failed``, which vcs-
  versioning
  only gained in 2.4.0, so installing it alongside an older vcs-versioning
  failed with
  ``ImportError``. CI now installs setuptools-scm against the oldest vcs-
  versioning its
  metadata permits, so the lower bound can no longer go stale unnoticed.
  ([#1528]( ))

## 10.3.0 (2026-09-12)
### Deprecated

- Emit a ``DeprecationWarning`` when the ``setuptools.file_finders`` entry point
  is invoked for a project that does not configure setuptools-scm. The entry
  point will be removed in a future major release. ([#1407]( ))

### Fixed

- Run the `setuptools.file_finders` hook inside a setuptools-scm override
  context. It previously resolved settings under the `VCS_VERSIONING` prefix
  only, so documented variables such as `SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT` and
  `SETUPTOOLS_SCM_HG_COMMAND` were ignored when finding files.

  When version inference has already run and found no SCM checkout, the
  `egg_info` mixin now tells the file finders so, rather than letting
  `walk_revctrl()` re-probe every backend for a repository known to be absent.
  ([#1212]( ))

--===============4394245469785121268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-c4b3f167a07df83b6c559121f9c6d63daa9bd84a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:c4b3f167a07df83b6c559121f9c6d63daa9bd84a"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 470 Local 443 Mirrors 0 Missed 27 Current 320 (94% match, 96% complete)
done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 378 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 397 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 476 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 602 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 648 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 660 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1161 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1279 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_recipe_qa)
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1451 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 747 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_setscene)
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 750 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 751 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 753 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 755 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 758 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running task 1478 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_fetch)
NOTE: Running task 1483 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-native-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1503 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1504 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1512 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_fetch)
NOTE: Running task 1513 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 761 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_fetch: Started
NOTE: Running setscene task 763 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1637 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1660 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1672 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_patch)
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_fetch: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1722 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_fetch)
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1738 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_unpack)
NOTE: Running task 1765 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 1877 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_create_recipe_spdx)
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1886 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1891 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_patch)
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1892 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_fetch: Succeeded
NOTE: Running task 1893 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_unpack: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1894 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_unpack: Started
NOTE: recipe cargo-native-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo_1.98.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgit2/libgit2_1.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-native-20260816-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_patch: Started
NOTE: recipe libgit2-native-1.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cargo-native-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1897 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_configure)
NOTE: recipe cargo-native-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 770 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_rust_gen_targets)
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgit2-native-1.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libssh2/libssh2_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgit2/libgit2_1.9.7.bb:do_recipe_qa_setscene)
NOTE: recipe ca-certificates-native-20260816-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_patch)
NOTE: recipe ca-certificates-native-20260816-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgit2-native-1.9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1919 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_compile)
NOTE: Running task 1920 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_populate_lic)
NOTE: recipe ca-certificates-native-20260816-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgit2-native-1.9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_populate_lic: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_compile: Started
NOTE: Running setscene task 777 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libssh2/libssh2_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_patch: Succeeded
NOTE: Running task 1937 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_rust_gen_targets)
NOTE: recipe libssh2-native-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1954 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_configure)
NOTE: recipe rust-native-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_configure: Started
NOTE: Running setscene task 779 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust_1.98.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 780 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 782 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.98.1.bb:do_recipe_qa_setscene)
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_configure: Succeeded
NOTE: recipe patchelf-native-0.19.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-native-23.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1957 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_compile)
NOTE: recipe rust-native-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_compile: Started
NOTE: recipe patchelf-native-0.19.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_recipe_qa_setscene)
NOTE: recipe patchelf-native-0.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe patchelf-native-0.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-native-23.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 790 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1979 of 2068 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_unpack)
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-native-23.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-native-23.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 790 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_unpack: Started
NOTE: recipe llvm-project-source-23.1.1-23.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-project-source-23.1.1-23.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| running egg_info
| writing src/setuptools_scm.egg-info/PKG-INFO
| writing dependency_links to src/setuptools_scm.egg-info/dependency_links.txt
| writing entry points to src/setuptools_scm.egg-info/entry_points.txt
| writing requirements to src/setuptools_scm.egg-info/requires.txt
| writing top-level names to src/setuptools_scm.egg-info/top_level.txt
| reading manifest file 'src/setuptools_scm.egg-info/SOURCES.txt'
| reading manifest template 'MANIFEST.in'
| warning: no previously-included files found matching '*.nix'
| warning: no previously-included files found matching '.pre-commit-config.yaml'
| warning: no previously-included files found matching 'changelog.d/*'
| warning: no previously-included files found matching '.git_archival.txt'
| warning: no previously-included files found matching '.readthedocs.yaml'
| warning: no files found matching '*.rst'
| warning: no files found matching 'testing_scm/Dockerfile.*'
| warning: no files found matching '*.bash' under directory 'testing_scm'
| no previously-included directories found matching '.cursor'
| adding license file 'LICENSE'
| writing manifest file 'src/setuptools_scm.egg-info/SOURCES.txt'
| WARNING version of None already set
| WARNING `project.license` as a TOML table is deprecated
| !!
| 
|         ********************************************************************************
|         Please use a simple string containing a SPDX expression for `project.license`. You can also use `project.license-files`. (Both options available on setuptools>=77.0.0).
| 
|         By 2027-Feb-18, you need to update your project and remove deprecated calls
|         or your builds will no longer be supported.
| 
|         See https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license for details.
|         ********************************************************************************
| 
| !!
| 
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.4/recipe-sysroot-native/usr/bin/nativepython3):
| 	vcs-versioning<3,>=2.5.0.dev0
| 		wanted: <3,>=2.5.0.dev0
| 		found: 2.4.0
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.4/temp/run.do_compile.1900279:155 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.4/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.4/sources/setuptools_scm-10.3.4'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.4/temp/run.do_compile.1900279, line 155
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.4/temp/run.do_compile.1900279, line 150
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.4/temp/run.do_compile.1900279, line 159
NOTE: recipe python3-setuptools-scm-native-10.3.4-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| running egg_info
| writing src/setuptools_scm.egg-info/PKG-INFO
| writing dependency_links to src/setuptools_scm.egg-info/dependency_links.txt
| writing entry points to src/setuptools_scm.egg-info/entry_points.txt
| writing requirements to src/setuptools_scm.egg-info/requires.txt
| writing top-level names to src/setuptools_scm.egg-info/top_level.txt
| reading manifest file 'src/setuptools_scm.egg-info/SOURCES.txt'
| reading manifest template 'MANIFEST.in'
| warning: no previously-included files found matching '*.nix'
| warning: no previously-included files found matching '.pre-commit-config.yaml'
| warning: no previously-included files found matching 'changelog.d/*'
| warning: no previously-included files found matching '.git_archival.txt'
| warning: no previously-included files found matching '.readthedocs.yaml'
| warning: no files found matching '*.rst'
| warning: no files found matching 'testing_scm/Dockerfile.*'
| warning: no files found matching '*.bash' under directory 'testing_scm'
| no previously-included directories found matching '.cursor'
| adding license file 'LICENSE'
| writing manifest file 'src/setuptools_scm.egg-info/SOURCES.txt'
| WARNING version of None already set
| WARNING `project.license` as a TOML table is deprecated
| !!
| 
|         ********************************************************************************
|         Please use a simple string containing a SPDX expression for `project.license`. You can also use `project.license-files`. (Both options available on setuptools>=77.0.0).
| 
|         By 2027-Feb-18, you need to update your project and remove deprecated calls
|         or your builds will no longer be supported.
| 
|         See https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license for details.
|         ********************************************************************************
| 
| !!
| 
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.4/recipe-sysroot-native/usr/bin/nativepython3):
| 	vcs-versioning<3,>=2.5.0.dev0
| 		wanted: <3,>=2.5.0.dev0
| 		found: 2.4.0
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.4/temp/run.do_compile.1900504:152 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.4/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.4/sources/setuptools_scm-10.3.4'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.4/temp/run.do_compile.1900504, line 152
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.4/temp/run.do_compile.1900504, line 147
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.4/temp/run.do_compile.1900504, line 164
NOTE: recipe python3-setuptools-scm-10.3.4-r0: task do_compile: Failed
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2020 tasks of which 1989 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260924051539.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260924051539.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.4/temp/log.do_compile.1900279
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.4/temp/log.do_compile.1900504
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-scm-native-10.3.4-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.4/temp/run.do_compile.1900279' failed with exit code 1
ERROR: python3-setuptools-scm-10.3.4-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.4/temp/run.do_compile.1900504' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.4/temp/log.do_compile.1900279
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.4/temp/log.do_compile.1900504
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.4.bb:do_compile) failed with exit code '1'

--===============4394245469785121268==--

