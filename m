Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web09.182.1624909660110798166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 12:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oKpLYItT;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id r9so7444446ual.7
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xf/h4D1pX4DNDlzxsS4A9VZgvoqq3QYjBwD7HktyNO0=;
        b=oKpLYItTn5qfy/8Ms8DE75AOTmX2lIOTaZ2KZCRJWhn/DgVr0+Fc+BlF91rlFILpKT
         gGYEgSK1rQT1viX1/VkUtm1wDcfckgBlRC9Cd6FmXbBLW4TcAf6S4HxTlUQ/FglYQG61
         FMpHqLI3FabMDJ0ghdt9A9ci02upA7k86l918eOF4SGlL7nQ2xbFxqhBRXQsSQpSDn4d
         G2eujNzNLO35270jufz4RKA0E46Q5sYDNgqXskC4fjPjZzCRlhY//jIuCt8rkj3MGefR
         Wf7XRcCoZsmLoFNhii4Ymdf2VQqc0c9tsWtxFkobv3mLrEJyU0z62wNlWI/S/9eGJes7
         W5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xf/h4D1pX4DNDlzxsS4A9VZgvoqq3QYjBwD7HktyNO0=;
        b=OybE5Yr4w82j3XO7Ia9g1VwWiqXqslKZVcM6iccQMynM3cl81QasgcOhDQ/GOC0CLG
         gdWPbNy1wTJphhP4oopUIcIqjSAMXc17dZcjBtdgU1IaEw5EU0spAsWeH2mdxT390HOJ
         Qd53pmtGrcUCIFloWqqIYLI6Hj+oV+1jX5kgCnKrnZiD7TnowrN79G6wE7Xz1Wmp4Vz8
         odKAkV3k9d74iwKh/vLyCWN+ZUItXs5DIEIBL2P8EnTYbVTwHd5evciBL7LZd3MKnIEl
         oeDvnRlUOHobg0fQOl2KlDIp7sjkPAhBVH/dDJWhTS5hzXbWplD9t7basmzCIFAmmgis
         qr7w==
X-Gm-Message-State: AOAM531ZKEzMNSL+nJsv8Bd+AlIDh3fUNBqoLth3fS/FAwRbY7T/VhpT
	WdhZOh7h3sDie3pno3MIMWEEXf2ypz+V02OLWGU=
X-Google-Smtp-Source: ABdhPJz8GW29xSRaDUt6NLvxw0Ik5w37ql94A7uIDluUgXvrB83W4jlA2p1p/xLXyxmqKkOoRb4V63TqwvgkyNkVnYs=
X-Received: by 2002:ab0:290a:: with SMTP id v10mr17029027uap.22.1624909659182;
 Mon, 28 Jun 2021 12:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210628055915.1107-1-raj.khem@gmail.com> <CANNYZj_27HL2PMRW-2E5sf+LjBCL_gKQQbyu5ogvE4NsnTWZcQ@mail.gmail.com>
 <CAMKF1sqdn9E--goYuo3qNAT0-DMT25dSyFZvb1Sxmq_eGn=A-Q@mail.gmail.com>
 <CANNYZj9QZ5sojh=-oB_RRrbYoyxQ7JE_gHz46QYXWdRERwNMJg@mail.gmail.com>
 <1709447933.2675529.1624908347132@mail.yahoo.com> <CAMKF1som60jePF_rDsxL23364L55uTU5GejodiTY6amNbp1GpQ@mail.gmail.com>
In-Reply-To: <CAMKF1som60jePF_rDsxL23364L55uTU5GejodiTY6amNbp1GpQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 28 Jun 2021 21:47:27 +0200
Message-ID: <CANNYZj9EGpuL43yGADeGXfjhhGB8EnghfzC8Zee4N=gUdBi4Dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/8] PEP8 double aggressive E401
To: Khem Raj <raj.khem@gmail.com>
Cc: Persian Prince <persianpros@yahoo.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000071bda05c5d8c3ec"

--000000000000071bda05c5d8c3ec
Content-Type: text/plain; charset="UTF-8"

I just generally disagree with the idea that changing a = b to a=b, or
import a,b to import a\nimport b helps readability or reduces confusion.

I'm reading a lot of python code all the time, and never once have been
confused by inconsistent whitespace.

Can the linter fix anything else, which has actual benefit?

Alex

On Mon, 28 Jun 2021 at 21:41, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jun 28, 2021 at 12:25 PM Persian Prince <persianpros@yahoo.com>
> wrote:
> >
> > When we can follow PEP8 we should as it's how developers could follow a
> common coding style and avoid creating different files.
> >
> > In "Safe PEP8" PRs some PEP8 codes carefully added so it won't change
> tabs to spaces but makes the code cleaner in a safe way. PEP8 also fixes
> some small problems (won't do huge changes like futurize) which is good and
> sometime we miss them by mistake.
> >
> > We at https://github.com/OpenVisionE2 , https://github.com/oe-alliance
> and https://github.com/OpenPLi applied safe PEP8 changes to so many
> repositories and we're using it via PEP8.sh on GitHub Actions as an online
> cleaner tool. (PEP8.sh:
> https://github.com/OpenVisionE2/enigma2-openvision/blob/develop/CI/PEP8.sh
> )
> >
> > Also applied before on https://github.com/openembedded/meta-openembedded
> which is why that repo is clean and won't need a PR (for now), keep in mind
> that these are common standards so even if we don't like them that much
> still they help for having a good common style and less mistakes.
> >
> > If you needed more assistance from me please don't hesitate to ask, I'm
> all in.
>
>
> can you improve the commit msgs in pull request as asked.
>
> >
> > Regards,
> > Persian Prince
> >
> > On Monday, June 28, 2021, 10:56:40 AM GMT+4:30, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >
> >
> > Right, but can you please write something more descriptive than "PEP8
> double aggressive W291 ~ W293 and W391" ?
> >
> > Also I'm not sure fiddling about with whitespace or whether imports all
> need their own line really helps.
> >
> > Alex
> >
> > On Mon, 28 Jun 2021 at 08:16, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Sun, Jun 27, 2021 at 11:13 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Wait, what is this patchset all about?
> > >
> >
> > its fixes for python linter (pylint) found issues.
> >
> > > Alex
> > >
> > > On Mon, 28 Jun 2021 at 07:59, Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >> From: persianpros <persianpros@yahoo.com>
> > >>
> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >> ---
> > >>  meta/lib/oe/package.py                                |  9 +++++++--
> > >>  meta/lib/oe/qa.py                                     |  4 +++-
> > >>  meta/lib/oe/utils.py                                  |  6 ++++--
> > >>  meta/lib/oeqa/oetest.py                               |  4 +++-
> > >>  meta/lib/oeqa/sdk/case.py                             |  3 ++-
> > >>  meta/lib/oeqa/sdk/cases/buildlzip.py                  |  5 ++++-
> > >>  meta/lib/oeqa/sdk/cases/python.py                     |  3 ++-
> > >>  meta/lib/oeqa/sdk/testsdk.py                          |  3 ++-
> > >>  meta/lib/oeqa/selftest/cases/oelib/path.py            |  3 ++-
> > >>  meta/lib/oeqa/selftest/cases/package.py               |  7 +++++--
> > >>  meta/lib/oeqa/selftest/cases/runtime_test.py          |  3 ++-
> > >>  meta/lib/oeqa/utils/testexport.py                     |  6 +++++-
> > >>  .../texinfo-dummy-native/texinfo-dummy/template.py    |  4 +++-
> > >>  scripts/combo-layer                                   |  3 ++-
> > >>  scripts/contrib/patchreview.py                        | 11
> ++++++++---
> > >>  scripts/lnr                                           |  3 ++-
> > >>  scripts/oe-pkgdata-browser                            |  5 ++++-
> > >>  .../pybootchartgui/tests/parser_test.py               |  7 ++++++-
> > >>  scripts/send-error-report                             |  3 ++-
> > >>  scripts/verify-bashisms                               |  9 +++++++--
> > >>  20 files changed, 75 insertions(+), 26 deletions(-)
> > >>
> > >> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> > >> index dd700cbb0c..fc5408d5f8 100644
> > >> --- a/meta/lib/oe/package.py
> > >> +++ b/meta/lib/oe/package.py
> > >> @@ -107,7 +107,10 @@ def strip_execs(pn, dstdir, strip_cmd, libdir,
> base_libdir, d, qa_already_stripp
> > >>      :param qa_already_stripped: Set to True if already-stripped' in
> ${INSANE_SKIP}
> > >>      This is for proper logging and messages only.
> > >>      """
> > >> -    import stat, errno, oe.path, oe.utils
> > >> +    import stat
> > >> +    import errno
> > >> +    import oe.path
> > >> +    import oe.utils
> > >>
> > >>      elffiles = {}
> > >>      inodes = {}
> > >> @@ -187,7 +190,9 @@ def file_translate(file):
> > >>      return ft
> > >>
> > >>  def filedeprunner(arg):
> > >> -    import re, subprocess, shlex
> > >> +    import re
> > >> +    import subprocess
> > >> +    import shlex
> > >>
> > >>      (pkg, pkgfiles, rpmdeps, pkgdest) = arg
> > >>      provides = {}
> > >> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> > >> index e8a854a302..38c2e0cc1c 100644
> > >> --- a/meta/lib/oe/qa.py
> > >> +++ b/meta/lib/oe/qa.py
> > >> @@ -2,7 +2,9 @@
> > >>  # SPDX-License-Identifier: GPL-2.0-only
> > >>  #
> > >>
> > >> -import os, struct, mmap
> > >> +import os
> > >> +import struct
> > >> +import mmap
> > >>
> > >>  class NotELFFileError(Exception):
> > >>      pass
> > >> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> > >> index a84039f585..789bad33f6 100644
> > >> --- a/meta/lib/oe/utils.py
> > >> +++ b/meta/lib/oe/utils.py
> > >> @@ -376,7 +376,8 @@ def format_pkg_list(pkg_dict, ret_format=None):
> > >>  # Helper function to get the host compiler version
> > >>  # Do not assume the compiler is gcc
> > >>  def get_host_compiler_version(d, taskcontextonly=False):
> > >> -    import re, subprocess
> > >> +    import re
> > >> +    import subprocess
> > >>
> > >>      if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
> > >>          return
> > >> @@ -404,7 +405,8 @@ def get_host_compiler_version(d,
> taskcontextonly=False):
> > >>
> > >>
> > >>  def host_gcc_version(d, taskcontextonly=False):
> > >> -    import re, subprocess
> > >> +    import re
> > >> +    import subprocess
> > >>
> > >>      if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
> > >>          return
> > >> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
> > >> index 9c84466dd0..3136ac2ce5 100644
> > >> --- a/meta/lib/oeqa/oetest.py
> > >> +++ b/meta/lib/oeqa/oetest.py
> > >> @@ -9,7 +9,9 @@
> > >>
> > >>  # It also has some helper functions and it's responsible for
> actually starting the tests
> > >>
> > >> -import os, re, sys
> > >> +import os
> > >> +import re
> > >> +import sys
> > >>  import unittest
> > >>  import inspect
> > >>  import subprocess
> > >> diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> > >> index c45882689c..86ac199197 100644
> > >> --- a/meta/lib/oeqa/sdk/case.py
> > >> +++ b/meta/lib/oeqa/sdk/case.py
> > >> @@ -35,7 +35,8 @@ class OESDKTestCase(OETestCase):
> > >>          OS/architecture, or if not specified the currently
> configured MACHINE's
> > >>          OS/architecture.
> > >>          """
> > >> -        import oe.qa, oe.elf
> > >> +        import oe.qa
> > >> +        import oe.elf
> > >>
> > >>          if not target_os or not target_arch:
> > >>              output = self._run("echo
> $OECORE_TARGET_OS:$OECORE_TARGET_ARCH")
> > >> diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py
> b/meta/lib/oeqa/sdk/cases/buildlzip.py
> > >> index 49ae756bf3..04c4a0ec16 100644
> > >> --- a/meta/lib/oeqa/sdk/cases/buildlzip.py
> > >> +++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
> > >> @@ -2,7 +2,10 @@
> > >>  # SPDX-License-Identifier: MIT
> > >>  #
> > >>
> > >> -import os, tempfile, subprocess, unittest
> > >> +import os
> > >> +import tempfile
> > >> +import subprocess
> > >> +import unittest
> > >>  from oeqa.sdk.case import OESDKTestCase
> > >>  from oeqa.utils.subprocesstweak import errors_have_output
> > >>  errors_have_output()
> > >> diff --git a/meta/lib/oeqa/sdk/cases/python.py
> b/meta/lib/oeqa/sdk/cases/python.py
> > >> index a334abce5f..2848481f33 100644
> > >> --- a/meta/lib/oeqa/sdk/cases/python.py
> > >> +++ b/meta/lib/oeqa/sdk/cases/python.py
> > >> @@ -2,7 +2,8 @@
> > >>  # SPDX-License-Identifier: MIT
> > >>  #
> > >>
> > >> -import subprocess, unittest
> > >> +import subprocess
> > >> +import unittest
> > >>  from oeqa.sdk.case import OESDKTestCase
> > >>
> > >>  from oeqa.utils.subprocesstweak import errors_have_output
> > >> diff --git a/meta/lib/oeqa/sdk/testsdk.py
> b/meta/lib/oeqa/sdk/testsdk.py
> > >> index 35e40187bc..18e03cb8ef 100644
> > >> --- a/meta/lib/oeqa/sdk/testsdk.py
> > >> +++ b/meta/lib/oeqa/sdk/testsdk.py
> > >> @@ -95,7 +95,8 @@ class TestSDK(TestSDKBase):
> > >>          processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or
> d.getVar("BB_NUMBER_THREADS")
> > >>          if processes:
> > >>              try:
> > >> -                import testtools, subunit
> > >> +                import testtools
> > >> +                import subunit
> > >>              except ImportError:
> > >>                  bb.warn("Failed to import testtools or subunit, the
> testcases will run serially")
> > >>                  processes = None
> > >> diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py
> b/meta/lib/oeqa/selftest/cases/oelib/path.py
> > >> index a1cfa08c09..098734fa5d 100644
> > >> --- a/meta/lib/oeqa/selftest/cases/oelib/path.py
> > >> +++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
> > >> @@ -3,7 +3,8 @@
> > >>  #
> > >>
> > >>  from unittest.case import TestCase
> > >> -import oe, oe.path
> > >> +import oe
> > >> +import oe.path
> > >>  import tempfile
> > >>  import os
> > >>  import errno
> > >> diff --git a/meta/lib/oeqa/selftest/cases/package.py
> b/meta/lib/oeqa/selftest/cases/package.py
> > >> index 7166c3991f..82aa1bde1c 100644
> > >> --- a/meta/lib/oeqa/selftest/cases/package.py
> > >> +++ b/meta/lib/oeqa/selftest/cases/package.py
> > >> @@ -5,7 +5,8 @@
> > >>  from oeqa.selftest.case import OESelftestTestCase
> > >>  from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var,
> runqemu
> > >>  import stat
> > >> -import subprocess, os
> > >> +import subprocess
> > >> +import os
> > >>  import oe.path
> > >>  import re
> > >>
> > >> @@ -150,7 +151,9 @@ class PackageTests(OESelftestTestCase):
> > >>                      self.fail('GDB %s failed' % binary)
> > >>
> > >>      def test_preserve_ownership(self):
> > >> -        import os, stat, oe.cachedpath
> > >> +        import os
> > >> +        import stat
> > >> +        import oe.cachedpath
> > >>          features = 'IMAGE_INSTALL_append = " selftest-chown"\n'
> > >>          self.write_config(features)
> > >>          bitbake("core-image-minimal")
> > >> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py
> b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > >> index d0c2440722..54a80dfdc0 100644
> > >> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> > >> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> > >> @@ -211,7 +211,8 @@ class TestImage(OESelftestTestCase):
> > >>          Product: oe-core
> > >>          Author: Alexander Kanavin <alex.kanavin@gmail.com>
> > >>          """
> > >> -        import subprocess, os
> > >> +        import subprocess
> > >> +        import os
> > >>          try:
> > >>              content = os.listdir("/dev/dri")
> > >>              if len([i for i in content if i.startswith('render')])
> == 0:
> > >> diff --git a/meta/lib/oeqa/utils/testexport.py
> b/meta/lib/oeqa/utils/testexport.py
> > >> index e89d130a9c..383e57a6b2 100644
> > >> --- a/meta/lib/oeqa/utils/testexport.py
> > >> +++ b/meta/lib/oeqa/utils/testexport.py
> > >> @@ -6,7 +6,11 @@
> > >>
> > >>  # Provides functions to help with exporting binaries obtained from
> built targets
> > >>
> > >> -import os, re, glob as g, shutil as sh,sys
> > >> +import os
> > >> +import re
> > >> +import glob as g
> > >> +import shutil as sh
> > >> +import sys
> > >>  from time import sleep
> > >>  from .commands import runCmd
> > >>  from difflib import SequenceMatcher as SM
> > >> diff --git
> a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> > >> index 86c7c1811a..75c01b83bf 100644
> > >> ---
> a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> > >> +++
> b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> > >> @@ -28,7 +28,9 @@
> > >>  # of the executable from argv[0] and emulate the corresponding
> program, so
> > >>  # multiple copies of this script will exist under different names.
> > >>
> > >> -import sys, os, argparse
> > >> +import sys
> > >> +import os
> > >> +import argparse
> > >>
> > >>
> > >>  this_binary = sys.argv[0].split("/")[-1]
> > >> diff --git a/scripts/combo-layer b/scripts/combo-layer
> > >> index 045de65642..835a6bcd09 100755
> > >> --- a/scripts/combo-layer
> > >> +++ b/scripts/combo-layer
> > >> @@ -11,7 +11,8 @@
> > >>  #
> > >>
> > >>  import fnmatch
> > >> -import os, sys
> > >> +import os
> > >> +import sys
> > >>  import optparse
> > >>  import logging
> > >>  import subprocess
> > >> diff --git a/scripts/contrib/patchreview.py
> b/scripts/contrib/patchreview.py
> > >> index 62c509f51c..744dcfb49e 100755
> > >> --- a/scripts/contrib/patchreview.py
> > >> +++ b/scripts/contrib/patchreview.py
> > >> @@ -40,7 +40,8 @@ def blame_patch(patch):
> > >>                                      "--",
> patch)).decode("utf-8").splitlines()
> > >>
> > >>  def patchreview(path, patches):
> > >> -    import re, os.path
> > >> +    import re
> > >> +    import os.path
> > >>
> > >>      # General pattern: start of line, optional whitespace, tag with
> optional
> > >>      # hyphen or spaces, maybe a colon, some whitespace, then the
> value, all case
> > >> @@ -198,7 +199,9 @@ def histogram(results):
> > >>
> > >>
> > >>  if __name__ == "__main__":
> > >> -    import argparse, subprocess, os
> > >> +    import argparse
> > >> +    import subprocess
> > >> +    import os
> > >>
> > >>      args = argparse.ArgumentParser(description="Patch Review Tool")
> > >>      args.add_argument("-b", "--blame", action="store_true",
> help="show blame for malformed patches")
> > >> @@ -213,7 +216,9 @@ if __name__ == "__main__":
> > >>      analyse(results, want_blame=args.blame, verbose=args.verbose)
> > >>
> > >>      if args.json:
> > >> -        import json, os.path, collections
> > >> +        import json
> > >> +        import os.path
> > >> +        import collections
> > >>          if os.path.isfile(args.json):
> > >>              data = json.load(open(args.json))
> > >>          else:
> > >> diff --git a/scripts/lnr b/scripts/lnr
> > >> index a2ac4fec0f..e223b1e0e6 100755
> > >> --- a/scripts/lnr
> > >> +++ b/scripts/lnr
> > >> @@ -6,7 +6,8 @@
> > >>  # Create a *relative* symlink, just like ln --relative does but
> without needing
> > >>  # coreutils 8.16.
> > >>
> > >> -import sys, os
> > >> +import sys
> > >> +import os
> > >>
> > >>  if len(sys.argv) != 3:
> > >>     print("$ lnr TARGET LINK_NAME")
> > >> diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
> > >> index 8d223185a4..5834f59845 100755
> > >> --- a/scripts/oe-pkgdata-browser
> > >> +++ b/scripts/oe-pkgdata-browser
> > >> @@ -1,6 +1,9 @@
> > >>  #! /usr/bin/env python3
> > >>
> > >> -import os, sys, enum, ast
> > >> +import os
> > >> +import sys
> > >> +import enum
> > >> +import ast
> > >>
> > >>  scripts_path = os.path.dirname(os.path.realpath(__file__))
> > >>  lib_path = scripts_path + '/lib'
> > >> diff --git
> a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> > >> index 00fb3bf797..c005cf341f 100644
> > >> --- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> > >> +++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> > >> @@ -1,4 +1,9 @@
> > >> -import sys, os, re, struct, operator, math
> > >> +import sys
> > >> +import os
> > >> +import re
> > >> +import struct
> > >> +import operator
> > >> +import math
> > >>  from collections import defaultdict
> > >>  import unittest
> > >>
> > >> diff --git a/scripts/send-error-report b/scripts/send-error-report
> > >> index cfbcaa52cb..ffa0a199b1 100755
> > >> --- a/scripts/send-error-report
> > >> +++ b/scripts/send-error-report
> > >> @@ -10,7 +10,8 @@
> > >>  # SPDX-License-Identifier: GPL-2.0-only
> > >>  #
> > >>
> > >> -import urllib.request, urllib.error
> > >> +import urllib.request
> > >> +import urllib.error
> > >>  import sys
> > >>  import json
> > >>  import os
> > >> diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
> > >> index 14d8c298e9..a63f6c8115 100755
> > >> --- a/scripts/verify-bashisms
> > >> +++ b/scripts/verify-bashisms
> > >> @@ -3,7 +3,11 @@
> > >>  # SPDX-License-Identifier: GPL-2.0-only
> > >>  #
> > >>
> > >> -import sys, os, subprocess, re, shutil
> > >> +import sys
> > >> +import os
> > >> +import subprocess
> > >> +import re
> > >> +import shutil
> > >>
> > >>  whitelist = (
> > >>      # type is supported by dash
> > >> @@ -92,7 +96,8 @@ def get_tinfoil():
> > >>      return tinfoil
> > >>
> > >>  if __name__=='__main__':
> > >> -    import argparse, shutil
> > >> +    import argparse
> > >> +    import shutil
> > >>
> > >>      parser = argparse.ArgumentParser(description='Bashim detector
> for shell fragments in recipes.')
> > >>      parser.add_argument("recipes", metavar="RECIPE", nargs="*",
> help="recipes to check (if not specified, all will be checked)")
> > >> --
> > >> 2.32.0
> > >>
> > >>
> > >> 
> > >>
>

--000000000000071bda05c5d8c3ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I just generally disagree with the idea that changing=
 a =3D b to a=3Db, or import a,b to import a\nimport b helps readability or=
 reduces confusion.<br></div><div><br></div><div>I&#39;m reading a lot of p=
ython code all the time, and never once have been confused by inconsistent =
whitespace. <br></div><div><br></div><div>Can the linter fix anything else,=
 which has actual benefit?</div><div><br></div><div>Alex<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 2=
8 Jun 2021 at 21:41, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Mon, Jun 28, 2021 at 12:25 PM Persian Prince &lt;<a href=
=3D"mailto:persianpros@yahoo.com" target=3D"_blank">persianpros@yahoo.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; When we can follow PEP8 we should as it&#39;s how developers could fo=
llow a common coding style and avoid creating different files.<br>
&gt;<br>
&gt; In &quot;Safe PEP8&quot; PRs some PEP8 codes carefully added so it wo=
n&#39;t change tabs to spaces but makes the code cleaner in a safe way. PEP=
8 also fixes some small problems (won&#39;t do huge changes like futurize) =
which is good and sometime we miss them by mistake.<br>
&gt;<br>
&gt; We at <a href=3D"https://github.com/OpenVisionE2" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/OpenVisionE2</a> , <a href=3D"https://=
github.com/oe-alliance" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/oe-alliance</a> and <a href=3D"https://github.com/OpenPLi" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/OpenPLi</a> applied safe PEP8 =
changes to so many repositories and we&#39;re using it via PEP8.sh on GitHu=
b Actions as an online cleaner tool. (PEP8.sh: <a href=3D"https://github.co=
m/OpenVisionE2/enigma2-openvision/blob/develop/CI/PEP8.sh" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/OpenVisionE2/enigma2-openvision/blo=
b/develop/CI/PEP8.sh</a>)<br>
&gt;<br>
&gt; Also applied before on <a href=3D"https://github.com/openembedded/met=
a-openembedded" rel=3D"noreferrer" target=3D"_blank">https://github.com/ope=
nembedded/meta-openembedded</a> which is why that repo is clean and won&#39=
;t need a PR (for now), keep in mind that these are common standards so eve=
n if we don&#39;t like them that much still they help for having a good com=
mon style and less mistakes.<br>
&gt;<br>
&gt; If you needed more assistance from me please don&#39;t hesitate to as=
k, I&#39;m all in.<br>
<br>
<br>
can you improve the commit msgs in pull request as asked.<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Persian Prince<br>
&gt;<br>
&gt; On Monday, June 28, 2021, 10:56:40 AM GMT+4:30, Alexander Kanavin &lt=
;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Right, but can you please write something more descriptive than &quot=
;PEP8 double aggressive W291 ~ W293 and W391&quot; ?<br>
&gt;<br>
&gt; Also I&#39;m not sure fiddling about with whitespace or whether impor=
ts all need their own line really helps.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 28 Jun 2021 at 08:16, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, Jun 27, 2021 at 11:13 PM Alexander Kanavin<br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Wait, what is this patchset all about?<br>
&gt; &gt;<br>
&gt;<br>
&gt; its fixes for python linter (pylint) found issues.<br>
&gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 28 Jun 2021 at 07:59, Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; From: persianpros &lt;<a href=3D"mailto:persianpros@yahoo.co=
m" target=3D"_blank">persianpros@yahoo.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oe/package.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 |=C2=A0 9 +++++++--<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oe/qa.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++-<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oe/utils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 6 ++++--<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/oetest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0|=C2=A0 4 +++-<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/sdk/case.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 ++-<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/sdk/cases/buildlzip.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++-<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/sdk/cases/python.py=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/sdk/testsdk.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 3 ++-<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/selftest/cases/oelib/path.py=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/selftest/cases/package.py=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++--<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/selftest/cases/runtime_test.py=C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
&gt; &gt;&gt;=C2=A0 meta/lib/oeqa/utils/testexport.py=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++-<br=
>
&gt; &gt;&gt;=C2=A0 .../texinfo-dummy-native/texinfo-dummy/template.py=C2=
=A0 =C2=A0 |=C2=A0 4 +++-<br>
&gt; &gt;&gt;=C2=A0 scripts/combo-layer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
&gt; &gt;&gt;=C2=A0 scripts/contrib/patchreview.py=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++++++-=
--<br>
&gt; &gt;&gt;=C2=A0 scripts/lnr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
&gt; &gt;&gt;=C2=A0 scripts/oe-pkgdata-browser=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=
=A0 5 ++++-<br>
&gt; &gt;&gt;=C2=A0 .../pybootchartgui/tests/parser_test.py=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++++++-<br>
&gt; &gt;&gt;=C2=A0 scripts/send-error-report=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 ++-<br>
&gt; &gt;&gt;=C2=A0 scripts/verify-bashisms=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0|=C2=A0 9 +++++++--<br>
&gt; &gt;&gt;=C2=A0 20 files changed, 75 insertions(+), 26 deletions(-)<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py=
<br>
&gt; &gt;&gt; index dd700cbb0c..fc5408d5f8 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oe/package.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oe/package.py<br>
&gt; &gt;&gt; @@ -107,7 +107,10 @@ def strip_execs(pn, dstdir, strip_cmd, =
libdir, base_libdir, d, qa_already_stripp<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 :param qa_already_stripped: Set to True =
if already-stripped&#39; in ${INSANE_SKIP}<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 This is for proper logging and messages =
only.<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 import stat, errno, oe.path, oe.utils<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import stat<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import errno<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import oe.path<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import oe.utils<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 elffiles =3D {}<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 inodes =3D {}<br>
&gt; &gt;&gt; @@ -187,7 +190,9 @@ def file_translate(file):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 return ft<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 def filedeprunner(arg):<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 import re, subprocess, shlex<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import re<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import subprocess<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import shlex<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 (pkg, pkgfiles, rpmdeps, pkgdest) =3D ar=
g<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 provides =3D {}<br>
&gt; &gt;&gt; diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py<br>
&gt; &gt;&gt; index e8a854a302..38c2e0cc1c 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oe/qa.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oe/qa.py<br>
&gt; &gt;&gt; @@ -2,7 +2,9 @@<br>
&gt; &gt;&gt;=C2=A0 # SPDX-License-Identifier: GPL-2.0-only<br>
&gt; &gt;&gt;=C2=A0 #<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -import os, struct, mmap<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt; +import struct<br>
&gt; &gt;&gt; +import mmap<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 class NotELFFileError(Exception):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; &gt;&gt; diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
&gt; &gt;&gt; index a84039f585..789bad33f6 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oe/utils.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oe/utils.py<br>
&gt; &gt;&gt; @@ -376,7 +376,8 @@ def format_pkg_list(pkg_dict, ret_format=
=
=3DNone):<br>
&gt; &gt;&gt;=C2=A0 # Helper function to get the host compiler version<br>
&gt; &gt;&gt;=C2=A0 # Do not assume the compiler is gcc<br>
&gt; &gt;&gt;=C2=A0 def get_host_compiler_version(d, taskcontextonly=3DFal=
se):<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 import re, subprocess<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import re<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import subprocess<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 if taskcontextonly and d.getVar(&#39;BB_=
WORKERCONTEXT&#39;) !=3D &#39;1&#39;:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; &gt;&gt; @@ -404,7 +405,8 @@ def get_host_compiler_version(d, taskcon=
textonly=3DFalse):<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 def host_gcc_version(d, taskcontextonly=3DFalse):<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 import re, subprocess<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import re<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import subprocess<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 if taskcontextonly and d.getVar(&#39;BB_=
WORKERCONTEXT&#39;) !=3D &#39;1&#39;:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.=
py<br>
&gt; &gt;&gt; index 9c84466dd0..3136ac2ce5 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/oetest.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/oetest.py<br>
&gt; &gt;&gt; @@ -9,7 +9,9 @@<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 # It also has some helper functions and it&#39;s respo=
nsible for actually starting the tests<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -import os, re, sys<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt; +import re<br>
&gt; &gt;&gt; +import sys<br>
&gt; &gt;&gt;=C2=A0 import unittest<br>
&gt; &gt;&gt;=C2=A0 import inspect<br>
&gt; &gt;&gt;=C2=A0 import subprocess<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/c=
ase.py<br>
&gt; &gt;&gt; index c45882689c..86ac199197 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/sdk/case.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/sdk/case.py<br>
&gt; &gt;&gt; @@ -35,7 +35,8 @@ class OESDKTestCase(OETestCase):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OS/architecture, or if not=
 specified the currently configured MACHINE&#39;s<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OS/architecture.<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 import <a href=3D"http://oe.qa"=
 rel=3D"noreferrer" target=3D"_blank">oe.qa</a>, oe.elf<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import <a href=3D"http://oe.qa"=
 rel=3D"noreferrer" target=3D"_blank">oe.qa</a><br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import oe.elf<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not target_os or not ta=
rget_arch:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D s=
elf._run(&quot;echo $OECORE_TARGET_OS:$OECORE_TARGET_ARCH&quot;)<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib=
/oeqa/sdk/cases/buildlzip.py<br>
&gt; &gt;&gt; index 49ae756bf3..04c4a0ec16 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/sdk/cases/buildlzip.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/sdk/cases/buildlzip.py<br>
&gt; &gt;&gt; @@ -2,7 +2,10 @@<br>
&gt; &gt;&gt;=C2=A0 # SPDX-License-Identifier: MIT<br>
&gt; &gt;&gt;=C2=A0 #<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -import os, tempfile, subprocess, unittest<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt; +import tempfile<br>
&gt; &gt;&gt; +import subprocess<br>
&gt; &gt;&gt; +import unittest<br>
&gt; &gt;&gt;=C2=A0 from oeqa.sdk.case import OESDKTestCase<br>
&gt; &gt;&gt;=C2=A0 from oeqa.utils.subprocesstweak import errors_have_out=
put<br>
&gt; &gt;&gt;=C2=A0 errors_have_output()<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oe=
qa/sdk/cases/python.py<br>
&gt; &gt;&gt; index a334abce5f..2848481f33 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/sdk/cases/python.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/sdk/cases/python.py<br>
&gt; &gt;&gt; @@ -2,7 +2,8 @@<br>
&gt; &gt;&gt;=C2=A0 # SPDX-License-Identifier: MIT<br>
&gt; &gt;&gt;=C2=A0 #<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -import subprocess, unittest<br>
&gt; &gt;&gt; +import subprocess<br>
&gt; &gt;&gt; +import unittest<br>
&gt; &gt;&gt;=C2=A0 from oeqa.sdk.case import OESDKTestCase<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 from oeqa.utils.subprocesstweak import errors_have_out=
put<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sd=
k/testsdk.py<br>
&gt; &gt;&gt; index 35e40187bc..18e03cb8ef 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/sdk/testsdk.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/sdk/testsdk.py<br>
&gt; &gt;&gt; @@ -95,7 +95,8 @@ class TestSDK(TestSDKBase):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 processes =3D d.getVar(&qu=
ot;TESTIMAGE_NUMBER_THREADS&quot;) or d.getVar(&quot;BB_NUMBER_THREADS&quot=
;)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if processes:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imp=
ort testtools, subunit<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imp=
ort testtools<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imp=
ort subunit<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Impor=
tError:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bb.warn(&quot;Failed to import testtools or subunit, the testcases wil=
l run serially&quot;)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 processes =3D None<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/me=
ta/lib/oeqa/selftest/cases/oelib/path.py<br>
&gt; &gt;&gt; index a1cfa08c09..098734fa5d 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/selftest/cases/oelib/path.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/oelib/path.py<br>
&gt; &gt;&gt; @@ -3,7 +3,8 @@<br>
&gt; &gt;&gt;=C2=A0 #<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 from unittest.case import TestCase<br>
&gt; &gt;&gt; -import oe, oe.path<br>
&gt; &gt;&gt; +import oe<br>
&gt; &gt;&gt; +import oe.path<br>
&gt; &gt;&gt;=C2=A0 import tempfile<br>
&gt; &gt;&gt;=C2=A0 import os<br>
&gt; &gt;&gt;=C2=A0 import errno<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/=
lib/oeqa/selftest/cases/package.py<br>
&gt; &gt;&gt; index 7166c3991f..82aa1bde1c 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/selftest/cases/package.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/package.py<br>
&gt; &gt;&gt; @@ -5,7 +5,8 @@<br>
&gt; &gt;&gt;=C2=A0 from oeqa.selftest.case import OESelftestTestCase<br>
&gt; &gt;&gt;=C2=A0 from oeqa.utils.commands import bitbake, get_bb_vars, =
get_bb_var, runqemu<br>
&gt; &gt;&gt;=C2=A0 import stat<br>
&gt; &gt;&gt; -import subprocess, os<br>
&gt; &gt;&gt; +import subprocess<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt;=C2=A0 import oe.path<br>
&gt; &gt;&gt;=C2=A0 import re<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; @@ -150,7 +151,9 @@ class PackageTests(OESelftestTestCase):<=
br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 self.fail(&#39;GDB %s failed&#39; % binary)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 def test_preserve_ownership(self):<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os, stat, oe.cachedpath<=
br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import stat<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import oe.cachedpath<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;IMAGE_IN=
STALL_append =3D &quot; selftest-chown&quot;\n&#39;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(features=
)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;core-image-m=
inimal&quot;)<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/=
meta/lib/oeqa/selftest/cases/runtime_test.py<br>
&gt; &gt;&gt; index d0c2440722..54a80dfdc0 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/selftest/cases/runtime_test.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py<br>
&gt; &gt;&gt; @@ -211,7 +211,8 @@ class TestImage(OESelftestTestCase):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Product: oe-core<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Author: Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 import subprocess, os<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import subprocess<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 content =3D =
os.listdir(&quot;/dev/dri&quot;)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len([i fo=
r i in content if i.startswith(&#39;render&#39;)]) =3D=3D 0:<br>
&gt; &gt;&gt; diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oe=
qa/utils/testexport.py<br>
&gt; &gt;&gt; index e89d130a9c..383e57a6b2 100644<br>
&gt; &gt;&gt; --- a/meta/lib/oeqa/utils/testexport.py<br>
&gt; &gt;&gt; +++ b/meta/lib/oeqa/utils/testexport.py<br>
&gt; &gt;&gt; @@ -6,7 +6,11 @@<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 # Provides functions to help with exporting binaries o=
btained from built targets<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -import os, re, glob as g, shutil as sh,sys<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt; +import re<br>
&gt; &gt;&gt; +import glob as g<br>
&gt; &gt;&gt; +import shutil as sh<br>
&gt; &gt;&gt; +import sys<br>
&gt; &gt;&gt;=C2=A0 from time import sleep<br>
&gt; &gt;&gt;=C2=A0 from .commands import runCmd<br>
&gt; &gt;&gt;=C2=A0 from difflib import SequenceMatcher as SM<br>
&gt; &gt;&gt; diff --git a/meta/recipes-extended/texinfo-dummy-native/texi=
nfo-dummy/template.py b/meta/recipes-extended/texinfo-dummy-native/texinfo-=
dummy/template.py<br>
&gt; &gt;&gt; index 86c7c1811a..75c01b83bf 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dum=
my/template.py<br>
&gt; &gt;&gt; +++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dum=
my/template.py<br>
&gt; &gt;&gt; @@ -28,7 +28,9 @@<br>
&gt; &gt;&gt;=C2=A0 # of the executable from argv[0] and emulate the corre=
sponding program, so<br>
&gt; &gt;&gt;=C2=A0 # multiple copies of this script will exist under diff=
erent names.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -import sys, os, argparse<br>
&gt; &gt;&gt; +import sys<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt; +import argparse<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 this_binary =3D sys.argv[0].split(&quot;/&quot;)[-1]<b=
r>
&gt; &gt;&gt; diff --git a/scripts/combo-layer b/scripts/combo-layer<br>
&gt; &gt;&gt; index 045de65642..835a6bcd09 100755<br>
&gt; &gt;&gt; --- a/scripts/combo-layer<br>
&gt; &gt;&gt; +++ b/scripts/combo-layer<br>
&gt; &gt;&gt; @@ -11,7 +11,8 @@<br>
&gt; &gt;&gt;=C2=A0 #<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 import fnmatch<br>
&gt; &gt;&gt; -import os, sys<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt; +import sys<br>
&gt; &gt;&gt;=C2=A0 import optparse<br>
&gt; &gt;&gt;=C2=A0 import logging<br>
&gt; &gt;&gt;=C2=A0 import subprocess<br>
&gt; &gt;&gt; diff --git a/scripts/contrib/patchreview.py b/scripts/contri=
b/patchreview.py<br>
&gt; &gt;&gt; index 62c509f51c..744dcfb49e 100755<br>
&gt; &gt;&gt; --- a/scripts/contrib/patchreview.py<br>
&gt; &gt;&gt; +++ b/scripts/contrib/patchreview.py<br>
&gt; &gt;&gt; @@ -40,7 +40,8 @@ def blame_patch(patch):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
&quot;--&quot;, patch)).decode(&quot;utf-8&quot;).splitlines()<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 def patchreview(path, patches):<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 import re, os.path<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import re<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import os.path<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 # General pattern: start of line, option=
al whitespace, tag with optional<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 # hyphen or spaces, maybe a colon, some =
whitespace, then the value, all case<br>
&gt; &gt;&gt; @@ -198,7 +199,9 @@ def histogram(results):<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 if __name__ =3D=3D &quot;__main__&quot;:<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 import argparse, subprocess, os<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import argparse<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import subprocess<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import os<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 args =3D argparse.ArgumentParser(descrip=
tion=3D&quot;Patch Review Tool&quot;)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 args.add_argument(&quot;-b&quot;, &quot;=
--blame&quot;, action=3D&quot;store_true&quot;, help=3D&quot;show blame for=
 malformed patches&quot;)<br>
&gt; &gt;&gt; @@ -213,7 +216,9 @@ if __name__ =3D=3D &quot;__main__&quot;:=
<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 analyse(results, want_blame=3Dargs.blame=
, verbose=3Dargs.verbose)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 if args.json:<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 import json, os.path, collectio=
ns<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import json<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os.path<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import collections<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isfile(args.jso=
n):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D jso=
n.load(open(args.json))<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;&gt; diff --git a/scripts/lnr b/scripts/lnr<br>
&gt; &gt;&gt; index a2ac4fec0f..e223b1e0e6 100755<br>
&gt; &gt;&gt; --- a/scripts/lnr<br>
&gt; &gt;&gt; +++ b/scripts/lnr<br>
&gt; &gt;&gt; @@ -6,7 +6,8 @@<br>
&gt; &gt;&gt;=C2=A0 # Create a *relative* symlink, just like ln --relative=
 does but without needing<br>
&gt; &gt;&gt;=C2=A0 # coreutils 8.16.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -import sys, os<br>
&gt; &gt;&gt; +import sys<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 if len(sys.argv) !=3D 3:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0print(&quot;$ lnr TARGET LINK_NAME&quot;)=
<br>
&gt; &gt;&gt; diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata=
-browser<br>
&gt; &gt;&gt; index 8d223185a4..5834f59845 100755<br>
&gt; &gt;&gt; --- a/scripts/oe-pkgdata-browser<br>
&gt; &gt;&gt; +++ b/scripts/oe-pkgdata-browser<br>
&gt; &gt;&gt; @@ -1,6 +1,9 @@<br>
&gt; &gt;&gt;=C2=A0 #! /usr/bin/env python3<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -import os, sys, enum, ast<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt; +import sys<br>
&gt; &gt;&gt; +import enum<br>
&gt; &gt;&gt; +import ast<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 scripts_path =3D os.path.dirname(os.path.realpath(__fi=
le__))<br>
&gt; &gt;&gt;=C2=A0 lib_path =3D scripts_path + &#39;/lib&#39;<br>
&gt; &gt;&gt; diff --git a/scripts/pybootchartgui/pybootchartgui/tests/par=
ser_test.py b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py<br=
>
&gt; &gt;&gt; index 00fb3bf797..c005cf341f 100644<br>
&gt; &gt;&gt; --- a/scripts/pybootchartgui/pybootchartgui/tests/parser_tes=
t.py<br>
&gt; &gt;&gt; +++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_tes=
t.py<br>
&gt; &gt;&gt; @@ -1,4 +1,9 @@<br>
&gt; &gt;&gt; -import sys, os, re, struct, operator, math<br>
&gt; &gt;&gt; +import sys<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt; +import re<br>
&gt; &gt;&gt; +import struct<br>
&gt; &gt;&gt; +import operator<br>
&gt; &gt;&gt; +import math<br>
&gt; &gt;&gt;=C2=A0 from collections import defaultdict<br>
&gt; &gt;&gt;=C2=A0 import unittest<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/scripts/send-error-report b/scripts/send-error-=
report<br>
&gt; &gt;&gt; index cfbcaa52cb..ffa0a199b1 100755<br>
&gt; &gt;&gt; --- a/scripts/send-error-report<br>
&gt; &gt;&gt; +++ b/scripts/send-error-report<br>
&gt; &gt;&gt; @@ -10,7 +10,8 @@<br>
&gt; &gt;&gt;=C2=A0 # SPDX-License-Identifier: GPL-2.0-only<br>
&gt; &gt;&gt;=C2=A0 #<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -import urllib.request, urllib.error<br>
&gt; &gt;&gt; +import urllib.request<br>
&gt; &gt;&gt; +import urllib.error<br>
&gt; &gt;&gt;=C2=A0 import sys<br>
&gt; &gt;&gt;=C2=A0 import json<br>
&gt; &gt;&gt;=C2=A0 import os<br>
&gt; &gt;&gt; diff --git a/scripts/verify-bashisms b/scripts/verify-bashis=
ms<br>
&gt; &gt;&gt; index 14d8c298e9..a63f6c8115 100755<br>
&gt; &gt;&gt; --- a/scripts/verify-bashisms<br>
&gt; &gt;&gt; +++ b/scripts/verify-bashisms<br>
&gt; &gt;&gt; @@ -3,7 +3,11 @@<br>
&gt; &gt;&gt;=C2=A0 # SPDX-License-Identifier: GPL-2.0-only<br>
&gt; &gt;&gt;=C2=A0 #<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -import sys, os, subprocess, re, shutil<br>
&gt; &gt;&gt; +import sys<br>
&gt; &gt;&gt; +import os<br>
&gt; &gt;&gt; +import subprocess<br>
&gt; &gt;&gt; +import re<br>
&gt; &gt;&gt; +import shutil<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 whitelist =3D (<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 # type is supported by dash<br>
&gt; &gt;&gt; @@ -92,7 +96,8 @@ def get_tinfoil():<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 return tinfoil<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 if __name__=3D=3D&#39;__main__&#39;:<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 import argparse, shutil<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import argparse<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 import shutil<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(descr=
iption=3D&#39;Bashim detector for shell fragments in recipes.&#39;)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&quot;recipes&quot;,=
 metavar=3D&quot;RECIPE&quot;, nargs=3D&quot;*&quot;, help=3D&quot;recipes =
to check (if not specified, all will be checked)&quot;)<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.32.0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt;<br>
</blockquote></div>

--000000000000071bda05c5d8c3ec--
