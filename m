Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5402.1793687202710816515
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oyUXzEzr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QFngmFwD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1a016a818-76921a76-ae43-48ee-90b7-05de64a0d53b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687202;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lomml4YfDWeCia7/9bulDyG9UFWL3KZ0knmE1Syykys=;
	b=oyUXzEzrc2n1SJBh/clh0901gtFjy/Z+G+HPEFhQ5PElhCVEb2HtkGe21Ylkia7v
	MryQ/G8WVr0mrXA5UyCD0Rk8kDtjzVAUqda2iJKy919EHbC4zqtU2SCjC0RtfR3yCW/
	KsXHCK3ir4i1+ix3m+OlXKMccLRsLARpX8D72DgA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687202;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lomml4YfDWeCia7/9bulDyG9UFWL3KZ0knmE1Syykys=;
	b=QFngmFwDTwNqfm47l0BMuUPknwSQXGjIj4LxLiDEhIBXozUVWTYtsRhNWBFN+W2I
	diqz31mqUln9vFOHUr5Utrr6GP22gbRe/giXczMpGnMvaMzkthQi/XQ8RsZczKp60XB
	MtW/zU2jjTBNTHOMpxQej3eDQZ3uOxAjeN0oAgaE=
Content-Type: multipart/mixed; boundary="===============1612671253463130613=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 26.3 SUCCEEDED
Message-ID: <010101a1a016a818-76921a76-ae43-48ee-90b7-05de64a0d53b-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249236

--===============1612671253463130613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *26.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-26.2.2-26.3.patch
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
From f26f61fcb4346bdc4ab9ac369d298ad745812e71 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 3 Nov 2026 05:46:57 +0000
Subject: [PATCH] python3-pip: upgrade 26.2.2 -> 26.3

26.3 (2026-11-02)
=================

Improved Documentation
----------------------

- Clarify in the security policy that pip has never considered installing
  untrusted wheels safe. This is because Python's import system is dynamic, so
  pip cannot guarantee that installing a wheel will not execute third-party
  code. (`#14412 < >`_)

Deprecations and Removals
-------------------------

- Block unexpected imports during installation, warn about unsafe imports
  afterward, and improve recovery from interrupted installations. (`#13842 <
  >`_)

Features
--------

- Show build backend warnings for local source directories and log them at debug
  level for other sources. (`#14372 < >`_)
- Add support for selecting extras in pylock.toml files with ``-r
  pylock.toml[extra1,extra2]``. (`#14205 < >`_)
- Allow ``--group`` to select non-default groups from local pylock files,
  e.g. ``--group pylock.toml:docs``. (`#14390 < >`_)
- Support ``--no-binary`` with ``-r pylock.toml``. Before, pip would get the
  sdist from the index instead of the locked URL, or fail if no wheel were
  available in the lock file. (`#14187 < >`_)
- Speed up installing a wheel with console scripts by not resolving every
  ``PATH`` entry. (`#14235 < >`_)
- Clarify the warning for ``~``-prefixed leftover distribution directories.
  (`#11849 < >`_)

Bug Fixes
---------

- Report build-backend import failures as pip errors instead of displaying an
  uncaught traceback. (`#12248 < >`_)
- No longer log the "pip is looking at multiple versions of a package" message
  until pip has looked at at least two versions of that package. (`#12928 < >`_)
- Fix ``pip``'s self version check reporting an outdated version from the
  environment instead of the running pip when run as a zipapp. (`#13084 < >`_)
- Fix a fatal error when using the ``PIP_CONFIG_FILE`` environment variable with
  ``pip config set``. (`#13279 < >`_)
- Avoid misleading error messages that include extra markers such as
  ``; extra == "..."`` when installing packages. (`#13618 < >`_)
- When installing to a custom ``--prefix``, use the ``posix_prefix`` scheme
  when running from a Debian patched Python distribution to avoid a superfluous
  ``/local/`` subdirectory. (`#13634 < >`_)
- Refuse to follow an HTTP redirect to a ``file:`` URL. (`#14171 < >`_)
- Prevent wheel cache origin mismatch warnings from exposing URL credentials.
  (`#14232 < >`_)
- Report the incomplete-download error on Windows, not a ``PermissionError``.
  (`#14237 < >`_)
- Fix the global configuration location on macOS in virtual environments created
  from Homebrew Python. (`#14303 < >`_)
- Reject extra arguments to ``pip config edit`` instead of silently ignoring
  them. (`#14347 < >`_)
- Honor supplied hashes when using ``--no-require-hashes``. (`#14355 < >`_)
- Fix wheel installation with data files when the installation prefix is a
  filesystem root. (`#14358 < >`_)
- Restore support for UTF-8 configuration files when Python's UTF-8 mode is
  enabled. (`#14367 < >`_)
- Restore vendored Requests' PyOpenSSL fallback on non-Windows systems without
  importing PyOpenSSL on Windows. (`#14402 < >`_)
- Respect configured network settings while checking build constraint files.
  (`#14403 < >`_)
- Apply PyPI's direct URL dependency restriction to extras and cached wheels.
  (`#14341 < >`_)
- Fix a crash when installing or uninstalling a distribution with an invalid
  entry point. (`#8573 < >`_)
- Fail with a clearer error message on invalid configuration values. (`#8671 <
  >`_)
- Keep ``--version`` available only for pip and prevent its use in subcommands.
  (`#9456 < >`_)

Vendored Libraries
------------------

- Upgrade certifi to 2026.10.23
- Upgrade distlib to 0.4.4
- Upgrade idna to 3.20
- Upgrade msgpack to 1.2.4
- Upgrade packaging to 26.3
- Upgrade platformdirs to 4.12.4
- Upgrade pygments to 2.21.0
- Upgrade pyproject-hooks to 1.3.3
- Upgrade rich to 15.0.0
- Downgrade tomli to 2.3.2 to retain TOML 1.0 parsing on Python 3.10.
- Upgrade truststore to 0.10.5
- Upgrade urllib3 to 2.8.0

Process
-------

- Allow pip itself to be built with flit-core 4.
---
 .../python/python3-pip/no_shebang_mangling.patch            | 6 +++---
 .../python/{python3-pip_26.2.2.bb => python3-pip_26.3.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_26.2.2.bb => python3-pip_26.3.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index f388928230..998d8a73cf 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From ea75b7fc017f7a1a3a47e9e2bef21209f0f36a04 Mon Sep 17 00:00:00 2001
+From 717c440db8787fda9fb2abf207fe894e291ce0f0 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
-index ac9e909..1faa5b6 100644
+index 0338012..64b00a2 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
 @@ -157,6 +157,8 @@ class ScriptMaker(object):
@@ -25,7 +25,7 @@ index ac9e909..1faa5b6 100644
          if os.name != 'posix':
              simple_shebang = True
          elif getattr(sys, "cross_compiling", False):
-@@ -367,7 +369,7 @@ class ScriptMaker(object):
+@@ -373,7 +375,7 @@ class ScriptMaker(object):
                  return
  
              match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_26.2.2.bb b/meta/recipes-devtools/python/python3-pip_26.3.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.2.2.bb
rename to meta/recipes-devtools/python/python3-pip_26.3.bb
index c83c9e4468..a6ce6a1fbc 100644
--- a/meta/recipes-devtools/python/python3-pip_26.2.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.3.bb
@@ -26,7 +26,7 @@ inherit pypi python_flit_core
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "3a8e5c800492787f33a4114ef54444546c340df428974ebba17e0fd47e11af2f"
+SRC_URI[sha256sum] = "6c36ae7da8695be67e3cd9f7d87919667ced53f57ce2ede75d89b5912ed2bc4c"
 
 CVE_PRODUCT = "pypa:pip"
 
-- 
2.47.1


--===============1612671253463130613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pip: PV changed from "26.2.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-26.2.2.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-26.3.tar.gz file://no_shebang_mangling.patch"
packages/x86-64-v3-poky-linux/python3-pip: PKGV changed from 26.2.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PV changed from "26.2.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 26.2.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PV changed from "26.2.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 26.2.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PV changed from "26.2.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 26.2.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PV changed from "26.2.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 26.2.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PV changed from "26.2.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-src: PKGV changed from 26.2.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "26.2.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 26.2.2 [default] to 26.3 [default]
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PV changed from "26.2.2" to "26.3"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10660488 to 11803805 (+11%)
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/s
 ite-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pkg_resources, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site
 -packages/pip-26.3.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-
 26.2.2.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/packaging, removed "/usr/lib/python3.14/site-packages/pip/_vendor/rich/_cell_wi
 dths.py /usr/lib/python3.14/site-packages/pip/_internal/__pycache__/exceptions.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/__pycache__/_cell_widths.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/exceptions.py", added "/usr/lib/python3.14/site-packages/pip/_vendor/packaging/_ranges.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/ranges.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-0-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__init__.py /usr/lib/python3.14/site-packages/pip/_internal/metadata/direct_references.py /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/ios.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-2-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode13-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode4-1-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_ve
 ndor/rich/_unicode_data/__pycache__/unicode5-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-1-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-2-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode16-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode17-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/_versions.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode16-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode15-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/platformdi
 rs/__pycache__/ios.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode15-1-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode10-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode9-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode17-0-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/hashes.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode12-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode12-1-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-1-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-2-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-3-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode
 _data/__pycache__/unicode7-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode8-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode9-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/testing.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-3-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/_base.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/build.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/wheel.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/wheel.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/pytest_plugin.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/pytest_plugin.py /usr/lib/python3.14/s
 ite-packages/pip/_internal/exceptions/__pycache__/_base.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode4-1-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/pyproject.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/testing.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-1-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/uninstall.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode11-0-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/network.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/build.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/exceptions/hashes.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/_versions.cpython-314.pyc /usr/
 lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/network.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode14-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-1-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode8-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode11-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-2-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode12-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode12-1-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode13-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode14-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/r
 ich/_unicode_data/__pycache__/unicode15-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/exceptions/uninstall.py /usr/lib/python3.14/site-packages/pip/_internal/metadata/__pycache__/direct_references.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode15-1-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-0-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/pyproject.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode10-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode7-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/ranges.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGV changed from 26.2.2 [default] to 26.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/AUTHORS.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/cachecontrol was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/certifi was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distlib was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distro was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distro/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/idna was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/msgpack was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/packaging was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pkg_resources was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/platformdirs was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pygments was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pyproject_hooks was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/requests was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/requests/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/resolvelib was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/rich was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/rich/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli_w was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/truststore was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/urllib3 was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/_base.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/build.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/hashes.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/network.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/_base.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/build.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/hashes.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/network.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/pyproject.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/uninstall.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/wheel.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/pyproject.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/uninstall.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/wheel.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/metadata/direct_references.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/metadata/__pycache__/direct_references.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/ranges.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/ios.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/ios.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/pytest_plugin.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/testing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/pytest_plugin.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/testing.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode10-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode11-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode12-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode12-1-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode13-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode14-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode15-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode15-1-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode16-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode17-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode4-1-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-1-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-2-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-1-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-2-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-3-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode7-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode8-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode9-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/_versions.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode10-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode11-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode12-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode12-1-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode13-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode14-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode15-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode15-1-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode16-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode17-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode4-1-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-1-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-2-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-1-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-2-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-3-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode7-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode8-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode9-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/_versions.py was added
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/AUTHORS.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/cachecontrol was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/certifi was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distlib was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distro was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distro/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/idna was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/msgpack was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/platformdirs was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pygments was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/requests was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/requests/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/resolvelib was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/rich was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/rich/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli_w was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/truststore was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/urllib3 was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions.py was removed
  /usr/lib/python3.14/site-packages/pip/_internal/__pycache__/exceptions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_cell_widths.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/__pycache__/_cell_widths.cpython-314.pyc was removed

--===============1612671253463130613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pip-changelog.txt"

26.3 (2026-11-02)
=================

Improved Documentation
----------------------

- Clarify in the security policy that pip has never considered installing
  untrusted wheels safe. This is because Python's import system is dynamic, so
  pip cannot guarantee that installing a wheel will not execute third-party
  code. (`#14412 < >`_)

Deprecations and Removals
-------------------------

- Block unexpected imports during installation, warn about unsafe imports
  afterward, and improve recovery from interrupted installations. (`#13842 <
  >`_)

Features
--------

- Show build backend warnings for local source directories and log them at debug
  level for other sources. (`#14372 < >`_)
- Add support for selecting extras in pylock.toml files with ``-r
  pylock.toml[extra1,extra2]``. (`#14205 < >`_)
- Allow ``--group`` to select non-default groups from local pylock files,
  e.g. ``--group pylock.toml:docs``. (`#14390 < >`_)
- Support ``--no-binary`` with ``-r pylock.toml``. Before, pip would get the
  sdist from the index instead of the locked URL, or fail if no wheel were
  available in the lock file. (`#14187 < >`_)
- Speed up installing a wheel with console scripts by not resolving every
  ``PATH`` entry. (`#14235 < >`_)
- Clarify the warning for ``~``-prefixed leftover distribution directories.
  (`#11849 < >`_)

Bug Fixes
---------

- Report build-backend import failures as pip errors instead of displaying an
  uncaught traceback. (`#12248 < >`_)
- No longer log the "pip is looking at multiple versions of a package" message
  until pip has looked at at least two versions of that package. (`#12928 < >`_)
- Fix ``pip``'s self version check reporting an outdated version from the
  environment instead of the running pip when run as a zipapp. (`#13084 < >`_)
- Fix a fatal error when using the ``PIP_CONFIG_FILE`` environment variable with
  ``pip config set``. (`#13279 < >`_)
- Avoid misleading error messages that include extra markers such as
  ``; extra == "..."`` when installing packages. (`#13618 < >`_)
- When installing to a custom ``--prefix``, use the ``posix_prefix`` scheme
  when running from a Debian patched Python distribution to avoid a superfluous
  ``/local/`` subdirectory. (`#13634 < >`_)
- Refuse to follow an HTTP redirect to a ``file:`` URL. (`#14171 < >`_)
- Prevent wheel cache origin mismatch warnings from exposing URL credentials.
  (`#14232 < >`_)
- Report the incomplete-download error on Windows, not a ``PermissionError``.
  (`#14237 < >`_)
- Fix the global configuration location on macOS in virtual environments created
  from Homebrew Python. (`#14303 < >`_)
- Reject extra arguments to ``pip config edit`` instead of silently ignoring
  them. (`#14347 < >`_)
- Honor supplied hashes when using ``--no-require-hashes``. (`#14355 < >`_)
- Fix wheel installation with data files when the installation prefix is a
  filesystem root. (`#14358 < >`_)
- Restore support for UTF-8 configuration files when Python's UTF-8 mode is
  enabled. (`#14367 < >`_)
- Restore vendored Requests' PyOpenSSL fallback on non-Windows systems without
  importing PyOpenSSL on Windows. (`#14402 < >`_)
- Respect configured network settings while checking build constraint files.
  (`#14403 < >`_)
- Apply PyPI's direct URL dependency restriction to extras and cached wheels.
  (`#14341 < >`_)
- Fix a crash when installing or uninstalling a distribution with an invalid
  entry point. (`#8573 < >`_)
- Fail with a clearer error message on invalid configuration values. (`#8671 <
  >`_)
- Keep ``--version`` available only for pip and prevent its use in subcommands.
  (`#9456 < >`_)

Vendored Libraries
------------------

- Upgrade certifi to 2026.10.23
- Upgrade distlib to 0.4.4
- Upgrade idna to 3.20
- Upgrade msgpack to 1.2.4
- Upgrade packaging to 26.3
- Upgrade platformdirs to 4.12.4
- Upgrade pygments to 2.21.0
- Upgrade pyproject-hooks to 1.3.3
- Upgrade rich to 15.0.0
- Downgrade tomli to 2.3.2 to retain TOML 1.0 parsing on Python 3.10.
- Upgrade truststore to 0.10.5
- Upgrade urllib3 to 2.8.0

Process
-------

- Allow pip itself to be built with flit-core 4.

--===============1612671253463130613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pkg_resources -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/rich, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/resolvelib -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/resolvelib, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/truststore -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli_w, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging -> /usr/lib/python3.14/
 site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/packaging, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/idna -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/idna, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/msgpack -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/msgpack, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/certifi -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/requests, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distro -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/platformdirs, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/cachecontrol -> /usr/lib/python3.14/site-packag
 es/pip-26.3.dist-info/licenses/src/pip/_vendor/cachecontrol, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/platformdirs -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/truststore, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli_w -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distro, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distlib -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/urllib3, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pyproject_hooks, directory
  renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pygments -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/certifi, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/requests -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pygments, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/urllib3 -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distlib, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/rich -> /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pkg_resources, removed "/usr/lib/python3.14/site-packages/pip/_internal/exceptions.
 py /usr/lib/python3.14/site-packages/pip/_vendor/rich/__pycache__/_cell_widths.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_cell_widths.py /usr/lib/python3.14/site-packages/pip/_internal/__pycache__/exceptions.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__init__.py /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/testing.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode8-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode9-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/ranges.py /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/testing.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/pytest_plugin.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode7-0-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__p
 ycache__/build.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/ios.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-2-0.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/ios.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-0-0.py /usr/lib/python3.14/site-packages/pip/_internal/metadata/direct_references.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode9-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-0-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/network.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/_versions.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_interna
 l/exceptions/__init__.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/wheel.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode4-1-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-1-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-2-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-1-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/hashes.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-2-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vend
 or/rich/_unicode_data/__pycache__/unicode6-3-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode7-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/exceptions/network.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode10-0-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/uninstall.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode4-1-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/pyproject.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode8-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-1-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode17-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/ranges.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/exceptions/hashes.py /usr/lib/python3.14/site-packages/pip/_vendor/r
 ich/_unicode_data/unicode6-2-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode12-1-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode12-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode11-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/__init__.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/_versions.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode14-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode13-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode16-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode15-0-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode15-1-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/_base.py /usr/lib/python3.14/site-packages/
 pip/_internal/exceptions/__pycache__/pyproject.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/pytest_plugin.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/packaging/_ranges.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/build.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-1-0.py /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/uninstall.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/exceptions/wheel.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode12-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode12-1-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode13-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode14-0-0.cpython-314.pyc /usr/lib/python3.14/site
 -packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode15-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode15-1-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/metadata/__pycache__/direct_references.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode10-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode16-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode17-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-3-0.py /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode11-0-0.cpython-314.pyc /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/_base.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10660488 to 11803805 (+11%)
Changes to packages/x86-64-v3-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/AUTHORS.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/cachecontrol was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/certifi was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distlib was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distro was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/distro/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/idna was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/msgpack was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/packaging was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pkg_resources was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/platformdirs was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pygments was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pyproject_hooks was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/requests was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/requests/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/resolvelib was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/rich was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/rich/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli_w was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/truststore was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/urllib3 was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/pip-26.3.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/_base.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/build.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/hashes.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/network.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/_base.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/build.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/hashes.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/network.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/pyproject.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/uninstall.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/__pycache__/wheel.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/pyproject.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/uninstall.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions/wheel.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/metadata/direct_references.py was added
  /usr/lib/python3.14/site-packages/pip/_internal/metadata/__pycache__/direct_references.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/_ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/__pycache__/ranges.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/_ranges.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/packaging/ranges.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/ios.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/ios.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/pytest_plugin.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/__pycache__/testing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/pytest_plugin.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/platformdirs/testing.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__init__.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__ was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/__init__.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode10-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode11-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode12-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode12-1-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode13-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode14-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode15-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode15-1-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode16-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode17-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode4-1-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-1-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode5-2-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-1-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-2-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode6-3-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode7-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode8-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/unicode9-0-0.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/__pycache__/_versions.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode10-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode11-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode12-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode12-1-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode13-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode14-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode15-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode15-1-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode16-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode17-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode4-1-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-1-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode5-2-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-1-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-2-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode6-3-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode7-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode8-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/unicode9-0-0.py was added
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_unicode_data/_versions.py was added
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/AUTHORS.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/cachecontrol was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/cachecontrol/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/certifi was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/certifi/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distlib was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distlib/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distro was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/distro/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/idna was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/idna/LICENSE.md was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/msgpack was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/msgpack/COPYING was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.APACHE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/packaging/LICENSE.BSD was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pkg_resources was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pkg_resources/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/platformdirs was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/platformdirs/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pygments was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pygments/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/pyproject_hooks/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/requests was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/requests/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/resolvelib was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/resolvelib/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/rich was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/rich/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli_w was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/tomli_w/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/truststore was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/truststore/LICENSE was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/urllib3 was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/licenses/src/pip/_vendor/urllib3/LICENSE.txt was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/pip-26.2.2.dist-info/WHEEL was removed
  /usr/lib/python3.14/site-packages/pip/_internal/exceptions.py was removed
  /usr/lib/python3.14/site-packages/pip/_internal/__pycache__/exceptions.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/_cell_widths.py was removed
  /usr/lib/python3.14/site-packages/pip/_vendor/rich/__pycache__/_cell_widths.cpython-314.pyc was removed

--===============1612671253463130613==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-26.2.2-26.3.patch"

RnJvbSBmMjZmNjFmY2I0MzQ2YmRjNGFiOWFjMzY5ZDI5OGFkNzQ1ODEyZTcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNTo0Njo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGlwOiB1cGdyYWRlIDI2LjIuMiAtPiAyNi4zCgoyNi4zICgyMDI2LTExLTAyKQo9PT09
PT09PT09PT09PT09PQoKSW1wcm92ZWQgRG9jdW1lbnRhdGlvbgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCgotIENsYXJpZnkgaW4gdGhlIHNlY3VyaXR5IHBvbGljeSB0aGF0IHBpcCBoYXMgbmV2ZXIg
Y29uc2lkZXJlZCBpbnN0YWxsaW5nCiAgdW50cnVzdGVkIHdoZWVscyBzYWZlLiBUaGlzIGlzIGJl
Y2F1c2UgUHl0aG9uJ3MgaW1wb3J0IHN5c3RlbSBpcyBkeW5hbWljLCBzbwogIHBpcCBjYW5ub3Qg
Z3VhcmFudGVlIHRoYXQgaW5zdGFsbGluZyBhIHdoZWVsIHdpbGwgbm90IGV4ZWN1dGUgdGhpcmQt
cGFydHkKICBjb2RlLiAoYCMxNDQxMiA8ID5gXykKCkRlcHJlY2F0aW9ucyBhbmQgUmVtb3ZhbHMK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKLSBCbG9jayB1bmV4cGVjdGVkIGltcG9ydHMgZHVy
aW5nIGluc3RhbGxhdGlvbiwgd2FybiBhYm91dCB1bnNhZmUgaW1wb3J0cwogIGFmdGVyd2FyZCwg
YW5kIGltcHJvdmUgcmVjb3ZlcnkgZnJvbSBpbnRlcnJ1cHRlZCBpbnN0YWxsYXRpb25zLiAoYCMx
Mzg0MiA8CiAgPmBfKQoKRmVhdHVyZXMKLS0tLS0tLS0KCi0gU2hvdyBidWlsZCBiYWNrZW5kIHdh
cm5pbmdzIGZvciBsb2NhbCBzb3VyY2UgZGlyZWN0b3JpZXMgYW5kIGxvZyB0aGVtIGF0IGRlYnVn
CiAgbGV2ZWwgZm9yIG90aGVyIHNvdXJjZXMuIChgIzE0MzcyIDwgPmBfKQotIEFkZCBzdXBwb3J0
IGZvciBzZWxlY3RpbmcgZXh0cmFzIGluIHB5bG9jay50b21sIGZpbGVzIHdpdGggYGAtcgogIHB5
bG9jay50b21sW2V4dHJhMSxleHRyYTJdYGAuIChgIzE0MjA1IDwgPmBfKQotIEFsbG93IGBgLS1n
cm91cGBgIHRvIHNlbGVjdCBub24tZGVmYXVsdCBncm91cHMgZnJvbSBsb2NhbCBweWxvY2sgZmls
ZXMsCiAgZS5nLiBgYC0tZ3JvdXAgcHlsb2NrLnRvbWw6ZG9jc2BgLiAoYCMxNDM5MCA8ID5gXykK
LSBTdXBwb3J0IGBgLS1uby1iaW5hcnlgYCB3aXRoIGBgLXIgcHlsb2NrLnRvbWxgYC4gQmVmb3Jl
LCBwaXAgd291bGQgZ2V0IHRoZQogIHNkaXN0IGZyb20gdGhlIGluZGV4IGluc3RlYWQgb2YgdGhl
IGxvY2tlZCBVUkwsIG9yIGZhaWwgaWYgbm8gd2hlZWwgd2VyZQogIGF2YWlsYWJsZSBpbiB0aGUg
bG9jayBmaWxlLiAoYCMxNDE4NyA8ID5gXykKLSBTcGVlZCB1cCBpbnN0YWxsaW5nIGEgd2hlZWwg
d2l0aCBjb25zb2xlIHNjcmlwdHMgYnkgbm90IHJlc29sdmluZyBldmVyeQogIGBgUEFUSGBgIGVu
dHJ5LiAoYCMxNDIzNSA8ID5gXykKLSBDbGFyaWZ5IHRoZSB3YXJuaW5nIGZvciBgYH5gYC1wcmVm
aXhlZCBsZWZ0b3ZlciBkaXN0cmlidXRpb24gZGlyZWN0b3JpZXMuCiAgKGAjMTE4NDkgPCA+YF8p
CgpCdWcgRml4ZXMKLS0tLS0tLS0tCgotIFJlcG9ydCBidWlsZC1iYWNrZW5kIGltcG9ydCBmYWls
dXJlcyBhcyBwaXAgZXJyb3JzIGluc3RlYWQgb2YgZGlzcGxheWluZyBhbgogIHVuY2F1Z2h0IHRy
YWNlYmFjay4gKGAjMTIyNDggPCA+YF8pCi0gTm8gbG9uZ2VyIGxvZyB0aGUgInBpcCBpcyBsb29r
aW5nIGF0IG11bHRpcGxlIHZlcnNpb25zIG9mIGEgcGFja2FnZSIgbWVzc2FnZQogIHVudGlsIHBp
cCBoYXMgbG9va2VkIGF0IGF0IGxlYXN0IHR3byB2ZXJzaW9ucyBvZiB0aGF0IHBhY2thZ2UuIChg
IzEyOTI4IDwgPmBfKQotIEZpeCBgYHBpcGBgJ3Mgc2VsZiB2ZXJzaW9uIGNoZWNrIHJlcG9ydGlu
ZyBhbiBvdXRkYXRlZCB2ZXJzaW9uIGZyb20gdGhlCiAgZW52aXJvbm1lbnQgaW5zdGVhZCBvZiB0
aGUgcnVubmluZyBwaXAgd2hlbiBydW4gYXMgYSB6aXBhcHAuIChgIzEzMDg0IDwgPmBfKQotIEZp
eCBhIGZhdGFsIGVycm9yIHdoZW4gdXNpbmcgdGhlIGBgUElQX0NPTkZJR19GSUxFYGAgZW52aXJv
bm1lbnQgdmFyaWFibGUgd2l0aAogIGBgcGlwIGNvbmZpZyBzZXRgYC4gKGAjMTMyNzkgPCA+YF8p
Ci0gQXZvaWQgbWlzbGVhZGluZyBlcnJvciBtZXNzYWdlcyB0aGF0IGluY2x1ZGUgZXh0cmEgbWFy
a2VycyBzdWNoIGFzCiAgYGA7IGV4dHJhID09ICIuLi4iYGAgd2hlbiBpbnN0YWxsaW5nIHBhY2th
Z2VzLiAoYCMxMzYxOCA8ID5gXykKLSBXaGVuIGluc3RhbGxpbmcgdG8gYSBjdXN0b20gYGAtLXBy
ZWZpeGBgLCB1c2UgdGhlIGBgcG9zaXhfcHJlZml4YGAgc2NoZW1lCiAgd2hlbiBydW5uaW5nIGZy
b20gYSBEZWJpYW4gcGF0Y2hlZCBQeXRob24gZGlzdHJpYnV0aW9uIHRvIGF2b2lkIGEgc3VwZXJm
bHVvdXMKICBgYC9sb2NhbC9gYCBzdWJkaXJlY3RvcnkuIChgIzEzNjM0IDwgPmBfKQotIFJlZnVz
ZSB0byBmb2xsb3cgYW4gSFRUUCByZWRpcmVjdCB0byBhIGBgZmlsZTpgYCBVUkwuIChgIzE0MTcx
IDwgPmBfKQotIFByZXZlbnQgd2hlZWwgY2FjaGUgb3JpZ2luIG1pc21hdGNoIHdhcm5pbmdzIGZy
b20gZXhwb3NpbmcgVVJMIGNyZWRlbnRpYWxzLgogIChgIzE0MjMyIDwgPmBfKQotIFJlcG9ydCB0
aGUgaW5jb21wbGV0ZS1kb3dubG9hZCBlcnJvciBvbiBXaW5kb3dzLCBub3QgYSBgYFBlcm1pc3Np
b25FcnJvcmBgLgogIChgIzE0MjM3IDwgPmBfKQotIEZpeCB0aGUgZ2xvYmFsIGNvbmZpZ3VyYXRp
b24gbG9jYXRpb24gb24gbWFjT1MgaW4gdmlydHVhbCBlbnZpcm9ubWVudHMgY3JlYXRlZAogIGZy
b20gSG9tZWJyZXcgUHl0aG9uLiAoYCMxNDMwMyA8ID5gXykKLSBSZWplY3QgZXh0cmEgYXJndW1l
bnRzIHRvIGBgcGlwIGNvbmZpZyBlZGl0YGAgaW5zdGVhZCBvZiBzaWxlbnRseSBpZ25vcmluZwog
IHRoZW0uIChgIzE0MzQ3IDwgPmBfKQotIEhvbm9yIHN1cHBsaWVkIGhhc2hlcyB3aGVuIHVzaW5n
IGBgLS1uby1yZXF1aXJlLWhhc2hlc2BgLiAoYCMxNDM1NSA8ID5gXykKLSBGaXggd2hlZWwgaW5z
dGFsbGF0aW9uIHdpdGggZGF0YSBmaWxlcyB3aGVuIHRoZSBpbnN0YWxsYXRpb24gcHJlZml4IGlz
IGEKICBmaWxlc3lzdGVtIHJvb3QuIChgIzE0MzU4IDwgPmBfKQotIFJlc3RvcmUgc3VwcG9ydCBm
b3IgVVRGLTggY29uZmlndXJhdGlvbiBmaWxlcyB3aGVuIFB5dGhvbidzIFVURi04IG1vZGUgaXMK
ICBlbmFibGVkLiAoYCMxNDM2NyA8ID5gXykKLSBSZXN0b3JlIHZlbmRvcmVkIFJlcXVlc3RzJyBQ
eU9wZW5TU0wgZmFsbGJhY2sgb24gbm9uLVdpbmRvd3Mgc3lzdGVtcyB3aXRob3V0CiAgaW1wb3J0
aW5nIFB5T3BlblNTTCBvbiBXaW5kb3dzLiAoYCMxNDQwMiA8ID5gXykKLSBSZXNwZWN0IGNvbmZp
Z3VyZWQgbmV0d29yayBzZXR0aW5ncyB3aGlsZSBjaGVja2luZyBidWlsZCBjb25zdHJhaW50IGZp
bGVzLgogIChgIzE0NDAzIDwgPmBfKQotIEFwcGx5IFB5UEkncyBkaXJlY3QgVVJMIGRlcGVuZGVu
Y3kgcmVzdHJpY3Rpb24gdG8gZXh0cmFzIGFuZCBjYWNoZWQgd2hlZWxzLgogIChgIzE0MzQxIDwg
PmBfKQotIEZpeCBhIGNyYXNoIHdoZW4gaW5zdGFsbGluZyBvciB1bmluc3RhbGxpbmcgYSBkaXN0
cmlidXRpb24gd2l0aCBhbiBpbnZhbGlkCiAgZW50cnkgcG9pbnQuIChgIzg1NzMgPCA+YF8pCi0g
RmFpbCB3aXRoIGEgY2xlYXJlciBlcnJvciBtZXNzYWdlIG9uIGludmFsaWQgY29uZmlndXJhdGlv
biB2YWx1ZXMuIChgIzg2NzEgPAogID5gXykKLSBLZWVwIGBgLS12ZXJzaW9uYGAgYXZhaWxhYmxl
IG9ubHkgZm9yIHBpcCBhbmQgcHJldmVudCBpdHMgdXNlIGluIHN1YmNvbW1hbmRzLgogIChgIzk0
NTYgPCA+YF8pCgpWZW5kb3JlZCBMaWJyYXJpZXMKLS0tLS0tLS0tLS0tLS0tLS0tCgotIFVwZ3Jh
ZGUgY2VydGlmaSB0byAyMDI2LjEwLjIzCi0gVXBncmFkZSBkaXN0bGliIHRvIDAuNC40Ci0gVXBn
cmFkZSBpZG5hIHRvIDMuMjAKLSBVcGdyYWRlIG1zZ3BhY2sgdG8gMS4yLjQKLSBVcGdyYWRlIHBh
Y2thZ2luZyB0byAyNi4zCi0gVXBncmFkZSBwbGF0Zm9ybWRpcnMgdG8gNC4xMi40Ci0gVXBncmFk
ZSBweWdtZW50cyB0byAyLjIxLjAKLSBVcGdyYWRlIHB5cHJvamVjdC1ob29rcyB0byAxLjMuMwot
IFVwZ3JhZGUgcmljaCB0byAxNS4wLjAKLSBEb3duZ3JhZGUgdG9tbGkgdG8gMi4zLjIgdG8gcmV0
YWluIFRPTUwgMS4wIHBhcnNpbmcgb24gUHl0aG9uIDMuMTAuCi0gVXBncmFkZSB0cnVzdHN0b3Jl
IHRvIDAuMTAuNQotIFVwZ3JhZGUgdXJsbGliMyB0byAyLjguMAoKUHJvY2VzcwotLS0tLS0tCgot
IEFsbG93IHBpcCBpdHNlbGYgdG8gYmUgYnVpbHQgd2l0aCBmbGl0LWNvcmUgNC4KLS0tCiAuLi4v
cHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2ggICAgICAgICAgICB8
IDYgKysrLS0tCiAuLi4vcHl0aG9uL3tweXRob24zLXBpcF8yNi4yLjIuYmIgPT4gcHl0aG9uMy1w
aXBfMjYuMy5iYn0gICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtcGlwXzI2LjIuMi5iYiA9PiBweXRob24zLXBpcF8yNi4zLmJifSAoOTclKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFuZ19t
YW5nbGluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAv
bm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaAppbmRleCBmMzg4OTI4MjMwLi45OThkOGE3M2NmIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3No
ZWJhbmdfbWFuZ2xpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXBpcC9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBlYTc1YjdmYzAxN2Y3YTFhM2E0N2U5ZTJiZWYyMTIwOWYwZjM2YTA0IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA3MTdjNDQwZGI4Nzg3ZmRhOWZiMmFiZjIwN2ZlODk0ZTI5MWNlMGYw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQu
cHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDIzIEZlYiAyMDIyIDEyOjI3
OjA2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHB5dGhvbjMtcGlwOiBEb24ndCBjaGFuZ2Ugc2hl
YmFuZwpAQCAtMTMsNyArMTMsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09F
IHNwZWNpZmljIGNvbmZpZ10KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvcGlwL192ZW5kb3IvZGlzdGxpYi9zY3JpcHRz
LnB5IGIvc3JjL3BpcC9fdmVuZG9yL2Rpc3RsaWIvc2NyaXB0cy5weQotaW5kZXggYWM5ZTkwOS4u
MWZhYTViNiAxMDA2NDQKK2luZGV4IDAzMzgwMTIuLjY0YjAwYTIgMTAwNjQ0CiAtLS0gYS9zcmMv
cGlwL192ZW5kb3IvZGlzdGxpYi9zY3JpcHRzLnB5CiArKysgYi9zcmMvcGlwL192ZW5kb3IvZGlz
dGxpYi9zY3JpcHRzLnB5CiBAQCAtMTU3LDYgKzE1Nyw4IEBAIGNsYXNzIFNjcmlwdE1ha2VyKG9i
amVjdCk6CkBAIC0yNSw3ICsyNSw3IEBAIGluZGV4IGFjOWU5MDkuLjFmYWE1YjYgMTAwNjQ0CiAg
ICAgICAgICBpZiBvcy5uYW1lICE9ICdwb3NpeCc6CiAgICAgICAgICAgICAgc2ltcGxlX3NoZWJh
bmcgPSBUcnVlCiAgICAgICAgICBlbGlmIGdldGF0dHIoc3lzLCAiY3Jvc3NfY29tcGlsaW5nIiwg
RmFsc2UpOgotQEAgLTM2Nyw3ICszNjksNyBAQCBjbGFzcyBTY3JpcHRNYWtlcihvYmplY3QpOgor
QEAgLTM3Myw3ICszNzUsNyBAQCBjbGFzcyBTY3JpcHRNYWtlcihvYmplY3QpOgogICAgICAgICAg
ICAgICAgICByZXR1cm4KICAKICAgICAgICAgICAgICBtYXRjaCA9IEZJUlNUX0xJTkVfUkUubWF0
Y2goZmlyc3RfbGluZS5yZXBsYWNlKGInXHJcbicsIGInXG4nKSkKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBfMjYuMi4yLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNi4zLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXBf
MjYuMi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cGlwXzI2LjMuYmIKaW5kZXggYzgzYzllNDQ2OC4uYTZjZTZhMWZiYyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNi4yLjIuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNi4zLmJiCkBAIC0yNiw3ICsy
Niw3IEBAIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlCiAKIFNSQ19VUkkgKz0gImZpbGU6
Ly9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2E4
ZTVjODAwNDkyNzg3ZjMzYTQxMTRlZjU0NDQ0NTQ2YzM0MGRmNDI4OTc0ZWJiYTE3ZTBmZDQ3ZTEx
YWYyZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2YzM2YWU3ZGE4Njk1YmU2N2UzY2Q5ZjdkODc5
MTk2NjdjZWQ1M2Y1N2NlMmVkZTc1ZDg5YjU5MTJlZDJiYzRjIgogCiBDVkVfUFJPRFVDVCA9ICJw
eXBhOnBpcCIKIAotLSAKMi40Ny4xCgo=

--===============1612671253463130613==--
