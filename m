Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6307DC982C2
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 05:49:36 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16957.1789451367828845730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 22:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YCThe8z/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZNa+0fMp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0a39cf1ce-660e44b7-7bdd-4f21-b6df-7afe043994a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789451367;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A/eKbItsK6WZADOjI7Jijp3pgrkonaYRGs20EUM1n0o=;
	b=YCThe8z/ZQ3UDfEcuJXujfo+9+Pn6/y/NQtASG2W7DCt/Y/dFcTFSbvaCRjKpB1Z
	Atx6BnOr1AAne6JonYQP7CQXHjou74HGHBvHCWTbsRcisGbNnMYadgCAYwaHnd74k2k
	9/1z2ZCSMCY3Wdu/QJUyxjuqHmZbFk+MbdEZBrfI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789451367;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A/eKbItsK6WZADOjI7Jijp3pgrkonaYRGs20EUM1n0o=;
	b=ZNa+0fMpXbxrLqA7mHQyI1WsTP3DA+Lri2Z00navanyjsYuldh3BwYyEHh+3a4wT
	8nkQyzYu2EK+4XTIZZa+3XvuvJ+XMZDiNHfbAJSFZYHO/QoKRs4rNTldaPFGoDp0AOY
	haLhZviJXyK1xzrkTn0AizYIFfyynia/eK6zNVnE=
Content-Type: multipart/mixed; boundary="===============3255972979860693703=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 10.3.2 FAILED
Message-ID: <010101a0a39cf1ce-660e44b7-7bdd-4f21-b6df-7afe043994a6-000000@us-west-2.amazonses.com>
Date: Tue, 15 Sep 2026 05:49:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 05:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245814

--===============3255972979860693703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *10.3.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-10.2.3-10.3.2.patch
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
From 7f108232b164dde8bec89f10756f9a5d8e5bfc22 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Sep 2026 05:13:29 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 10.2.3 -> 10.3.2

Source: CHANGELOG.md

## 10.3.2 (2026-09-14)

### Fixed

- Stop the command mixins from reordering a project's own ``build_py``, ``egg_info``
  or ``bdist_wheel`` MRO. ``ScmVersionFileMixin`` and friends inherited from the
  corresponding setuptools command, so wrapping a project class built on a disjoint
  hierarchy -- ``distutils.command.build_py``, or the standalone ``wheel`` package's
  ``bdist_wheel`` -- placed setuptools' command *ahead* of the project's class.
  ``setuptools.build_py.run()`` does not delegate any further, so the project's
  ``run()`` was silently skipped, surfacing as
  ``error: package directory '...' does not exist``. The mixins now carry no runtime
  base class and linearise to ``(wrapped, mixin, *project_command.__mro__)``. ([#1531](https://github.com/pypa/setuptools-scm/issues/1531))
- Leave a project's ``cmdclass`` alone when setuptools-scm is installed but not
  actually inferring a version. ``build_py``, ``egg_info`` and ``bdist_wheel`` are
  now registered only once version inference has stored data on the distribution --
  the precondition for any of the mixins doing something. Previously every project
  with a ``pyproject.toml`` had its commands wrapped, including projects with no
  ``[tool.setuptools_scm]`` section at all.

  Note for projects that *used* to configure setuptools-scm and no longer do: a
  ``scm_version.json`` left behind in a stale ``*.egg-info`` directory is no longer
  stripped from built wheels, because the ``bdist_wheel`` mixin that strips it is no
  longer registered either. Remove the stale ``*.egg-info`` directory. ([#1533](https://github.com/pypa/setuptools-scm/issues/1533))

## 10.3.1 (2026-09-14)

### Fixed

- Require ``vcs-versioning>=2.4.0``. setuptools-scm 10.3.0 declared ``>=2.3.2`` but
  imports ``vcs_versioning._file_finders.scm_search_known_failed``, which vcs-versioning
  only gained in 2.4.0, so installing it alongside an older vcs-versioning failed with
  ``ImportError``. CI now installs setuptools-scm against the oldest vcs-versioning its
  metadata permits, so the lower bound can no longer go stale unnoticed. ([#1528](https://github.com/pypa/setuptools-scm/issues/1528))

## 10.3.0 (2026-09-12)

### Deprecated

- Emit a ``DeprecationWarning`` when the ``setuptools.file_finders`` entry point is invoked for a project that does not configure setuptools-scm. The entry point will be removed in a future major release. ([#1407](https://github.com/pypa/setuptools-scm/issues/1407))

### Fixed

- Run the `setuptools.file_finders` hook inside a setuptools-scm override context. It previously resolved settings under the `VCS_VERSIONING` prefix only, so documented variables such as `SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT` and `SETUPTOOLS_SCM_HG_COMMAND` were ignored when finding files.

  When version inference has already run and found no SCM checkout, the `egg_info` mixin now tells the file finders so, rather than letting `walk_revctrl()` re-probe every backend for a repository known to be a

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...etuptools-scm_10.2.3.bb => python3-setuptools-scm_10.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.2.3.bb => python3-setuptools-scm_10.3.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb
index 0af4bd24f5..30c9483abb 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "f179ed3e2a63cf5823e5ee9aa9ca08386219400443a0553224d72dde3f206b44"
+SRC_URI[sha256sum] = "205772a055fcad83a9c6bb533caaa5d864137cdb2bccf41be083bcf43fdda1c1"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.47.1


--===============3255972979860693703==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-10.2.3-10.3.2.patch"

RnJvbSA3ZjEwODIzMmIxNjRkZGU4YmVjODlmMTA3NTZmOWE1ZDhlNWJmYzIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgU2VwIDIwMjYgMDU6MTM6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDEwLjIuMyAtPiAxMC4zLjIKClNvdXJjZTog
Q0hBTkdFTE9HLm1kCgojIyAxMC4zLjIgKDIwMjYtMDktMTQpCgojIyMgRml4ZWQKCi0gU3RvcCB0
aGUgY29tbWFuZCBtaXhpbnMgZnJvbSByZW9yZGVyaW5nIGEgcHJvamVjdCdzIG93biBgYGJ1aWxk
X3B5YGAsIGBgZWdnX2luZm9gYAogIG9yIGBgYmRpc3Rfd2hlZWxgYCBNUk8uIGBgU2NtVmVyc2lv
bkZpbGVNaXhpbmBgIGFuZCBmcmllbmRzIGluaGVyaXRlZCBmcm9tIHRoZQogIGNvcnJlc3BvbmRp
bmcgc2V0dXB0b29scyBjb21tYW5kLCBzbyB3cmFwcGluZyBhIHByb2plY3QgY2xhc3MgYnVpbHQg
b24gYSBkaXNqb2ludAogIGhpZXJhcmNoeSAtLSBgYGRpc3R1dGlscy5jb21tYW5kLmJ1aWxkX3B5
YGAsIG9yIHRoZSBzdGFuZGFsb25lIGBgd2hlZWxgYCBwYWNrYWdlJ3MKICBgYGJkaXN0X3doZWVs
YGAgLS0gcGxhY2VkIHNldHVwdG9vbHMnIGNvbW1hbmQgKmFoZWFkKiBvZiB0aGUgcHJvamVjdCdz
IGNsYXNzLgogIGBgc2V0dXB0b29scy5idWlsZF9weS5ydW4oKWBgIGRvZXMgbm90IGRlbGVnYXRl
IGFueSBmdXJ0aGVyLCBzbyB0aGUgcHJvamVjdCdzCiAgYGBydW4oKWBgIHdhcyBzaWxlbnRseSBz
a2lwcGVkLCBzdXJmYWNpbmcgYXMKICBgYGVycm9yOiBwYWNrYWdlIGRpcmVjdG9yeSAnLi4uJyBk
b2VzIG5vdCBleGlzdGBgLiBUaGUgbWl4aW5zIG5vdyBjYXJyeSBubyBydW50aW1lCiAgYmFzZSBj
bGFzcyBhbmQgbGluZWFyaXNlIHRvIGBgKHdyYXBwZWQsIG1peGluLCAqcHJvamVjdF9jb21tYW5k
Ll9fbXJvX18pYGAuIChbIzE1MzFdKGh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL3NldHVwdG9vbHMt
c2NtL2lzc3Vlcy8xNTMxKSkKLSBMZWF2ZSBhIHByb2plY3QncyBgYGNtZGNsYXNzYGAgYWxvbmUg
d2hlbiBzZXR1cHRvb2xzLXNjbSBpcyBpbnN0YWxsZWQgYnV0IG5vdAogIGFjdHVhbGx5IGluZmVy
cmluZyBhIHZlcnNpb24uIGBgYnVpbGRfcHlgYCwgYGBlZ2dfaW5mb2BgIGFuZCBgYGJkaXN0X3do
ZWVsYGAgYXJlCiAgbm93IHJlZ2lzdGVyZWQgb25seSBvbmNlIHZlcnNpb24gaW5mZXJlbmNlIGhh
cyBzdG9yZWQgZGF0YSBvbiB0aGUgZGlzdHJpYnV0aW9uIC0tCiAgdGhlIHByZWNvbmRpdGlvbiBm
b3IgYW55IG9mIHRoZSBtaXhpbnMgZG9pbmcgc29tZXRoaW5nLiBQcmV2aW91c2x5IGV2ZXJ5IHBy
b2plY3QKICB3aXRoIGEgYGBweXByb2plY3QudG9tbGBgIGhhZCBpdHMgY29tbWFuZHMgd3JhcHBl
ZCwgaW5jbHVkaW5nIHByb2plY3RzIHdpdGggbm8KICBgYFt0b29sLnNldHVwdG9vbHNfc2NtXWBg
IHNlY3Rpb24gYXQgYWxsLgoKICBOb3RlIGZvciBwcm9qZWN0cyB0aGF0ICp1c2VkKiB0byBjb25m
aWd1cmUgc2V0dXB0b29scy1zY20gYW5kIG5vIGxvbmdlciBkbzogYQogIGBgc2NtX3ZlcnNpb24u
anNvbmBgIGxlZnQgYmVoaW5kIGluIGEgc3RhbGUgYGAqLmVnZy1pbmZvYGAgZGlyZWN0b3J5IGlz
IG5vIGxvbmdlcgogIHN0cmlwcGVkIGZyb20gYnVpbHQgd2hlZWxzLCBiZWNhdXNlIHRoZSBgYGJk
aXN0X3doZWVsYGAgbWl4aW4gdGhhdCBzdHJpcHMgaXQgaXMgbm8KICBsb25nZXIgcmVnaXN0ZXJl
ZCBlaXRoZXIuIFJlbW92ZSB0aGUgc3RhbGUgYGAqLmVnZy1pbmZvYGAgZGlyZWN0b3J5LiAoWyMx
NTMzXShodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzLXNjbS9pc3N1ZXMvMTUzMykp
CgojIyAxMC4zLjEgKDIwMjYtMDktMTQpCgojIyMgRml4ZWQKCi0gUmVxdWlyZSBgYHZjcy12ZXJz
aW9uaW5nPj0yLjQuMGBgLiBzZXR1cHRvb2xzLXNjbSAxMC4zLjAgZGVjbGFyZWQgYGA+PTIuMy4y
YGAgYnV0CiAgaW1wb3J0cyBgYHZjc192ZXJzaW9uaW5nLl9maWxlX2ZpbmRlcnMuc2NtX3NlYXJj
aF9rbm93bl9mYWlsZWRgYCwgd2hpY2ggdmNzLXZlcnNpb25pbmcKICBvbmx5IGdhaW5lZCBpbiAy
LjQuMCwgc28gaW5zdGFsbGluZyBpdCBhbG9uZ3NpZGUgYW4gb2xkZXIgdmNzLXZlcnNpb25pbmcg
ZmFpbGVkIHdpdGgKICBgYEltcG9ydEVycm9yYGAuIENJIG5vdyBpbnN0YWxscyBzZXR1cHRvb2xz
LXNjbSBhZ2FpbnN0IHRoZSBvbGRlc3QgdmNzLXZlcnNpb25pbmcgaXRzCiAgbWV0YWRhdGEgcGVy
bWl0cywgc28gdGhlIGxvd2VyIGJvdW5kIGNhbiBubyBsb25nZXIgZ28gc3RhbGUgdW5ub3RpY2Vk
LiAoWyMxNTI4XShodHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzLXNjbS9pc3N1ZXMv
MTUyOCkpCgojIyAxMC4zLjAgKDIwMjYtMDktMTIpCgojIyMgRGVwcmVjYXRlZAoKLSBFbWl0IGEg
YGBEZXByZWNhdGlvbldhcm5pbmdgYCB3aGVuIHRoZSBgYHNldHVwdG9vbHMuZmlsZV9maW5kZXJz
YGAgZW50cnkgcG9pbnQgaXMgaW52b2tlZCBmb3IgYSBwcm9qZWN0IHRoYXQgZG9lcyBub3QgY29u
ZmlndXJlIHNldHVwdG9vbHMtc2NtLiBUaGUgZW50cnkgcG9pbnQgd2lsbCBiZSByZW1vdmVkIGlu
IGEgZnV0dXJlIG1ham9yIHJlbGVhc2UuIChbIzE0MDddKGh0dHBzOi8vZ2l0aHViLmNvbS9weXBh
L3NldHVwdG9vbHMtc2NtL2lzc3Vlcy8xNDA3KSkKCiMjIyBGaXhlZAoKLSBSdW4gdGhlIGBzZXR1
cHRvb2xzLmZpbGVfZmluZGVyc2AgaG9vayBpbnNpZGUgYSBzZXR1cHRvb2xzLXNjbSBvdmVycmlk
ZSBjb250ZXh0LiBJdCBwcmV2aW91c2x5IHJlc29sdmVkIHNldHRpbmdzIHVuZGVyIHRoZSBgVkNT
X1ZFUlNJT05JTkdgIHByZWZpeCBvbmx5LCBzbyBkb2N1bWVudGVkIHZhcmlhYmxlcyBzdWNoIGFz
IGBTRVRVUFRPT0xTX1NDTV9TVUJQUk9DRVNTX1RJTUVPVVRgIGFuZCBgU0VUVVBUT09MU19TQ01f
SEdfQ09NTUFORGAgd2VyZSBpZ25vcmVkIHdoZW4gZmluZGluZyBmaWxlcy4KCiAgV2hlbiB2ZXJz
aW9uIGluZmVyZW5jZSBoYXMgYWxyZWFkeSBydW4gYW5kIGZvdW5kIG5vIFNDTSBjaGVja291dCwg
dGhlIGBlZ2dfaW5mb2AgbWl4aW4gbm93IHRlbGxzIHRoZSBmaWxlIGZpbmRlcnMgc28sIHJhdGhl
ciB0aGFuIGxldHRpbmcgYHdhbGtfcmV2Y3RybCgpYCByZS1wcm9iZSBldmVyeSBiYWNrZW5kIGZv
ciBhIHJlcG9zaXRvcnkga25vd24gdG8gYmUgYQoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQg
ZXhjZWVkcyAzMDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQg
aW4gYW4gYXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLmV0dXB0b29scy1zY21f
MTAuMi4zLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1zY21fMTAuMy4yLmJifSB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29scy1zY21fMTAuMi4zLmJi
ID0+IHB5dGhvbjMtc2V0dXB0b29scy1zY21fMTAuMy4yLmJifSAoODklKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4y
LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1z
Y21fMTAuMy4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4yLjMuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8x
MC4zLjIuYmIKaW5kZXggMGFmNGJkMjRmNS4uMzBjOTQ4M2FiYiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzEwLjIuMy5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1zY21f
MTAuMy4yLmJiCkBAIC02LDcgKzYsNyBAQCBhcmd1bWVudCBvciBpbiBhIFNDTSBtYW5hZ2VkIGZp
bGUuIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT04MzhjMzY2ZjY5YjcyYzVkZjA1Yzk2ZGZmNzliMzVmMiIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImYxNzllZDNlMmE2M2NmNTgyM2U1ZWU5YWE5Y2EwODM4NjIxOTQwMDQ0M2EwNTUzMjI0
ZDcyZGRlM2YyMDZiNDQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjA1NzcyYTA1NWZjYWQ4M2E5
YzZiYjUzM2NhYWE1ZDg2NDEzN2NkYjJiY2NmNDFiZTA4M2JjZjQzZmRkYTFjMSIKIAogUFlQSV9Q
QUNLQUdFID0gInNldHVwdG9vbHNfc2NtIgogCi0tIAoyLjQ3LjEKCg==

--===============3255972979860693703==
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
DISTRO_VERSION       = "6.0.99+snapshot-225db9c0df20fdf07479c6d0b992dd52fe2a8464"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:225db9c0df20fdf07479c6d0b992dd52fe2a8464"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 541 Local 515 Mirrors 0 Missed 26 Current 259 (95% match, 96% complete)
done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 280 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 287 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 311 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 418 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 423 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 439 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pip-native-26.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 343 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_recipe_qa)
NOTE: Running task 372 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 501 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_package_setscene)
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pip-native-26.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 503 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 506 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 509 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 516 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 517 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 518 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 520 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pip-native-26.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 448 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_fetch)
NOTE: Running task 449 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_fetch)
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 451 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_fetch)
NOTE: recipe python3-pip-native-26.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-semantic-version-native-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 521 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_create_spdx_setscene)
NOTE: Running task 464 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_fetch)
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_fetch: Started
NOTE: Running setscene task 523 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 524 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 466 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_fetch: Started
NOTE: Running task 467 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 530 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 575 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_spdx_setscene)
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running task 505 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_unpack)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 506 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_unpack)
NOTE: Running setscene task 580 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.98.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 508 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 511 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_unpack)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 584 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 585 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 512 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_patch)
NOTE: recipe cargo-native-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 596 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_unpack: Succeeded
NOTE: recipe libstd-rs-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 618 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_unpack: Started
NOTE: Running setscene task 620 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_fetch: Succeeded
NOTE: Running task 534 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 535 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_patch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 623 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running task 536 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-build-native-1.6.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 625 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_unpack: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 641 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_patch: Started
NOTE: Running setscene task 642 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgit2/libgit2_1.9.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/cargo_1.98.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust_1.98.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-native-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_patch: Succeeded
NOTE: recipe ca-certificates-native-20260816-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 572 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb:do_rust_gen_targets)
NOTE: recipe libgit2-native-1.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.98.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 656 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glibc-2.44+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 695 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 697 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cargo-native-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.13.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-native-1.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libssh2/libssh2_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgit2/libgit2_1.9.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ca-certificates-native-20260816-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-native-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_unpack: Succeeded
NOTE: Running task 970 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_patch)
NOTE: Running task 981 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_patch)
NOTE: recipe ca-certificates-native-20260816-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1007 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_patch)
NOTE: recipe libssh2-native-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-native-1.9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-native-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-native-20260816-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgit2-native-1.9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_patch: Started
NOTE: Running task 1173 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_patch: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libssh2/libssh2_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-native-10.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1176 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1177 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_populate_lic)
NOTE: recipe python3-pytest-9.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_patch: Succeeded
NOTE: Running task 1179 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.168.0.bb:do_rust_gen_targets)
NOTE: recipe libssh2-native-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-native-10.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libssh2-native-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-native-10.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-hypothesis-6.168.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe rust-native-1.98.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust_1.98.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source_1.98.1.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe patchelf-native-0.19.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-native-23.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-source-1.98.1-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.98.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.98.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe patchelf-native-0.19.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patchelf/patchelf_git.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe patchelf-native-0.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe patchelf-native-0.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-native-26.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1491 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_unpack)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-native-23.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.15.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-native-23.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-flit-core-native-3.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_unpack: Started
NOTE: recipe llvm-native-23.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-project-source.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 797 of 800 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-native-2.15.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 800 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-project-source-23.1.1-23.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-project-source-23.1.1-23.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-tblgen-native-23.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-native-2.15.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1659 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1681 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-native-2.15.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2047 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_configure)
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2048 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_configure)
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2049 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_configure: Succeeded
NOTE: Running task 2050 of 2098 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_compile: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 2051 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_patch)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_patch: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 2052 of 2098 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-maturin_1.15.0.bb:do_rust_gen_targets)
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-maturin-native-1.15.0-r0: task do_rust_gen_targets: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())  # noqa: S102 # exec is intentional here
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 49, in <module>
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/__init__.py", line 117, in setup
|     return distutils.core.setup(**attrs)  # type: ignore[return-value]
|            ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/_distutils/core.py", line 130, in setup
|     _setup_distribution = dist = klass(attrs)
|                                  ~~~~~^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 321, in __init__
|     _Distribution.__init__(self, dist_attrs)
|     ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/_distutils/dist.py", line 338, in __init__
|     self.finalize_options()
|     ~~~~~~~~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 789, in finalize_options
|     for ep in sorted(loaded, key=by_order):
|               ~~~~~~^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 788, in <genexpr>
|     loaded = (e.load() for e in filtered)
|               ~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/importlib/metadata/__init__.py", line 179, in load
|     module = import_module(match.group('module'))
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/importlib/__init__.py", line 88, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1406, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1371, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1342, in _find_and_load_unlocked
|   File "<frozen importlib._bootstrap>", line 938, in _load_unlocked
|   File "<frozen importlib._bootstrap_external>", line 759, in exec_module
|   File "<frozen importlib._bootstrap>", line 491, in _call_with_frames_removed
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/sources/setuptools_scm-10.3.2/src/setuptools_scm/_integration/setuptools.py", line 19, in <module>
|     from .egg_info import ScmEggInfoMixin
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/sources/setuptools_scm-10.3.2/src/setuptools_scm/_integration/egg_info.py", line 26, in <module>
|     from vcs_versioning._file_finders import scm_search_known_failed
| ImportError: cannot import name 'scm_search_known_failed' from 'vcs_versioning._file_finders' (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_file_finders/__init__.py)
| 
| TIP pass --env-dir and --sdist-extract-dir to keep the build environment and sources, then see https://build.pypa.io/en/stable/how-to/troubleshooting.html#debug-a-failed-build for help debugging a failed build
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/temp/run.do_compile.3444250:155 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/sources/setuptools_scm-10.3.2'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/temp/run.do_compile.3444250, line 155
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/temp/run.do_compile.3444250, line 150
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/temp/run.do_compile.3444250, line 159
NOTE: recipe python3-setuptools-scm-native-10.3.2-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())  # noqa: S102 # exec is intentional here
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 49, in <module>
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/__init__.py", line 117, in setup
|     return distutils.core.setup(**attrs)  # type: ignore[return-value]
|            ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/_distutils/core.py", line 130, in setup
|     _setup_distribution = dist = klass(attrs)
|                                  ~~~~~^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 321, in __init__
|     _Distribution.__init__(self, dist_attrs)
|     ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/_distutils/dist.py", line 338, in __init__
|     self.finalize_options()
|     ~~~~~~~~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 789, in finalize_options
|     for ep in sorted(loaded, key=by_order):
|               ~~~~~~^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/dist.py", line 788, in <genexpr>
|     loaded = (e.load() for e in filtered)
|               ~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/importlib/metadata/__init__.py", line 179, in load
|     module = import_module(match.group('module'))
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/importlib/__init__.py", line 88, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1406, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1371, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1342, in _find_and_load_unlocked
|   File "<frozen importlib._bootstrap>", line 938, in _load_unlocked
|   File "<frozen importlib._bootstrap_external>", line 759, in exec_module
|   File "<frozen importlib._bootstrap>", line 491, in _call_with_frames_removed
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/sources/setuptools_scm-10.3.2/src/setuptools_scm/_integration/setuptools.py", line 19, in <module>
|     from .egg_info import ScmEggInfoMixin
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/sources/setuptools_scm-10.3.2/src/setuptools_scm/_integration/egg_info.py", line 26, in <module>
|     from vcs_versioning._file_finders import scm_search_known_failed
| ImportError: cannot import name 'scm_search_known_failed' from 'vcs_versioning._file_finders' (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/vcs_versioning/_file_finders/__init__.py)
| 
| TIP pass --env-dir and --sdist-extract-dir to keep the build environment and sources, then see https://build.pypa.io/en/stable/how-to/troubleshooting.html#debug-a-failed-build for help debugging a failed build
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/temp/run.do_compile.3444300:152 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/sources/setuptools_scm-10.3.2'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/temp/run.do_compile.3444300, line 152
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/temp/run.do_compile.3444300, line 147
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/temp/run.do_compile.3444300, line 164
NOTE: recipe python3-setuptools-scm-10.3.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2053 tasks of which 2020 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260915051311.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260915051311.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/temp/log.do_compile.3444250
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/temp/log.do_compile.3444300
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-scm-native-10.3.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/temp/run.do_compile.3444250' failed with exit code 1
ERROR: python3-setuptools-scm-10.3.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/temp/run.do_compile.3444300' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.3.2/temp/log.do_compile.3444250
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.3.2/temp/log.do_compile.3444300
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.3.2.bb:do_compile) failed with exit code '1'

--===============3255972979860693703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="python3-setuptools-scm-changelog.txt"

Changelog for python3-setuptools-scm: 10.2.3 -> 10.3.2
Source: CHANGELOG.md

## 10.3.2 (2026-09-14)

### Fixed

- Stop the command mixins from reordering a project's own ``build_py``, ``egg_info``
  or ``bdist_wheel`` MRO. ``ScmVersionFileMixin`` and friends inherited from the
  corresponding setuptools command, so wrapping a project class built on a disjoint
  hierarchy -- ``distutils.command.build_py``, or the standalone ``wheel`` package's
  ``bdist_wheel`` -- placed setuptools' command *ahead* of the project's class.
  ``setuptools.build_py.run()`` does not delegate any further, so the project's
  ``run()`` was silently skipped, surfacing as
  ``error: package directory '...' does not exist``. The mixins now carry no runtime
  base class and linearise to ``(wrapped, mixin, *project_command.__mro__)``. ([#1531](https://github.com/pypa/setuptools-scm/issues/1531))
- Leave a project's ``cmdclass`` alone when setuptools-scm is installed but not
  actually inferring a version. ``build_py``, ``egg_info`` and ``bdist_wheel`` are
  now registered only once version inference has stored data on the distribution --
  the precondition for any of the mixins doing something. Previously every project
  with a ``pyproject.toml`` had its commands wrapped, including projects with no
  ``[tool.setuptools_scm]`` section at all.

  Note for projects that *used* to configure setuptools-scm and no longer do: a
  ``scm_version.json`` left behind in a stale ``*.egg-info`` directory is no longer
  stripped from built wheels, because the ``bdist_wheel`` mixin that strips it is no
  longer registered either. Remove the stale ``*.egg-info`` directory. ([#1533](https://github.com/pypa/setuptools-scm/issues/1533))

## 10.3.1 (2026-09-14)

### Fixed

- Require ``vcs-versioning>=2.4.0``. setuptools-scm 10.3.0 declared ``>=2.3.2`` but
  imports ``vcs_versioning._file_finders.scm_search_known_failed``, which vcs-versioning
  only gained in 2.4.0, so installing it alongside an older vcs-versioning failed with
  ``ImportError``. CI now installs setuptools-scm against the oldest vcs-versioning its
  metadata permits, so the lower bound can no longer go stale unnoticed. ([#1528](https://github.com/pypa/setuptools-scm/issues/1528))

## 10.3.0 (2026-09-12)

### Deprecated

- Emit a ``DeprecationWarning`` when the ``setuptools.file_finders`` entry point is invoked for a project that does not configure setuptools-scm. The entry point will be removed in a future major release. ([#1407](https://github.com/pypa/setuptools-scm/issues/1407))

### Fixed

- Run the `setuptools.file_finders` hook inside a setuptools-scm override context. It previously resolved settings under the `VCS_VERSIONING` prefix only, so documented variables such as `SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT` and `SETUPTOOLS_SCM_HG_COMMAND` were ignored when finding files.

  When version inference has already run and found no SCM checkout, the `egg_info` mixin now tells the file finders so, rather than letting `walk_revctrl()` re-probe every backend for a repository known to be absent. ([#1212](https://github.com/pypa/setuptools-scm/issues/1212))

--===============3255972979860693703==--

