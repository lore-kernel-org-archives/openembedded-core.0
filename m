Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5514.1792563747079739512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 23:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KTe6npD5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=APj3l9aM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a15d2014ed-f52a205c-bd5b-4571-ace3-94834990c7ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792563746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zxvXobbJwol82zKWlOltzDtHNDZI7Ye5saL5fO4lv84=;
	b=KTe6npD5Y0M4enqN6McM8pqcHV+YGrQoyGn88rjRYq0TdbNrbKz4Ok3s/vKe2TwM
	nCz6iY6UdeK0bysayrecWrxsNB44WKO92Gx8r/C3g8xQkISazYaR8t86s12KueTbjNp
	h3hGWfeFKR7e/JXyWqWEfMe93exIy89kWRYVHIRQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792563746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zxvXobbJwol82zKWlOltzDtHNDZI7Ye5saL5fO4lv84=;
	b=APj3l9aMWHlII2obYSZ72DPMvwlC6RQqbMJKvFrBdrlS1ofz2mJHykc4kL7xa3Uf
	3U2pWVRmOKBgvqBUBYHqzPQvnz7AWI+14Rrr4TDc19kexjN68HYXQM3HGNqgTGkMuSq
	hDeBj1JQe32GwZOeT6ZAz88AHgRhxpTDDA1ypRLY=
Content-Type: multipart/mixed; boundary="===============2392940406823713098=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 84.2.1 SUCCEEDED
Message-ID: <010101a15d2014ed-f52a205c-bd5b-4571-ace3-94834990c7ad-000000@us-west-2.amazonses.com>
Date: Wed, 21 Oct 2026 06:22:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.21-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248355

--===============2392940406823713098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *84.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-84.0.0-84.2.1.patch
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
From 4938d159c3b41bbf26273d638945fd92c03ae83b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 21 Oct 2026 05:49:03 +0000
Subject: [PATCH] python3-setuptools: upgrade 84.0.0 -> 84.2.1

v84.2.1
=======

Bugfixes
--------

- Changed wheel tags and stable-ABI validation to use sysconfig data.
- Fixed unimportable extensions on free-threaded Python 3.13 and 3.14 when
  ``Extension.py_limited_api`` is enabled. These builds now use their
  version-specific extension suffix instead of using the unsupported ``.abi3t``
  suffix.

Improved Documentation
----------------------

- Replaced broken link to Python Eggs documentation with an archived version
  from the Wayback Machine.

v84.2.0
=======

Features
--------

- Added support for building abi3t extensions and abi3.abi3t wheels on Python
  3.15 and newer. See :pep:`803` and the `Python 3.15 "What's New" entry
  <https://docs.python.org/3.15/whatsnew/3.15.html#pep-803-abi3t-stable-abi-for-
  free-threaded-builds>`_
  for more details.
- Updated vendored packaging version to 26.3, which adds support for the
  ``abi3t`` tag from :pep:`803`.

Bugfixes
--------

- Use target sysconfig data for stable-ABI extension filenames.

v84.1.0
=======

Features
--------

- ``setuptools.archive_util`` now raises the new ``UnsafeMember`` exception when
  an archive member would be extracted outside of the extraction directory,
  where previously such a member was silently skipped. Aborting makes a
  malicious or malformed archive visible to the caller instead of yielding a
  quietly incomplete extraction, and matches the behavior of the standard
  library's ``tarfile`` extraction filters.

Bugfixes
--------

- ``Wheel.install_as_egg`` no longer creates namespace package directories
  outside of the destination egg directory. Entries in a wheel's
  ``namespace_packages.txt`` were split on ``.`` and passed straight to
  ``os.path.join``, so an entry that was absolute, drive-qualified, or UNC
  discarded the destination and placed an ``__init__.py`` at a path chosen by
  the wheel. Namespace entries are now validated as dotted module names on
  every platform -- see GHSA-xmj3-9gf7-h52w.

  This code path is reached only by the deprecated ``setup_requires``
  mechanism when ``setup()`` is invoked outside a PEP 517 frontend; the
  setuptools build backend never reaches it.
- ``setuptools.archive_util`` no longer extracts archive members outside of the
  requested extraction directory. Both the tar and zip formats specify ``/`` as
  the only path separator, but the guard against ``..`` components split member
  names on ``/`` alone, so a name such as ``..\escaped.txt`` was treated as a
  single component and then resolved as a traversal by the filesystem on
  Windows. Member names containing a backslash, a drive letter, or a UNC prefix
  are now rejected on every platform, as are members whose resolved destination
  falls outside the extraction directory -- see GHSA-grgh-hr87-3jpw.

  for deprecated ``python_implementation`` marker.
---
 ...ils-sysconfig.py-make-it-possible-to-substite.patch | 10 +++++-----
 ...tuptools_84.0.0.bb => python3-setuptools_84.2.1.bb} |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_84.0.0.bb => python3-setuptools_84.2.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index f6313fb1a9..be3ff46161 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From fe651521b9d970a84432b37d2731932a4862deb2 Mon Sep 17 00:00:00 2001
+From 42a0b565333284105ea4cbcc2539029564e095e3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,10 +20,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index 7ddc869..01a06af 100644
+index 4792b58..cf1fbc5 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
-@@ -134,6 +134,8 @@ def get_python_inc(plat_specific: bool = False, prefix: str | None = None) -> st
+@@ -133,6 +133,8 @@ def get_python_inc(plat_specific: bool = False, prefix: str | None = None) -> st
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
      default_prefix = BASE_EXEC_PREFIX if plat_specific else BASE_PREFIX
@@ -32,7 +32,7 @@ index 7ddc869..01a06af 100644
      resolved_prefix = prefix if prefix is not None else default_prefix
      # MinGW imitates posix like layout, but os.name != posix
      os_name = "posix" if is_mingw() else os.name
-@@ -246,7 +248,13 @@ def get_python_lib(
+@@ -245,7 +247,13 @@ def get_python_lib(
  
      early_prefix = prefix
  
@@ -47,7 +47,7 @@ index 7ddc869..01a06af 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -261,7 +269,7 @@ def get_python_lib(
+@@ -260,7 +268,7 @@ def get_python_lib(
              # Pure Python
              libdir = "lib"
          implementation = 'pypy' if IS_PYPY else 'python'
diff --git a/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_84.2.1.bb
index 648b084a27..f2dd481835 100644
--- a/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_84.2.1.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "f4695c21257f0d9b537ec2692c941d02ee143b7cc1276941349a546573b2ef73"
+SRC_URI[sha256sum] = "3ff8b3b5492a0aa66960f4419365a86b84e013070d4313e4d4a6894f5d64d6bc"
 
 do_install:append() {
 	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).
-- 
2.47.1


--===============2392940406823713098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.o /lib/lib*.so /lib/*.la"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/python3-setuptools: PKGV changed from 84.0.0 [default] to 84.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools: PV changed from "84.0.0" to "84.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-84.0.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-84.2.1.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 84.0.0 [default] to 84.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "84.0.0" to "84.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 84.0.0 [default] to 84.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "84.0.0" to "84.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 84.0.0 [default] to 84.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "84.0.0" to "84.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 84.0.0 [default] to 84.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "84.0.0" to "84.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 84.0.0 [default] to 84.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "84.0.0" to "84.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 84.0.0 [default] to 84.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "84.0.0" to "84.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 84.0.0 [default] to 84.2.1 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PV changed from "84.0.0" to "84.2.1"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 5612978 to 6094880 (+9%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-84.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools-84.2.1.dist-info/licenses, added "/usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/_ranges.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycac
 he__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/errors.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/ranges.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/direct_url.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/ranges.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-84.2.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/ranges.py was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-84.2.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/ranges.py was added

--===============2392940406823713098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-setuptools-changelog.txt"

v84.2.1
=======

Bugfixes
--------

- Changed wheel tags and stable-ABI validation to use sysconfig data.
- Fixed unimportable extensions on free-threaded Python 3.13 and 3.14 when
  ``Extension.py_limited_api`` is enabled. These builds now use their
  version-specific extension suffix instead of using the unsupported ``.abi3t``
  suffix.

Improved Documentation
----------------------

- Replaced broken link to Python Eggs documentation with an archived version
  from the Wayback Machine.

v84.2.0
=======

Features
--------

- Added support for building abi3t extensions and abi3.abi3t wheels on Python
  3.15 and newer. See :pep:`803` and the `Python 3.15 "What's New" entry
  <https://docs.python.org/3.15/whatsnew/3.15.html#pep-803-abi3t-stable-abi-for-
  free-threaded-builds>`_
  for more details.
- Updated vendored packaging version to 26.3, which adds support for the
  ``abi3t`` tag from :pep:`803`.

Bugfixes
--------

- Use target sysconfig data for stable-ABI extension filenames.

v84.1.0
=======

Features
--------

- ``setuptools.archive_util`` now raises the new ``UnsafeMember`` exception when
  an archive member would be extracted outside of the extraction directory,
  where previously such a member was silently skipped. Aborting makes a
  malicious or malformed archive visible to the caller instead of yielding a
  quietly incomplete extraction, and matches the behavior of the standard
  library's ``tarfile`` extraction filters.

Bugfixes
--------

- ``Wheel.install_as_egg`` no longer creates namespace package directories
  outside of the destination egg directory. Entries in a wheel's
  ``namespace_packages.txt`` were split on ``.`` and passed straight to
  ``os.path.join``, so an entry that was absolute, drive-qualified, or UNC
  discarded the destination and placed an ``__init__.py`` at a path chosen by
  the wheel. Namespace entries are now validated as dotted module names on
  every platform -- see GHSA-xmj3-9gf7-h52w.

  This code path is reached only by the deprecated ``setup_requires``
  mechanism when ``setup()`` is invoked outside a PEP 517 frontend; the
  setuptools build backend never reaches it.
- ``setuptools.archive_util`` no longer extracts archive members outside of the
  requested extraction directory. Both the tar and zip formats specify ``/`` as
  the only path separator, but the guard against ``..`` components split member
  names on ``/`` alone, so a name such as ``..\escaped.txt`` was treated as a
  single component and then resolved as a traversal by the filesystem on
  Windows. Member names containing a backslash, a drive letter, or a UNC prefix
  are now rejected on every platform, as are members whose resolved destination
  falls outside the extraction directory -- see GHSA-grgh-hr87-3jpw.

  for deprecated ``python_implementation`` marker.

--===============2392940406823713098==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-84.0.0-84.2.1.patch"

RnJvbSA0OTM4ZDE1OWMzYjQxYmJmMjYyNzNkNjM4OTQ1ZmQ5MmMwM2FlODNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjEgT2N0IDIwMjYgMDU6NDk6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgODQuMC4wIC0+IDg0LjIuMQoKdjg0LjIuMQo9PT09
PT09CgpCdWdmaXhlcwotLS0tLS0tLQoKLSBDaGFuZ2VkIHdoZWVsIHRhZ3MgYW5kIHN0YWJsZS1B
QkkgdmFsaWRhdGlvbiB0byB1c2Ugc3lzY29uZmlnIGRhdGEuCi0gRml4ZWQgdW5pbXBvcnRhYmxl
IGV4dGVuc2lvbnMgb24gZnJlZS10aHJlYWRlZCBQeXRob24gMy4xMyBhbmQgMy4xNCB3aGVuCiAg
YGBFeHRlbnNpb24ucHlfbGltaXRlZF9hcGlgYCBpcyBlbmFibGVkLiBUaGVzZSBidWlsZHMgbm93
IHVzZSB0aGVpcgogIHZlcnNpb24tc3BlY2lmaWMgZXh0ZW5zaW9uIHN1ZmZpeCBpbnN0ZWFkIG9m
IHVzaW5nIHRoZSB1bnN1cHBvcnRlZCBgYC5hYmkzdGBgCiAgc3VmZml4LgoKSW1wcm92ZWQgRG9j
dW1lbnRhdGlvbgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgotIFJlcGxhY2VkIGJyb2tlbiBsaW5r
IHRvIFB5dGhvbiBFZ2dzIGRvY3VtZW50YXRpb24gd2l0aCBhbiBhcmNoaXZlZCB2ZXJzaW9uCiAg
ZnJvbSB0aGUgV2F5YmFjayBNYWNoaW5lLgoKdjg0LjIuMAo9PT09PT09CgpGZWF0dXJlcwotLS0t
LS0tLQoKLSBBZGRlZCBzdXBwb3J0IGZvciBidWlsZGluZyBhYmkzdCBleHRlbnNpb25zIGFuZCBh
YmkzLmFiaTN0IHdoZWVscyBvbiBQeXRob24KICAzLjE1IGFuZCBuZXdlci4gU2VlIDpwZXA6YDgw
M2AgYW5kIHRoZSBgUHl0aG9uIDMuMTUgIldoYXQncyBOZXciIGVudHJ5CiAgPGh0dHBzOi8vZG9j
cy5weXRob24ub3JnLzMuMTUvd2hhdHNuZXcvMy4xNS5odG1sI3BlcC04MDMtYWJpM3Qtc3RhYmxl
LWFiaS1mb3ItCiAgZnJlZS10aHJlYWRlZC1idWlsZHM+YF8KICBmb3IgbW9yZSBkZXRhaWxzLgot
IFVwZGF0ZWQgdmVuZG9yZWQgcGFja2FnaW5nIHZlcnNpb24gdG8gMjYuMywgd2hpY2ggYWRkcyBz
dXBwb3J0IGZvciB0aGUKICBgYGFiaTN0YGAgdGFnIGZyb20gOnBlcDpgODAzYC4KCkJ1Z2ZpeGVz
Ci0tLS0tLS0tCgotIFVzZSB0YXJnZXQgc3lzY29uZmlnIGRhdGEgZm9yIHN0YWJsZS1BQkkgZXh0
ZW5zaW9uIGZpbGVuYW1lcy4KCnY4NC4xLjAKPT09PT09PQoKRmVhdHVyZXMKLS0tLS0tLS0KCi0g
YGBzZXR1cHRvb2xzLmFyY2hpdmVfdXRpbGBgIG5vdyByYWlzZXMgdGhlIG5ldyBgYFVuc2FmZU1l
bWJlcmBgIGV4Y2VwdGlvbiB3aGVuCiAgYW4gYXJjaGl2ZSBtZW1iZXIgd291bGQgYmUgZXh0cmFj
dGVkIG91dHNpZGUgb2YgdGhlIGV4dHJhY3Rpb24gZGlyZWN0b3J5LAogIHdoZXJlIHByZXZpb3Vz
bHkgc3VjaCBhIG1lbWJlciB3YXMgc2lsZW50bHkgc2tpcHBlZC4gQWJvcnRpbmcgbWFrZXMgYQog
IG1hbGljaW91cyBvciBtYWxmb3JtZWQgYXJjaGl2ZSB2aXNpYmxlIHRvIHRoZSBjYWxsZXIgaW5z
dGVhZCBvZiB5aWVsZGluZyBhCiAgcXVpZXRseSBpbmNvbXBsZXRlIGV4dHJhY3Rpb24sIGFuZCBt
YXRjaGVzIHRoZSBiZWhhdmlvciBvZiB0aGUgc3RhbmRhcmQKICBsaWJyYXJ5J3MgYGB0YXJmaWxl
YGAgZXh0cmFjdGlvbiBmaWx0ZXJzLgoKQnVnZml4ZXMKLS0tLS0tLS0KCi0gYGBXaGVlbC5pbnN0
YWxsX2FzX2VnZ2BgIG5vIGxvbmdlciBjcmVhdGVzIG5hbWVzcGFjZSBwYWNrYWdlIGRpcmVjdG9y
aWVzCiAgb3V0c2lkZSBvZiB0aGUgZGVzdGluYXRpb24gZWdnIGRpcmVjdG9yeS4gRW50cmllcyBp
biBhIHdoZWVsJ3MKICBgYG5hbWVzcGFjZV9wYWNrYWdlcy50eHRgYCB3ZXJlIHNwbGl0IG9uIGBg
LmBgIGFuZCBwYXNzZWQgc3RyYWlnaHQgdG8KICBgYG9zLnBhdGguam9pbmBgLCBzbyBhbiBlbnRy
eSB0aGF0IHdhcyBhYnNvbHV0ZSwgZHJpdmUtcXVhbGlmaWVkLCBvciBVTkMKICBkaXNjYXJkZWQg
dGhlIGRlc3RpbmF0aW9uIGFuZCBwbGFjZWQgYW4gYGBfX2luaXRfXy5weWBgIGF0IGEgcGF0aCBj
aG9zZW4gYnkKICB0aGUgd2hlZWwuIE5hbWVzcGFjZSBlbnRyaWVzIGFyZSBub3cgdmFsaWRhdGVk
IGFzIGRvdHRlZCBtb2R1bGUgbmFtZXMgb24KICBldmVyeSBwbGF0Zm9ybSAtLSBzZWUgR0hTQS14
bWozLTlnZjctaDUydy4KCiAgVGhpcyBjb2RlIHBhdGggaXMgcmVhY2hlZCBvbmx5IGJ5IHRoZSBk
ZXByZWNhdGVkIGBgc2V0dXBfcmVxdWlyZXNgYAogIG1lY2hhbmlzbSB3aGVuIGBgc2V0dXAoKWBg
IGlzIGludm9rZWQgb3V0c2lkZSBhIFBFUCA1MTcgZnJvbnRlbmQ7IHRoZQogIHNldHVwdG9vbHMg
YnVpbGQgYmFja2VuZCBuZXZlciByZWFjaGVzIGl0LgotIGBgc2V0dXB0b29scy5hcmNoaXZlX3V0
aWxgYCBubyBsb25nZXIgZXh0cmFjdHMgYXJjaGl2ZSBtZW1iZXJzIG91dHNpZGUgb2YgdGhlCiAg
cmVxdWVzdGVkIGV4dHJhY3Rpb24gZGlyZWN0b3J5LiBCb3RoIHRoZSB0YXIgYW5kIHppcCBmb3Jt
YXRzIHNwZWNpZnkgYGAvYGAgYXMKICB0aGUgb25seSBwYXRoIHNlcGFyYXRvciwgYnV0IHRoZSBn
dWFyZCBhZ2FpbnN0IGBgLi5gYCBjb21wb25lbnRzIHNwbGl0IG1lbWJlcgogIG5hbWVzIG9uIGBg
L2BgIGFsb25lLCBzbyBhIG5hbWUgc3VjaCBhcyBgYC4uXGVzY2FwZWQudHh0YGAgd2FzIHRyZWF0
ZWQgYXMgYQogIHNpbmdsZSBjb21wb25lbnQgYW5kIHRoZW4gcmVzb2x2ZWQgYXMgYSB0cmF2ZXJz
YWwgYnkgdGhlIGZpbGVzeXN0ZW0gb24KICBXaW5kb3dzLiBNZW1iZXIgbmFtZXMgY29udGFpbmlu
ZyBhIGJhY2tzbGFzaCwgYSBkcml2ZSBsZXR0ZXIsIG9yIGEgVU5DIHByZWZpeAogIGFyZSBub3cg
cmVqZWN0ZWQgb24gZXZlcnkgcGxhdGZvcm0sIGFzIGFyZSBtZW1iZXJzIHdob3NlIHJlc29sdmVk
IGRlc3RpbmF0aW9uCiAgZmFsbHMgb3V0c2lkZSB0aGUgZXh0cmFjdGlvbiBkaXJlY3RvcnkgLS0g
c2VlIEdIU0EtZ3JnaC1ocjg3LTNqcHcuCgogIGZvciBkZXByZWNhdGVkIGBgcHl0aG9uX2ltcGxl
bWVudGF0aW9uYGAgbWFya2VyLgotLS0KIC4uLmlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3Nz
aWJsZS10by1zdWJzdGl0ZS5wYXRjaCB8IDEwICsrKysrLS0tLS0KIC4uLnR1cHRvb2xzXzg0LjAu
MC5iYiA9PiBweXRob24zLXNldHVwdG9vbHNfODQuMi4xLmJifSB8ICAyICstCiAyIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNldHVwdG9vbHNfODQuMC4wLmJiID0+IHB5dGhv
bjMtc2V0dXB0b29sc184NC4yLjEuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2Nv
bmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2Nv
bmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBhdGNoCmluZGV4IGY2MzEzZmIx
YTkuLmJlM2ZmNDYxNjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1w
b3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2Ut
aXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZlNjUx
NTIxYjlkOTcwYTg0NDMyYjM3ZDI3MzE5MzJhNDg2MmRlYjIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDQyYTBiNTY1MzMzMjg0MTA1ZWE0Y2JjYzI1MzkwMjk1NjRlMDk1ZTMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJv
bml4LmRlPgogRGF0ZTogV2VkLCAxMSBNYXkgMjAyMiAyMTo0MToxNCArMDIwMAogU3ViamVjdDog
W1BBVENIXSBfZGlzdHV0aWxzL3N5c2NvbmZpZy5weTogbWFrZSBpdCBwb3NzaWJsZSB0byBzdWJz
dGl0ZSB0aGUKQEAgLTIwLDEwICsyMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc2V0dXB0b29scy9fZGlzdHV0aWxz
L3N5c2NvbmZpZy5weSBiL3NldHVwdG9vbHMvX2Rpc3R1dGlscy9zeXNjb25maWcucHkKLWluZGV4
IDdkZGM4NjkuLjAxYTA2YWYgMTAwNjQ0CitpbmRleCA0NzkyYjU4Li5jZjFmYmM1IDEwMDY0NAog
LS0tIGEvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weQogKysrIGIvc2V0dXB0b29s
cy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weQotQEAgLTEzNCw2ICsxMzQsOCBAQCBkZWYgZ2V0X3B5
dGhvbl9pbmMocGxhdF9zcGVjaWZpYzogYm9vbCA9IEZhbHNlLCBwcmVmaXg6IHN0ciB8IE5vbmUg
PSBOb25lKSAtPiBzdAorQEAgLTEzMyw2ICsxMzMsOCBAQCBkZWYgZ2V0X3B5dGhvbl9pbmMocGxh
dF9zcGVjaWZpYzogYm9vbCA9IEZhbHNlLCBwcmVmaXg6IHN0ciB8IE5vbmUgPSBOb25lKSAtPiBz
dAogICAgICBzeXMuYmFzZV9leGVjX3ByZWZpeCAtLSBpLmUuLCBpZ25vcmUgJ3BsYXRfc3BlY2lm
aWMnLgogICAgICAiIiIKICAgICAgZGVmYXVsdF9wcmVmaXggPSBCQVNFX0VYRUNfUFJFRklYIGlm
IHBsYXRfc3BlY2lmaWMgZWxzZSBCQVNFX1BSRUZJWApAQCAtMzIsNyArMzIsNyBAQCBpbmRleCA3
ZGRjODY5Li4wMWEwNmFmIDEwMDY0NAogICAgICByZXNvbHZlZF9wcmVmaXggPSBwcmVmaXggaWYg
cHJlZml4IGlzIG5vdCBOb25lIGVsc2UgZGVmYXVsdF9wcmVmaXgKICAgICAgIyBNaW5HVyBpbWl0
YXRlcyBwb3NpeCBsaWtlIGxheW91dCwgYnV0IG9zLm5hbWUgIT0gcG9zaXgKICAgICAgb3NfbmFt
ZSA9ICJwb3NpeCIgaWYgaXNfbWluZ3coKSBlbHNlIG9zLm5hbWUKLUBAIC0yNDYsNyArMjQ4LDEz
IEBAIGRlZiBnZXRfcHl0aG9uX2xpYigKK0BAIC0yNDUsNyArMjQ3LDEzIEBAIGRlZiBnZXRfcHl0
aG9uX2xpYigKICAKICAgICAgZWFybHlfcHJlZml4ID0gcHJlZml4CiAgCkBAIC00Nyw3ICs0Nyw3
IEBAIGluZGV4IDdkZGM4NjkuLjAxYTA2YWYgMTAwNjQ0CiAgICAgICAgICBpZiBzdGFuZGFyZF9s
aWI6CiAgICAgICAgICAgICAgcHJlZml4ID0gcGxhdF9zcGVjaWZpYyBhbmQgQkFTRV9FWEVDX1BS
RUZJWCBvciBCQVNFX1BSRUZJWAogICAgICAgICAgZWxzZToKLUBAIC0yNjEsNyArMjY5LDcgQEAg
ZGVmIGdldF9weXRob25fbGliKAorQEAgLTI2MCw3ICsyNjgsNyBAQCBkZWYgZ2V0X3B5dGhvbl9s
aWIoCiAgICAgICAgICAgICAgIyBQdXJlIFB5dGhvbgogICAgICAgICAgICAgIGxpYmRpciA9ICJs
aWIiCiAgICAgICAgICBpbXBsZW1lbnRhdGlvbiA9ICdweXB5JyBpZiBJU19QWVBZIGVsc2UgJ3B5
dGhvbicKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
ZXR1cHRvb2xzXzg0LjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zZXR1cHRvb2xzXzg0LjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc184NC4wLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xz
Xzg0LjIuMS5iYgppbmRleCA2NDhiMDg0YTI3Li5mMmRkNDgxODM1IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc184NC4wLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfODQuMi4x
LmJiCkBAIC0xMSw3ICsxMSw3IEBAIENWRV9QUk9EVUNUID0gInB5dGhvbjMtc2V0dXB0b29scyBw
eXRob246c2V0dXB0b29scyIKIFNSQ19VUkkgKz0gIiBcCiAgICAgICAgICAgICBmaWxlOi8vMDAw
MS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBh
dGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjQ2OTVjMjEyNTdmMGQ5YjUzN2VjMjY5MmM5
NDFkMDJlZTE0M2I3Y2MxMjc2OTQxMzQ5YTU0NjU3M2IyZWY3MyIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIzZmY4YjNiNTQ5MmEwYWE2Njk2MGY0NDE5MzY1YTg2Yjg0ZTAxMzA3MGQ0MzEzZTRkNGE2
ODk0ZjVkNjRkNmJjIgogCiBkb19pbnN0YWxsOmFwcGVuZCgpIHsKIAkjIHNldHVwdG9vbHMgc2hp
cHMgV2luZG93cyBsYXVuY2hlciBleGVjdXRhYmxlcyAoY2xpKi5leGUsIGd1aSouZXhlKS4KLS0g
CjIuNDcuMQoK

--===============2392940406823713098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-84.2.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools-84.2.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info/licenses, added "/usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/errors.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/_ranges.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/depend
 ency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/direct_url.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/ranges.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-84.2.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/errors.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/ranges.py was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-84.2.1.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/ranges.py was added

--===============2392940406823713098==--
