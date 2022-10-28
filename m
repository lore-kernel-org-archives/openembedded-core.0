Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E76DFA3741
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 02:01:13 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.1758.1666922468026045474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 19:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fdk6jqLX;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bj12so9638806ejb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 19:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a8629lFt16loQrpV3UcUX6yhiDdJnag5rIHGg3u7gfQ=;
        b=Fdk6jqLXGd+JumaLgSRne6L6UBh45NR5w/dvV5XyulT1Llg/VD0fVhX+h6orO3JIWn
         205C9mIyzEoUq0oTGhSKlnJ0etS5bfrMtr1flfX0K+Mr8x5BeaTG6/G6+moA+/KI7SR3
         ffVbMmBrOJn6NEceHXG4LOAMgYVJvzdTf6UmJ+aHFMxMdIwMpNwwMaYSl8gHK7faCMXS
         DpT0PuBEv7270gAvGB+xD6OyDWJzFrLVgulrql7PjwpMnwGlosc2ero1hoa1UCVI/4zP
         qV7T0Jvh82YNG9pYePuhT+tl1mqpP6+BCpcNFxpe/gIVLxQ8zO1UJLBxFSlAcgW5Wl8E
         yQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8629lFt16loQrpV3UcUX6yhiDdJnag5rIHGg3u7gfQ=;
        b=6BuH3rwIpoeAdwGaKEW/sJ/de1Z4fQfzokDqlhJ8Ix4xxtvgtO/xOujtmhXE9Yqo/L
         tsEgY+x5Vzh2zJROZA1G866or6KCy+9WhMCtUQzjGtmxirxJEaVJkpF2UR1ZYb5pNVxT
         jby1M5oScxHEYPdF4K3exTl1TfkaWDykhkswwxA7yoHoF7/5ccHS0xiQ7xjRBtPLwn+Q
         ql7O5oKpaRYj3tuIhx1oE5qswp1v0BL09A+f7V+qYl1WML2+8lPXGLH3bcfZlwqGBbU5
         UhVKZTJdq/HZczacTFsWfe1U1SxXtZugLL4TnGSwPResAp8UMaZmKRL3me1MrkVfHVxr
         d2Nw==
X-Gm-Message-State: ACrzQf1zjvWwZadlO7Wyaof+VD5H3ILfeH3DljwCY6L6htPDGBinm3TV
	QMx+jmmbZyXUAXIk4VJ4R4a3NJBfthaivBCanVA=
X-Google-Smtp-Source: AMsMyM6DKjUC8bee+8dLH51P2PhdGb26/6FxZ/oqZl1wWA9SUK96V7r3ooZwuRGUaq46e3laRNaacJro3zG6TKPoROI=
X-Received: by 2002:a17:907:7704:b0:780:da38:4480 with SMTP id
 kw4-20020a170907770400b00780da384480mr45009780ejc.64.1666922466187; Thu, 27
 Oct 2022 19:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221027201611.3644334-1-alex@linutronix.de> <20221027201611.3644334-23-alex@linutronix.de>
In-Reply-To: <20221027201611.3644334-23-alex@linutronix.de>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 27 Oct 2022 19:00:55 -0700
Message-ID: <CANx9H-ARZ-rGZWPq9NLPJw7fv9OKEvdxMkbvU1aTM3oO+PLebA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/23] python3: update 3.10.6 -> 3.11.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000771f5a05ec0ea19e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 02:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172232

--000000000000771f5a05ec0ea19e
Content-Type: text/plain; charset="UTF-8"

Yes please. I will help with any breakage on the AB.
Thank you Alex!

On Thu, Oct 27, 2022 at 1:16 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> The semaphore fix has landed and is available from 3.11 onwards:
>
> https://github.com/python/cpython/commit/1ee0f94d16f150356a4b9b0a39d44ba1d2d5b9fc
>
> Drop 0001-Mitigate-the-race-condition-in-testSockName.patch
> as it is merged upstream.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-recipe/python3-dir.bbclass       |  2 +-
>  ...ib-termcap-to-linker-flags-to-avoid-.patch |  8 ++--
>  ...-search-system-for-headers-libraries.patch |  6 +--
>  ...-use-prefix-value-from-build-configu.patch | 14 +++---
>  ...e-the-race-condition-in-testSockName.patch | 47 -------------------
>  ...sts-due-to-load-variability-on-YP-AB.patch | 18 +++----
>  ...FLAG_REF-always-for-interned-strings.patch | 33 -------------
>  ...-detection-of-mips-architecture-for-.patch | 33 ++++++++++---
>  ...fig-append-STAGING_LIBDIR-python-sys.patch |  6 +--
>  ...asename-to-replace-CC-for-checking-c.patch | 44 ++++++++---------
>  ...tutils-prefix-is-inside-staging-area.patch | 10 ++--
>  .../python3/avoid_warning_about_tkinter.patch | 21 ++++-----
>  .../python/python3/crosspythonpath.patch      | 22 ++++-----
>  .../python/python3/makerace.patch             | 10 ++--
>  .../{python3_3.10.6.bb => python3_3.11.0.bb}  | 11 ++---
>  15 files changed, 111 insertions(+), 174 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
>  rename meta/recipes-devtools/python/{python3_3.10.6.bb =>
> python3_3.11.0.bb} (98%)
>
> diff --git a/meta/classes-recipe/python3-dir.bbclass
> b/meta/classes-recipe/python3-dir.bbclass
> index 912c67253c..d93d337f76 100644
> --- a/meta/classes-recipe/python3-dir.bbclass
> +++ b/meta/classes-recipe/python3-dir.bbclass
> @@ -4,7 +4,7 @@
>  # SPDX-License-Identifier: MIT
>  #
>
> -PYTHON_BASEVERSION = "3.10"
> +PYTHON_BASEVERSION = "3.11"
>  PYTHON_ABI = ""
>  PYTHON_DIR = "python${PYTHON_BASEVERSION}"
>  PYTHON_PN = "python3"
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> index 62ef6efc28..16a4185704 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
> @@ -1,4 +1,4 @@
> -From 80f872e4573f542d33f91514538755557d566f79 Mon Sep 17 00:00:00 2001
> +From 93ae2ed3fc8be0245e35063c4f63626792f4cd0c Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 25 Jan 2019 19:04:13 +0100
>  Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid host
> @@ -12,14 +12,14 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   1 file changed, 1 deletion(-)
>
>  diff --git a/setup.py b/setup.py
> -index 43e807f..11b5cf5 100644
> +index 15d0d45..37ed244 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1149,7 +1149,6 @@ class PyBuildExt(build_ext):
> +@@ -1109,7 +1109,6 @@ class PyBuildExt(build_ext):
>                                                        'termcap'):
>                   readline_libs.append('termcap')
>               self.add(Extension('readline', ['readline.c'],
>  -                               library_dirs=['/usr/lib/termcap'],
> -                                extra_link_args=readline_extra_link_args,
>                                  libraries=readline_libs))
>           else:
> +             self.missing.append('readline')
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> index c790c7b886..d6d9e451ff 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
> @@ -1,4 +1,4 @@
> -From 7589ab03ad3f7cb4bb092c31273ff22371ac77e4 Mon Sep 17 00:00:00 2001
> +From 910a905aaeb6edb6b042ef65b3e2b73faada80aa Mon Sep 17 00:00:00 2001
>  From: Jeremy Puhlman <jpuhlman@mvista.com>
>  Date: Wed, 4 Mar 2020 00:06:42 +0000
>  Subject: [PATCH] Don't search system for headers/libraries
> @@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/setup.py b/setup.py
> -index c3a6b5e..c892537 100644
> +index f29ac86..930cb20 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -856,8 +856,8 @@ class PyBuildExt(build_ext):
> +@@ -877,8 +877,8 @@ class PyBuildExt(build_ext):
>               add_dir_to_list(self.compiler.include_dirs,
>                               sysconfig.get_config_var("INCLUDEDIR"))
>
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> index 641017edd5..2f519e4917 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
> @@ -1,4 +1,4 @@
> -From d82cb96eed1098920ad3cdcb36feb32137618066 Mon Sep 17 00:00:00 2001
> +From 05d676ddf675d9c8229b723e64717aa485d6809e Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Fri, 10 Sep 2021 12:28:31 +0200
>  Subject: [PATCH] Lib/sysconfig.py: use prefix value from build
> configuration
> @@ -15,11 +15,11 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   1 file changed, 5 insertions(+)
>
>  diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> -index e64bcdc..40c6b3e 100644
> +index 93c6f73..ff399e2 100644
>  --- a/Lib/sysconfig.py
>  +++ b/Lib/sysconfig.py
> -@@ -613,6 +613,11 @@ def get_config_vars(*args):
> -             _init_non_posix(_CONFIG_VARS)
> +@@ -668,6 +668,11 @@ def get_config_vars(*args):
> +             _CONFIG_VARS['VPATH'] = sys._vpath
>           if os.name == 'posix':
>               _init_posix(_CONFIG_VARS)
>  +        _CONFIG_VARS['installed_base'] = _CONFIG_VARS['prefix']
> @@ -27,6 +27,6 @@ index e64bcdc..40c6b3e 100644
>  +        _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
>  +        _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
>  +        _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
> -         # For backward compatibility, see issue19555
> -         SO = _CONFIG_VARS.get('EXT_SUFFIX')
> -         if SO is not None:
> +         if _HAS_USER_BASE:
> +             # Setting 'userbase' is done below the call to the
> +             # init function to enable using 'get_config_var' in
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
> b/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
> deleted file mode 100644
> index e19df08f87..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From 8103b90148e8768456c3ab707de105d63d9d5b20 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@arm.com>
> -Date: Fri, 17 Jun 2022 11:53:59 +0100
> -Subject: [PATCH] Mitigate the race condition in testSockName
> -
> -find_unused_port() has an inherent race condition, but we can't use
> -bind_port() as that uses .getsockname() which this test is exercising.
> -
> -Try binding to unused ports a few times before failing.
> ----
> - Lib/test/test_socket.py | 15 +++++++++++++--
> - 1 file changed, 13 insertions(+), 2 deletions(-)
> -
> -diff --git a/Lib/test/test_socket.py b/Lib/test/test_socket.py
> -index c981903824..b1630d18b6 100644
> ---- a/Lib/test/test_socket.py
> -+++ b/Lib/test/test_socket.py
> -@@ -1390,10 +1390,21 @@ def testStringToIPv6(self):
> -
> -     def testSockName(self):
> -         # Testing getsockname()
> --        port = socket_helper.find_unused_port()
> -         sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> -         self.addCleanup(sock.close)
> --        sock.bind(("0.0.0.0", port))
> -+
> -+        # Since find_unused_port() is inherently subject to race
> conditions, we
> -+        # call it a couple times if necessary.
> -+        for i in itertools.count():
> -+            port = socket_helper.find_unused_port()
> -+            try:
> -+                sock.bind(("0.0.0.0", port))
> -+            except OSError as e:
> -+                if e.errno != errno.EADDRINUSE or i == 5:
> -+                    raise
> -+            else:
> -+                break
> -+
> -         name = sock.getsockname()
> -         # XXX(nnorwitz): http://tinyurl.com/os5jz seems to indicate
> -         # it reasonable to get the host's addr in addition to 0.0.0.0.
> ---
> -2.25.1
> -
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
> b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
> index 96c5a3c840..61dd4a5bc0 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
> @@ -1,4 +1,4 @@
> -From 7171aeee22a0b7ab57cdf3d1ae15530549f8f92a Mon Sep 17 00:00:00 2001
> +From 01e02fb4720ecbbc44c694ee1b7fb6d5d95b5fe2 Mon Sep 17 00:00:00 2001
>  From: Yi Fan Yu <yifan.yu@windriver.com>
>  Date: Thu, 1 Apr 2021 13:08:37 -0700
>  Subject: [PATCH] Skip failing tests due to load variability on YP AB
> @@ -17,10 +17,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>   2 files changed, 3 insertions(+)
>
>  diff --git a/Lib/test/_test_multiprocessing.py
> b/Lib/test/_test_multiprocessing.py
> -index 3bc5b8f..a6e106d 100644
> +index 599c3f2..23328be 100644
>  --- a/Lib/test/_test_multiprocessing.py
>  +++ b/Lib/test/_test_multiprocessing.py
> -@@ -568,6 +568,7 @@ class _TestProcess(BaseTestCase):
> +@@ -618,6 +618,7 @@ class _TestProcess(BaseTestCase):
>
>           close_queue(q)
>
> @@ -28,7 +28,7 @@ index 3bc5b8f..a6e106d 100644
>       def test_many_processes(self):
>           if self.TYPE == 'threads':
>               self.skipTest('test not appropriate for
> {}'.format(self.TYPE))
> -@@ -4817,6 +4818,7 @@ class TestWait(unittest.TestCase):
> +@@ -4890,6 +4891,7 @@ class TestWait(unittest.TestCase):
>           sem.release()
>           time.sleep(period)
>
> @@ -37,13 +37,13 @@ index 3bc5b8f..a6e106d 100644
>           from multiprocessing.connection import wait
>
>  diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
> -index 875615a..aebaa8c 100644
> +index 884b142..542e980 100644
>  --- a/Lib/test/test_time.py
>  +++ b/Lib/test/test_time.py
> -@@ -474,6 +474,7 @@ class TimeTestCase(unittest.TestCase):
> -     def test_perf_counter(self):
> -         time.perf_counter()
> -
> +@@ -492,6 +492,7 @@ class TimeTestCase(unittest.TestCase):
> +     @unittest.skipIf(
> +         support.is_wasi, "process_time not available on WASI"
> +     )
>  +    @unittest.skip('timing related test, dependent on load')
>       def test_process_time(self):
>           # process_time() should not include time spend during a sleep
> diff --git
> a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> b/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> deleted file mode 100644
> index 993ac243fc..0000000000
> ---
> a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-interned-strings.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From d7217b79a4e125d4fcc1087743171b94d91d1121 Mon Sep 17 00:00:00 2001
> -From: Inada Naoki <songofacandy@gmail.com>
> -Date: Sat, 14 Jul 2018 00:46:11 +0900
> -Subject: [PATCH] Use FLAG_REF always for interned strings
> -
> -Upstream-Status: Submitted [https://github.com/python/cpython/pull/8226]
> -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> -
> ----
> - Python/marshal.c | 9 +++++++--
> - 1 file changed, 7 insertions(+), 2 deletions(-)
> -
> -diff --git a/Python/marshal.c b/Python/marshal.c
> -index 4125240..341c9aa 100644
> ---- a/Python/marshal.c
> -+++ b/Python/marshal.c
> -@@ -298,9 +298,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)
> -     if (p->version < 3 || p->hashtable == NULL)
> -         return 0; /* not writing object references */
> -
> --    /* if it has only one reference, it definitely isn't shared */
> --    if (Py_REFCNT(v) == 1)
> -+    /* If it has only one reference, it definitely isn't shared.
> -+     * But we use TYPE_REF always for interned string, to PYC file stable
> -+     * as possible.
> -+     */
> -+    if (Py_REFCNT(v) == 1 &&
> -+            !(PyUnicode_CheckExact(v) && PyUnicode_CHECK_INTERNED(v))) {
> -         return 0;
> -+    }
> -
> -     entry = _Py_hashtable_get_entry(p->hashtable, v);
> -     if (entry != NULL) {
> diff --git
> a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> index 6ab335a405..f303eb35dc 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> @@ -1,4 +1,4 @@
> -From bb409432f03dd8256865292e382ad16613737829 Mon Sep 17 00:00:00 2001
> +From d2abe7328cea770425405aa0da2f4c2dac89fcad Mon Sep 17 00:00:00 2001
>  From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>  Date: Fri, 31 May 2019 15:34:34 +0200
>  Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
> @@ -15,19 +15,19 @@ Upstream-Status: Submitted [
> https://github.com/python/cpython/pull/13196]
>  Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>
>  ---
> - configure.ac | 175 +++++++--------------------------------------------
> - 1 file changed, 21 insertions(+), 154 deletions(-)
> + configure.ac | 196 ++++++---------------------------------------------
> + 1 file changed, 21 insertions(+), 175 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 4230ef2..ee08b1b 100644
> +index 358b6ea..085fc0b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -718,160 +718,27 @@ then
> +@@ -907,181 +907,27 @@ then
>   fi
>
>
>  -AC_MSG_CHECKING([for the platform triplet based on compiler
> characteristics])
> --cat >> conftest.c <<EOF
> +-cat > conftest.c <<EOF
>  -#undef bfin
>  -#undef cris
>  -#undef fr30
> @@ -167,6 +167,22 @@ index 4230ef2..ee08b1b 100644
>  -        darwin
>  -#elif defined(__VXWORKS__)
>  -        vxworks
> +-#elif defined(__wasm32__)
> +-#  if defined(__EMSCRIPTEN__)
> +-      wasm32-emscripten
> +-#  elif defined(__wasi__)
> +-      wasm32-wasi
> +-#  else
> +-#    error unknown wasm32 platform
> +-#  endif
> +-#elif defined(__wasm64__)
> +-#  if defined(__EMSCRIPTEN)
> +-      wasm64-emscripten
> +-#  elif defined(__wasi__)
> +-      wasm64-wasi
> +-#  else
> +-#    error unknown wasm64 platform
> +-#  endif
>  -#else
>  -# error unknown platform triplet
>  -#endif
> @@ -175,6 +191,11 @@ index 4230ef2..ee08b1b 100644
>  -
>  -if $CPP $CPPFLAGS conftest.c >conftest.out 2>/dev/null; then
>  -  PLATFORM_TRIPLET=`grep -v '^#' conftest.out | grep -v '^ *$' | tr -d
> '      '`
> +-  case "$build_os" in
> +-  linux-musl*)
> +-    PLATFORM_TRIPLET=`echo "$PLATFORM_TRIPLET" | sed
> 's/linux-gnu/linux-musl/'`
> +-    ;;
> +-  esac
>  -  AC_MSG_RESULT([$PLATFORM_TRIPLET])
>  -else
>  -  AC_MSG_RESULT([none])
> diff --git
> a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> index 368a725ff7..45a37ed1a9 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> @@ -1,4 +1,4 @@
> -From c24674e0a52367359a1a3d950bab8bc3d282279b Mon Sep 17 00:00:00 2001
> +From 9c6b9f46179c8f9c9391767e2b02f268a1ee7a9c Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 31 Jan 2019 16:46:30 +0100
>  Subject: [PATCH] distutils/sysconfig: append
> @@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   1 file changed, 2 insertions(+)
>
>  diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> -index 40c6b3e..ac94cc7 100644
> +index ff399e2..95844cf 100644
>  --- a/Lib/sysconfig.py
>  +++ b/Lib/sysconfig.py
> -@@ -474,6 +474,8 @@ def _init_posix(vars):
> +@@ -528,6 +528,8 @@ def _init_posix(vars):
>       """Initialize the module as appropriate for POSIX systems."""
>       # _sysconfigdata is generated at build time, see
> _generate_posix_vars()
>       name = _get_sysconfigdata_name()
> diff --git
> a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> index 2c7d264da0..4d589dd759 100644
> ---
> a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> +++
> b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
> @@ -1,4 +1,4 @@
> -From 9f68a27eb34394a00f1011c06900c609f15fb15c Mon Sep 17 00:00:00 2001
> +From 175ed10e0a59a5395546ef88702f23d100b909f9 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Mon, 22 Oct 2018 15:19:51 +0800
>  Subject: [PATCH] python3: use cc_basename to replace CC for checking
> compiler
> @@ -27,18 +27,18 @@ Signed-off-by: Changqing Li <
> changqing.li@windriver.com>
>   1 file changed, 10 insertions(+), 9 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 0c06914..299786b 100644
> +index 77fb609..358b6ea 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -61,6 +61,7 @@ AC_CONFIG_HEADER(pyconfig.h)
> +@@ -134,6 +134,7 @@ AC_CONFIG_HEADERS([pyconfig.h])
>   AC_CANONICAL_HOST
>   AC_SUBST(build)
>   AC_SUBST(host)
>  +LT_INIT
>
> - # pybuilddir.txt will be created by --generate-posix-vars in the Makefile
> - rm -f pybuilddir.txt
> -@@ -688,7 +689,7 @@ AC_MSG_RESULT($with_cxx_main)
> + AS_VAR_IF([cross_compiling], [maybe],
> +  [AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and
> --build=ARCH])]
> +@@ -877,7 +878,7 @@ AC_MSG_RESULT($with_cxx_main)
>   preset_cxx="$CXX"
>   if test -z "$CXX"
>   then
> @@ -47,7 +47,7 @@ index 0c06914..299786b 100644
>           gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
>           cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
>           clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++],
> [notfound]) ;;
> -@@ -976,7 +977,7 @@ rmdir CaseSensitiveTestDir
> +@@ -1290,7 +1291,7 @@ rmdir CaseSensitiveTestDir
>
>   case $ac_sys_system in
>   hp*|HP*)
> @@ -56,16 +56,16 @@ index 0c06914..299786b 100644
>       cc|*/cc) CC="$CC -Ae";;
>       esac;;
>   esac
> -@@ -1374,7 +1375,7 @@ else
> - fi],
> +@@ -1798,7 +1799,7 @@ esac
> + ],
>   [AC_MSG_RESULT(no)])
>   if test "$Py_LTO" = 'true' ; then
>  -  case $CC in
>  +  case $cc_basename in
>       *clang*)
> -       AC_SUBST(LLVM_AR)
> -       AC_PATH_TOOL(LLVM_AR, llvm-ar, '', ${llvm_path})
> -@@ -1467,7 +1468,7 @@ then
> +       dnl flag to disable lto during linking
> +       LDFLAGS_NOLTO="-fno-lto"
> +@@ -1917,7 +1918,7 @@ then
>     fi
>   fi
>   LLVM_PROF_ERR=no
> @@ -74,7 +74,7 @@ index 0c06914..299786b 100644
>     *clang*)
>       # Any changes made here should be reflected in the GCC+Darwin case
> below
>       PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
> -@@ -1528,7 +1529,7 @@ esac
> +@@ -1978,7 +1979,7 @@ esac
>   # compiler and platform.  BASECFLAGS tweaks need to be made even if the
>   # user set OPT.
>
> @@ -83,16 +83,16 @@ index 0c06914..299786b 100644
>       *clang*)
>           cc_is_clang=1
>           ;;
> -@@ -1664,7 +1665,7 @@ yes)
> +@@ -2197,7 +2198,7 @@ yes)
>
>       # ICC doesn't recognize the option, but only emits a warning
>       ## XXX does it emit an unused result warning and can it be disabled?
> --    case "$CC" in
> -+    case "$cc_basename" in
> -     *icc*)
> -     ac_cv_disable_unused_result_warning=no
> -     ;;
> -@@ -2018,7 +2019,7 @@ yes)
> +-    AS_CASE([$CC],
> ++    AS_CASE([$cc_basename],
> +             [*icc*], [ac_cv_disable_unused_result_warning=no]
> +             [PY_CHECK_CC_WARNING([disable], [unused-result])])
> +     AS_VAR_IF([ac_cv_disable_unused_result_warning], [yes],
> +@@ -2439,7 +2440,7 @@ yes)
>       ;;
>   esac
>
> @@ -101,7 +101,7 @@ index 0c06914..299786b 100644
>   *icc*)
>       # ICC needs -fp-model strict or floats behave badly
>       CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
> -@@ -2836,7 +2837,7 @@ then
> +@@ -3281,7 +3282,7 @@ then
>                 then
>                         LINKFORSHARED="-Wl,--export-dynamic"
>                 fi;;
> @@ -110,7 +110,7 @@ index 0c06914..299786b 100644
>                   *gcc*)
>                     if $CC -Xlinker --help 2>&1 | grep export-dynamic
> >/dev/null
>                     then
> -@@ -5622,7 +5623,7 @@ if test "$have_gcc_asm_for_x87" = yes; then
> +@@ -6370,7 +6371,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
>       # Some versions of gcc miscompile inline asm:
>       # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
>       # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
> diff --git
> a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> index a06e9b56c1..7b497b83ca 100644
> ---
> a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> +++
> b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
> @@ -1,4 +1,4 @@
> -From 1cc4cab8d579bbccb8a4fc13a28158a58c603cb4 Mon Sep 17 00:00:00 2001
> +From 2918d431cb5607933755fc80a6220135dd7fcb1d Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Tue, 14 May 2013 15:00:26 -0700
>  Subject: [PATCH] python3: Add target and native recipes
> @@ -18,10 +18,10 @@ Signed-off-by: Alejandro Hernandez <
> alejandro.hernandez@linux.intel.com>
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
>  diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
> -index 3414a76..361d3a1 100644
> +index 03b8558..57d193d 100644
>  --- a/Lib/distutils/sysconfig.py
>  +++ b/Lib/distutils/sysconfig.py
> -@@ -277,7 +277,9 @@ def get_python_inc(plat_specific=0, prefix=None):
> +@@ -272,7 +272,9 @@ def get_python_inc(plat_specific=0, prefix=None):
>       If 'prefix' is supplied, use it instead of sys.base_prefix or
>       sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
>       """
> @@ -32,7 +32,7 @@ index 3414a76..361d3a1 100644
>           prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
>       if os.name == "posix":
>           if python_build:
> -@@ -320,7 +322,13 @@ def get_python_lib(plat_specific=0, standard_lib=0,
> prefix=None):
> +@@ -315,7 +317,13 @@ def get_python_lib(plat_specific=0, standard_lib=0,
> prefix=None):
>       If 'prefix' is supplied, use it instead of sys.base_prefix or
>       sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
>       """
> @@ -47,7 +47,7 @@ index 3414a76..361d3a1 100644
>           if standard_lib:
>               prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
>           else:
> -@@ -334,7 +342,7 @@ def get_python_lib(plat_specific=0, standard_lib=0,
> prefix=None):
> +@@ -329,7 +337,7 @@ def get_python_lib(plat_specific=0, standard_lib=0,
> prefix=None):
>           else:
>               # Pure Python
>               libdir = "lib"
> diff --git
> a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> index 2de72b7199..5a6cfc9572 100644
> ---
> a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> +++
> b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
> @@ -1,4 +1,4 @@
> -From 6a23d52c905cd1f6a5944255903ec86ea8b904bb Mon Sep 17 00:00:00 2001
> +From 627b8fe6b3c11e8bb1bb1ad1d6b816b79b8dd2ce Mon Sep 17 00:00:00 2001
>  From: Andrei Gherzan <andrei@gherzan.ro>
>  Date: Mon, 28 Jan 2019 15:57:54 +0000
>  Subject: [PATCH] _tkinter module needs tk module along with tcl. tk is
> not yet
> @@ -9,23 +9,22 @@ Upstream-Status: Inappropriate [distribution]
>
>  Also simply disable the tk module since its not in DEPENDS.
>  Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> -
>  ---
> - setup.py | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> + setup.py | 1 -
> + 1 file changed, 1 deletion(-)
>
>  diff --git a/setup.py b/setup.py
> -index 11b5cf5..2be4738 100644
> +index 7555dcd..f29ac86 100644
>  --- a/setup.py
>  +++ b/setup.py
> -@@ -1895,8 +1895,8 @@ class PyBuildExt(build_ext):
> +@@ -1364,7 +1364,6 @@ class PyBuildExt(build_ext):
>           self.detect_decimal()
>           self.detect_ctypes()
>           self.detect_multiprocessing()
> --        if not self.detect_tkinter():
> --            self.missing.append('_tkinter')
> -+#        if not self.detect_tkinter():
> -+#            self.missing.append('_tkinter')
> +-        self.detect_tkinter()
>           self.detect_uuid()
>
> - ##         # Uncomment these lines if you want to play with xxmodule.c
> +         # Uncomment the next line if you want to play with xxmodule.c
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch
> b/meta/recipes-devtools/python/python3/crosspythonpath.patch
> index 5bb25264da..2fbb17f118 100644
> --- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
> +++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
> @@ -1,4 +1,4 @@
> -From baa3a232e64e9bf5ae945366efdb8088ccf9b828 Mon Sep 17 00:00:00 2001
> +From 7d5fc6a86103d9bd4a274e9fd31b6987e39998a1 Mon Sep 17 00:00:00 2001
>  From: Ricardo Ribalda <ricardo@ribalda.com>
>  Date: Tue, 18 Nov 2014 03:35:33 -0500
>  Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
> @@ -20,15 +20,15 @@ Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index d0db062..e5e3df8 100644
> +index 085fc0b..22790d7 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -83,7 +83,7 @@ if test "$cross_compiling" = yes; then
> -           AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
> -       fi
> -         AC_MSG_RESULT($interp)
> --      PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir)
> _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f
> pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib
> _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH)
> '$interp
> -+      PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir)
> _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM)
> PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo
> $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib
> _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH)
> '$interp
> -     fi
> - elif test "$cross_compiling" = maybe; then
> -     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and
> --build=ARCH])
> +@@ -163,7 +163,7 @@ AC_ARG_WITH(
> +     dnl Build Python interpreter is used for regeneration and freezing.
> +     ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
> +     PYTHON_FOR_FREEZE="$with_build_python"
> +-    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir)
> _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f
> pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib
> _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH)
> '$with_build_python
> ++    PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir)
> _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM)
> PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo
> $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib
> _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH)
> '$with_build_python
> +     AC_MSG_RESULT([$with_build_python])
> +   ], [
> +     AS_VAR_IF([cross_compiling], [yes],
> diff --git a/meta/recipes-devtools/python/python3/makerace.patch
> b/meta/recipes-devtools/python/python3/makerace.patch
> index 2c06784ffc..979fc9dc36 100644
> --- a/meta/recipes-devtools/python/python3/makerace.patch
> +++ b/meta/recipes-devtools/python/python3/makerace.patch
> @@ -1,4 +1,4 @@
> -From 7cc02dfa593d1350a689d64a7a6f2dc6478afe24 Mon Sep 17 00:00:00 2001
> +From 4f52aaf2a548b3356c6f1369c62b11335dc27464 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Tue, 13 Jul 2021 23:19:29 +0100
>  Subject: [PATCH] python3: Fix make race
> @@ -18,15 +18,15 @@ Signed-off-by: Richard Purdie <
> richard.purdie@linuxfoundation.org>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile.pre.in b/Makefile.pre.in
> -index 5e13ba2..026bffd 100644
> +index 7558f0c..8cec819 100644
>  --- a/Makefile.pre.in
>  +++ b/Makefile.pre.in
> -@@ -1527,7 +1527,7 @@ TESTSUBDIRS=     ctypes/test \
> +@@ -2005,7 +2005,7 @@ TESTSUBDIRS=     ctypes/test \
>                 unittest/test unittest/test/testmock
>
>   TEST_MODULES=@TEST_MODULES@
> --libinstall:   build_all $(srcdir)/Modules/xxmodule.c
> -+libinstall:   build_all $(srcdir)/Modules/xxmodule.c libainstall
> +-libinstall:   all $(srcdir)/Modules/xxmodule.c
> ++libinstall:   all $(srcdir)/Modules/xxmodule.c libainstall
>         @for i in $(SCRIPTDIR) $(LIBDEST); \
>         do \
>                 if test ! -d $(DESTDIR)$$i; then \
> diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb
> b/meta/recipes-devtools/python/python3_3.11.0.bb
> similarity index 98%
> rename from meta/recipes-devtools/python/python3_3.10.6.bb
> rename to meta/recipes-devtools/python/python3_3.11.0.bb
> index 1f8b60a7a5..6b6c983abf 100644
> --- a/meta/recipes-devtools/python/python3_3.10.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.11.0.bb
> @@ -22,7 +22,6 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>
> file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
>
> file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
>             file://crosspythonpath.patch \
> -           file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
>
> file://0001-test_locale.py-correct-the-test-output-format.patch \
>
> file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
>             file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
> @@ -35,7 +34,6 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>
> file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
>             file://deterministic_imports.patch \
>             file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
> -           file://0001-Mitigate-the-race-condition-in-testSockName.patch \
>             "
>
>  SRC_URI:append:class-native = " \
> @@ -44,7 +42,7 @@ SRC_URI:append:class-native = " \
>             file://12-distutils-prefix-is-inside-staging-area.patch \
>             file://0001-Don-t-search-system-for-headers-libraries.patch \
>             "
> -SRC_URI[sha256sum] =
> "f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98c22b4326b6d3f3"
> +SRC_URI[sha256sum] =
> "a57dc82d77358617ba65b9841cee1e3b441f386c3789ddc0676eca077f2951c3"
>
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> @@ -62,7 +60,7 @@ CVE_CHECK_IGNORE += "CVE-2020-15523 CVE-2022-26488"
>  # The module will be removed in the future and flaws documented.
>  CVE_CHECK_IGNORE += "CVE-2015-20107"
>
> -PYTHON_MAJMIN = "3.10"
> +PYTHON_MAJMIN = "3.11"
>
>  S = "${WORKDIR}/Python-${PV}"
>
> @@ -81,11 +79,10 @@ DEPENDS = "bzip2-replacement-native libffi bzip2
> openssl sqlite3 zlib virtual/li
>  DEPENDS:append:class-target = " python3-native"
>  DEPENDS:append:class-nativesdk = " python3-native"
>
> -# force to use the mutex+cond implementation (
> https://bugs.python.org/issue41710)
> -CFLAGS += "-DHAVE_BROKEN_POSIX_SEMAPHORES"
> -
>  EXTRA_OECONF = " --without-ensurepip --enable-shared
> --with-platlibdir=${baselib}"
>  EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
> +EXTRA_OECONF:append:class-target = " --with-build-python=nativepython3"
> +EXTRA_OECONF:append:class-nativesdk = " --with-build-python=nativepython3"
>
>  export
> CROSSPYTHONPATH="${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172226):
> https://lists.openembedded.org/g/openembedded-core/message/172226
> Mute This Topic: https://lists.openembedded.org/mt/94612950/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000771f5a05ec0ea19e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes please. I will help with any breakage on the AB.</div=
><div dir=3D"auto">Thank you Alex!</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 27, 2022 at 1:16 PM Alex=
ander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)">The semaphore fix has land=
ed and is available from 3.11 onwards:<br>
<a href=3D"https://github.com/python/cpython/commit/1ee0f94d16f150356a4b9b0=
a39d44ba1d2d5b9fc" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
python/cpython/commit/1ee0f94d16f150356a4b9b0a39d44ba1d2d5b9fc</a><br>
<br>
Drop 0001-Mitigate-the-race-condition-in-testSockName.patch<br>
as it is merged upstream.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/python3-dir.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0...ib-termcap-to-linker-flags-to-avoid-.patch |=C2=A0 8 ++--<br>
=C2=A0...-search-system-for-headers-libraries.patch |=C2=A0 6 +--<br>
=C2=A0...-use-prefix-value-from-build-configu.patch | 14 +++---<br>
=C2=A0...e-the-race-condition-in-testSockName.patch | 47 ------------------=
-<br>
=C2=A0...sts-due-to-load-variability-on-YP-AB.patch | 18 +++----<br>
=C2=A0...FLAG_REF-always-for-interned-strings.patch | 33 -------------<br>
=C2=A0...-detection-of-mips-architecture-for-.patch | 33 ++++++++++---<br>
=C2=A0...fig-append-STAGING_LIBDIR-python-sys.patch |=C2=A0 6 +--<br>
=C2=A0...asename-to-replace-CC-for-checking-c.patch | 44 ++++++++---------<=
br>
=C2=A0...tutils-prefix-is-inside-staging-area.patch | 10 ++--<br>
=C2=A0.../python3/avoid_warning_about_tkinter.patch | 21 ++++-----<br>
=C2=A0.../python/python3/crosspythonpath.patch=C2=A0 =C2=A0 =C2=A0 | 22 +++=
+-----<br>
=C2=A0.../python/python3/makerace.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 10 ++--<br>
=C2=A0.../{<a href=3D"http://python3_3.10.6.bb" rel=3D"noreferrer" target=
=3D"_blank">python3_3.10.6.bb</a> =3D&gt; <a href=3D"http://python3_3.11.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a>}=C2=A0 | 11 =
++---<br>
=C2=A015 files changed, 111 insertions(+), 174 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0001-Mitigate=
-the-race-condition-in-testSockName.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/0001-Use-FLAG=
_REF-always-for-interned-strings.patch<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3_3.10.6=
.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a> =3D&gt; <a =
href=3D"http://python3_3.11.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3_3.11.0.bb</a>} (98%)<br>
<br>
diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/=
python3-dir.bbclass<br>
index 912c67253c..d93d337f76 100644<br>
--- a/meta/classes-recipe/python3-dir.bbclass<br>
+++ b/meta/classes-recipe/python3-dir.bbclass<br>
@@ -4,7 +4,7 @@<br>
=C2=A0# SPDX-License-Identifier: MIT<br>
=C2=A0#<br>
<br>
-PYTHON_BASEVERSION =3D &quot;3.10&quot;<br>
+PYTHON_BASEVERSION =3D &quot;3.11&quot;<br>
=C2=A0PYTHON_ABI =3D &quot;&quot;<br>
=C2=A0PYTHON_DIR =3D &quot;python${PYTHON_BASEVERSION}&quot;<br>
=C2=A0PYTHON_PN =3D &quot;python3&quot;<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-t=
ermcap-to-linker-flags-to-avoid-.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch<br>
index 62ef6efc28..16a4185704 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-=
to-linker-flags-to-avoid-.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-=
to-linker-flags-to-avoid-.patch<br>
@@ -1,4 +1,4 @@<br>
-From 80f872e4573f542d33f91514538755557d566f79 Mon Sep 17 00:00:00 2001<br>
+From 93ae2ed3fc8be0245e35063c4f63626792f4cd0c Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 25 Jan 2019 19:04:13 +0100<br>
=C2=A0Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid=
 host<br>
@@ -12,14 +12,14 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br=
>
=C2=A0 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index 43e807f..11b5cf5 100644<br>
+index 15d0d45..37ed244 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -1149,7 +1149,6 @@ class PyBuildExt(build_ext):<br>
+@@ -1109,7 +1109,6 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;termcap&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 readline_lib=
s.append(&#39;termcap&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add(Extension(&#39;re=
adline&#39;, [&#39;readline.c&#39;],<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0library_dirs=3D[&#39;/usr/lib/=
termcap&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_link_args=3Dreadline_extra_lin=
k_args,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libraries=3Dreadline_libs))<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.missing.append(&#39;r=
eadline&#39;)<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-=
for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don=
-t-search-system-for-headers-libraries.patch<br>
index c790c7b886..d6d9e451ff 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-hea=
ders-libraries.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-hea=
ders-libraries.patch<br>
@@ -1,4 +1,4 @@<br>
-From 7589ab03ad3f7cb4bb092c31273ff22371ac77e4 Mon Sep 17 00:00:00 2001<br>
+From 910a905aaeb6edb6b042ef65b3e2b73faada80aa Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com" targe=
t=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
=C2=A0Date: Wed, 4 Mar 2020 00:06:42 +0000<br>
=C2=A0Subject: [PATCH] Don&#39;t search system for headers/libraries<br>
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpu=
hlman@mvista.com" target=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index c3a6b5e..c892537 100644<br>
+index f29ac86..930cb20 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -856,8 +856,8 @@ class PyBuildExt(build_ext):<br>
+@@ -877,8 +877,8 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_dir_to_list(self.compi=
ler.include_dirs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysconfig.get_config_var(&quot;INCLUDEDIR&q=
uot;))<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use=
-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/pytho=
n3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch<br>
index 641017edd5..2f519e4917 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix=
-value-from-build-configu.patch<br>
@@ -1,4 +1,4 @@<br>
-From d82cb96eed1098920ad3cdcb36feb32137618066 Mon Sep 17 00:00:00 2001<br>
+From 05d676ddf675d9c8229b723e64717aa485d6809e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" tar=
get=3D"_blank">alex@linutronix.de</a>&gt;<br>
=C2=A0Date: Fri, 10 Sep 2021 12:28:31 +0200<br>
=C2=A0Subject: [PATCH] Lib/sysconfig.py: use prefix value from build config=
uration<br>
@@ -15,11 +15,11 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
=C2=A0 1 file changed, 5 insertions(+)<br>
<br>
=C2=A0diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py<br>
-index e64bcdc..40c6b3e 100644<br>
+index 93c6f73..ff399e2 100644<br>
=C2=A0--- a/Lib/sysconfig.py<br>
=C2=A0+++ b/Lib/sysconfig.py<br>
-@@ -613,6 +613,11 @@ def get_config_vars(*args):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_init_non_posix(_CONFIG_VA=
RS)<br>
+@@ -668,6 +668,11 @@ def get_config_vars(*args):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_CONFIG_VARS[&#39;VPATH&#3=
9;] =3D sys._vpath<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://os.name" rel=3D"nor=
eferrer" target=3D"_blank">os.name</a> =3D=3D &#39;posix&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _init_posix(_CONFIG_VARS)<=
br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _CONFIG_VARS[&#39;installed_base&#39;] =
=3D _CONFIG_VARS[&#39;prefix&#39;]<br>
@@ -27,6 +27,6 @@ index e64bcdc..40c6b3e 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _CONFIG_VARS[&#39;installed_platbase&#39=
;] =3D _CONFIG_VARS[&#39;prefix&#39;]<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _CONFIG_VARS[&#39;platbase&#39;] =3D _CO=
NFIG_VARS[&#39;prefix&#39;]<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _CONFIG_VARS[&#39;platlibdir&#39;] =3D _=
CONFIG_VARS[&#39;PLATLIBDIR&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# For backward compatibility, see issue1=
9555<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SO =3D _CONFIG_VARS.get(&#39;EXT_SUFFIX&=
#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if SO is not None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if _HAS_USER_BASE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Setting &#39;userbase&#3=
9; is done below the call to the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# init function to enable =
using &#39;get_config_var&#39; in<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-co=
ndition-in-testSockName.patch b/meta/recipes-devtools/python/python3/0001-M=
itigate-the-race-condition-in-testSockName.patch<br>
deleted file mode 100644<br>
index e19df08f87..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition=
-in-testSockName.patch<br>
+++ /dev/null<br>
@@ -1,47 +0,0 @@<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
-From 8103b90148e8768456c3ab707de105d63d9d5b20 Mon Sep 17 00:00:00 2001<br>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bl=
ank">ross.burton@arm.com</a>&gt;<br>
-Date: Fri, 17 Jun 2022 11:53:59 +0100<br>
-Subject: [PATCH] Mitigate the race condition in testSockName<br>
-<br>
-find_unused_port() has an inherent race condition, but we can&#39;t use<br=
>
-bind_port() as that uses .getsockname() which this test is exercising.<br>
-<br>
-Try binding to unused ports a few times before failing.<br>
----<br>
- Lib/test/test_socket.py | 15 +++++++++++++--<br>
- 1 file changed, 13 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/Lib/test/test_socket.py b/Lib/test/test_socket.py<br>
-index c981903824..b1630d18b6 100644<br>
---- a/Lib/test/test_socket.py<br>
-+++ b/Lib/test/test_socket.py<br>
-@@ -1390,10 +1390,21 @@ def testStringToIPv6(self):<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0def testSockName(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Testing getsockname()<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 port =3D socket_helper.find_unused_port()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sock =3D socket.socket(socket.AF_INET, s=
ocket.SOCK_STREAM)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.addCleanup(sock.close)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 sock.bind((&quot;0.0.0.0&quot;, port))<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Since find_unused_port() is inherently subj=
ect to race conditions, we<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # call it a couple times if necessary.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in itertools.count():<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port =3D socket_helper.find_unu=
sed_port()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock.bind((&quot;=
0.0.0.0&quot;, port))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except OSError as e:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if e.errno !=3D e=
rrno.EADDRINUSE or i =3D=3D 5:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rai=
se<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D sock.getsockname()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# XXX(nnorwitz): <a href=3D"http://tinyu=
rl.com/os5jz" rel=3D"noreferrer" target=3D"_blank">http://tinyurl.com/os5jz=
</a> seems to indicate<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# it reasonable to get the host&#39;s ad=
dr in addition to 0.0.0.0.<br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-d=
ue-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python=
3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch<br>
index 96c5a3c840..61dd4a5bc0 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-l=
oad-variability-on-YP-AB.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-l=
oad-variability-on-YP-AB.patch<br>
@@ -1,4 +1,4 @@<br>
-From 7171aeee22a0b7ab57cdf3d1ae15530549f8f92a Mon Sep 17 00:00:00 2001<br>
+From 01e02fb4720ecbbc44c694ee1b7fb6d5d95b5fe2 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu@windriver.com" target=
=3D"_blank">yifan.yu@windriver.com</a>&gt;<br>
=C2=A0Date: Thu, 1 Apr 2021 13:08:37 -0700<br>
=C2=A0Subject: [PATCH] Skip failing tests due to load variability on YP AB<=
br>
@@ -17,10 +17,10 @@ Signed-off-by: Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu=
@windriver.com" target=3D"_blank">yifan.yu@windriver.com</a>&gt;<br>
=C2=A0 2 files changed, 3 insertions(+)<br>
<br>
=C2=A0diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multi=
processing.py<br>
-index 3bc5b8f..a6e106d 100644<br>
+index 599c3f2..23328be 100644<br>
=C2=A0--- a/Lib/test/_test_multiprocessing.py<br>
=C2=A0+++ b/Lib/test/_test_multiprocessing.py<br>
-@@ -568,6 +568,7 @@ class _TestProcess(BaseTestCase):<br>
+@@ -618,6 +618,7 @@ class _TestProcess(BaseTestCase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close_queue(q)<br>
<br>
@@ -28,7 +28,7 @@ index 3bc5b8f..a6e106d 100644<br>
=C2=A0 =C2=A0 =C2=A0 def test_many_processes(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.TYPE =3D=3D &#39;threads&#39;:<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;test no=
t appropriate for {}&#39;.format(self.TYPE))<br>
-@@ -4817,6 +4818,7 @@ class TestWait(unittest.TestCase):<br>
+@@ -4890,6 +4891,7 @@ class TestWait(unittest.TestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sem.release()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 time.sleep(period)<br>
<br>
@@ -37,13 +37,13 @@ index 3bc5b8f..a6e106d 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from multiprocessing.connection import w=
ait<br>
<br>
=C2=A0diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py<br>
-index 875615a..aebaa8c 100644<br>
+index 884b142..542e980 100644<br>
=C2=A0--- a/Lib/test/test_time.py<br>
=C2=A0+++ b/Lib/test/test_time.py<br>
-@@ -474,6 +474,7 @@ class TimeTestCase(unittest.TestCase):<br>
-=C2=A0 =C2=A0 =C2=A0def test_perf_counter(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time.perf_counter()<br>
- <br>
+@@ -492,6 +492,7 @@ class TimeTestCase(unittest.TestCase):<br>
+=C2=A0 =C2=A0 =C2=A0@unittest.skipIf(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0support.is_wasi, &quot;process_time not =
available on WASI&quot;<br>
+=C2=A0 =C2=A0 =C2=A0)<br>
=C2=A0+=C2=A0 =C2=A0 @unittest.skip(&#39;timing related test, dependent on =
load&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 def test_process_time(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # process_time() should not include time=
 spend during a sleep<br>
diff --git a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-=
for-interned-strings.patch b/meta/recipes-devtools/python/python3/0001-Use-=
FLAG_REF-always-for-interned-strings.patch<br>
deleted file mode 100644<br>
index 993ac243fc..0000000000<br>
--- a/meta/recipes-devtools/python/python3/0001-Use-FLAG_REF-always-for-int=
erned-strings.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From d7217b79a4e125d4fcc1087743171b94d91d1121 Mon Sep 17 00:00:00 2001<br>
-From: Inada Naoki &lt;<a href=3D"mailto:songofacandy@gmail.com" target=3D"=
_blank">songofacandy@gmail.com</a>&gt;<br>
-Date: Sat, 14 Jul 2018 00:46:11 +0900<br>
-Subject: [PATCH] Use FLAG_REF always for interned strings<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/python/cpython/p=
ull/8226" rel=3D"noreferrer" target=3D"_blank">https://github.com/python/cp=
ython/pull/8226</a>]<br>
-Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" tar=
get=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
-<br>
----<br>
- Python/marshal.c | 9 +++++++--<br>
- 1 file changed, 7 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/Python/marshal.c b/Python/marshal.c<br>
-index 4125240..341c9aa 100644<br>
---- a/Python/marshal.c<br>
-+++ b/Python/marshal.c<br>
-@@ -298,9 +298,14 @@ w_ref(PyObject *v, char *flag, WFILE *p)<br>
-=C2=A0 =C2=A0 =C2=A0if (p-&gt;version &lt; 3 || p-&gt;hashtable =3D=3D NUL=
L)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0; /* not writing object referenc=
es */<br>
- <br>
--=C2=A0 =C2=A0 /* if it has only one reference, it definitely isn&#39;t sh=
ared */<br>
--=C2=A0 =C2=A0 if (Py_REFCNT(v) =3D=3D 1)<br>
-+=C2=A0 =C2=A0 /* If it has only one reference, it definitely isn&#39;t sh=
ared.<br>
-+=C2=A0 =C2=A0 =C2=A0* But we use TYPE_REF always for interned string, to =
PYC file stable<br>
-+=C2=A0 =C2=A0 =C2=A0* as possible.<br>
-+=C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 if (Py_REFCNT(v) =3D=3D 1 &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(PyUnicode_CheckExact(v) &amp;=
&amp; PyUnicode_CHECK_INTERNED(v))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-+=C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0entry =3D _Py_hashtable_get_entry(p-&gt;hashtable, v);=
<br>
-=C2=A0 =C2=A0 =C2=A0if (entry !=3D NULL) {<br>
diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-det=
ection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/pytho=
n3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch<br>
index 6ab335a405..f303eb35dc 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-=
of-mips-architecture-for-.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-=
of-mips-architecture-for-.patch<br>
@@ -1,4 +1,4 @@<br>
-From bb409432f03dd8256865292e382ad16613737829 Mon Sep 17 00:00:00 2001<br>
+From d2abe7328cea770425405aa0da2f4c2dac89fcad Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.schoepfer@ith=
inx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br>
=C2=A0Date: Fri, 31 May 2019 15:34:34 +0200<br>
=C2=A0Subject: [PATCH] bpo-36852: proper detection of mips architecture for=
 soft<br>
@@ -15,19 +15,19 @@ Upstream-Status: Submitted [<a href=3D"https://github.c=
om/python/cpython/pull/13196" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/python/cpython/pull/13196</a>]<br>
=C2=A0Signed-off-by: Matthias Schoepfer &lt;<a href=3D"mailto:matthias.scho=
epfer@ithinx.io" target=3D"_blank">matthias.schoepfer@ithinx.io</a>&gt;<br>
<br>
=C2=A0---<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 175 +++++++--------------------------------------------<br>
- 1 file changed, 21 insertions(+), 154 deletions(-)<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 196 ++++++---------------------------------------------<br>
+ 1 file changed, 21 insertions(+), 175 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 4230ef2..ee08b1b 100644<br>
+index 358b6ea..085fc0b 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -718,160 +718,27 @@ then<br>
+@@ -907,181 +907,27 @@ then<br>
=C2=A0 fi<br>
<br>
<br>
=C2=A0-AC_MSG_CHECKING([for the platform triplet based on compiler characte=
ristics])<br>
--cat &gt;&gt; conftest.c &lt;&lt;EOF<br>
+-cat &gt; conftest.c &lt;&lt;EOF<br>
=C2=A0-#undef bfin<br>
=C2=A0-#undef cris<br>
=C2=A0-#undef fr30<br>
@@ -167,6 +167,22 @@ index 4230ef2..ee08b1b 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 darwin<br>
=C2=A0-#elif defined(__VXWORKS__)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vxworks<br>
+-#elif defined(__wasm32__)<br>
+-#=C2=A0 if defined(__EMSCRIPTEN__)<br>
+-=C2=A0 =C2=A0 =C2=A0 wasm32-emscripten<br>
+-#=C2=A0 elif defined(__wasi__)<br>
+-=C2=A0 =C2=A0 =C2=A0 wasm32-wasi<br>
+-#=C2=A0 else<br>
+-#=C2=A0 =C2=A0 error unknown wasm32 platform<br>
+-#=C2=A0 endif<br>
+-#elif defined(__wasm64__)<br>
+-#=C2=A0 if defined(__EMSCRIPTEN)<br>
+-=C2=A0 =C2=A0 =C2=A0 wasm64-emscripten<br>
+-#=C2=A0 elif defined(__wasi__)<br>
+-=C2=A0 =C2=A0 =C2=A0 wasm64-wasi<br>
+-#=C2=A0 else<br>
+-#=C2=A0 =C2=A0 error unknown wasm64 platform<br>
+-#=C2=A0 endif<br>
=C2=A0-#else<br>
=C2=A0-# error unknown platform triplet<br>
=C2=A0-#endif<br>
@@ -175,6 +191,11 @@ index 4230ef2..ee08b1b 100644<br>
=C2=A0-<br>
=C2=A0-if $CPP $CPPFLAGS conftest.c &gt;conftest.out 2&gt;/dev/null; then<b=
r>
=C2=A0-=C2=A0 PLATFORM_TRIPLET=3D`grep -v &#39;^#&#39; conftest.out | grep =
-v &#39;^ *$&#39; | tr -d &#39;=C2=A0 =C2=A0 =C2=A0 &#39;`<br>
+-=C2=A0 case &quot;$build_os&quot; in<br>
+-=C2=A0 linux-musl*)<br>
+-=C2=A0 =C2=A0 PLATFORM_TRIPLET=3D`echo &quot;$PLATFORM_TRIPLET&quot; | se=
d &#39;s/linux-gnu/linux-musl/&#39;`<br>
+-=C2=A0 =C2=A0 ;;<br>
+-=C2=A0 esac<br>
=C2=A0-=C2=A0 AC_MSG_RESULT([$PLATFORM_TRIPLET])<br>
=C2=A0-else<br>
=C2=A0-=C2=A0 AC_MSG_RESULT([none])<br>
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-=
append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/pytho=
n3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch<br>
index 368a725ff7..45a37ed1a9 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-=
STAGING_LIBDIR-python-sys.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-=
STAGING_LIBDIR-python-sys.patch<br>
@@ -1,4 +1,4 @@<br>
-From c24674e0a52367359a1a3d950bab8bc3d282279b Mon Sep 17 00:00:00 2001<br>
+From 9c6b9f46179c8f9c9391767e2b02f268a1ee7a9c Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 31 Jan 2019 16:46:30 +0100<br>
=C2=A0Subject: [PATCH] distutils/sysconfig: append<br>
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br=
>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py<br>
-index 40c6b3e..ac94cc7 100644<br>
+index ff399e2..95844cf 100644<br>
=C2=A0--- a/Lib/sysconfig.py<br>
=C2=A0+++ b/Lib/sysconfig.py<br>
-@@ -474,6 +474,8 @@ def _init_posix(vars):<br>
+@@ -528,6 +528,8 @@ def _init_posix(vars):<br>
=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Initialize the module as appropriate=
 for POSIX systems.&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 # _sysconfigdata is generated at build time, see _gene=
rate_posix_vars()<br>
=C2=A0 =C2=A0 =C2=A0 name =3D _get_sysconfigdata_name()<br>
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basen=
ame-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/pytho=
n3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch<br>
index 2c7d264da0..4d589dd759 100644<br>
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-=
replace-CC-for-checking-c.patch<br>
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-=
replace-CC-for-checking-c.patch<br>
@@ -1,4 +1,4 @@<br>
-From 9f68a27eb34394a00f1011c06900c609f15fb15c Mon Sep 17 00:00:00 2001<br>
+From 175ed10e0a59a5395546ef88702f23d100b909f9 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" =
target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
=C2=A0Date: Mon, 22 Oct 2018 15:19:51 +0800<br>
=C2=A0Subject: [PATCH] python3: use cc_basename to replace CC for checking =
compiler<br>
@@ -27,18 +27,18 @@ Signed-off-by: Changqing Li &lt;<a href=3D"mailto:chang=
qing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;=
<br>
=C2=A0 1 file changed, 10 insertions(+), 9 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 0c06914..299786b 100644<br>
+index 77fb609..358b6ea 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -61,6 +61,7 @@ AC_CONFIG_HEADER(pyconfig.h)<br>
+@@ -134,6 +134,7 @@ AC_CONFIG_HEADERS([pyconfig.h])<br>
=C2=A0 AC_CANONICAL_HOST<br>
=C2=A0 AC_SUBST(build)<br>
=C2=A0 AC_SUBST(host)<br>
=C2=A0+LT_INIT<br>
<br>
- # pybuilddir.txt will be created by --generate-posix-vars in the Makefile=
<br>
- rm -f pybuilddir.txt<br>
-@@ -688,7 +689,7 @@ AC_MSG_RESULT($with_cxx_main)<br>
+ AS_VAR_IF([cross_compiling], [maybe],<br>
+=C2=A0 [AC_MSG_ERROR([Cross compiling required --host=3DHOST-TUPLE and --b=
uild=3DARCH])]<br>
+@@ -877,7 +878,7 @@ AC_MSG_RESULT($with_cxx_main)<br>
=C2=A0 preset_cxx=3D&quot;$CXX&quot;<br>
=C2=A0 if test -z &quot;$CXX&quot;<br>
=C2=A0 then<br>
@@ -47,7 +47,7 @@ index 0c06914..299786b 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc)=C2=A0 =C2=A0 AC_PATH_TOOL(CXX, [g++=
], [g++], [notfound]) ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc)=C2=A0 =C2=A0 =C2=A0AC_PATH_TOOL(CXX,=
 [c++], [c++], [notfound]) ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clang|*/clang)=C2=A0 =C2=A0 =C2=A0AC_PAT=
H_TOOL(CXX, [clang++], [clang++], [notfound]) ;;<br>
-@@ -976,7 +977,7 @@ rmdir CaseSensitiveTestDir<br>
+@@ -1290,7 +1291,7 @@ rmdir CaseSensitiveTestDir<br>
<br>
=C2=A0 case $ac_sys_system in<br>
=C2=A0 hp*|HP*)<br>
@@ -56,16 +56,16 @@ index 0c06914..299786b 100644<br>
=C2=A0 =C2=A0 =C2=A0 cc|*/cc) CC=3D&quot;$CC -Ae&quot;;;<br>
=C2=A0 =C2=A0 =C2=A0 esac;;<br>
=C2=A0 esac<br>
-@@ -1374,7 +1375,7 @@ else<br>
- fi],<br>
+@@ -1798,7 +1799,7 @@ esac<br>
+ ],<br>
=C2=A0 [AC_MSG_RESULT(no)])<br>
=C2=A0 if test &quot;$Py_LTO&quot; =3D &#39;true&#39; ; then<br>
=C2=A0-=C2=A0 case $CC in<br>
=C2=A0+=C2=A0 case $cc_basename in<br>
=C2=A0 =C2=A0 =C2=A0 *clang*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUBST(LLVM_AR)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_PATH_TOOL(LLVM_AR, llvm-ar, &#39;&#39;, ${ll=
vm_path})<br>
-@@ -1467,7 +1468,7 @@ then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dnl flag to disable lto during linking<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS_NOLTO=3D&quot;-fno-lto&quot;<br>
+@@ -1917,7 +1918,7 @@ then<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 fi<br>
=C2=A0 LLVM_PROF_ERR=3Dno<br>
@@ -74,7 +74,7 @@ index 0c06914..299786b 100644<br>
=C2=A0 =C2=A0 *clang*)<br>
=C2=A0 =C2=A0 =C2=A0 # Any changes made here should be reflected in the GCC=
+Darwin case below<br>
=C2=A0 =C2=A0 =C2=A0 PGO_PROF_GEN_FLAG=3D&quot;-fprofile-instr-generate&quo=
t;<br>
-@@ -1528,7 +1529,7 @@ esac<br>
+@@ -1978,7 +1979,7 @@ esac<br>
=C2=A0 # compiler and platform.=C2=A0 BASECFLAGS tweaks need to be made eve=
n if the<br>
=C2=A0 # user set OPT.<br>
<br>
@@ -83,16 +83,16 @@ index 0c06914..299786b 100644<br>
=C2=A0 =C2=A0 =C2=A0 *clang*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc_is_clang=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-@@ -1664,7 +1665,7 @@ yes)<br>
+@@ -2197,7 +2198,7 @@ yes)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 # ICC doesn&#39;t recognize the option, but only emits=
 a warning<br>
=C2=A0 =C2=A0 =C2=A0 ## XXX does it emit an unused result warning and can i=
t be disabled?<br>
--=C2=A0 =C2=A0 case &quot;$CC&quot; in<br>
-+=C2=A0 =C2=A0 case &quot;$cc_basename&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0*icc*)<br>
-=C2=A0 =C2=A0 =C2=A0ac_cv_disable_unused_result_warning=3Dno<br>
-=C2=A0 =C2=A0 =C2=A0;;<br>
-@@ -2018,7 +2019,7 @@ yes)<br>
+-=C2=A0 =C2=A0 AS_CASE([$CC],<br>
++=C2=A0 =C2=A0 AS_CASE([$cc_basename],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[*icc*], [ac_cv_disable_un=
used_result_warning=3Dno]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[PY_CHECK_CC_WARNING([disa=
ble], [unused-result])])<br>
+=C2=A0 =C2=A0 =C2=A0AS_VAR_IF([ac_cv_disable_unused_result_warning], [yes]=
,<br>
+@@ -2439,7 +2440,7 @@ yes)<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 esac<br>
<br>
@@ -101,7 +101,7 @@ index 0c06914..299786b 100644<br>
=C2=A0 *icc*)<br>
=C2=A0 =C2=A0 =C2=A0 # ICC needs -fp-model strict or floats behave badly<br=
>
=C2=A0 =C2=A0 =C2=A0 CFLAGS_NODIST=3D&quot;$CFLAGS_NODIST -fp-model strict&=
quot;<br>
-@@ -2836,7 +2837,7 @@ then<br>
+@@ -3281,7 +3282,7 @@ then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 LINKFORSHARED=3D&quot;-Wl,--export-dynamic&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi;;<br>
@@ -110,7 +110,7 @@ index 0c06914..299786b 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *gcc*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $C=
C -Xlinker --help 2&gt;&amp;1 | grep export-dynamic &gt;/dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 then<=
br>
-@@ -5622,7 +5623,7 @@ if test &quot;$have_gcc_asm_for_x87&quot; =3D yes; t=
hen<br>
+@@ -6370,7 +6371,7 @@ if test &quot;$ac_cv_gcc_asm_for_x87&quot; =3D yes; =
then<br>
=C2=A0 =C2=A0 =C2=A0 # Some versions of gcc miscompile inline asm:<br>
=C2=A0 =C2=A0 =C2=A0 # <a href=3D"http://gcc.gnu.org/bugzilla/show_bug.cgi?=
id=3D46491" rel=3D"noreferrer" target=3D"_blank">http://gcc.gnu.org/bugzill=
a/show_bug.cgi?id=3D46491</a><br>
=C2=A0 =C2=A0 =C2=A0 # <a href=3D"http://gcc.gnu.org/ml/gcc/2010-11/msg0036=
6.html" rel=3D"noreferrer" target=3D"_blank">http://gcc.gnu.org/ml/gcc/2010=
-11/msg00366.html</a><br>
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-in=
side-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils=
-prefix-is-inside-staging-area.patch<br>
index a06e9b56c1..7b497b83ca 100644<br>
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-st=
aging-area.patch<br>
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-st=
aging-area.patch<br>
@@ -1,4 +1,4 @@<br>
-From 1cc4cab8d579bbccb8a4fc13a28158a58c603cb4 Mon Sep 17 00:00:00 2001<br>
+From 2918d431cb5607933755fc80a6220135dd7fcb1d Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Tue, 14 May 2013 15:00:26 -0700<br>
=C2=A0Subject: [PATCH] python3: Add target and native recipes<br>
@@ -18,10 +18,10 @@ Signed-off-by: Alejandro Hernandez &lt;<a href=3D"mailt=
o:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro.hernande=
z@linux.intel.com</a>&gt;<br>
=C2=A0 1 file changed, 11 insertions(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py<=
br>
-index 3414a76..361d3a1 100644<br>
+index 03b8558..57d193d 100644<br>
=C2=A0--- a/Lib/distutils/sysconfig.py<br>
=C2=A0+++ b/Lib/distutils/sysconfig.py<br>
-@@ -277,7 +277,9 @@ def get_python_inc(plat_specific=3D0, prefix=3DNone):<=
br>
+@@ -272,7 +272,9 @@ def get_python_inc(plat_specific=3D0, prefix=3DNone):<=
br>
=C2=A0 =C2=A0 =C2=A0 If &#39;prefix&#39; is supplied, use it instead of sys=
.base_prefix or<br>
=C2=A0 =C2=A0 =C2=A0 sys.base_exec_prefix -- i.e., ignore &#39;plat_specifi=
c&#39;.<br>
=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
@@ -32,7 +32,7 @@ index 3414a76..361d3a1 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D plat_specific and BASE_EXEC_P=
REFIX or BASE_PREFIX<br>
=C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://os.name" rel=3D"noreferrer" targe=
t=3D"_blank">os.name</a> =3D=3D &quot;posix&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if python_build:<br>
-@@ -320,7 +322,13 @@ def get_python_lib(plat_specific=3D0, standard_lib=3D=
0, prefix=3DNone):<br>
+@@ -315,7 +317,13 @@ def get_python_lib(plat_specific=3D0, standard_lib=3D=
0, prefix=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 If &#39;prefix&#39; is supplied, use it instead of sys=
.base_prefix or<br>
=C2=A0 =C2=A0 =C2=A0 sys.base_exec_prefix -- i.e., ignore &#39;plat_specifi=
c&#39;.<br>
=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
@@ -47,7 +47,7 @@ index 3414a76..361d3a1 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if standard_lib:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefix =3D plat_specific a=
nd BASE_EXEC_PREFIX or BASE_PREFIX<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-@@ -334,7 +342,7 @@ def get_python_lib(plat_specific=3D0, standard_lib=3D0=
, prefix=3DNone):<br>
+@@ -329,7 +337,7 @@ def get_python_lib(plat_specific=3D0, standard_lib=3D0=
, prefix=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pure Python<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir =3D &quot;lib&quot;=
<br>
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkint=
er.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter=
.patch<br>
index 2de72b7199..5a6cfc9572 100644<br>
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patc=
h<br>
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patc=
h<br>
@@ -1,4 +1,4 @@<br>
-From 6a23d52c905cd1f6a5944255903ec86ea8b904bb Mon Sep 17 00:00:00 2001<br>
+From 627b8fe6b3c11e8bb1bb1ad1d6b816b79b8dd2ce Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" target=
=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
=C2=A0Date: Mon, 28 Jan 2019 15:57:54 +0000<br>
=C2=A0Subject: [PATCH] _tkinter module needs tk module along with tcl. tk i=
s not yet<br>
@@ -9,23 +9,22 @@ Upstream-Status: Inappropriate [distribution]<br>
<br>
=C2=A0Also simply disable the tk module since its not in DEPENDS.<br>
=C2=A0Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro=
" target=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
-<br>
=C2=A0---<br>
- setup.py | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+ setup.py | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/setup.py b/setup.py<br>
-index 11b5cf5..2be4738 100644<br>
+index 7555dcd..f29ac86 100644<br>
=C2=A0--- a/setup.py<br>
=C2=A0+++ b/setup.py<br>
-@@ -1895,8 +1895,8 @@ class PyBuildExt(build_ext):<br>
+@@ -1364,7 +1364,6 @@ class PyBuildExt(build_ext):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_decimal()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_ctypes()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_multiprocessing()<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.detect_tkinter():<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.missing.append(&#39;_tkint=
er&#39;)<br>
-+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.detect_tkinter():<br>
-+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.missing.append(&#39;_tkin=
ter&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_tkinter()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.detect_uuid()<br>
<br>
- ##=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Uncomment these lines if you want t=
o play with xxmodule.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Uncomment the next line if you want to=
 play with xxmodule.c<br>
+-- <br>
+2.30.2<br>
+<br>
diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/m=
eta/recipes-devtools/python/python3/crosspythonpath.patch<br>
index 5bb25264da..2fbb17f118 100644<br>
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch<br>
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch<br>
@@ -1,4 +1,4 @@<br>
-From baa3a232e64e9bf5ae945366efdb8088ccf9b828 Mon Sep 17 00:00:00 2001<br>
+From 7d5fc6a86103d9bd4a274e9fd31b6987e39998a1 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Ricardo Ribalda &lt;<a href=3D"mailto:ricardo@ribalda.com" targ=
et=3D"_blank">ricardo@ribalda.com</a>&gt;<br>
=C2=A0Date: Tue, 18 Nov 2014 03:35:33 -0500<br>
=C2=A0Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a>: add CROSSPYTHONPATH into PYTHONPATH for<=
br>
@@ -20,15 +20,15 @@ Signed-off-by: Ricardo Ribalda &lt;<a href=3D"mailto:ri=
cardo@ribalda.com" target=3D"_blank">ricardo@ribalda.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index d0db062..e5e3df8 100644<br>
+index 085fc0b..22790d7 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -83,7 +83,7 @@ if test &quot;$cross_compiling&quot; =3D yes; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([python$PACKAGE_VERS=
ION interpreter not found])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT($interp)<br>
--=C2=A0 =C2=A0 =C2=A0 PYTHON_FOR_BUILD=3D&#39;_PYTHON_PROJECT_BASE=3D$(abs=
_builddir) _PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(=
shell test -f pybuilddir.txt &amp;&amp; echo $(abs_builddir)/`cat pybuilddi=
r.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAG=
S)_$(MACHDEP)_$(MULTIARCH) &#39;$interp<br>
-+=C2=A0 =C2=A0 =C2=A0 PYTHON_FOR_BUILD=3D&#39;_PYTHON_PROJECT_BASE=3D$(abs=
_builddir) _PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(=
CROSSPYTHONPATH):$(shell test -f pybuilddir.txt &amp;&amp; echo $(abs_build=
dir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=3D_sysc=
onfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) &#39;$interp<br>
-=C2=A0 =C2=A0 =C2=A0fi<br>
- elif test &quot;$cross_compiling&quot; =3D maybe; then<br>
-=C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([Cross compiling required --host=3DHOST-T=
UPLE and --build=3DARCH])<br>
+@@ -163,7 +163,7 @@ AC_ARG_WITH(<br>
+=C2=A0 =C2=A0 =C2=A0dnl Build Python interpreter is used for regeneration =
and freezing.<br>
+=C2=A0 =C2=A0 =C2=A0ac_cv_prog_PYTHON_FOR_REGEN=3D$with_build_python<br>
+=C2=A0 =C2=A0 =C2=A0PYTHON_FOR_FREEZE=3D&quot;$with_build_python&quot;<br>
+-=C2=A0 =C2=A0 PYTHON_FOR_BUILD=3D&#39;_PYTHON_PROJECT_BASE=3D$(abs_buildd=
ir) _PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(shell t=
est -f pybuilddir.txt &amp;&amp; echo $(abs_builddir)/`cat pybuilddir.txt`:=
)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigdata_$(ABIFLAGS)_$(MA=
CHDEP)_$(MULTIARCH) &#39;$with_build_python<br>
++=C2=A0 =C2=A0 PYTHON_FOR_BUILD=3D&#39;_PYTHON_PROJECT_BASE=3D$(abs_buildd=
ir) _PYTHON_HOST_PLATFORM=3D$(_PYTHON_HOST_PLATFORM) PYTHONPATH=3D$(CROSSPY=
THONPATH):$(shell test -f pybuilddir.txt &amp;&amp; echo $(abs_builddir)/`c=
at pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=3D_sysconfigda=
ta_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) &#39;$with_build_python<br>
+=C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT([$with_build_python])<br>
+=C2=A0 =C2=A0], [<br>
+=C2=A0 =C2=A0 =C2=A0AS_VAR_IF([cross_compiling], [yes],<br>
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/rec=
ipes-devtools/python/python3/makerace.patch<br>
index 2c06784ffc..979fc9dc36 100644<br>
--- a/meta/recipes-devtools/python/python3/makerace.patch<br>
+++ b/meta/recipes-devtools/python/python3/makerace.patch<br>
@@ -1,4 +1,4 @@<br>
-From 7cc02dfa593d1350a689d64a7a6f2dc6478afe24 Mon Sep 17 00:00:00 2001<br>
+From 4f52aaf2a548b3356c6f1369c62b11335dc27464 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
=C2=A0Date: Tue, 13 Jul 2021 23:19:29 +0100<br>
=C2=A0Subject: [PATCH] python3: Fix make race<br>
@@ -18,15 +18,15 @@ Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:ric=
hard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoun=
dation.org</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" ta=
rget=3D"_blank">Makefile.pre.in</a> b/<a href=3D"http://Makefile.pre.in" re=
l=3D"noreferrer" target=3D"_blank">Makefile.pre.in</a><br>
-index 5e13ba2..026bffd 100644<br>
+index 7558f0c..8cec819 100644<br>
=C2=A0--- a/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
=C2=A0+++ b/<a href=3D"http://Makefile.pre.in" rel=3D"noreferrer" target=3D=
"_blank">Makefile.pre.in</a><br>
-@@ -1527,7 +1527,7 @@ TESTSUBDIRS=3D=C2=A0 =C2=A0 =C2=A0ctypes/test \<br>
+@@ -2005,7 +2005,7 @@ TESTSUBDIRS=3D=C2=A0 =C2=A0 =C2=A0ctypes/test \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unittest/test unitt=
est/test/testmock<br>
<br>
=C2=A0 TEST_MODULES=3D@TEST_MODULES@<br>
--libinstall:=C2=A0 =C2=A0build_all $(srcdir)/Modules/xxmodule.c<br>
-+libinstall:=C2=A0 =C2=A0build_all $(srcdir)/Modules/xxmodule.c libainstal=
l<br>
+-libinstall:=C2=A0 =C2=A0all $(srcdir)/Modules/xxmodule.c<br>
++libinstall:=C2=A0 =C2=A0all $(srcdir)/Modules/xxmodule.c libainstall<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @for i in $(SCRIPTDIR) $(LIBDEST); \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test ! -d $(DEST=
DIR)$$i; then \<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.6.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a> b/meta/recip=
es-devtools/python/<a href=3D"http://python3_3.11.0.bb" rel=3D"noreferrer" =
target=3D"_blank">python3_3.11.0.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3_3.10.6.b=
b" rel=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3_3.11.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a><br>
index 1f8b60a7a5..6b6c983abf 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.11.0.bb</a><br>
@@ -22,7 +22,6 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/py=
thon/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank=
">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-python3-use-cc_basena=
me-to-replace-CC-for-checking-c.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-bpo-36852-proper-dete=
ction-of-mips-architecture-for-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://crosspythonpath.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-FLAG_REF-always-f=
or-interned-strings.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test_locale.py-correc=
t-the-test-output-format.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0017-setup.py-do-not-repor=
t-missing-dependencies-for-disa.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-do-not-compi=
le-.pyc-in-parallel.patch \<br>
@@ -35,7 +34,6 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/py=
thon/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank=
">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-setup.py-Do-not-detec=
t-multiarch-paths-when-cross-co.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://deterministic_imports.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Avoid-shebang-overflo=
w-on-python-config.py.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Mitigate-the-race-con=
dition-in-testSockName.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:class-native =3D &quot; \<br>
@@ -44,7 +42,7 @@ SRC_URI:append:class-native =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://12-distutils-prefix-is-ins=
ide-staging-area.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Don-t-search-system-f=
or-headers-libraries.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa21=
00a98c22b4326b6d3f3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a57dc82d77358617ba65b9841cee1e3b441f386c3789d=
dc0676eca077f2951c3&quot;<br>
<br>
=C2=A0# exclude pre-releases for both python 2.x and 3.x<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;[Pp]ython-(?P&lt;pver&gt;\d+(\.\d+)+).=
tar&quot;<br>
@@ -62,7 +60,7 @@ CVE_CHECK_IGNORE +=3D &quot;CVE-2020-15523 CVE-2022-26488=
&quot;<br>
=C2=A0# The module will be removed in the future and flaws documented.<br>
=C2=A0CVE_CHECK_IGNORE +=3D &quot;CVE-2015-20107&quot;<br>
<br>
-PYTHON_MAJMIN =3D &quot;3.10&quot;<br>
+PYTHON_MAJMIN =3D &quot;3.11&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/Python-${PV}&quot;<br>
<br>
@@ -81,11 +79,10 @@ DEPENDS =3D &quot;bzip2-replacement-native libffi bzip2=
 openssl sqlite3 zlib virtual/li<br>
=C2=A0DEPENDS:append:class-target =3D &quot; python3-native&quot;<br>
=C2=A0DEPENDS:append:class-nativesdk =3D &quot; python3-native&quot;<br>
<br>
-# force to use the mutex+cond implementation (<a href=3D"https://bugs.pyth=
on.org/issue41710" rel=3D"noreferrer" target=3D"_blank">https://bugs.python=
.org/issue41710</a>)<br>
-CFLAGS +=3D &quot;-DHAVE_BROKEN_POSIX_SEMAPHORES&quot;<br>
-<br>
=C2=A0EXTRA_OECONF =3D &quot; --without-ensurepip --enable-shared --with-pl=
atlibdir=3D${baselib}&quot;<br>
=C2=A0EXTRA_OECONF:append:class-native =3D &quot; --bindir=3D${bindir}/${PN=
}&quot;<br>
+EXTRA_OECONF:append:class-target =3D &quot; --with-build-python=3Dnativepy=
thon3&quot;<br>
+EXTRA_OECONF:append:class-nativesdk =3D &quot; --with-build-python=3Dnativ=
epython3&quot;<br>
<br>
=C2=A0export CROSSPYTHONPATH=3D&quot;${STAGING_LIBDIR_NATIVE}/python${PYTHO=
N_MAJMIN}/lib-dynload/&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172226): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172226" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172226</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94612950/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94612950/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000771f5a05ec0ea19e--

