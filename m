Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web08.7665.1624861265935622054
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 23:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qtzaHVUm;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id e26so8038891vsh.7
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 23:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rXRQ8CzvzgCRHwQeZQWGi2yZ3xYgV2iXonFFlDCjuOo=;
        b=qtzaHVUmD849sslUWN4QB0a3X5ieF1Ilh41j3u/yx+jk/nXyX8nq17n3kuiaf1BU0Q
         Qu/eKZ8OiCpoHCuj9R3whBrvBBvqMHAi5BOcexSXpqCasjLbx/53zP4mXrQJ1WGhe47Q
         btL4ZmWBlVX8O430kKXYIPhRdNaxVqyIMeCFXypOJ1oNLkgCEvjvoROciiry+oIgSKPM
         N349nW/cx0oHrNqclkpdXKI9xUBirQgTyesgSccIEzY71pY8ID2LbuyFAGscfscE66B/
         XKBWCU31VyV64cqn65WgHsYmjVYoJx3YemoGFpFcF8sGND8MnrM4c/5fh2sgbr0Qr9C4
         TdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rXRQ8CzvzgCRHwQeZQWGi2yZ3xYgV2iXonFFlDCjuOo=;
        b=HnwTB0wSJdKTEslLVYbxaTM1ubaIGJ8/vsG8nMrXCUDXh4sMWQaqj2D08MpgXaM6Jk
         lp4ev4e8bf+VskGO1N2jKSL7DFASIciJDgLyMQmJt2H3U9IXa3jQog8Pkc55P73inx+x
         qi+0XnwRSAwyAARGa/eTOHuBNiks4acuT7eKDCm+uE5wzWysnZEAQtW8gqeb1nWGyOeO
         g2qjXueF5WZpA8KtXvOEmpbzf7YPmSTo78GiuahyKdPRnQD6zJRjtO8ENah+sRulsVhY
         xENWg4yAaFd74ywg1t/if9ZVsRRqUYQHgMRunmCJE3DN7+k5YLS0qUsNG4C2+A+6/hRw
         AcgA==
X-Gm-Message-State: AOAM533giXoi0kVXIly3IF8CLtX/tVmwYFzHJLL8WhphlK10cBeX9Puo
	fT3gnfIJoF9XUQ0Nxw4fUCA2MfpVl6NJvkSuPDQ=
X-Google-Smtp-Source: ABdhPJxXDh3Lupi4QTHEYtDdh8Sel245VxldQSke/AT3uqAg+bjPSlYd7xVb/1qe06aO6CsUWrgr3JKFMXoMUpq8Hvc=
X-Received: by 2002:a05:6102:21b3:: with SMTP id i19mr16699867vsb.41.1624861265023;
 Sun, 27 Jun 2021 23:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210628055915.1107-1-raj.khem@gmail.com> <CANNYZj_27HL2PMRW-2E5sf+LjBCL_gKQQbyu5ogvE4NsnTWZcQ@mail.gmail.com>
 <CAMKF1sqdn9E--goYuo3qNAT0-DMT25dSyFZvb1Sxmq_eGn=A-Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqdn9E--goYuo3qNAT0-DMT25dSyFZvb1Sxmq_eGn=A-Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 28 Jun 2021 08:20:53 +0200
Message-ID: <CANNYZj9QZ5sojh=-oB_RRrbYoyxQ7JE_gHz46QYXWdRERwNMJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/8] PEP8 double aggressive E401
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	persianpros <persianpros@yahoo.com>
Content-Type: multipart/alternative; boundary="00000000000082d79305c5cd7e3c"

--00000000000082d79305c5cd7e3c
Content-Type: text/plain; charset="UTF-8"

Right, but can you please write something more descriptive than "PEP8
double aggressive W291 ~ W293 and W391" ?

Also I'm not sure fiddling about with whitespace or whether imports all
need their own line really helps.

Alex

On Mon, 28 Jun 2021 at 08:16, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Jun 27, 2021 at 11:13 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Wait, what is this patchset all about?
> >
>
> its fixes for python linter (pylint) found issues.
>
> > Alex
> >
> > On Mon, 28 Jun 2021 at 07:59, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> From: persianpros <persianpros@yahoo.com>
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta/lib/oe/package.py                                |  9 +++++++--
> >>  meta/lib/oe/qa.py                                     |  4 +++-
> >>  meta/lib/oe/utils.py                                  |  6 ++++--
> >>  meta/lib/oeqa/oetest.py                               |  4 +++-
> >>  meta/lib/oeqa/sdk/case.py                             |  3 ++-
> >>  meta/lib/oeqa/sdk/cases/buildlzip.py                  |  5 ++++-
> >>  meta/lib/oeqa/sdk/cases/python.py                     |  3 ++-
> >>  meta/lib/oeqa/sdk/testsdk.py                          |  3 ++-
> >>  meta/lib/oeqa/selftest/cases/oelib/path.py            |  3 ++-
> >>  meta/lib/oeqa/selftest/cases/package.py               |  7 +++++--
> >>  meta/lib/oeqa/selftest/cases/runtime_test.py          |  3 ++-
> >>  meta/lib/oeqa/utils/testexport.py                     |  6 +++++-
> >>  .../texinfo-dummy-native/texinfo-dummy/template.py    |  4 +++-
> >>  scripts/combo-layer                                   |  3 ++-
> >>  scripts/contrib/patchreview.py                        | 11 ++++++++---
> >>  scripts/lnr                                           |  3 ++-
> >>  scripts/oe-pkgdata-browser                            |  5 ++++-
> >>  .../pybootchartgui/tests/parser_test.py               |  7 ++++++-
> >>  scripts/send-error-report                             |  3 ++-
> >>  scripts/verify-bashisms                               |  9 +++++++--
> >>  20 files changed, 75 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> >> index dd700cbb0c..fc5408d5f8 100644
> >> --- a/meta/lib/oe/package.py
> >> +++ b/meta/lib/oe/package.py
> >> @@ -107,7 +107,10 @@ def strip_execs(pn, dstdir, strip_cmd, libdir,
> base_libdir, d, qa_already_stripp
> >>      :param qa_already_stripped: Set to True if already-stripped' in
> ${INSANE_SKIP}
> >>      This is for proper logging and messages only.
> >>      """
> >> -    import stat, errno, oe.path, oe.utils
> >> +    import stat
> >> +    import errno
> >> +    import oe.path
> >> +    import oe.utils
> >>
> >>      elffiles = {}
> >>      inodes = {}
> >> @@ -187,7 +190,9 @@ def file_translate(file):
> >>      return ft
> >>
> >>  def filedeprunner(arg):
> >> -    import re, subprocess, shlex
> >> +    import re
> >> +    import subprocess
> >> +    import shlex
> >>
> >>      (pkg, pkgfiles, rpmdeps, pkgdest) = arg
> >>      provides = {}
> >> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> >> index e8a854a302..38c2e0cc1c 100644
> >> --- a/meta/lib/oe/qa.py
> >> +++ b/meta/lib/oe/qa.py
> >> @@ -2,7 +2,9 @@
> >>  # SPDX-License-Identifier: GPL-2.0-only
> >>  #
> >>
> >> -import os, struct, mmap
> >> +import os
> >> +import struct
> >> +import mmap
> >>
> >>  class NotELFFileError(Exception):
> >>      pass
> >> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> >> index a84039f585..789bad33f6 100644
> >> --- a/meta/lib/oe/utils.py
> >> +++ b/meta/lib/oe/utils.py
> >> @@ -376,7 +376,8 @@ def format_pkg_list(pkg_dict, ret_format=None):
> >>  # Helper function to get the host compiler version
> >>  # Do not assume the compiler is gcc
> >>  def get_host_compiler_version(d, taskcontextonly=False):
> >> -    import re, subprocess
> >> +    import re
> >> +    import subprocess
> >>
> >>      if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
> >>          return
> >> @@ -404,7 +405,8 @@ def get_host_compiler_version(d,
> taskcontextonly=False):
> >>
> >>
> >>  def host_gcc_version(d, taskcontextonly=False):
> >> -    import re, subprocess
> >> +    import re
> >> +    import subprocess
> >>
> >>      if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
> >>          return
> >> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
> >> index 9c84466dd0..3136ac2ce5 100644
> >> --- a/meta/lib/oeqa/oetest.py
> >> +++ b/meta/lib/oeqa/oetest.py
> >> @@ -9,7 +9,9 @@
> >>
> >>  # It also has some helper functions and it's responsible for actually
> starting the tests
> >>
> >> -import os, re, sys
> >> +import os
> >> +import re
> >> +import sys
> >>  import unittest
> >>  import inspect
> >>  import subprocess
> >> diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> >> index c45882689c..86ac199197 100644
> >> --- a/meta/lib/oeqa/sdk/case.py
> >> +++ b/meta/lib/oeqa/sdk/case.py
> >> @@ -35,7 +35,8 @@ class OESDKTestCase(OETestCase):
> >>          OS/architecture, or if not specified the currently configured
> MACHINE's
> >>          OS/architecture.
> >>          """
> >> -        import oe.qa, oe.elf
> >> +        import oe.qa
> >> +        import oe.elf
> >>
> >>          if not target_os or not target_arch:
> >>              output = self._run("echo
> $OECORE_TARGET_OS:$OECORE_TARGET_ARCH")
> >> diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py
> b/meta/lib/oeqa/sdk/cases/buildlzip.py
> >> index 49ae756bf3..04c4a0ec16 100644
> >> --- a/meta/lib/oeqa/sdk/cases/buildlzip.py
> >> +++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
> >> @@ -2,7 +2,10 @@
> >>  # SPDX-License-Identifier: MIT
> >>  #
> >>
> >> -import os, tempfile, subprocess, unittest
> >> +import os
> >> +import tempfile
> >> +import subprocess
> >> +import unittest
> >>  from oeqa.sdk.case import OESDKTestCase
> >>  from oeqa.utils.subprocesstweak import errors_have_output
> >>  errors_have_output()
> >> diff --git a/meta/lib/oeqa/sdk/cases/python.py
> b/meta/lib/oeqa/sdk/cases/python.py
> >> index a334abce5f..2848481f33 100644
> >> --- a/meta/lib/oeqa/sdk/cases/python.py
> >> +++ b/meta/lib/oeqa/sdk/cases/python.py
> >> @@ -2,7 +2,8 @@
> >>  # SPDX-License-Identifier: MIT
> >>  #
> >>
> >> -import subprocess, unittest
> >> +import subprocess
> >> +import unittest
> >>  from oeqa.sdk.case import OESDKTestCase
> >>
> >>  from oeqa.utils.subprocesstweak import errors_have_output
> >> diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
> >> index 35e40187bc..18e03cb8ef 100644
> >> --- a/meta/lib/oeqa/sdk/testsdk.py
> >> +++ b/meta/lib/oeqa/sdk/testsdk.py
> >> @@ -95,7 +95,8 @@ class TestSDK(TestSDKBase):
> >>          processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or
> d.getVar("BB_NUMBER_THREADS")
> >>          if processes:
> >>              try:
> >> -                import testtools, subunit
> >> +                import testtools
> >> +                import subunit
> >>              except ImportError:
> >>                  bb.warn("Failed to import testtools or subunit, the
> testcases will run serially")
> >>                  processes = None
> >> diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py
> b/meta/lib/oeqa/selftest/cases/oelib/path.py
> >> index a1cfa08c09..098734fa5d 100644
> >> --- a/meta/lib/oeqa/selftest/cases/oelib/path.py
> >> +++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
> >> @@ -3,7 +3,8 @@
> >>  #
> >>
> >>  from unittest.case import TestCase
> >> -import oe, oe.path
> >> +import oe
> >> +import oe.path
> >>  import tempfile
> >>  import os
> >>  import errno
> >> diff --git a/meta/lib/oeqa/selftest/cases/package.py
> b/meta/lib/oeqa/selftest/cases/package.py
> >> index 7166c3991f..82aa1bde1c 100644
> >> --- a/meta/lib/oeqa/selftest/cases/package.py
> >> +++ b/meta/lib/oeqa/selftest/cases/package.py
> >> @@ -5,7 +5,8 @@
> >>  from oeqa.selftest.case import OESelftestTestCase
> >>  from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var,
> runqemu
> >>  import stat
> >> -import subprocess, os
> >> +import subprocess
> >> +import os
> >>  import oe.path
> >>  import re
> >>
> >> @@ -150,7 +151,9 @@ class PackageTests(OESelftestTestCase):
> >>                      self.fail('GDB %s failed' % binary)
> >>
> >>      def test_preserve_ownership(self):
> >> -        import os, stat, oe.cachedpath
> >> +        import os
> >> +        import stat
> >> +        import oe.cachedpath
> >>          features = 'IMAGE_INSTALL_append = " selftest-chown"\n'
> >>          self.write_config(features)
> >>          bitbake("core-image-minimal")
> >> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py
> b/meta/lib/oeqa/selftest/cases/runtime_test.py
> >> index d0c2440722..54a80dfdc0 100644
> >> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> >> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> >> @@ -211,7 +211,8 @@ class TestImage(OESelftestTestCase):
> >>          Product: oe-core
> >>          Author: Alexander Kanavin <alex.kanavin@gmail.com>
> >>          """
> >> -        import subprocess, os
> >> +        import subprocess
> >> +        import os
> >>          try:
> >>              content = os.listdir("/dev/dri")
> >>              if len([i for i in content if i.startswith('render')]) ==
> 0:
> >> diff --git a/meta/lib/oeqa/utils/testexport.py
> b/meta/lib/oeqa/utils/testexport.py
> >> index e89d130a9c..383e57a6b2 100644
> >> --- a/meta/lib/oeqa/utils/testexport.py
> >> +++ b/meta/lib/oeqa/utils/testexport.py
> >> @@ -6,7 +6,11 @@
> >>
> >>  # Provides functions to help with exporting binaries obtained from
> built targets
> >>
> >> -import os, re, glob as g, shutil as sh,sys
> >> +import os
> >> +import re
> >> +import glob as g
> >> +import shutil as sh
> >> +import sys
> >>  from time import sleep
> >>  from .commands import runCmd
> >>  from difflib import SequenceMatcher as SM
> >> diff --git
> a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> >> index 86c7c1811a..75c01b83bf 100644
> >> ---
> a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> >> +++
> b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> >> @@ -28,7 +28,9 @@
> >>  # of the executable from argv[0] and emulate the corresponding
> program, so
> >>  # multiple copies of this script will exist under different names.
> >>
> >> -import sys, os, argparse
> >> +import sys
> >> +import os
> >> +import argparse
> >>
> >>
> >>  this_binary = sys.argv[0].split("/")[-1]
> >> diff --git a/scripts/combo-layer b/scripts/combo-layer
> >> index 045de65642..835a6bcd09 100755
> >> --- a/scripts/combo-layer
> >> +++ b/scripts/combo-layer
> >> @@ -11,7 +11,8 @@
> >>  #
> >>
> >>  import fnmatch
> >> -import os, sys
> >> +import os
> >> +import sys
> >>  import optparse
> >>  import logging
> >>  import subprocess
> >> diff --git a/scripts/contrib/patchreview.py
> b/scripts/contrib/patchreview.py
> >> index 62c509f51c..744dcfb49e 100755
> >> --- a/scripts/contrib/patchreview.py
> >> +++ b/scripts/contrib/patchreview.py
> >> @@ -40,7 +40,8 @@ def blame_patch(patch):
> >>                                      "--",
> patch)).decode("utf-8").splitlines()
> >>
> >>  def patchreview(path, patches):
> >> -    import re, os.path
> >> +    import re
> >> +    import os.path
> >>
> >>      # General pattern: start of line, optional whitespace, tag with
> optional
> >>      # hyphen or spaces, maybe a colon, some whitespace, then the
> value, all case
> >> @@ -198,7 +199,9 @@ def histogram(results):
> >>
> >>
> >>  if __name__ == "__main__":
> >> -    import argparse, subprocess, os
> >> +    import argparse
> >> +    import subprocess
> >> +    import os
> >>
> >>      args = argparse.ArgumentParser(description="Patch Review Tool")
> >>      args.add_argument("-b", "--blame", action="store_true", help="show
> blame for malformed patches")
> >> @@ -213,7 +216,9 @@ if __name__ == "__main__":
> >>      analyse(results, want_blame=args.blame, verbose=args.verbose)
> >>
> >>      if args.json:
> >> -        import json, os.path, collections
> >> +        import json
> >> +        import os.path
> >> +        import collections
> >>          if os.path.isfile(args.json):
> >>              data = json.load(open(args.json))
> >>          else:
> >> diff --git a/scripts/lnr b/scripts/lnr
> >> index a2ac4fec0f..e223b1e0e6 100755
> >> --- a/scripts/lnr
> >> +++ b/scripts/lnr
> >> @@ -6,7 +6,8 @@
> >>  # Create a *relative* symlink, just like ln --relative does but
> without needing
> >>  # coreutils 8.16.
> >>
> >> -import sys, os
> >> +import sys
> >> +import os
> >>
> >>  if len(sys.argv) != 3:
> >>     print("$ lnr TARGET LINK_NAME")
> >> diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
> >> index 8d223185a4..5834f59845 100755
> >> --- a/scripts/oe-pkgdata-browser
> >> +++ b/scripts/oe-pkgdata-browser
> >> @@ -1,6 +1,9 @@
> >>  #! /usr/bin/env python3
> >>
> >> -import os, sys, enum, ast
> >> +import os
> >> +import sys
> >> +import enum
> >> +import ast
> >>
> >>  scripts_path = os.path.dirname(os.path.realpath(__file__))
> >>  lib_path = scripts_path + '/lib'
> >> diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> >> index 00fb3bf797..c005cf341f 100644
> >> --- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> >> +++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> >> @@ -1,4 +1,9 @@
> >> -import sys, os, re, struct, operator, math
> >> +import sys
> >> +import os
> >> +import re
> >> +import struct
> >> +import operator
> >> +import math
> >>  from collections import defaultdict
> >>  import unittest
> >>
> >> diff --git a/scripts/send-error-report b/scripts/send-error-report
> >> index cfbcaa52cb..ffa0a199b1 100755
> >> --- a/scripts/send-error-report
> >> +++ b/scripts/send-error-report
> >> @@ -10,7 +10,8 @@
> >>  # SPDX-License-Identifier: GPL-2.0-only
> >>  #
> >>
> >> -import urllib.request, urllib.error
> >> +import urllib.request
> >> +import urllib.error
> >>  import sys
> >>  import json
> >>  import os
> >> diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
> >> index 14d8c298e9..a63f6c8115 100755
> >> --- a/scripts/verify-bashisms
> >> +++ b/scripts/verify-bashisms
> >> @@ -3,7 +3,11 @@
> >>  # SPDX-License-Identifier: GPL-2.0-only
> >>  #
> >>
> >> -import sys, os, subprocess, re, shutil
> >> +import sys
> >> +import os
> >> +import subprocess
> >> +import re
> >> +import shutil
> >>
> >>  whitelist = (
> >>      # type is supported by dash
> >> @@ -92,7 +96,8 @@ def get_tinfoil():
> >>      return tinfoil
> >>
> >>  if __name__=='__main__':
> >> -    import argparse, shutil
> >> +    import argparse
> >> +    import shutil
> >>
> >>      parser = argparse.ArgumentParser(description='Bashim detector for
> shell fragments in recipes.')
> >>      parser.add_argument("recipes", metavar="RECIPE", nargs="*",
> help="recipes to check (if not specified, all will be checked)")
> >> --
> >> 2.32.0
> >>
> >>
> >> 
> >>
>

--00000000000082d79305c5cd7e3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, but can you please write something more descri=
ptive than &quot;PEP8 double aggressive W291 ~ W293 and W391&quot; ?</div><=
div><br></div><div>Also I&#39;m not sure fiddling about with whitespace or =
whether imports all need their own line really helps.<br></div><div><br></d=
iv><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, 28 Jun 2021 at 08:16, Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Jun=
 27, 2021 at 11:13 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Wait, what is this patchset all about?<br>
&gt;<br>
<br>
its fixes for python linter (pylint) found issues.<br>
<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 28 Jun 2021 at 07:59, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: persianpros &lt;<a href=3D"mailto:persianpros@yahoo.com" ta=
rget=3D"_blank">persianpros@yahoo.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/lib/oe/package.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 9 +++++++--<br>
&gt;&gt;=C2=A0 meta/lib/oe/qa.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 +++-<br>
&gt;&gt;=C2=A0 meta/lib/oe/utils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 |=C2=A0 6 ++++--<br>
&gt;&gt;=C2=A0 meta/lib/oeqa/oetest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 +++-<br>
&gt;&gt;=C2=A0 meta/lib/oeqa/sdk/case.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 3 ++-<br>
&gt;&gt;=C2=A0 meta/lib/oeqa/sdk/cases/buildlzip.py=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++-<br>
&gt;&gt;=C2=A0 meta/lib/oeqa/sdk/cases/python.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
&gt;&gt;=C2=A0 meta/lib/oeqa/sdk/testsdk.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<=
br>
&gt;&gt;=C2=A0 meta/lib/oeqa/selftest/cases/oelib/path.py=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
&gt;&gt;=C2=A0 meta/lib/oeqa/selftest/cases/package.py=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++--<br>
&gt;&gt;=C2=A0 meta/lib/oeqa/selftest/cases/runtime_test.py=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
&gt;&gt;=C2=A0 meta/lib/oeqa/utils/testexport.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++-<br>
&gt;&gt;=C2=A0 .../texinfo-dummy-native/texinfo-dummy/template.py=C2=A0 =
=C2=A0 |=C2=A0 4 +++-<br>
&gt;&gt;=C2=A0 scripts/combo-layer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
&gt;&gt;=C2=A0 scripts/contrib/patchreview.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++++++---<b=
r>
&gt;&gt;=C2=A0 scripts/lnr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
&gt;&gt;=C2=A0 scripts/oe-pkgdata-browser=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 5 ++++-<br>
&gt;&gt;=C2=A0 .../pybootchartgui/tests/parser_test.py=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++++++-<br>
&gt;&gt;=C2=A0 scripts/send-error-report=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 3 ++-<br>
&gt;&gt;=C2=A0 scripts/verify-bashisms=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 9 +++++++--<br>
&gt;&gt;=C2=A0 20 files changed, 75 insertions(+), 26 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
&gt;&gt; index dd700cbb0c..fc5408d5f8 100644<br>
&gt;&gt; --- a/meta/lib/oe/package.py<br>
&gt;&gt; +++ b/meta/lib/oe/package.py<br>
&gt;&gt; @@ -107,7 +107,10 @@ def strip_execs(pn, dstdir, strip_cmd, libdi=
r, base_libdir, d, qa_already_stripp<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 :param qa_already_stripped: Set to True if al=
ready-stripped&#39; in ${INSANE_SKIP}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 This is for proper logging and messages only.=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 import stat, errno, oe.path, oe.utils<br>
&gt;&gt; +=C2=A0 =C2=A0 import stat<br>
&gt;&gt; +=C2=A0 =C2=A0 import errno<br>
&gt;&gt; +=C2=A0 =C2=A0 import oe.path<br>
&gt;&gt; +=C2=A0 =C2=A0 import oe.utils<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 elffiles =3D {}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 inodes =3D {}<br>
&gt;&gt; @@ -187,7 +190,9 @@ def file_translate(file):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return ft<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 def filedeprunner(arg):<br>
&gt;&gt; -=C2=A0 =C2=A0 import re, subprocess, shlex<br>
&gt;&gt; +=C2=A0 =C2=A0 import re<br>
&gt;&gt; +=C2=A0 =C2=A0 import subprocess<br>
&gt;&gt; +=C2=A0 =C2=A0 import shlex<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 (pkg, pkgfiles, rpmdeps, pkgdest) =3D arg<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 provides =3D {}<br>
&gt;&gt; diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py<br>
&gt;&gt; index e8a854a302..38c2e0cc1c 100644<br>
&gt;&gt; --- a/meta/lib/oe/qa.py<br>
&gt;&gt; +++ b/meta/lib/oe/qa.py<br>
&gt;&gt; @@ -2,7 +2,9 @@<br>
&gt;&gt;=C2=A0 # SPDX-License-Identifier: GPL-2.0-only<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;<br>
&gt;&gt; -import os, struct, mmap<br>
&gt;&gt; +import os<br>
&gt;&gt; +import struct<br>
&gt;&gt; +import mmap<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 class NotELFFileError(Exception):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt;&gt; diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
&gt;&gt; index a84039f585..789bad33f6 100644<br>
&gt;&gt; --- a/meta/lib/oe/utils.py<br>
&gt;&gt; +++ b/meta/lib/oe/utils.py<br>
&gt;&gt; @@ -376,7 +376,8 @@ def format_pkg_list(pkg_dict, ret_format=3DNo=
ne):<br>
&gt;&gt;=C2=A0 # Helper function to get the host compiler version<br>
&gt;&gt;=C2=A0 # Do not assume the compiler is gcc<br>
&gt;&gt;=C2=A0 def get_host_compiler_version(d, taskcontextonly=3DFalse):<=
br>
&gt;&gt; -=C2=A0 =C2=A0 import re, subprocess<br>
&gt;&gt; +=C2=A0 =C2=A0 import re<br>
&gt;&gt; +=C2=A0 =C2=A0 import subprocess<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if taskcontextonly and d.getVar(&#39;BB_WORKE=
RCONTEXT&#39;) !=3D &#39;1&#39;:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt; @@ -404,7 +405,8 @@ def get_host_compiler_version(d, taskcontexto=
nly=3DFalse):<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 def host_gcc_version(d, taskcontextonly=3DFalse):<br>
&gt;&gt; -=C2=A0 =C2=A0 import re, subprocess<br>
&gt;&gt; +=C2=A0 =C2=A0 import re<br>
&gt;&gt; +=C2=A0 =C2=A0 import subprocess<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if taskcontextonly and d.getVar(&#39;BB_WORKE=
RCONTEXT&#39;) !=3D &#39;1&#39;:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt; diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py<br=
>
&gt;&gt; index 9c84466dd0..3136ac2ce5 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/oetest.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/oetest.py<br>
&gt;&gt; @@ -9,7 +9,9 @@<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # It also has some helper functions and it&#39;s responsibl=
e for actually starting the tests<br>
&gt;&gt;<br>
&gt;&gt; -import os, re, sys<br>
&gt;&gt; +import os<br>
&gt;&gt; +import re<br>
&gt;&gt; +import sys<br>
&gt;&gt;=C2=A0 import unittest<br>
&gt;&gt;=C2=A0 import inspect<br>
&gt;&gt;=C2=A0 import subprocess<br>
&gt;&gt; diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.p=
y<br>
&gt;&gt; index c45882689c..86ac199197 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/sdk/case.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/sdk/case.py<br>
&gt;&gt; @@ -35,7 +35,8 @@ class OESDKTestCase(OETestCase):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OS/architecture, or if not spec=
ified the currently configured MACHINE&#39;s<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OS/architecture.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 import <a href=3D"http://oe.qa" rel=
=3D"noreferrer" target=3D"_blank">oe.qa</a>, oe.elf<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import <a href=3D"http://oe.qa" rel=
=3D"noreferrer" target=3D"_blank">oe.qa</a><br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import oe.elf<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not target_os or not target_=
arch:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D self._=
run(&quot;echo $OECORE_TARGET_OS:$OECORE_TARGET_ARCH&quot;)<br>
&gt;&gt; diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa=
/sdk/cases/buildlzip.py<br>
&gt;&gt; index 49ae756bf3..04c4a0ec16 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/sdk/cases/buildlzip.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/sdk/cases/buildlzip.py<br>
&gt;&gt; @@ -2,7 +2,10 @@<br>
&gt;&gt;=C2=A0 # SPDX-License-Identifier: MIT<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;<br>
&gt;&gt; -import os, tempfile, subprocess, unittest<br>
&gt;&gt; +import os<br>
&gt;&gt; +import tempfile<br>
&gt;&gt; +import subprocess<br>
&gt;&gt; +import unittest<br>
&gt;&gt;=C2=A0 from oeqa.sdk.case import OESDKTestCase<br>
&gt;&gt;=C2=A0 from oeqa.utils.subprocesstweak import errors_have_output<b=
r>
&gt;&gt;=C2=A0 errors_have_output()<br>
&gt;&gt; diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sd=
k/cases/python.py<br>
&gt;&gt; index a334abce5f..2848481f33 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/sdk/cases/python.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/sdk/cases/python.py<br>
&gt;&gt; @@ -2,7 +2,8 @@<br>
&gt;&gt;=C2=A0 # SPDX-License-Identifier: MIT<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;<br>
&gt;&gt; -import subprocess, unittest<br>
&gt;&gt; +import subprocess<br>
&gt;&gt; +import unittest<br>
&gt;&gt;=C2=A0 from oeqa.sdk.case import OESDKTestCase<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 from oeqa.utils.subprocesstweak import errors_have_output<b=
r>
&gt;&gt; diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/tes=
tsdk.py<br>
&gt;&gt; index 35e40187bc..18e03cb8ef 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/sdk/testsdk.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/sdk/testsdk.py<br>
&gt;&gt; @@ -95,7 +95,8 @@ class TestSDK(TestSDKBase):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 processes =3D d.getVar(&quot;TE=
STIMAGE_NUMBER_THREADS&quot;) or d.getVar(&quot;BB_NUMBER_THREADS&quot;)<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if processes:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import t=
esttools, subunit<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import t=
esttools<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import s=
ubunit<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ImportErro=
r:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.=
warn(&quot;Failed to import testtools or subunit, the testcases will run se=
rially&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pro=
cesses =3D None<br>
&gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/li=
b/oeqa/selftest/cases/oelib/path.py<br>
&gt;&gt; index a1cfa08c09..098734fa5d 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/selftest/cases/oelib/path.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/oelib/path.py<br>
&gt;&gt; @@ -3,7 +3,8 @@<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 from unittest.case import TestCase<br>
&gt;&gt; -import oe, oe.path<br>
&gt;&gt; +import oe<br>
&gt;&gt; +import oe.path<br>
&gt;&gt;=C2=A0 import tempfile<br>
&gt;&gt;=C2=A0 import os<br>
&gt;&gt;=C2=A0 import errno<br>
&gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/o=
eqa/selftest/cases/package.py<br>
&gt;&gt; index 7166c3991f..82aa1bde1c 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/selftest/cases/package.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/package.py<br>
&gt;&gt; @@ -5,7 +5,8 @@<br>
&gt;&gt;=C2=A0 from oeqa.selftest.case import OESelftestTestCase<br>
&gt;&gt;=C2=A0 from oeqa.utils.commands import bitbake, get_bb_vars, get_b=
b_var, runqemu<br>
&gt;&gt;=C2=A0 import stat<br>
&gt;&gt; -import subprocess, os<br>
&gt;&gt; +import subprocess<br>
&gt;&gt; +import os<br>
&gt;&gt;=C2=A0 import oe.path<br>
&gt;&gt;=C2=A0 import re<br>
&gt;&gt;<br>
&gt;&gt; @@ -150,7 +151,9 @@ class PackageTests(OESelftestTestCase):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 self.fail(&#39;GDB %s failed&#39; % binary)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 def test_preserve_ownership(self):<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os, stat, oe.cachedpath<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import stat<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import oe.cachedpath<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;IMAGE_INSTALL=
_append =3D &quot; selftest-chown&quot;\n&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(features)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;core-image-minima=
l&quot;)<br>
&gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/=
lib/oeqa/selftest/cases/runtime_test.py<br>
&gt;&gt; index d0c2440722..54a80dfdc0 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/selftest/cases/runtime_test.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py<br>
&gt;&gt; @@ -211,7 +211,8 @@ class TestImage(OESelftestTestCase):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Product: oe-core<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Author: Alexander Kanavin &lt;<=
a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gma=
il.com</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 import subprocess, os<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import subprocess<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 content =3D os.li=
stdir(&quot;/dev/dri&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len([i for i i=
n content if i.startswith(&#39;render&#39;)]) =3D=3D 0:<br>
&gt;&gt; diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/ut=
ils/testexport.py<br>
&gt;&gt; index e89d130a9c..383e57a6b2 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/utils/testexport.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/utils/testexport.py<br>
&gt;&gt; @@ -6,7 +6,11 @@<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # Provides functions to help with exporting binaries obtain=
ed from built targets<br>
&gt;&gt;<br>
&gt;&gt; -import os, re, glob as g, shutil as sh,sys<br>
&gt;&gt; +import os<br>
&gt;&gt; +import re<br>
&gt;&gt; +import glob as g<br>
&gt;&gt; +import shutil as sh<br>
&gt;&gt; +import sys<br>
&gt;&gt;=C2=A0 from time import sleep<br>
&gt;&gt;=C2=A0 from .commands import runCmd<br>
&gt;&gt;=C2=A0 from difflib import SequenceMatcher as SM<br>
&gt;&gt; diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-d=
ummy/template.py b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy=
/template.py<br>
&gt;&gt; index 86c7c1811a..75c01b83bf 100644<br>
&gt;&gt; --- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/te=
mplate.py<br>
&gt;&gt; +++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/te=
mplate.py<br>
&gt;&gt; @@ -28,7 +28,9 @@<br>
&gt;&gt;=C2=A0 # of the executable from argv[0] and emulate the correspond=
ing program, so<br>
&gt;&gt;=C2=A0 # multiple copies of this script will exist under different=
 names.<br>
&gt;&gt;<br>
&gt;&gt; -import sys, os, argparse<br>
&gt;&gt; +import sys<br>
&gt;&gt; +import os<br>
&gt;&gt; +import argparse<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 this_binary =3D sys.argv[0].split(&quot;/&quot;)[-1]<br>
&gt;&gt; diff --git a/scripts/combo-layer b/scripts/combo-layer<br>
&gt;&gt; index 045de65642..835a6bcd09 100755<br>
&gt;&gt; --- a/scripts/combo-layer<br>
&gt;&gt; +++ b/scripts/combo-layer<br>
&gt;&gt; @@ -11,7 +11,8 @@<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 import fnmatch<br>
&gt;&gt; -import os, sys<br>
&gt;&gt; +import os<br>
&gt;&gt; +import sys<br>
&gt;&gt;=C2=A0 import optparse<br>
&gt;&gt;=C2=A0 import logging<br>
&gt;&gt;=C2=A0 import subprocess<br>
&gt;&gt; diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/pat=
chreview.py<br>
&gt;&gt; index 62c509f51c..744dcfb49e 100755<br>
&gt;&gt; --- a/scripts/contrib/patchreview.py<br>
&gt;&gt; +++ b/scripts/contrib/patchreview.py<br>
&gt;&gt; @@ -40,7 +40,8 @@ def blame_patch(patch):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-=
-&quot;, patch)).decode(&quot;utf-8&quot;).splitlines()<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 def patchreview(path, patches):<br>
&gt;&gt; -=C2=A0 =C2=A0 import re, os.path<br>
&gt;&gt; +=C2=A0 =C2=A0 import re<br>
&gt;&gt; +=C2=A0 =C2=A0 import os.path<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 # General pattern: start of line, optional wh=
itespace, tag with optional<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 # hyphen or spaces, maybe a colon, some white=
space, then the value, all case<br>
&gt;&gt; @@ -198,7 +199,9 @@ def histogram(results):<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 if __name__ =3D=3D &quot;__main__&quot;:<br>
&gt;&gt; -=C2=A0 =C2=A0 import argparse, subprocess, os<br>
&gt;&gt; +=C2=A0 =C2=A0 import argparse<br>
&gt;&gt; +=C2=A0 =C2=A0 import subprocess<br>
&gt;&gt; +=C2=A0 =C2=A0 import os<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 args =3D argparse.ArgumentParser(description=
=3D&quot;Patch Review Tool&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 args.add_argument(&quot;-b&quot;, &quot;--bla=
me&quot;, action=3D&quot;store_true&quot;, help=3D&quot;show blame for malf=
ormed patches&quot;)<br>
&gt;&gt; @@ -213,7 +216,9 @@ if __name__ =3D=3D &quot;__main__&quot;:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 analyse(results, want_blame=3Dargs.blame, ver=
bose=3Dargs.verbose)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if args.json:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 import json, os.path, collections<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import json<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os.path<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import collections<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(args.json):<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D json.loa=
d(open(args.json))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt; diff --git a/scripts/lnr b/scripts/lnr<br>
&gt;&gt; index a2ac4fec0f..e223b1e0e6 100755<br>
&gt;&gt; --- a/scripts/lnr<br>
&gt;&gt; +++ b/scripts/lnr<br>
&gt;&gt; @@ -6,7 +6,8 @@<br>
&gt;&gt;=C2=A0 # Create a *relative* symlink, just like ln --relative does=
 but without needing<br>
&gt;&gt;=C2=A0 # coreutils 8.16.<br>
&gt;&gt;<br>
&gt;&gt; -import sys, os<br>
&gt;&gt; +import sys<br>
&gt;&gt; +import os<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 if len(sys.argv) !=3D 3:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0print(&quot;$ lnr TARGET LINK_NAME&quot;)<br>
&gt;&gt; diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-brow=
ser<br>
&gt;&gt; index 8d223185a4..5834f59845 100755<br>
&gt;&gt; --- a/scripts/oe-pkgdata-browser<br>
&gt;&gt; +++ b/scripts/oe-pkgdata-browser<br>
&gt;&gt; @@ -1,6 +1,9 @@<br>
&gt;&gt;=C2=A0 #! /usr/bin/env python3<br>
&gt;&gt;<br>
&gt;&gt; -import os, sys, enum, ast<br>
&gt;&gt; +import os<br>
&gt;&gt; +import sys<br>
&gt;&gt; +import enum<br>
&gt;&gt; +import ast<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 scripts_path =3D os.path.dirname(os.path.realpath(__file__)=
)<br>
&gt;&gt;=C2=A0 lib_path =3D scripts_path + &#39;/lib&#39;<br>
&gt;&gt; diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_t=
est.py b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py<br>
&gt;&gt; index 00fb3bf797..c005cf341f 100644<br>
&gt;&gt; --- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py<=
br>
&gt;&gt; +++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py<=
br>
&gt;&gt; @@ -1,4 +1,9 @@<br>
&gt;&gt; -import sys, os, re, struct, operator, math<br>
&gt;&gt; +import sys<br>
&gt;&gt; +import os<br>
&gt;&gt; +import re<br>
&gt;&gt; +import struct<br>
&gt;&gt; +import operator<br>
&gt;&gt; +import math<br>
&gt;&gt;=C2=A0 from collections import defaultdict<br>
&gt;&gt;=C2=A0 import unittest<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/scripts/send-error-report b/scripts/send-error-repor=
t<br>
&gt;&gt; index cfbcaa52cb..ffa0a199b1 100755<br>
&gt;&gt; --- a/scripts/send-error-report<br>
&gt;&gt; +++ b/scripts/send-error-report<br>
&gt;&gt; @@ -10,7 +10,8 @@<br>
&gt;&gt;=C2=A0 # SPDX-License-Identifier: GPL-2.0-only<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;<br>
&gt;&gt; -import urllib.request, urllib.error<br>
&gt;&gt; +import urllib.request<br>
&gt;&gt; +import urllib.error<br>
&gt;&gt;=C2=A0 import sys<br>
&gt;&gt;=C2=A0 import json<br>
&gt;&gt;=C2=A0 import os<br>
&gt;&gt; diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms<br=
>
&gt;&gt; index 14d8c298e9..a63f6c8115 100755<br>
&gt;&gt; --- a/scripts/verify-bashisms<br>
&gt;&gt; +++ b/scripts/verify-bashisms<br>
&gt;&gt; @@ -3,7 +3,11 @@<br>
&gt;&gt;=C2=A0 # SPDX-License-Identifier: GPL-2.0-only<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;<br>
&gt;&gt; -import sys, os, subprocess, re, shutil<br>
&gt;&gt; +import sys<br>
&gt;&gt; +import os<br>
&gt;&gt; +import subprocess<br>
&gt;&gt; +import re<br>
&gt;&gt; +import shutil<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 whitelist =3D (<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 # type is supported by dash<br>
&gt;&gt; @@ -92,7 +96,8 @@ def get_tinfoil():<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return tinfoil<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 if __name__=3D=3D&#39;__main__&#39;:<br>
&gt;&gt; -=C2=A0 =C2=A0 import argparse, shutil<br>
&gt;&gt; +=C2=A0 =C2=A0 import argparse<br>
&gt;&gt; +=C2=A0 =C2=A0 import shutil<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(descriptio=
n=3D&#39;Bashim detector for shell fragments in recipes.&#39;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&quot;recipes&quot;, meta=
var=3D&quot;RECIPE&quot;, nargs=3D&quot;*&quot;, help=3D&quot;recipes to ch=
eck (if not specified, all will be checked)&quot;)<br>
&gt;&gt; --<br>
&gt;&gt; 2.32.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div>

--00000000000082d79305c5cd7e3c--
