Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F10CD6E79
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 21:54:44 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66355.1780955680563462550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 14:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=rlZcclyZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202606082154379a3fa2a15100020778-86nmmn@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202606082154379a3fa2a15100020778
        for <openembedded-core@lists.openembedded.org>;
        Mon, 08 Jun 2026 23:54:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mi1XNh6Loa6RuVxSvDMqBSS9dcWfHo9ep9U1BIFUKaw=;
 b=rlZcclyZRE2ez3fRBYu/11x03A9vD0dYbW9XE4oCk8urH1gQm3tE+HIRgNkz05IzmEeNRY
 dKD+mmxsQ68GF3HhWIITOq6TNl+9WDcPPoD0zWAYCMrWgaP4j/AfNm1h9zFTcJbI2j6rotQW
 5ehg5U+5FAH76L3bFEbMuu/9JVRIh/Dmr7rBArVbd5/nHb/8xP2dBQyfhdQPaddvLS6/z3o4
 U/gs9Ot2zn+c6ozAER2QUTnBKayI+Ksyd0anihsdXCSqzMneLXQXRkbMCzmb8SqwqeiFUEX0
 9mmxXtkfmTbYltH0QXv2tSCplVZ/qChVXJ+Lq3WdRnty6M4yCYk/U9PQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 1/6] python3: upgrade 3.14.4 -> 3.14.5
Date: Mon,  8 Jun 2026 23:53:44 +0200
Message-ID: <20260608215354.3664441-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 21:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238259

From: Peter Marko <peter.marko@siemens.com>

Release notes: [1] and [2].

Resolves following CVEs from reports:
* CVE-2026-1502
* CVE-2026-3087 (Windows specific)
* CVE-2026-3298 (Windows specific)
* CVE-2026-4786 (explicitly set, see Debian security tracker)
* CVE-2026-5713 (explicitly set, see Debian security tracker)
* CVE-2026-6019 (explicitly set, see Debian security tracker)
* CVE-2026-6100 (explicitly set, see Debian security tracker)
Also some security issues without CVE assignment.

Refresh patches.

[1] https://docs.python.org/3/whatsnew/changelog.html#python-3-14-5-final
[2] https://docs.python.org/3/whatsnew/changelog.html#python-3-14-5-release-candidate-1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 0df68073ebaecb968448dcf516b9085efadc6d29)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...01-Avoid-shebang-overflow-on-python-config.py.patch |  2 +-
 ....py-handle-stdin-I-O-errors-same-way-as-maste.patch |  2 +-
 ...e.pre-use-qemu-wrapper-when-gathering-profile.patch |  2 +-
 ...ailing-tests-due-to-load-variability-on-YP-AB.patch | 10 +++++-----
 .../0001-Skip-flaky-test_default_timeout-tests.patch   |  4 ++--
 ...-Update-test_sysconfig-for-posix_user-purelib.patch |  2 +-
 ...no_stdout_fileno-test-due-to-load-variability.patch |  2 +-
 ...01-test_active_children-skip-problematic-test.patch |  2 +-
 .../0001-test_cmd-skip-bang-completion-test.patch      |  2 +-
 ...-test_ctypes.test_find-skip-without-tools-sdk.patch |  2 +-
 ...test_locale.py-correct-the-test-output-format.patch |  2 +-
 ...test_only_active_thread-skip-problematic-test.patch |  2 +-
 ...repl-skip-test_unix_console.test_cursor_back_.patch |  2 +-
 .../0001-test_readline-skip-limited-history-test.patch |  6 +++---
 ...sconfig-skip-test_sysconfig.test_sysconfigdat.patch |  2 +-
 meta/recipes-devtools/python/python3/makerace.patch    |  2 +-
 .../python/{python3_3.14.4.bb => python3_3.14.5.bb}    |  8 ++++++--
 17 files changed, 29 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.4.bb => python3_3.14.5.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index eaf5ea5049..c2106f9437 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 9ec3a71..f7d5382 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2585,6 +2585,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2829,6 +2829,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 84ad2abb0b..d9072a36f7 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -32,7 +32,7 @@ diff --git a/Lib/pty.py b/Lib/pty.py
 index 1d97994..fa8821b 100644
 --- a/Lib/pty.py
 +++ b/Lib/pty.py
-@@ -178,7 +178,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
+@@ -149,7 +149,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
              i_buf = i_buf[n:]
  
          if stdin_avail and STDIN_FILENO in rfds:
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 39b62f6f26..e25797f57e 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 3bd4495f95b..8e8fc60bc76 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -751,8 +751,7 @@ profile-run-stamp:
+@@ -857,8 +857,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 4a35e8854e..a236268efb 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -30,7 +30,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index 9a72362c022..008e6a505a5 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -722,6 +722,7 @@ def test_close(self):
+@@ -774,6 +774,7 @@ class _TestProcess(BaseTestCase):
          close_queue(q)
  
      @support.requires_resource('walltime')
@@ -38,7 +38,7 @@ index 9a72362c022..008e6a505a5 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2345,6 +2346,7 @@ def _test_timeout_f(cls, barrier, results):
+@@ -2398,6 +2399,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -46,7 +46,7 @@ index 9a72362c022..008e6a505a5 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5459,6 +5461,7 @@ def signal_and_sleep(cls, sem, period):
+@@ -5550,6 +5552,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
      @support.requires_resource('walltime')
@@ -58,7 +58,7 @@ diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
 index 5312faa5077..36873d9a400 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -548,6 +548,7 @@ def test_monotonic(self):
+@@ -548,6 +548,7 @@ class TimeTestCase(unittest.TestCase):
      def test_perf_counter(self):
          time.perf_counter()
  
@@ -66,7 +66,7 @@ index 5312faa5077..36873d9a400 100644
      @unittest.skipIf(
          support.is_wasi, "process_time not available on WASI"
      )
-@@ -567,6 +568,7 @@ def test_process_time(self):
+@@ -567,6 +568,7 @@ class TimeTestCase(unittest.TestCase):
          self.assertTrue(info.monotonic)
          self.assertFalse(info.adjustable)
  
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch b/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
index 4e1bd833b4..d41037f9ea 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
@@ -27,7 +27,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index e8064e7..9ab1f9e 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -2259,6 +2259,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2424,6 +2424,7 @@ class _TestBarrier(BaseTestCase):
          """
          Test the barrier's default timeout
          """
@@ -39,7 +39,7 @@ diff --git a/Lib/test/lock_tests.py b/Lib/test/lock_tests.py
 index 8c8f890..43e9b90 100644
 --- a/Lib/test/lock_tests.py
 +++ b/Lib/test/lock_tests.py
-@@ -1165,6 +1165,7 @@ class BarrierTests(BaseTestCase):
+@@ -1215,6 +1215,7 @@ class BarrierTests(BaseTestCase):
          """
          Test the barrier's default timeout
          """
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index adaca4ff77..6a62c6dc5b 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -25,7 +25,7 @@ diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
 index 1ade492..4e94889 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -430,7 +430,7 @@ class TestSysConfig(unittest.TestCase):
+@@ -434,7 +434,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index 9bc8b091cc..b186bdcb88 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -19,7 +19,7 @@ diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
 index c5394de..ed17fb6 100644
 --- a/Lib/test/test_builtin.py
 +++ b/Lib/test/test_builtin.py
-@@ -2474,6 +2474,7 @@ class PtyTests(unittest.TestCase):
+@@ -2738,6 +2738,7 @@ class PtyTests(unittest.TestCase):
                           "byte 0xe9 in position 4: ordinal not in "
                           "range(128)")
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
index 80aa29faf0..d7202aa575 100644
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -21,7 +21,7 @@ diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.
 index 008e6a505a5..746de8945f0 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -615,6 +615,7 @@ def test_cpu_count(self):
+@@ -667,6 +667,7 @@ class _TestProcess(BaseTestCase):
          self.assertIsInstance(cpus, int)
          self.assertGreaterEqual(cpus, 1)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch b/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
index d339e8c198..f1ba044cc3 100644
--- a/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
@@ -18,7 +18,7 @@ diff --git a/Lib/test/test_cmd.py b/Lib/test/test_cmd.py
 index dbfec42fc21..c33dab8d10d 100644
 --- a/Lib/test/test_cmd.py
 +++ b/Lib/test/test_cmd.py
-@@ -295,6 +295,7 @@ def do_tab_completion_test(self, args):
+@@ -295,6 +295,7 @@ class CmdTestReadline(unittest.TestCase):
          self.assertIn(b'ab_completion_test', output)
          self.assertIn(b'tab completion success', output)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index 68e277d662..cdcd9302d6 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -18,7 +18,7 @@ diff --git a/Lib/test/test_ctypes/test_find.py b/Lib/test/test_ctypes/test_find.
 index 85b2861..b033203 100644
 --- a/Lib/test/test_ctypes/test_find.py
 +++ b/Lib/test/test_ctypes/test_find.py
-@@ -116,10 +116,12 @@ class FindLibraryLinux(unittest.TestCase):
+@@ -117,10 +117,12 @@ class FindLibraryLinux(unittest.TestCase):
                  # LD_LIBRARY_PATH)
                  self.assertEqual(find_library(libname), 'lib%s.so' % libname)
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index 189246911b..201271b0c0 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -34,7 +34,7 @@ diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
 index da4bd79..fd9e67d 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -501,7 +501,7 @@ class TestRealLocales(unittest.TestCase):
+@@ -500,7 +500,7 @@ class TestRealLocales(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
index 4886b7e386..bc436e077a 100644
--- a/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
@@ -17,7 +17,7 @@ diff --git a/Lib/test/test_external_inspection.py b/Lib/test/test_external_inspe
 index a709b837161..7a87092c10e 100644
 --- a/Lib/test/test_external_inspection.py
 +++ b/Lib/test/test_external_inspection.py
-@@ -1111,6 +1111,7 @@ def test_self_trace(self):
+@@ -1154,6 +1154,7 @@ class TestGetStackTrace(unittest.TestCase):
              ],
          )
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch b/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
index e886c046cb..97f7871266 100644
--- a/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
@@ -33,7 +33,7 @@ diff --git a/Lib/test/test_pyrepl/test_unix_console.py b/Lib/test/test_pyrepl/te
 index 3b0d2637dab..5a3c8952f61 100644
 --- a/Lib/test/test_pyrepl/test_unix_console.py
 +++ b/Lib/test/test_pyrepl/test_unix_console.py
-@@ -172,6 +172,7 @@ def test_cursor_up_down(self, _os_write):
+@@ -186,6 +186,7 @@ class TestConsole(TestCase):
          _os_write.assert_any_call(ANY, TERM_CAPABILITIES["cud"] + b":1")
          con.restore()
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
index a619d51c10..c59c6672e0 100644
--- a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -20,7 +20,7 @@ diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
 index 537a9fb..ddf0323 100644
 --- a/Lib/test/test_readline.py
 +++ b/Lib/test/test_readline.py
-@@ -71,6 +71,7 @@ class TestHistoryManipulation (unittest.TestCase):
+@@ -74,6 +74,7 @@ class TestHistoryManipulation (unittest.TestCase):
  
      @unittest.skipUnless(hasattr(readline, "append_history_file"),
                           "append_history not available")
@@ -28,7 +28,7 @@ index 537a9fb..ddf0323 100644
      def test_write_read_append(self):
          hfile = tempfile.NamedTemporaryFile(delete=False)
          hfile.close()
-@@ -142,6 +143,7 @@ class TestHistoryManipulation (unittest.TestCase):
+@@ -145,6 +146,7 @@ class TestHistoryManipulation (unittest.TestCase):
          self.assertEqual(readline.get_history_item(1), "entrée 1")
          self.assertEqual(readline.get_history_item(2), "entrée 22")
  
@@ -36,7 +36,7 @@ index 537a9fb..ddf0323 100644
      def test_write_read_limited_history(self):
          previous_length = readline.get_history_length()
          self.addCleanup(readline.set_history_length, previous_length)
-@@ -390,6 +392,7 @@ readline.write_history_file(history_file)
+@@ -393,6 +395,7 @@ readline.write_history_file(history_file)
          self.assertIn(b"done", output)
  
  
diff --git a/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch b/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
index 0fe9399bf1..6dfba59a44 100644
--- a/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
@@ -19,7 +19,7 @@ diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
 index 09eff11179e..14fcdedccba 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -685,6 +685,7 @@ def test_makefile_overwrites_config_vars(self):
+@@ -689,6 +689,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
          self.assertNotEqual(data['prefix'], data['base_prefix'])
          self.assertNotEqual(data['exec_prefix'], data['base_exec_prefix'])
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index bf73135e09..b29ea56cc3 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index be1b9ea..9ec3a71 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2492,7 +2492,7 @@ COMPILEALL_OPTS=-j0
+@@ -2735,7 +2735,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.14.4.bb b/meta/recipes-devtools/python/python3_3.14.5.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.14.4.bb
rename to meta/recipes-devtools/python/python3_3.14.5.bb
index 71f590f630..b5c1d6fb3e 100644
--- a/meta/recipes-devtools/python/python3_3.14.4.bb
+++ b/meta/recipes-devtools/python/python3_3.14.5.bb
@@ -40,8 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b"
-SRC_URI[sha256sum] = "d923c51303e38e249136fc1bdf3568d56ecb03214efdef48516176d3d7faaef8"
+SRC_URI[sha256sum] = "7e32597b99e5d9a39abed35de4693fa169df3e5850d4c334337ffd6a19a36db6"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -522,3 +521,8 @@ SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
 	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
 }
+
+CVE_STATUS[CVE-2026-4786] = "cpe-stable-backport: backported to v3.14.5"
+CVE_STATUS[CVE-2026-5713] = "cpe-stable-backport: backported to v3.14.5"
+CVE_STATUS[CVE-2026-6019] = "cpe-stable-backport: backported to v3.14.5"
+CVE_STATUS[CVE-2026-6100] = "cpe-stable-backport: backported to v3.14.5"

