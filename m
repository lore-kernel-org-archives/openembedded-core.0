Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FADC88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 06:54:21 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33713.1789109658063021194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 23:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=h7x1hEn2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xT4rWT4n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a08f3edd9c-c7c46782-1222-4c9b-99e8-1d40cadc6a3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789109657;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+BaJXtv8/R/tx0osB98wBWnC9VvoiQsHyxiM4duQ0HY=;
	b=h7x1hEn218kN95VI07VDJWFjrJ1dljuSQ8T4bH88dS3xdAESBurrZN/aYqSJHXg8
	SOeRv3pzBc0ES+1xxBbPeyRAT4oiXDoJyBZlV+4kGD+uhDlL+aHDwnHqb+WFdZkKDG1
	fysK0vAqgzPaKsgQ7oQxBvhP0JfvsFHnaJSyoREY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789109657;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+BaJXtv8/R/tx0osB98wBWnC9VvoiQsHyxiM4duQ0HY=;
	b=xT4rWT4n/eoBdeEPhO0ZMLkl95p6bMP3cdURhF+SgVgHFMkHmIYSI/xOmWzDwZui
	gcRTWlxGCYjOtpn+4RDWuBDRDEXWTmldaGHkWoDgsAXYdcBvYo18q8Olzwc/ZaXxmY2
	IGN+ocalCABA6kt23ZuTh4U7Qv45XGS2qm1SnIRU=
Content-Type: multipart/mixed; boundary="===============5064055601656393881=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.6.1 SUCCEEDED
Message-ID: <010101a08f3edd9c-c7c46782-1222-4c9b-99e8-1d40cadc6a3e-000000@us-west-2.amazonses.com>
Date: Fri, 11 Sep 2026 06:54:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245608

--===============5064055601656393881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-build* to *1.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.6.0-1.6.1.patch
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
From 6fcb1b561a44c02d9d03c9759e7c5c624b8c200d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 11 Sep 2026 05:42:44 +0000
Subject: [PATCH] python3-build: upgrade 1.6.0 -> 1.6.1

Source: CHANGELOG.rst

####################
 1.6.1 (2026-09-10)
####################

**********
 Bugfixes
**********

- Avoid trying to detect symlinks on Windows, regression in 1.6.0 - by :user:`henryiii` (:issue:`1175`) (:issue:`1175`)

***************
 Documentation
***************

- Fix doubled backslashes in the Windows pip config path (``%APPDATA%\pip\pip.ini``) in the docs - by :user:`aroh3006`
  (:issue:`1149`)

***************
 Miscellaneous
***************

- :issue:`1168`, :issue:`1170`, :issue:`1178`

- Add ``--sdist-extract-dir`` to extract the intermediate sdist into a persistent directory, enabling compiler cache
  reuse across rebuilds - by :user:`gaborbernat` (:issue:`614`)
- Add ``--env-dir`` to place the isolated build environment at a fixed path, enabling compiler cache reuse across builds
  - by :user:`gaborbernat` (:issue:`655`)
- On build failure, print a tip pointing to ``--env-dir`` and ``--sdist-extract-dir`` for debugging and link to the
  "Debug a failed build" how-to - reported by :user:`dimpase`, implemented by :user:`gaborbernat` (:issue:`966`)
- Reject a file passed as ``--env-dir`` with a clear error instead of a raw ``FileExistsError`` - by :user:`henryiii`
  (:issue:`1100`)
- Fix the Windows symlink support probe always returning ``False`` due to a stale object interpolated into the
  destination path - by :user:`henryiii` (:issue:`1118`)
- Write pip/uv requirements and constraints files with ``\n`` instead of ``os.linesep``, avoiding doubled ``\r\r\n``
  line endings on Windows - by :user:`henryiii` (:issue:`1120`)
  deduplicated set of lines, fixing a case where a hashed requirement (e.g. from ``pip-compile --generate-hashes``)
  could have its ``--hash`` continuation line separated from its requirement line and silently dropped, depending on the
- Deprecate :func:`build.util.project_wheel_metadata`; use ``python -m build --metadata`` instead - by
  :user:`gaborbernat` (:issue:`557`)
- Warn on config settings without a value (e.g. ``-C--my-flag``); use ``-C--my-flag=`` instead for compatibility with
  pip - by :user:`gaborbernat` (:issue:`640`)
- :issue:`1058`, :issue:`1060`, :issue:`1062`, :issue:`1093`, :issue:`1099`, :issue:`1107`, :issue:`1113`,
  :issue:`1117`, :issue:`1122`, :issue:`1124`, :issue:`1128`, :issue:`1132`
---
 .../python/python3-build/check-valid-dist.patch                 | 2 +-
 .../python/{python3-build_1.6.0.bb => python3-build_1.6.1.bb}   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-build_1.6.0.bb => python3-build_1.6.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-build/check-valid-dist.patch b/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
index 82c31a49a4..3166729147 100644
--- a/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
+++ b/meta/recipes-devtools/python/python3-build/check-valid-dist.patch
@@ -1,4 +1,4 @@
-From a2a217409e01e3ebea88dce85d81dbe6b3c79187 Mon Sep 17 00:00:00 2001
+From 9cf13fa5cb8aadad746f724a473db2dc9deabb3b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 12 Aug 2026 12:35:29 +0100
 Subject: [PATCH] Ignore invalid distributions when checking dependencies
diff --git a/meta/recipes-devtools/python/python3-build_1.6.0.bb b/meta/recipes-devtools/python/python3-build_1.6.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-build_1.6.0.bb
rename to meta/recipes-devtools/python/python3-build_1.6.1.bb
index acec9cd9ef..e5b673c544 100644
--- a/meta/recipes-devtools/python/python3-build_1.6.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
 SRC_URI += "file://check-valid-dist.patch"
 
-SRC_URI[sha256sum] = "bd2c8afc603e7a2e0ce70e2ea85f0a6d02043bafbd307f5bada0f98669eca5af"
+SRC_URI[sha256sum] = "51cc11666391ab6f092070437ac747002ff46f3e4113a3622177ee6b488bfc53"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============5064055601656393881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-build: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/x86-64-v3-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.6.0.tar.gz file://check-valid-dist.patch" to "https://files.pythonhosted.org/packages/source/b/build/build-1.6.1.tar.gz file://check-valid-dist.patch"
packages/x86-64-v3-poky-linux/python3-build: PV changed from "1.6.0" to "1.6.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PV changed from "1.6.0" to "1.6.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PV changed from "1.6.0" to "1.6.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PV changed from "1.6.0" to "1.6.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PV changed from "1.6.0" to "1.6.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PV changed from "1.6.0" to "1.6.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.6.0" to "1.6.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.6.0.dist-info -> /usr/lib/python3.14/site-packages/build-1.6.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/build-1.6.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.6.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGSIZE changed from 218012 to 217585 (-0%)
packages/x86-64-v3-poky-linux/python3-build/python3-build: PV changed from "1.6.0" to "1.6.1"
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.6.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.6.1.dist-info
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.6.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.6.1.dist-info

--===============5064055601656393881==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.6.0-1.6.1.patch"

RnJvbSA2ZmNiMWI1NjFhNDRjMDJkOWQwM2M5NzU5ZTdjNWM2MjRiOGMyMDBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTEgU2VwIDIwMjYgMDU6NDI6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJ1aWxkOiB1cGdyYWRlIDEuNi4wIC0+IDEuNi4xCgpTb3VyY2U6IENIQU5HRUxPRy5y
c3QKCiMjIyMjIyMjIyMjIyMjIyMjIyMjCiAxLjYuMSAoMjAyNi0wOS0xMCkKIyMjIyMjIyMjIyMj
IyMjIyMjIyMKCioqKioqKioqKioKIEJ1Z2ZpeGVzCioqKioqKioqKioKCi0gQXZvaWQgdHJ5aW5n
IHRvIGRldGVjdCBzeW1saW5rcyBvbiBXaW5kb3dzLCByZWdyZXNzaW9uIGluIDEuNi4wIC0gYnkg
OnVzZXI6YGhlbnJ5aWlpYCAoOmlzc3VlOmAxMTc1YCkgKDppc3N1ZTpgMTE3NWApCgoqKioqKioq
KioqKioqKioKIERvY3VtZW50YXRpb24KKioqKioqKioqKioqKioqCgotIEZpeCBkb3VibGVkIGJh
Y2tzbGFzaGVzIGluIHRoZSBXaW5kb3dzIHBpcCBjb25maWcgcGF0aCAoYGAlQVBQREFUQSVccGlw
XHBpcC5pbmlgYCkgaW4gdGhlIGRvY3MgLSBieSA6dXNlcjpgYXJvaDMwMDZgCiAgKDppc3N1ZTpg
MTE0OWApCgoqKioqKioqKioqKioqKioKIE1pc2NlbGxhbmVvdXMKKioqKioqKioqKioqKioqCgot
IDppc3N1ZTpgMTE2OGAsIDppc3N1ZTpgMTE3MGAsIDppc3N1ZTpgMTE3OGAKCi0gQWRkIGBgLS1z
ZGlzdC1leHRyYWN0LWRpcmBgIHRvIGV4dHJhY3QgdGhlIGludGVybWVkaWF0ZSBzZGlzdCBpbnRv
IGEgcGVyc2lzdGVudCBkaXJlY3RvcnksIGVuYWJsaW5nIGNvbXBpbGVyIGNhY2hlCiAgcmV1c2Ug
YWNyb3NzIHJlYnVpbGRzIC0gYnkgOnVzZXI6YGdhYm9yYmVybmF0YCAoOmlzc3VlOmA2MTRgKQot
IEFkZCBgYC0tZW52LWRpcmBgIHRvIHBsYWNlIHRoZSBpc29sYXRlZCBidWlsZCBlbnZpcm9ubWVu
dCBhdCBhIGZpeGVkIHBhdGgsIGVuYWJsaW5nIGNvbXBpbGVyIGNhY2hlIHJldXNlIGFjcm9zcyBi
dWlsZHMKICAtIGJ5IDp1c2VyOmBnYWJvcmJlcm5hdGAgKDppc3N1ZTpgNjU1YCkKLSBPbiBidWls
ZCBmYWlsdXJlLCBwcmludCBhIHRpcCBwb2ludGluZyB0byBgYC0tZW52LWRpcmBgIGFuZCBgYC0t
c2Rpc3QtZXh0cmFjdC1kaXJgYCBmb3IgZGVidWdnaW5nIGFuZCBsaW5rIHRvIHRoZQogICJEZWJ1
ZyBhIGZhaWxlZCBidWlsZCIgaG93LXRvIC0gcmVwb3J0ZWQgYnkgOnVzZXI6YGRpbXBhc2VgLCBp
bXBsZW1lbnRlZCBieSA6dXNlcjpgZ2Fib3JiZXJuYXRgICg6aXNzdWU6YDk2NmApCi0gUmVqZWN0
IGEgZmlsZSBwYXNzZWQgYXMgYGAtLWVudi1kaXJgYCB3aXRoIGEgY2xlYXIgZXJyb3IgaW5zdGVh
ZCBvZiBhIHJhdyBgYEZpbGVFeGlzdHNFcnJvcmBgIC0gYnkgOnVzZXI6YGhlbnJ5aWlpYAogICg6
aXNzdWU6YDExMDBgKQotIEZpeCB0aGUgV2luZG93cyBzeW1saW5rIHN1cHBvcnQgcHJvYmUgYWx3
YXlzIHJldHVybmluZyBgYEZhbHNlYGAgZHVlIHRvIGEgc3RhbGUgb2JqZWN0IGludGVycG9sYXRl
ZCBpbnRvIHRoZQogIGRlc3RpbmF0aW9uIHBhdGggLSBieSA6dXNlcjpgaGVucnlpaWlgICg6aXNz
dWU6YDExMThgKQotIFdyaXRlIHBpcC91diByZXF1aXJlbWVudHMgYW5kIGNvbnN0cmFpbnRzIGZp
bGVzIHdpdGggYGBcbmBgIGluc3RlYWQgb2YgYGBvcy5saW5lc2VwYGAsIGF2b2lkaW5nIGRvdWJs
ZWQgYGBcclxyXG5gYAogIGxpbmUgZW5kaW5ncyBvbiBXaW5kb3dzIC0gYnkgOnVzZXI6YGhlbnJ5
aWlpYCAoOmlzc3VlOmAxMTIwYCkKICBkZWR1cGxpY2F0ZWQgc2V0IG9mIGxpbmVzLCBmaXhpbmcg
YSBjYXNlIHdoZXJlIGEgaGFzaGVkIHJlcXVpcmVtZW50IChlLmcuIGZyb20gYGBwaXAtY29tcGls
ZSAtLWdlbmVyYXRlLWhhc2hlc2BgKQogIGNvdWxkIGhhdmUgaXRzIGBgLS1oYXNoYGAgY29udGlu
dWF0aW9uIGxpbmUgc2VwYXJhdGVkIGZyb20gaXRzIHJlcXVpcmVtZW50IGxpbmUgYW5kIHNpbGVu
dGx5IGRyb3BwZWQsIGRlcGVuZGluZyBvbiB0aGUKLSBEZXByZWNhdGUgOmZ1bmM6YGJ1aWxkLnV0
aWwucHJvamVjdF93aGVlbF9tZXRhZGF0YWA7IHVzZSBgYHB5dGhvbiAtbSBidWlsZCAtLW1ldGFk
YXRhYGAgaW5zdGVhZCAtIGJ5CiAgOnVzZXI6YGdhYm9yYmVybmF0YCAoOmlzc3VlOmA1NTdgKQot
IFdhcm4gb24gY29uZmlnIHNldHRpbmdzIHdpdGhvdXQgYSB2YWx1ZSAoZS5nLiBgYC1DLS1teS1m
bGFnYGApOyB1c2UgYGAtQy0tbXktZmxhZz1gYCBpbnN0ZWFkIGZvciBjb21wYXRpYmlsaXR5IHdp
dGgKICBwaXAgLSBieSA6dXNlcjpgZ2Fib3JiZXJuYXRgICg6aXNzdWU6YDY0MGApCi0gOmlzc3Vl
OmAxMDU4YCwgOmlzc3VlOmAxMDYwYCwgOmlzc3VlOmAxMDYyYCwgOmlzc3VlOmAxMDkzYCwgOmlz
c3VlOmAxMDk5YCwgOmlzc3VlOmAxMTA3YCwgOmlzc3VlOmAxMTEzYCwKICA6aXNzdWU6YDExMTdg
LCA6aXNzdWU6YDExMjJgLCA6aXNzdWU6YDExMjRgLCA6aXNzdWU6YDExMjhgLCA6aXNzdWU6YDEx
MzJgCi0tLQogLi4uL3B5dGhvbi9weXRob24zLWJ1aWxkL2NoZWNrLXZhbGlkLWRpc3QucGF0Y2gg
ICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3B5dGhvbi97cHl0aG9uMy1idWlsZF8xLjYuMC5i
YiA9PiBweXRob24zLWJ1aWxkXzEuNi4xLmJifSAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi97cHl0aG9uMy1idWlsZF8xLjYuMC5iYiA9PiBweXRob24zLWJ1aWxkXzEuNi4x
LmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1idWlsZC9jaGVjay12YWxpZC1kaXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWJ1aWxkL2NoZWNrLXZhbGlkLWRpc3QucGF0Y2gKaW5kZXggODJjMzFh
NDlhNC4uMzE2NjcyOTE0NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJ1aWxkL2NoZWNrLXZhbGlkLWRpc3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkL2NoZWNrLXZhbGlkLWRpc3QucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGEyYTIxNzQwOWUwMWUzZWJlYTg4ZGNlODVkODFkYmU2YjNjNzkx
ODcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDljZjEzZmE1Y2I4YWFkYWQ3NDZmNzI0
YTQ3M2RiMmRjOWRlYWJiM2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1
cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IFdlZCwgMTIgQXVnIDIwMjYgMTI6MzU6
MjkgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gSWdub3JlIGludmFsaWQgZGlzdHJpYnV0aW9ucyB3
aGVuIGNoZWNraW5nIGRlcGVuZGVuY2llcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuNi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWJ1aWxkXzEuNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjYuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEu
Ni4xLmJiCmluZGV4IGFjZWM5Y2Q5ZWYuLmU1YjY3M2M1NDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjYuMC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS42LjEuYmIKQEAgLTUsNyArNSw3
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTMxMDQzOWFmMjg3YjBm
YjQ3ODBiMmFkNjkwN2MyNTZjIgogCiBTUkNfVVJJICs9ICJmaWxlOi8vY2hlY2stdmFsaWQtZGlz
dC5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJkMmM4YWZjNjAzZTdhMmUwY2U3MGUy
ZWE4NWYwYTZkMDIwNDNiYWZiZDMwN2Y1YmFkYTBmOTg2NjllY2E1YWYiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNTFjYzExNjY2MzkxYWI2ZjA5MjA3MDQzN2FjNzQ3MDAyZmY0NmYzZTQxMTNhMzYy
MjE3N2VlNmI0ODhiZmM1MyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0X2NvcmUKIAotLSAK
Mi40Ny4xCgo=

--===============5064055601656393881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-build-changelog.txt"

Changelog for python3-build: 1.6.0 -> 1.6.1
Source: CHANGELOG.rst

####################
 1.6.1 (2026-09-10)
####################

**********
 Bugfixes
**********

- Avoid trying to detect symlinks on Windows, regression in 1.6.0 - by :user:`henryiii` (:issue:`1175`) (:issue:`1175`)

***************
 Documentation
***************

- Fix doubled backslashes in the Windows pip config path (``%APPDATA%\pip\pip.ini``) in the docs - by :user:`aroh3006`
  (:issue:`1149`)

***************
 Miscellaneous
***************

- :issue:`1168`, :issue:`1170`, :issue:`1178`

- Add ``--sdist-extract-dir`` to extract the intermediate sdist into a persistent directory, enabling compiler cache
  reuse across rebuilds - by :user:`gaborbernat` (:issue:`614`)
- Add ``--env-dir`` to place the isolated build environment at a fixed path, enabling compiler cache reuse across builds
  - by :user:`gaborbernat` (:issue:`655`)
- On build failure, print a tip pointing to ``--env-dir`` and ``--sdist-extract-dir`` for debugging and link to the
  "Debug a failed build" how-to - reported by :user:`dimpase`, implemented by :user:`gaborbernat` (:issue:`966`)
- Reject a file passed as ``--env-dir`` with a clear error instead of a raw ``FileExistsError`` - by :user:`henryiii`
  (:issue:`1100`)
- Fix the Windows symlink support probe always returning ``False`` due to a stale object interpolated into the
  destination path - by :user:`henryiii` (:issue:`1118`)
- Write pip/uv requirements and constraints files with ``\n`` instead of ``os.linesep``, avoiding doubled ``\r\r\n``
  line endings on Windows - by :user:`henryiii` (:issue:`1120`)
  deduplicated set of lines, fixing a case where a hashed requirement (e.g. from ``pip-compile --generate-hashes``)
  could have its ``--hash`` continuation line separated from its requirement line and silently dropped, depending on the
- Deprecate :func:`build.util.project_wheel_metadata`; use ``python -m build --metadata`` instead - by
  :user:`gaborbernat` (:issue:`557`)
- Warn on config settings without a value (e.g. ``-C--my-flag``); use ``-C--my-flag=`` instead for compatibility with
  pip - by :user:`gaborbernat` (:issue:`640`)
- :issue:`1058`, :issue:`1060`, :issue:`1062`, :issue:`1093`, :issue:`1099`, :issue:`1107`, :issue:`1113`,
  :issue:`1117`, :issue:`1122`, :issue:`1124`, :issue:`1128`, :issue:`1132`

--===============5064055601656393881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.6.0.dist-info -> /usr/lib/python3.14/site-packages/build-1.6.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/build-1.6.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.6.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.6.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.6.1.dist-info
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.6.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.6.1.dist-info

--===============5064055601656393881==--

