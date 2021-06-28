Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web09.7532.1624860791575038990
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 23:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GsUc/MFt;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id c20so6533481uar.12
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 23:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7y0IdU4dBnpWoF7KL23eGqZsrVZdhN1yQYhqOGo1jto=;
        b=GsUc/MFtU6Ev2XLjSX4k62KGbJrD5filaeUXLaVNzYfy731BXJqQhXCUEO1R71QEja
         CKClpFHYeH7mU76d1mrXX2I3ouzw9NhsDc3+8xLxMvA2Qr7pUz7n/0L+/p9+CDgX6Bz5
         EIjP6/Ev59noZDSYmWl/i+lbc23JRVxak1C5rP7De5WYq+n/DimPtpOoLNK+US5gCT7b
         GOYxOxckD9Xe0o97cotiHJCSr25LvmKeVg7pcrFwg8sfHTt2kLllYhrpAqgziaWe7/Cp
         jye2A30oaY5J86dep4fpsydhYfYmk3ePfF+Lc8K3CkKOlCosASiHXlnXo5fNAGst3mIk
         YeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7y0IdU4dBnpWoF7KL23eGqZsrVZdhN1yQYhqOGo1jto=;
        b=Y+ntw5/vaFMF6fcInHPgPZmsj85OFiclA8FkZaWlx1l9m05xzh6Iob5McsRtgvhw0s
         NaLFL2NfxTDGQPVhpp2VxcCzIUt3FwiRueiZBCc77EkJsZB/HBO3fNWXPFMX65N0fQzb
         S2CEwl2zJI5lS/UwG/xvZdXCYRx9f7JWswKapLPz++Eq9gIKCCBdFUECgc1B/IJdxdKx
         6tYVylAFkLR+WYT7rcbSrks+QVJEE9wQ8pedAS6QuJ3BtjBP9BV+5QjME5WaG6beV8TL
         6hristR33BCQFf/+BjFVmfJirC2FNLnOR77QfrLuTs+M0pSW8xAl+kUgtYdJkJWowCiA
         hHMA==
X-Gm-Message-State: AOAM530nqSDSreXTPtWP8OxP6/JUU3tUaA7sfJkIdEzIuqjuDiUDKL2g
	8I+36uxp3BbEsSYDjOVVbIJymB63iTfz1WZA1rQ=
X-Google-Smtp-Source: ABdhPJyitoFFdd1zxNBmfoWFJiSHbzV0SqtuCLB/Iz8NrOGu9wbSgeHjUYRMsT1n6qTUeFPMrrE5cr/3IOi0STo4wNw=
X-Received: by 2002:ab0:290a:: with SMTP id v10mr13346922uap.22.1624860790678;
 Sun, 27 Jun 2021 23:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210628055915.1107-1-raj.khem@gmail.com>
In-Reply-To: <20210628055915.1107-1-raj.khem@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 28 Jun 2021 08:12:59 +0200
Message-ID: <CANNYZj_27HL2PMRW-2E5sf+LjBCL_gKQQbyu5ogvE4NsnTWZcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/8] PEP8 double aggressive E401
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	persianpros <persianpros@yahoo.com>
Content-Type: multipart/alternative; boundary="0000000000003ce65205c5cd62a0"

--0000000000003ce65205c5cd62a0
Content-Type: text/plain; charset="UTF-8"

Wait, what is this patchset all about?

Alex

On Mon, 28 Jun 2021 at 07:59, Khem Raj <raj.khem@gmail.com> wrote:

> From: persianpros <persianpros@yahoo.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oe/package.py                                |  9 +++++++--
>  meta/lib/oe/qa.py                                     |  4 +++-
>  meta/lib/oe/utils.py                                  |  6 ++++--
>  meta/lib/oeqa/oetest.py                               |  4 +++-
>  meta/lib/oeqa/sdk/case.py                             |  3 ++-
>  meta/lib/oeqa/sdk/cases/buildlzip.py                  |  5 ++++-
>  meta/lib/oeqa/sdk/cases/python.py                     |  3 ++-
>  meta/lib/oeqa/sdk/testsdk.py                          |  3 ++-
>  meta/lib/oeqa/selftest/cases/oelib/path.py            |  3 ++-
>  meta/lib/oeqa/selftest/cases/package.py               |  7 +++++--
>  meta/lib/oeqa/selftest/cases/runtime_test.py          |  3 ++-
>  meta/lib/oeqa/utils/testexport.py                     |  6 +++++-
>  .../texinfo-dummy-native/texinfo-dummy/template.py    |  4 +++-
>  scripts/combo-layer                                   |  3 ++-
>  scripts/contrib/patchreview.py                        | 11 ++++++++---
>  scripts/lnr                                           |  3 ++-
>  scripts/oe-pkgdata-browser                            |  5 ++++-
>  .../pybootchartgui/tests/parser_test.py               |  7 ++++++-
>  scripts/send-error-report                             |  3 ++-
>  scripts/verify-bashisms                               |  9 +++++++--
>  20 files changed, 75 insertions(+), 26 deletions(-)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index dd700cbb0c..fc5408d5f8 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -107,7 +107,10 @@ def strip_execs(pn, dstdir, strip_cmd, libdir,
> base_libdir, d, qa_already_stripp
>      :param qa_already_stripped: Set to True if already-stripped' in
> ${INSANE_SKIP}
>      This is for proper logging and messages only.
>      """
> -    import stat, errno, oe.path, oe.utils
> +    import stat
> +    import errno
> +    import oe.path
> +    import oe.utils
>
>      elffiles = {}
>      inodes = {}
> @@ -187,7 +190,9 @@ def file_translate(file):
>      return ft
>
>  def filedeprunner(arg):
> -    import re, subprocess, shlex
> +    import re
> +    import subprocess
> +    import shlex
>
>      (pkg, pkgfiles, rpmdeps, pkgdest) = arg
>      provides = {}
> diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
> index e8a854a302..38c2e0cc1c 100644
> --- a/meta/lib/oe/qa.py
> +++ b/meta/lib/oe/qa.py
> @@ -2,7 +2,9 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>
> -import os, struct, mmap
> +import os
> +import struct
> +import mmap
>
>  class NotELFFileError(Exception):
>      pass
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index a84039f585..789bad33f6 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -376,7 +376,8 @@ def format_pkg_list(pkg_dict, ret_format=None):
>  # Helper function to get the host compiler version
>  # Do not assume the compiler is gcc
>  def get_host_compiler_version(d, taskcontextonly=False):
> -    import re, subprocess
> +    import re
> +    import subprocess
>
>      if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
>          return
> @@ -404,7 +405,8 @@ def get_host_compiler_version(d,
> taskcontextonly=False):
>
>
>  def host_gcc_version(d, taskcontextonly=False):
> -    import re, subprocess
> +    import re
> +    import subprocess
>
>      if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
>          return
> diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
> index 9c84466dd0..3136ac2ce5 100644
> --- a/meta/lib/oeqa/oetest.py
> +++ b/meta/lib/oeqa/oetest.py
> @@ -9,7 +9,9 @@
>
>  # It also has some helper functions and it's responsible for actually
> starting the tests
>
> -import os, re, sys
> +import os
> +import re
> +import sys
>  import unittest
>  import inspect
>  import subprocess
> diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
> index c45882689c..86ac199197 100644
> --- a/meta/lib/oeqa/sdk/case.py
> +++ b/meta/lib/oeqa/sdk/case.py
> @@ -35,7 +35,8 @@ class OESDKTestCase(OETestCase):
>          OS/architecture, or if not specified the currently configured
> MACHINE's
>          OS/architecture.
>          """
> -        import oe.qa, oe.elf
> +        import oe.qa
> +        import oe.elf
>
>          if not target_os or not target_arch:
>              output = self._run("echo
> $OECORE_TARGET_OS:$OECORE_TARGET_ARCH")
> diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py
> b/meta/lib/oeqa/sdk/cases/buildlzip.py
> index 49ae756bf3..04c4a0ec16 100644
> --- a/meta/lib/oeqa/sdk/cases/buildlzip.py
> +++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
> @@ -2,7 +2,10 @@
>  # SPDX-License-Identifier: MIT
>  #
>
> -import os, tempfile, subprocess, unittest
> +import os
> +import tempfile
> +import subprocess
> +import unittest
>  from oeqa.sdk.case import OESDKTestCase
>  from oeqa.utils.subprocesstweak import errors_have_output
>  errors_have_output()
> diff --git a/meta/lib/oeqa/sdk/cases/python.py
> b/meta/lib/oeqa/sdk/cases/python.py
> index a334abce5f..2848481f33 100644
> --- a/meta/lib/oeqa/sdk/cases/python.py
> +++ b/meta/lib/oeqa/sdk/cases/python.py
> @@ -2,7 +2,8 @@
>  # SPDX-License-Identifier: MIT
>  #
>
> -import subprocess, unittest
> +import subprocess
> +import unittest
>  from oeqa.sdk.case import OESDKTestCase
>
>  from oeqa.utils.subprocesstweak import errors_have_output
> diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
> index 35e40187bc..18e03cb8ef 100644
> --- a/meta/lib/oeqa/sdk/testsdk.py
> +++ b/meta/lib/oeqa/sdk/testsdk.py
> @@ -95,7 +95,8 @@ class TestSDK(TestSDKBase):
>          processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or
> d.getVar("BB_NUMBER_THREADS")
>          if processes:
>              try:
> -                import testtools, subunit
> +                import testtools
> +                import subunit
>              except ImportError:
>                  bb.warn("Failed to import testtools or subunit, the
> testcases will run serially")
>                  processes = None
> diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py
> b/meta/lib/oeqa/selftest/cases/oelib/path.py
> index a1cfa08c09..098734fa5d 100644
> --- a/meta/lib/oeqa/selftest/cases/oelib/path.py
> +++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
> @@ -3,7 +3,8 @@
>  #
>
>  from unittest.case import TestCase
> -import oe, oe.path
> +import oe
> +import oe.path
>  import tempfile
>  import os
>  import errno
> diff --git a/meta/lib/oeqa/selftest/cases/package.py
> b/meta/lib/oeqa/selftest/cases/package.py
> index 7166c3991f..82aa1bde1c 100644
> --- a/meta/lib/oeqa/selftest/cases/package.py
> +++ b/meta/lib/oeqa/selftest/cases/package.py
> @@ -5,7 +5,8 @@
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var, runqemu
>  import stat
> -import subprocess, os
> +import subprocess
> +import os
>  import oe.path
>  import re
>
> @@ -150,7 +151,9 @@ class PackageTests(OESelftestTestCase):
>                      self.fail('GDB %s failed' % binary)
>
>      def test_preserve_ownership(self):
> -        import os, stat, oe.cachedpath
> +        import os
> +        import stat
> +        import oe.cachedpath
>          features = 'IMAGE_INSTALL_append = " selftest-chown"\n'
>          self.write_config(features)
>          bitbake("core-image-minimal")
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py
> b/meta/lib/oeqa/selftest/cases/runtime_test.py
> index d0c2440722..54a80dfdc0 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -211,7 +211,8 @@ class TestImage(OESelftestTestCase):
>          Product: oe-core
>          Author: Alexander Kanavin <alex.kanavin@gmail.com>
>          """
> -        import subprocess, os
> +        import subprocess
> +        import os
>          try:
>              content = os.listdir("/dev/dri")
>              if len([i for i in content if i.startswith('render')]) == 0:
> diff --git a/meta/lib/oeqa/utils/testexport.py
> b/meta/lib/oeqa/utils/testexport.py
> index e89d130a9c..383e57a6b2 100644
> --- a/meta/lib/oeqa/utils/testexport.py
> +++ b/meta/lib/oeqa/utils/testexport.py
> @@ -6,7 +6,11 @@
>
>  # Provides functions to help with exporting binaries obtained from built
> targets
>
> -import os, re, glob as g, shutil as sh,sys
> +import os
> +import re
> +import glob as g
> +import shutil as sh
> +import sys
>  from time import sleep
>  from .commands import runCmd
>  from difflib import SequenceMatcher as SM
> diff --git
> a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> index 86c7c1811a..75c01b83bf 100644
> --- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> +++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
> @@ -28,7 +28,9 @@
>  # of the executable from argv[0] and emulate the corresponding program, so
>  # multiple copies of this script will exist under different names.
>
> -import sys, os, argparse
> +import sys
> +import os
> +import argparse
>
>
>  this_binary = sys.argv[0].split("/")[-1]
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index 045de65642..835a6bcd09 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -11,7 +11,8 @@
>  #
>
>  import fnmatch
> -import os, sys
> +import os
> +import sys
>  import optparse
>  import logging
>  import subprocess
> diff --git a/scripts/contrib/patchreview.py
> b/scripts/contrib/patchreview.py
> index 62c509f51c..744dcfb49e 100755
> --- a/scripts/contrib/patchreview.py
> +++ b/scripts/contrib/patchreview.py
> @@ -40,7 +40,8 @@ def blame_patch(patch):
>                                      "--",
> patch)).decode("utf-8").splitlines()
>
>  def patchreview(path, patches):
> -    import re, os.path
> +    import re
> +    import os.path
>
>      # General pattern: start of line, optional whitespace, tag with
> optional
>      # hyphen or spaces, maybe a colon, some whitespace, then the value,
> all case
> @@ -198,7 +199,9 @@ def histogram(results):
>
>
>  if __name__ == "__main__":
> -    import argparse, subprocess, os
> +    import argparse
> +    import subprocess
> +    import os
>
>      args = argparse.ArgumentParser(description="Patch Review Tool")
>      args.add_argument("-b", "--blame", action="store_true", help="show
> blame for malformed patches")
> @@ -213,7 +216,9 @@ if __name__ == "__main__":
>      analyse(results, want_blame=args.blame, verbose=args.verbose)
>
>      if args.json:
> -        import json, os.path, collections
> +        import json
> +        import os.path
> +        import collections
>          if os.path.isfile(args.json):
>              data = json.load(open(args.json))
>          else:
> diff --git a/scripts/lnr b/scripts/lnr
> index a2ac4fec0f..e223b1e0e6 100755
> --- a/scripts/lnr
> +++ b/scripts/lnr
> @@ -6,7 +6,8 @@
>  # Create a *relative* symlink, just like ln --relative does but without
> needing
>  # coreutils 8.16.
>
> -import sys, os
> +import sys
> +import os
>
>  if len(sys.argv) != 3:
>     print("$ lnr TARGET LINK_NAME")
> diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
> index 8d223185a4..5834f59845 100755
> --- a/scripts/oe-pkgdata-browser
> +++ b/scripts/oe-pkgdata-browser
> @@ -1,6 +1,9 @@
>  #! /usr/bin/env python3
>
> -import os, sys, enum, ast
> +import os
> +import sys
> +import enum
> +import ast
>
>  scripts_path = os.path.dirname(os.path.realpath(__file__))
>  lib_path = scripts_path + '/lib'
> diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> index 00fb3bf797..c005cf341f 100644
> --- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> +++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
> @@ -1,4 +1,9 @@
> -import sys, os, re, struct, operator, math
> +import sys
> +import os
> +import re
> +import struct
> +import operator
> +import math
>  from collections import defaultdict
>  import unittest
>
> diff --git a/scripts/send-error-report b/scripts/send-error-report
> index cfbcaa52cb..ffa0a199b1 100755
> --- a/scripts/send-error-report
> +++ b/scripts/send-error-report
> @@ -10,7 +10,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>
> -import urllib.request, urllib.error
> +import urllib.request
> +import urllib.error
>  import sys
>  import json
>  import os
> diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
> index 14d8c298e9..a63f6c8115 100755
> --- a/scripts/verify-bashisms
> +++ b/scripts/verify-bashisms
> @@ -3,7 +3,11 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>
> -import sys, os, subprocess, re, shutil
> +import sys
> +import os
> +import subprocess
> +import re
> +import shutil
>
>  whitelist = (
>      # type is supported by dash
> @@ -92,7 +96,8 @@ def get_tinfoil():
>      return tinfoil
>
>  if __name__=='__main__':
> -    import argparse, shutil
> +    import argparse
> +    import shutil
>
>      parser = argparse.ArgumentParser(description='Bashim detector for
> shell fragments in recipes.')
>      parser.add_argument("recipes", metavar="RECIPE", nargs="*",
> help="recipes to check (if not specified, all will be checked)")
> --
> 2.32.0
>
>
> 
>
>

--0000000000003ce65205c5cd62a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wait, what is this patchset all about?</div><div><br>=
</div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, 28 Jun 2021 at 07:59, Khem Raj &lt;<a href=
=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: persianpros &lt;<a =
href=3D"mailto:persianpros@yahoo.com" target=3D"_blank">persianpros@yahoo.c=
om</a>&gt;<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/package.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 9 +++++++--<br>
=C2=A0meta/lib/oe/qa.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 +++-<br>
=C2=A0meta/lib/oe/utils.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=
=A0 6 ++++--<br>
=C2=A0meta/lib/oeqa/oetest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
4 +++-<br>
=C2=A0meta/lib/oeqa/sdk/case.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++=
-<br>
=C2=A0meta/lib/oeqa/sdk/cases/buildlzip.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++-<br>
=C2=A0meta/lib/oeqa/sdk/cases/python.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0meta/lib/oeqa/sdk/testsdk.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0meta/lib/oeqa/selftest/cases/oelib/path.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0meta/lib/oeqa/selftest/cases/package.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++--<br>
=C2=A0meta/lib/oeqa/selftest/cases/runtime_test.py=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0meta/lib/oeqa/utils/testexport.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++++-<br>
=C2=A0.../texinfo-dummy-native/texinfo-dummy/template.py=C2=A0 =C2=A0 |=C2=
=
=A0 4 +++-<br>
=C2=A0scripts/combo-layer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 ++-<br>
=C2=A0scripts/contrib/patchreview.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++++++---<br>
=C2=A0scripts/lnr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0scripts/oe-pkgdata-browser=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++-<br=
>
=C2=A0.../pybootchartgui/tests/parser_test.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++++++-<br>
=C2=A0scripts/send-error-report=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++=
-<br>
=C2=A0scripts/verify-bashisms=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
9 +++++++--<br>
=C2=A020 files changed, 75 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
index dd700cbb0c..fc5408d5f8 100644<br>
--- a/meta/lib/oe/package.py<br>
+++ b/meta/lib/oe/package.py<br>
@@ -107,7 +107,10 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_l=
ibdir, d, qa_already_stripp<br>
=C2=A0 =C2=A0 =C2=A0:param qa_already_stripped: Set to True if already-str=
ipped&#39; in ${INSANE_SKIP}<br>
=C2=A0 =C2=A0 =C2=A0This is for proper logging and messages only.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 import stat, errno, oe.path, oe.utils<br>
+=C2=A0 =C2=A0 import stat<br>
+=C2=A0 =C2=A0 import errno<br>
+=C2=A0 =C2=A0 import oe.path<br>
+=C2=A0 =C2=A0 import oe.utils<br>
<br>
=C2=A0 =C2=A0 =C2=A0elffiles =3D {}<br>
=C2=A0 =C2=A0 =C2=A0inodes =3D {}<br>
@@ -187,7 +190,9 @@ def file_translate(file):<br>
=C2=A0 =C2=A0 =C2=A0return ft<br>
<br>
=C2=A0def filedeprunner(arg):<br>
-=C2=A0 =C2=A0 import re, subprocess, shlex<br>
+=C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 import subprocess<br>
+=C2=A0 =C2=A0 import shlex<br>
<br>
=C2=A0 =C2=A0 =C2=A0(pkg, pkgfiles, rpmdeps, pkgdest) =3D arg<br>
=C2=A0 =C2=A0 =C2=A0provides =3D {}<br>
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py<br>
index e8a854a302..38c2e0cc1c 100644<br>
--- a/meta/lib/oe/qa.py<br>
+++ b/meta/lib/oe/qa.py<br>
@@ -2,7 +2,9 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
<br>
-import os, struct, mmap<br>
+import os<br>
+import struct<br>
+import mmap<br>
<br>
=C2=A0class NotELFFileError(Exception):<br>
=C2=A0 =C2=A0 =C2=A0pass<br>
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
index a84039f585..789bad33f6 100644<br>
--- a/meta/lib/oe/utils.py<br>
+++ b/meta/lib/oe/utils.py<br>
@@ -376,7 +376,8 @@ def format_pkg_list(pkg_dict, ret_format=3DNone):<br>
=C2=A0# Helper function to get the host compiler version<br>
=C2=A0# Do not assume the compiler is gcc<br>
=C2=A0def get_host_compiler_version(d, taskcontextonly=3DFalse):<br>
-=C2=A0 =C2=A0 import re, subprocess<br>
+=C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 import subprocess<br>
<br>
=C2=A0 =C2=A0 =C2=A0if taskcontextonly and d.getVar(&#39;BB_WORKERCONTEXT&=
#39;) !=3D &#39;1&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
@@ -404,7 +405,8 @@ def get_host_compiler_version(d, taskcontextonly=3DFal=
se):<br>
<br>
<br>
=C2=A0def host_gcc_version(d, taskcontextonly=3DFalse):<br>
-=C2=A0 =C2=A0 import re, subprocess<br>
+=C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 import subprocess<br>
<br>
=C2=A0 =C2=A0 =C2=A0if taskcontextonly and d.getVar(&#39;BB_WORKERCONTEXT&=
#39;) !=3D &#39;1&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py<br>
index 9c84466dd0..3136ac2ce5 100644<br>
--- a/meta/lib/oeqa/oetest.py<br>
+++ b/meta/lib/oeqa/oetest.py<br>
@@ -9,7 +9,9 @@<br>
<br>
=C2=A0# It also has some helper functions and it&#39;s responsible for act=
ually starting the tests<br>
<br>
-import os, re, sys<br>
+import os<br>
+import re<br>
+import sys<br>
=C2=A0import unittest<br>
=C2=A0import inspect<br>
=C2=A0import subprocess<br>
diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py<br>
index c45882689c..86ac199197 100644<br>
--- a/meta/lib/oeqa/sdk/case.py<br>
+++ b/meta/lib/oeqa/sdk/case.py<br>
@@ -35,7 +35,8 @@ class OESDKTestCase(OETestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OS/architecture, or if not specified the=
 currently configured MACHINE&#39;s<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OS/architecture.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 import <a href=3D"http://oe.qa" rel=3D"norefe=
rrer" target=3D"_blank">oe.qa</a>, oe.elf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import <a href=3D"http://oe.qa" rel=3D"norefe=
rrer" target=3D"_blank">oe.qa</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import oe.elf<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not target_os or not target_arch:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output =3D self._run(&quot=
;echo $OECORE_TARGET_OS:$OECORE_TARGET_ARCH&quot;)<br>
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/case=
s/buildlzip.py<br>
index 49ae756bf3..04c4a0ec16 100644<br>
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py<br>
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py<br>
@@ -2,7 +2,10 @@<br>
=C2=A0# SPDX-License-Identifier: MIT<br>
=C2=A0#<br>
<br>
-import os, tempfile, subprocess, unittest<br>
+import os<br>
+import tempfile<br>
+import subprocess<br>
+import unittest<br>
=C2=A0from oeqa.sdk.case import OESDKTestCase<br>
=C2=A0from oeqa.utils.subprocesstweak import errors_have_output<br>
=C2=A0errors_have_output()<br>
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/p=
ython.py<br>
index a334abce5f..2848481f33 100644<br>
--- a/meta/lib/oeqa/sdk/cases/python.py<br>
+++ b/meta/lib/oeqa/sdk/cases/python.py<br>
@@ -2,7 +2,8 @@<br>
=C2=A0# SPDX-License-Identifier: MIT<br>
=C2=A0#<br>
<br>
-import subprocess, unittest<br>
+import subprocess<br>
+import unittest<br>
=C2=A0from oeqa.sdk.case import OESDKTestCase<br>
<br>
=C2=A0from oeqa.utils.subprocesstweak import errors_have_output<br>
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py<b=
r>
index 35e40187bc..18e03cb8ef 100644<br>
--- a/meta/lib/oeqa/sdk/testsdk.py<br>
+++ b/meta/lib/oeqa/sdk/testsdk.py<br>
@@ -95,7 +95,8 @@ class TestSDK(TestSDKBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0processes =3D d.getVar(&quot;TESTIMAGE_N=
UMBER_THREADS&quot;) or d.getVar(&quot;BB_NUMBER_THREADS&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if processes:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import testtools,=
 subunit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import testtools<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import subunit<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except ImportError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quo=
t;Failed to import testtools or subunit, the testcases will run serially&qu=
ot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0processes =
=3D None<br>
diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/se=
lftest/cases/oelib/path.py<br>
index a1cfa08c09..098734fa5d 100644<br>
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py<br>
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py<br>
@@ -3,7 +3,8 @@<br>
=C2=A0#<br>
<br>
=C2=A0from unittest.case import TestCase<br>
-import oe, oe.path<br>
+import oe<br>
+import oe.path<br>
=C2=A0import tempfile<br>
=C2=A0import os<br>
=C2=A0import errno<br>
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selft=
est/cases/package.py<br>
index 7166c3991f..82aa1bde1c 100644<br>
--- a/meta/lib/oeqa/selftest/cases/package.py<br>
+++ b/meta/lib/oeqa/selftest/cases/package.py<br>
@@ -5,7 +5,8 @@<br>
=C2=A0from oeqa.selftest.case import OESelftestTestCase<br>
=C2=A0from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var, ru=
nqemu<br>
=C2=A0import stat<br>
-import subprocess, os<br>
+import subprocess<br>
+import os<br>
=C2=A0import oe.path<br>
=C2=A0import re<br>
<br>
@@ -150,7 +151,9 @@ class PackageTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0self.fail(&#39;GDB %s failed&#39; % binary)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_preserve_ownership(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os, stat, oe.cachedpath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import stat<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import oe.cachedpath<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features =3D &#39;IMAGE_INSTALL_append =
=3D &quot; selftest-chown&quot;\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(features)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&quot;core-image-minimal&quot;)<=
br>
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/=
selftest/cases/runtime_test.py<br>
index d0c2440722..54a80dfdc0 100644<br>
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py<br>
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py<br>
@@ -211,7 +211,8 @@ class TestImage(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Product: oe-core<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Author: Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a=
>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 import subprocess, os<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import subprocess<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0content =3D os.listdir(&qu=
ot;/dev/dri&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len([i for i in content=
 if i.startswith(&#39;render&#39;)]) =3D=3D 0:<br>
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/teste=
xport.py<br>
index e89d130a9c..383e57a6b2 100644<br>
--- a/meta/lib/oeqa/utils/testexport.py<br>
+++ b/meta/lib/oeqa/utils/testexport.py<br>
@@ -6,7 +6,11 @@<br>
<br>
=C2=A0# Provides functions to help with exporting binaries obtained from b=
uilt targets<br>
<br>
-import os, re, glob as g, shutil as sh,sys<br>
+import os<br>
+import re<br>
+import glob as g<br>
+import shutil as sh<br>
+import sys<br>
=C2=A0from time import sleep<br>
=C2=A0from .commands import runCmd<br>
=C2=A0from difflib import SequenceMatcher as SM<br>
diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/temp=
late.py b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template=
.py<br>
index 86c7c1811a..75c01b83bf 100644<br>
--- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py=
<br>
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py=
<br>
@@ -28,7 +28,9 @@<br>
=C2=A0# of the executable from argv[0] and emulate the corresponding progr=
am, so<br>
=C2=A0# multiple copies of this script will exist under different names.<b=
r>
<br>
-import sys, os, argparse<br>
+import sys<br>
+import os<br>
+import argparse<br>
<br>
<br>
=C2=A0this_binary =3D sys.argv[0].split(&quot;/&quot;)[-1]<br>
diff --git a/scripts/combo-layer b/scripts/combo-layer<br>
index 045de65642..835a6bcd09 100755<br>
--- a/scripts/combo-layer<br>
+++ b/scripts/combo-layer<br>
@@ -11,7 +11,8 @@<br>
=C2=A0#<br>
<br>
=C2=A0import fnmatch<br>
-import os, sys<br>
+import os<br>
+import sys<br>
=C2=A0import optparse<br>
=C2=A0import logging<br>
=C2=A0import subprocess<br>
diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.=
py<br>
index 62c509f51c..744dcfb49e 100755<br>
--- a/scripts/contrib/patchreview.py<br>
+++ b/scripts/contrib/patchreview.py<br>
@@ -40,7 +40,8 @@ def blame_patch(patch):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;--&quot;,=
 patch)).decode(&quot;utf-8&quot;).splitlines()<br>
<br>
=C2=A0def patchreview(path, patches):<br>
-=C2=A0 =C2=A0 import re, os.path<br>
+=C2=A0 =C2=A0 import re<br>
+=C2=A0 =C2=A0 import os.path<br>
<br>
=C2=A0 =C2=A0 =C2=A0# General pattern: start of line, optional whitespace,=
 tag with optional<br>
=C2=A0 =C2=A0 =C2=A0# hyphen or spaces, maybe a colon, some whitespace, th=
en the value, all case<br>
@@ -198,7 +199,9 @@ def histogram(results):<br>
<br>
<br>
=C2=A0if __name__ =3D=3D &quot;__main__&quot;:<br>
-=C2=A0 =C2=A0 import argparse, subprocess, os<br>
+=C2=A0 =C2=A0 import argparse<br>
+=C2=A0 =C2=A0 import subprocess<br>
+=C2=A0 =C2=A0 import os<br>
<br>
=C2=A0 =C2=A0 =C2=A0args =3D argparse.ArgumentParser(description=3D&quot;P=
atch Review Tool&quot;)<br>
=C2=A0 =C2=A0 =C2=A0args.add_argument(&quot;-b&quot;, &quot;--blame&quot;,=
 action=3D&quot;store_true&quot;, help=3D&quot;show blame for malformed pat=
ches&quot;)<br>
@@ -213,7 +216,9 @@ if __name__ =3D=3D &quot;__main__&quot;:<br>
=C2=A0 =C2=A0 =C2=A0analyse(results, want_blame=3Dargs.blame, verbose=3Dar=
gs.verbose)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if args.json:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 import json, os.path, collections<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import json<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os.path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 import collections<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.isfile(args.json):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D json.load(open(ar=
gs.json))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
diff --git a/scripts/lnr b/scripts/lnr<br>
index a2ac4fec0f..e223b1e0e6 100755<br>
--- a/scripts/lnr<br>
+++ b/scripts/lnr<br>
@@ -6,7 +6,8 @@<br>
=C2=A0# Create a *relative* symlink, just like ln --relative does but with=
out needing<br>
=C2=A0# coreutils 8.16.<br>
<br>
-import sys, os<br>
+import sys<br>
+import os<br>
<br>
=C2=A0if len(sys.argv) !=3D 3:<br>
=C2=A0 =C2=A0 print(&quot;$ lnr TARGET LINK_NAME&quot;)<br>
diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser<br>
index 8d223185a4..5834f59845 100755<br>
--- a/scripts/oe-pkgdata-browser<br>
+++ b/scripts/oe-pkgdata-browser<br>
@@ -1,6 +1,9 @@<br>
=C2=A0#! /usr/bin/env python3<br>
<br>
-import os, sys, enum, ast<br>
+import os<br>
+import sys<br>
+import enum<br>
+import ast<br>
<br>
=C2=A0scripts_path =3D os.path.dirname(os.path.realpath(__file__))<br>
=C2=A0lib_path =3D scripts_path + &#39;/lib&#39;<br>
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py b/=
scripts/pybootchartgui/pybootchartgui/tests/parser_test.py<br>
index 00fb3bf797..c005cf341f 100644<br>
--- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py<br>
+++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py<br>
@@ -1,4 +1,9 @@<br>
-import sys, os, re, struct, operator, math<br>
+import sys<br>
+import os<br>
+import re<br>
+import struct<br>
+import operator<br>
+import math<br>
=C2=A0from collections import defaultdict<br>
=C2=A0import unittest<br>
<br>
diff --git a/scripts/send-error-report b/scripts/send-error-report<br>
index cfbcaa52cb..ffa0a199b1 100755<br>
--- a/scripts/send-error-report<br>
+++ b/scripts/send-error-report<br>
@@ -10,7 +10,8 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
<br>
-import urllib.request, urllib.error<br>
+import urllib.request<br>
+import urllib.error<br>
=C2=A0import sys<br>
=C2=A0import json<br>
=C2=A0import os<br>
diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms<br>
index 14d8c298e9..a63f6c8115 100755<br>
--- a/scripts/verify-bashisms<br>
+++ b/scripts/verify-bashisms<br>
@@ -3,7 +3,11 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
=C2=A0#<br>
<br>
-import sys, os, subprocess, re, shutil<br>
+import sys<br>
+import os<br>
+import subprocess<br>
+import re<br>
+import shutil<br>
<br>
=C2=A0whitelist =3D (<br>
=C2=A0 =C2=A0 =C2=A0# type is supported by dash<br>
@@ -92,7 +96,8 @@ def get_tinfoil():<br>
=C2=A0 =C2=A0 =C2=A0return tinfoil<br>
<br>
=C2=A0if __name__=3D=3D&#39;__main__&#39;:<br>
-=C2=A0 =C2=A0 import argparse, shutil<br>
+=C2=A0 =C2=A0 import argparse<br>
+=C2=A0 =C2=A0 import shutil<br>
<br>
=C2=A0 =C2=A0 =C2=A0parser =3D argparse.ArgumentParser(description=3D&#39;=
Bashim detector for shell fragments in recipes.&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&quot;recipes&quot;, metavar=3D&qu=
ot;RECIPE&quot;, nargs=3D&quot;*&quot;, help=3D&quot;recipes to check (if n=
ot specified, all will be checked)&quot;)<br>
-- <br>
2.32.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000003ce65205c5cd62a0--
