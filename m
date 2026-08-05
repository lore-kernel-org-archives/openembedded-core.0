Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB12C56202
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:47:41 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34045.1785908854643669383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cgoh1yx7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0lcFo0JX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019fd0767bb0-82b27a54-a9ee-4e8f-bf13-2e559f38eb08-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785908853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TrIlBX3C0oFA6jVu0EyN3+QRKuHY1LNXJB5268akJyk=;
	b=cgoh1yx78kKN01FSpBptniOAmQvPki4SKiF6mUFnJncIvGLaxsjdIcsXK4USiq8U
	WuKjBwXXMKaiJKBJ5cKI4KQhxU9UxD0xTh+GyrNpYeD3NKx4MNoso3s1hrdkKx/UIKU
	LAZIfYHLDxvyyXHyWqHnJcsrMJQaqQ2+0UFZFgmA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785908853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TrIlBX3C0oFA6jVu0EyN3+QRKuHY1LNXJB5268akJyk=;
	b=0lcFo0JXzLy7f0RKVr63BoTDNAY9wx+VUYPdglxVa+FvyDSW3KLM1Y4dyF+ia8p6
	EvjolIzrz6/yMKjisXu2b2HYtWEClwatsiMvOD5zP9kNBzeRcNJ0TAQsAggLpSwUkTv
	8TcQtdZzQz5zTPwnjXHegU9T+OCDfpbj2MBrfASE=
Content-Type: multipart/mixed; boundary="===============3420790759869858928=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 26.3 SUCCEEDED
Message-ID: <0101019fd0767bb0-82b27a54-a9ee-4e8f-bf13-2e559f38eb08-000000@us-west-2.amazonses.com>
Date: Wed, 5 Aug 2026 05:47:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 05:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242817

--===============3420790759869858928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-packaging* to *26.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-26.2-26.3.patch
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
From fd436f9d7f52f56b2f1d832bb6162feddc954eb9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Aug 2026 05:38:00 +0000
Subject: [PATCH] python3-packaging: upgrade 26.2 -> 26.3

Source: CHANGELOG.rst

26.3 - 2026-08-03
~~~~~~~~~~~~~~~~~

Features:

* Add a public :class:`~packaging.ranges.VersionRange` API and
  :meth:`SpecifierSet.to_range() <packaging.specifiers.SpecifierSet.to_range>`,
  representing the versions a specifier set accepts as an interval set that
  supports intersection, union, difference, complement, set relations,
  membership tests, and filtering.
  :meth:`~packaging.ranges.VersionRange.to_specifier_set` converts a range back
  to a :class:`~packaging.specifiers.SpecifierSet` where a PEP 440 form exists.
  (:pull:`1267`, :pull:`1270`, :pull:`1298`)
* PEP 808: accept ``Metadata-Version: 2.6``. (:pull:`1194`)
* Add a ``limit`` argument to ``parse_tag()`` for compressed tag sets.
  (:issue:`1220`)
* Add a ``prefer_sdist_predicate`` argument to ``Pylock.select()`` to prefer
  source distributions over wheels for selected packages. (:pull:`1334`)
* Add :func:`~packaging.tags.pure_python_tags` to generate the pure-Python
  tags for a Python version without touching the running platform.
  (:pull:`1346`)
* Add :meth:`SpecifierSet.is_subset()
  <packaging.specifiers.SpecifierSet.is_subset>`, :meth:`~packaging.specifiers.SpecifierSet.is_superset`,
  and :meth:`~packaging.specifiers.SpecifierSet.is_disjoint`, which compare the
  versions two specifier sets accept. (:pull:`1313`)

Behavior adaptations:

* Drop support for Python 3.8; packaging now requires Python 3.9 or later.
  (:pull:`1157`)
* Prefer native ``linux_*`` platform tags over ``manylinux`` and ``musllinux``
  tags on Linux. (:issue:`160`)

Fixes for versions and specifiers:

* Raise ``InvalidVersion`` instead of ``TypeError`` when ``Version`` is given a
  non-string. (:pull:`1319`)
* Raise ``InvalidVersion`` for non-string pre-release letters passed to
  ``Version.from_parts``. (:pull:`1241`)
* Fix an ``AttributeError`` when hashing internally trimmed versions.
  (:pull:`1242`)
* Fix ``SpecifierSet.is_unsatisfiable`` for post-release boundary
  intersections. (:pull:`1257`)

Fixes for requirements and markers:

* Make ``Requirement.__hash__`` consistent with ``__eq__`` for
  trailing-zero-equivalent specifiers (e.g. ``foo==1.0.0`` and
  ``foo==1.0.0.0``), so equal requirements hash equal and deduplicate in
  sets and dicts. (:pull:`1232`)
* Normalize requested extra names before comparing or hashing requirements.
  (:issue:`644`)
* Preserve a ``Requirement``'s specifier ``prereleases`` override across a
  pickle round trip. (:issue:`1204`)
* Raise ``InvalidRequirement`` instead of ``InvalidSpecifier`` when a
  requirement contains an invalid specifier. (:pull:`1332`)
* Clarify the error for post-release prefix wildcards like ``==1.0.post1.*``.
  (:pull:`1299`)
* Preserve quoting semantics when serializing marker values, so round-tripped
  markers parse back to the same marker. (:pull:`1213`)
* Keep the parentheses of a nested group when serializing markers.
  (:pull:`1316`)
* Normalize ``extra`` and ``dependency_groups`` values in nested markers at

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../{python3-packaging_26.2.bb => python3-packaging_26.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_26.2.bb => python3-packaging_26.3.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-packaging_26.2.bb b/meta/recipes-devtools/python/python3-packaging_26.3.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-packaging_26.2.bb
rename to meta/recipes-devtools/python/python3-packaging_26.3.bb
index 81ae6f2732..a0d80d21f0 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.2.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 OR BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661"
+SRC_URI[sha256sum] = "94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.47.1


--===============3420790759869858928==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-26.2-26.3.patch"

RnJvbSBmZDQzNmY5ZDdmNTJmNTZiMmYxZDgzMmJiNjE2MmZlZGRjOTU0ZWI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBBdWcgMjAyNiAwNTozODowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGFja2FnaW5nOiB1cGdyYWRlIDI2LjIgLT4gMjYuMwoKU291cmNlOiBDSEFOR0VMT0cu
cnN0CgoyNi4zIC0gMjAyNi0wOC0wMwp+fn5+fn5+fn5+fn5+fn5+fgoKRmVhdHVyZXM6CgoqIEFk
ZCBhIHB1YmxpYyA6Y2xhc3M6YH5wYWNrYWdpbmcucmFuZ2VzLlZlcnNpb25SYW5nZWAgQVBJIGFu
ZAogIDptZXRoOmBTcGVjaWZpZXJTZXQudG9fcmFuZ2UoKSA8cGFja2FnaW5nLnNwZWNpZmllcnMu
U3BlY2lmaWVyU2V0LnRvX3JhbmdlPmAsCiAgcmVwcmVzZW50aW5nIHRoZSB2ZXJzaW9ucyBhIHNw
ZWNpZmllciBzZXQgYWNjZXB0cyBhcyBhbiBpbnRlcnZhbCBzZXQgdGhhdAogIHN1cHBvcnRzIGlu
dGVyc2VjdGlvbiwgdW5pb24sIGRpZmZlcmVuY2UsIGNvbXBsZW1lbnQsIHNldCByZWxhdGlvbnMs
CiAgbWVtYmVyc2hpcCB0ZXN0cywgYW5kIGZpbHRlcmluZy4KICA6bWV0aDpgfnBhY2thZ2luZy5y
YW5nZXMuVmVyc2lvblJhbmdlLnRvX3NwZWNpZmllcl9zZXRgIGNvbnZlcnRzIGEgcmFuZ2UgYmFj
awogIHRvIGEgOmNsYXNzOmB+cGFja2FnaW5nLnNwZWNpZmllcnMuU3BlY2lmaWVyU2V0YCB3aGVy
ZSBhIFBFUCA0NDAgZm9ybSBleGlzdHMuCiAgKDpwdWxsOmAxMjY3YCwgOnB1bGw6YDEyNzBgLCA6
cHVsbDpgMTI5OGApCiogUEVQIDgwODogYWNjZXB0IGBgTWV0YWRhdGEtVmVyc2lvbjogMi42YGAu
ICg6cHVsbDpgMTE5NGApCiogQWRkIGEgYGBsaW1pdGBgIGFyZ3VtZW50IHRvIGBgcGFyc2VfdGFn
KClgYCBmb3IgY29tcHJlc3NlZCB0YWcgc2V0cy4KICAoOmlzc3VlOmAxMjIwYCkKKiBBZGQgYSBg
YHByZWZlcl9zZGlzdF9wcmVkaWNhdGVgYCBhcmd1bWVudCB0byBgYFB5bG9jay5zZWxlY3QoKWBg
IHRvIHByZWZlcgogIHNvdXJjZSBkaXN0cmlidXRpb25zIG92ZXIgd2hlZWxzIGZvciBzZWxlY3Rl
ZCBwYWNrYWdlcy4gKDpwdWxsOmAxMzM0YCkKKiBBZGQgOmZ1bmM6YH5wYWNrYWdpbmcudGFncy5w
dXJlX3B5dGhvbl90YWdzYCB0byBnZW5lcmF0ZSB0aGUgcHVyZS1QeXRob24KICB0YWdzIGZvciBh
IFB5dGhvbiB2ZXJzaW9uIHdpdGhvdXQgdG91Y2hpbmcgdGhlIHJ1bm5pbmcgcGxhdGZvcm0uCiAg
KDpwdWxsOmAxMzQ2YCkKKiBBZGQgOm1ldGg6YFNwZWNpZmllclNldC5pc19zdWJzZXQoKQogIDxw
YWNrYWdpbmcuc3BlY2lmaWVycy5TcGVjaWZpZXJTZXQuaXNfc3Vic2V0PmAsIDptZXRoOmB+cGFj
a2FnaW5nLnNwZWNpZmllcnMuU3BlY2lmaWVyU2V0LmlzX3N1cGVyc2V0YCwKICBhbmQgOm1ldGg6
YH5wYWNrYWdpbmcuc3BlY2lmaWVycy5TcGVjaWZpZXJTZXQuaXNfZGlzam9pbnRgLCB3aGljaCBj
b21wYXJlIHRoZQogIHZlcnNpb25zIHR3byBzcGVjaWZpZXIgc2V0cyBhY2NlcHQuICg6cHVsbDpg
MTMxM2ApCgpCZWhhdmlvciBhZGFwdGF0aW9uczoKCiogRHJvcCBzdXBwb3J0IGZvciBQeXRob24g
My44OyBwYWNrYWdpbmcgbm93IHJlcXVpcmVzIFB5dGhvbiAzLjkgb3IgbGF0ZXIuCiAgKDpwdWxs
OmAxMTU3YCkKKiBQcmVmZXIgbmF0aXZlIGBgbGludXhfKmBgIHBsYXRmb3JtIHRhZ3Mgb3ZlciBg
YG1hbnlsaW51eGBgIGFuZCBgYG11c2xsaW51eGBgCiAgdGFncyBvbiBMaW51eC4gKDppc3N1ZTpg
MTYwYCkKCkZpeGVzIGZvciB2ZXJzaW9ucyBhbmQgc3BlY2lmaWVyczoKCiogUmFpc2UgYGBJbnZh
bGlkVmVyc2lvbmBgIGluc3RlYWQgb2YgYGBUeXBlRXJyb3JgYCB3aGVuIGBgVmVyc2lvbmBgIGlz
IGdpdmVuIGEKICBub24tc3RyaW5nLiAoOnB1bGw6YDEzMTlgKQoqIFJhaXNlIGBgSW52YWxpZFZl
cnNpb25gYCBmb3Igbm9uLXN0cmluZyBwcmUtcmVsZWFzZSBsZXR0ZXJzIHBhc3NlZCB0bwogIGBg
VmVyc2lvbi5mcm9tX3BhcnRzYGAuICg6cHVsbDpgMTI0MWApCiogRml4IGFuIGBgQXR0cmlidXRl
RXJyb3JgYCB3aGVuIGhhc2hpbmcgaW50ZXJuYWxseSB0cmltbWVkIHZlcnNpb25zLgogICg6cHVs
bDpgMTI0MmApCiogRml4IGBgU3BlY2lmaWVyU2V0LmlzX3Vuc2F0aXNmaWFibGVgYCBmb3IgcG9z
dC1yZWxlYXNlIGJvdW5kYXJ5CiAgaW50ZXJzZWN0aW9ucy4gKDpwdWxsOmAxMjU3YCkKCkZpeGVz
IGZvciByZXF1aXJlbWVudHMgYW5kIG1hcmtlcnM6CgoqIE1ha2UgYGBSZXF1aXJlbWVudC5fX2hh
c2hfX2BgIGNvbnNpc3RlbnQgd2l0aCBgYF9fZXFfX2BgIGZvcgogIHRyYWlsaW5nLXplcm8tZXF1
aXZhbGVudCBzcGVjaWZpZXJzIChlLmcuIGBgZm9vPT0xLjAuMGBgIGFuZAogIGBgZm9vPT0xLjAu
MC4wYGApLCBzbyBlcXVhbCByZXF1aXJlbWVudHMgaGFzaCBlcXVhbCBhbmQgZGVkdXBsaWNhdGUg
aW4KICBzZXRzIGFuZCBkaWN0cy4gKDpwdWxsOmAxMjMyYCkKKiBOb3JtYWxpemUgcmVxdWVzdGVk
IGV4dHJhIG5hbWVzIGJlZm9yZSBjb21wYXJpbmcgb3IgaGFzaGluZyByZXF1aXJlbWVudHMuCiAg
KDppc3N1ZTpgNjQ0YCkKKiBQcmVzZXJ2ZSBhIGBgUmVxdWlyZW1lbnRgYCdzIHNwZWNpZmllciBg
YHByZXJlbGVhc2VzYGAgb3ZlcnJpZGUgYWNyb3NzIGEKICBwaWNrbGUgcm91bmQgdHJpcC4gKDpp
c3N1ZTpgMTIwNGApCiogUmFpc2UgYGBJbnZhbGlkUmVxdWlyZW1lbnRgYCBpbnN0ZWFkIG9mIGBg
SW52YWxpZFNwZWNpZmllcmBgIHdoZW4gYQogIHJlcXVpcmVtZW50IGNvbnRhaW5zIGFuIGludmFs
aWQgc3BlY2lmaWVyLiAoOnB1bGw6YDEzMzJgKQoqIENsYXJpZnkgdGhlIGVycm9yIGZvciBwb3N0
LXJlbGVhc2UgcHJlZml4IHdpbGRjYXJkcyBsaWtlIGBgPT0xLjAucG9zdDEuKmBgLgogICg6cHVs
bDpgMTI5OWApCiogUHJlc2VydmUgcXVvdGluZyBzZW1hbnRpY3Mgd2hlbiBzZXJpYWxpemluZyBt
YXJrZXIgdmFsdWVzLCBzbyByb3VuZC10cmlwcGVkCiAgbWFya2VycyBwYXJzZSBiYWNrIHRvIHRo
ZSBzYW1lIG1hcmtlci4gKDpwdWxsOmAxMjEzYCkKKiBLZWVwIHRoZSBwYXJlbnRoZXNlcyBvZiBh
IG5lc3RlZCBncm91cCB3aGVuIHNlcmlhbGl6aW5nIG1hcmtlcnMuCiAgKDpwdWxsOmAxMzE2YCkK
KiBOb3JtYWxpemUgYGBleHRyYWBgIGFuZCBgYGRlcGVuZGVuY3lfZ3JvdXBzYGAgdmFsdWVzIGlu
IG5lc3RlZCBtYXJrZXJzIGF0CgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMw
MDAgY2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRh
Y2htZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uL3tweXRob24zLXBhY2thZ2luZ18yNi4y
LmJiID0+IHB5dGhvbjMtcGFja2FnaW5nXzI2LjMuYmJ9ICAgIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYWNrYWdpbmdfMjYuMi5iYiA9PiBweXRob24zLXBhY2th
Z2luZ18yNi4zLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjYuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjYuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2FnaW5nXzI2
LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNr
YWdpbmdfMjYuMy5iYgppbmRleCA4MWFlNmYyNzMyLi5hMGQ4MGQyMWYwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2FnaW5nXzI2LjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhY2thZ2luZ18yNi4zLmJi
CkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS9wYWNr
YWdpbmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAgT1IgQlNELTItQ2xhdXNlIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZmFhZGFlZGNhOTI1MWE5MGIyMDVjOTE2NzU3
OGNlOTEiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmZjQ1MmZmNWEzZTgyOGNlMTEwMTkwZmVm
ZjExNzhiYjFmMmVhMjI4MWZhMjA3NWFhZGI5ODdjMmZiMjIxNjYxIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjk0ZWRjMjU2NDI0YWYzODc2MmViMzEzMDZlZWQyOGJlYjlmMGVmYzUwYTg4Mzc0OTJj
OWQ2ZmQ2MDA0YWVkNzkiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3QuaW4iCiAKLS0g
CjIuNDcuMQoK

--===============3420790759869858928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: added "/usr/lib/python3-packaging/ptest/tests/property/test_ranges_to_specifier_set.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_set_algebra.py /usr/lib/python3-packaging/ptest/tests/test_ranges.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_pep440_extended.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_set_relations.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_cross_epoch.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_pubgrub.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 651821 to 882438 (+35%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.14/site-packages/packaging-26.2.dist-info -> /usr/lib/python3.14/site-packages/packaging-26.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/packaging-26.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/packaging-26.3.dist-info/licenses, added "/usr/lib/python3.14/site-packages/packaging/__pycache__/ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/_ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/_ranges.py /usr/lib/python3.14/site-packages/packaging/ranges.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 835406 to 1069340 (+28%)
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.3.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/packaging/ranges.py was added
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.3.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/packaging/ranges.py was added

--===============3420790759869858928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-packaging-changelog.txt"

Changelog for python3-packaging: 26.2 -> 26.3
Source: CHANGELOG.rst

26.3 - 2026-08-03
~~~~~~~~~~~~~~~~~

Features:

* Add a public :class:`~packaging.ranges.VersionRange` API and
  :meth:`SpecifierSet.to_range() <packaging.specifiers.SpecifierSet.to_range>`,
  representing the versions a specifier set accepts as an interval set that
  supports intersection, union, difference, complement, set relations,
  membership tests, and filtering.
  :meth:`~packaging.ranges.VersionRange.to_specifier_set` converts a range back
  to a :class:`~packaging.specifiers.SpecifierSet` where a PEP 440 form exists.
  (:pull:`1267`, :pull:`1270`, :pull:`1298`)
* PEP 808: accept ``Metadata-Version: 2.6``. (:pull:`1194`)
* Add a ``limit`` argument to ``parse_tag()`` for compressed tag sets.
  (:issue:`1220`)
* Add a ``prefer_sdist_predicate`` argument to ``Pylock.select()`` to prefer
  source distributions over wheels for selected packages. (:pull:`1334`)
* Add :func:`~packaging.tags.pure_python_tags` to generate the pure-Python
  tags for a Python version without touching the running platform.
  (:pull:`1346`)
* Add :meth:`SpecifierSet.is_subset()
  <packaging.specifiers.SpecifierSet.is_subset>`, :meth:`~packaging.specifiers.SpecifierSet.is_superset`,
  and :meth:`~packaging.specifiers.SpecifierSet.is_disjoint`, which compare the
  versions two specifier sets accept. (:pull:`1313`)

Behavior adaptations:

* Drop support for Python 3.8; packaging now requires Python 3.9 or later.
  (:pull:`1157`)
* Prefer native ``linux_*`` platform tags over ``manylinux`` and ``musllinux``
  tags on Linux. (:issue:`160`)

Fixes for versions and specifiers:

* Raise ``InvalidVersion`` instead of ``TypeError`` when ``Version`` is given a
  non-string. (:pull:`1319`)
* Raise ``InvalidVersion`` for non-string pre-release letters passed to
  ``Version.from_parts``. (:pull:`1241`)
* Fix an ``AttributeError`` when hashing internally trimmed versions.
  (:pull:`1242`)
* Fix ``SpecifierSet.is_unsatisfiable`` for post-release boundary
  intersections. (:pull:`1257`)

Fixes for requirements and markers:

* Make ``Requirement.__hash__`` consistent with ``__eq__`` for
  trailing-zero-equivalent specifiers (e.g. ``foo==1.0.0`` and
  ``foo==1.0.0.0``), so equal requirements hash equal and deduplicate in
  sets and dicts. (:pull:`1232`)
* Normalize requested extra names before comparing or hashing requirements.
  (:issue:`644`)
* Preserve a ``Requirement``'s specifier ``prereleases`` override across a
  pickle round trip. (:issue:`1204`)
* Raise ``InvalidRequirement`` instead of ``InvalidSpecifier`` when a
  requirement contains an invalid specifier. (:pull:`1332`)
* Clarify the error for post-release prefix wildcards like ``==1.0.post1.*``.
  (:pull:`1299`)
* Preserve quoting semantics when serializing marker values, so round-tripped
  markers parse back to the same marker. (:pull:`1213`)
* Keep the parentheses of a nested group when serializing markers.
  (:pull:`1316`)
* Normalize ``extra`` and ``dependency_groups`` values in nested markers at
  parse time. (:pull:`1246`, :pull:`1310`)
* Raise ``UndefinedComparison`` when a set-valued variable like ``extras`` is
  used outside the membership form. (:pull:`1265`)
* Raise ``UndefinedEnvironmentName`` (a ``KeyError`` subclass) for missing
  environment keys during marker evaluation. (:pull:`1276`)
* Wrap malformed string literal errors in ``InvalidMarker`` /
  ``InvalidRequirement`` instead of leaking a low-level error. (:pull:`1249`)
* Reject requirements and markers with a trailing line break. (:pull:`1345`)

Fixes for metadata and licenses:

* Collect all ``from_email`` validation errors into one ``ExceptionGroup``
  instead of raising the first. (:pull:`1268`)
* Accept the UTF-8 charset case-insensitively in email payloads.
  (:pull:`1330`)
* Reject malformed ``Description-Content-Type`` values. (:pull:`1329`)
* Don't rewrite user values that contain ``{field}`` placeholders in error
  messages. (:pull:`1327`)
* Route multipart email payloads to ``unparsed`` instead of asserting.
  (:pull:`1247`)
* Make ``InvalidMetadata`` and ``CyclicDependencyGroup`` picklable.
  (:pull:`1328`)
* Fold every line boundary ``str.splitlines`` recognizes when writing a header
  with :class:`~packaging.metadata.RFC822Message`. (:pull:`1356`)
* Raise ``InvalidLicenseExpression`` for misplaced ``WITH`` clauses and empty
  ``LicenseRef-`` names. (:pull:`1266`)
* Raise ``InvalidLicenseExpression`` instead of ``KeyError`` for a
  ``LicenseRef-`` with a ``+`` suffix. (:pull:`1219`)

Fixes for tags and filenames:

* Raise ``InvalidTag`` from ``parse_tag()`` for tags with the wrong number of
  components. (:pull:`1238`)
* Reject empty tag components in ``parse_wheel_filename()`` and
  ``parse_tag()``. (:pull:`1234`)
* Reject an empty project name in the wheel and sdist filename parsers.
  (:pull:`1305`)
* Reject wheel filenames with a trailing newline. (:pull:`1341`)
* Reject wheel tags whose interpreter component is not an identifier.
  (:issue:`577`)
* ``is_normalized_name`` now rejects names with collapsed double hyphens like
  ``a--b``. (:pull:`1230`)
* Fix duplicate explicit ``abi3t`` tags. (:pull:`1245`)
* Forward the ``warn`` argument to ``generic_tags()`` in ``sys_tags()``.
  (:pull:`1264`)
* Raise ``SystemError`` for an empty or malformed CPython ``EXT_SUFFIX``.
  (:pull:`1271`, :pull:`1301`)
* Fix a typo in the macOS ``fat3`` architecture name (was ``fat32``).
  (:pull:`1199`)

Fixes for pylock, direct URLs, and dependency groups:

* Percent-decode ``pylock`` artifact file names derived from a ``url`` so that
  local versions (e.g. a wheel with ``2.12.1+cu130`` encoded as ``2.12.1%2Bcu130``)
  yield a valid file name. (:pull:`1314`)
* Use an explicitly empty ``tags`` sequence in ``Pylock.select()`` instead of
  falling back to ``sys_tags()``. (:pull:`1349`)
* Fix ``Pylock.select()`` on Python builds that report a non-PEP 440
  ``python_full_version`` (e.g. ``3.15.0+``). (:pull:`1179`)
* Reject TOML booleans where integers are expected in ``pylock`` files.
  (:pull:`1244`)
* Add ``PylockSelectError`` to ``packaging.pylock.__all__``. (:pull:`1202`)
* Fix ``DirectUrl`` credential stripping for passwords containing ``@``.
  (:pull:`1218`)
* Parse the URL scheme case-insensitively when checking for file URLs in
  ``direct_url``. (:pull:`1240`)
* Require absolute file URLs for local directories in ``direct_url``.
  (:pull:`1297`)
* Collect ``InvalidRequirement`` errors while resolving dependency groups
  instead of leaking them. (:pull:`1302`)
* Don't cache malformed dependency group parses. (:pull:`1248`)

Performance:

* Implement ``Specifier`` and ``SpecifierSet`` filtering with the new range
  engine. (:pull:`1120`, :pull:`1259`)
* Cache the default marker environment. (:pull:`1250`)
* Cache the ``_manylinux`` module lookup process-wide. (:pull:`1254`)
* Add ``__slots__`` to ``Requirement`` and the token classes. (:pull:`1320`,
  :pull:`1258`)
* Keep range caches across canonicalization, precompile the wheel project-name
  pattern, simplify ``parse_tag()``, and skip ``platform.mac_ver()`` when the
  version and arch are given. (:pull:`1253`, :pull:`1256`, :pull:`1236`,
  :pull:`1255`)

Documentation:

* Describe the validation scope of ``packaging.pylock``. (:pull:`1339`)
* Explain which ``packaging.metadata`` fields are validated. (:pull:`1342`)
* Document ``RFC822Policy`` in the low-level ``packaging.metadata`` interface.
  (:pull:`1222`)
* Enable nitpicky mode and render missing classes and fields in the API
  reference. (:pull:`1196`, :pull:`1225`, :pull:`1277`)
* Add missing ``versionadded`` / ``versionchanged`` directives and many small
  docstring fixes across the API reference. (:pull:`1205`, :pull:`1207`,
  :pull:`1208`, :pull:`1209`, :pull:`1211`, :pull:`1216`, :pull:`1217`,
  :pull:`1223`, :pull:`1272`, :pull:`1273`, :pull:`1274`, :pull:`1291`,
  :pull:`1300`, :pull:`1303`, :pull:`1317`, :pull:`1344`)

Internal:

* Add Python 3.15 to the test matrix. (:pull:`1190`)
* Add a musl/Alpine test job and make the test suite pass on musl.
  (:pull:`1226`, :pull:`1227`)
* Expand the downstream test matrix by ten projects. (:pull:`1261`)
* Update to mypy 2. (:pull:`1191`)
* Use nox's uv integration. (:pull:`1057`)

* Re-export ``ExceptionGroup`` in metadata for now in (:pull:`1164`)
* Fix a ``DirectUrl`` typo in (:pull:`1169`)
* Test new pickle guarantees in (:pull:`1174`)
* PEP 735: add ``packaging.dependency_groups`` module, based on the ``dependency-groups`` package in (:pull:`1065`)

--===============3420790759869858928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.o /lib/*.la /lib/lib*.so"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/bin/* /lib/*.so.* /sbin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/bin/* /lib/*.so.* /sbin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.2.tar.gz;downloadfilename=packaging-26.2.tar.gz file://run-ptest.in" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.3.tar.gz;downloadfilename=packaging-26.3.tar.gz file://run-ptest.in"
packages/x86-64-v3-poky-linux/python3-packaging: PV changed from "26.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-packaging: PKGV changed from 26.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "26.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 26.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "26.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 26.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "26.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 26.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "26.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 26.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PV changed from "26.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: added "/usr/lib/python3-packaging/ptest/tests/property/test_ranges_pep440_extended.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_set_algebra.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_cross_epoch.py /usr/lib/python3-packaging/ptest/tests/test_ranges.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_pubgrub.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_to_specifier_set.py /usr/lib/python3-packaging/ptest/tests/property/test_ranges_set_relations.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 651821 to 882438 (+35%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGV changed from 26.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PV changed from "26.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 26.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "26.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 26.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PV changed from "26.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.14/site-packages/packaging-26.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/packaging-26.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/packaging-26.2.dist-info -> /usr/lib/python3.14/site-packages/packaging-26.3.dist-info, added "/usr/lib/python3.14/site-packages/packaging/_ranges.py /usr/lib/python3.14/site-packages/packaging/__pycache__/_ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/ranges.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 835406 to 1069340 (+28%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGV changed from 26.2 [default] to 26.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.3.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/packaging/ranges.py was added
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.2.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.3.dist-info
  /usr/lib/python3.14/site-packages/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/packaging/ranges.py was added

--===============3420790759869858928==--

