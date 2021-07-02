Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.16193.1625264373978685691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 15:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BOv0Z3wE;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id v20so18488795eji.10
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 15:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JqQy70iLqYX4Q19K5FEiqF+WBUgM+U32/dVjwSFHU5I=;
        b=BOv0Z3wEB5wHlsqOVGorMhYDDUWqj6zyKxoldAh4BFXBl5M4Z+n9pPCKnGH0dhTkTM
         KDsskNXHuMR7i+OBIKovXaK4TDWIeHNDfIiBi780d1VXDFYvhO87j/eGh1NfOkydS8hb
         26SR+sS3+COnyK8ZVWk+l662MbTVR2rIZqAw2ZwoLaY3aqYz2RCKOIqGkruAA8yAXU9v
         saqSQE72cFTywtcbvdpns0L1DZODPNJpZaXjPwvZ0spr5qmsPHSr0o/LCMTC37Q6hJs3
         N1O+gos6BscnlRBMcHNZUuWy3tzBfH1frKVzsDojUdt6UMUX0Obhkz/4rBOsGHtmNfoO
         Indw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JqQy70iLqYX4Q19K5FEiqF+WBUgM+U32/dVjwSFHU5I=;
        b=RaDJIfyHItwih3htN1wNCkiK89F7HKHcESVfPeJnUgdkwgBtnR+CC35RwSfoViJWM6
         8KVou+dov3kdhiCA9w5PuWhg0KF/hvB8wQ3L8LmnKvxh0pGaYLeXcXg658ZLP1GIkqhn
         2qU2/zsJlK/F7jcwwq5oMV9A5sD2wu78pR4NTOyY8baLcKIFzkdpVVHNs1LxzZ5xggfw
         Qyp6zGcNL3ukCNHqltCDc+IW+KhUc2k6gz2kyiGFpPrEDUzsxdR5vf94K0Hb9poAB8FQ
         VQDcQOXeSNTrOea/54IGD62dZgL5cMpkrNTyhMQRfFPX4/gFBhFtonhnZUdX33kzAGpu
         hJcg==
X-Gm-Message-State: AOAM533hgGnTzEZrhozBreImMoiHjS7bhwVueLTVj0K3nDKbUajsXXF4
	z0y91JJPucsRIKtOlxOdf370XMf1pGlrcQ==
X-Google-Smtp-Source: ABdhPJyHgkdCjGa0m3MLS7T7PNd6WToQNGR6Rsnmr6JC+9jWTPJaBnjF3s0FJ5678qy5DLw8JcLBuw==
X-Received: by 2002:a17:907:7253:: with SMTP id ds19mr1998305ejc.342.1625264372416;
        Fri, 02 Jul 2021 15:19:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id jx17sm1492414ejc.60.2021.07.02.15.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 15:19:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/4] python3-iniparse: update 0.4 -> 0.5
Date: Sat,  3 Jul 2021 00:19:23 +0200
Message-Id: <20210702221924.2342084-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702221924.2342084-1-alex.kanavin@gmail.com>
References: <20210702221924.2342084-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the python3 compatibility patch (upstream is back from the dead and
fixed it).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Add-python-3-compatibility.patch     | 552 ------------------
 ...niparse_0.4.bb => python3-iniparse_0.5.bb} |   7 +-
 2 files changed, 2 insertions(+), 557 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-iniparse/0001-Add-python-3-compatibility.patch
 rename meta/recipes-devtools/python/{python3-iniparse_0.4.bb => python3-iniparse_0.5.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-iniparse/0001-Add-python-3-compatibility.patch b/meta/recipes-devtools/python/python3-iniparse/0001-Add-python-3-compatibility.patch
deleted file mode 100644
index 44090a20d0..0000000000
--- a/meta/recipes-devtools/python/python3-iniparse/0001-Add-python-3-compatibility.patch
+++ /dev/null
@@ -1,552 +0,0 @@
-From 8a98e4d44a5e59439a4b6bd95368cc362412c995 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 24 Mar 2017 18:06:08 +0200
-Subject: [PATCH] Add python 3 compatibility.
-
-Taken from
-http://pkgs.fedoraproject.org/cgit/rpms/python-iniparse.git/tree/python-iniparse-python3-compat.patch
-
-Upstream-Status: Inappropriate [upstream is defunct]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- iniparse/__init__.py     | 20 ++++++++++----------
- iniparse/compat.py       | 30 ++++++++++++++++--------------
- iniparse/config.py       | 16 ++++++++--------
- iniparse/configparser.py |  7 +++++++
- iniparse/ini.py          | 20 ++++++++++++--------
- iniparse/utils.py        |  4 ++--
- tests/__init__.py        | 14 +++++++-------
- tests/test_compat.py     | 23 +++++++++++++++--------
- tests/test_fuzz.py       | 18 +++++++++---------
- tests/test_ini.py        |  8 ++++----
- tests/test_misc.py       |  4 ++--
- tests/test_tidy.py       |  2 +-
- tests/test_unicode.py    | 10 +++++-----
- 13 files changed, 98 insertions(+), 78 deletions(-)
- create mode 100644 iniparse/configparser.py
-
-diff --git a/iniparse/__init__.py b/iniparse/__init__.py
-index 8de756f..7193f92 100644
---- a/iniparse/__init__.py
-+++ b/iniparse/__init__.py
-@@ -3,17 +3,17 @@
- # Copyright (c) 2007 Tim Lauridsen <tla@rasmil.dk>
- # All Rights Reserved.  See LICENSE-PSF & LICENSE for details.
- 
--from ini import INIConfig, change_comment_syntax
--from config import BasicConfig, ConfigNamespace
--from compat import RawConfigParser, ConfigParser, SafeConfigParser
--from utils import tidy
-+from .ini import INIConfig, change_comment_syntax
-+from .config import BasicConfig, ConfigNamespace
-+from .compat import RawConfigParser, ConfigParser, SafeConfigParser
-+from .utils import tidy
- 
--from ConfigParser import DuplicateSectionError,    \
--                  NoSectionError, NoOptionError,   \
--                  InterpolationMissingOptionError, \
--                  InterpolationDepthError,         \
--                  InterpolationSyntaxError,        \
--                  DEFAULTSECT, MAX_INTERPOLATION_DEPTH
-+from .configparser import DuplicateSectionError,    \
-+                   NoSectionError, NoOptionError,   \
-+                   InterpolationMissingOptionError, \
-+                   InterpolationDepthError,         \
-+                   InterpolationSyntaxError,        \
-+                   DEFAULTSECT, MAX_INTERPOLATION_DEPTH
- 
- __all__ = [
-     'BasicConfig', 'ConfigNamespace',
-diff --git a/iniparse/compat.py b/iniparse/compat.py
-index db89ed8..f95c25c 100644
---- a/iniparse/compat.py
-+++ b/iniparse/compat.py
-@@ -12,19 +12,21 @@ The underlying INIConfig object can be accessed as cfg.data
- """
- 
- import re
--from ConfigParser import DuplicateSectionError,    \
--                  NoSectionError, NoOptionError,   \
--                  InterpolationMissingOptionError, \
--                  InterpolationDepthError,         \
--                  InterpolationSyntaxError,        \
--                  DEFAULTSECT, MAX_INTERPOLATION_DEPTH
-+from .configparser import DuplicateSectionError,    \
-+                   NoSectionError, NoOptionError,   \
-+                   InterpolationMissingOptionError, \
-+                   InterpolationDepthError,         \
-+                   InterpolationSyntaxError,        \
-+                   DEFAULTSECT, MAX_INTERPOLATION_DEPTH
- 
- # These are imported only for compatiability.
- # The code below does not reference them directly.
--from ConfigParser import Error, InterpolationError, \
--                  MissingSectionHeaderError, ParsingError
-+from .configparser import Error, InterpolationError, \
-+                   MissingSectionHeaderError, ParsingError
- 
--import ini
-+import six
-+
-+from . import ini
- 
- class RawConfigParser(object):
-     def __init__(self, defaults=None, dict_type=dict):
-@@ -56,7 +58,7 @@ class RawConfigParser(object):
-         # The default section is the only one that gets the case-insensitive
-         # treatment - so it is special-cased here.
-         if section.lower() == "default":
--            raise ValueError, 'Invalid section name: %s' % section
-+            raise ValueError('Invalid section name: %s' % section)
- 
-         if self.has_section(section):
-             raise DuplicateSectionError(section)
-@@ -88,7 +90,7 @@ class RawConfigParser(object):
-         filename may also be given.
-         """
-         files_read = []
--        if isinstance(filenames, basestring):
-+        if isinstance(filenames, six.string_types):
-             filenames = [filenames]
-         for filename in filenames:
-             try:
-@@ -143,7 +145,7 @@ class RawConfigParser(object):
-     def getboolean(self, section, option):
-         v = self.get(section, option)
-         if v.lower() not in self._boolean_states:
--            raise ValueError, 'Not a boolean: %s' % v
-+            raise ValueError('Not a boolean: %s' % v)
-         return self._boolean_states[v.lower()]
- 
-     def has_option(self, section, option):
-@@ -234,7 +236,7 @@ class ConfigParser(RawConfigParser):
-             if "%(" in value:
-                 try:
-                     value = value % vars
--                except KeyError, e:
-+                except KeyError as e:
-                     raise InterpolationMissingOptionError(
-                         option, section, rawval, e.args[0])
-             else:
-@@ -283,7 +285,7 @@ class SafeConfigParser(ConfigParser):
-     _badpercent_re = re.compile(r"%[^%]|%$")
- 
-     def set(self, section, option, value):
--        if not isinstance(value, basestring):
-+        if not isinstance(value, six.string_types):
-             raise TypeError("option values must be strings")
-         # check for bad percent signs:
-         # first, replace all "good" interpolations
-diff --git a/iniparse/config.py b/iniparse/config.py
-index 5cfa2ea..3b28549 100644
---- a/iniparse/config.py
-+++ b/iniparse/config.py
-@@ -143,7 +143,7 @@ class BasicConfig(ConfigNamespace):
- 
-     >>> n.aaa = 42
-     >>> del n.x
--    >>> print n
-+    >>> print(n)
-     aaa = 42
-     name.first = paramjit
-     name.last = oberoi
-@@ -152,7 +152,7 @@ class BasicConfig(ConfigNamespace):
- 
-     >>> isinstance(n.name, ConfigNamespace)
-     True
--    >>> print n.name
-+    >>> print(n.name)
-     first = paramjit
-     last = oberoi
-     >>> sorted(list(n.name))
-@@ -160,7 +160,7 @@ class BasicConfig(ConfigNamespace):
- 
-     Finally, values can be read from a file as follows:
- 
--    >>> from StringIO import StringIO
-+    >>> from six import StringIO
-     >>> sio = StringIO('''
-     ... # comment
-     ... ui.height = 100
-@@ -171,7 +171,7 @@ class BasicConfig(ConfigNamespace):
-     ... ''')
-     >>> n = BasicConfig()
-     >>> n._readfp(sio)
--    >>> print n
-+    >>> print(n)
-     complexity = medium
-     data.secret.password = goodness=gracious me
-     have_python
-@@ -199,7 +199,7 @@ class BasicConfig(ConfigNamespace):
- 
-     def __str__(self, prefix=''):
-         lines = []
--        keys = self._data.keys()
-+        keys = list(self._data.keys())
-         keys.sort()
-         for name in keys:
-             value = self._data[name]
-@@ -258,7 +258,7 @@ def update_config(target, source):
-     >>> n.ui.display_clock = True
-     >>> n.ui.display_qlength = True
-     >>> n.ui.width = 150
--    >>> print n
-+    >>> print(n)
-     playlist.expand_playlist = True
-     ui.display_clock = True
-     ui.display_qlength = True
-@@ -267,7 +267,7 @@ def update_config(target, source):
-     >>> from iniparse import ini
-     >>> i = ini.INIConfig()
-     >>> update_config(i, n)
--    >>> print i
-+    >>> print(i)
-     [playlist]
-     expand_playlist = True
-     <BLANKLINE>
-@@ -277,7 +277,7 @@ def update_config(target, source):
-     width = 150
- 
-     """
--    for name in source:
-+    for name in sorted(source):
-         value = source[name]
-         if isinstance(value, ConfigNamespace):
-             if name in target:
-diff --git a/iniparse/configparser.py b/iniparse/configparser.py
-new file mode 100644
-index 0000000..c543d50
---- /dev/null
-+++ b/iniparse/configparser.py
-@@ -0,0 +1,7 @@
-+try:
-+    from ConfigParser import *
-+    # not all objects get imported with __all__
-+    from ConfigParser import Error, InterpolationMissingOptionError
-+except ImportError:
-+    from configparser import *
-+    from configparser import Error, InterpolationMissingOptionError
-diff --git a/iniparse/ini.py b/iniparse/ini.py
-index 408354d..052d9e9 100644
---- a/iniparse/ini.py
-+++ b/iniparse/ini.py
-@@ -7,7 +7,7 @@
- 
- Example:
- 
--    >>> from StringIO import StringIO
-+    >>> from six import StringIO
-     >>> sio = StringIO('''# configure foo-application
-     ... [foo]
-     ... bar1 = qualia
-@@ -16,14 +16,14 @@ Example:
-     ... special = 1''')
- 
-     >>> cfg = INIConfig(sio)
--    >>> print cfg.foo.bar1
-+    >>> print(cfg.foo.bar1)
-     qualia
--    >>> print cfg['foo-ext'].special
-+    >>> print(cfg['foo-ext'].special)
-     1
-     >>> cfg.foo.newopt = 'hi!'
-     >>> cfg.baz.enabled = 0
- 
--    >>> print cfg
-+    >>> print(cfg)
-     # configure foo-application
-     [foo]
-     bar1 = qualia
-@@ -42,9 +42,11 @@ Example:
- # Backward-compatiable with ConfigParser
- 
- import re
--from ConfigParser import DEFAULTSECT, ParsingError, MissingSectionHeaderError
-+from .configparser import DEFAULTSECT, ParsingError, MissingSectionHeaderError
- 
--import config
-+import six
-+
-+from . import config
- 
- class LineType(object):
-     line = None
-@@ -278,6 +280,8 @@ class LineContainer(object):
-     value = property(get_value, set_value)
- 
-     def __str__(self):
-+        for c in self.contents:
-+            pass#print(c.__str__())
-         s = [x.__str__() for x in self.contents]
-         return '\n'.join(s)
- 
-@@ -465,7 +469,7 @@ class INIConfig(config.ConfigNamespace):
-         self._sections = {}
-         if defaults is None: defaults = {}
-         self._defaults = INISection(LineContainer(), optionxformsource=self)
--        for name, value in defaults.iteritems():
-+        for name, value in defaults.items():
-             self._defaults[name] = value
-         if fp is not None:
-             self._readfp(fp)
-@@ -551,7 +555,7 @@ class INIConfig(config.ConfigNamespace):
- 
-         for line in readline_iterator(fp):
-             # Check for BOM on first line
--            if linecount == 0 and isinstance(line, unicode):
-+            if linecount == 0 and isinstance(line, six.text_type):
-                 if line[0] == u'\ufeff':
-                     line = line[1:]
-                     self._bom = True
-diff --git a/iniparse/utils.py b/iniparse/utils.py
-index 829fc28..f8b773a 100644
---- a/iniparse/utils.py
-+++ b/iniparse/utils.py
-@@ -1,5 +1,5 @@
--import compat
--from ini import LineContainer, EmptyLine
-+from . import compat
-+from .ini import LineContainer, EmptyLine
- 
- def tidy(cfg):
-     """Clean up blank lines.
-diff --git a/tests/__init__.py b/tests/__init__.py
-index f1fa321..88689fb 100644
---- a/tests/__init__.py
-+++ b/tests/__init__.py
-@@ -1,12 +1,12 @@
- import unittest, doctest
- 
--import test_ini
--import test_misc
--import test_fuzz
--import test_compat
--import test_unicode
--import test_tidy
--import test_multiprocessing
-+from . import test_ini
-+from . import test_misc
-+from . import test_fuzz
-+from . import test_compat
-+from . import test_unicode
-+from . import test_tidy
-+from . import test_multiprocessing
- from iniparse import config
- from iniparse import ini
- 
-diff --git a/tests/test_compat.py b/tests/test_compat.py
-index b8da3d5..b6dfb5c 100644
---- a/tests/test_compat.py
-+++ b/tests/test_compat.py
-@@ -1,9 +1,16 @@
- from iniparse import compat as ConfigParser
--import StringIO
-+from six import StringIO
-+try:
-+    import UserDict
-+except ImportError:
-+    import collections as UserDict
- import unittest
--import UserDict
- 
--from test import test_support
-+import sys
-+if sys.version_info[0] < 3:
-+    from test import test_support
-+else:
-+    from test import support as test_support
- 
- class SortedDict(UserDict.UserDict):
-     def items(self):
-@@ -35,7 +42,7 @@ class TestCaseBase(unittest.TestCase):
- 
-     def fromstring(self, string, defaults=None):
-         cf = self.newconfig(defaults)
--        sio = StringIO.StringIO(string)
-+        sio = StringIO(string)
-         cf.readfp(sio)
-         return cf
- 
-@@ -161,7 +168,7 @@ class TestCaseBase(unittest.TestCase):
-                          "No Section!\n")
- 
-     def parse_error(self, exc, src):
--        sio = StringIO.StringIO(src)
-+        sio = StringIO(src)
-         self.assertRaises(exc, self.cf.readfp, sio)
- 
-     def test_query_errors(self):
-@@ -181,7 +188,7 @@ class TestCaseBase(unittest.TestCase):
-     def get_error(self, exc, section, option):
-         try:
-             self.cf.get(section, option)
--        except exc, e:
-+        except exc as e:
-             return e
-         else:
-             self.fail("expected exception type %s.%s"
-@@ -227,7 +234,7 @@ class TestCaseBase(unittest.TestCase):
-             "foo: another very\n"
-             " long line"
-             )
--        output = StringIO.StringIO()
-+        output = StringIO()
-         cf.write(output)
-         self.assertEqual(
-             output.getvalue(),
-@@ -465,7 +472,7 @@ class SortedTestCase(RawConfigParserTestCase):
-                         "o1=4\n"
-                         "[a]\n"
-                         "k=v\n")
--        output = StringIO.StringIO()
-+        output = StringIO()
-         self.cf.write(output)
-         self.assertEquals(output.getvalue(),
-                           "[a]\n"
-diff --git a/tests/test_fuzz.py b/tests/test_fuzz.py
-index 5420dcc..b219500 100644
---- a/tests/test_fuzz.py
-+++ b/tests/test_fuzz.py
-@@ -1,9 +1,10 @@
- import re
- import os
- import random
-+import sys
- import unittest
--import ConfigParser
--from StringIO import StringIO
-+from six import StringIO
-+from six.moves import configparser
- from iniparse import compat, ini, tidy
- 
- # TODO:
-@@ -96,24 +97,25 @@ class test_fuzz(unittest.TestCase):
-                 s = '\n'.join(good_lines)
-                 cc = compat.RawConfigParser()
-                 cc.readfp(StringIO(s))
--                cc_py = ConfigParser.RawConfigParser()
-+                cc_py = configparser.RawConfigParser()
-                 cc_py.readfp(StringIO(s))
-                 # compare the two configparsers
-                 self.assertEqualConfig(cc_py, cc)
-                 # check that tidy does not change semantics
-                 tidy(cc)
--                cc_tidy = ConfigParser.RawConfigParser()
-+                cc_tidy = configparser.RawConfigParser()
-                 cc_tidy.readfp(StringIO(str(cc.data)))
-                 self.assertEqualConfig(cc_py, cc_tidy)
-             except AssertionError:
-                 fname = 'fuzz-test-iter-%d.ini' % fuzz_iter
--                print 'Fuzz test failed at iteration', fuzz_iter
--                print 'Writing out failing INI file as', fname
-+                print('Fuzz test failed at iteration', fuzz_iter)
-+                print('Writing out failing INI file as', fname)
-                 f = open(fname, 'w')
-                 f.write(s)
-                 f.close()
-                 raise
- 
-+    @unittest.skipIf(sys.version_info[0] > 2, 'http://code.google.com/p/iniparse/issues/detail?id=22#c9')
-     def assertEqualConfig(self, c1, c2):
-         self.assertEqualSorted(c1.sections(), c2.sections())
-         self.assertEqualSorted(c1.defaults().items(), c2.defaults().items())
-@@ -123,9 +125,7 @@ class test_fuzz(unittest.TestCase):
-                 self.assertEqual(c1.get(sec, opt), c2.get(sec, opt))
- 
-     def assertEqualSorted(self, l1, l2):
--        l1.sort()
--        l2.sort()
--        self.assertEqual(l1, l2)
-+        self.assertEqual(sorted(l1), sorted(l2))
- 
- class suite(unittest.TestSuite):
-     def __init__(self):
-diff --git a/tests/test_ini.py b/tests/test_ini.py
-index 6a76edb..07d4f4e 100644
---- a/tests/test_ini.py
-+++ b/tests/test_ini.py
-@@ -1,5 +1,5 @@
- import unittest
--from StringIO import StringIO
-+from six import StringIO
- 
- from iniparse import ini
- from iniparse import compat
-@@ -196,13 +196,13 @@ but = also me
-         self.assertEqual(p._data.find('section2').find('just').value, 'kidding')
- 
-         itr = p._data.finditer('section1')
--        v = itr.next()
-+        v = next(itr)
-         self.assertEqual(v.find('help').value, 'yourself')
-         self.assertEqual(v.find('but').value, 'also me')
--        v = itr.next()
-+        v = next(itr)
-         self.assertEqual(v.find('help').value, 'me')
-         self.assertEqual(v.find('I\'m').value, 'desperate')
--        self.assertRaises(StopIteration, itr.next)
-+        self.assertRaises(StopIteration, next, itr)
- 
-         self.assertRaises(KeyError, p._data.find, 'section')
-         self.assertRaises(KeyError, p._data.find('section2').find, 'ahem')
-diff --git a/tests/test_misc.py b/tests/test_misc.py
-index 31cf4da..96ef035 100644
---- a/tests/test_misc.py
-+++ b/tests/test_misc.py
-@@ -1,9 +1,9 @@
- import re
- import unittest
- import pickle
--import ConfigParser
-+from six.moves import configparser
-+from six import StringIO
- from textwrap import dedent
--from StringIO import StringIO
- from iniparse import compat, ini
- 
- class CaseSensitiveConfigParser(compat.ConfigParser):
-diff --git a/tests/test_tidy.py b/tests/test_tidy.py
-index 7304747..26b6cde 100644
---- a/tests/test_tidy.py
-+++ b/tests/test_tidy.py
-@@ -1,6 +1,6 @@
- import unittest
- from textwrap import dedent
--from StringIO import StringIO
-+from six import StringIO
- 
- from iniparse import tidy,INIConfig
- from iniparse.ini import  EmptyLine
-diff --git a/tests/test_unicode.py b/tests/test_unicode.py
-index a56fcab..14d4fbd 100644
---- a/tests/test_unicode.py
-+++ b/tests/test_unicode.py
-@@ -1,5 +1,5 @@
- import unittest
--from StringIO import StringIO
-+import six
- from iniparse import compat, ini
- 
- class test_unicode(unittest.TestCase):
-@@ -17,14 +17,14 @@ baz = Marc-Andr\202
-     """
- 
-     def basic_tests(self, s, strable):
--        f = StringIO(s)
-+        f = six.StringIO(s)
-         i = ini.INIConfig(f)
--        self.assertEqual(unicode(i), s)
--        self.assertEqual(type(i.foo.bar), unicode)
-+        self.assertEqual(six.text_type(i), s)
-+        self.assertEqual(type(i.foo.bar), six.text_type)
-         if strable:
-             self.assertEqual(str(i), str(s))
-         else:
--            self.assertRaises(UnicodeEncodeError, lambda: str(i))
-+            self.assertRaises(UnicodeEncodeError, lambda: six.text_type(i).encode('ascii'))
-         return i
- 
-     def test_ascii(self):
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/python/python3-iniparse_0.4.bb b/meta/recipes-devtools/python/python3-iniparse_0.5.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-iniparse_0.4.bb
rename to meta/recipes-devtools/python/python3-iniparse_0.5.bb
index 47cd6598cc..4ed82eab29 100644
--- a/meta/recipes-devtools/python/python3-iniparse_0.4.bb
+++ b/meta/recipes-devtools/python/python3-iniparse_0.5.bb
@@ -4,12 +4,9 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE-PSF;md5=1c78a5bb3584b353496d5f6f34edb4b2 \
                     file://LICENSE;md5=52f28065af11d69382693b45b5a8eb54"
 
-SRC_URI = "file://0001-Add-python-3-compatibility.patch "
+SRC_URI[sha256sum] = "932e5239d526e7acb504017bb707be67019ac428a6932368e6851691093aa842"
 
-SRC_URI[md5sum] = "5e573e9e9733d97623881ce9bbe5eca6"
-SRC_URI[sha256sum] = "abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054"
-
-inherit pypi distutils3
+inherit pypi setuptools3
 
 RDEPENDS_${PN} += "python3-core python3-six"
 DEPENDS += "python3-six"
-- 
2.31.1

