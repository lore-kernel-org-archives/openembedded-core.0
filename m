Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09ACAC56203
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:47:42 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34096.1785908851757861402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pmdWNZ3w;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cQG8sB98;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019fd0767130-704010f2-be50-4e85-a2f0-13bce4b70154-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785908851;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PkGMful15dz+h8jRcFwNun14Wp2L5XDbm9lCmgwMJ6M=;
	b=pmdWNZ3wGgUg93ApfLW4h+vS5MQ3GBJzwQx62poGx04G12BWsQl/b+eyjY8n5bq0
	yLIuiCYgxdky9NmDW+Pe+Zxwop3ySiQABA7DfDlcv7hKZt/Zmp2gVUamszVRG050xMi
	GObynVSEfRgQQsNaiebGf3qpTwJbp1GLQWNm6t8M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785908851;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PkGMful15dz+h8jRcFwNun14Wp2L5XDbm9lCmgwMJ6M=;
	b=cQG8sB98vum8b8p5WcWlfuOUOy6qhn8xweKGbznImq0MYEQ1eIs6sPN69ZwVFExs
	5lycvOD6QXFzOqCAuqJJLCZ0DQdHtuINx9tbMFddodTcZzm6jjN66f1pWs4pG/Y5kVi
	3nmq86BFI7oum6wCSrcu3sdXJQrOlZIynk9qmuT0=
Content-Type: multipart/mixed; boundary="===============8129856848746136309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-flit-core: upgrading to 4.0.2 FAILED
Message-ID: <0101019fd0767130-704010f2-be50-4e85-a2f0-13bce4b70154-000000@us-west-2.amazonses.com>
Date: Wed, 5 Aug 2026 05:47:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 05:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242814

--===============8129856848746136309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-flit-core* to *4.0.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-flit-core-upgrade-3.12.0-4.0.2.patch
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
From cb3320ee18367f0609f7640100a8951159c3e75e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Aug 2026 05:12:58 +0000
Subject: [PATCH] python3-flit-core: upgrade 3.12.0 -> 4.0.2

Source: doc/history.rst

Version 4.0.2
-------------

- Fix invalid metadata files with ``Import-Name`` (:ghissue:`813`).

Version 4.0.1
-------------

No changes, but a new tag to trigger an upload to PyPI now that twine will
accept it.

Version 4.0
-----------

This version contains breaking changes, but most projects which are already
using the ``[project]`` table for metadata shouldn't be affected, and can simply
change the ``flit_core <4`` constraint to ``<5``.

- The ``[tool.flit.metadata]`` table is no longer used for project metadata
  (:ghpull:`771`). Use the newer :ref:`[project] table <pyproject_toml_project>`
  instead (or if that is not possible, build with ``flit_core <4``).
- :ref:`build_cmd` and :ref:`publish_cmd` no longer include files in the sdist
  based on what is committed in git or Mercurial (:ghpull:`772`). These commands
  now build packages more like Flit does when called as a backend by e.g.
  ``python -m build``. Specify :ref:`sdist include & exclude patterns
  <pyproject_toml_sdist>` instead (Flit can help to generate these), or pass
  the ``--use-vcs`` option to get the old behaviour back.
- ``flit_core`` now requires Python 3.8 or above (:ghpull:`738`)
- The ``--setup-py`` option to generate sdists containing a ``setup.py`` file
  is no longer available (:ghpull:`776`).
- Making typing stubs packages with a ``-stubs`` suffix will now work
  (:ghpull:`742`).
- The default glob patterns for license files have been extended to include
  ``NOTICE*`` and ``AUTHORS*`` (:ghpull:`758`).
- ``license-files`` glob patterns can contain spaces (:ghpull:`797`).
- Fix a bug where license files could be found twice on Windows (:ghpull:`752`).
- The new ``Import-Name`` and ``Import-Namespace`` metadata fields (metadata 2.5)
  are now supported (:ghpull:`774`). In most cases no new input is required,
  as Flit will create this metadata automatically.
- Fix creating RECORD files when file names include commas (:ghpull:`744`).
- The ``--use-vcs`` option now correctly recognises git from inside a git
  worktree folder (:ghpull:`799`).
- On Python 3.12 and above, ``flit build`` now uses the 'data' filter when
  extracting the just-created sdist prior to building a wheel (:ghpull:`775`).
  This restricts some special features of tar files, but sdists are unlikely
  to use these features, and they would probably break in other scenarios if
  you did.
- The vendorised ``readme_renderer`` package was updated to version 44.0
  (:ghpull:`760`).

- Flit will work with current development versions of Python again (:ghpull:`684`).
- The ``flit`` command line package now requires Python 3.8 or above (:ghpull:`660`).
- Flit now has a ``SECURITY.md`` file in the GitHub repository (:ghpull:`665`).
  new ``[tool.flit.metadata.urls]`` section of
  archive, such as from GitHub.
---
 .../{python3-flit-core_3.12.0.bb => python3-flit-core_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.12.0.bb => python3-flit-core_4.0.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb b/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_4.0.2.bb
index e40ffd0d0f..27aaae085d 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "1c80f34dd96992e7758b40423d2809f48f640ca285d0b7821825e50745ec3740"
+SRC_URI[sha256sum] = "232bc4317279e8952eca9fb3f5e000d8395d693b39c105b99f619ce461e1da85"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============8129856848746136309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-flit-core-upgrade-3.12.0-4.0.2.patch"

RnJvbSBjYjMzMjBlZTE4MzY3ZjA2MDlmNzY0MDEwMGE4OTUxMTU5YzNlNzVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBBdWcgMjAyNiAwNToxMjo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZmxpdC1jb3JlOiB1cGdyYWRlIDMuMTIuMCAtPiA0LjAuMgoKU291cmNlOiBkb2MvaGlz
dG9yeS5yc3QKClZlcnNpb24gNC4wLjIKLS0tLS0tLS0tLS0tLQoKLSBGaXggaW52YWxpZCBtZXRh
ZGF0YSBmaWxlcyB3aXRoIGBgSW1wb3J0LU5hbWVgYCAoOmdoaXNzdWU6YDgxM2ApLgoKVmVyc2lv
biA0LjAuMQotLS0tLS0tLS0tLS0tCgpObyBjaGFuZ2VzLCBidXQgYSBuZXcgdGFnIHRvIHRyaWdn
ZXIgYW4gdXBsb2FkIHRvIFB5UEkgbm93IHRoYXQgdHdpbmUgd2lsbAphY2NlcHQgaXQuCgpWZXJz
aW9uIDQuMAotLS0tLS0tLS0tLQoKVGhpcyB2ZXJzaW9uIGNvbnRhaW5zIGJyZWFraW5nIGNoYW5n
ZXMsIGJ1dCBtb3N0IHByb2plY3RzIHdoaWNoIGFyZSBhbHJlYWR5CnVzaW5nIHRoZSBgYFtwcm9q
ZWN0XWBgIHRhYmxlIGZvciBtZXRhZGF0YSBzaG91bGRuJ3QgYmUgYWZmZWN0ZWQsIGFuZCBjYW4g
c2ltcGx5CmNoYW5nZSB0aGUgYGBmbGl0X2NvcmUgPDRgYCBjb25zdHJhaW50IHRvIGBgPDVgYC4K
Ci0gVGhlIGBgW3Rvb2wuZmxpdC5tZXRhZGF0YV1gYCB0YWJsZSBpcyBubyBsb25nZXIgdXNlZCBm
b3IgcHJvamVjdCBtZXRhZGF0YQogICg6Z2hwdWxsOmA3NzFgKS4gVXNlIHRoZSBuZXdlciA6cmVm
OmBbcHJvamVjdF0gdGFibGUgPHB5cHJvamVjdF90b21sX3Byb2plY3Q+YAogIGluc3RlYWQgKG9y
IGlmIHRoYXQgaXMgbm90IHBvc3NpYmxlLCBidWlsZCB3aXRoIGBgZmxpdF9jb3JlIDw0YGApLgot
IDpyZWY6YGJ1aWxkX2NtZGAgYW5kIDpyZWY6YHB1Ymxpc2hfY21kYCBubyBsb25nZXIgaW5jbHVk
ZSBmaWxlcyBpbiB0aGUgc2Rpc3QKICBiYXNlZCBvbiB3aGF0IGlzIGNvbW1pdHRlZCBpbiBnaXQg
b3IgTWVyY3VyaWFsICg6Z2hwdWxsOmA3NzJgKS4gVGhlc2UgY29tbWFuZHMKICBub3cgYnVpbGQg
cGFja2FnZXMgbW9yZSBsaWtlIEZsaXQgZG9lcyB3aGVuIGNhbGxlZCBhcyBhIGJhY2tlbmQgYnkg
ZS5nLgogIGBgcHl0aG9uIC1tIGJ1aWxkYGAuIFNwZWNpZnkgOnJlZjpgc2Rpc3QgaW5jbHVkZSAm
IGV4Y2x1ZGUgcGF0dGVybnMKICA8cHlwcm9qZWN0X3RvbWxfc2Rpc3Q+YCBpbnN0ZWFkIChGbGl0
IGNhbiBoZWxwIHRvIGdlbmVyYXRlIHRoZXNlKSwgb3IgcGFzcwogIHRoZSBgYC0tdXNlLXZjc2Bg
IG9wdGlvbiB0byBnZXQgdGhlIG9sZCBiZWhhdmlvdXIgYmFjay4KLSBgYGZsaXRfY29yZWBgIG5v
dyByZXF1aXJlcyBQeXRob24gMy44IG9yIGFib3ZlICg6Z2hwdWxsOmA3MzhgKQotIFRoZSBgYC0t
c2V0dXAtcHlgYCBvcHRpb24gdG8gZ2VuZXJhdGUgc2Rpc3RzIGNvbnRhaW5pbmcgYSBgYHNldHVw
LnB5YGAgZmlsZQogIGlzIG5vIGxvbmdlciBhdmFpbGFibGUgKDpnaHB1bGw6YDc3NmApLgotIE1h
a2luZyB0eXBpbmcgc3R1YnMgcGFja2FnZXMgd2l0aCBhIGBgLXN0dWJzYGAgc3VmZml4IHdpbGwg
bm93IHdvcmsKICAoOmdocHVsbDpgNzQyYCkuCi0gVGhlIGRlZmF1bHQgZ2xvYiBwYXR0ZXJucyBm
b3IgbGljZW5zZSBmaWxlcyBoYXZlIGJlZW4gZXh0ZW5kZWQgdG8gaW5jbHVkZQogIGBgTk9USUNF
KmBgIGFuZCBgYEFVVEhPUlMqYGAgKDpnaHB1bGw6YDc1OGApLgotIGBgbGljZW5zZS1maWxlc2Bg
IGdsb2IgcGF0dGVybnMgY2FuIGNvbnRhaW4gc3BhY2VzICg6Z2hwdWxsOmA3OTdgKS4KLSBGaXgg
YSBidWcgd2hlcmUgbGljZW5zZSBmaWxlcyBjb3VsZCBiZSBmb3VuZCB0d2ljZSBvbiBXaW5kb3dz
ICg6Z2hwdWxsOmA3NTJgKS4KLSBUaGUgbmV3IGBgSW1wb3J0LU5hbWVgYCBhbmQgYGBJbXBvcnQt
TmFtZXNwYWNlYGAgbWV0YWRhdGEgZmllbGRzIChtZXRhZGF0YSAyLjUpCiAgYXJlIG5vdyBzdXBw
b3J0ZWQgKDpnaHB1bGw6YDc3NGApLiBJbiBtb3N0IGNhc2VzIG5vIG5ldyBpbnB1dCBpcyByZXF1
aXJlZCwKICBhcyBGbGl0IHdpbGwgY3JlYXRlIHRoaXMgbWV0YWRhdGEgYXV0b21hdGljYWxseS4K
LSBGaXggY3JlYXRpbmcgUkVDT1JEIGZpbGVzIHdoZW4gZmlsZSBuYW1lcyBpbmNsdWRlIGNvbW1h
cyAoOmdocHVsbDpgNzQ0YCkuCi0gVGhlIGBgLS11c2UtdmNzYGAgb3B0aW9uIG5vdyBjb3JyZWN0
bHkgcmVjb2duaXNlcyBnaXQgZnJvbSBpbnNpZGUgYSBnaXQKICB3b3JrdHJlZSBmb2xkZXIgKDpn
aHB1bGw6YDc5OWApLgotIE9uIFB5dGhvbiAzLjEyIGFuZCBhYm92ZSwgYGBmbGl0IGJ1aWxkYGAg
bm93IHVzZXMgdGhlICdkYXRhJyBmaWx0ZXIgd2hlbgogIGV4dHJhY3RpbmcgdGhlIGp1c3QtY3Jl
YXRlZCBzZGlzdCBwcmlvciB0byBidWlsZGluZyBhIHdoZWVsICg6Z2hwdWxsOmA3NzVgKS4KICBU
aGlzIHJlc3RyaWN0cyBzb21lIHNwZWNpYWwgZmVhdHVyZXMgb2YgdGFyIGZpbGVzLCBidXQgc2Rp
c3RzIGFyZSB1bmxpa2VseQogIHRvIHVzZSB0aGVzZSBmZWF0dXJlcywgYW5kIHRoZXkgd291bGQg
cHJvYmFibHkgYnJlYWsgaW4gb3RoZXIgc2NlbmFyaW9zIGlmCiAgeW91IGRpZC4KLSBUaGUgdmVu
ZG9yaXNlZCBgYHJlYWRtZV9yZW5kZXJlcmBgIHBhY2thZ2Ugd2FzIHVwZGF0ZWQgdG8gdmVyc2lv
biA0NC4wCiAgKDpnaHB1bGw6YDc2MGApLgoKLSBGbGl0IHdpbGwgd29yayB3aXRoIGN1cnJlbnQg
ZGV2ZWxvcG1lbnQgdmVyc2lvbnMgb2YgUHl0aG9uIGFnYWluICg6Z2hwdWxsOmA2ODRgKS4KLSBU
aGUgYGBmbGl0YGAgY29tbWFuZCBsaW5lIHBhY2thZ2Ugbm93IHJlcXVpcmVzIFB5dGhvbiAzLjgg
b3IgYWJvdmUgKDpnaHB1bGw6YDY2MGApLgotIEZsaXQgbm93IGhhcyBhIGBgU0VDVVJJVFkubWRg
YCBmaWxlIGluIHRoZSBHaXRIdWIgcmVwb3NpdG9yeSAoOmdocHVsbDpgNjY1YCkuCiAgbmV3IGBg
W3Rvb2wuZmxpdC5tZXRhZGF0YS51cmxzXWBgIHNlY3Rpb24gb2YKICBhcmNoaXZlLCBzdWNoIGFz
IGZyb20gR2l0SHViLgotLS0KIC4uLi97cHl0aG9uMy1mbGl0LWNvcmVfMy4xMi4wLmJiID0+IHB5
dGhvbjMtZmxpdC1jb3JlXzQuMC4yLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24ve3B5dGhvbjMtZmxpdC1jb3JlXzMuMTIuMC5iYiA9PiBweXRob24zLWZsaXQtY29yZV80LjAu
Mi5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZmxpdC1jb3JlXzMuMTIuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1mbGl0LWNvcmVfNC4wLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZsaXQtY29yZV8zLjEyLjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mbGl0LWNv
cmVfNC4wLjIuYmIKaW5kZXggZTQwZmZkMGQwZi4uMjdhYWFlMDg1ZCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZsaXQtY29yZV8zLjEyLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWZsaXQtY29yZV80LjAuMi5i
YgpAQCAtOCw3ICs4LDcgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlwYS9m
bGl0L2lzc3VlcyIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9NDFlYjc4ZmE4YTg3Mjk4M2E4ODJjNjk0YTgzMDVmMDgiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxYzgwZjM0ZGQ5Njk5MmU3NzU4YjQwNDIzZDI4MDlmNDhm
NjQwY2EyODVkMGI3ODIxODI1ZTUwNzQ1ZWMzNzQwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIz
MmJjNDMxNzI3OWU4OTUyZWNhOWZiM2Y1ZTAwMGQ4Mzk1ZDY5M2IzOWMxMDViOTlmNjE5Y2U0NjFl
MWRhODUiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============8129856848746136309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-flit-core-changelog.txt"

Changelog for python3-flit-core: 3.12.0 -> 4.0.2
Source: doc/history.rst

Version 4.0.2
-------------

- Fix invalid metadata files with ``Import-Name`` (:ghissue:`813`).

Version 4.0.1
-------------

No changes, but a new tag to trigger an upload to PyPI now that twine will
accept it.

Version 4.0
-----------

This version contains breaking changes, but most projects which are already
using the ``[project]`` table for metadata shouldn't be affected, and can simply
change the ``flit_core <4`` constraint to ``<5``.

- The ``[tool.flit.metadata]`` table is no longer used for project metadata
  (:ghpull:`771`). Use the newer :ref:`[project] table <pyproject_toml_project>`
  instead (or if that is not possible, build with ``flit_core <4``).
- :ref:`build_cmd` and :ref:`publish_cmd` no longer include files in the sdist
  based on what is committed in git or Mercurial (:ghpull:`772`). These commands
  now build packages more like Flit does when called as a backend by e.g.
  ``python -m build``. Specify :ref:`sdist include & exclude patterns
  <pyproject_toml_sdist>` instead (Flit can help to generate these), or pass
  the ``--use-vcs`` option to get the old behaviour back.
- ``flit_core`` now requires Python 3.8 or above (:ghpull:`738`)
- The ``--setup-py`` option to generate sdists containing a ``setup.py`` file
  is no longer available (:ghpull:`776`).
- Making typing stubs packages with a ``-stubs`` suffix will now work
  (:ghpull:`742`).
- The default glob patterns for license files have been extended to include
  ``NOTICE*`` and ``AUTHORS*`` (:ghpull:`758`).
- ``license-files`` glob patterns can contain spaces (:ghpull:`797`).
- Fix a bug where license files could be found twice on Windows (:ghpull:`752`).
- The new ``Import-Name`` and ``Import-Namespace`` metadata fields (metadata 2.5)
  are now supported (:ghpull:`774`). In most cases no new input is required,
  as Flit will create this metadata automatically.
- Fix creating RECORD files when file names include commas (:ghpull:`744`).
- The ``--use-vcs`` option now correctly recognises git from inside a git
  worktree folder (:ghpull:`799`).
- On Python 3.12 and above, ``flit build`` now uses the 'data' filter when
  extracting the just-created sdist prior to building a wheel (:ghpull:`775`).
  This restricts some special features of tar files, but sdists are unlikely
  to use these features, and they would probably break in other scenarios if
  you did.
- The vendorised ``readme_renderer`` package was updated to version 44.0
  (:ghpull:`760`).

- Flit will work with current development versions of Python again (:ghpull:`684`).
- The ``flit`` command line package now requires Python 3.8 or above (:ghpull:`660`).
- Flit now has a ``SECURITY.md`` file in the GitHub repository (:ghpull:`665`).
  new ``[tool.flit.metadata.urls]`` section of
  archive, such as from GitHub.

--===============8129856848746136309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-c95cee811dc0b1c66cdcbb7d956e313be2509220"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:c95cee811dc0b1c66cdcbb7d956e313be2509220"
meta-yocto-bsp       
meta-poky            = "master:9c6cf36c3511b94957aba04002d98bec665e9f1e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 516 Local 324 Mirrors 0 Missed 192 Current 189 (62% match, 72% complete)
done.
Removing 18 stale sstate objects for arch x86_64...done.
Removing 56 stale sstate objects for arch qemux86_64...done.
Removing 8 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 250 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 282 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 293 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 304 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc-locale_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 310 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 317 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzcode-native-2026c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cmake-native-4.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2026c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20260601-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-native-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cmake-native-4.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2026c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 326 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 329 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ca-certificates-20260601-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-locale-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 330 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 334 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 337 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tzcode-native-2026c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 338 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 340 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unzip-native-1_6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 343 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gettext-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 346 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 349 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 350 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 353 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 354 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-native-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tzdata-2026c-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.7.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 358 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 359 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-native-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-20260601-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 362 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 363 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libbsd/libbsd_0.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 364 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 366 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 368 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-native-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2026c-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 369 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 371 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 375 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 376 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 379 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.7.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20260601-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 382 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 383 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 387 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 389 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 393 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libbsd-native-0.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-native-1_6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-native-5.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 397 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 399 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 401 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzcode-native.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 402 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 403 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe unzip-native-1_6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 407 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 409 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 410 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 411 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/cross-localedef-native_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-native-5.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libbsd-native-0.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tzcode-native-2026c-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 423 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 425 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 427 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 430 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzcode-native-2026c-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 438 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cross-localedef-native-2.44+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 444 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 445 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 446 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-3.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 448 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.47.bb:do_create_spdx_setscene)
NOTE: Running setscene task 450 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 451 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 455 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 466 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 467 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 470 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.195-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 473 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 478 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 480 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-native-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 481 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 484 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-native-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 491 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 493 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 496 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 500 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.12.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 503 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 504 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libbsd/libbsd_0.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 509 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 511 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 512 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 513 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 515 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 516 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libbsd-native-0.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 522 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 524 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 534 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 541 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 543 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 544 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe libbsd-native-0.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 550 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 554 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 556 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 558 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 562 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 565 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 568 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 571 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 576 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 584 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 585 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 589 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 595 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 599 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 600 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 602 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 603 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe texinfo-dummy-native-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-native-11.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 607 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 608 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 613 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 615 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 616 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 617 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 618 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe qemu-native-11.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 621 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_stash_locale_setscene)
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 624 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 630 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 637 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 639 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 640 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 641 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 643 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 644 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-native-0.195-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 646 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 648 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-native-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-native-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-native-0.195-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 649 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rsync-native-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 657 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 659 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rsync/rsync_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-native-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 662 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 663 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 668 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 671 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_recipe_qa_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-native-0.26.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 672 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe meson-native-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe rsync-native-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 673 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-native-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 677 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe p11-kit-native-0.26.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 679 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe rsync-native-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe meson-native-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 682 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 683 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 685 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 686 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 687 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 690 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe autoconf-archive-native-2024.10.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.44+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 240 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_fetch)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 705 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.15.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 413 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb:do_recipe_qa)
NOTE: Running task 417 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_fetch)
NOTE: Running task 425 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_fetch)
NOTE: Running task 427 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_fetch)
NOTE: Running task 429 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_fetch)
NOTE: Running task 431 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_fetch)
NOTE: Running task 434 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Started
NOTE: Running noexec task 437 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_fetch)
NOTE: Running task 440 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_fetch)
NOTE: recipe gawk-native-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gperf-native-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-initial-16.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 699 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 701 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 442 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_fetch)
NOTE: recipe libgcc-initial-16.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 450 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_fetch)
NOTE: recipe libxml2-native-2.15.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 705 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_fetch: Started
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_fetch: Started
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_fetch: Started
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe meson-native-1.11.2-r0: task do_fetch: Started
NOTE: recipe bison-native-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 469 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_fetch)
NOTE: Running task 474 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe gperf-native-3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 491 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe gawk-native-5.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 498 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_unpack)
NOTE: Running task 504 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_write_config)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-native-2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 505 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_unpack)
NOTE: Running task 506 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_unpack)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: Running task 507 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_unpack)
NOTE: Running task 508 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe libxml2-native-2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 528 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_write_config: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_unpack: Started
NOTE: Running task 529 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_patch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-build-native-1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 530 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_patch)
NOTE: Running task 531 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_patch)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_write_config: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_unpack: Succeeded
NOTE: Running task 546 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_fetch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 547 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_patch)
NOTE: Running task 548 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_patch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 549 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_unpack)
NOTE: recipe glibc-2.44+git-r0: task do_fetch: Succeeded
NOTE: Running task 550 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 553 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_fetch)
NOTE: recipe python3-packaging-native-26.2-r0: task do_patch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_patch: Succeeded
NOTE: Running task 562 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: Running task 565 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 574 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_fetch)
NOTE: Running task 575 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb:do_fetch)
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-installer-native-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 576 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_83.0.0.bb:do_patch)
NOTE: Running task 579 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_fetch)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: Running task 580 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Started
NOTE: recipe libarchive-native-3.8.9-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_fetch: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 581 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb:do_unpack)
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-83.0.0-r0: task do_patch: Succeeded
NOTE: Running task 582 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_unpack: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 583 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_patch)
WARNING: e2fsprogs-native-1.47.4-r0 do_fetch: Failed to fetch URL git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master;protocol=https;tag=v1.47.4, attempting MIRRORS if available
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 584 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb:do_patch)
NOTE: recipe meson-native-1.11.2-r0: task do_fetch: Succeeded
NOTE: Running task 585 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_unpack)
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_patch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 588 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_fetch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_patch: Succeeded
NOTE: Running task 591 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_fetch)
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-native-2.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 595 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_unpack)
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_patch: Succeeded
NOTE: Running task 604 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_fetch)
NOTE: Running task 605 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: Running task 606 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_unpack: Succeeded
NOTE: Running task 607 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.11.2.bb:do_patch)
NOTE: recipe p11-kit-native-0.26.4-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_patch: Started
NOTE: recipe meson-native-1.11.2-r0: task do_patch: Succeeded
NOTE: Running task 614 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 615 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-source_16.1.bb:do_fetch)
NOTE: Running task 617 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb:do_configure)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_fetch: Succeeded
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_fetch: Started
NOTE: Running task 618 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.13-r0: task do_fetch: Started
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 619 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_configure: Succeeded
NOTE: Running task 620 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
WARNING: libtasn1-native-4.21.0-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/libtasn1/libtasn1-4.21.0.tar.gz, attempting MIRRORS if available
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 621 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_unpack)
NOTE: recipe libarchive-native-3.8.9-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 622 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.2.bb:do_patch)
NOTE: recipe libarchive-native-3.8.9-r0: task do_unpack: Succeeded
NOTE: Running task 623 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_patch)
NOTE: recipe util-linux-native-2.42.2-r0: task do_patch: Started
NOTE: recipe libarchive-native-3.8.9-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-native-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 624 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: Running task 626 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_fetch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.8.9-r0: task do_patch: Succeeded
NOTE: Running task 627 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: Running task 631 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_compile: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_fetch: Started
NOTE: Running task 632 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb:do_install)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_unpack: Started
NOTE: recipe elfutils-native-0.195-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 641 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 643 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_unpack)
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_install: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 644 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_unpack: Succeeded
NOTE: Running task 645 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_install: Succeeded
NOTE: Running task 646 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-flit-core_4.0.2.bb:do_populate_sysroot)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_patch: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 647 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_patch)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_populate_sysroot: Started
NOTE: Running task 651 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_fetch)
NOTE: recipe glibc-2.44+git-r0: task do_unpack: Succeeded
NOTE: Running task 652 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_patch)
NOTE: recipe libpam-1.7.2-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Started
NOTE: recipe glibc-2.44+git-r0: task do_patch: Started
NOTE: recipe libpam-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 662 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe gnutls-native-3.8.13-r0: task do_unpack: Started
NOTE: recipe python3-flit-core-native-4.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_patch: Succeeded
NOTE: Running task 663 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_unpack)
NOTE: Running task 664 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: Running task 666 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_patch)
NOTE: Running task 673 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_patch: Started
WARNING: libmicrohttpd-native-1.0.9-r0 do_fetch: Failed to fetch URL https://ftpmirror.gnu.org/gnu/libmicrohttpd/libmicrohttpd-1.0.9.tar.gz, attempting MIRRORS if available
NOTE: recipe python3-installer-native-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 674 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_configure)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe gnutls-native-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 675 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: Running task 676 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_compile)
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 677 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_patch)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_compile: Started
NOTE: recipe gnutls-native-3.8.13-r0: task do_patch: Started
NOTE: recipe glibc-2.44+git-r0: task do_patch: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Started
NOTE: Running task 713 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 715 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_write_config)
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_patch: Succeeded
NOTE: Running task 717 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_write_config)
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Succeeded
NOTE: Running task 721 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 722 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_unpack)
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe gnutls-native-3.8.13-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: Running task 738 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_write_config)
NOTE: Running task 751 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_unpack)
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_unpack: Started
NOTE: Running task 755 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe p11-kit-native-0.26.4-r0: task do_fetch: Succeeded
NOTE: Running task 756 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 757 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_patch)
NOTE: recipe p11-kit-native-0.26.4-r0: task do_write_config: Started
NOTE: recipe p11-kit-native-0.26.4-r0: task do_unpack: Started
NOTE: recipe p11-kit-native-0.26.4-r0: task do_write_config: Succeeded
NOTE: Running task 759 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_fetch)
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 760 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.9.bb:do_patch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_patch: Succeeded
NOTE: Running task 766 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe libmicrohttpd-native-1.0.9-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: Running task 781 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_install)
NOTE: Running task 789 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_install: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: Running task 791 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 792 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 793 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 797 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 798 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: Running task 799 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 800 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 801 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-native-0.26.4-r0: task do_unpack: Succeeded
NOTE: Running task 802 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb:do_patch)
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe p11-kit-native-0.26.4-r0: task do_patch: Started
NOTE: Running task 804 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_patch)
NOTE: recipe p11-kit-native-0.26.4-r0: task do_patch: Succeeded
NOTE: Running task 806 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe xz-5.8.3-r0: task do_patch: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 807 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 808 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_configure)
NOTE: recipe python3-packaging-native-26.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_patch: Succeeded
NOTE: Running task 809 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: recipe qemu-native-11.0.3-r0: task do_unpack: Started
NOTE: Running task 810 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_configure)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_configure: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 811 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_compile)
NOTE: recipe python3-packaging-native-26.2-r0: task do_configure: Succeeded
NOTE: Running task 812 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_compile)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_compile: Started
WARNING: acl-2.4.0-r0 do_fetch: Failed to fetch URL https://download.savannah.gnu.org/releases/acl/acl-2.4.0.tar.gz, attempting MIRRORS if available
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
NOTE: Running task 814 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 815 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_unpack)
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 816 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_install)
NOTE: recipe python3-packaging-native-26.2-r0: task do_compile: Succeeded
NOTE: Running task 817 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_install)
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_install: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_install: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 818 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb:do_populate_sysroot)
NOTE: recipe python3-packaging-native-26.2-r0: task do_install: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot: Started
NOTE: Running task 819 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_populate_sysroot)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 821 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_fetch)
NOTE: recipe python3-packaging-native-26.2-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.8.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 822 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.7.bb:do_patch)
NOTE: recipe openssl-3.5.7-r0: task do_patch: Started
NOTE: recipe python3-pyproject-hooks-native-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 823 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-build-native-1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 825 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.7-r0: task do_patch: Succeeded
NOTE: Running task 827 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 828 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: Running task 830 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: Running task 831 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_configure)
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: Running task 832 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_unpack)
NOTE: recipe python3-build-native-1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 833 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_compile)
NOTE: recipe expat-2.8.2-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 834 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe python3-build-native-1.5.1-r0: task do_compile: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe expat-2.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 835 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_patch)
NOTE: recipe expat-2.8.2-r0: task do_patch: Started
NOTE: recipe expat-2.8.2-r0: task do_patch: Succeeded
NOTE: Running task 838 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 839 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_unpack)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Started
WARNING: bzip2-1.0.8-r0 do_fetch: Failed to fetch URL git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests;branch=master;protocol=https;destsuffix=bzip2-tests/, attempting MIRRORS if available
NOTE: recipe python3-build-native-1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 840 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_install)
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Succeeded
NOTE: Running task 841 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_patch)
NOTE: recipe python3-build-native-1.5.1-r0: task do_install: Started
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 842 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 843 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Succeeded
NOTE: Running task 845 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_install: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: Running task 846 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.1.bb:do_populate_sysroot)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 861 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_fetch)
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 862 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 863 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 866 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_fetch)
NOTE: recipe libpsl-0.23.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_fetch: Started
NOTE: Running task 869 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.2.bb:do_generate_toolchain_file)
NOTE: recipe expat-2.8.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.8.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 871 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 872 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_configure)
NOTE: Running task 875 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_configure: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_configure: Succeeded
NOTE: Running task 876 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_compile)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_compile: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_fetch: Succeeded
NOTE: Running task 877 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 879 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 880 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: Running task 884 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_unpack)
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 885 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb:do_patch)
NOTE: recipe qemu-native-11.0.3-r0: task do_patch: Started
NOTE: recipe elfutils-native-0.195-r0: task do_fetch: Succeeded
NOTE: Running task 886 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_unpack)
NOTE: recipe libpsl-0.23.1-r0: task do_unpack: Succeeded
NOTE: Running task 887 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_patch)
NOTE: recipe elfutils-native-0.195-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.1-r0: task do_patch: Succeeded
NOTE: Running task 888 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_unpack)
NOTE: recipe curl-8.21.0-r0: task do_unpack: Started
NOTE: recipe qemu-native-11.0.3-r0: task do_patch: Succeeded
NOTE: Running task 891 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe curl-8.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 892 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.21.0.bb:do_patch)
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_fetch: Succeeded
NOTE: Running task 893 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_unpack)
NOTE: recipe curl-8.21.0-r0: task do_patch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Started
NOTE: recipe curl-8.21.0-r0: task do_patch: Succeeded
NOTE: Running task 896 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe elfutils-native-0.195-r0: task do_unpack: Succeeded
NOTE: Running task 897 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.195.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 900 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: recipe elfutils-native-0.195-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 901 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_fetch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_unpack: Succeeded
NOTE: Running task 902 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_patch)
NOTE: recipe elfutils-native-0.195-r0: task do_patch: Succeeded
NOTE: Running task 905 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 911 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_fetch)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_fetch: Succeeded
NOTE: Running task 916 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_fetch)
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 917 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: recipe libffi-3.7.1-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 918 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: Running task 919 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_patch: Succeeded
NOTE: Running task 920 of 1830 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_generate_toolchain_file)
NOTE: recipe libffi-3.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 922 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_fetch)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 923 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: Running task 924 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 925 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 926 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 927 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.1.bb:do_write_config)
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Started
NOTE: recipe libpsl-0.23.1-r0: task do_write_config: Succeeded
NOTE: Running task 930 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_unpack)
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 931 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 932 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Succeeded
NOTE: Running task 933 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_patch)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_fetch: Succeeded
NOTE: Running task 936 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_fetch)
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Started
NOTE: recipe python3-3.14.6-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Succeeded
NOTE: Running task 942 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_unpack)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_patch: Succeeded
NOTE: Running task 943 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: Running task 946 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: Running task 947 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: recipe libffi-3.7.1-r0: task do_unpack: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_unpack: Succeeded
NOTE: Running task 948 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_patch)
NOTE: recipe libffi-3.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb:do_unpack)
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Started
NOTE: Running task 950 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.7.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Started
NOTE: recipe libffi-3.7.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_patch: Succeeded
NOTE: Running task 951 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: recipe libffi-3.7.1-r0: task do_patch: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: Running task 960 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: Running task 973 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe python3-3.14.6-r0: task do_fetch: Succeeded
NOTE: Running task 976 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: Running task 977 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_unpack)
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe python3-3.14.6-r0: task do_unpack: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 1830 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.47.0/recipe-sysroot-native/usr/bin/nativepython3):
| 	flit_core<4,>=3.11
| 		wanted: <4,>=3.11
| 		found: 4.0.2
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.47.0/temp/run.do_compile.2454111:154 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.47.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.47.0/sources/wheel-0.47.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.47.0/temp/run.do_compile.2454111, line 154
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.47.0/temp/run.do_compile.2454111, line 149
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.47.0/temp/run.do_compile.2454111, line 158
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_compile: Failed
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.42.2-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.6-r0: task do_unpack: Succeeded
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-native-2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe gcc-source-16.1.0-16.1.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 979 tasks of which 783 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260805051204.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260805051204.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.47.0/temp/log.do_compile.2454111
Summary: There were 5 WARNING messages.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-wheel-native-0.47.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.47.0/temp/run.do_compile.2454111' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-wheel-native/0.47.0/temp/log.do_compile.2454111
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_compile) failed with exit code '1'

--===============8129856848746136309==--

