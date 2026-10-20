Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1946.1792480406111515043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LfpvhCAa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DScWGTCf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a15828664d-5c0a9e66-57de-4a96-966d-0e8164510216-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A1Or6K88UPspMC7CnAVfyJtmcHiCJwZXfcr/BuK0Gt0=;
	b=LfpvhCAaTEV+LTS/6eqRRvhpow/Qyez6ywWaLFSmIz866fJwowQTSc1X55D/tPcM
	+WZRTkKYM0P4ANSN1c/y5gum0JelyIgNtju78ocfTQlRZikwSeck8uOm1TDfOovq8hH
	ZLJLDy/90T20zdHR97C6XyEQ9n/lcrU1LF+8LOpk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A1Or6K88UPspMC7CnAVfyJtmcHiCJwZXfcr/BuK0Gt0=;
	b=DScWGTCfk8OsAXcLYAhACAS1bj+e1sH3A97AQoHny6o48h/0cVUfLsJYUOnUS/Xi
	DERddFsolgekAUHYcwiFAbcOodXcT9GsYD+E2tGLVf/ss/R1hkFiY4vZAMC2cte2pKM
	uHNiDxJrpik1jYrhBmcKzWyzm5+v+ll5X76OcagA=
Content-Type: multipart/mixed; boundary="===============4601759952556048921=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 84.2.0 SUCCEEDED
Message-ID: <010101a15828664d-5c0a9e66-57de-4a96-966d-0e8164510216-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248232

--===============4601759952556048921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *84.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-84.0.0-84.2.0.patch
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
From 536d8728d1a0b2a14b919825264cf424e0c75818 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 06:44:44 +0000
Subject: [PATCH] python3-setuptools: upgrade 84.0.0 -> 84.2.0

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
 ...tuptools_84.0.0.bb => python3-setuptools_84.2.0.bb} |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_84.0.0.bb => python3-setuptools_84.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index f6313fb1a9..9971363689 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From fe651521b9d970a84432b37d2731932a4862deb2 Mon Sep 17 00:00:00 2001
+From 7406890471590644b9b3d76e9d255ae14b00be12 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_84.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_84.2.0.bb
index 648b084a27..9cd5739c44 100644
--- a/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_84.2.0.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "f4695c21257f0d9b537ec2692c941d02ee143b7cc1276941349a546573b2ef73"
+SRC_URI[sha256sum] = "6f445ca2ce864605f81e223f262b4c94ffcb9a4a63473bae0ed7be5aab0291da"
 
 do_install:append() {
 	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).
-- 
2.47.1


--===============4601759952556048921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.o /lib/lib*.so /lib/*.la"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/sbin/* /lib/*.so.* /bin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/sbin/* /lib/*.so.* /bin/*", added "/usr/lib/*.so.*"
Changes to packages/x86-64-v3-poky-linux/elfutils (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.197.so to libasm-0.196.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.197.so to libdebuginfod-0.196.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.197.so to libdebuginfod-0.196.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.197.so to libdw-0.196.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.197.so to libelf-0.196.so
  /usr/lib/libasm-0.197.so moved to /usr/lib/libasm-0.196.so
  /usr/lib/libdebuginfod-0.197.so moved to /usr/lib/libdebuginfod-0.196.so
  /usr/lib/libdw-0.197.so moved to /usr/lib/libdw-0.196.so
  /usr/lib/libelf-0.197.so moved to /usr/lib/libelf-0.196.so
packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 11473261 to 11273829 (-2%)
packages/x86-64-v3-poky-linux/python3-setuptools: PV changed from "84.0.0" to "84.2.0"
packages/x86-64-v3-poky-linux/python3-setuptools: PKGV changed from 84.0.0 [default] to 84.2.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-84.0.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-84.2.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "84.0.0" to "84.2.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 84.0.0 [default] to 84.2.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "84.0.0" to "84.2.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 84.0.0 [default] to 84.2.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "84.0.0" to "84.2.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 84.0.0 [default] to 84.2.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "84.0.0" to "84.2.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 84.0.0 [default] to 84.2.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "84.0.0" to "84.2.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 84.0.0 [default] to 84.2.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "84.0.0" to "84.2.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 84.0.0 [default] to 84.2.0 [default]
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 5612978 to 6090948 (+9%)
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PV changed from "84.0.0" to "84.2.0"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-84.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools-84.2.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info/licenses, added "/usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/errors.py /usr/lib/python3.14/site-packages/setuptools/_
 vendor/packaging/_ranges.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/ranges.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/direct_url.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/ranges.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 84.0.0 [default] to 84.2.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-84.2.0.dist-info
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
  /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-84.2.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/ranges.py was added

--===============4601759952556048921==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-84.0.0-84.2.0.patch"

RnJvbSA1MzZkODcyOGQxYTBiMmExNGI5MTk4MjUyNjRjZjQyNGUwYzc1ODE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDY6NDQ6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgODQuMC4wIC0+IDg0LjIuMAoKdjg0LjIuMAo9PT09
PT09CgpGZWF0dXJlcwotLS0tLS0tLQoKLSBBZGRlZCBzdXBwb3J0IGZvciBidWlsZGluZyBhYmkz
dCBleHRlbnNpb25zIGFuZCBhYmkzLmFiaTN0IHdoZWVscyBvbiBQeXRob24KICAzLjE1IGFuZCBu
ZXdlci4gU2VlIDpwZXA6YDgwM2AgYW5kIHRoZSBgUHl0aG9uIDMuMTUgIldoYXQncyBOZXciIGVu
dHJ5CiAgPGh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMuMTUvd2hhdHNuZXcvMy4xNS5odG1sI3Bl
cC04MDMtYWJpM3Qtc3RhYmxlLWFiaS1mb3ItCiAgZnJlZS10aHJlYWRlZC1idWlsZHM+YF8KICBm
b3IgbW9yZSBkZXRhaWxzLgotIFVwZGF0ZWQgdmVuZG9yZWQgcGFja2FnaW5nIHZlcnNpb24gdG8g
MjYuMywgd2hpY2ggYWRkcyBzdXBwb3J0IGZvciB0aGUKICBgYGFiaTN0YGAgdGFnIGZyb20gOnBl
cDpgODAzYC4KCkJ1Z2ZpeGVzCi0tLS0tLS0tCgotIFVzZSB0YXJnZXQgc3lzY29uZmlnIGRhdGEg
Zm9yIHN0YWJsZS1BQkkgZXh0ZW5zaW9uIGZpbGVuYW1lcy4KCnY4NC4xLjAKPT09PT09PQoKRmVh
dHVyZXMKLS0tLS0tLS0KCi0gYGBzZXR1cHRvb2xzLmFyY2hpdmVfdXRpbGBgIG5vdyByYWlzZXMg
dGhlIG5ldyBgYFVuc2FmZU1lbWJlcmBgIGV4Y2VwdGlvbiB3aGVuCiAgYW4gYXJjaGl2ZSBtZW1i
ZXIgd291bGQgYmUgZXh0cmFjdGVkIG91dHNpZGUgb2YgdGhlIGV4dHJhY3Rpb24gZGlyZWN0b3J5
LAogIHdoZXJlIHByZXZpb3VzbHkgc3VjaCBhIG1lbWJlciB3YXMgc2lsZW50bHkgc2tpcHBlZC4g
QWJvcnRpbmcgbWFrZXMgYQogIG1hbGljaW91cyBvciBtYWxmb3JtZWQgYXJjaGl2ZSB2aXNpYmxl
IHRvIHRoZSBjYWxsZXIgaW5zdGVhZCBvZiB5aWVsZGluZyBhCiAgcXVpZXRseSBpbmNvbXBsZXRl
IGV4dHJhY3Rpb24sIGFuZCBtYXRjaGVzIHRoZSBiZWhhdmlvciBvZiB0aGUgc3RhbmRhcmQKICBs
aWJyYXJ5J3MgYGB0YXJmaWxlYGAgZXh0cmFjdGlvbiBmaWx0ZXJzLgoKQnVnZml4ZXMKLS0tLS0t
LS0KCi0gYGBXaGVlbC5pbnN0YWxsX2FzX2VnZ2BgIG5vIGxvbmdlciBjcmVhdGVzIG5hbWVzcGFj
ZSBwYWNrYWdlIGRpcmVjdG9yaWVzCiAgb3V0c2lkZSBvZiB0aGUgZGVzdGluYXRpb24gZWdnIGRp
cmVjdG9yeS4gRW50cmllcyBpbiBhIHdoZWVsJ3MKICBgYG5hbWVzcGFjZV9wYWNrYWdlcy50eHRg
YCB3ZXJlIHNwbGl0IG9uIGBgLmBgIGFuZCBwYXNzZWQgc3RyYWlnaHQgdG8KICBgYG9zLnBhdGgu
am9pbmBgLCBzbyBhbiBlbnRyeSB0aGF0IHdhcyBhYnNvbHV0ZSwgZHJpdmUtcXVhbGlmaWVkLCBv
ciBVTkMKICBkaXNjYXJkZWQgdGhlIGRlc3RpbmF0aW9uIGFuZCBwbGFjZWQgYW4gYGBfX2luaXRf
Xy5weWBgIGF0IGEgcGF0aCBjaG9zZW4gYnkKICB0aGUgd2hlZWwuIE5hbWVzcGFjZSBlbnRyaWVz
IGFyZSBub3cgdmFsaWRhdGVkIGFzIGRvdHRlZCBtb2R1bGUgbmFtZXMgb24KICBldmVyeSBwbGF0
Zm9ybSAtLSBzZWUgR0hTQS14bWozLTlnZjctaDUydy4KCiAgVGhpcyBjb2RlIHBhdGggaXMgcmVh
Y2hlZCBvbmx5IGJ5IHRoZSBkZXByZWNhdGVkIGBgc2V0dXBfcmVxdWlyZXNgYAogIG1lY2hhbmlz
bSB3aGVuIGBgc2V0dXAoKWBgIGlzIGludm9rZWQgb3V0c2lkZSBhIFBFUCA1MTcgZnJvbnRlbmQ7
IHRoZQogIHNldHVwdG9vbHMgYnVpbGQgYmFja2VuZCBuZXZlciByZWFjaGVzIGl0LgotIGBgc2V0
dXB0b29scy5hcmNoaXZlX3V0aWxgYCBubyBsb25nZXIgZXh0cmFjdHMgYXJjaGl2ZSBtZW1iZXJz
IG91dHNpZGUgb2YgdGhlCiAgcmVxdWVzdGVkIGV4dHJhY3Rpb24gZGlyZWN0b3J5LiBCb3RoIHRo
ZSB0YXIgYW5kIHppcCBmb3JtYXRzIHNwZWNpZnkgYGAvYGAgYXMKICB0aGUgb25seSBwYXRoIHNl
cGFyYXRvciwgYnV0IHRoZSBndWFyZCBhZ2FpbnN0IGBgLi5gYCBjb21wb25lbnRzIHNwbGl0IG1l
bWJlcgogIG5hbWVzIG9uIGBgL2BgIGFsb25lLCBzbyBhIG5hbWUgc3VjaCBhcyBgYC4uXGVzY2Fw
ZWQudHh0YGAgd2FzIHRyZWF0ZWQgYXMgYQogIHNpbmdsZSBjb21wb25lbnQgYW5kIHRoZW4gcmVz
b2x2ZWQgYXMgYSB0cmF2ZXJzYWwgYnkgdGhlIGZpbGVzeXN0ZW0gb24KICBXaW5kb3dzLiBNZW1i
ZXIgbmFtZXMgY29udGFpbmluZyBhIGJhY2tzbGFzaCwgYSBkcml2ZSBsZXR0ZXIsIG9yIGEgVU5D
IHByZWZpeAogIGFyZSBub3cgcmVqZWN0ZWQgb24gZXZlcnkgcGxhdGZvcm0sIGFzIGFyZSBtZW1i
ZXJzIHdob3NlIHJlc29sdmVkIGRlc3RpbmF0aW9uCiAgZmFsbHMgb3V0c2lkZSB0aGUgZXh0cmFj
dGlvbiBkaXJlY3RvcnkgLS0gc2VlIEdIU0EtZ3JnaC1ocjg3LTNqcHcuCgogIGZvciBkZXByZWNh
dGVkIGBgcHl0aG9uX2ltcGxlbWVudGF0aW9uYGAgbWFya2VyLgotLS0KIC4uLmlscy1zeXNjb25m
aWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaCB8IDEwICsrKysrLS0tLS0K
IC4uLnR1cHRvb2xzXzg0LjAuMC5iYiA9PiBweXRob24zLXNldHVwdG9vbHNfODQuMi4wLmJifSB8
ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNldHVwdG9vbHNf
ODQuMC4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc184NC4yLjAuYmJ9ICg5NCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAw
MS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMvMDAw
MS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3NpYmxlLXRvLXN1YnN0aXRlLnBh
dGNoCmluZGV4IGY2MzEzZmIxYTkuLjk5NzEzNjM2ODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtX2Rpc3R1dGlscy1zeXNj
b25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLV9kaXN0dXRpbHMt
c3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGZlNjUxNTIxYjlkOTcwYTg0NDMyYjM3ZDI3MzE5MzJhNDg2MmRlYjIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc0MDY4OTA0NzE1OTA2NDRiOWIzZDc2ZTlkMjU1
YWUxNGIwMGJlMTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogV2VkLCAxMSBNYXkgMjAyMiAyMTo0MTox
NCArMDIwMAogU3ViamVjdDogW1BBVENIXSBfZGlzdHV0aWxzL3N5c2NvbmZpZy5weTogbWFrZSBp
dCBwb3NzaWJsZSB0byBzdWJzdGl0ZSB0aGUKQEAgLTIwLDEwICsyMCwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc2V0
dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weSBiL3NldHVwdG9vbHMvX2Rpc3R1dGlscy9z
eXNjb25maWcucHkKLWluZGV4IDdkZGM4NjkuLjAxYTA2YWYgMTAwNjQ0CitpbmRleCA0NzkyYjU4
Li5jZjFmYmM1IDEwMDY0NAogLS0tIGEvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5w
eQogKysrIGIvc2V0dXB0b29scy9fZGlzdHV0aWxzL3N5c2NvbmZpZy5weQotQEAgLTEzNCw2ICsx
MzQsOCBAQCBkZWYgZ2V0X3B5dGhvbl9pbmMocGxhdF9zcGVjaWZpYzogYm9vbCA9IEZhbHNlLCBw
cmVmaXg6IHN0ciB8IE5vbmUgPSBOb25lKSAtPiBzdAorQEAgLTEzMyw2ICsxMzMsOCBAQCBkZWYg
Z2V0X3B5dGhvbl9pbmMocGxhdF9zcGVjaWZpYzogYm9vbCA9IEZhbHNlLCBwcmVmaXg6IHN0ciB8
IE5vbmUgPSBOb25lKSAtPiBzdAogICAgICBzeXMuYmFzZV9leGVjX3ByZWZpeCAtLSBpLmUuLCBp
Z25vcmUgJ3BsYXRfc3BlY2lmaWMnLgogICAgICAiIiIKICAgICAgZGVmYXVsdF9wcmVmaXggPSBC
QVNFX0VYRUNfUFJFRklYIGlmIHBsYXRfc3BlY2lmaWMgZWxzZSBCQVNFX1BSRUZJWApAQCAtMzIs
NyArMzIsNyBAQCBpbmRleCA3ZGRjODY5Li4wMWEwNmFmIDEwMDY0NAogICAgICByZXNvbHZlZF9w
cmVmaXggPSBwcmVmaXggaWYgcHJlZml4IGlzIG5vdCBOb25lIGVsc2UgZGVmYXVsdF9wcmVmaXgK
ICAgICAgIyBNaW5HVyBpbWl0YXRlcyBwb3NpeCBsaWtlIGxheW91dCwgYnV0IG9zLm5hbWUgIT0g
cG9zaXgKICAgICAgb3NfbmFtZSA9ICJwb3NpeCIgaWYgaXNfbWluZ3coKSBlbHNlIG9zLm5hbWUK
LUBAIC0yNDYsNyArMjQ4LDEzIEBAIGRlZiBnZXRfcHl0aG9uX2xpYigKK0BAIC0yNDUsNyArMjQ3
LDEzIEBAIGRlZiBnZXRfcHl0aG9uX2xpYigKICAKICAgICAgZWFybHlfcHJlZml4ID0gcHJlZml4
CiAgCkBAIC00Nyw3ICs0Nyw3IEBAIGluZGV4IDdkZGM4NjkuLjAxYTA2YWYgMTAwNjQ0CiAgICAg
ICAgICBpZiBzdGFuZGFyZF9saWI6CiAgICAgICAgICAgICAgcHJlZml4ID0gcGxhdF9zcGVjaWZp
YyBhbmQgQkFTRV9FWEVDX1BSRUZJWCBvciBCQVNFX1BSRUZJWAogICAgICAgICAgZWxzZToKLUBA
IC0yNjEsNyArMjY5LDcgQEAgZGVmIGdldF9weXRob25fbGliKAorQEAgLTI2MCw3ICsyNjgsNyBA
QCBkZWYgZ2V0X3B5dGhvbl9saWIoCiAgICAgICAgICAgICAgIyBQdXJlIFB5dGhvbgogICAgICAg
ICAgICAgIGxpYmRpciA9ICJsaWIiCiAgICAgICAgICBpbXBsZW1lbnRhdGlvbiA9ICdweXB5JyBp
ZiBJU19QWVBZIGVsc2UgJ3B5dGhvbicKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzg0LjAuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzg0LjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29sc184NC4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zZXR1cHRvb2xzXzg0LjIuMC5iYgppbmRleCA2NDhiMDg0YTI3Li45Y2Q1NzM5YzQ0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc184NC4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHNfODQuMi4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIENWRV9QUk9EVUNUID0gInB5
dGhvbjMtc2V0dXB0b29scyBweXRob246c2V0dXB0b29scyIKIFNSQ19VUkkgKz0gIiBcCiAgICAg
ICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3Np
YmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjQ2OTVjMjEy
NTdmMGQ5YjUzN2VjMjY5MmM5NDFkMDJlZTE0M2I3Y2MxMjc2OTQxMzQ5YTU0NjU3M2IyZWY3MyIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZjQ0NWNhMmNlODY0NjA1ZjgxZTIyM2YyNjJiNGM5NGZm
Y2I5YTRhNjM0NzNiYWUwZWQ3YmU1YWFiMDI5MWRhIgogCiBkb19pbnN0YWxsOmFwcGVuZCgpIHsK
IAkjIHNldHVwdG9vbHMgc2hpcHMgV2luZG93cyBsYXVuY2hlciBleGVjdXRhYmxlcyAoY2xpKi5l
eGUsIGd1aSouZXhlKS4KLS0gCjIuNDcuMQoK

--===============4601759952556048921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/elfutils (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.197.so to libasm-0.196.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.197.so to libdebuginfod-0.196.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.197.so to libdebuginfod-0.196.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.197.so to libdw-0.196.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.197.so to libelf-0.196.so
  /usr/lib/libasm-0.197.so moved to /usr/lib/libasm-0.196.so
  /usr/lib/libdebuginfod-0.197.so moved to /usr/lib/libdebuginfod-0.196.so
  /usr/lib/libdw-0.197.so moved to /usr/lib/libdw-0.196.so
  /usr/lib/libelf-0.197.so moved to /usr/lib/libelf-0.196.so
packages/x86-64-v3-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info -> /usr/lib/python3.14/site-packages/setuptools-84.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/setuptools-84.2.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/s
 ite-packages/setuptools/_vendor/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/_ranges.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/errors.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/ranges.py /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/direct_url.py"
Changes to packages/x86-64-v3-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-84.2.0.dist-info
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
  /usr/lib/python3.14/site-packages/setuptools-84.0.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools-84.2.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging-26.3.dist-info
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/setuptools/_vendor/packaging/ranges.py was added

--===============4601759952556048921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-setuptools-changelog.txt"

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

--===============4601759952556048921==--
