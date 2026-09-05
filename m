Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AECC79F90
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 06:28:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3450.1788589715364641833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 23:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BNTcmW0z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PdwhzjQW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a070412b55-140eedb7-0cc4-431b-abd7-fd8672c74b65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788589714;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D01DO3lk6aXoQPuZr7d28LyaruX/b9CJyRdz2ACOULM=;
	b=BNTcmW0zs9W3vGH0DXDvbMMMmN5O4n7peJVb2ttMJCetpgoqZALNwR7wMTXi1sXK
	ngb82MJ7zCPqUdNqaMlUP+fn/YGeMe4zhngs7TUgZxSPLvM6HGRF1ie6+CM3AVdnjea
	PcpD9rbfb4066wd+YlWZ4Ya/mkwn/2pPZ25Y7dZA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788589714;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D01DO3lk6aXoQPuZr7d28LyaruX/b9CJyRdz2ACOULM=;
	b=PdwhzjQWadYPKtNEmtyma6SaJfuHrEdsycEUvxHDr+Rx7kAwg8RWLrhvb28MY0D0
	XBAfGRFKtyA/F2wRuvid7GjHsOL66zXg1xWo8NxmoN8+it5GqpjHPlTJZ8iSIUBxMlJ
	ggMdGsFBW0c15f9agOJFFOOeSa8yRZDJ8sWs8jFU=
Content-Type: multipart/mixed; boundary="===============5617748445824732288=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-flit-core: upgrading to 4.0.2 SUCCEEDED
Message-ID: <010101a070412b55-140eedb7-0cc4-431b-abd7-fd8672c74b65-000000@us-west-2.amazonses.com>
Date: Sat, 5 Sep 2026 06:28:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 06:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245134

--===============5617748445824732288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-flit-core* to *4.0.2* has Succeeded.

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
From 9f6eacd3ab415ff303b96cef58be0b0976af7d0f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 5 Sep 2026 05:58:01 +0000
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


--===============5617748445824732288==
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

--===============5617748445824732288==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-flit-core-upgrade-3.12.0-4.0.2.patch"

RnJvbSA5ZjZlYWNkM2FiNDE1ZmYzMDNiOTZjZWY1OGJlMGIwOTc2YWY3ZDBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNSBTZXAgMjAyNiAwNTo1ODowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
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

--===============5617748445824732288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-flit-core: PV changed from "3.12.0" to "4.0.2"
packages/x86-64-v3-poky-linux/python3-flit-core: PKGV changed from 3.12.0 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/python3-flit-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/f/flit/flit-3.12.0.tar.gz" to "https://files.pythonhosted.org/packages/source/f/flit/flit-4.0.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-dbg: PV changed from "3.12.0" to "4.0.2"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-dbg: PKGV changed from 3.12.0 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-dev: PV changed from "3.12.0" to "4.0.2"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-dev: PKGV changed from 3.12.0 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-doc: PV changed from "3.12.0" to "4.0.2"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-doc: PKGV changed from 3.12.0 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-locale: PV changed from "3.12.0" to "4.0.2"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-locale: PKGV changed from 3.12.0 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-src: PV changed from "3.12.0" to "4.0.2"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-src: PKGV changed from 3.12.0 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-staticdev: PV changed from "3.12.0" to "4.0.2"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core-staticdev: PKGV changed from 3.12.0 [default] to 4.0.2 [default]
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core: PV changed from "3.12.0" to "4.0.2"
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info -> /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info -> /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core: PKGSIZE changed from 323957 to 311648 (-4%)
packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core: PKGV changed from 3.12.0 [default] to 4.0.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/RECORD was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/RECORD was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was removed

--===============5617748445824732288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-flit-core/python3-flit-core: FILELIST: directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info -> /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info -> /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/RECORD was added
  /usr/lib/python3.14/site-packages/flit_core-4.0.2.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/flit_core/vendor/tomli-1.2.3.dist-info/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/RECORD was removed
  /usr/lib/python3.14/site-packages/flit_core-3.12.0.dist-info/WHEEL was removed

--===============5617748445824732288==--

