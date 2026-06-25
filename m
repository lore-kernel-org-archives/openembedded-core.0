Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8368DCDE008
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 05:42:44 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5035.1782366151015537123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 22:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EvuKgMCU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=v65k8Pjr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019efd4d1d6c-a1d4bdd7-86d3-4577-a18b-cde69cc27c67-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782366150;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JNaqwvNbZFMNLGsLqCXqu/anbQ4x5HPfnWccAJ2FcbA=;
	b=EvuKgMCUYfJ6EA+8qfvYJ6sthNHM5Z19j980cjUe87jotfBi/is/jXxPZiPjVqcg
	ALpVGGw3eXnQzG7rHkxJul1ZC70EssLCJJFYsCjCP4Lr+H6VA+dgRXGU5NVhR5Ds5vS
	2xNHi1N6sKTP0jbCq0BFyVjfqJ/ckZyrWpZUpRd4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782366150;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JNaqwvNbZFMNLGsLqCXqu/anbQ4x5HPfnWccAJ2FcbA=;
	b=v65k8Pjrv7TfsaCo+KHhjChu5Vi79TSzFQCrcEPe9EOoU7RAduOcevI1f7fPSHEu
	CG4fpaq0dhXiQVP3XN68mzOqDDo8GhavVthKuTry6gkzJlt4Gi+lOB6y6aQXr1hjZSV
	7AO0YwJ4Zu9dKhkhndymqCmJe+0NbolD2JCPQu6w=
Content-Type: multipart/mixed; boundary="===============3948041183454656502=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.4.2 SUCCEEDED
Message-ID: <0101019efd4d1d6c-a1d4bdd7-86d3-4577-a18b-cde69cc27c67-000000@us-west-2.amazonses.com>
Date: Thu, 25 Jun 2026 05:42:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.25-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 05:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239537

--===============3948041183454656502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.4.1-8.4.2.patch
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
From d825a9cd1292ef42e415dc51ea5836f239311f70 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 25 Jun 2026 05:28:11 +0000
Subject: [PATCH] python3-click: upgrade 8.4.1 -> 8.4.2

---
 ...7494c991c9197902fdf4995e11b2da3e9762.patch | 173 ------------------
 .../python/python3-click/pytest-fix.patch     |  19 +-
 ...-click_8.4.1.bb => python3-click_8.4.2.bb} |   4 +-
 3 files changed, 14 insertions(+), 182 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
 rename meta/recipes-devtools/python/{python3-click_8.4.1.bb => python3-click_8.4.2.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch b/meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
deleted file mode 100644
index e16f84ec9a..0000000000
--- a/meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-"Fix pager test flackiness and add stress tests for echo_via_pager"
-
-From 7eb57cff7cd292fbd526eaf861c8f945ddeb07a3 Mon Sep 17 00:00:00 2001
-From: Kevin Deldycke <kevin@deldycke.com>
-Date: Fri, 22 May 2026 11:13:12 +0200
-Subject: [PATCH] Fix pager test race by raising before yield
-
-Upstream-Status: Backport [https://github.com/pallets/click/commit/ffcc7494c991c9197902fdf4995e11b2da3e9762]
-
-Refs: #3470 #2899
----
- pyproject.toml                 |  3 +-
- src/click/_compat.py           |  1 -
- tests/test_stream_lifecycle.py |  4 +-
- tests/test_utils.py            | 79 +++++++++++++++++++++++++++++++---
- 4 files changed, 78 insertions(+), 9 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index e39ef21055..ed91e5d741 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -185,12 +185,11 @@ commands = [[
- ]]
- 
- [tool.tox.env.stress]
--description = "stress tests for stream lifecycle race conditions"
-+description = "high-iteration stress tests for race conditions"
- commands = [[
-     "pytest", "-v", "--tb=short", "-x", "-m", "stress",
-     "--basetemp={env_tmp_dir}",
-     "--override-ini=addopts=",
--    "tests/test_stream_lifecycle.py",
-     {replace = "posargs", default = [], extend = true},
- ]]
- 
-diff --git a/src/click/_compat.py b/src/click/_compat.py
-index 36c0e53975..134c4f3893 100644
---- a/src/click/_compat.py
-+++ b/src/click/_compat.py
-@@ -12,7 +12,6 @@
- 
- CYGWIN = sys.platform.startswith("cygwin")
- WIN = sys.platform.startswith("win")
--MAC = sys.platform == "darwin"
- auto_wrap_for_ansi: t.Callable[[t.TextIO], t.TextIO] | None = None
- _ansi_re = re.compile(r"\033\[[;?0-9]*[a-zA-Z]")
- 
-diff --git a/tests/test_stream_lifecycle.py b/tests/test_stream_lifecycle.py
-index 42e26acc34..9f4aa20868 100644
---- a/tests/test_stream_lifecycle.py
-+++ b/tests/test_stream_lifecycle.py
-@@ -484,7 +484,9 @@ def cli():
- # Category 6: Stress tests - high-iteration reproducers for race conditions
- #
- # These are marked with ``pytest.mark.stress`` so they can be included or
--# excluded independently. The CI workflow runs them in a separate job.
-+# excluded independently. The ``tox -e stress`` env collects every
-+# ``pytest.mark.stress`` test across the suite (not just this file), so
-+# stress regressions for other components live alongside their unit tests.
- # ---------------------------------------------------------------------------
- 
- 
-diff --git a/tests/test_utils.py b/tests/test_utils.py
-index 139cd7324f..1aebf3cc5a 100644
---- a/tests/test_utils.py
-+++ b/tests/test_utils.py
-@@ -16,7 +16,6 @@
- 
- import click._termui_impl
- import click.utils
--from click._compat import MAC
- from click._compat import WIN
- from click._utils import UNSET
- 
-@@ -286,6 +285,11 @@ def _test_gen_func():
- 
- 
- def _test_gen_func_fails():
-+    raise RuntimeError("This is a test.")
-+    yield  # unreachable, keeps this a generator function
-+
-+
-+def _test_gen_func_yields_then_fails():
-     yield "test"
-     raise RuntimeError("This is a test.")
- 
-@@ -315,10 +319,6 @@ def _test_simulate_keyboard_interrupt(file=None):
- 
- 
- @pytest.mark.skipif(WIN, reason="Different behavior on windows.")
--@pytest.mark.skipif(
--    MAC and sys.version_info >= (3, 13) and not sys._is_gil_enabled(),
--    reason="Generator exception tests are flaky in Python 3.14t on macOS.",
--)
- @pytest.mark.parametrize(
-     "pager_cmd", ["cat", "cat ", " cat ", "less", " less", " less "]
- )
-@@ -456,6 +456,75 @@ def test_echo_via_pager(monkeypatch, capfd, pager_cmd, test, tmp_path):
-     )
- 
- 
-+@pytest.mark.skipif(WIN, reason="Different behavior on windows.")
-+def test_echo_via_pager_yields_before_exception(monkeypatch, tmp_path):
-+    """A generator that yields then raises: click writes the partial output to
-+    the pager stream before propagating the exception.
-+
-+    The pager file content is intentionally NOT asserted: pipe-drain timing
-+    between click and the pager subprocess is outside click's control
-+    (#2899, #3470). Spying on ``MaybeStripAnsi.write`` records what click sent
-+    to the pager, which is deterministic regardless of scheduling.
-+    """
-+    monkeypatch.setitem(os.environ, "PAGER", "cat")
-+    monkeypatch.setattr(click._termui_impl, "isatty", lambda x: True)
-+
-+    writes: list[str] = []
-+    real_write = click._termui_impl.MaybeStripAnsi.write
-+
-+    def spy(self, text):
-+        writes.append(text)
-+        return real_write(self, text)
-+
-+    monkeypatch.setattr(click._termui_impl.MaybeStripAnsi, "write", spy)
-+
-+    pager_out_tmp = tmp_path / "pager_out.txt"
-+    with (
-+        pager_out_tmp.open("w") as f,
-+        patch.object(subprocess, "Popen", partial(subprocess.Popen, stdout=f)),
-+        pytest.raises(RuntimeError, match="This is a test."),
-+    ):
-+        click.echo_via_pager(_test_gen_func_yields_then_fails())
-+
-+    assert "".join(writes) == "test", (
-+        f"click should have written the yielded chunk before exception, got {writes!r}"
-+    )
-+
-+
-+@pytest.mark.stress
-+@pytest.mark.skipif(WIN, reason="Different behavior on windows.")
-+@pytest.mark.parametrize("_", range(1000))
-+def test_stress_echo_via_pager_exception_cleanup(_, monkeypatch, tmp_path):
-+    """Repeated exceptions during ``echo_via_pager`` must not leak subprocesses.
-+
-+    Regression coverage for the cleanup path in ``_pipepager``'s exception
-+    handler (issue #2899, PR #3470). Each iteration spawns a real pager
-+    subprocess, raises before any data is written and check there is no leak.
-+    """
-+    monkeypatch.setitem(os.environ, "PAGER", "cat")
-+    monkeypatch.setattr(click._termui_impl, "isatty", lambda x: True)
-+
-+    spawned: list[subprocess.Popen] = []
-+    real_popen = subprocess.Popen
-+
-+    def tracking_popen(*args, **kwargs):
-+        p = real_popen(*args, **kwargs)
-+        spawned.append(p)
-+        return p
-+
-+    pager_out_tmp = tmp_path / "pager_out.txt"
-+    with (
-+        pager_out_tmp.open("w") as f,
-+        patch.object(subprocess, "Popen", partial(tracking_popen, stdout=f)),
-+        pytest.raises(RuntimeError),
-+    ):
-+        click.echo_via_pager(_test_gen_func_fails())
-+
-+    assert spawned, "pager subprocess was never started"
-+    for p in spawned:
-+        assert p.returncode is not None, "pager subprocess not reaped"
-+
-+
- def test_echo_color_flag(monkeypatch, capfd):
-     isatty = True
-     monkeypatch.setattr(click._compat, "isatty", lambda x: isatty)
diff --git a/meta/recipes-devtools/python/python3-click/pytest-fix.patch b/meta/recipes-devtools/python/python3-click/pytest-fix.patch
index 662ad8aae9..abfa07120a 100644
--- a/meta/recipes-devtools/python/python3-click/pytest-fix.patch
+++ b/meta/recipes-devtools/python/python3-click/pytest-fix.patch
@@ -1,4 +1,8 @@
-Fix an error with newer versions of pytest (9.1.0) by converting the generator into a tuple:
+From 1cdbe9829973a30037075d613b5a1d5a42e260d5 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 15 Jun 2026 11:37:28 +0100
+Subject: [PATCH] Fix an error with newer versions of pytest (9.1.0) by
+ converting the generator into a tuple:
 
 E   pytest.PytestRemovedIn10Warning: Passing a non-Collection iterable to parametrize is deprecated.
 E   Test: tests/test_basic.py::test_boolean_conversion, argvalues type: chain
@@ -9,12 +13,15 @@ ERROR: tests/test_basic.py:tests/test_basic.py
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Submitted [https://github.com/pallets/click/pull/3597]
+---
+ tests/test_basic.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: click-8.3.3/tests/test_basic.py
-===================================================================
---- click-8.3.3.orig/tests/test_basic.py
-+++ click-8.3.3/tests/test_basic.py
-@@ -258,10 +258,10 @@ def test_boolean_flag(runner, default, a
+diff --git a/tests/test_basic.py b/tests/test_basic.py
+index 34d22e7..8076dd8 100644
+--- a/tests/test_basic.py
++++ b/tests/test_basic.py
+@@ -258,10 +258,10 @@ def test_boolean_flag(runner, default, args, expect):
  
  @pytest.mark.parametrize(
      ("value", "expect"),
diff --git a/meta/recipes-devtools/python/python3-click_8.4.1.bb b/meta/recipes-devtools/python/python3-click_8.4.2.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-click_8.4.1.bb
rename to meta/recipes-devtools/python/python3-click_8.4.2.bb
index 53c75c333c..bb03575358 100644
--- a/meta/recipes-devtools/python/python3-click_8.4.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.4.2.bb
@@ -8,9 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI += "file://pytest-fix.patch"
-SRC_URI += "file://ffcc7494c991c9197902fdf4995e11b2da3e9762.patch"
-SRC_URI[sha256sum] = "918b5633eddf6b41c32d4f454bf0de810065c74e3f7dbf8ee5452f8be88d3e96"
+SRC_URI[sha256sum] = "9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c4917a15f6"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============3948041183454656502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.4.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.4.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/click-8.4.1.dist-info -> /usr/lib/python3.14/site-packages/click-8.4.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.4.1.dist-info moved to /usr/lib/python3.14/site-packages/click-8.4.2.dist-info

--===============3948041183454656502==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.4.1-8.4.2.patch"

RnJvbSBkODI1YTljZDEyOTJlZjQyZTQxNWRjNTFlYTU4MzZmMjM5MzExZjcwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjUgSnVuIDIwMjYgMDU6Mjg6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNsaWNrOiB1cGdyYWRlIDguNC4xIC0+IDguNC4yCgotLS0KIC4uLjc0OTRjOTkxYzkx
OTc5MDJmZGY0OTk1ZTExYjJkYTNlOTc2Mi5wYXRjaCB8IDE3MyAtLS0tLS0tLS0tLS0tLS0tLS0K
IC4uLi9weXRob24vcHl0aG9uMy1jbGljay9weXRlc3QtZml4LnBhdGNoICAgICB8ICAxOSArLQog
Li4uLWNsaWNrXzguNC4xLmJiID0+IHB5dGhvbjMtY2xpY2tfOC40LjIuYmJ9IHwgICA0ICstCiAz
IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE4MiBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2sv
ZmZjYzc0OTRjOTkxYzkxOTc5MDJmZGY0OTk1ZTExYjJkYTNlOTc2Mi5wYXRjaAogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtY2xpY2tfOC40LjEuYmIgPT4gcHl0
aG9uMy1jbGlja184LjQuMi5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2svZmZjYzc0OTRjOTkxYzkxOTc5MDJmZGY0OTk1ZTEx
YjJkYTNlOTc2Mi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
bGljay9mZmNjNzQ5NGM5OTFjOTE5NzkwMmZkZjQ5OTVlMTFiMmRhM2U5NzYyLnBhdGNoCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlMTZmODRlYzlhLi4wMDAwMDAwMDAwCi0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGljay9mZmNjNzQ5NGM5OTFjOTE5
NzkwMmZkZjQ5OTVlMTFiMmRhM2U5NzYyLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMTczICsw
LDAgQEAKLSJGaXggcGFnZXIgdGVzdCBmbGFja2luZXNzIGFuZCBhZGQgc3RyZXNzIHRlc3RzIGZv
ciBlY2hvX3ZpYV9wYWdlciIKLQotRnJvbSA3ZWI1N2NmZjdjZDI5MmZiZDUyNmVhZjg2MWM4Zjk0
NWRkZWIwN2EzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2V2aW4gRGVsZHlja2Ug
PGtldmluQGRlbGR5Y2tlLmNvbT4KLURhdGU6IEZyaSwgMjIgTWF5IDIwMjYgMTE6MTM6MTIgKzAy
MDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4IHBhZ2VyIHRlc3QgcmFjZSBieSByYWlzaW5nIGJlZm9y
ZSB5aWVsZAotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20v
cGFsbGV0cy9jbGljay9jb21taXQvZmZjYzc0OTRjOTkxYzkxOTc5MDJmZGY0OTk1ZTExYjJkYTNl
OTc2Ml0KLQotUmVmczogIzM0NzAgIzI4OTkKLS0tLQotIHB5cHJvamVjdC50b21sICAgICAgICAg
ICAgICAgICB8ICAzICstCi0gc3JjL2NsaWNrL19jb21wYXQucHkgICAgICAgICAgIHwgIDEgLQot
IHRlc3RzL3Rlc3Rfc3RyZWFtX2xpZmVjeWNsZS5weSB8ICA0ICstCi0gdGVzdHMvdGVzdF91dGls
cy5weSAgICAgICAgICAgIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQot
IDQgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKLQotZGlm
ZiAtLWdpdCBhL3B5cHJvamVjdC50b21sIGIvcHlwcm9qZWN0LnRvbWwKLWluZGV4IGUzOWVmMjEw
NTUuLmVkOTFlNWQ3NDEgMTAwNjQ0Ci0tLS0gYS9weXByb2plY3QudG9tbAotKysrIGIvcHlwcm9q
ZWN0LnRvbWwKLUBAIC0xODUsMTIgKzE4NSwxMSBAQCBjb21tYW5kcyA9IFtbCi0gXV0KLSAKLSBb
dG9vbC50b3guZW52LnN0cmVzc10KLS1kZXNjcmlwdGlvbiA9ICJzdHJlc3MgdGVzdHMgZm9yIHN0
cmVhbSBsaWZlY3ljbGUgcmFjZSBjb25kaXRpb25zIgotK2Rlc2NyaXB0aW9uID0gImhpZ2gtaXRl
cmF0aW9uIHN0cmVzcyB0ZXN0cyBmb3IgcmFjZSBjb25kaXRpb25zIgotIGNvbW1hbmRzID0gW1sK
LSAgICAgInB5dGVzdCIsICItdiIsICItLXRiPXNob3J0IiwgIi14IiwgIi1tIiwgInN0cmVzcyIs
Ci0gICAgICItLWJhc2V0ZW1wPXtlbnZfdG1wX2Rpcn0iLAotICAgICAiLS1vdmVycmlkZS1pbmk9
YWRkb3B0cz0iLAotLSAgICAidGVzdHMvdGVzdF9zdHJlYW1fbGlmZWN5Y2xlLnB5IiwKLSAgICAg
e3JlcGxhY2UgPSAicG9zYXJncyIsIGRlZmF1bHQgPSBbXSwgZXh0ZW5kID0gdHJ1ZX0sCi0gXV0K
LSAKLWRpZmYgLS1naXQgYS9zcmMvY2xpY2svX2NvbXBhdC5weSBiL3NyYy9jbGljay9fY29tcGF0
LnB5Ci1pbmRleCAzNmMwZTUzOTc1Li4xMzRjNGYzODkzIDEwMDY0NAotLS0tIGEvc3JjL2NsaWNr
L19jb21wYXQucHkKLSsrKyBiL3NyYy9jbGljay9fY29tcGF0LnB5Ci1AQCAtMTIsNyArMTIsNiBA
QAotIAotIENZR1dJTiA9IHN5cy5wbGF0Zm9ybS5zdGFydHN3aXRoKCJjeWd3aW4iKQotIFdJTiA9
IHN5cy5wbGF0Zm9ybS5zdGFydHN3aXRoKCJ3aW4iKQotLU1BQyA9IHN5cy5wbGF0Zm9ybSA9PSAi
ZGFyd2luIgotIGF1dG9fd3JhcF9mb3JfYW5zaTogdC5DYWxsYWJsZVtbdC5UZXh0SU9dLCB0LlRl
eHRJT10gfCBOb25lID0gTm9uZQotIF9hbnNpX3JlID0gcmUuY29tcGlsZShyIlwwMzNcW1s7PzAt
OV0qW2EtekEtWl0iKQotIAotZGlmZiAtLWdpdCBhL3Rlc3RzL3Rlc3Rfc3RyZWFtX2xpZmVjeWNs
ZS5weSBiL3Rlc3RzL3Rlc3Rfc3RyZWFtX2xpZmVjeWNsZS5weQotaW5kZXggNDJlMjZhY2MzNC4u
OWY0YWEyMDg2OCAxMDA2NDQKLS0tLSBhL3Rlc3RzL3Rlc3Rfc3RyZWFtX2xpZmVjeWNsZS5weQot
KysrIGIvdGVzdHMvdGVzdF9zdHJlYW1fbGlmZWN5Y2xlLnB5Ci1AQCAtNDg0LDcgKzQ4NCw5IEBA
IGRlZiBjbGkoKToKLSAjIENhdGVnb3J5IDY6IFN0cmVzcyB0ZXN0cyAtIGhpZ2gtaXRlcmF0aW9u
IHJlcHJvZHVjZXJzIGZvciByYWNlIGNvbmRpdGlvbnMKLSAjCi0gIyBUaGVzZSBhcmUgbWFya2Vk
IHdpdGggYGBweXRlc3QubWFyay5zdHJlc3NgYCBzbyB0aGV5IGNhbiBiZSBpbmNsdWRlZCBvcgot
LSMgZXhjbHVkZWQgaW5kZXBlbmRlbnRseS4gVGhlIENJIHdvcmtmbG93IHJ1bnMgdGhlbSBpbiBh
IHNlcGFyYXRlIGpvYi4KLSsjIGV4Y2x1ZGVkIGluZGVwZW5kZW50bHkuIFRoZSBgYHRveCAtZSBz
dHJlc3NgYCBlbnYgY29sbGVjdHMgZXZlcnkKLSsjIGBgcHl0ZXN0Lm1hcmsuc3RyZXNzYGAgdGVz
dCBhY3Jvc3MgdGhlIHN1aXRlIChub3QganVzdCB0aGlzIGZpbGUpLCBzbwotKyMgc3RyZXNzIHJl
Z3Jlc3Npb25zIGZvciBvdGhlciBjb21wb25lbnRzIGxpdmUgYWxvbmdzaWRlIHRoZWlyIHVuaXQg
dGVzdHMuCi0gIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLSAKLSAKLWRpZmYgLS1naXQgYS90ZXN0cy90
ZXN0X3V0aWxzLnB5IGIvdGVzdHMvdGVzdF91dGlscy5weQotaW5kZXggMTM5Y2Q3MzI0Zi4uMWFl
YmYzY2M1YSAxMDA2NDQKLS0tLSBhL3Rlc3RzL3Rlc3RfdXRpbHMucHkKLSsrKyBiL3Rlc3RzL3Rl
c3RfdXRpbHMucHkKLUBAIC0xNiw3ICsxNiw2IEBACi0gCi0gaW1wb3J0IGNsaWNrLl90ZXJtdWlf
aW1wbAotIGltcG9ydCBjbGljay51dGlscwotLWZyb20gY2xpY2suX2NvbXBhdCBpbXBvcnQgTUFD
Ci0gZnJvbSBjbGljay5fY29tcGF0IGltcG9ydCBXSU4KLSBmcm9tIGNsaWNrLl91dGlscyBpbXBv
cnQgVU5TRVQKLSAKLUBAIC0yODYsNiArMjg1LDExIEBAIGRlZiBfdGVzdF9nZW5fZnVuYygpOgot
IAotIAotIGRlZiBfdGVzdF9nZW5fZnVuY19mYWlscygpOgotKyAgICByYWlzZSBSdW50aW1lRXJy
b3IoIlRoaXMgaXMgYSB0ZXN0LiIpCi0rICAgIHlpZWxkICAjIHVucmVhY2hhYmxlLCBrZWVwcyB0
aGlzIGEgZ2VuZXJhdG9yIGZ1bmN0aW9uCi0rCi0rCi0rZGVmIF90ZXN0X2dlbl9mdW5jX3lpZWxk
c190aGVuX2ZhaWxzKCk6Ci0gICAgIHlpZWxkICJ0ZXN0IgotICAgICByYWlzZSBSdW50aW1lRXJy
b3IoIlRoaXMgaXMgYSB0ZXN0LiIpCi0gCi1AQCAtMzE1LDEwICszMTksNiBAQCBkZWYgX3Rlc3Rf
c2ltdWxhdGVfa2V5Ym9hcmRfaW50ZXJydXB0KGZpbGU9Tm9uZSk6Ci0gCi0gCi0gQHB5dGVzdC5t
YXJrLnNraXBpZihXSU4sIHJlYXNvbj0iRGlmZmVyZW50IGJlaGF2aW9yIG9uIHdpbmRvd3MuIikK
LS1AcHl0ZXN0Lm1hcmsuc2tpcGlmKAotLSAgICBNQUMgYW5kIHN5cy52ZXJzaW9uX2luZm8gPj0g
KDMsIDEzKSBhbmQgbm90IHN5cy5faXNfZ2lsX2VuYWJsZWQoKSwKLS0gICAgcmVhc29uPSJHZW5l
cmF0b3IgZXhjZXB0aW9uIHRlc3RzIGFyZSBmbGFreSBpbiBQeXRob24gMy4xNHQgb24gbWFjT1Mu
IiwKLS0pCi0gQHB5dGVzdC5tYXJrLnBhcmFtZXRyaXplKAotICAgICAicGFnZXJfY21kIiwgWyJj
YXQiLCAiY2F0ICIsICIgY2F0ICIsICJsZXNzIiwgIiBsZXNzIiwgIiBsZXNzICJdCi0gKQotQEAg
LTQ1Niw2ICs0NTYsNzUgQEAgZGVmIHRlc3RfZWNob192aWFfcGFnZXIobW9ua2V5cGF0Y2gsIGNh
cGZkLCBwYWdlcl9jbWQsIHRlc3QsIHRtcF9wYXRoKToKLSAgICAgKQotIAotIAotK0BweXRlc3Qu
bWFyay5za2lwaWYoV0lOLCByZWFzb249IkRpZmZlcmVudCBiZWhhdmlvciBvbiB3aW5kb3dzLiIp
Ci0rZGVmIHRlc3RfZWNob192aWFfcGFnZXJfeWllbGRzX2JlZm9yZV9leGNlcHRpb24obW9ua2V5
cGF0Y2gsIHRtcF9wYXRoKToKLSsgICAgIiIiQSBnZW5lcmF0b3IgdGhhdCB5aWVsZHMgdGhlbiBy
YWlzZXM6IGNsaWNrIHdyaXRlcyB0aGUgcGFydGlhbCBvdXRwdXQgdG8KLSsgICAgdGhlIHBhZ2Vy
IHN0cmVhbSBiZWZvcmUgcHJvcGFnYXRpbmcgdGhlIGV4Y2VwdGlvbi4KLSsKLSsgICAgVGhlIHBh
Z2VyIGZpbGUgY29udGVudCBpcyBpbnRlbnRpb25hbGx5IE5PVCBhc3NlcnRlZDogcGlwZS1kcmFp
biB0aW1pbmcKLSsgICAgYmV0d2VlbiBjbGljayBhbmQgdGhlIHBhZ2VyIHN1YnByb2Nlc3MgaXMg
b3V0c2lkZSBjbGljaydzIGNvbnRyb2wKLSsgICAgKCMyODk5LCAjMzQ3MCkuIFNweWluZyBvbiBg
YE1heWJlU3RyaXBBbnNpLndyaXRlYGAgcmVjb3JkcyB3aGF0IGNsaWNrIHNlbnQKLSsgICAgdG8g
dGhlIHBhZ2VyLCB3aGljaCBpcyBkZXRlcm1pbmlzdGljIHJlZ2FyZGxlc3Mgb2Ygc2NoZWR1bGlu
Zy4KLSsgICAgIiIiCi0rICAgIG1vbmtleXBhdGNoLnNldGl0ZW0ob3MuZW52aXJvbiwgIlBBR0VS
IiwgImNhdCIpCi0rICAgIG1vbmtleXBhdGNoLnNldGF0dHIoY2xpY2suX3Rlcm11aV9pbXBsLCAi
aXNhdHR5IiwgbGFtYmRhIHg6IFRydWUpCi0rCi0rICAgIHdyaXRlczogbGlzdFtzdHJdID0gW10K
LSsgICAgcmVhbF93cml0ZSA9IGNsaWNrLl90ZXJtdWlfaW1wbC5NYXliZVN0cmlwQW5zaS53cml0
ZQotKwotKyAgICBkZWYgc3B5KHNlbGYsIHRleHQpOgotKyAgICAgICAgd3JpdGVzLmFwcGVuZCh0
ZXh0KQotKyAgICAgICAgcmV0dXJuIHJlYWxfd3JpdGUoc2VsZiwgdGV4dCkKLSsKLSsgICAgbW9u
a2V5cGF0Y2guc2V0YXR0cihjbGljay5fdGVybXVpX2ltcGwuTWF5YmVTdHJpcEFuc2ksICJ3cml0
ZSIsIHNweSkKLSsKLSsgICAgcGFnZXJfb3V0X3RtcCA9IHRtcF9wYXRoIC8gInBhZ2VyX291dC50
eHQiCi0rICAgIHdpdGggKAotKyAgICAgICAgcGFnZXJfb3V0X3RtcC5vcGVuKCJ3IikgYXMgZiwK
LSsgICAgICAgIHBhdGNoLm9iamVjdChzdWJwcm9jZXNzLCAiUG9wZW4iLCBwYXJ0aWFsKHN1YnBy
b2Nlc3MuUG9wZW4sIHN0ZG91dD1mKSksCi0rICAgICAgICBweXRlc3QucmFpc2VzKFJ1bnRpbWVF
cnJvciwgbWF0Y2g9IlRoaXMgaXMgYSB0ZXN0LiIpLAotKyAgICApOgotKyAgICAgICAgY2xpY2su
ZWNob192aWFfcGFnZXIoX3Rlc3RfZ2VuX2Z1bmNfeWllbGRzX3RoZW5fZmFpbHMoKSkKLSsKLSsg
ICAgYXNzZXJ0ICIiLmpvaW4od3JpdGVzKSA9PSAidGVzdCIsICgKLSsgICAgICAgIGYiY2xpY2sg
c2hvdWxkIGhhdmUgd3JpdHRlbiB0aGUgeWllbGRlZCBjaHVuayBiZWZvcmUgZXhjZXB0aW9uLCBn
b3Qge3dyaXRlcyFyfSIKLSsgICAgKQotKwotKwotK0BweXRlc3QubWFyay5zdHJlc3MKLStAcHl0
ZXN0Lm1hcmsuc2tpcGlmKFdJTiwgcmVhc29uPSJEaWZmZXJlbnQgYmVoYXZpb3Igb24gd2luZG93
cy4iKQotK0BweXRlc3QubWFyay5wYXJhbWV0cml6ZSgiXyIsIHJhbmdlKDEwMDApKQotK2RlZiB0
ZXN0X3N0cmVzc19lY2hvX3ZpYV9wYWdlcl9leGNlcHRpb25fY2xlYW51cChfLCBtb25rZXlwYXRj
aCwgdG1wX3BhdGgpOgotKyAgICAiIiJSZXBlYXRlZCBleGNlcHRpb25zIGR1cmluZyBgYGVjaG9f
dmlhX3BhZ2VyYGAgbXVzdCBub3QgbGVhayBzdWJwcm9jZXNzZXMuCi0rCi0rICAgIFJlZ3Jlc3Np
b24gY292ZXJhZ2UgZm9yIHRoZSBjbGVhbnVwIHBhdGggaW4gYGBfcGlwZXBhZ2VyYGAncyBleGNl
cHRpb24KLSsgICAgaGFuZGxlciAoaXNzdWUgIzI4OTksIFBSICMzNDcwKS4gRWFjaCBpdGVyYXRp
b24gc3Bhd25zIGEgcmVhbCBwYWdlcgotKyAgICBzdWJwcm9jZXNzLCByYWlzZXMgYmVmb3JlIGFu
eSBkYXRhIGlzIHdyaXR0ZW4gYW5kIGNoZWNrIHRoZXJlIGlzIG5vIGxlYWsuCi0rICAgICIiIgot
KyAgICBtb25rZXlwYXRjaC5zZXRpdGVtKG9zLmVudmlyb24sICJQQUdFUiIsICJjYXQiKQotKyAg
ICBtb25rZXlwYXRjaC5zZXRhdHRyKGNsaWNrLl90ZXJtdWlfaW1wbCwgImlzYXR0eSIsIGxhbWJk
YSB4OiBUcnVlKQotKwotKyAgICBzcGF3bmVkOiBsaXN0W3N1YnByb2Nlc3MuUG9wZW5dID0gW10K
LSsgICAgcmVhbF9wb3BlbiA9IHN1YnByb2Nlc3MuUG9wZW4KLSsKLSsgICAgZGVmIHRyYWNraW5n
X3BvcGVuKCphcmdzLCAqKmt3YXJncyk6Ci0rICAgICAgICBwID0gcmVhbF9wb3BlbigqYXJncywg
Kiprd2FyZ3MpCi0rICAgICAgICBzcGF3bmVkLmFwcGVuZChwKQotKyAgICAgICAgcmV0dXJuIHAK
LSsKLSsgICAgcGFnZXJfb3V0X3RtcCA9IHRtcF9wYXRoIC8gInBhZ2VyX291dC50eHQiCi0rICAg
IHdpdGggKAotKyAgICAgICAgcGFnZXJfb3V0X3RtcC5vcGVuKCJ3IikgYXMgZiwKLSsgICAgICAg
IHBhdGNoLm9iamVjdChzdWJwcm9jZXNzLCAiUG9wZW4iLCBwYXJ0aWFsKHRyYWNraW5nX3BvcGVu
LCBzdGRvdXQ9ZikpLAotKyAgICAgICAgcHl0ZXN0LnJhaXNlcyhSdW50aW1lRXJyb3IpLAotKyAg
ICApOgotKyAgICAgICAgY2xpY2suZWNob192aWFfcGFnZXIoX3Rlc3RfZ2VuX2Z1bmNfZmFpbHMo
KSkKLSsKLSsgICAgYXNzZXJ0IHNwYXduZWQsICJwYWdlciBzdWJwcm9jZXNzIHdhcyBuZXZlciBz
dGFydGVkIgotKyAgICBmb3IgcCBpbiBzcGF3bmVkOgotKyAgICAgICAgYXNzZXJ0IHAucmV0dXJu
Y29kZSBpcyBub3QgTm9uZSwgInBhZ2VyIHN1YnByb2Nlc3Mgbm90IHJlYXBlZCIKLSsKLSsKLSBk
ZWYgdGVzdF9lY2hvX2NvbG9yX2ZsYWcobW9ua2V5cGF0Y2gsIGNhcGZkKToKLSAgICAgaXNhdHR5
ID0gVHJ1ZQotICAgICBtb25rZXlwYXRjaC5zZXRhdHRyKGNsaWNrLl9jb21wYXQsICJpc2F0dHki
LCBsYW1iZGEgeDogaXNhdHR5KQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNsaWNrL3B5dGVzdC1maXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2xpY2svcHl0ZXN0LWZpeC5wYXRjaAppbmRleCA2NjJhZDhhYWU5
Li5hYmZhMDcxMjBhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY2xpY2svcHl0ZXN0LWZpeC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY2xpY2svcHl0ZXN0LWZpeC5wYXRjaApAQCAtMSw0ICsxLDggQEAKLUZp
eCBhbiBlcnJvciB3aXRoIG5ld2VyIHZlcnNpb25zIG9mIHB5dGVzdCAoOS4xLjApIGJ5IGNvbnZl
cnRpbmcgdGhlIGdlbmVyYXRvciBpbnRvIGEgdHVwbGU6CitGcm9tIDFjZGJlOTgyOTk3M2EzMDAz
NzA3NWQ2MTNiNWExZDVhNDJlMjYwZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBS
aWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6
IE1vbiwgMTUgSnVuIDIwMjYgMTE6Mzc6MjggKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGFu
IGVycm9yIHdpdGggbmV3ZXIgdmVyc2lvbnMgb2YgcHl0ZXN0ICg5LjEuMCkgYnkKKyBjb252ZXJ0
aW5nIHRoZSBnZW5lcmF0b3IgaW50byBhIHR1cGxlOgogCiBFICAgcHl0ZXN0LlB5dGVzdFJlbW92
ZWRJbjEwV2FybmluZzogUGFzc2luZyBhIG5vbi1Db2xsZWN0aW9uIGl0ZXJhYmxlIHRvIHBhcmFt
ZXRyaXplIGlzIGRlcHJlY2F0ZWQuCiBFICAgVGVzdDogdGVzdHMvdGVzdF9iYXNpYy5weTo6dGVz
dF9ib29sZWFuX2NvbnZlcnNpb24sIGFyZ3ZhbHVlcyB0eXBlOiBjaGFpbgpAQCAtOSwxMiArMTMs
MTUgQEAgRVJST1I6IHRlc3RzL3Rlc3RfYmFzaWMucHk6dGVzdHMvdGVzdF9iYXNpYy5weQogU2ln
bmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20v
cGFsbGV0cy9jbGljay9wdWxsLzM1OTddCistLS0KKyB0ZXN0cy90ZXN0X2Jhc2ljLnB5IHwgNCAr
Ky0tCisgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAot
SW5kZXg6IGNsaWNrLTguMy4zL3Rlc3RzL3Rlc3RfYmFzaWMucHkKLT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBj
bGljay04LjMuMy5vcmlnL3Rlc3RzL3Rlc3RfYmFzaWMucHkKLSsrKyBjbGljay04LjMuMy90ZXN0
cy90ZXN0X2Jhc2ljLnB5Ci1AQCAtMjU4LDEwICsyNTgsMTAgQEAgZGVmIHRlc3RfYm9vbGVhbl9m
bGFnKHJ1bm5lciwgZGVmYXVsdCwgYQorZGlmZiAtLWdpdCBhL3Rlc3RzL3Rlc3RfYmFzaWMucHkg
Yi90ZXN0cy90ZXN0X2Jhc2ljLnB5CitpbmRleCAzNGQyMmU3Li44MDc2ZGQ4IDEwMDY0NAorLS0t
IGEvdGVzdHMvdGVzdF9iYXNpYy5weQorKysrIGIvdGVzdHMvdGVzdF9iYXNpYy5weQorQEAgLTI1
OCwxMCArMjU4LDEwIEBAIGRlZiB0ZXN0X2Jvb2xlYW5fZmxhZyhydW5uZXIsIGRlZmF1bHQsIGFy
Z3MsIGV4cGVjdCk6CiAgCiAgQHB5dGVzdC5tYXJrLnBhcmFtZXRyaXplKAogICAgICAoInZhbHVl
IiwgImV4cGVjdCIpLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWNsaWNrXzguNC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWNsaWNrXzguNC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjQuMS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguNC4yLmJiCmluZGV4
IDUzYzc1YzMzM2MuLmJiMDM1NzUzNTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jbGlja184LjQuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC40LjIuYmIKQEAgLTgsOSArOCw3IEBAIEhPTUVQQUdF
ID0gImh0dHA6Ly9jbGljay5wb2Nvby5vcmcvIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MWZhOTgyMzJmZDY0NTYw
ODkzN2EwZmRjODJlOTk5YjgiCiAKLVNSQ19VUkkgKz0gImZpbGU6Ly9weXRlc3QtZml4LnBhdGNo
IgotU1JDX1VSSSArPSAiZmlsZTovL2ZmY2M3NDk0Yzk5MWM5MTk3OTAyZmRmNDk5NWUxMWIyZGEz
ZTk3NjIucGF0Y2giCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTE4YjU2MzNlZGRmNmI0MWMzMmQ0
ZjQ1NGJmMGRlODEwMDY1Yzc0ZTNmN2RiZjhlZTU0NTJmOGJlODhkM2U5NiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI5YTZjZWE2ZTYwYjE3ZWJlMGE0NGM1Y2M2MzZkOTRmMDliZDY2MTQyYzFjZDdk
OGI0Y2Q3MzFjNDkxN2ExNWY2IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2ZsaXRfY29yZSBwdGVz
dC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============3948041183454656502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-click: PKGV changed from 8.4.1 [default] to 8.4.2 [default]
packages/x86-64-v3-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.4.1.tar.gz;downloadfilename=click-8.4.1.tar.gz file://pytest-fix.patch file://ffcc7494c991c9197902fdf4995e11b2da3e9762.patch" to "https://files.pythonhosted.org/packages/source/c/click/click-8.4.2.tar.gz;downloadfilename=click-8.4.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-click: PV changed from "8.4.1" to "8.4.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.4.1 [default] to 8.4.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PV changed from "8.4.1" to "8.4.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.4.1 [default] to 8.4.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PV changed from "8.4.1" to "8.4.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.4.1 [default] to 8.4.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PV changed from "8.4.1" to "8.4.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.4.1 [default] to 8.4.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PV changed from "8.4.1" to "8.4.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 625512 to 636658 (+2%)
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.4.1 [default] to 8.4.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PV changed from "8.4.1" to "8.4.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PKGV changed from 8.4.1 [default] to 8.4.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PV changed from "8.4.1" to "8.4.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.4.1 [default] to 8.4.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.4.1" to "8.4.2"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGSIZE changed from 972266 to 992944 (+2%)
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.4.1.dist-info -> /usr/lib/python3.14/site-packages/click-8.4.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/click-8.4.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.4.2.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGV changed from 8.4.1 [default] to 8.4.2 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click: PV changed from "8.4.1" to "8.4.2"
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.4.1.dist-info moved to /usr/lib/python3.14/site-packages/click-8.4.2.dist-info

--===============3948041183454656502==--

