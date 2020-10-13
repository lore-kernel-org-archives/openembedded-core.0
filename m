Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web12.8246.1602582468947569107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 02:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vgZjVl2E;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: idadelm@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id s66so18483653otb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q2WDPjR+7QpJj4qRb3yXYdQAwhaGU0djPmxialL3+V0=;
        b=vgZjVl2EQndma9bbaGA4xaQc+KaDR3GNkxpZn3WEsrlODFopGQqlPRfaZ0PekRt//8
         FUIspLLaQ6stt4atIj74WmooTh2AyiMiI+oxvZ8e4qplGDOHzlsnzA3ShjeBTNrFOi4u
         SwMHxXaeN3fUN6H6Oqc7BsCF+BNjkvRvYQEECZpK7vjrKZ5gBHnPmre52KZPBvfufomv
         XDtFLwrAMjM0RAWP0zxp9mIhCKoU+CDKSLQ/84Xp6sOdKwlPGwP+RGofeKMzafrHn6Ht
         N6AzYWXJxoT0X2BL5USyVDhctDq4Jhuc5lgYx1c4hFu+ZFK6mx7f9BSe7yMpne0dk3Il
         MyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q2WDPjR+7QpJj4qRb3yXYdQAwhaGU0djPmxialL3+V0=;
        b=GnLEBlhdgOnfVAmIEqAPE/CJ8MvWVPGg8pfM0npiQp+BPlfseBnusH926vaQaFgiPv
         3PPfnowryXlM/Oy3+XarutbsZrBTnEh7UWqp7Z+QXROBO63uMOIol4rouXB4rYrT+Gfc
         5+7Hjt+/kVsUMJSFqDnH9Q/MmcCs0uaL4tHdhmvolYDN6BQX0txg0rZ7K6gaEc2A5Xm7
         DK0rpPjbRAuyDXjCi7OuocEidkGLJU3VBeO6CnT+UDU1teRb3eV9+0mfsMD8hxIyzuVf
         9e3mT8oigfxssuLTtsskOWJBh/5fpxqcf2F1OvBaaSLGVTD6PjlEP+qN6MFP9z/SrDcG
         gKXQ==
X-Gm-Message-State: AOAM53309F2irSsx9BaP0SI40UXT5nuO5nRPzy5UjwAa7Ip9berLbS48
	bDzi406q9uIJqk5gBsw8eLieMNk8WdQKmA==
X-Google-Smtp-Source: ABdhPJx3iHGnXVRB67vaEj3AFMmh5gYPC4sw7GDdRzSwPD9EkeftZrOnN/P/oPwimecx5MVoh2GM/A==
X-Received: by 2002:a9d:2de2:: with SMTP id g89mr21541532otb.91.1602582463604;
        Tue, 13 Oct 2020 02:47:43 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([129.0.78.243])
        by smtp.gmail.com with ESMTPSA id l3sm9861209oth.36.2020.10.13.02.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 02:47:41 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Meh Mbeh Ida Delphine <idadelm@gmail.com>
Subject: [poky][PATCH v4] Update license file to match current SPDX names and license contents
Date: Tue, 13 Oct 2020 10:46:30 +0100
Message-Id: <20201013094630.28512-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Updated mappings of license fields of meta/conf/licenses.conf to match latest SPDX naming.
Added missing mappings.
Adde new license files.

Fixes: [YOCTO #13320]

Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
---

Changes in V4:
 * Added license files for AGPL-3.0-or-later, etc
 * Added new mappings
 * Updated license content.

Changes in V3:
 * Added missing mappings to meta/conf/licenses.conf

Changes in V2:
 * Corrected the email subject line.

 meta/conf/licenses.conf                       |  62 +-
 meta/files/common-licenses/AGPL-3.0           | 661 ------------------
 meta/files/common-licenses/AGPL-3.0-only      | 613 ++++++++++++++++
 meta/files/common-licenses/AGPL-3.0-or-later  | 613 ++++++++++++++++
 meta/files/common-licenses/GPL-1.0            | 252 -------
 meta/files/common-licenses/GPL-1.0-only       | 251 +++++++
 meta/files/common-licenses/GPL-1.0-or-later   | 232 ++++++
 meta/files/common-licenses/GPL-2.0            | 132 ----
 meta/files/common-licenses/GPL-2.0-only       | 319 +++++++++
 meta/files/common-licenses/GPL-2.0-or-later   | 319 +++++++++
 meta/files/common-licenses/GPL-3.0            | 225 ------
 meta/files/common-licenses/GPL-3.0-only       | 625 +++++++++++++++++
 meta/files/common-licenses/GPL-3.0-or-later   | 625 +++++++++++++++++
 meta/files/common-licenses/LGPL-2.0           | 342 ---------
 meta/files/common-licenses/LGPL-2.0-only      | 446 ++++++++++++
 meta/files/common-licenses/LGPL-2.0-or-later  | 446 ++++++++++++
 meta/files/common-licenses/LGPL-2.1           | 176 -----
 meta/files/common-licenses/LGPL-2.1-only      | 467 +++++++++++++
 meta/files/common-licenses/LGPL-2.1-or-later  | 468 +++++++++++++
 meta/files/common-licenses/LGPL-3.0           |  65 --
 meta/files/common-licenses/LGPL-3.0-only      | 163 +++++
 meta/files/common-licenses/LGPL-3.0-or-later  | 163 +++++
 vscode-bitbake-build/bitbake-cookerdaemon.log | 489 +++++++++++++
 vscode-bitbake-build/bitbake.lock             |   1 +
 .../cache/bb_persist_data.sqlite3             | Bin 0 -> 12288 bytes
 vscode-bitbake-build/conf/bblayers.conf       |  12 +
 vscode-bitbake-build/conf/local.conf          | 277 ++++++++
 vscode-bitbake-build/conf/templateconf.cfg    |   1 +
 vscode-bitbake-build/executeBitBakeCmd.sh     |   3 +
 vscode-bitbake-build/tmp/hosttools/[          |   1 +
 vscode-bitbake-build/tmp/hosttools/ar         |   1 +
 vscode-bitbake-build/tmp/hosttools/as         |   1 +
 vscode-bitbake-build/tmp/hosttools/awk        |   1 +
 vscode-bitbake-build/tmp/hosttools/basename   |   1 +
 vscode-bitbake-build/tmp/hosttools/bash       |   1 +
 vscode-bitbake-build/tmp/hosttools/bzip2      |   1 +
 vscode-bitbake-build/tmp/hosttools/cat        |   1 +
 vscode-bitbake-build/tmp/hosttools/chgrp      |   1 +
 vscode-bitbake-build/tmp/hosttools/chmod      |   1 +
 vscode-bitbake-build/tmp/hosttools/chown      |   1 +
 vscode-bitbake-build/tmp/hosttools/cmp        |   1 +
 vscode-bitbake-build/tmp/hosttools/comm       |   1 +
 vscode-bitbake-build/tmp/hosttools/cp         |   1 +
 vscode-bitbake-build/tmp/hosttools/cpio       |   1 +
 vscode-bitbake-build/tmp/hosttools/cpp        |   1 +
 vscode-bitbake-build/tmp/hosttools/cut        |   1 +
 vscode-bitbake-build/tmp/hosttools/date       |   1 +
 vscode-bitbake-build/tmp/hosttools/dd         |   1 +
 vscode-bitbake-build/tmp/hosttools/diff       |   1 +
 vscode-bitbake-build/tmp/hosttools/diffstat   |   1 +
 vscode-bitbake-build/tmp/hosttools/dirname    |   1 +
 vscode-bitbake-build/tmp/hosttools/du         |   1 +
 vscode-bitbake-build/tmp/hosttools/echo       |   1 +
 vscode-bitbake-build/tmp/hosttools/egrep      |   1 +
 vscode-bitbake-build/tmp/hosttools/env        |   1 +
 vscode-bitbake-build/tmp/hosttools/expand     |   1 +
 vscode-bitbake-build/tmp/hosttools/expr       |   1 +
 vscode-bitbake-build/tmp/hosttools/false      |   1 +
 vscode-bitbake-build/tmp/hosttools/fgrep      |   1 +
 vscode-bitbake-build/tmp/hosttools/file       |   1 +
 vscode-bitbake-build/tmp/hosttools/find       |   1 +
 vscode-bitbake-build/tmp/hosttools/flock      |   1 +
 vscode-bitbake-build/tmp/hosttools/g++        |   1 +
 vscode-bitbake-build/tmp/hosttools/gcc        |   1 +
 vscode-bitbake-build/tmp/hosttools/getconf    |   1 +
 vscode-bitbake-build/tmp/hosttools/getopt     |   1 +
 vscode-bitbake-build/tmp/hosttools/git        |   1 +
 vscode-bitbake-build/tmp/hosttools/grep       |   1 +
 vscode-bitbake-build/tmp/hosttools/gunzip     |   1 +
 vscode-bitbake-build/tmp/hosttools/gzip       |   1 +
 vscode-bitbake-build/tmp/hosttools/head       |   1 +
 vscode-bitbake-build/tmp/hosttools/hostname   |   1 +
 vscode-bitbake-build/tmp/hosttools/iconv      |   1 +
 vscode-bitbake-build/tmp/hosttools/id         |   1 +
 vscode-bitbake-build/tmp/hosttools/install    |   1 +
 vscode-bitbake-build/tmp/hosttools/ld         |   1 +
 vscode-bitbake-build/tmp/hosttools/ldd        |   1 +
 vscode-bitbake-build/tmp/hosttools/ln         |   1 +
 vscode-bitbake-build/tmp/hosttools/ls         |   1 +
 vscode-bitbake-build/tmp/hosttools/make       |   1 +
 vscode-bitbake-build/tmp/hosttools/md5sum     |   1 +
 vscode-bitbake-build/tmp/hosttools/mkdir      |   1 +
 vscode-bitbake-build/tmp/hosttools/mknod      |   1 +
 vscode-bitbake-build/tmp/hosttools/mktemp     |   1 +
 vscode-bitbake-build/tmp/hosttools/mv         |   1 +
 vscode-bitbake-build/tmp/hosttools/nm         |   1 +
 vscode-bitbake-build/tmp/hosttools/objcopy    |   1 +
 vscode-bitbake-build/tmp/hosttools/objdump    |   1 +
 vscode-bitbake-build/tmp/hosttools/od         |   1 +
 vscode-bitbake-build/tmp/hosttools/patch      |   1 +
 vscode-bitbake-build/tmp/hosttools/perl       |   1 +
 vscode-bitbake-build/tmp/hosttools/pr         |   1 +
 vscode-bitbake-build/tmp/hosttools/printf     |   1 +
 vscode-bitbake-build/tmp/hosttools/pwd        |   1 +
 vscode-bitbake-build/tmp/hosttools/python3    |   1 +
 vscode-bitbake-build/tmp/hosttools/ranlib     |   1 +
 vscode-bitbake-build/tmp/hosttools/readelf    |   1 +
 vscode-bitbake-build/tmp/hosttools/readlink   |   1 +
 vscode-bitbake-build/tmp/hosttools/realpath   |   1 +
 vscode-bitbake-build/tmp/hosttools/rm         |   1 +
 vscode-bitbake-build/tmp/hosttools/rmdir      |   1 +
 vscode-bitbake-build/tmp/hosttools/rpcgen     |   1 +
 vscode-bitbake-build/tmp/hosttools/sed        |   1 +
 vscode-bitbake-build/tmp/hosttools/seq        |   1 +
 vscode-bitbake-build/tmp/hosttools/sh         |   1 +
 vscode-bitbake-build/tmp/hosttools/sha1sum    |   1 +
 vscode-bitbake-build/tmp/hosttools/sha224sum  |   1 +
 vscode-bitbake-build/tmp/hosttools/sha256sum  |   1 +
 vscode-bitbake-build/tmp/hosttools/sha384sum  |   1 +
 vscode-bitbake-build/tmp/hosttools/sha512sum  |   1 +
 vscode-bitbake-build/tmp/hosttools/sleep      |   1 +
 vscode-bitbake-build/tmp/hosttools/sort       |   1 +
 vscode-bitbake-build/tmp/hosttools/split      |   1 +
 vscode-bitbake-build/tmp/hosttools/stat       |   1 +
 vscode-bitbake-build/tmp/hosttools/strings    |   1 +
 vscode-bitbake-build/tmp/hosttools/strip      |   1 +
 vscode-bitbake-build/tmp/hosttools/tail       |   1 +
 vscode-bitbake-build/tmp/hosttools/tar        |   1 +
 vscode-bitbake-build/tmp/hosttools/tee        |   1 +
 vscode-bitbake-build/tmp/hosttools/test       |   1 +
 vscode-bitbake-build/tmp/hosttools/touch      |   1 +
 vscode-bitbake-build/tmp/hosttools/tr         |   1 +
 vscode-bitbake-build/tmp/hosttools/true       |   1 +
 vscode-bitbake-build/tmp/hosttools/uname      |   1 +
 vscode-bitbake-build/tmp/hosttools/uniq       |   1 +
 vscode-bitbake-build/tmp/hosttools/wc         |   1 +
 vscode-bitbake-build/tmp/hosttools/wget       |   1 +
 vscode-bitbake-build/tmp/hosttools/which      |   1 +
 vscode-bitbake-build/tmp/hosttools/xargs      |   1 +
 129 files changed, 6678 insertions(+), 1870 deletions(-)
 delete mode 100644 meta/files/common-licenses/AGPL-3.0
 create mode 100644 meta/files/common-licenses/AGPL-3.0-only
 create mode 100644 meta/files/common-licenses/AGPL-3.0-or-later
 delete mode 100644 meta/files/common-licenses/GPL-1.0
 create mode 100644 meta/files/common-licenses/GPL-1.0-only
 create mode 100644 meta/files/common-licenses/GPL-1.0-or-later
 delete mode 100644 meta/files/common-licenses/GPL-2.0
 create mode 100644 meta/files/common-licenses/GPL-2.0-only
 create mode 100644 meta/files/common-licenses/GPL-2.0-or-later
 delete mode 100644 meta/files/common-licenses/GPL-3.0
 create mode 100644 meta/files/common-licenses/GPL-3.0-only
 create mode 100644 meta/files/common-licenses/GPL-3.0-or-later
 delete mode 100644 meta/files/common-licenses/LGPL-2.0
 create mode 100644 meta/files/common-licenses/LGPL-2.0-only
 create mode 100644 meta/files/common-licenses/LGPL-2.0-or-later
 delete mode 100644 meta/files/common-licenses/LGPL-2.1
 create mode 100644 meta/files/common-licenses/LGPL-2.1-only
 create mode 100644 meta/files/common-licenses/LGPL-2.1-or-later
 delete mode 100644 meta/files/common-licenses/LGPL-3.0
 create mode 100644 meta/files/common-licenses/LGPL-3.0-only
 create mode 100644 meta/files/common-licenses/LGPL-3.0-or-later
 create mode 100644 vscode-bitbake-build/bitbake-cookerdaemon.log
 create mode 100644 vscode-bitbake-build/bitbake.lock
 create mode 100644 vscode-bitbake-build/cache/bb_persist_data.sqlite3
 create mode 100644 vscode-bitbake-build/conf/bblayers.conf
 create mode 100644 vscode-bitbake-build/conf/local.conf
 create mode 100644 vscode-bitbake-build/conf/templateconf.cfg
 create mode 100755 vscode-bitbake-build/executeBitBakeCmd.sh
 create mode 120000 vscode-bitbake-build/tmp/hosttools/[
 create mode 120000 vscode-bitbake-build/tmp/hosttools/ar
 create mode 120000 vscode-bitbake-build/tmp/hosttools/as
 create mode 120000 vscode-bitbake-build/tmp/hosttools/awk
 create mode 120000 vscode-bitbake-build/tmp/hosttools/basename
 create mode 120000 vscode-bitbake-build/tmp/hosttools/bash
 create mode 120000 vscode-bitbake-build/tmp/hosttools/bzip2
 create mode 120000 vscode-bitbake-build/tmp/hosttools/cat
 create mode 120000 vscode-bitbake-build/tmp/hosttools/chgrp
 create mode 120000 vscode-bitbake-build/tmp/hosttools/chmod
 create mode 120000 vscode-bitbake-build/tmp/hosttools/chown
 create mode 120000 vscode-bitbake-build/tmp/hosttools/cmp
 create mode 120000 vscode-bitbake-build/tmp/hosttools/comm
 create mode 120000 vscode-bitbake-build/tmp/hosttools/cp
 create mode 120000 vscode-bitbake-build/tmp/hosttools/cpio
 create mode 120000 vscode-bitbake-build/tmp/hosttools/cpp
 create mode 120000 vscode-bitbake-build/tmp/hosttools/cut
 create mode 120000 vscode-bitbake-build/tmp/hosttools/date
 create mode 120000 vscode-bitbake-build/tmp/hosttools/dd
 create mode 120000 vscode-bitbake-build/tmp/hosttools/diff
 create mode 120000 vscode-bitbake-build/tmp/hosttools/diffstat
 create mode 120000 vscode-bitbake-build/tmp/hosttools/dirname
 create mode 120000 vscode-bitbake-build/tmp/hosttools/du
 create mode 120000 vscode-bitbake-build/tmp/hosttools/echo
 create mode 120000 vscode-bitbake-build/tmp/hosttools/egrep
 create mode 120000 vscode-bitbake-build/tmp/hosttools/env
 create mode 120000 vscode-bitbake-build/tmp/hosttools/expand
 create mode 120000 vscode-bitbake-build/tmp/hosttools/expr
 create mode 120000 vscode-bitbake-build/tmp/hosttools/false
 create mode 120000 vscode-bitbake-build/tmp/hosttools/fgrep
 create mode 120000 vscode-bitbake-build/tmp/hosttools/file
 create mode 120000 vscode-bitbake-build/tmp/hosttools/find
 create mode 120000 vscode-bitbake-build/tmp/hosttools/flock
 create mode 120000 vscode-bitbake-build/tmp/hosttools/g++
 create mode 120000 vscode-bitbake-build/tmp/hosttools/gcc
 create mode 120000 vscode-bitbake-build/tmp/hosttools/getconf
 create mode 120000 vscode-bitbake-build/tmp/hosttools/getopt
 create mode 120000 vscode-bitbake-build/tmp/hosttools/git
 create mode 120000 vscode-bitbake-build/tmp/hosttools/grep
 create mode 120000 vscode-bitbake-build/tmp/hosttools/gunzip
 create mode 120000 vscode-bitbake-build/tmp/hosttools/gzip
 create mode 120000 vscode-bitbake-build/tmp/hosttools/head
 create mode 120000 vscode-bitbake-build/tmp/hosttools/hostname
 create mode 120000 vscode-bitbake-build/tmp/hosttools/iconv
 create mode 120000 vscode-bitbake-build/tmp/hosttools/id
 create mode 120000 vscode-bitbake-build/tmp/hosttools/install
 create mode 120000 vscode-bitbake-build/tmp/hosttools/ld
 create mode 120000 vscode-bitbake-build/tmp/hosttools/ldd
 create mode 120000 vscode-bitbake-build/tmp/hosttools/ln
 create mode 120000 vscode-bitbake-build/tmp/hosttools/ls
 create mode 120000 vscode-bitbake-build/tmp/hosttools/make
 create mode 120000 vscode-bitbake-build/tmp/hosttools/md5sum
 create mode 120000 vscode-bitbake-build/tmp/hosttools/mkdir
 create mode 120000 vscode-bitbake-build/tmp/hosttools/mknod
 create mode 120000 vscode-bitbake-build/tmp/hosttools/mktemp
 create mode 120000 vscode-bitbake-build/tmp/hosttools/mv
 create mode 120000 vscode-bitbake-build/tmp/hosttools/nm
 create mode 120000 vscode-bitbake-build/tmp/hosttools/objcopy
 create mode 120000 vscode-bitbake-build/tmp/hosttools/objdump
 create mode 120000 vscode-bitbake-build/tmp/hosttools/od
 create mode 120000 vscode-bitbake-build/tmp/hosttools/patch
 create mode 120000 vscode-bitbake-build/tmp/hosttools/perl
 create mode 120000 vscode-bitbake-build/tmp/hosttools/pr
 create mode 120000 vscode-bitbake-build/tmp/hosttools/printf
 create mode 120000 vscode-bitbake-build/tmp/hosttools/pwd
 create mode 120000 vscode-bitbake-build/tmp/hosttools/python3
 create mode 120000 vscode-bitbake-build/tmp/hosttools/ranlib
 create mode 120000 vscode-bitbake-build/tmp/hosttools/readelf
 create mode 120000 vscode-bitbake-build/tmp/hosttools/readlink
 create mode 120000 vscode-bitbake-build/tmp/hosttools/realpath
 create mode 120000 vscode-bitbake-build/tmp/hosttools/rm
 create mode 120000 vscode-bitbake-build/tmp/hosttools/rmdir
 create mode 120000 vscode-bitbake-build/tmp/hosttools/rpcgen
 create mode 120000 vscode-bitbake-build/tmp/hosttools/sed
 create mode 120000 vscode-bitbake-build/tmp/hosttools/seq
 create mode 120000 vscode-bitbake-build/tmp/hosttools/sh
 create mode 120000 vscode-bitbake-build/tmp/hosttools/sha1sum
 create mode 120000 vscode-bitbake-build/tmp/hosttools/sha224sum
 create mode 120000 vscode-bitbake-build/tmp/hosttools/sha256sum
 create mode 120000 vscode-bitbake-build/tmp/hosttools/sha384sum
 create mode 120000 vscode-bitbake-build/tmp/hosttools/sha512sum
 create mode 120000 vscode-bitbake-build/tmp/hosttools/sleep
 create mode 120000 vscode-bitbake-build/tmp/hosttools/sort
 create mode 120000 vscode-bitbake-build/tmp/hosttools/split
 create mode 120000 vscode-bitbake-build/tmp/hosttools/stat
 create mode 120000 vscode-bitbake-build/tmp/hosttools/strings
 create mode 120000 vscode-bitbake-build/tmp/hosttools/strip
 create mode 120000 vscode-bitbake-build/tmp/hosttools/tail
 create mode 120000 vscode-bitbake-build/tmp/hosttools/tar
 create mode 120000 vscode-bitbake-build/tmp/hosttools/tee
 create mode 120000 vscode-bitbake-build/tmp/hosttools/test
 create mode 120000 vscode-bitbake-build/tmp/hosttools/touch
 create mode 120000 vscode-bitbake-build/tmp/hosttools/tr
 create mode 120000 vscode-bitbake-build/tmp/hosttools/true
 create mode 120000 vscode-bitbake-build/tmp/hosttools/uname
 create mode 120000 vscode-bitbake-build/tmp/hosttools/uniq
 create mode 120000 vscode-bitbake-build/tmp/hosttools/wc
 create mode 120000 vscode-bitbake-build/tmp/hosttools/wget
 create mode 120000 vscode-bitbake-build/tmp/hosttools/which
 create mode 120000 vscode-bitbake-build/tmp/hosttools/xargs

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 5b309eb385..84ec88ca4d 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -10,33 +10,51 @@
 # Any mapping to MPL/LGPL/GPL should be fixed
 
 # AGPL variations
-SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0"
+SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPL-3.0] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPL-3.0+] = "AGPL-3.0-or-later"
 
 # GPL variations
-SPDXLICENSEMAP[GPL-1] = "GPL-1.0"
-SPDXLICENSEMAP[GPLv1] = "GPL-1.0"
-SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
-SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
-SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
+SPDXLICENSEMAP[GPL-1] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPLv1] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPL-1.0+] = "GPL-1.0-or-later"
+SPDXLICENSEMAP[GPL-1.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2.0+] = "GPL-2.0-or-later"
+SPDXLICENSEMAP[GPL-3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPL-3.0] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPL-3.0+] = "GPL-3.0-or-later"
 
 #LGPL variations
-SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
+SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPL-2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPL-2.0+] = "LGPL-2.0-or-later"
+SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPL-2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPL-2.1+] = "LGPL-2.1-or-later"
+SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0-only"
+SPDXLICENSEMAP[LGPL-3.0] = "LGPL-3.0-only"
+SPDXLICENSEMAP[LGPL-3.0+] = "LGPL-3.0-or-later"
 
 #MPL variations
 SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
 SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
+SPDXLICENSEMAP[MPL-1.0] = "MPL-1.0"
 SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
+SPDXLICENSEMAP[MPL-1.1] = "MPL-1.1"
 SPDXLICENSEMAP[MPLv2] = "MPL-2.0"
+SPDXLICENSEMAP[MPL-2.0] = "MPL-2.0"
+
 
 #MIT variations
 SPDXLICENSEMAP[MIT-X] = "MIT"
@@ -48,33 +66,43 @@ SPDXLICENSEMAP[openssl] = "OpenSSL"
 #PSF variations
 SPDXLICENSEMAP[PSF] = "PSF-2.0"
 SPDXLICENSEMAP[PSFv2] = "PSF-2.0"
+SPDXLICENSEMAP[PSF-2.0] = "PSF-2.0"
 
 #Python variations
 SPDXLICENSEMAP[Python-2] = "Python-2.0"
+SPDXLICENSEMAP[Python-2.0] = "Python-2.0"
 
 #Apache variations
 SPDXLICENSEMAP[Apachev2] = "Apache-2.0"
 SPDXLICENSEMAP[Apache-2] = "Apache-2.0"
+SPDXLICENSEMAP[Apache-2.0] = "Apache-2.0"
 
 #Artistic variations
 SPDXLICENSEMAP[Artisticv1] = "Artistic-1.0"
 SPDXLICENSEMAP[Artistic-1] = "Artistic-1.0"
+SPDXLICENSEMAP[Artistic-1.0] = "Artistic-1.0"
 
 #Academic variations
 SPDXLICENSEMAP[AFL-2] = "AFL-2.0"
+SPDXLICENSEMAP[AFL-2.0] = "AFL-2.0"
 SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
+SPDXLICENSEMAP[AFL-1.2] = "AFL-1.2"
 SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
+SPDXLICENSEMAP[AFL-2.0] = "AFL-2.0"
 SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
 
 #CDDL variations
 SPDXLICENSEMAP[CDDLv1] = "CDDL-1.0"
 SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
+SPDXLICENSEMAP[CDDL-1.0] = "CDDL-1.0"
 
 #Other variations
 SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
+SPDXLICENSEMAP[EPL-1.0] = "EPL-1.0"
 
 #Silicon Graphics variations
 SPDXLICENSEMAP[SGIv1] = "SGI-1"
+SPDXLICENSEMAP[SGI-1] = "SGI-1"
 
 # Additional license directories. Add your custom licenses directories this path.
 # LICENSE_PATH += "${COREBASE}/custom-licenses"
diff --git a/meta/files/common-licenses/AGPL-3.0 b/meta/files/common-licenses/AGPL-3.0
deleted file mode 100644
index dba13ed2dd..0000000000
--- a/meta/files/common-licenses/AGPL-3.0
+++ /dev/null
@@ -1,661 +0,0 @@
-                    GNU AFFERO GENERAL PUBLIC LICENSE
-                       Version 3, 19 November 2007
-
- Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
- Everyone is permitted to copy and distribute verbatim copies
- of this license document, but changing it is not allowed.
-
-                            Preamble
-
-  The GNU Affero General Public License is a free, copyleft license for
-software and other kinds of works, specifically designed to ensure
-cooperation with the community in the case of network server software.
-
-  The licenses for most software and other practical works are designed
-to take away your freedom to share and change the works.  By contrast,
-our General Public Licenses are intended to guarantee your freedom to
-share and change all versions of a program--to make sure it remains free
-software for all its users.
-
-  When we speak of free software, we are referring to freedom, not
-price.  Our General Public Licenses are designed to make sure that you
-have the freedom to distribute copies of free software (and charge for
-them if you wish), that you receive source code or can get it if you
-want it, that you can change the software or use pieces of it in new
-free programs, and that you know you can do these things.
-
-  Developers that use our General Public Licenses protect your rights
-with two steps: (1) assert copyright on the software, and (2) offer
-you this License which gives you legal permission to copy, distribute
-and/or modify the software.
-
-  A secondary benefit of defending all users' freedom is that
-improvements made in alternate versions of the program, if they
-receive widespread use, become available for other developers to
-incorporate.  Many developers of free software are heartened and
-encouraged by the resulting cooperation.  However, in the case of
-software used on network servers, this result may fail to come about.
-The GNU General Public License permits making a modified version and
-letting the public access it on a server without ever releasing its
-source code to the public.
-
-  The GNU Affero General Public License is designed specifically to
-ensure that, in such cases, the modified source code becomes available
-to the community.  It requires the operator of a network server to
-provide the source code of the modified version running there to the
-users of that server.  Therefore, public use of a modified version, on
-a publicly accessible server, gives the public access to the source
-code of the modified version.
-
-  An older license, called the Affero General Public License and
-published by Affero, was designed to accomplish similar goals.  This is
-a different license, not a version of the Affero GPL, but Affero has
-released a new version of the Affero GPL which permits relicensing under
-this license.
-
-  The precise terms and conditions for copying, distribution and
-modification follow.
-
-                       TERMS AND CONDITIONS
-
-  0. Definitions.
-
-  "This License" refers to version 3 of the GNU Affero General Public License.
-
-  "Copyright" also means copyright-like laws that apply to other kinds of
-works, such as semiconductor masks.
-
-  "The Program" refers to any copyrightable work licensed under this
-License.  Each licensee is addressed as "you".  "Licensees" and
-"recipients" may be individuals or organizations.
-
-  To "modify" a work means to copy from or adapt all or part of the work
-in a fashion requiring copyright permission, other than the making of an
-exact copy.  The resulting work is called a "modified version" of the
-earlier work or a work "based on" the earlier work.
-
-  A "covered work" means either the unmodified Program or a work based
-on the Program.
-
-  To "propagate" a work means to do anything with it that, without
-permission, would make you directly or secondarily liable for
-infringement under applicable copyright law, except executing it on a
-computer or modifying a private copy.  Propagation includes copying,
-distribution (with or without modification), making available to the
-public, and in some countries other activities as well.
-
-  To "convey" a work means any kind of propagation that enables other
-parties to make or receive copies.  Mere interaction with a user through
-a computer network, with no transfer of a copy, is not conveying.
-
-  An interactive user interface displays "Appropriate Legal Notices"
-to the extent that it includes a convenient and prominently visible
-feature that (1) displays an appropriate copyright notice, and (2)
-tells the user that there is no warranty for the work (except to the
-extent that warranties are provided), that licensees may convey the
-work under this License, and how to view a copy of this License.  If
-the interface presents a list of user commands or options, such as a
-menu, a prominent item in the list meets this criterion.
-
-  1. Source Code.
-
-  The "source code" for a work means the preferred form of the work
-for making modifications to it.  "Object code" means any non-source
-form of a work.
-
-  A "Standard Interface" means an interface that either is an official
-standard defined by a recognized standards body, or, in the case of
-interfaces specified for a particular programming language, one that
-is widely used among developers working in that language.
-
-  The "System Libraries" of an executable work include anything, other
-than the work as a whole, that (a) is included in the normal form of
-packaging a Major Component, but which is not part of that Major
-Component, and (b) serves only to enable use of the work with that
-Major Component, or to implement a Standard Interface for which an
-implementation is available to the public in source code form.  A
-"Major Component", in this context, means a major essential component
-(kernel, window system, and so on) of the specific operating system
-(if any) on which the executable work runs, or a compiler used to
-produce the work, or an object code interpreter used to run it.
-
-  The "Corresponding Source" for a work in object code form means all
-the source code needed to generate, install, and (for an executable
-work) run the object code and to modify the work, including scripts to
-control those activities.  However, it does not include the work's
-System Libraries, or general-purpose tools or generally available free
-programs which are used unmodified in performing those activities but
-which are not part of the work.  For example, Corresponding Source
-includes interface definition files associated with source files for
-the work, and the source code for shared libraries and dynamically
-linked subprograms that the work is specifically designed to require,
-such as by intimate data communication or control flow between those
-subprograms and other parts of the work.
-
-  The Corresponding Source need not include anything that users
-can regenerate automatically from other parts of the Corresponding
-Source.
-
-  The Corresponding Source for a work in source code form is that
-same work.
-
-  2. Basic Permissions.
-
-  All rights granted under this License are granted for the term of
-copyright on the Program, and are irrevocable provided the stated
-conditions are met.  This License explicitly affirms your unlimited
-permission to run the unmodified Program.  The output from running a
-covered work is covered by this License only if the output, given its
-content, constitutes a covered work.  This License acknowledges your
-rights of fair use or other equivalent, as provided by copyright law.
-
-  You may make, run and propagate covered works that you do not
-convey, without conditions so long as your license otherwise remains
-in force.  You may convey covered works to others for the sole purpose
-of having them make modifications exclusively for you, or provide you
-with facilities for running those works, provided that you comply with
-the terms of this License in conveying all material for which you do
-not control copyright.  Those thus making or running the covered works
-for you must do so exclusively on your behalf, under your direction
-and control, on terms that prohibit them from making any copies of
-your copyrighted material outside their relationship with you.
-
-  Conveying under any other circumstances is permitted solely under
-the conditions stated below.  Sublicensing is not allowed; section 10
-makes it unnecessary.
-
-  3. Protecting Users' Legal Rights From Anti-Circumvention Law.
-
-  No covered work shall be deemed part of an effective technological
-measure under any applicable law fulfilling obligations under article
-11 of the WIPO copyright treaty adopted on 20 December 1996, or
-similar laws prohibiting or restricting circumvention of such
-measures.
-
-  When you convey a covered work, you waive any legal power to forbid
-circumvention of technological measures to the extent such circumvention
-is effected by exercising rights under this License with respect to
-the covered work, and you disclaim any intention to limit operation or
-modification of the work as a means of enforcing, against the work's
-users, your or third parties' legal rights to forbid circumvention of
-technological measures.
-
-  4. Conveying Verbatim Copies.
-
-  You may convey verbatim copies of the Program's source code as you
-receive it, in any medium, provided that you conspicuously and
-appropriately publish on each copy an appropriate copyright notice;
-keep intact all notices stating that this License and any
-non-permissive terms added in accord with section 7 apply to the code;
-keep intact all notices of the absence of any warranty; and give all
-recipients a copy of this License along with the Program.
-
-  You may charge any price or no price for each copy that you convey,
-and you may offer support or warranty protection for a fee.
-
-  5. Conveying Modified Source Versions.
-
-  You may convey a work based on the Program, or the modifications to
-produce it from the Program, in the form of source code under the
-terms of section 4, provided that you also meet all of these conditions:
-
-    a) The work must carry prominent notices stating that you modified
-    it, and giving a relevant date.
-
-    b) The work must carry prominent notices stating that it is
-    released under this License and any conditions added under section
-    7.  This requirement modifies the requirement in section 4 to
-    "keep intact all notices".
-
-    c) You must license the entire work, as a whole, under this
-    License to anyone who comes into possession of a copy.  This
-    License will therefore apply, along with any applicable section 7
-    additional terms, to the whole of the work, and all its parts,
-    regardless of how they are packaged.  This License gives no
-    permission to license the work in any other way, but it does not
-    invalidate such permission if you have separately received it.
-
-    d) If the work has interactive user interfaces, each must display
-    Appropriate Legal Notices; however, if the Program has interactive
-    interfaces that do not display Appropriate Legal Notices, your
-    work need not make them do so.
-
-  A compilation of a covered work with other separate and independent
-works, which are not by their nature extensions of the covered work,
-and which are not combined with it such as to form a larger program,
-in or on a volume of a storage or distribution medium, is called an
-"aggregate" if the compilation and its resulting copyright are not
-used to limit the access or legal rights of the compilation's users
-beyond what the individual works permit.  Inclusion of a covered work
-in an aggregate does not cause this License to apply to the other
-parts of the aggregate.
-
-  6. Conveying Non-Source Forms.
-
-  You may convey a covered work in object code form under the terms
-of sections 4 and 5, provided that you also convey the
-machine-readable Corresponding Source under the terms of this License,
-in one of these ways:
-
-    a) Convey the object code in, or embodied in, a physical product
-    (including a physical distribution medium), accompanied by the
-    Corresponding Source fixed on a durable physical medium
-    customarily used for software interchange.
-
-    b) Convey the object code in, or embodied in, a physical product
-    (including a physical distribution medium), accompanied by a
-    written offer, valid for at least three years and valid for as
-    long as you offer spare parts or customer support for that product
-    model, to give anyone who possesses the object code either (1) a
-    copy of the Corresponding Source for all the software in the
-    product that is covered by this License, on a durable physical
-    medium customarily used for software interchange, for a price no
-    more than your reasonable cost of physically performing this
-    conveying of source, or (2) access to copy the
-    Corresponding Source from a network server at no charge.
-
-    c) Convey individual copies of the object code with a copy of the
-    written offer to provide the Corresponding Source.  This
-    alternative is allowed only occasionally and noncommercially, and
-    only if you received the object code with such an offer, in accord
-    with subsection 6b.
-
-    d) Convey the object code by offering access from a designated
-    place (gratis or for a charge), and offer equivalent access to the
-    Corresponding Source in the same way through the same place at no
-    further charge.  You need not require recipients to copy the
-    Corresponding Source along with the object code.  If the place to
-    copy the object code is a network server, the Corresponding Source
-    may be on a different server (operated by you or a third party)
-    that supports equivalent copying facilities, provided you maintain
-    clear directions next to the object code saying where to find the
-    Corresponding Source.  Regardless of what server hosts the
-    Corresponding Source, you remain obligated to ensure that it is
-    available for as long as needed to satisfy these requirements.
-
-    e) Convey the object code using peer-to-peer transmission, provided
-    you inform other peers where the object code and Corresponding
-    Source of the work are being offered to the general public at no
-    charge under subsection 6d.
-
-  A separable portion of the object code, whose source code is excluded
-from the Corresponding Source as a System Library, need not be
-included in conveying the object code work.
-
-  A "User Product" is either (1) a "consumer product", which means any
-tangible personal property which is normally used for personal, family,
-or household purposes, or (2) anything designed or sold for incorporation
-into a dwelling.  In determining whether a product is a consumer product,
-doubtful cases shall be resolved in favor of coverage.  For a particular
-product received by a particular user, "normally used" refers to a
-typical or common use of that class of product, regardless of the status
-of the particular user or of the way in which the particular user
-actually uses, or expects or is expected to use, the product.  A product
-is a consumer product regardless of whether the product has substantial
-commercial, industrial or non-consumer uses, unless such uses represent
-the only significant mode of use of the product.
-
-  "Installation Information" for a User Product means any methods,
-procedures, authorization keys, or other information required to install
-and execute modified versions of a covered work in that User Product from
-a modified version of its Corresponding Source.  The information must
-suffice to ensure that the continued functioning of the modified object
-code is in no case prevented or interfered with solely because
-modification has been made.
-
-  If you convey an object code work under this section in, or with, or
-specifically for use in, a User Product, and the conveying occurs as
-part of a transaction in which the right of possession and use of the
-User Product is transferred to the recipient in perpetuity or for a
-fixed term (regardless of how the transaction is characterized), the
-Corresponding Source conveyed under this section must be accompanied
-by the Installation Information.  But this requirement does not apply
-if neither you nor any third party retains the ability to install
-modified object code on the User Product (for example, the work has
-been installed in ROM).
-
-  The requirement to provide Installation Information does not include a
-requirement to continue to provide support service, warranty, or updates
-for a work that has been modified or installed by the recipient, or for
-the User Product in which it has been modified or installed.  Access to a
-network may be denied when the modification itself materially and
-adversely affects the operation of the network or violates the rules and
-protocols for communication across the network.
-
-  Corresponding Source conveyed, and Installation Information provided,
-in accord with this section must be in a format that is publicly
-documented (and with an implementation available to the public in
-source code form), and must require no special password or key for
-unpacking, reading or copying.
-
-  7. Additional Terms.
-
-  "Additional permissions" are terms that supplement the terms of this
-License by making exceptions from one or more of its conditions.
-Additional permissions that are applicable to the entire Program shall
-be treated as though they were included in this License, to the extent
-that they are valid under applicable law.  If additional permissions
-apply only to part of the Program, that part may be used separately
-under those permissions, but the entire Program remains governed by
-this License without regard to the additional permissions.
-
-  When you convey a copy of a covered work, you may at your option
-remove any additional permissions from that copy, or from any part of
-it.  (Additional permissions may be written to require their own
-removal in certain cases when you modify the work.)  You may place
-additional permissions on material, added by you to a covered work,
-for which you have or can give appropriate copyright permission.
-
-  Notwithstanding any other provision of this License, for material you
-add to a covered work, you may (if authorized by the copyright holders of
-that material) supplement the terms of this License with terms:
-
-    a) Disclaiming warranty or limiting liability differently from the
-    terms of sections 15 and 16 of this License; or
-
-    b) Requiring preservation of specified reasonable legal notices or
-    author attributions in that material or in the Appropriate Legal
-    Notices displayed by works containing it; or
-
-    c) Prohibiting misrepresentation of the origin of that material, or
-    requiring that modified versions of such material be marked in
-    reasonable ways as different from the original version; or
-
-    d) Limiting the use for publicity purposes of names of licensors or
-    authors of the material; or
-
-    e) Declining to grant rights under trademark law for use of some
-    trade names, trademarks, or service marks; or
-
-    f) Requiring indemnification of licensors and authors of that
-    material by anyone who conveys the material (or modified versions of
-    it) with contractual assumptions of liability to the recipient, for
-    any liability that these contractual assumptions directly impose on
-    those licensors and authors.
-
-  All other non-permissive additional terms are considered "further
-restrictions" within the meaning of section 10.  If the Program as you
-received it, or any part of it, contains a notice stating that it is
-governed by this License along with a term that is a further
-restriction, you may remove that term.  If a license document contains
-a further restriction but permits relicensing or conveying under this
-License, you may add to a covered work material governed by the terms
-of that license document, provided that the further restriction does
-not survive such relicensing or conveying.
-
-  If you add terms to a covered work in accord with this section, you
-must place, in the relevant source files, a statement of the
-additional terms that apply to those files, or a notice indicating
-where to find the applicable terms.
-
-  Additional terms, permissive or non-permissive, may be stated in the
-form of a separately written license, or stated as exceptions;
-the above requirements apply either way.
-
-  8. Termination.
-
-  You may not propagate or modify a covered work except as expressly
-provided under this License.  Any attempt otherwise to propagate or
-modify it is void, and will automatically terminate your rights under
-this License (including any patent licenses granted under the third
-paragraph of section 11).
-
-  However, if you cease all violation of this License, then your
-license from a particular copyright holder is reinstated (a)
-provisionally, unless and until the copyright holder explicitly and
-finally terminates your license, and (b) permanently, if the copyright
-holder fails to notify you of the violation by some reasonable means
-prior to 60 days after the cessation.
-
-  Moreover, your license from a particular copyright holder is
-reinstated permanently if the copyright holder notifies you of the
-violation by some reasonable means, this is the first time you have
-received notice of violation of this License (for any work) from that
-copyright holder, and you cure the violation prior to 30 days after
-your receipt of the notice.
-
-  Termination of your rights under this section does not terminate the
-licenses of parties who have received copies or rights from you under
-this License.  If your rights have been terminated and not permanently
-reinstated, you do not qualify to receive new licenses for the same
-material under section 10.
-
-  9. Acceptance Not Required for Having Copies.
-
-  You are not required to accept this License in order to receive or
-run a copy of the Program.  Ancillary propagation of a covered work
-occurring solely as a consequence of using peer-to-peer transmission
-to receive a copy likewise does not require acceptance.  However,
-nothing other than this License grants you permission to propagate or
-modify any covered work.  These actions infringe copyright if you do
-not accept this License.  Therefore, by modifying or propagating a
-covered work, you indicate your acceptance of this License to do so.
-
-  10. Automatic Licensing of Downstream Recipients.
-
-  Each time you convey a covered work, the recipient automatically
-receives a license from the original licensors, to run, modify and
-propagate that work, subject to this License.  You are not responsible
-for enforcing compliance by third parties with this License.
-
-  An "entity transaction" is a transaction transferring control of an
-organization, or substantially all assets of one, or subdividing an
-organization, or merging organizations.  If propagation of a covered
-work results from an entity transaction, each party to that
-transaction who receives a copy of the work also receives whatever
-licenses to the work the party's predecessor in interest had or could
-give under the previous paragraph, plus a right to possession of the
-Corresponding Source of the work from the predecessor in interest, if
-the predecessor has it or can get it with reasonable efforts.
-
-  You may not impose any further restrictions on the exercise of the
-rights granted or affirmed under this License.  For example, you may
-not impose a license fee, royalty, or other charge for exercise of
-rights granted under this License, and you may not initiate litigation
-(including a cross-claim or counterclaim in a lawsuit) alleging that
-any patent claim is infringed by making, using, selling, offering for
-sale, or importing the Program or any portion of it.
-
-  11. Patents.
-
-  A "contributor" is a copyright holder who authorizes use under this
-License of the Program or a work on which the Program is based.  The
-work thus licensed is called the contributor's "contributor version".
-
-  A contributor's "essential patent claims" are all patent claims
-owned or controlled by the contributor, whether already acquired or
-hereafter acquired, that would be infringed by some manner, permitted
-by this License, of making, using, or selling its contributor version,
-but do not include claims that would be infringed only as a
-consequence of further modification of the contributor version.  For
-purposes of this definition, "control" includes the right to grant
-patent sublicenses in a manner consistent with the requirements of
-this License.
-
-  Each contributor grants you a non-exclusive, worldwide, royalty-free
-patent license under the contributor's essential patent claims, to
-make, use, sell, offer for sale, import and otherwise run, modify and
-propagate the contents of its contributor version.
-
-  In the following three paragraphs, a "patent license" is any express
-agreement or commitment, however denominated, not to enforce a patent
-(such as an express permission to practice a patent or covenant not to
-sue for patent infringement).  To "grant" such a patent license to a
-party means to make such an agreement or commitment not to enforce a
-patent against the party.
-
-  If you convey a covered work, knowingly relying on a patent license,
-and the Corresponding Source of the work is not available for anyone
-to copy, free of charge and under the terms of this License, through a
-publicly available network server or other readily accessible means,
-then you must either (1) cause the Corresponding Source to be so
-available, or (2) arrange to deprive yourself of the benefit of the
-patent license for this particular work, or (3) arrange, in a manner
-consistent with the requirements of this License, to extend the patent
-license to downstream recipients.  "Knowingly relying" means you have
-actual knowledge that, but for the patent license, your conveying the
-covered work in a country, or your recipient's use of the covered work
-in a country, would infringe one or more identifiable patents in that
-country that you have reason to believe are valid.
-
-  If, pursuant to or in connection with a single transaction or
-arrangement, you convey, or propagate by procuring conveyance of, a
-covered work, and grant a patent license to some of the parties
-receiving the covered work authorizing them to use, propagate, modify
-or convey a specific copy of the covered work, then the patent license
-you grant is automatically extended to all recipients of the covered
-work and works based on it.
-
-  A patent license is "discriminatory" if it does not include within
-the scope of its coverage, prohibits the exercise of, or is
-conditioned on the non-exercise of one or more of the rights that are
-specifically granted under this License.  You may not convey a covered
-work if you are a party to an arrangement with a third party that is
-in the business of distributing software, under which you make payment
-to the third party based on the extent of your activity of conveying
-the work, and under which the third party grants, to any of the
-parties who would receive the covered work from you, a discriminatory
-patent license (a) in connection with copies of the covered work
-conveyed by you (or copies made from those copies), or (b) primarily
-for and in connection with specific products or compilations that
-contain the covered work, unless you entered into that arrangement,
-or that patent license was granted, prior to 28 March 2007.
-
-  Nothing in this License shall be construed as excluding or limiting
-any implied license or other defenses to infringement that may
-otherwise be available to you under applicable patent law.
-
-  12. No Surrender of Others' Freedom.
-
-  If conditions are imposed on you (whether by court order, agreement or
-otherwise) that contradict the conditions of this License, they do not
-excuse you from the conditions of this License.  If you cannot convey a
-covered work so as to satisfy simultaneously your obligations under this
-License and any other pertinent obligations, then as a consequence you may
-not convey it at all.  For example, if you agree to terms that obligate you
-to collect a royalty for further conveying from those to whom you convey
-the Program, the only way you could satisfy both those terms and this
-License would be to refrain entirely from conveying the Program.
-
-  13. Remote Network Interaction; Use with the GNU General Public License.
-
-  Notwithstanding any other provision of this License, if you modify the
-Program, your modified version must prominently offer all users
-interacting with it remotely through a computer network (if your version
-supports such interaction) an opportunity to receive the Corresponding
-Source of your version by providing access to the Corresponding Source
-from a network server at no charge, through some standard or customary
-means of facilitating copying of software.  This Corresponding Source
-shall include the Corresponding Source for any work covered by version 3
-of the GNU General Public License that is incorporated pursuant to the
-following paragraph.
-
-  Notwithstanding any other provision of this License, you have
-permission to link or combine any covered work with a work licensed
-under version 3 of the GNU General Public License into a single
-combined work, and to convey the resulting work.  The terms of this
-License will continue to apply to the part which is the covered work,
-but the work with which it is combined will remain governed by version
-3 of the GNU General Public License.
-
-  14. Revised Versions of this License.
-
-  The Free Software Foundation may publish revised and/or new versions of
-the GNU Affero General Public License from time to time.  Such new versions
-will be similar in spirit to the present version, but may differ in detail to
-address new problems or concerns.
-
-  Each version is given a distinguishing version number.  If the
-Program specifies that a certain numbered version of the GNU Affero General
-Public License "or any later version" applies to it, you have the
-option of following the terms and conditions either of that numbered
-version or of any later version published by the Free Software
-Foundation.  If the Program does not specify a version number of the
-GNU Affero General Public License, you may choose any version ever published
-by the Free Software Foundation.
-
-  If the Program specifies that a proxy can decide which future
-versions of the GNU Affero General Public License can be used, that proxy's
-public statement of acceptance of a version permanently authorizes you
-to choose that version for the Program.
-
-  Later license versions may give you additional or different
-permissions.  However, no additional obligations are imposed on any
-author or copyright holder as a result of your choosing to follow a
-later version.
-
-  15. Disclaimer of Warranty.
-
-  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
-APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
-HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
-OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
-THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
-IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
-ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
-
-  16. Limitation of Liability.
-
-  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
-THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
-GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
-USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
-DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
-PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
-EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
-SUCH DAMAGES.
-
-  17. Interpretation of Sections 15 and 16.
-
-  If the disclaimer of warranty and limitation of liability provided
-above cannot be given local legal effect according to their terms,
-reviewing courts shall apply local law that most closely approximates
-an absolute waiver of all civil liability in connection with the
-Program, unless a warranty or assumption of liability accompanies a
-copy of the Program in return for a fee.
-
-                     END OF TERMS AND CONDITIONS
-
-            How to Apply These Terms to Your New Programs
-
-  If you develop a new program, and you want it to be of the greatest
-possible use to the public, the best way to achieve this is to make it
-free software which everyone can redistribute and change under these terms.
-
-  To do so, attach the following notices to the program.  It is safest
-to attach them to the start of each source file to most effectively
-state the exclusion of warranty; and each file should have at least
-the "copyright" line and a pointer to where the full notice is found.
-
-    <one line to give the program's name and a brief idea of what it does.>
-    Copyright (C) <year>  <name of author>
-
-    This program is free software: you can redistribute it and/or modify
-    it under the terms of the GNU Affero General Public License as published by
-    the Free Software Foundation, either version 3 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU Affero General Public License for more details.
-
-    You should have received a copy of the GNU Affero General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.
-
-Also add information on how to contact you by electronic and paper mail.
-
-  If your software can interact with users remotely through a computer
-network, you should also make sure that it provides a way for users to
-get its source.  For example, if your program is a web application, its
-interface could display a "Source" link that leads users to an archive
-of the code.  There are many ways you could offer source, and different
-solutions will be better for different programs; see section 13 for the
-specific requirements.
-
-  You should also get your employer (if you work as a programmer) or school,
-if any, to sign a "copyright disclaimer" for the program, if necessary.
-For more information on this, and how to apply and follow the GNU AGPL, see
-<http://www.gnu.org/licenses/>.
diff --git a/meta/files/common-licenses/AGPL-3.0-only b/meta/files/common-licenses/AGPL-3.0-only
new file mode 100644
index 0000000000..fe0ef42ff4
--- /dev/null
+++ b/meta/files/common-licenses/AGPL-3.0-only
@@ -0,0 +1,613 @@
+GNU AFFERO GENERAL PUBLIC LICENSE
+
+Version 3, 19 November 2007
+
+Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+Preamble
+
+The GNU Affero General Public License is a free, copyleft license for software
+and other kinds of works, specifically designed to ensure cooperation with
+the community in the case of network server software.
+
+The licenses for most software and other practical works are designed to take
+away your freedom to share and change the works. By contrast, our General
+Public Licenses are intended to guarantee your freedom to share and change
+all versions of a program--to make sure it remains free software for all its
+users.
+
+When we speak of free software, we are referring to freedom, not price. Our
+General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for them if you wish), that
+you receive source code or can get it if you want it, that you can change
+the software or use pieces of it in new free programs, and that you know you
+can do these things.
+
+Developers that use our General Public Licenses protect your rights with two
+steps: (1) assert copyright on the software, and (2) offer you this License
+which gives you legal permission to copy, distribute and/or modify the software.
+
+A secondary benefit of defending all users' freedom is that improvements made
+in alternate versions of the program, if they receive widespread use, become
+available for other developers to incorporate. Many developers of free software
+are heartened and encouraged by the resulting cooperation. However, in the
+case of software used on network servers, this result may fail to come about.
+The GNU General Public License permits making a modified version and letting
+the public access it on a server without ever releasing its source code to
+the public.
+
+The GNU Affero General Public License is designed specifically to ensure that,
+in such cases, the modified source code becomes available to the community.
+It requires the operator of a network server to provide the source code of
+the modified version running there to the users of that server. Therefore,
+public use of a modified version, on a publicly accessible server, gives the
+public access to the source code of the modified version.
+
+An older license, called the Affero General Public License and published by
+Affero, was designed to accomplish similar goals. This is a different license,
+not a version of the Affero GPL, but Affero has released a new version of
+the Affero GPL which permits relicensing under this license.
+
+The precise terms and conditions for copying, distribution and modification
+follow.
+
+TERMS AND CONDITIONS
+
+   0. Definitions.
+
+   "This License" refers to version 3 of the GNU Affero General Public License.
+
+"Copyright" also means copyright-like laws that apply to other kinds of works,
+such as semiconductor masks.
+
+"The Program" refers to any copyrightable work licensed under this License.
+Each licensee is addressed as "you". "Licensees" and "recipients" may be individuals
+or organizations.
+
+To "modify" a work means to copy from or adapt all or part of the work in
+a fashion requiring copyright permission, other than the making of an exact
+copy. The resulting work is called a "modified version" of the earlier work
+or a work "based on" the earlier work.
+
+A "covered work" means either the unmodified Program or a work based on the
+Program.
+
+To "propagate" a work means to do anything with it that, without permission,
+would make you directly or secondarily liable for infringement under applicable
+copyright law, except executing it on a computer or modifying a private copy.
+Propagation includes copying, distribution (with or without modification),
+making available to the public, and in some countries other activities as
+well.
+
+To "convey" a work means any kind of propagation that enables other parties
+to make or receive copies. Mere interaction with a user through a computer
+network, with no transfer of a copy, is not conveying.
+
+An interactive user interface displays "Appropriate Legal Notices" to the
+extent that it includes a convenient and prominently visible feature that
+(1) displays an appropriate copyright notice, and (2) tells the user that
+there is no warranty for the work (except to the extent that warranties are
+provided), that licensees may convey the work under this License, and how
+to view a copy of this License. If the interface presents a list of user commands
+or options, such as a menu, a prominent item in the list meets this criterion.
+
+   1. Source Code.
+
+The "source code" for a work means the preferred form of the work for making
+modifications to it. "Object code" means any non-source form of a work.
+
+A "Standard Interface" means an interface that either is an official standard
+defined by a recognized standards body, or, in the case of interfaces specified
+for a particular programming language, one that is widely used among developers
+working in that language.
+
+The "System Libraries" of an executable work include anything, other than
+the work as a whole, that (a) is included in the normal form of packaging
+a Major Component, but which is not part of that Major Component, and (b)
+serves only to enable use of the work with that Major Component, or to implement
+a Standard Interface for which an implementation is available to the public
+in source code form. A "Major Component", in this context, means a major essential
+component (kernel, window system, and so on) of the specific operating system
+(if any) on which the executable work runs, or a compiler used to produce
+the work, or an object code interpreter used to run it.
+
+The "Corresponding Source" for a work in object code form means all the source
+code needed to generate, install, and (for an executable work) run the object
+code and to modify the work, including scripts to control those activities.
+However, it does not include the work's System Libraries, or general-purpose
+tools or generally available free programs which are used unmodified in performing
+those activities but which are not part of the work. For example, Corresponding
+Source includes interface definition files associated with source files for
+the work, and the source code for shared libraries and dynamically linked
+subprograms that the work is specifically designed to require, such as by
+intimate data communication or control flow between those
+
+   subprograms and other parts of the work.
+
+The Corresponding Source need not include anything that users can regenerate
+automatically from other parts of the Corresponding Source.
+
+   The Corresponding Source for a work in source code form is that same work.
+
+   2. Basic Permissions.
+
+All rights granted under this License are granted for the term of copyright
+on the Program, and are irrevocable provided the stated conditions are met.
+This License explicitly affirms your unlimited permission to run the unmodified
+Program. The output from running a covered work is covered by this License
+only if the output, given its content, constitutes a covered work. This License
+acknowledges your rights of fair use or other equivalent, as provided by copyright
+law.
+
+You may make, run and propagate covered works that you do not convey, without
+conditions so long as your license otherwise remains in force. You may convey
+covered works to others for the sole purpose of having them make modifications
+exclusively for you, or provide you with facilities for running those works,
+provided that you comply with the terms of this License in conveying all material
+for which you do not control copyright. Those thus making or running the covered
+works for you must do so exclusively on your behalf, under your direction
+and control, on terms that prohibit them from making any copies of your copyrighted
+material outside their relationship with you.
+
+Conveying under any other circumstances is permitted solely under the conditions
+stated below. Sublicensing is not allowed; section 10 makes it unnecessary.
+
+   3. Protecting Users' Legal Rights From Anti-Circumvention Law.
+
+No covered work shall be deemed part of an effective technological measure
+under any applicable law fulfilling obligations under article 11 of the WIPO
+copyright treaty adopted on 20 December 1996, or similar laws prohibiting
+or restricting circumvention of such measures.
+
+When you convey a covered work, you waive any legal power to forbid circumvention
+of technological measures to the extent such circumvention is effected by
+exercising rights under this License with respect to the covered work, and
+you disclaim any intention to limit operation or modification of the work
+as a means of enforcing, against the work's users, your or third parties'
+legal rights to forbid circumvention of technological measures.
+
+   4. Conveying Verbatim Copies.
+
+You may convey verbatim copies of the Program's source code as you receive
+it, in any medium, provided that you conspicuously and appropriately publish
+on each copy an appropriate copyright notice; keep intact all notices stating
+that this License and any non-permissive terms added in accord with section
+7 apply to the code; keep intact all notices of the absence of any warranty;
+and give all recipients a copy of this License along with the Program.
+
+You may charge any price or no price for each copy that you convey, and you
+may offer support or warranty protection for a fee.
+
+   5. Conveying Modified Source Versions.
+
+You may convey a work based on the Program, or the modifications to produce
+it from the Program, in the form of source code under the terms of section
+4, provided that you also meet all of these conditions:
+
+a) The work must carry prominent notices stating that you modified it, and
+giving a relevant date.
+
+b) The work must carry prominent notices stating that it is released under
+this License and any conditions added under section 7. This requirement modifies
+the requirement in section 4 to "keep intact all notices".
+
+c) You must license the entire work, as a whole, under this License to anyone
+who comes into possession of a copy. This License will therefore apply, along
+with any applicable section 7 additional terms, to the whole of the work,
+and all its parts, regardless of how they are packaged. This License gives
+no permission to license the work in any other way, but it does not invalidate
+such permission if you have separately received it.
+
+d) If the work has interactive user interfaces, each must display Appropriate
+Legal Notices; however, if the Program has interactive interfaces that do
+not display Appropriate Legal Notices, your work need not make them do so.
+
+A compilation of a covered work with other separate and independent works,
+which are not by their nature extensions of the covered work, and which are
+not combined with it such as to form a larger program, in or on a volume of
+a storage or distribution medium, is called an "aggregate" if the compilation
+and its resulting copyright are not used to limit the access or legal rights
+of the compilation's users beyond what the individual works permit. Inclusion
+of a covered work in an aggregate does not cause this License to apply to
+the other parts of the aggregate.
+
+   6. Conveying Non-Source Forms.
+
+You may convey a covered work in object code form under the terms of sections
+4 and 5, provided that you also convey the machine-readable Corresponding
+Source under the terms of this License, in one of these ways:
+
+a) Convey the object code in, or embodied in, a physical product (including
+a physical distribution medium), accompanied by the Corresponding Source fixed
+on a durable physical medium customarily used for software interchange.
+
+b) Convey the object code in, or embodied in, a physical product (including
+a physical distribution medium), accompanied by a written offer, valid for
+at least three years and valid for as long as you offer spare parts or customer
+support for that product model, to give anyone who possesses the object code
+either (1) a copy of the Corresponding Source for all the software in the
+product that is covered by this License, on a durable physical medium customarily
+used for software interchange, for a price no more than your reasonable cost
+of physically performing this conveying of source, or (2) access to copy the
+Corresponding Source from a network server at no charge.
+
+c) Convey individual copies of the object code with a copy of the written
+offer to provide the Corresponding Source. This alternative is allowed only
+occasionally and noncommercially, and only if you received the object code
+with such an offer, in accord with subsection 6b.
+
+d) Convey the object code by offering access from a designated place (gratis
+or for a charge), and offer equivalent access to the Corresponding Source
+in the same way through the same place at no further charge. You need not
+require recipients to copy the Corresponding Source along with the object
+code. If the place to copy the object code is a network server, the Corresponding
+Source may be on a different server (operated by you or a third party) that
+supports equivalent copying facilities, provided you maintain clear directions
+next to the object code saying where to find the Corresponding Source. Regardless
+of what server hosts the Corresponding Source, you remain obligated to ensure
+that it is available for as long as needed to satisfy these requirements.
+
+e) Convey the object code using peer-to-peer transmission, provided you inform
+other peers where the object code and Corresponding Source of the work are
+being offered to the general public at no charge under subsection 6d.
+
+A separable portion of the object code, whose source code is excluded from
+the Corresponding Source as a System Library, need not be included in conveying
+the object code work.
+
+A "User Product" is either (1) a "consumer product", which means any tangible
+personal property which is normally used for personal, family, or household
+purposes, or (2) anything designed or sold for incorporation into a dwelling.
+In determining whether a product is a consumer product, doubtful cases shall
+be resolved in favor of coverage. For a particular product received by a particular
+user, "normally used" refers to a typical or common use of that class of product,
+regardless of the status of the particular user or of the way in which the
+particular user actually uses, or expects or is expected to use, the product.
+A product is a consumer product regardless of whether the product has substantial
+commercial, industrial or non-consumer uses, unless such uses represent the
+only significant mode of use of the product.
+
+"Installation Information" for a User Product means any methods, procedures,
+authorization keys, or other information required to install and execute modified
+versions of a covered work in that User Product from a modified version of
+its Corresponding Source. The information must suffice to ensure that the
+continued functioning of the modified object code is in no case prevented
+or interfered with solely because modification has been made.
+
+If you convey an object code work under this section in, or with, or specifically
+for use in, a User Product, and the conveying occurs as part of a transaction
+in which the right of possession and use of the User Product is transferred
+to the recipient in perpetuity or for a fixed term (regardless of how the
+transaction is characterized), the Corresponding Source conveyed under this
+section must be accompanied by the Installation Information. But this requirement
+does not apply if neither you nor any third party retains the ability to install
+modified object code on the User Product (for example, the work has been installed
+in ROM).
+
+The requirement to provide Installation Information does not include a requirement
+to continue to provide support service, warranty, or updates for a work that
+has been modified or installed by the recipient, or for the User Product in
+which it has been modified or installed. Access to a network may be denied
+when the modification itself materially and adversely affects the operation
+of the network or violates the rules and protocols for communication across
+the network.
+
+Corresponding Source conveyed, and Installation Information provided, in accord
+with this section must be in a format that is publicly documented (and with
+an implementation available to the public in source code form), and must require
+no special password or key for unpacking, reading or copying.
+
+   7. Additional Terms.
+
+"Additional permissions" are terms that supplement the terms of this License
+by making exceptions from one or more of its conditions. Additional permissions
+that are applicable to the entire Program shall be treated as though they
+were included in this License, to the extent that they are valid under applicable
+law. If additional permissions apply only to part of the Program, that part
+may be used separately under those permissions, but the entire Program remains
+governed by this License without regard to the additional permissions.
+
+When you convey a copy of a covered work, you may at your option remove any
+additional permissions from that copy, or from any part of it. (Additional
+permissions may be written to require their own removal in certain cases when
+you modify the work.) You may place additional permissions on material, added
+by you to a covered work, for which you have or can give appropriate copyright
+permission.
+
+Notwithstanding any other provision of this License, for material you add
+to a covered work, you may (if authorized by the copyright holders of that
+material) supplement the terms of this License with terms:
+
+a) Disclaiming warranty or limiting liability differently from the terms of
+sections 15 and 16 of this License; or
+
+b) Requiring preservation of specified reasonable legal notices or author
+attributions in that material or in the Appropriate Legal Notices displayed
+by works containing it; or
+
+c) Prohibiting misrepresentation of the origin of that material, or requiring
+that modified versions of such material be marked in reasonable ways as different
+from the original version; or
+
+d) Limiting the use for publicity purposes of names of licensors or authors
+of the material; or
+
+e) Declining to grant rights under trademark law for use of some trade names,
+trademarks, or service marks; or
+
+f) Requiring indemnification of licensors and authors of that material by
+anyone who conveys the material (or modified versions of it) with contractual
+assumptions of liability to the recipient, for any liability that these contractual
+assumptions directly impose on those licensors and authors.
+
+All other non-permissive additional terms are considered "further restrictions"
+within the meaning of section 10. If the Program as you received it, or any
+part of it, contains a notice stating that it is governed by this License
+along with a term that is a further restriction, you may remove that term.
+If a license document contains a further restriction but permits relicensing
+or conveying under this License, you may add to a covered work material governed
+by the terms of that license document, provided that the further restriction
+does not survive such relicensing or conveying.
+
+If you add terms to a covered work in accord with this section, you must place,
+in the relevant source files, a statement of the additional terms that apply
+to those files, or a notice indicating where to find the applicable terms.
+
+Additional terms, permissive or non-permissive, may be stated in the form
+of a separately written license, or stated as exceptions; the above requirements
+apply either way.
+
+   8. Termination.
+
+You may not propagate or modify a covered work except as expressly provided
+under this License. Any attempt otherwise to propagate or modify it is void,
+and will automatically terminate your rights under this License (including
+any patent licenses granted under the third paragraph of section 11).
+
+However, if you cease all violation of this License, then your license from
+a particular copyright holder is reinstated (a) provisionally, unless and
+until the copyright holder explicitly and finally terminates your license,
+and (b) permanently, if the copyright holder fails to notify you of the violation
+by some reasonable means prior to 60 days after the cessation.
+
+Moreover, your license from a particular copyright holder is reinstated permanently
+if the copyright holder notifies you of the violation by some reasonable means,
+this is the first time you have received notice of violation of this License
+(for any work) from that copyright holder, and you cure the violation prior
+to 30 days after your receipt of the notice.
+
+Termination of your rights under this section does not terminate the licenses
+of parties who have received copies or rights from you under this License.
+If your rights have been terminated and not permanently reinstated, you do
+not qualify to receive new licenses for the same material under section 10.
+
+   9. Acceptance Not Required for Having Copies.
+
+You are not required to accept this License in order to receive or run a copy
+of the Program. Ancillary propagation of a covered work occurring solely as
+a consequence of using peer-to-peer transmission to receive a copy likewise
+does not require acceptance. However, nothing other than this License grants
+you permission to propagate or modify any covered work. These actions infringe
+copyright if you do not accept this License. Therefore, by modifying or propagating
+a covered work, you indicate your acceptance of this License to do so.
+
+   10. Automatic Licensing of Downstream Recipients.
+
+Each time you convey a covered work, the recipient automatically receives
+a license from the original licensors, to run, modify and propagate that work,
+subject to this License. You are not responsible for enforcing compliance
+by third parties with this License.
+
+An "entity transaction" is a transaction transferring control of an organization,
+or substantially all assets of one, or subdividing an organization, or merging
+organizations. If propagation of a covered work results from an entity transaction,
+each party to that transaction who receives a copy of the work also receives
+whatever licenses to the work the party's predecessor in interest had or could
+give under the previous paragraph, plus a right to possession of the Corresponding
+Source of the work from the predecessor in interest, if the predecessor has
+it or can get it with reasonable efforts.
+
+You may not impose any further restrictions on the exercise of the rights
+granted or affirmed under this License. For example, you may not impose a
+license fee, royalty, or other charge for exercise of rights granted under
+this License, and you may not initiate litigation (including a cross-claim
+or counterclaim in a lawsuit) alleging that any patent claim is infringed
+by making, using, selling, offering for sale, or importing the Program or
+any portion of it.
+
+   11. Patents.
+
+A "contributor" is a copyright holder who authorizes use under this License
+of the Program or a work on which the Program is based. The work thus licensed
+is called the contributor's "contributor version".
+
+A contributor's "essential patent claims" are all patent claims owned or controlled
+by the contributor, whether already acquired or hereafter acquired, that would
+be infringed by some manner, permitted by this License, of making, using,
+or selling its contributor version, but do not include claims that would be
+infringed only as a consequence of further modification of the contributor
+version. For purposes of this definition, "control" includes the right to
+grant patent sublicenses in a manner consistent with the requirements of this
+License.
+
+Each contributor grants you a non-exclusive, worldwide, royalty-free patent
+license under the contributor's essential patent claims, to make, use, sell,
+offer for sale, import and otherwise run, modify and propagate the contents
+of its contributor version.
+
+In the following three paragraphs, a "patent license" is any express agreement
+or commitment, however denominated, not to enforce a patent (such as an express
+permission to practice a patent or covenant not to sue for patent infringement).
+To "grant" such a patent license to a party means to make such an agreement
+or commitment not to enforce a patent against the party.
+
+If you convey a covered work, knowingly relying on a patent license, and the
+Corresponding Source of the work is not available for anyone to copy, free
+of charge and under the terms of this License, through a publicly available
+network server or other readily accessible means, then you must either (1)
+cause the Corresponding Source to be so available, or (2) arrange to deprive
+yourself of the benefit of the patent license for this particular work, or
+(3) arrange, in a manner consistent with the requirements of this License,
+to extend the patent
+
+license to downstream recipients. "Knowingly relying" means you have actual
+knowledge that, but for the patent license, your conveying the covered work
+in a country, or your recipient's use of the covered work in a country, would
+infringe one or more identifiable patents in that country that you have reason
+to believe are valid.
+
+If, pursuant to or in connection with a single transaction or arrangement,
+you convey, or propagate by procuring conveyance of, a covered work, and grant
+a patent license to some of the parties receiving the covered work authorizing
+them to use, propagate, modify or convey a specific copy of the covered work,
+then the patent license you grant is automatically extended to all recipients
+of the covered work and works based on it.
+
+A patent license is "discriminatory" if it does not include within the scope
+of its coverage, prohibits the exercise of, or is conditioned on the non-exercise
+of one or more of the rights that are specifically granted under this License.
+You may not convey a covered work if you are a party to an arrangement with
+a third party that is in the business of distributing software, under which
+you make payment to the third party based on the extent of your activity of
+conveying the work, and under which the third party grants, to any of the
+parties who would receive the covered work from you, a discriminatory patent
+license (a) in connection with copies of the covered work conveyed by you
+(or copies made from those copies), or (b) primarily for and in connection
+with specific products or compilations that contain the covered work, unless
+you entered into that arrangement, or that patent license was granted, prior
+to 28 March 2007.
+
+Nothing in this License shall be construed as excluding or limiting any implied
+license or other defenses to infringement that may otherwise be available
+to you under applicable patent law.
+
+   12. No Surrender of Others' Freedom.
+
+If conditions are imposed on you (whether by court order, agreement or otherwise)
+that contradict the conditions of this License, they do not excuse you from
+the conditions of this License. If you cannot convey a covered work so as
+to satisfy simultaneously your obligations under this License and any other
+pertinent obligations, then as a consequence you may
+
+not convey it at all. For example, if you agree to terms that obligate you
+to collect a royalty for further conveying from those to whom you convey the
+Program, the only way you could satisfy both those terms and this License
+would be to refrain entirely from conveying the Program.
+
+   13. Remote Network Interaction; Use with the GNU General Public License.
+
+Notwithstanding any other provision of this License, if you modify the Program,
+your modified version must prominently offer all users interacting with it
+remotely through a computer network (if your version supports such interaction)
+an opportunity to receive the Corresponding Source of your version by providing
+access to the Corresponding Source from a network server at no charge, through
+some standard or customary means of facilitating copying of software. This
+Corresponding Source shall include the Corresponding Source for any work covered
+by version 3 of the GNU General Public License that is incorporated pursuant
+to the following paragraph.
+
+Notwithstanding any other provision of this License, you have permission to
+link or combine any covered work with a work licensed under version 3 of the
+GNU General Public License into a single combined work, and to convey the
+resulting work. The terms of this License will continue to apply to the part
+which is the covered work, but the work with which it is combined will remain
+governed by version 3 of the GNU General Public License.
+
+   14. Revised Versions of this License.
+
+The Free Software Foundation may publish revised and/or new versions of the
+GNU Affero General Public License from time to time. Such new versions will
+be similar in spirit to the present version, but may differ in detail to address
+new problems or concerns.
+
+Each version is given a distinguishing version number. If the Program specifies
+that a certain numbered version of the GNU Affero General Public License "or
+any later version" applies to it, you have the option of following the terms
+and conditions either of that numbered version or of any later version published
+by the Free Software Foundation. If the Program does not specify a version
+number of the GNU Affero General Public License, you may choose any version
+ever published by the Free Software Foundation.
+
+If the Program specifies that a proxy can decide which future versions of
+the GNU Affero General Public License can be used, that proxy's public statement
+of acceptance of a version permanently authorizes you to choose that version
+for the Program.
+
+Later license versions may give you additional or different permissions. However,
+no additional obligations are imposed on any author or copyright holder as
+a result of your choosing to follow a later version.
+
+   15. Disclaimer of Warranty.
+
+THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE
+LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
+EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM
+PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR
+CORRECTION.
+
+   16. Limitation of Liability.
+
+IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL
+ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM
+AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL,
+INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO
+USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
+INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE
+PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER
+PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+   17. Interpretation of Sections 15 and 16.
+
+If the disclaimer of warranty and limitation of liability provided above cannot
+be given local legal effect according to their terms, reviewing courts shall
+apply local law that most closely approximates an absolute waiver of all civil
+liability in connection with the Program, unless a warranty or assumption
+of liability accompanies a copy of the Program in return for a fee. END OF
+TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Programs
+
+If you develop a new program, and you want it to be of the greatest possible
+use to the public, the best way to achieve this is to make it free software
+which everyone can redistribute and change under these terms.
+
+To do so, attach the following notices to the program. It is safest to attach
+them to the start of each source file to most effectively state the exclusion
+of warranty; and each file should have at least the "copyright" line and a
+pointer to where the full notice is found.
+
+<one line to give the program's name and a brief idea of what it does.>
+
+Copyright (C) <year> <name of author>
+
+This program is free software: you can redistribute it and/or modify it under
+the terms of the GNU Affero General Public License as published by the Free
+Software Foundation, either version 3 of the License, or (at your option)
+any later version.
+
+This program is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
+details.
+
+You should have received a copy of the GNU Affero General Public License along
+with this program. If not, see <https://www.gnu.org/licenses/>.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If your software can interact with users remotely through a computer network,
+you should also make sure that it provides a way for users to get its source.
+For example, if your program is a web application, its interface could display
+a "Source" link that leads users to an archive of the code. There are many
+ways you could offer source, and different solutions will be better for different
+programs; see section 13 for the specific requirements.
+
+You should also get your employer (if you work as a programmer) or school,
+if any, to sign a "copyright disclaimer" for the program, if necessary. For
+more information on this, and how to apply and follow the GNU AGPL, see <https://www.gnu.org/licenses/>.
diff --git a/meta/files/common-licenses/AGPL-3.0-or-later b/meta/files/common-licenses/AGPL-3.0-or-later
new file mode 100644
index 0000000000..fe0ef42ff4
--- /dev/null
+++ b/meta/files/common-licenses/AGPL-3.0-or-later
@@ -0,0 +1,613 @@
+GNU AFFERO GENERAL PUBLIC LICENSE
+
+Version 3, 19 November 2007
+
+Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+Preamble
+
+The GNU Affero General Public License is a free, copyleft license for software
+and other kinds of works, specifically designed to ensure cooperation with
+the community in the case of network server software.
+
+The licenses for most software and other practical works are designed to take
+away your freedom to share and change the works. By contrast, our General
+Public Licenses are intended to guarantee your freedom to share and change
+all versions of a program--to make sure it remains free software for all its
+users.
+
+When we speak of free software, we are referring to freedom, not price. Our
+General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for them if you wish), that
+you receive source code or can get it if you want it, that you can change
+the software or use pieces of it in new free programs, and that you know you
+can do these things.
+
+Developers that use our General Public Licenses protect your rights with two
+steps: (1) assert copyright on the software, and (2) offer you this License
+which gives you legal permission to copy, distribute and/or modify the software.
+
+A secondary benefit of defending all users' freedom is that improvements made
+in alternate versions of the program, if they receive widespread use, become
+available for other developers to incorporate. Many developers of free software
+are heartened and encouraged by the resulting cooperation. However, in the
+case of software used on network servers, this result may fail to come about.
+The GNU General Public License permits making a modified version and letting
+the public access it on a server without ever releasing its source code to
+the public.
+
+The GNU Affero General Public License is designed specifically to ensure that,
+in such cases, the modified source code becomes available to the community.
+It requires the operator of a network server to provide the source code of
+the modified version running there to the users of that server. Therefore,
+public use of a modified version, on a publicly accessible server, gives the
+public access to the source code of the modified version.
+
+An older license, called the Affero General Public License and published by
+Affero, was designed to accomplish similar goals. This is a different license,
+not a version of the Affero GPL, but Affero has released a new version of
+the Affero GPL which permits relicensing under this license.
+
+The precise terms and conditions for copying, distribution and modification
+follow.
+
+TERMS AND CONDITIONS
+
+   0. Definitions.
+
+   "This License" refers to version 3 of the GNU Affero General Public License.
+
+"Copyright" also means copyright-like laws that apply to other kinds of works,
+such as semiconductor masks.
+
+"The Program" refers to any copyrightable work licensed under this License.
+Each licensee is addressed as "you". "Licensees" and "recipients" may be individuals
+or organizations.
+
+To "modify" a work means to copy from or adapt all or part of the work in
+a fashion requiring copyright permission, other than the making of an exact
+copy. The resulting work is called a "modified version" of the earlier work
+or a work "based on" the earlier work.
+
+A "covered work" means either the unmodified Program or a work based on the
+Program.
+
+To "propagate" a work means to do anything with it that, without permission,
+would make you directly or secondarily liable for infringement under applicable
+copyright law, except executing it on a computer or modifying a private copy.
+Propagation includes copying, distribution (with or without modification),
+making available to the public, and in some countries other activities as
+well.
+
+To "convey" a work means any kind of propagation that enables other parties
+to make or receive copies. Mere interaction with a user through a computer
+network, with no transfer of a copy, is not conveying.
+
+An interactive user interface displays "Appropriate Legal Notices" to the
+extent that it includes a convenient and prominently visible feature that
+(1) displays an appropriate copyright notice, and (2) tells the user that
+there is no warranty for the work (except to the extent that warranties are
+provided), that licensees may convey the work under this License, and how
+to view a copy of this License. If the interface presents a list of user commands
+or options, such as a menu, a prominent item in the list meets this criterion.
+
+   1. Source Code.
+
+The "source code" for a work means the preferred form of the work for making
+modifications to it. "Object code" means any non-source form of a work.
+
+A "Standard Interface" means an interface that either is an official standard
+defined by a recognized standards body, or, in the case of interfaces specified
+for a particular programming language, one that is widely used among developers
+working in that language.
+
+The "System Libraries" of an executable work include anything, other than
+the work as a whole, that (a) is included in the normal form of packaging
+a Major Component, but which is not part of that Major Component, and (b)
+serves only to enable use of the work with that Major Component, or to implement
+a Standard Interface for which an implementation is available to the public
+in source code form. A "Major Component", in this context, means a major essential
+component (kernel, window system, and so on) of the specific operating system
+(if any) on which the executable work runs, or a compiler used to produce
+the work, or an object code interpreter used to run it.
+
+The "Corresponding Source" for a work in object code form means all the source
+code needed to generate, install, and (for an executable work) run the object
+code and to modify the work, including scripts to control those activities.
+However, it does not include the work's System Libraries, or general-purpose
+tools or generally available free programs which are used unmodified in performing
+those activities but which are not part of the work. For example, Corresponding
+Source includes interface definition files associated with source files for
+the work, and the source code for shared libraries and dynamically linked
+subprograms that the work is specifically designed to require, such as by
+intimate data communication or control flow between those
+
+   subprograms and other parts of the work.
+
+The Corresponding Source need not include anything that users can regenerate
+automatically from other parts of the Corresponding Source.
+
+   The Corresponding Source for a work in source code form is that same work.
+
+   2. Basic Permissions.
+
+All rights granted under this License are granted for the term of copyright
+on the Program, and are irrevocable provided the stated conditions are met.
+This License explicitly affirms your unlimited permission to run the unmodified
+Program. The output from running a covered work is covered by this License
+only if the output, given its content, constitutes a covered work. This License
+acknowledges your rights of fair use or other equivalent, as provided by copyright
+law.
+
+You may make, run and propagate covered works that you do not convey, without
+conditions so long as your license otherwise remains in force. You may convey
+covered works to others for the sole purpose of having them make modifications
+exclusively for you, or provide you with facilities for running those works,
+provided that you comply with the terms of this License in conveying all material
+for which you do not control copyright. Those thus making or running the covered
+works for you must do so exclusively on your behalf, under your direction
+and control, on terms that prohibit them from making any copies of your copyrighted
+material outside their relationship with you.
+
+Conveying under any other circumstances is permitted solely under the conditions
+stated below. Sublicensing is not allowed; section 10 makes it unnecessary.
+
+   3. Protecting Users' Legal Rights From Anti-Circumvention Law.
+
+No covered work shall be deemed part of an effective technological measure
+under any applicable law fulfilling obligations under article 11 of the WIPO
+copyright treaty adopted on 20 December 1996, or similar laws prohibiting
+or restricting circumvention of such measures.
+
+When you convey a covered work, you waive any legal power to forbid circumvention
+of technological measures to the extent such circumvention is effected by
+exercising rights under this License with respect to the covered work, and
+you disclaim any intention to limit operation or modification of the work
+as a means of enforcing, against the work's users, your or third parties'
+legal rights to forbid circumvention of technological measures.
+
+   4. Conveying Verbatim Copies.
+
+You may convey verbatim copies of the Program's source code as you receive
+it, in any medium, provided that you conspicuously and appropriately publish
+on each copy an appropriate copyright notice; keep intact all notices stating
+that this License and any non-permissive terms added in accord with section
+7 apply to the code; keep intact all notices of the absence of any warranty;
+and give all recipients a copy of this License along with the Program.
+
+You may charge any price or no price for each copy that you convey, and you
+may offer support or warranty protection for a fee.
+
+   5. Conveying Modified Source Versions.
+
+You may convey a work based on the Program, or the modifications to produce
+it from the Program, in the form of source code under the terms of section
+4, provided that you also meet all of these conditions:
+
+a) The work must carry prominent notices stating that you modified it, and
+giving a relevant date.
+
+b) The work must carry prominent notices stating that it is released under
+this License and any conditions added under section 7. This requirement modifies
+the requirement in section 4 to "keep intact all notices".
+
+c) You must license the entire work, as a whole, under this License to anyone
+who comes into possession of a copy. This License will therefore apply, along
+with any applicable section 7 additional terms, to the whole of the work,
+and all its parts, regardless of how they are packaged. This License gives
+no permission to license the work in any other way, but it does not invalidate
+such permission if you have separately received it.
+
+d) If the work has interactive user interfaces, each must display Appropriate
+Legal Notices; however, if the Program has interactive interfaces that do
+not display Appropriate Legal Notices, your work need not make them do so.
+
+A compilation of a covered work with other separate and independent works,
+which are not by their nature extensions of the covered work, and which are
+not combined with it such as to form a larger program, in or on a volume of
+a storage or distribution medium, is called an "aggregate" if the compilation
+and its resulting copyright are not used to limit the access or legal rights
+of the compilation's users beyond what the individual works permit. Inclusion
+of a covered work in an aggregate does not cause this License to apply to
+the other parts of the aggregate.
+
+   6. Conveying Non-Source Forms.
+
+You may convey a covered work in object code form under the terms of sections
+4 and 5, provided that you also convey the machine-readable Corresponding
+Source under the terms of this License, in one of these ways:
+
+a) Convey the object code in, or embodied in, a physical product (including
+a physical distribution medium), accompanied by the Corresponding Source fixed
+on a durable physical medium customarily used for software interchange.
+
+b) Convey the object code in, or embodied in, a physical product (including
+a physical distribution medium), accompanied by a written offer, valid for
+at least three years and valid for as long as you offer spare parts or customer
+support for that product model, to give anyone who possesses the object code
+either (1) a copy of the Corresponding Source for all the software in the
+product that is covered by this License, on a durable physical medium customarily
+used for software interchange, for a price no more than your reasonable cost
+of physically performing this conveying of source, or (2) access to copy the
+Corresponding Source from a network server at no charge.
+
+c) Convey individual copies of the object code with a copy of the written
+offer to provide the Corresponding Source. This alternative is allowed only
+occasionally and noncommercially, and only if you received the object code
+with such an offer, in accord with subsection 6b.
+
+d) Convey the object code by offering access from a designated place (gratis
+or for a charge), and offer equivalent access to the Corresponding Source
+in the same way through the same place at no further charge. You need not
+require recipients to copy the Corresponding Source along with the object
+code. If the place to copy the object code is a network server, the Corresponding
+Source may be on a different server (operated by you or a third party) that
+supports equivalent copying facilities, provided you maintain clear directions
+next to the object code saying where to find the Corresponding Source. Regardless
+of what server hosts the Corresponding Source, you remain obligated to ensure
+that it is available for as long as needed to satisfy these requirements.
+
+e) Convey the object code using peer-to-peer transmission, provided you inform
+other peers where the object code and Corresponding Source of the work are
+being offered to the general public at no charge under subsection 6d.
+
+A separable portion of the object code, whose source code is excluded from
+the Corresponding Source as a System Library, need not be included in conveying
+the object code work.
+
+A "User Product" is either (1) a "consumer product", which means any tangible
+personal property which is normally used for personal, family, or household
+purposes, or (2) anything designed or sold for incorporation into a dwelling.
+In determining whether a product is a consumer product, doubtful cases shall
+be resolved in favor of coverage. For a particular product received by a particular
+user, "normally used" refers to a typical or common use of that class of product,
+regardless of the status of the particular user or of the way in which the
+particular user actually uses, or expects or is expected to use, the product.
+A product is a consumer product regardless of whether the product has substantial
+commercial, industrial or non-consumer uses, unless such uses represent the
+only significant mode of use of the product.
+
+"Installation Information" for a User Product means any methods, procedures,
+authorization keys, or other information required to install and execute modified
+versions of a covered work in that User Product from a modified version of
+its Corresponding Source. The information must suffice to ensure that the
+continued functioning of the modified object code is in no case prevented
+or interfered with solely because modification has been made.
+
+If you convey an object code work under this section in, or with, or specifically
+for use in, a User Product, and the conveying occurs as part of a transaction
+in which the right of possession and use of the User Product is transferred
+to the recipient in perpetuity or for a fixed term (regardless of how the
+transaction is characterized), the Corresponding Source conveyed under this
+section must be accompanied by the Installation Information. But this requirement
+does not apply if neither you nor any third party retains the ability to install
+modified object code on the User Product (for example, the work has been installed
+in ROM).
+
+The requirement to provide Installation Information does not include a requirement
+to continue to provide support service, warranty, or updates for a work that
+has been modified or installed by the recipient, or for the User Product in
+which it has been modified or installed. Access to a network may be denied
+when the modification itself materially and adversely affects the operation
+of the network or violates the rules and protocols for communication across
+the network.
+
+Corresponding Source conveyed, and Installation Information provided, in accord
+with this section must be in a format that is publicly documented (and with
+an implementation available to the public in source code form), and must require
+no special password or key for unpacking, reading or copying.
+
+   7. Additional Terms.
+
+"Additional permissions" are terms that supplement the terms of this License
+by making exceptions from one or more of its conditions. Additional permissions
+that are applicable to the entire Program shall be treated as though they
+were included in this License, to the extent that they are valid under applicable
+law. If additional permissions apply only to part of the Program, that part
+may be used separately under those permissions, but the entire Program remains
+governed by this License without regard to the additional permissions.
+
+When you convey a copy of a covered work, you may at your option remove any
+additional permissions from that copy, or from any part of it. (Additional
+permissions may be written to require their own removal in certain cases when
+you modify the work.) You may place additional permissions on material, added
+by you to a covered work, for which you have or can give appropriate copyright
+permission.
+
+Notwithstanding any other provision of this License, for material you add
+to a covered work, you may (if authorized by the copyright holders of that
+material) supplement the terms of this License with terms:
+
+a) Disclaiming warranty or limiting liability differently from the terms of
+sections 15 and 16 of this License; or
+
+b) Requiring preservation of specified reasonable legal notices or author
+attributions in that material or in the Appropriate Legal Notices displayed
+by works containing it; or
+
+c) Prohibiting misrepresentation of the origin of that material, or requiring
+that modified versions of such material be marked in reasonable ways as different
+from the original version; or
+
+d) Limiting the use for publicity purposes of names of licensors or authors
+of the material; or
+
+e) Declining to grant rights under trademark law for use of some trade names,
+trademarks, or service marks; or
+
+f) Requiring indemnification of licensors and authors of that material by
+anyone who conveys the material (or modified versions of it) with contractual
+assumptions of liability to the recipient, for any liability that these contractual
+assumptions directly impose on those licensors and authors.
+
+All other non-permissive additional terms are considered "further restrictions"
+within the meaning of section 10. If the Program as you received it, or any
+part of it, contains a notice stating that it is governed by this License
+along with a term that is a further restriction, you may remove that term.
+If a license document contains a further restriction but permits relicensing
+or conveying under this License, you may add to a covered work material governed
+by the terms of that license document, provided that the further restriction
+does not survive such relicensing or conveying.
+
+If you add terms to a covered work in accord with this section, you must place,
+in the relevant source files, a statement of the additional terms that apply
+to those files, or a notice indicating where to find the applicable terms.
+
+Additional terms, permissive or non-permissive, may be stated in the form
+of a separately written license, or stated as exceptions; the above requirements
+apply either way.
+
+   8. Termination.
+
+You may not propagate or modify a covered work except as expressly provided
+under this License. Any attempt otherwise to propagate or modify it is void,
+and will automatically terminate your rights under this License (including
+any patent licenses granted under the third paragraph of section 11).
+
+However, if you cease all violation of this License, then your license from
+a particular copyright holder is reinstated (a) provisionally, unless and
+until the copyright holder explicitly and finally terminates your license,
+and (b) permanently, if the copyright holder fails to notify you of the violation
+by some reasonable means prior to 60 days after the cessation.
+
+Moreover, your license from a particular copyright holder is reinstated permanently
+if the copyright holder notifies you of the violation by some reasonable means,
+this is the first time you have received notice of violation of this License
+(for any work) from that copyright holder, and you cure the violation prior
+to 30 days after your receipt of the notice.
+
+Termination of your rights under this section does not terminate the licenses
+of parties who have received copies or rights from you under this License.
+If your rights have been terminated and not permanently reinstated, you do
+not qualify to receive new licenses for the same material under section 10.
+
+   9. Acceptance Not Required for Having Copies.
+
+You are not required to accept this License in order to receive or run a copy
+of the Program. Ancillary propagation of a covered work occurring solely as
+a consequence of using peer-to-peer transmission to receive a copy likewise
+does not require acceptance. However, nothing other than this License grants
+you permission to propagate or modify any covered work. These actions infringe
+copyright if you do not accept this License. Therefore, by modifying or propagating
+a covered work, you indicate your acceptance of this License to do so.
+
+   10. Automatic Licensing of Downstream Recipients.
+
+Each time you convey a covered work, the recipient automatically receives
+a license from the original licensors, to run, modify and propagate that work,
+subject to this License. You are not responsible for enforcing compliance
+by third parties with this License.
+
+An "entity transaction" is a transaction transferring control of an organization,
+or substantially all assets of one, or subdividing an organization, or merging
+organizations. If propagation of a covered work results from an entity transaction,
+each party to that transaction who receives a copy of the work also receives
+whatever licenses to the work the party's predecessor in interest had or could
+give under the previous paragraph, plus a right to possession of the Corresponding
+Source of the work from the predecessor in interest, if the predecessor has
+it or can get it with reasonable efforts.
+
+You may not impose any further restrictions on the exercise of the rights
+granted or affirmed under this License. For example, you may not impose a
+license fee, royalty, or other charge for exercise of rights granted under
+this License, and you may not initiate litigation (including a cross-claim
+or counterclaim in a lawsuit) alleging that any patent claim is infringed
+by making, using, selling, offering for sale, or importing the Program or
+any portion of it.
+
+   11. Patents.
+
+A "contributor" is a copyright holder who authorizes use under this License
+of the Program or a work on which the Program is based. The work thus licensed
+is called the contributor's "contributor version".
+
+A contributor's "essential patent claims" are all patent claims owned or controlled
+by the contributor, whether already acquired or hereafter acquired, that would
+be infringed by some manner, permitted by this License, of making, using,
+or selling its contributor version, but do not include claims that would be
+infringed only as a consequence of further modification of the contributor
+version. For purposes of this definition, "control" includes the right to
+grant patent sublicenses in a manner consistent with the requirements of this
+License.
+
+Each contributor grants you a non-exclusive, worldwide, royalty-free patent
+license under the contributor's essential patent claims, to make, use, sell,
+offer for sale, import and otherwise run, modify and propagate the contents
+of its contributor version.
+
+In the following three paragraphs, a "patent license" is any express agreement
+or commitment, however denominated, not to enforce a patent (such as an express
+permission to practice a patent or covenant not to sue for patent infringement).
+To "grant" such a patent license to a party means to make such an agreement
+or commitment not to enforce a patent against the party.
+
+If you convey a covered work, knowingly relying on a patent license, and the
+Corresponding Source of the work is not available for anyone to copy, free
+of charge and under the terms of this License, through a publicly available
+network server or other readily accessible means, then you must either (1)
+cause the Corresponding Source to be so available, or (2) arrange to deprive
+yourself of the benefit of the patent license for this particular work, or
+(3) arrange, in a manner consistent with the requirements of this License,
+to extend the patent
+
+license to downstream recipients. "Knowingly relying" means you have actual
+knowledge that, but for the patent license, your conveying the covered work
+in a country, or your recipient's use of the covered work in a country, would
+infringe one or more identifiable patents in that country that you have reason
+to believe are valid.
+
+If, pursuant to or in connection with a single transaction or arrangement,
+you convey, or propagate by procuring conveyance of, a covered work, and grant
+a patent license to some of the parties receiving the covered work authorizing
+them to use, propagate, modify or convey a specific copy of the covered work,
+then the patent license you grant is automatically extended to all recipients
+of the covered work and works based on it.
+
+A patent license is "discriminatory" if it does not include within the scope
+of its coverage, prohibits the exercise of, or is conditioned on the non-exercise
+of one or more of the rights that are specifically granted under this License.
+You may not convey a covered work if you are a party to an arrangement with
+a third party that is in the business of distributing software, under which
+you make payment to the third party based on the extent of your activity of
+conveying the work, and under which the third party grants, to any of the
+parties who would receive the covered work from you, a discriminatory patent
+license (a) in connection with copies of the covered work conveyed by you
+(or copies made from those copies), or (b) primarily for and in connection
+with specific products or compilations that contain the covered work, unless
+you entered into that arrangement, or that patent license was granted, prior
+to 28 March 2007.
+
+Nothing in this License shall be construed as excluding or limiting any implied
+license or other defenses to infringement that may otherwise be available
+to you under applicable patent law.
+
+   12. No Surrender of Others' Freedom.
+
+If conditions are imposed on you (whether by court order, agreement or otherwise)
+that contradict the conditions of this License, they do not excuse you from
+the conditions of this License. If you cannot convey a covered work so as
+to satisfy simultaneously your obligations under this License and any other
+pertinent obligations, then as a consequence you may
+
+not convey it at all. For example, if you agree to terms that obligate you
+to collect a royalty for further conveying from those to whom you convey the
+Program, the only way you could satisfy both those terms and this License
+would be to refrain entirely from conveying the Program.
+
+   13. Remote Network Interaction; Use with the GNU General Public License.
+
+Notwithstanding any other provision of this License, if you modify the Program,
+your modified version must prominently offer all users interacting with it
+remotely through a computer network (if your version supports such interaction)
+an opportunity to receive the Corresponding Source of your version by providing
+access to the Corresponding Source from a network server at no charge, through
+some standard or customary means of facilitating copying of software. This
+Corresponding Source shall include the Corresponding Source for any work covered
+by version 3 of the GNU General Public License that is incorporated pursuant
+to the following paragraph.
+
+Notwithstanding any other provision of this License, you have permission to
+link or combine any covered work with a work licensed under version 3 of the
+GNU General Public License into a single combined work, and to convey the
+resulting work. The terms of this License will continue to apply to the part
+which is the covered work, but the work with which it is combined will remain
+governed by version 3 of the GNU General Public License.
+
+   14. Revised Versions of this License.
+
+The Free Software Foundation may publish revised and/or new versions of the
+GNU Affero General Public License from time to time. Such new versions will
+be similar in spirit to the present version, but may differ in detail to address
+new problems or concerns.
+
+Each version is given a distinguishing version number. If the Program specifies
+that a certain numbered version of the GNU Affero General Public License "or
+any later version" applies to it, you have the option of following the terms
+and conditions either of that numbered version or of any later version published
+by the Free Software Foundation. If the Program does not specify a version
+number of the GNU Affero General Public License, you may choose any version
+ever published by the Free Software Foundation.
+
+If the Program specifies that a proxy can decide which future versions of
+the GNU Affero General Public License can be used, that proxy's public statement
+of acceptance of a version permanently authorizes you to choose that version
+for the Program.
+
+Later license versions may give you additional or different permissions. However,
+no additional obligations are imposed on any author or copyright holder as
+a result of your choosing to follow a later version.
+
+   15. Disclaimer of Warranty.
+
+THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE
+LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
+EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM
+PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR
+CORRECTION.
+
+   16. Limitation of Liability.
+
+IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL
+ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM
+AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL,
+INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO
+USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
+INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE
+PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER
+PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+   17. Interpretation of Sections 15 and 16.
+
+If the disclaimer of warranty and limitation of liability provided above cannot
+be given local legal effect according to their terms, reviewing courts shall
+apply local law that most closely approximates an absolute waiver of all civil
+liability in connection with the Program, unless a warranty or assumption
+of liability accompanies a copy of the Program in return for a fee. END OF
+TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Programs
+
+If you develop a new program, and you want it to be of the greatest possible
+use to the public, the best way to achieve this is to make it free software
+which everyone can redistribute and change under these terms.
+
+To do so, attach the following notices to the program. It is safest to attach
+them to the start of each source file to most effectively state the exclusion
+of warranty; and each file should have at least the "copyright" line and a
+pointer to where the full notice is found.
+
+<one line to give the program's name and a brief idea of what it does.>
+
+Copyright (C) <year> <name of author>
+
+This program is free software: you can redistribute it and/or modify it under
+the terms of the GNU Affero General Public License as published by the Free
+Software Foundation, either version 3 of the License, or (at your option)
+any later version.
+
+This program is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
+details.
+
+You should have received a copy of the GNU Affero General Public License along
+with this program. If not, see <https://www.gnu.org/licenses/>.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If your software can interact with users remotely through a computer network,
+you should also make sure that it provides a way for users to get its source.
+For example, if your program is a web application, its interface could display
+a "Source" link that leads users to an archive of the code. There are many
+ways you could offer source, and different solutions will be better for different
+programs; see section 13 for the specific requirements.
+
+You should also get your employer (if you work as a programmer) or school,
+if any, to sign a "copyright disclaimer" for the program, if necessary. For
+more information on this, and how to apply and follow the GNU AGPL, see <https://www.gnu.org/licenses/>.
diff --git a/meta/files/common-licenses/GPL-1.0 b/meta/files/common-licenses/GPL-1.0
deleted file mode 100644
index 9d4ef93ae5..0000000000
--- a/meta/files/common-licenses/GPL-1.0
+++ /dev/null
@@ -1,252 +0,0 @@
-
-GNU General Public License, version 1
-
-                    GNU GENERAL PUBLIC LICENSE
-                     Version 1, February 1989
-
- Copyright (C) 1989 Free Software Foundation, Inc.
-                    51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- Everyone is permitted to copy and distribute verbatim copies
- of this license document, but changing it is not allowed.
-
-                            Preamble
-
-  The license agreements of most software companies try to keep users
-at the mercy of those companies.  By contrast, our General Public
-License is intended to guarantee your freedom to share and change free
-software--to make sure the software is free for all its users.  The
-General Public License applies to the Free Software Foundation`s
-software and to any other program whose authors commit to using it.
-You can use it for your programs, too.
-
-  When we speak of free software, we are referring to freedom, not
-price.  Specifically, the General Public License is designed to make
-sure that you have the freedom to give away or sell copies of free
-software, that you receive source code or can get it if you want it,
-that you can change the software or use pieces of it in new free
-programs; and that you know you can do these things.
-
-  To protect your rights, we need to make restrictions that forbid
-anyone to deny you these rights or to ask you to surrender the rights.
-These restrictions translate to certain responsibilities for you if you
-distribute copies of the software, or if you modify it.
-
-  For example, if you distribute copies of a such a program, whether
-gratis or for a fee, you must give the recipients all the rights that
-you have.  You must make sure that they, too, receive or can get the
-source code.  And you must tell them their rights.
-
-  We protect your rights with two steps: (1) copyright the software, and
-(2) offer you this license which gives you legal permission to copy,
-distribute and/or modify the software.
-
-  Also, for each author`s protection and ours, we want to make certain
-that everyone understands that there is no warranty for this free
-software.  If the software is modified by someone else and passed on, we
-want its recipients to know that what they have is not the original, so
-that any problems introduced by others will not reflect on the original
-authors` reputations.
-
-  The precise terms and conditions for copying, distribution and
-modification follow.
-
-                    GNU GENERAL PUBLIC LICENSE
-   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-
-  0. This License Agreement applies to any program or other work which
-contains a notice placed by the copyright holder saying it may be
-distributed under the terms of this General Public License.  The
-"Program", below, refers to any such program or work, and a "work based
-on the Program" means either the Program or any work containing the
-Program or a portion of it, either verbatim or with modifications.  Each
-licensee is addressed as "you".
-
-  1. You may copy and distribute verbatim copies of the Program`s source
-code as you receive it, in any medium, provided that you conspicuously and
-appropriately publish on each copy an appropriate copyright notice and
-disclaimer of warranty; keep intact all the notices that refer to this
-General Public License and to the absence of any warranty; and give any
-other recipients of the Program a copy of this General Public License
-along with the Program.  You may charge a fee for the physical act of
-transferring a copy.
-
-  2. You may modify your copy or copies of the Program or any portion of
-it, and copy and distribute such modifications under the terms of Paragraph
-1 above, provided that you also do the following:
-
-    a) cause the modified files to carry prominent notices stating that
-    you changed the files and the date of any change; and
-
-    b) cause the whole of any work that you distribute or publish, that
-    in whole or in part contains the Program or any part thereof, either
-    with or without modifications, to be licensed at no charge to all
-    third parties under the terms of this General Public License (except
-    that you may choose to grant warranty protection to some or all
-    third parties, at your option).
-
-    c) If the modified program normally reads commands interactively when
-    run, you must cause it, when started running for such interactive use
-    in the simplest and most usual way, to print or display an
-    announcement including an appropriate copyright notice and a notice
-    that there is no warranty (or else, saying that you provide a
-    warranty) and that users may redistribute the program under these
-    conditions, and telling the user how to view a copy of this General
-    Public License.
-
-    d) You may charge a fee for the physical act of transferring a
-    copy, and you may at your option offer warranty protection in
-    exchange for a fee.
-
-Mere aggregation of another independent work with the Program (or its
-derivative) on a volume of a storage or distribution medium does not bring
-the other work under the scope of these terms.
-
-  3. You may copy and distribute the Program (or a portion or derivative of
-it, under Paragraph 2) in object code or executable form under the terms of
-Paragraphs 1 and 2 above provided that you also do one of the following:
-
-    a) accompany it with the complete corresponding machine-readable
-    source code, which must be distributed under the terms of
-    Paragraphs 1 and 2 above; or,
-
-    b) accompany it with a written offer, valid for at least three
-    years, to give any third party free (except for a nominal charge
-    for the cost of distribution) a complete machine-readable copy of the
-    corresponding source code, to be distributed under the terms of
-    Paragraphs 1 and 2 above; or,
-
-    c) accompany it with the information you received as to where the
-    corresponding source code may be obtained.  (This alternative is
-    allowed only for noncommercial distribution and only if you
-    received the program in object code or executable form alone.)
-
-Source code for a work means the preferred form of the work for making
-modifications to it.  For an executable file, complete source code means
-all the source code for all modules it contains; but, as a special
-exception, it need not include source code for modules which are standard
-libraries that accompany the operating system on which the executable
-file runs, or for standard header files or definitions files that
-accompany that operating system.
-
-  4. You may not copy, modify, sublicense, distribute or transfer the
-Program except as expressly provided under this General Public License.
-Any attempt otherwise to copy, modify, sublicense, distribute or transfer
-the Program is void, and will automatically terminate your rights to use
-the Program under this License.  However, parties who have received
-copies, or rights to use copies, from you under this General Public
-License will not have their licenses terminated so long as such parties
-remain in full compliance.
-
-  5. By copying, distributing or modifying the Program (or any work based
-on the Program) you indicate your acceptance of this license to do so,
-and all its terms and conditions.
-
-  6. Each time you redistribute the Program (or any work based on the
-Program), the recipient automatically receives a license from the original
-licensor to copy, distribute or modify the Program subject to these
-terms and conditions.  You may not impose any further restrictions on the
-recipients` exercise of the rights granted herein.
-
-  7. The Free Software Foundation may publish revised and/or new versions
-of the General Public License from time to time.  Such new versions will
-be similar in spirit to the present version, but may differ in detail to
-address new problems or concerns.
-
-Each version is given a distinguishing version number.  If the Program
-specifies a version number of the license which applies to it and "any
-later version", you have the option of following the terms and conditions
-either of that version or of any later version published by the Free
-Software Foundation.  If the Program does not specify a version number of
-the license, you may choose any version ever published by the Free Software
-Foundation.
-
-  8. If you wish to incorporate parts of the Program into other free
-programs whose distribution conditions are different, write to the author
-to ask for permission.  For software which is copyrighted by the Free
-Software Foundation, write to the Free Software Foundation; we sometimes
-make exceptions for this.  Our decision will be guided by the two goals
-of preserving the free status of all derivatives of our free software and
-of promoting the sharing and reuse of software generally.
-
-                            NO WARRANTY
-
-  9. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
-FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
-OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
-OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
-TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
-PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
-REPAIR OR CORRECTION.
-
-  10. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
-INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
-OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
-TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
-YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
-PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
-POSSIBILITY OF SUCH DAMAGES.
-
-                     END OF TERMS AND CONDITIONS
-
-        Appendix: How to Apply These Terms to Your New Programs
-
-  If you develop a new program, and you want it to be of the greatest
-possible use to humanity, the best way to achieve this is to make it
-free software which everyone can redistribute and change under these
-terms.
-
-  To do so, attach the following notices to the program.  It is safest to
-attach them to the start of each source file to most effectively convey
-the exclusion of warranty; and each file should have at least the
-"copyright" line and a pointer to where the full notice is found.
-
-    <one line to give the program`s name and a brief idea of what it does.>
-    Copyright (C) 19yy  <name of author>
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 1, or (at your option)
-    any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program; if not, write to the Free Software
-    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-
-Also add information on how to contact you by electronic and paper mail.
-
-If the program is interactive, make it output a short notice like this
-when it starts in an interactive mode:
-
-    Gnomovision version 69, Copyright (C) 19xx name of author
-    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w`.
-    This is free software, and you are welcome to redistribute it
-    under certain conditions; type `show c` for details.
-
-The hypothetical commands `show w` and `show c` should show the
-appropriate parts of the General Public License.  Of course, the
-commands you use may be called something other than `show w` and `show
-c`; they could even be mouse-clicks or menu items--whatever suits your
-program.
-
-You should also get your employer (if you work as a programmer) or your
-school, if any, to sign a "copyright disclaimer" for the program, if
-necessary.  Here a sample; alter the names:
-
-  Yoyodyne, Inc., hereby disclaims all copyright interest in the
-  program `Gnomovision` (a program to direct compilers to make passes
-  at assemblers) written by James Hacker.
-
-  <signature of Ty Coon>, 1 April 1989
-  Ty Coon, President of Vice
-
-That`s all there is to it!
-
diff --git a/meta/files/common-licenses/GPL-1.0-only b/meta/files/common-licenses/GPL-1.0-only
new file mode 100644
index 0000000000..fb9886cf8c
--- /dev/null
+++ b/meta/files/common-licenses/GPL-1.0-only
@@ -0,0 +1,251 @@
+GNU GENERAL PUBLIC LICENSE
+
+Version 1, February 1989
+
+Copyright (C) 1989 Free Software Foundation, Inc. 51 Franklin St, Fifth Floor,
+Boston, MA 02110-1301 USA
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+Preamble
+
+The license agreements of most software companies try to keep users at the
+mercy of those companies. By contrast, our General Public License is intended
+to guarantee your freedom to share and change free software--to make sure
+the software is free for all its users. The General Public License applies
+to the Free Software Foundation's software and to any other program whose
+authors commit to using it. You can use it for your programs, too.
+
+When we speak of free software, we are referring to freedom, not price. Specifically,
+the General Public License is designed to make sure that you have the freedom
+to give away or sell copies of free software, that you receive source code
+or can get it if you want it, that you can change the software or use pieces
+of it in new free programs; and that you know you can do these things.
+
+To protect your rights, we need to make restrictions that forbid anyone to
+deny you these rights or to ask you to surrender the rights. These restrictions
+translate to certain responsibilities for you if you distribute copies of
+the software, or if you modify it.
+
+For example, if you distribute copies of a such a program, whether gratis
+or for a fee, you must give the recipients all the rights that you have. You
+must make sure that they, too, receive or can get the source code. And you
+must tell them their rights.
+
+We protect your rights with two steps: (1) copyright the software, and (2)
+offer you this license which gives you legal permission to copy, distribute
+and/or modify the software.
+
+Also, for each author's protection and ours, we want to make certain that
+everyone understands that there is no warranty for this free software. If
+the software is modified by someone else and passed on, we want its recipients
+to know that what they have is not the original, so that any problems introduced
+by others will not reflect on the original authors' reputations.
+
+The precise terms and conditions for copying, distribution and modification
+follow.
+
+GNU GENERAL PUBLIC LICENSE TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION
+AND MODIFICATION
+
+   
+
+0. This License Agreement applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed under
+the terms of this General Public License. The "Program", below, refers to
+any such program or work, and a "work based on the Program" means either the
+Program or any work containing the Program or a portion of it, either verbatim
+or with modifications. Each licensee is addressed as "you".
+
+   
+
+1. You may copy and distribute verbatim copies of the Program's source code
+as you receive it, in any medium, provided that you conspicuously and appropriately
+publish on each copy an appropriate copyright notice and disclaimer of warranty;
+keep intact all the notices that refer to this General Public License and
+to the absence of any warranty; and give any other recipients of the Program
+a copy of this General Public License along with the Program. You may charge
+a fee for the physical act of transferring a copy.
+
+   
+
+2. You may modify your copy or copies of the Program or any portion of it,
+and copy and distribute such modifications under the terms of Paragraph 1
+above, provided that you also do the following:
+
+a) cause the modified files to carry prominent notices stating that you changed
+the files and the date of any change; and
+
+b) cause the whole of any work that you distribute or publish, that in whole
+or in part contains the Program or any part thereof, either with or without
+modifications, to be licensed at no charge to all third parties under the
+terms of this General Public License (except that you may choose to grant
+warranty protection to some or all third parties, at your option).
+
+c) If the modified program normally reads commands interactively when run,
+you must cause it, when started running for such interactive use in the simplest
+and most usual way, to print or display an announcement including an appropriate
+copyright notice and a notice that there is no warranty (or else, saying that
+you provide a warranty) and that users may redistribute the program under
+these conditions, and telling the user how to view a copy of this General
+Public License.
+
+d) You may charge a fee for the physical act of transferring a copy, and you
+may at your option offer warranty protection in exchange for a fee.
+
+Mere aggregation of another independent work with the Program (or its derivative)
+on a volume of a storage or distribution medium does not bring the other work
+under the scope of these terms.
+
+   
+
+3. You may copy and distribute the Program (or a portion or derivative of
+it, under Paragraph 2) in object code or executable form under the terms of
+Paragraphs 1 and 2 above provided that you also do one of the following:
+
+a) accompany it with the complete corresponding machine-readable source code,
+which must be distributed under the terms of Paragraphs 1 and 2 above; or,
+
+b) accompany it with a written offer, valid for at least three years, to give
+any third party free (except for a nominal charge for the cost of distribution)
+a complete machine-readable copy of the corresponding source code, to be distributed
+under the terms of Paragraphs 1 and 2 above; or,
+
+c) accompany it with the information you received as to where the corresponding
+source code may be obtained. (This alternative is allowed only for noncommercial
+distribution and only if you received the program in object code or executable
+form alone.)
+
+Source code for a work means the preferred form of the work for making modifications
+to it. For an executable file, complete source code means all the source code
+for all modules it contains; but, as a special exception, it need not include
+source code for modules which are standard libraries that accompany the operating
+system on which the executable file runs, or for standard header files or
+definitions files that accompany that operating system.
+
+   
+
+4. You may not copy, modify, sublicense, distribute or transfer the Program
+except as expressly provided under this General Public License. Any attempt
+otherwise to copy, modify, sublicense, distribute or transfer the Program
+is void, and will automatically terminate your rights to use the Program under
+this License. However, parties who have received copies, or rights to use
+copies, from you under this General Public License will not have their licenses
+terminated so long as such parties remain in full compliance.
+
+   
+
+5. By copying, distributing or modifying the Program (or any work based on
+the Program) you indicate your acceptance of this license to do so, and all
+its terms and conditions.
+
+   
+
+6. Each time you redistribute the Program (or any work based on the Program),
+the recipient automatically receives a license from the original licensor
+to copy, distribute or modify the Program subject to these terms and conditions.
+You may not impose any further restrictions on the recipients' exercise of
+the rights granted herein.
+
+   
+
+7. The Free Software Foundation may publish revised and/or new versions of
+the General Public License from time to time. Such new versions will be similar
+in spirit to the present version, but may differ in detail to address new
+problems or concerns.
+
+Each version is given a distinguishing version number. If the Program specifies
+a version number of the license which applies to it and "any later version",
+you have the option of following the terms and conditions either of that version
+or of any later version published by the Free Software Foundation. If the
+Program does not specify a version number of the license, you may choose any
+version ever published by the Free Software Foundation.
+
+   
+
+8. If you wish to incorporate parts of the Program into other free programs
+whose distribution conditions are different, write to the author to ask for
+permission. For software which is copyrighted by the Free Software Foundation,
+write to the Free Software Foundation; we sometimes make exceptions for this.
+Our decision will be guided by the two goals of preserving the free status
+of all derivatives of our free software and of promoting the sharing and reuse
+of software generally.
+
+   
+
+   NO WARRANTY
+
+9. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR
+THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE
+STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM
+"AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
+OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+   
+
+10. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE
+THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE
+OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA
+OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES
+OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH
+HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+END OF TERMS AND CONDITIONS
+
+Appendix: How to Apply These Terms to Your New Programs
+
+If you develop a new program, and you want it to be of the greatest possible
+use to humanity, the best way to achieve this is to make it free software
+which everyone can redistribute and change under these terms.
+
+To do so, attach the following notices to the program. It is safest to attach
+them to the start of each source file to most effectively convey the exclusion
+of warranty; and each file should have at least the "copyright" line and a
+pointer to where the full notice is found.
+
+<one line to give the program's name and a brief idea of what it does.> Copyright
+(C) 19yy <name of author>
+
+This program is free software; you can redistribute it and/or modify it under
+the terms of the GNU General Public License as published by the Free Software
+Foundation; either version 1, or (at your option) any later version.
+
+This program is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+
+You should have received a copy of the GNU General Public License along with
+this program; if not, write to the Free Software Foundation, Inc., 675 Mass
+Ave, Cambridge, MA 02139, USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this when
+it starts in an interactive mode:
+
+Gnomovision version 69, Copyright (C) 19xx name of author Gnomovision comes
+with ABSOLUTELY NO WARRANTY; for details type `show w'. This is free software,
+and you are welcome to redistribute it under certain conditions; type `show
+c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License. Of course, the commands you use may be
+called something other than `show w' and `show c'; they could even be mouse-clicks
+or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your school,
+if any, to sign a "copyright disclaimer" for the program, if necessary. Here
+a sample; alter the names:
+
+Yoyodyne, Inc., hereby disclaims all copyright interest in the program `Gnomovision'
+(a program to direct compilers to make passes at assemblers) written by James
+Hacker.
+
+<signature of Ty Coon>, 1 April 1989 Ty Coon, President of Vice
+
+That's all there is to it!
diff --git a/meta/files/common-licenses/GPL-1.0-or-later b/meta/files/common-licenses/GPL-1.0-or-later
new file mode 100644
index 0000000000..b616110c75
--- /dev/null
+++ b/meta/files/common-licenses/GPL-1.0-or-later
@@ -0,0 +1,232 @@
+GNU GENERAL PUBLIC LICENSE
+
+Version 1, February 1989
+
+Copyright (C) 1989 Free Software Foundation, Inc. 51 Franklin St, Fifth Floor,
+Boston, MA 02110-1301 USA
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+Preamble
+
+The license agreements of most software companies try to keep users at the
+mercy of those companies. By contrast, our General Public License is intended
+to guarantee your freedom to share and change free software--to make sure
+the software is free for all its users. The General Public License applies
+to the Free Software Foundation's software and to any other program whose
+authors commit to using it. You can use it for your programs, too.
+
+When we speak of free software, we are referring to freedom, not price. Specifically,
+the General Public License is designed to make sure that you have the freedom
+to give away or sell copies of free software, that you receive source code
+or can get it if you want it, that you can change the software or use pieces
+of it in new free programs; and that you know you can do these things.
+
+To protect your rights, we need to make restrictions that forbid anyone to
+deny you these rights or to ask you to surrender the rights. These restrictions
+translate to certain responsibilities for you if you distribute copies of
+the software, or if you modify it.
+
+For example, if you distribute copies of a such a program, whether gratis
+or for a fee, you must give the recipients all the rights that you have. You
+must make sure that they, too, receive or can get the source code. And you
+must tell them their rights.
+
+We protect your rights with two steps: (1) copyright the software, and (2)
+offer you this license which gives you legal permission to copy, distribute
+and/or modify the software.
+
+Also, for each author's protection and ours, we want to make certain that
+everyone understands that there is no warranty for this free software. If
+the software is modified by someone else and passed on, we want its recipients
+to know that what they have is not the original, so that any problems introduced
+by others will not reflect on the original authors' reputations.
+
+The precise terms and conditions for copying, distribution and modification
+follow.
+
+GNU GENERAL PUBLIC LICENSE TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION
+AND MODIFICATION
+
+0. This License Agreement applies to any program or other work which contains
+a notice placed by the copyright holder saying it may be distributed under
+the terms of this General Public License. The "Program", below, refers to
+any such program or work, and a "work based on the Program" means either the
+Program or any work containing the Program or a portion of it, either verbatim
+or with modifications. Each licensee is addressed as "you".
+
+1. You may copy and distribute verbatim copies of the Program's source code
+as you receive it, in any medium, provided that you conspicuously and appropriately
+publish on each copy an appropriate copyright notice and disclaimer of warranty;
+keep intact all the notices that refer to this General Public License and
+to the absence of any warranty; and give any other recipients of the Program
+a copy of this General Public License along with the Program. You may charge
+a fee for the physical act of transferring a copy.
+
+2. You may modify your copy or copies of the Program or any portion of it,
+and copy and distribute such modifications under the terms of Paragraph 1
+above, provided that you also do the following:
+
+a) cause the modified files to carry prominent notices stating that you changed
+the files and the date of any change; and
+
+b) cause the whole of any work that you distribute or publish, that in whole
+or in part contains the Program or any part thereof, either with or without
+modifications, to be licensed at no charge to all third parties under the
+terms of this General Public License (except that you may choose to grant
+warranty protection to some or all third parties, at your option).
+
+c) If the modified program normally reads commands interactively when run,
+you must cause it, when started running for such interactive use in the simplest
+and most usual way, to print or display an announcement including an appropriate
+copyright notice and a notice that there is no warranty (or else, saying that
+you provide a warranty) and that users may redistribute the program under
+these conditions, and telling the user how to view a copy of this General
+Public License.
+
+d) You may charge a fee for the physical act of transferring a copy, and you
+may at your option offer warranty protection in exchange for a fee.
+
+Mere aggregation of another independent work with the Program (or its derivative)
+on a volume of a storage or distribution medium does not bring the other work
+under the scope of these terms.
+
+3. You may copy and distribute the Program (or a portion or derivative of
+it, under Paragraph 2) in object code or executable form under the terms of
+Paragraphs 1 and 2 above provided that you also do one of the following:
+
+a) accompany it with the complete corresponding machine-readable source code,
+which must be distributed under the terms of Paragraphs 1 and 2 above; or,
+
+b) accompany it with a written offer, valid for at least three years, to give
+any third party free (except for a nominal charge for the cost of distribution)
+a complete machine-readable copy of the corresponding source code, to be distributed
+under the terms of Paragraphs 1 and 2 above; or,
+
+c) accompany it with the information you received as to where the corresponding
+source code may be obtained. (This alternative is allowed only for noncommercial
+distribution and only if you received the program in object code or executable
+form alone.)
+
+Source code for a work means the preferred form of the work for making modifications
+to it. For an executable file, complete source code means all the source code
+for all modules it contains; but, as a special exception, it need not include
+source code for modules which are standard libraries that accompany the operating
+system on which the executable file runs, or for standard header files or
+definitions files that accompany that operating system.
+
+4. You may not copy, modify, sublicense, distribute or transfer the Program
+except as expressly provided under this General Public License. Any attempt
+otherwise to copy, modify, sublicense, distribute or transfer the Program
+is void, and will automatically terminate your rights to use the Program under
+this License. However, parties who have received copies, or rights to use
+copies, from you under this General Public License will not have their licenses
+terminated so long as such parties remain in full compliance.
+
+5. By copying, distributing or modifying the Program (or any work based on
+the Program) you indicate your acceptance of this license to do so, and all
+its terms and conditions.
+
+6. Each time you redistribute the Program (or any work based on the Program),
+the recipient automatically receives a license from the original licensor
+to copy, distribute or modify the Program subject to these terms and conditions.
+You may not impose any further restrictions on the recipients' exercise of
+the rights granted herein.
+
+7. The Free Software Foundation may publish revised and/or new versions of
+the General Public License from time to time. Such new versions will be similar
+in spirit to the present version, but may differ in detail to address new
+problems or concerns.
+
+Each version is given a distinguishing version number. If the Program specifies
+a version number of the license which applies to it and "any later version",
+you have the option of following the terms and conditions either of that version
+or of any later version published by the Free Software Foundation. If the
+Program does not specify a version number of the license, you may choose any
+version ever published by the Free Software Foundation.
+
+8. If you wish to incorporate parts of the Program into other free programs
+whose distribution conditions are different, write to the author to ask for
+permission. For software which is copyrighted by the Free Software Foundation,
+write to the Free Software Foundation; we sometimes make exceptions for this.
+Our decision will be guided by the two goals of preserving the free status
+of all derivatives of our free software and of promoting the sharing and reuse
+of software generally.
+
+   
+
+   NO WARRANTY 9.
+
+BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE
+PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE
+STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM
+"AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
+OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+10. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE
+THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE
+OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA
+OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES
+OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH
+HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+END OF TERMS AND CONDITIONS
+
+Appendix: How to Apply These Terms to Your New Programs
+
+If you develop a new program, and you want it to be of the greatest possible
+use to humanity, the best way to achieve this is to make it free software
+which everyone can redistribute and change under these terms.
+
+To do so, attach the following notices to the program. It is safest to attach
+them to the start of each source file to most effectively convey the exclusion
+of warranty; and each file should have at least the "copyright" line and a
+pointer to where the full notice is found.
+
+<one line to give the program's name and a brief idea of what it does.>
+
+Copyright (C) 19yy <name of author>
+
+This program is free software; you can redistribute it and/or modify it under
+the terms of the GNU General Public License as published by the Free Software
+Foundation; either version 1, or (at your option) any later version.
+
+This program is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+
+You should have received a copy of the GNU General Public License along with
+this program; if not, write to the Free Software Foundation, Inc., 675 Mass
+Ave, Cambridge, MA 02139, USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this when
+it starts in an interactive mode:
+
+Gnomovision version 69, Copyright (C) 19xx name of author Gnomovision comes
+with ABSOLUTELY NO WARRANTY; for details type `show w'. This is free software,
+and you are welcome to redistribute it under certain conditions; type `show
+c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License. Of course, the commands you use may be
+called something other than `show w' and `show c'; they could even be mouse-clicks
+or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your school,
+if any, to sign a "copyright disclaimer" for the program, if necessary. Here
+a sample; alter the names:
+
+Yoyodyne, Inc., hereby disclaims all copyright interest in the program `Gnomovision'
+(a program to direct compilers to make passes at assemblers) written by James
+Hacker.
+
+<signature of Ty Coon>, 1 April 1989 Ty Coon, President of Vice
+
+That's all there is to it!
diff --git a/meta/files/common-licenses/GPL-2.0 b/meta/files/common-licenses/GPL-2.0
deleted file mode 100644
index 7f5abbce27..0000000000
--- a/meta/files/common-licenses/GPL-2.0
+++ /dev/null
@@ -1,132 +0,0 @@
-
-GNU GENERAL PUBLIC LICENSE
-
-Version 2, June 1991
-
-Copyright (C) 1989, 1991 Free Software Foundation, Inc.  
-51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
-
-Everyone is permitted to copy and distribute verbatim copies
-of this license document, but changing it is not allowed.
-Preamble
-
-The licenses for most software are designed to take away your freedom to share and change it. By contrast, the GNU General Public License is intended to guarantee your freedom to share and change free software--to make sure the software is free for all its users. This General Public License applies to most of the Free Software Foundation`s software and to any other program whose authors commit to using it. (Some other Free Software Foundation software is covered by the GNU Lesser General Public License instead.) You can apply it to your programs, too.
-
-When we speak of free software, we are referring to freedom, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for this service if you wish), that you receive source code or can get it if you want it, that you can change the software or use pieces of it in new free programs; and that you know you can do these things.
-
-To protect your rights, we need to make restrictions that forbid anyone to deny you these rights or to ask you to surrender the rights. These restrictions translate to certain responsibilities for you if you distribute copies of the software, or if you modify it.
-
-For example, if you distribute copies of such a program, whether gratis or for a fee, you must give the recipients all the rights that you have. You must make sure that they, too, receive or can get the source code. And you must show them these terms so they know their rights.
-
-We protect your rights with two steps: (1) copyright the software, and (2) offer you this license which gives you legal permission to copy, distribute and/or modify the software.
-
-Also, for each author`s protection and ours, we want to make certain that everyone understands that there is no warranty for this free software. If the software is modified by someone else and passed on, we want its recipients to know that what they have is not the original, so that any problems introduced by others will not reflect on the original authors` reputations.
-
-Finally, any free program is threatened constantly by software patents. We wish to avoid the danger that redistributors of a free program will individually obtain patent licenses, in effect making the program proprietary. To prevent this, we have made it clear that any patent must be licensed for everyone`s free use or not licensed at all.
-
-The precise terms and conditions for copying, distribution and modification follow.
-
-TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-
-0. This License applies to any program or other work which contains a notice placed by the copyright holder saying it may be distributed under the terms of this General Public License. The "Program", below, refers to any such program or work, and a "work based on the Program" means either the Program or any derivative work under copyright law: that is to say, a work containing the Program or a portion of it, either verbatim or with modifications and/or translated into another language. (Hereinafter, translation is included without limitation in the term "modification".) Each licensee is addressed as "you".
-
-Activities other than copying, distribution and modification are not covered by this License; they are outside its scope. The act of running the Program is not restricted, and the output from the Program is covered only if its contents constitute a work based on the Program (independent of having been made by running the Program). Whether that is true depends on what the Program does.
-
-1. You may copy and distribute verbatim copies of the Program`s source code as you receive it, in any medium, provided that you conspicuously and appropriately publish on each copy an appropriate copyright notice and disclaimer of warranty; keep intact all the notices that refer to this License and to the absence of any warranty; and give any other recipients of the Program a copy of this License along with the Program.
-
-You may charge a fee for the physical act of transferring a copy, and you may at your option offer warranty protection in exchange for a fee.
-
-2. You may modify your copy or copies of the Program or any portion of it, thus forming a work based on the Program, and copy and distribute such modifications or work under the terms of Section 1 above, provided that you also meet all of these conditions:
-
-a) You must cause the modified files to carry prominent notices stating that you changed the files and the date of any change.
-b) You must cause any work that you distribute or publish, that in whole or in part contains or is derived from the Program or any part thereof, to be licensed as a whole at no charge to all third parties under the terms of this License.
-c) If the modified program normally reads commands interactively when run, you must cause it, when started running for such interactive use in the most ordinary way, to print or display an announcement including an appropriate copyright notice and a notice that there is no warranty (or else, saying that you provide a warranty) and that users may redistribute the program under these conditions, and telling the user how to view a copy of this License. (Exception: if the Program itself is interactive but does not normally print such an announcement, your work based on the Program is not required to print an announcement.)
-These requirements apply to the modified work as a whole. If identifiable sections of that work are not derived from the Program, and can be reasonably considered independent and separate works in themselves, then this License, and its terms, do not apply to those sections when you distribute them as separate works. But when you distribute the same sections as part of a whole which is a work based on the Program, the distribution of the whole must be on the terms of this License, whose permissions for other licensees extend to the entire whole, and thus to each and every part regardless of who wrote it.
-
-Thus, it is not the intent of this section to claim rights or contest your rights to work written entirely by you; rather, the intent is to exercise the right to control the distribution of derivative or collective works based on the Program.
-
-In addition, mere aggregation of another work not based on the Program with the Program (or with a work based on the Program) on a volume of a storage or distribution medium does not bring the other work under the scope of this License.
-
-3. You may copy and distribute the Program (or a work based on it, under Section 2) in object code or executable form under the terms of Sections 1 and 2 above provided that you also do one of the following:
-
-a) Accompany it with the complete corresponding machine-readable source code, which must be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange; or,
-b) Accompany it with a written offer, valid for at least three years, to give any third party, for a charge no more than your cost of physically performing source distribution, a complete machine-readable copy of the corresponding source code, to be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange; or,
-c) Accompany it with the information you received as to the offer to distribute corresponding source code. (This alternative is allowed only for noncommercial distribution and only if you received the program in object code or executable form with such an offer, in accord with Subsection b above.)
-The source code for a work means the preferred form of the work for making modifications to it. For an executable work, complete source code means all the source code for all modules it contains, plus any associated interface definition files, plus the scripts used to control compilation and installation of the executable. However, as a special exception, the source code distributed need not include anything that is normally distributed (in either source or binary form) with the major components (compiler, kernel, and so on) of the operating system on which the executable runs, unless that component itself accompanies the executable.
-
-If distribution of executable or object code is made by offering access to copy from a designated place, then offering equivalent access to copy the source code from the same place counts as distribution of the source code, even though third parties are not compelled to copy the source along with the object code.
-
-4. You may not copy, modify, sublicense, or distribute the Program except as expressly provided under this License. Any attempt otherwise to copy, modify, sublicense or distribute the Program is void, and will automatically terminate your rights under this License. However, parties who have received copies, or rights, from you under this License will not have their licenses terminated so long as such parties remain in full compliance.
-
-5. You are not required to accept this License, since you have not signed it. However, nothing else grants you permission to modify or distribute the Program or its derivative works. These actions are prohibited by law if you do not accept this License. Therefore, by modifying or distributing the Program (or any work based on the Program), you indicate your acceptance of this License to do so, and all its terms and conditions for copying, distributing or modifying the Program or works based on it.
-
-6. Each time you redistribute the Program (or any work based on the Program), the recipient automatically receives a license from the original licensor to copy, distribute or modify the Program subject to these terms and conditions. You may not impose any further restrictions on the recipients` exercise of the rights granted herein. You are not responsible for enforcing compliance by third parties to this License.
-
-7. If, as a consequence of a court judgment or allegation of patent infringement or for any other reason (not limited to patent issues), conditions are imposed on you (whether by court order, agreement or otherwise) that contradict the conditions of this License, they do not excuse you from the conditions of this License. If you cannot distribute so as to satisfy simultaneously your obligations under this License and any other pertinent obligations, then as a consequence you may not distribute the Program at all. For example, if a patent license would not permit royalty-free redistribution of the Program by all those who receive copies directly or indirectly through you, then the only way you could satisfy both it and this License would be to refrain entirely from distribution of the Program.
-
-If any portion of this section is held invalid or unenforceable under any particular circumstance, the balance of the section is intended to apply and the section as a whole is intended to apply in other circumstances.
-
-It is not the purpose of this section to induce you to infringe any patents or other property right claims or to contest validity of any such claims; this section has the sole purpose of protecting the integrity of the free software distribution system, which is implemented by public license practices. Many people have made generous contributions to the wide range of software distributed through that system in reliance on consistent application of that system; it is up to the author/donor to decide if he or she is willing to distribute software through any other system and a licensee cannot impose that choice.
-
-This section is intended to make thoroughly clear what is believed to be a consequence of the rest of this License.
-
-8. If the distribution and/or use of the Program is restricted in certain countries either by patents or by copyrighted interfaces, the original copyright holder who places the Program under this License may add an explicit geographical distribution limitation excluding those countries, so that distribution is permitted only in or among countries not thus excluded. In such case, this License incorporates the limitation as if written in the body of this License.
-
-9. The Free Software Foundation may publish revised and/or new versions of the General Public License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns.
-
-Each version is given a distinguishing version number. If the Program specifies a version number of this License which applies to it and "any later version", you have the option of following the terms and conditions either of that version or of any later version published by the Free Software Foundation. If the Program does not specify a version number of this License, you may choose any version ever published by the Free Software Foundation.
-
-10. If you wish to incorporate parts of the Program into other free programs whose distribution conditions are different, write to the author to ask for permission. For software which is copyrighted by the Free Software Foundation, write to the Free Software Foundation; we sometimes make exceptions for this. Our decision will be guided by the two goals of preserving the free status of all derivatives of our free software and of promoting the sharing and reuse of software generally.
-
-NO WARRANTY
-
-11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
-
-12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
-
-END OF TERMS AND CONDITIONS
-
-How to Apply These Terms to Your New Programs
-
-If you develop a new program, and you want it to be of the greatest possible use to the public, the best way to achieve this is to make it free software which everyone can redistribute and change under these terms.
-
-To do so, attach the following notices to the program. It is safest to attach them to the start of each source file to most effectively convey the exclusion of warranty; and each file should have at least the "copyright" line and a pointer to where the full notice is found.
-
-one line to give the program`s name and an idea of what it does.
-Copyright (C) yyyy  name of author
-
-This program is free software; you can redistribute it and/or
-modify it under the terms of the GNU General Public License
-as published by the Free Software Foundation; either version 2
-of the License, or (at your option) any later version.
-
-This program is distributed in the hope that it will be useful,
-but WITHOUT ANY WARRANTY; without even the implied warranty of
-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-GNU General Public License for more details.
-
-You should have received a copy of the GNU General Public License
-along with this program; if not, write to the Free Software
-Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
-Also add information on how to contact you by electronic and paper mail.
-
-If the program is interactive, make it output a short notice like this when it starts in an interactive mode:
-
-Gnomovision version 69, Copyright (C) year name of author
-Gnomovision comes with ABSOLUTELY NO WARRANTY; for details
-type `show w`.  This is free software, and you are welcome
-to redistribute it under certain conditions; type `show c` 
-for details.
-The hypothetical commands `show w` and `show c` should show the appropriate parts of the General Public License. Of course, the commands you use may be called something other than `show w` and `show c`; they could even be mouse-clicks or menu items--whatever suits your program.
-
-You should also get your employer (if you work as a programmer) or your school, if any, to sign a "copyright disclaimer" for the program, if necessary. Here is a sample; alter the names:
-
-Yoyodyne, Inc., hereby disclaims all copyright
-interest in the program `Gnomovision`
-(which makes passes at compilers) written 
-by James Hacker.
-
-signature of Ty Coon, 1 April 1989
-Ty Coon, President of Vice
-This General Public License does not permit incorporating your program into proprietary programs. If your program is a subroutine library, you may consider it more useful to permit linking proprietary applications with the library. If this is what you want to do, use the GNU Lesser General Public License instead of this License.
-
diff --git a/meta/files/common-licenses/GPL-2.0-only b/meta/files/common-licenses/GPL-2.0-only
new file mode 100644
index 0000000000..0f3d6411da
--- /dev/null
+++ b/meta/files/common-licenses/GPL-2.0-only
@@ -0,0 +1,319 @@
+GNU GENERAL PUBLIC LICENSE
+
+Version 2, June 1991
+
+Copyright (C) 1989, 1991 Free Software Foundation, Inc. 
+
+51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+Preamble
+
+The licenses for most software are designed to take away your freedom to share
+and change it. By contrast, the GNU General Public License is intended to
+guarantee your freedom to share and change free software--to make sure the
+software is free for all its users. This General Public License applies to
+most of the Free Software Foundation's software and to any other program whose
+authors commit to using it. (Some other Free Software Foundation software
+is covered by the GNU Lesser General Public License instead.) You can apply
+it to your programs, too.
+
+When we speak of free software, we are referring to freedom, not price. Our
+General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for this service if you
+wish), that you receive source code or can get it if you want it, that you
+can change the software or use pieces of it in new free programs; and that
+you know you can do these things.
+
+To protect your rights, we need to make restrictions that forbid anyone to
+deny you these rights or to ask you to surrender the rights. These restrictions
+translate to certain responsibilities for you if you distribute copies of
+the software, or if you modify it.
+
+For example, if you distribute copies of such a program, whether gratis or
+for a fee, you must give the recipients all the rights that you have. You
+must make sure that they, too, receive or can get the source code. And you
+must show them these terms so they know their rights.
+
+We protect your rights with two steps: (1) copyright the software, and (2)
+offer you this license which gives you legal permission to copy, distribute
+and/or modify the software.
+
+Also, for each author's protection and ours, we want to make certain that
+everyone understands that there is no warranty for this free software. If
+the software is modified by someone else and passed on, we want its recipients
+to know that what they have is not the original, so that any problems introduced
+by others will not reflect on the original authors' reputations.
+
+Finally, any free program is threatened constantly by software patents. We
+wish to avoid the danger that redistributors of a free program will individually
+obtain patent licenses, in effect making the program proprietary. To prevent
+this, we have made it clear that any patent must be licensed for everyone's
+free use or not licensed at all.
+
+The precise terms and conditions for copying, distribution and modification
+follow.
+
+TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+0. This License applies to any program or other work which contains a notice
+placed by the copyright holder saying it may be distributed under the terms
+of this General Public License. The "Program", below, refers to any such program
+or work, and a "work based on the Program" means either the Program or any
+derivative work under copyright law: that is to say, a work containing the
+Program or a portion of it, either verbatim or with modifications and/or translated
+into another language. (Hereinafter, translation is included without limitation
+in the term "modification".) Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not covered
+by this License; they are outside its scope. The act of running the Program
+is not restricted, and the output from the Program is covered only if its
+contents constitute a work based on the Program (independent of having been
+made by running the Program). Whether that is true depends on what the Program
+does.
+
+1. You may copy and distribute verbatim copies of the Program's source code
+as you receive it, in any medium, provided that you conspicuously and appropriately
+publish on each copy an appropriate copyright notice and disclaimer of warranty;
+keep intact all the notices that refer to this License and to the absence
+of any warranty; and give any other recipients of the Program a copy of this
+License along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and you
+may at your option offer warranty protection in exchange for a fee.
+
+2. You may modify your copy or copies of the Program or any portion of it,
+thus forming a work based on the Program, and copy and distribute such modifications
+or work under the terms of Section 1 above, provided that you also meet all
+of these conditions:
+
+a) You must cause the modified files to carry prominent notices stating that
+you changed the files and the date of any change.
+
+b) You must cause any work that you distribute or publish, that in whole or
+in part contains or is derived from the Program or any part thereof, to be
+licensed as a whole at no charge to all third parties under the terms of this
+License.
+
+c) If the modified program normally reads commands interactively when run,
+you must cause it, when started running for such interactive use in the most
+ordinary way, to print or display an announcement including an appropriate
+copyright notice and a notice that there is no warranty (or else, saying that
+you provide a warranty) and that users may redistribute the program under
+these conditions, and telling the user how to view a copy of this License.
+(Exception: if the Program itself is interactive but does not normally print
+such an announcement, your work based on the Program is not required to print
+an announcement.)
+
+These requirements apply to the modified work as a whole. If identifiable
+sections of that work are not derived from the Program, and can be reasonably
+considered independent and separate works in themselves, then this License,
+and its terms, do not apply to those sections when you distribute them as
+separate works. But when you distribute the same sections as part of a whole
+which is a work based on the Program, the distribution of the whole must be
+on the terms of this License, whose permissions for other licensees extend
+to the entire whole, and thus to each and every part regardless of who wrote
+it.
+
+Thus, it is not the intent of this section to claim rights or contest your
+rights to work written entirely by you; rather, the intent is to exercise
+the right to control the distribution of derivative or collective works based
+on the Program.
+
+In addition, mere aggregation of another work not based on the Program with
+the Program (or with a work based on the Program) on a volume of a storage
+or distribution medium does not bring the other work under the scope of this
+License.
+
+3. You may copy and distribute the Program (or a work based on it, under Section
+2) in object code or executable form under the terms of Sections 1 and 2 above
+provided that you also do one of the following:
+
+a) Accompany it with the complete corresponding machine-readable source code,
+which must be distributed under the terms of Sections 1 and 2 above on a medium
+customarily used for software interchange; or,
+
+b) Accompany it with a written offer, valid for at least three years, to give
+any third party, for a charge no more than your cost of physically performing
+source distribution, a complete machine-readable copy of the corresponding
+source code, to be distributed under the terms of Sections 1 and 2 above on
+a medium customarily used for software interchange; or,
+
+c) Accompany it with the information you received as to the offer to distribute
+corresponding source code. (This alternative is allowed only for noncommercial
+distribution and only if you received the program in object code or executable
+form with such an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for making
+modifications to it. For an executable work, complete source code means all
+the source code for all modules it contains, plus any associated interface
+definition files, plus the scripts used to control compilation and installation
+of the executable. However, as a special exception, the source code distributed
+need not include anything that is normally distributed (in either source or
+binary form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component itself
+accompanies the executable.
+
+If distribution of executable or object code is made by offering access to
+copy from a designated place, then offering equivalent access to copy the
+source code from the same place counts as distribution of the source code,
+even though third parties are not compelled to copy the source along with
+the object code.
+
+4. You may not copy, modify, sublicense, or distribute the Program except
+as expressly provided under this License. Any attempt otherwise to copy, modify,
+sublicense or distribute the Program is void, and will automatically terminate
+your rights under this License. However, parties who have received copies,
+or rights, from you under this License will not have their licenses terminated
+so long as such parties remain in full compliance.
+
+5. You are not required to accept this License, since you have not signed
+it. However, nothing else grants you permission to modify or distribute the
+Program or its derivative works. These actions are prohibited by law if you
+do not accept this License. Therefore, by modifying or distributing the Program
+(or any work based on the Program), you indicate your acceptance of this License
+to do so, and all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+6. Each time you redistribute the Program (or any work based on the Program),
+the recipient automatically receives a license from the original licensor
+to copy, distribute or modify the Program subject to these terms and conditions.
+You may not impose any further restrictions on the recipients' exercise of
+the rights granted herein. You are not responsible for enforcing compliance
+by third parties to this License.
+
+7. If, as a consequence of a court judgment or allegation of patent infringement
+or for any other reason (not limited to patent issues), conditions are imposed
+on you (whether by court order, agreement or otherwise) that contradict the
+conditions of this License, they do not excuse you from the conditions of
+this License. If you cannot distribute so as to satisfy simultaneously your
+obligations under this License and any other pertinent obligations, then as
+a consequence you may not distribute the Program at all. For example, if a
+patent license would not permit royalty-free redistribution of the Program
+by all those who receive copies directly or indirectly through you, then the
+only way you could satisfy both it and this License would be to refrain entirely
+from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply and
+the section as a whole is intended to apply in other circumstances.
+
+It is not the purpose of this section to induce you to infringe any patents
+or other property right claims or to contest validity of any such claims;
+this section has the sole purpose of protecting the integrity of the free
+software distribution system, which is implemented by public license practices.
+Many people have made generous contributions to the wide range of software
+distributed through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing to
+distribute software through any other system and a licensee cannot impose
+that choice.
+
+This section is intended to make thoroughly clear what is believed to be a
+consequence of the rest of this License.
+
+8. If the distribution and/or use of the Program is restricted in certain
+countries either by patents or by copyrighted interfaces, the original copyright
+holder who places the Program under this License may add an explicit geographical
+distribution limitation excluding those countries, so that distribution is
+permitted only in or among countries not thus excluded. In such case, this
+License incorporates the limitation as if written in the body of this License.
+
+9. The Free Software Foundation may publish revised and/or new versions of
+the General Public License from time to time. Such new versions will be similar
+in spirit to the present version, but may differ in detail to address new
+problems or concerns.
+
+Each version is given a distinguishing version number. If the Program specifies
+a version number of this License which applies to it and "any later version",
+you have the option of following the terms and conditions either of that version
+or of any later version published by the Free Software Foundation. If the
+Program does not specify a version number of this License, you may choose
+any version ever published by the Free Software Foundation.
+
+10. If you wish to incorporate parts of the Program into other free programs
+whose distribution conditions are different, write to the author to ask for
+permission. For software which is copyrighted by the Free Software Foundation,
+write to the Free Software Foundation; we sometimes make exceptions for this.
+Our decision will be guided by the two goals of preserving the free status
+of all derivatives of our free software and of promoting the sharing and reuse
+of software generally.
+
+   NO WARRANTY
+
+11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR
+THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE
+STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM
+"AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
+OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE
+THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE
+OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA
+OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES
+OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH
+HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+END OF TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Programs
+
+If you develop a new program, and you want it to be of the greatest possible
+use to the public, the best way to achieve this is to make it free software
+which everyone can redistribute and change under these terms.
+
+To do so, attach the following notices to the program. It is safest to attach
+them to the start of each source file to most effectively convey the exclusion
+of warranty; and each file should have at least the "copyright" line and a
+pointer to where the full notice is found.
+
+<one line to give the program's name and an idea of what it does.>
+
+Copyright (C)< yyyy> <name of author>
+
+This program is free software; you can redistribute it and/or modify it under
+the terms of the GNU General Public License as published by the Free Software
+Foundation; either version 2 of the License, or (at your option) any later
+version.
+
+This program is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+
+You should have received a copy of the GNU General Public License along with
+this program; if not, write to the Free Software Foundation, Inc., 51 Franklin
+Street, Fifth Floor, Boston, MA 02110-1301, USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this when
+it starts in an interactive mode:
+
+Gnomovision version 69, Copyright (C) year name of author Gnomovision comes
+with ABSOLUTELY NO WARRANTY; for details type `show w'. This is free software,
+and you are welcome to redistribute it under certain conditions; type `show
+c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License. Of course, the commands you use may be
+called something other than `show w' and `show c'; they could even be mouse-clicks
+or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your school,
+if any, to sign a "copyright disclaimer" for the program, if necessary. Here
+is a sample; alter the names:
+
+Yoyodyne, Inc., hereby disclaims all copyright interest in the program `Gnomovision'
+(which makes passes at compilers) written by James Hacker.
+
+<signature of Ty Coon >, 1 April 1989 Ty Coon, President of Vice This General
+Public License does not permit incorporating your program into proprietary
+programs. If your program is a subroutine library, you may consider it more
+useful to permit linking proprietary applications with the library. If this
+is what you want to do, use the GNU Lesser General Public License instead
+of this License.
diff --git a/meta/files/common-licenses/GPL-2.0-or-later b/meta/files/common-licenses/GPL-2.0-or-later
new file mode 100644
index 0000000000..1d80ac3653
--- /dev/null
+++ b/meta/files/common-licenses/GPL-2.0-or-later
@@ -0,0 +1,319 @@
+GNU GENERAL PUBLIC LICENSE
+
+Version 2, June 1991
+
+Copyright (C) 1989, 1991 Free Software Foundation, Inc. 
+
+51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+Preamble
+
+The licenses for most software are designed to take away your freedom to share
+and change it. By contrast, the GNU General Public License is intended to
+guarantee your freedom to share and change free software--to make sure the
+software is free for all its users. This General Public License applies to
+most of the Free Software Foundation's software and to any other program whose
+authors commit to using it. (Some other Free Software Foundation software
+is covered by the GNU Lesser General Public License instead.) You can apply
+it to your programs, too.
+
+When we speak of free software, we are referring to freedom, not price. Our
+General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for this service if you
+wish), that you receive source code or can get it if you want it, that you
+can change the software or use pieces of it in new free programs; and that
+you know you can do these things.
+
+To protect your rights, we need to make restrictions that forbid anyone to
+deny you these rights or to ask you to surrender the rights. These restrictions
+translate to certain responsibilities for you if you distribute copies of
+the software, or if you modify it.
+
+For example, if you distribute copies of such a program, whether gratis or
+for a fee, you must give the recipients all the rights that you have. You
+must make sure that they, too, receive or can get the source code. And you
+must show them these terms so they know their rights.
+
+We protect your rights with two steps: (1) copyright the software, and (2)
+offer you this license which gives you legal permission to copy, distribute
+and/or modify the software.
+
+Also, for each author's protection and ours, we want to make certain that
+everyone understands that there is no warranty for this free software. If
+the software is modified by someone else and passed on, we want its recipients
+to know that what they have is not the original, so that any problems introduced
+by others will not reflect on the original authors' reputations.
+
+Finally, any free program is threatened constantly by software patents. We
+wish to avoid the danger that redistributors of a free program will individually
+obtain patent licenses, in effect making the program proprietary. To prevent
+this, we have made it clear that any patent must be licensed for everyone's
+free use or not licensed at all.
+
+The precise terms and conditions for copying, distribution and modification
+follow.
+
+TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+0. This License applies to any program or other work which contains a notice
+placed by the copyright holder saying it may be distributed under the terms
+of this General Public License. The "Program", below, refers to any such program
+or work, and a "work based on the Program" means either the Program or any
+derivative work under copyright law: that is to say, a work containing the
+Program or a portion of it, either verbatim or with modifications and/or translated
+into another language. (Hereinafter, translation is included without limitation
+in the term "modification".) Each licensee is addressed as "you".
+
+Activities other than copying, distribution and modification are not covered
+by this License; they are outside its scope. The act of running the Program
+is not restricted, and the output from the Program is covered only if its
+contents constitute a work based on the Program (independent of having been
+made by running the Program). Whether that is true depends on what the Program
+does.
+
+1. You may copy and distribute verbatim copies of the Program's source code
+as you receive it, in any medium, provided that you conspicuously and appropriately
+publish on each copy an appropriate copyright notice and disclaimer of warranty;
+keep intact all the notices that refer to this License and to the absence
+of any warranty; and give any other recipients of the Program a copy of this
+License along with the Program.
+
+You may charge a fee for the physical act of transferring a copy, and you
+may at your option offer warranty protection in exchange for a fee.
+
+2. You may modify your copy or copies of the Program or any portion of it,
+thus forming a work based on the Program, and copy and distribute such modifications
+or work under the terms of Section 1 above, provided that you also meet all
+of these conditions:
+
+a) You must cause the modified files to carry prominent notices stating that
+you changed the files and the date of any change.
+
+b) You must cause any work that you distribute or publish, that in whole or
+in part contains or is derived from the Program or any part thereof, to be
+licensed as a whole at no charge to all third parties under the terms of this
+License.
+
+c) If the modified program normally reads commands interactively when run,
+you must cause it, when started running for such interactive use in the most
+ordinary way, to print or display an announcement including an appropriate
+copyright notice and a notice that there is no warranty (or else, saying that
+you provide a warranty) and that users may redistribute the program under
+these conditions, and telling the user how to view a copy of this License.
+(Exception: if the Program itself is interactive but does not normally print
+such an announcement, your work based on the Program is not required to print
+an announcement.)
+
+These requirements apply to the modified work as a whole. If identifiable
+sections of that work are not derived from the Program, and can be reasonably
+considered independent and separate works in themselves, then this License,
+and its terms, do not apply to those sections when you distribute them as
+separate works. But when you distribute the same sections as part of a whole
+which is a work based on the Program, the distribution of the whole must be
+on the terms of this License, whose permissions for other licensees extend
+to the entire whole, and thus to each and every part regardless of who wrote
+it.
+
+Thus, it is not the intent of this section to claim rights or contest your
+rights to work written entirely by you; rather, the intent is to exercise
+the right to control the distribution of derivative or collective works based
+on the Program.
+
+In addition, mere aggregation of another work not based on the Program with
+the Program (or with a work based on the Program) on a volume of a storage
+or distribution medium does not bring the other work under the scope of this
+License.
+
+3. You may copy and distribute the Program (or a work based on it, under Section
+2) in object code or executable form under the terms of Sections 1 and 2 above
+provided that you also do one of the following:
+
+a) Accompany it with the complete corresponding machine-readable source code,
+which must be distributed under the terms of Sections 1 and 2 above on a medium
+customarily used for software interchange; or,
+
+b) Accompany it with a written offer, valid for at least three years, to give
+any third party, for a charge no more than your cost of physically performing
+source distribution, a complete machine-readable copy of the corresponding
+source code, to be distributed under the terms of Sections 1 and 2 above on
+a medium customarily used for software interchange; or,
+
+c) Accompany it with the information you received as to the offer to distribute
+corresponding source code. (This alternative is allowed only for noncommercial
+distribution and only if you received the program in object code or executable
+form with such an offer, in accord with Subsection b above.)
+
+The source code for a work means the preferred form of the work for making
+modifications to it. For an executable work, complete source code means all
+the source code for all modules it contains, plus any associated interface
+definition files, plus the scripts used to control compilation and installation
+of the executable. However, as a special exception, the source code distributed
+need not include anything that is normally distributed (in either source or
+binary form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component itself
+accompanies the executable.
+
+If distribution of executable or object code is made by offering access to
+copy from a designated place, then offering equivalent access to copy the
+source code from the same place counts as distribution of the source code,
+even though third parties are not compelled to copy the source along with
+the object code.
+
+4. You may not copy, modify, sublicense, or distribute the Program except
+as expressly provided under this License. Any attempt otherwise to copy, modify,
+sublicense or distribute the Program is void, and will automatically terminate
+your rights under this License. However, parties who have received copies,
+or rights, from you under this License will not have their licenses terminated
+so long as such parties remain in full compliance.
+
+5. You are not required to accept this License, since you have not signed
+it. However, nothing else grants you permission to modify or distribute the
+Program or its derivative works. These actions are prohibited by law if you
+do not accept this License. Therefore, by modifying or distributing the Program
+(or any work based on the Program), you indicate your acceptance of this License
+to do so, and all its terms and conditions for copying, distributing or modifying
+the Program or works based on it.
+
+6. Each time you redistribute the Program (or any work based on the Program),
+the recipient automatically receives a license from the original licensor
+to copy, distribute or modify the Program subject to these terms and conditions.
+You may not impose any further restrictions on the recipients' exercise of
+the rights granted herein. You are not responsible for enforcing compliance
+by third parties to this License.
+
+7. If, as a consequence of a court judgment or allegation of patent infringement
+or for any other reason (not limited to patent issues), conditions are imposed
+on you (whether by court order, agreement or otherwise) that contradict the
+conditions of this License, they do not excuse you from the conditions of
+this License. If you cannot distribute so as to satisfy simultaneously your
+obligations under this License and any other pertinent obligations, then as
+a consequence you may not distribute the Program at all. For example, if a
+patent license would not permit royalty-free redistribution of the Program
+by all those who receive copies directly or indirectly through you, then the
+only way you could satisfy both it and this License would be to refrain entirely
+from distribution of the Program.
+
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply and
+the section as a whole is intended to apply in other circumstances.
+
+It is not the purpose of this section to induce you to infringe any patents
+or other property right claims or to contest validity of any such claims;
+this section has the sole purpose of protecting the integrity of the free
+software distribution system, which is implemented by public license practices.
+Many people have made generous contributions to the wide range of software
+distributed through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing to
+distribute software through any other system and a licensee cannot impose
+that choice.
+
+This section is intended to make thoroughly clear what is believed to be a
+consequence of the rest of this License.
+
+8. If the distribution and/or use of the Program is restricted in certain
+countries either by patents or by copyrighted interfaces, the original copyright
+holder who places the Program under this License may add an explicit geographical
+distribution limitation excluding those countries, so that distribution is
+permitted only in or among countries not thus excluded. In such case, this
+License incorporates the limitation as if written in the body of this License.
+
+9. The Free Software Foundation may publish revised and/or new versions of
+the General Public License from time to time. Such new versions will be similar
+in spirit to the present version, but may differ in detail to address new
+problems or concerns.
+
+Each version is given a distinguishing version number. If the Program specifies
+a version number of this License which applies to it and "any later version",
+you have the option of following the terms and conditions either of that version
+or of any later version published by the Free Software Foundation. If the
+Program does not specify a version number of this License, you may choose
+any version ever published by the Free Software Foundation.
+
+10. If you wish to incorporate parts of the Program into other free programs
+whose distribution conditions are different, write to the author to ask for
+permission. For software which is copyrighted by the Free Software Foundation,
+write to the Free Software Foundation; we sometimes make exceptions for this.
+Our decision will be guided by the two goals of preserving the free status
+of all derivatives of our free software and of promoting the sharing and reuse
+of software generally.
+
+   NO WARRANTY
+
+11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR
+THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE
+STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM
+"AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
+OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE
+THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE
+OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA
+OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES
+OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH
+HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+END OF TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Programs
+
+If you develop a new program, and you want it to be of the greatest possible
+use to the public, the best way to achieve this is to make it free software
+which everyone can redistribute and change under these terms.
+
+To do so, attach the following notices to the program. It is safest to attach
+them to the start of each source file to most effectively convey the exclusion
+of warranty; and each file should have at least the "copyright" line and a
+pointer to where the full notice is found.
+
+<one line to give the program's name and an idea of what it does.>
+
+Copyright (C) <yyyy> <name of author>
+
+This program is free software; you can redistribute it and/or modify it under
+the terms of the GNU General Public License as published by the Free Software
+Foundation; either version 2 of the License, or (at your option) any later
+version.
+
+This program is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+
+You should have received a copy of the GNU General Public License along with
+this program; if not, write to the Free Software Foundation, Inc., 51 Franklin
+Street, Fifth Floor, Boston, MA 02110-1301, USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program is interactive, make it output a short notice like this when
+it starts in an interactive mode:
+
+Gnomovision version 69, Copyright (C) year name of author Gnomovision comes
+with ABSOLUTELY NO WARRANTY; for details type `show w'. This is free software,
+and you are welcome to redistribute it under certain conditions; type `show
+c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License. Of course, the commands you use may be
+called something other than `show w' and `show c'; they could even be mouse-clicks
+or menu items--whatever suits your program.
+
+You should also get your employer (if you work as a programmer) or your school,
+if any, to sign a "copyright disclaimer" for the program, if necessary. Here
+is a sample; alter the names:
+
+Yoyodyne, Inc., hereby disclaims all copyright interest in the program `Gnomovision'
+(which makes passes at compilers) written by James Hacker.
+
+<signature of Ty Coon>, 1 April 1989 Ty Coon, President of Vice This General
+Public License does not permit incorporating your program into proprietary
+programs. If your program is a subroutine library, you may consider it more
+useful to permit linking proprietary applications with the library. If this
+is what you want to do, use the GNU Lesser General Public License instead
+of this License.
diff --git a/meta/files/common-licenses/GPL-3.0 b/meta/files/common-licenses/GPL-3.0
deleted file mode 100644
index e0665a64a8..0000000000
--- a/meta/files/common-licenses/GPL-3.0
+++ /dev/null
@@ -1,225 +0,0 @@
-GNU GENERAL PUBLIC LICENSE
-
-Version 3, 29 June 2007
-
-Copyright © 2007 Free Software Foundation, Inc. <http://fsf.org/>
-
-Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.
-Preamble
-
-The GNU General Public License is a free, copyleft license for software and other kinds of works.
-
-The licenses for most software and other practical works are designed to take away your freedom to share and change the works. By contrast, the GNU General Public License is intended to guarantee your freedom to share and change all versions of a program--to make sure it remains free software for all its users. We, the Free Software Foundation, use the GNU General Public License for most of our software; it applies also to any other work released this way by its authors. You can apply it to your programs, too.
-
-When we speak of free software, we are referring to freedom, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for them if you wish), that you receive source code or can get it if you want it, that you can change the software or use pieces of it in new free programs, and that you know you can do these things.
-
-To protect your rights, we need to prevent others from denying you these rights or asking you to surrender the rights. Therefore, you have certain responsibilities if you distribute copies of the software, or if you modify it: responsibilities to respect the freedom of others.
-
-For example, if you distribute copies of such a program, whether gratis or for a fee, you must pass on to the recipients the same freedoms that you received. You must make sure that they, too, receive or can get the source code. And you must show them these terms so they know their rights.
-
-Developers that use the GNU GPL protect your rights with two steps: (1) assert copyright on the software, and (2) offer you this License giving you legal permission to copy, distribute and/or modify it.
-
-For the developers' and authors' protection, the GPL clearly explains that there is no warranty for this free software. For both users' and authors' sake, the GPL requires that modified versions be marked as changed, so that their problems will not be attributed erroneously to authors of previous versions.
-
-Some devices are designed to deny users access to install or run modified versions of the software inside them, although the manufacturer can do so. This is fundamentally incompatible with the aim of protecting users' freedom to change the software. The systematic pattern of such abuse occurs in the area of products for individuals to use, which is precisely where it is most unacceptable. Therefore, we have designed this version of the GPL to prohibit the practice for those products. If such problems arise substantially in other domains, we stand ready to extend this provision to those domains in future versions of the GPL, as needed to protect the freedom of users.
-
-Finally, every program is threatened constantly by software patents. States should not allow patents to restrict development and use of software on general-purpose computers, but in those that do, we wish to avoid the special danger that patents applied to a free program could make it effectively proprietary. To prevent this, the GPL assures that patents cannot be used to render the program non-free.
-
-The precise terms and conditions for copying, distribution and modification follow.
-TERMS AND CONDITIONS
-0. Definitions.
-
-“This License” refers to version 3 of the GNU General Public License.
-
-“Copyright” also means copyright-like laws that apply to other kinds of works, such as semiconductor masks.
-
-“The Program” refers to any copyrightable work licensed under this License. Each licensee is addressed as “you”. “Licensees” and “recipients” may be individuals or organizations.
-
-To “modify” a work means to copy from or adapt all or part of the work in a fashion requiring copyright permission, other than the making of an exact copy. The resulting work is called a “modified version” of the earlier work or a work “based on” the earlier work.
-
-A “covered work” means either the unmodified Program or a work based on the Program.
-
-To “propagate” a work means to do anything with it that, without permission, would make you directly or secondarily liable for infringement under applicable copyright law, except executing it on a computer or modifying a private copy. Propagation includes copying, distribution (with or without modification), making available to the public, and in some countries other activities as well.
-
-To “convey” a work means any kind of propagation that enables other parties to make or receive copies. Mere interaction with a user through a computer network, with no transfer of a copy, is not conveying.
-
-An interactive user interface displays “Appropriate Legal Notices” to the extent that it includes a convenient and prominently visible feature that (1) displays an appropriate copyright notice, and (2) tells the user that there is no warranty for the work (except to the extent that warranties are provided), that licensees may convey the work under this License, and how to view a copy of this License. If the interface presents a list of user commands or options, such as a menu, a prominent item in the list meets this criterion.
-1. Source Code.
-
-The “source code” for a work means the preferred form of the work for making modifications to it. “Object code” means any non-source form of a work.
-
-A “Standard Interface” means an interface that either is an official standard defined by a recognized standards body, or, in the case of interfaces specified for a particular programming language, one that is widely used among developers working in that language.
-
-The “System Libraries” of an executable work include anything, other than the work as a whole, that (a) is included in the normal form of packaging a Major Component, but which is not part of that Major Component, and (b) serves only to enable use of the work with that Major Component, or to implement a Standard Interface for which an implementation is available to the public in source code form. A “Major Component”, in this context, means a major essential component (kernel, window system, and so on) of the specific operating system (if any) on which the executable work runs, or a compiler used to produce the work, or an object code interpreter used to run it.
-
-The “Corresponding Source” for a work in object code form means all the source code needed to generate, install, and (for an executable work) run the object code and to modify the work, including scripts to control those activities. However, it does not include the work's System Libraries, or general-purpose tools or generally available free programs which are used unmodified in performing those activities but which are not part of the work. For example, Corresponding Source includes interface definition files associated with source files for the work, and the source code for shared libraries and dynamically linked subprograms that the work is specifically designed to require, such as by intimate data communication or control flow between those subprograms and other parts of the work.
-
-The Corresponding Source need not include anything that users can regenerate automatically from other parts of the Corresponding Source.
-
-The Corresponding Source for a work in source code form is that same work.
-2. Basic Permissions.
-
-All rights granted under this License are granted for the term of copyright on the Program, and are irrevocable provided the stated conditions are met. This License explicitly affirms your unlimited permission to run the unmodified Program. The output from running a covered work is covered by this License only if the output, given its content, constitutes a covered work. This License acknowledges your rights of fair use or other equivalent, as provided by copyright law.
-
-You may make, run and propagate covered works that you do not convey, without conditions so long as your license otherwise remains in force. You may convey covered works to others for the sole purpose of having them make modifications exclusively for you, or provide you with facilities for running those works, provided that you comply with the terms of this License in conveying all material for which you do not control copyright. Those thus making or running the covered works for you must do so exclusively on your behalf, under your direction and control, on terms that prohibit them from making any copies of your copyrighted material outside their relationship with you.
-
-Conveying under any other circumstances is permitted solely under the conditions stated below. Sublicensing is not allowed; section 10 makes it unnecessary.
-3. Protecting Users' Legal Rights From Anti-Circumvention Law.
-
-No covered work shall be deemed part of an effective technological measure under any applicable law fulfilling obligations under article 11 of the WIPO copyright treaty adopted on 20 December 1996, or similar laws prohibiting or restricting circumvention of such measures.
-
-When you convey a covered work, you waive any legal power to forbid circumvention of technological measures to the extent such circumvention is effected by exercising rights under this License with respect to the covered work, and you disclaim any intention to limit operation or modification of the work as a means of enforcing, against the work's users, your or third parties' legal rights to forbid circumvention of technological measures.
-4. Conveying Verbatim Copies.
-
-You may convey verbatim copies of the Program's source code as you receive it, in any medium, provided that you conspicuously and appropriately publish on each copy an appropriate copyright notice; keep intact all notices stating that this License and any non-permissive terms added in accord with section 7 apply to the code; keep intact all notices of the absence of any warranty; and give all recipients a copy of this License along with the Program.
-
-You may charge any price or no price for each copy that you convey, and you may offer support or warranty protection for a fee.
-5. Conveying Modified Source Versions.
-
-You may convey a work based on the Program, or the modifications to produce it from the Program, in the form of source code under the terms of section 4, provided that you also meet all of these conditions:
-
-    * a) The work must carry prominent notices stating that you modified it, and giving a relevant date.
-    * b) The work must carry prominent notices stating that it is released under this License and any conditions added under section 7. This requirement modifies the requirement in section 4 to “keep intact all notices”.
-    * c) You must license the entire work, as a whole, under this License to anyone who comes into possession of a copy. This License will therefore apply, along with any applicable section 7 additional terms, to the whole of the work, and all its parts, regardless of how they are packaged. This License gives no permission to license the work in any other way, but it does not invalidate such permission if you have separately received it.
-    * d) If the work has interactive user interfaces, each must display Appropriate Legal Notices; however, if the Program has interactive interfaces that do not display Appropriate Legal Notices, your work need not make them do so.
-
-A compilation of a covered work with other separate and independent works, which are not by their nature extensions of the covered work, and which are not combined with it such as to form a larger program, in or on a volume of a storage or distribution medium, is called an “aggregate” if the compilation and its resulting copyright are not used to limit the access or legal rights of the compilation's users beyond what the individual works permit. Inclusion of a covered work in an aggregate does not cause this License to apply to the other parts of the aggregate.
-6. Conveying Non-Source Forms.
-
-You may convey a covered work in object code form under the terms of sections 4 and 5, provided that you also convey the machine-readable Corresponding Source under the terms of this License, in one of these ways:
-
-    * a) Convey the object code in, or embodied in, a physical product (including a physical distribution medium), accompanied by the Corresponding Source fixed on a durable physical medium customarily used for software interchange.
-    * b) Convey the object code in, or embodied in, a physical product (including a physical distribution medium), accompanied by a written offer, valid for at least three years and valid for as long as you offer spare parts or customer support for that product model, to give anyone who possesses the object code either (1) a copy of the Corresponding Source for all the software in the product that is covered by this License, on a durable physical medium customarily used for software interchange, for a price no more than your reasonable cost of physically performing this conveying of source, or (2) access to copy the Corresponding Source from a network server at no charge.
-    * c) Convey individual copies of the object code with a copy of the written offer to provide the Corresponding Source. This alternative is allowed only occasionally and noncommercially, and only if you received the object code with such an offer, in accord with subsection 6b.
-    * d) Convey the object code by offering access from a designated place (gratis or for a charge), and offer equivalent access to the Corresponding Source in the same way through the same place at no further charge. You need not require recipients to copy the Corresponding Source along with the object code. If the place to copy the object code is a network server, the Corresponding Source may be on a different server (operated by you or a third party) that supports equivalent copying facilities, provided you maintain clear directions next to the object code saying where to find the Corresponding Source. Regardless of what server hosts the Corresponding Source, you remain obligated to ensure that it is available for as long as needed to satisfy these requirements.
-    * e) Convey the object code using peer-to-peer transmission, provided you inform other peers where the object code and Corresponding Source of the work are being offered to the general public at no charge under subsection 6d.
-
-A separable portion of the object code, whose source code is excluded from the Corresponding Source as a System Library, need not be included in conveying the object code work.
-
-A “User Product” is either (1) a “consumer product”, which means any tangible personal property which is normally used for personal, family, or household purposes, or (2) anything designed or sold for incorporation into a dwelling. In determining whether a product is a consumer product, doubtful cases shall be resolved in favor of coverage. For a particular product received by a particular user, “normally used” refers to a typical or common use of that class of product, regardless of the status of the particular user or of the way in which the particular user actually uses, or expects or is expected to use, the product. A product is a consumer product regardless of whether the product has substantial commercial, industrial or non-consumer uses, unless such uses represent the only significant mode of use of the product.
-
-“Installation Information” for a User Product means any methods, procedures, authorization keys, or other information required to install and execute modified versions of a covered work in that User Product from a modified version of its Corresponding Source. The information must suffice to ensure that the continued functioning of the modified object code is in no case prevented or interfered with solely because modification has been made.
-
-If you convey an object code work under this section in, or with, or specifically for use in, a User Product, and the conveying occurs as part of a transaction in which the right of possession and use of the User Product is transferred to the recipient in perpetuity or for a fixed term (regardless of how the transaction is characterized), the Corresponding Source conveyed under this section must be accompanied by the Installation Information. But this requirement does not apply if neither you nor any third party retains the ability to install modified object code on the User Product (for example, the work has been installed in ROM).
-
-The requirement to provide Installation Information does not include a requirement to continue to provide support service, warranty, or updates for a work that has been modified or installed by the recipient, or for the User Product in which it has been modified or installed. Access to a network may be denied when the modification itself materially and adversely affects the operation of the network or violates the rules and protocols for communication across the network.
-
-Corresponding Source conveyed, and Installation Information provided, in accord with this section must be in a format that is publicly documented (and with an implementation available to the public in source code form), and must require no special password or key for unpacking, reading or copying.
-7. Additional Terms.
-
-“Additional permissions” are terms that supplement the terms of this License by making exceptions from one or more of its conditions. Additional permissions that are applicable to the entire Program shall be treated as though they were included in this License, to the extent that they are valid under applicable law. If additional permissions apply only to part of the Program, that part may be used separately under those permissions, but the entire Program remains governed by this License without regard to the additional permissions.
-
-When you convey a copy of a covered work, you may at your option remove any additional permissions from that copy, or from any part of it. (Additional permissions may be written to require their own removal in certain cases when you modify the work.) You may place additional permissions on material, added by you to a covered work, for which you have or can give appropriate copyright permission.
-
-Notwithstanding any other provision of this License, for material you add to a covered work, you may (if authorized by the copyright holders of that material) supplement the terms of this License with terms:
-
-    * a) Disclaiming warranty or limiting liability differently from the terms of sections 15 and 16 of this License; or
-    * b) Requiring preservation of specified reasonable legal notices or author attributions in that material or in the Appropriate Legal Notices displayed by works containing it; or
-    * c) Prohibiting misrepresentation of the origin of that material, or requiring that modified versions of such material be marked in reasonable ways as different from the original version; or
-    * d) Limiting the use for publicity purposes of names of licensors or authors of the material; or
-    * e) Declining to grant rights under trademark law for use of some trade names, trademarks, or service marks; or
-    * f) Requiring indemnification of licensors and authors of that material by anyone who conveys the material (or modified versions of it) with contractual assumptions of liability to the recipient, for any liability that these contractual assumptions directly impose on those licensors and authors.
-
-All other non-permissive additional terms are considered “further restrictions” within the meaning of section 10. If the Program as you received it, or any part of it, contains a notice stating that it is governed by this License along with a term that is a further restriction, you may remove that term. If a license document contains a further restriction but permits relicensing or conveying under this License, you may add to a covered work material governed by the terms of that license document, provided that the further restriction does not survive such relicensing or conveying.
-
-If you add terms to a covered work in accord with this section, you must place, in the relevant source files, a statement of the additional terms that apply to those files, or a notice indicating where to find the applicable terms.
-
-Additional terms, permissive or non-permissive, may be stated in the form of a separately written license, or stated as exceptions; the above requirements apply either way.
-8. Termination.
-
-You may not propagate or modify a covered work except as expressly provided under this License. Any attempt otherwise to propagate or modify it is void, and will automatically terminate your rights under this License (including any patent licenses granted under the third paragraph of section 11).
-
-However, if you cease all violation of this License, then your license from a particular copyright holder is reinstated (a) provisionally, unless and until the copyright holder explicitly and finally terminates your license, and (b) permanently, if the copyright holder fails to notify you of the violation by some reasonable means prior to 60 days after the cessation.
-
-Moreover, your license from a particular copyright holder is reinstated permanently if the copyright holder notifies you of the violation by some reasonable means, this is the first time you have received notice of violation of this License (for any work) from that copyright holder, and you cure the violation prior to 30 days after your receipt of the notice.
-
-Termination of your rights under this section does not terminate the licenses of parties who have received copies or rights from you under this License. If your rights have been terminated and not permanently reinstated, you do not qualify to receive new licenses for the same material under section 10.
-9. Acceptance Not Required for Having Copies.
-
-You are not required to accept this License in order to receive or run a copy of the Program. Ancillary propagation of a covered work occurring solely as a consequence of using peer-to-peer transmission to receive a copy likewise does not require acceptance. However, nothing other than this License grants you permission to propagate or modify any covered work. These actions infringe copyright if you do not accept this License. Therefore, by modifying or propagating a covered work, you indicate your acceptance of this License to do so.
-10. Automatic Licensing of Downstream Recipients.
-
-Each time you convey a covered work, the recipient automatically receives a license from the original licensors, to run, modify and propagate that work, subject to this License. You are not responsible for enforcing compliance by third parties with this License.
-
-An “entity transaction” is a transaction transferring control of an organization, or substantially all assets of one, or subdividing an organization, or merging organizations. If propagation of a covered work results from an entity transaction, each party to that transaction who receives a copy of the work also receives whatever licenses to the work the party's predecessor in interest had or could give under the previous paragraph, plus a right to possession of the Corresponding Source of the work from the predecessor in interest, if the predecessor has it or can get it with reasonable efforts.
-
-You may not impose any further restrictions on the exercise of the rights granted or affirmed under this License. For example, you may not impose a license fee, royalty, or other charge for exercise of rights granted under this License, and you may not initiate litigation (including a cross-claim or counterclaim in a lawsuit) alleging that any patent claim is infringed by making, using, selling, offering for sale, or importing the Program or any portion of it.
-11. Patents.
-
-A “contributor” is a copyright holder who authorizes use under this License of the Program or a work on which the Program is based. The work thus licensed is called the contributor's “contributor version”.
-
-A contributor's “essential patent claims” are all patent claims owned or controlled by the contributor, whether already acquired or hereafter acquired, that would be infringed by some manner, permitted by this License, of making, using, or selling its contributor version, but do not include claims that would be infringed only as a consequence of further modification of the contributor version. For purposes of this definition, “control” includes the right to grant patent sublicenses in a manner consistent with the requirements of this License.
-
-Each contributor grants you a non-exclusive, worldwide, royalty-free patent license under the contributor's essential patent claims, to make, use, sell, offer for sale, import and otherwise run, modify and propagate the contents of its contributor version.
-
-In the following three paragraphs, a “patent license” is any express agreement or commitment, however denominated, not to enforce a patent (such as an express permission to practice a patent or covenant not to sue for patent infringement). To “grant” such a patent license to a party means to make such an agreement or commitment not to enforce a patent against the party.
-
-If you convey a covered work, knowingly relying on a patent license, and the Corresponding Source of the work is not available for anyone to copy, free of charge and under the terms of this License, through a publicly available network server or other readily accessible means, then you must either (1) cause the Corresponding Source to be so available, or (2) arrange to deprive yourself of the benefit of the patent license for this particular work, or (3) arrange, in a manner consistent with the requirements of this License, to extend the patent license to downstream recipients. “Knowingly relying” means you have actual knowledge that, but for the patent license, your conveying the covered work in a country, or your recipient's use of the covered work in a country, would infringe one or more identifiable patents in that country that you have reason to believe are valid.
-
-If, pursuant to or in connection with a single transaction or arrangement, you convey, or propagate by procuring conveyance of, a covered work, and grant a patent license to some of the parties receiving the covered work authorizing them to use, propagate, modify or convey a specific copy of the covered work, then the patent license you grant is automatically extended to all recipients of the covered work and works based on it.
-
-A patent license is “discriminatory” if it does not include within the scope of its coverage, prohibits the exercise of, or is conditioned on the non-exercise of one or more of the rights that are specifically granted under this License. You may not convey a covered work if you are a party to an arrangement with a third party that is in the business of distributing software, under which you make payment to the third party based on the extent of your activity of conveying the work, and under which the third party grants, to any of the parties who would receive the covered work from you, a discriminatory patent license (a) in connection with copies of the covered work conveyed by you (or copies made from those copies), or (b) primarily for and in connection with specific products or compilations that contain the covered work, unless you entered into that arrangement, or that patent license was granted, prior to 28 March 2007.
-
-Nothing in this License shall be construed as excluding or limiting any implied license or other defenses to infringement that may otherwise be available to you under applicable patent law.
-12. No Surrender of Others' Freedom.
-
-If conditions are imposed on you (whether by court order, agreement or otherwise) that contradict the conditions of this License, they do not excuse you from the conditions of this License. If you cannot convey a covered work so as to satisfy simultaneously your obligations under this License and any other pertinent obligations, then as a consequence you may not convey it at all. For example, if you agree to terms that obligate you to collect a royalty for further conveying from those to whom you convey the Program, the only way you could satisfy both those terms and this License would be to refrain entirely from conveying the Program.
-13. Use with the GNU Affero General Public License.
-
-Notwithstanding any other provision of this License, you have permission to link or combine any covered work with a work licensed under version 3 of the GNU Affero General Public License into a single combined work, and to convey the resulting work. The terms of this License will continue to apply to the part which is the covered work, but the special requirements of the GNU Affero General Public License, section 13, concerning interaction through a network will apply to the combination as such.
-14. Revised Versions of this License.
-
-The Free Software Foundation may publish revised and/or new versions of the GNU General Public License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns.
-
-Each version is given a distinguishing version number. If the Program specifies that a certain numbered version of the GNU General Public License “or any later version” applies to it, you have the option of following the terms and conditions either of that numbered version or of any later version published by the Free Software Foundation. If the Program does not specify a version number of the GNU General Public License, you may choose any version ever published by the Free Software Foundation.
-
-If the Program specifies that a proxy can decide which future versions of the GNU General Public License can be used, that proxy's public statement of acceptance of a version permanently authorizes you to choose that version for the Program.
-
-Later license versions may give you additional or different permissions. However, no additional obligations are imposed on any author or copyright holder as a result of your choosing to follow a later version.
-15. Disclaimer of Warranty.
-
-THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
-16. Limitation of Liability.
-
-IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
-17. Interpretation of Sections 15 and 16.
-
-If the disclaimer of warranty and limitation of liability provided above cannot be given local legal effect according to their terms, reviewing courts shall apply local law that most closely approximates an absolute waiver of all civil liability in connection with the Program, unless a warranty or assumption of liability accompanies a copy of the Program in return for a fee.
-
-END OF TERMS AND CONDITIONS
-How to Apply These Terms to Your New Programs
-
-If you develop a new program, and you want it to be of the greatest possible use to the public, the best way to achieve this is to make it free software which everyone can redistribute and change under these terms.
-
-To do so, attach the following notices to the program. It is safest to attach them to the start of each source file to most effectively state the exclusion of warranty; and each file should have at least the “copyright” line and a pointer to where the full notice is found.
-
-    <one line to give the program's name and a brief idea of what it does.>
-    Copyright (C) <year>  <name of author>
-
-    This program is free software: you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation, either version 3 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.
-
-Also add information on how to contact you by electronic and paper mail.
-
-If the program does terminal interaction, make it output a short notice like this when it starts in an interactive mode:
-
-    <program>  Copyright (C) <year>  <name of author>
-    This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
-    This is free software, and you are welcome to redistribute it
-    under certain conditions; type `show c' for details.
-
-The hypothetical commands `show w' and `show c' should show the appropriate parts of the General Public License. Of course, your program's commands might be different; for a GUI interface, you would use an “about box”.
-
-You should also get your employer (if you work as a programmer) or school, if any, to sign a “copyright disclaimer” for the program, if necessary. For more information on this, and how to apply and follow the GNU GPL, see <http://www.gnu.org/licenses/>.
-
-The GNU General Public License does not permit incorporating your program into proprietary programs. If your program is a subroutine library, you may consider it more useful to permit linking proprietary applications with the library. If this is what you want to do, use the GNU Lesser General Public License instead of this License. But first, please read <http://www.gnu.org/philosophy/why-not-lgpl.html>.
diff --git a/meta/files/common-licenses/GPL-3.0-only b/meta/files/common-licenses/GPL-3.0-only
new file mode 100644
index 0000000000..e142a525bd
--- /dev/null
+++ b/meta/files/common-licenses/GPL-3.0-only
@@ -0,0 +1,625 @@
+GNU GENERAL PUBLIC LICENSE
+
+Version 3, 29 June 2007
+
+Copyright © 2007 Free Software Foundation, Inc. <https://fsf.org/>
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+Preamble
+
+The GNU General Public License is a free, copyleft license for software and
+other kinds of works.
+
+The licenses for most software and other practical works are designed to take
+away your freedom to share and change the works. By contrast, the GNU General
+Public License is intended to guarantee your freedom to share and change all
+versions of a program--to make sure it remains free software for all its users.
+We, the Free Software Foundation, use the GNU General Public License for most
+of our software; it applies also to any other work released this way by its
+authors. You can apply it to your programs, too.
+
+When we speak of free software, we are referring to freedom, not price. Our
+General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for them if you wish), that
+you receive source code or can get it if you want it, that you can change
+the software or use pieces of it in new free programs, and that you know you
+can do these things.
+
+To protect your rights, we need to prevent others from denying you these rights
+or asking you to surrender the rights. Therefore, you have certain responsibilities
+if you distribute copies of the software, or if you modify it: responsibilities
+to respect the freedom of others.
+
+For example, if you distribute copies of such a program, whether gratis or
+for a fee, you must pass on to the recipients the same freedoms that you received.
+You must make sure that they, too, receive or can get the source code. And
+you must show them these terms so they know their rights.
+
+Developers that use the GNU GPL protect your rights with two steps: (1) assert
+copyright on the software, and (2) offer you this License giving you legal
+permission to copy, distribute and/or modify it.
+
+For the developers' and authors' protection, the GPL clearly explains that
+there is no warranty for this free software. For both users' and authors'
+sake, the GPL requires that modified versions be marked as changed, so that
+their problems will not be attributed erroneously to authors of previous versions.
+
+Some devices are designed to deny users access to install or run modified
+versions of the software inside them, although the manufacturer can do so.
+This is fundamentally incompatible with the aim of protecting users' freedom
+to change the software. The systematic pattern of such abuse occurs in the
+area of products for individuals to use, which is precisely where it is most
+unacceptable. Therefore, we have designed this version of the GPL to prohibit
+the practice for those products. If such problems arise substantially in other
+domains, we stand ready to extend this provision to those domains in future
+versions of the GPL, as needed to protect the freedom of users.
+
+Finally, every program is threatened constantly by software patents. States
+should not allow patents to restrict development and use of software on general-purpose
+computers, but in those that do, we wish to avoid the special danger that
+patents applied to a free program could make it effectively proprietary. To
+prevent this, the GPL assures that patents cannot be used to render the program
+non-free.
+
+The precise terms and conditions for copying, distribution and modification
+follow.
+
+TERMS AND CONDITIONS
+
+   0. Definitions.
+
+   "This License" refers to version 3 of the GNU General Public License.
+
+"Copyright" also means copyright-like laws that apply to other kinds of works,
+such as semiconductor masks.
+
+"The Program" refers to any copyrightable work licensed under this License.
+Each licensee is addressed as "you". "Licensees" and "recipients" may be individuals
+or organizations.
+
+To "modify" a work means to copy from or adapt all or part of the work in
+a fashion requiring copyright permission, other than the making of an exact
+copy. The resulting work is called a "modified version" of the earlier work
+or a work "based on" the earlier work.
+
+A "covered work" means either the unmodified Program or a work based on the
+Program.
+
+To "propagate" a work means to do anything with it that, without permission,
+would make you directly or secondarily liable for infringement under applicable
+copyright law, except executing it on a computer or modifying a private copy.
+Propagation includes copying, distribution (with or without modification),
+making available to the public, and in some countries other activities as
+well.
+
+To "convey" a work means any kind of propagation that enables other parties
+to make or receive copies. Mere interaction with a user through a computer
+network, with no transfer of a copy, is not conveying.
+
+An interactive user interface displays "Appropriate Legal Notices" to the
+extent that it includes a convenient and prominently visible feature that
+(1) displays an appropriate copyright notice, and (2) tells the user that
+there is no warranty for the work (except to the extent that warranties are
+provided), that licensees may convey the work under this License, and how
+to view a copy of this License. If the interface presents a list of user commands
+or options, such as a menu, a prominent item in the list meets this criterion.
+
+   1. Source Code.
+
+The "source code" for a work means the preferred form of the work for making
+modifications to it. "Object code" means any non-source form of a work.
+
+A "Standard Interface" means an interface that either is an official standard
+defined by a recognized standards body, or, in the case of interfaces specified
+for a particular programming language, one that is widely used among developers
+working in that language.
+
+The "System Libraries" of an executable work include anything, other than
+the work as a whole, that (a) is included in the normal form of packaging
+a Major Component, but which is not part of that Major Component, and (b)
+serves only to enable use of the work with that Major Component, or to implement
+a Standard Interface for which an implementation is available to the public
+in source code form. A "Major Component", in this context, means a major essential
+component (kernel, window system, and so on) of the specific operating system
+(if any) on which the executable work runs, or a compiler used to produce
+the work, or an object code interpreter used to run it.
+
+The "Corresponding Source" for a work in object code form means all the source
+code needed to generate, install, and (for an executable work) run the object
+code and to modify the work, including scripts to control those activities.
+However, it does not include the work's System Libraries, or general-purpose
+tools or generally available free programs which are used unmodified in performing
+those activities but which are not part of the work. For example, Corresponding
+Source includes interface definition files associated with source files for
+the work, and the source code for shared libraries and dynamically linked
+subprograms that the work is specifically designed to require, such as by
+intimate data communication or control flow between those subprograms and
+other parts of the work.
+
+The Corresponding Source need not include anything that users can regenerate
+automatically from other parts of the Corresponding Source.
+
+   The Corresponding Source for a work in source code form is that same work.
+
+   2. Basic Permissions.
+
+All rights granted under this License are granted for the term of copyright
+on the Program, and are irrevocable provided the stated conditions are met.
+This License explicitly affirms your unlimited permission to run the unmodified
+Program. The output from running a covered work is covered by this License
+only if the output, given its content, constitutes a covered work. This License
+acknowledges your rights of fair use or other equivalent, as provided by copyright
+law.
+
+You may make, run and propagate covered works that you do not convey, without
+conditions so long as your license otherwise remains in force. You may convey
+covered works to others for the sole purpose of having them make modifications
+exclusively for you, or provide you with facilities for running those works,
+provided that you comply with the terms of this License in conveying all material
+for which you do not control copyright. Those thus making or running the covered
+works for you must do so exclusively on your behalf, under your direction
+and control, on terms that prohibit them from making any copies of your copyrighted
+material outside their relationship with you.
+
+Conveying under any other circumstances is permitted solely under the conditions
+stated below. Sublicensing is not allowed; section 10 makes it unnecessary.
+
+   3. Protecting Users' Legal Rights From Anti-Circumvention Law.
+
+No covered work shall be deemed part of an effective technological measure
+under any applicable law fulfilling obligations under article 11 of the WIPO
+copyright treaty adopted on 20 December 1996, or similar laws prohibiting
+or restricting circumvention of such measures.
+
+When you convey a covered work, you waive any legal power to forbid circumvention
+of technological measures to the extent such circumvention is effected by
+exercising rights under this License with respect to the covered work, and
+you disclaim any intention to limit operation or modification of the work
+as a means of enforcing, against the work's users, your or third parties'
+legal rights to forbid circumvention of technological measures.
+
+   4. Conveying Verbatim Copies.
+
+You may convey verbatim copies of the Program's source code as you receive
+it, in any medium, provided that you conspicuously and appropriately publish
+on each copy an appropriate copyright notice; keep intact all notices stating
+that this License and any non-permissive terms added in accord with section
+7 apply to the code; keep intact all notices of the absence of any warranty;
+and give all recipients a copy of this License along with the Program.
+
+You may charge any price or no price for each copy that you convey, and you
+may offer support or warranty protection for a fee.
+
+   5. Conveying Modified Source Versions.
+
+You may convey a work based on the Program, or the modifications to produce
+it from the Program, in the form of source code under the terms of section
+4, provided that you also meet all of these conditions:
+
+a) The work must carry prominent notices stating that you modified it, and
+giving a relevant date.
+
+b) The work must carry prominent notices stating that it is released under
+this License and any conditions added under section 7. This requirement modifies
+the requirement in section 4 to "keep intact all notices".
+
+c) You must license the entire work, as a whole, under this License to anyone
+who comes into possession of a copy. This License will therefore apply, along
+with any applicable section 7 additional terms, to the whole of the work,
+and all its parts, regardless of how they are packaged. This License gives
+no permission to license the work in any other way, but it does not invalidate
+such permission if you have separately received it.
+
+d) If the work has interactive user interfaces, each must display Appropriate
+Legal Notices; however, if the Program has interactive interfaces that do
+not display Appropriate Legal Notices, your work need not make them do so.
+
+A compilation of a covered work with other separate and independent works,
+which are not by their nature extensions of the covered work, and which are
+not combined with it such as to form a larger program, in or on a volume of
+a storage or distribution medium, is called an "aggregate" if the compilation
+and its resulting copyright are not used to limit the access or legal rights
+of the compilation's users beyond what the individual works permit. Inclusion
+of a covered work in an aggregate does not cause this License to apply to
+the other parts of the aggregate.
+
+   6. Conveying Non-Source Forms.
+
+You may convey a covered work in object code form under the terms of sections
+4 and 5, provided that you also convey the machine-readable Corresponding
+Source under the terms of this License, in one of these ways:
+
+a) Convey the object code in, or embodied in, a physical product (including
+a physical distribution medium), accompanied by the Corresponding Source fixed
+on a durable physical medium customarily used for software interchange.
+
+b) Convey the object code in, or embodied in, a physical product (including
+a physical distribution medium), accompanied by a written offer, valid for
+at least three years and valid for as long as you offer spare parts or customer
+support for that product model, to give anyone who possesses the object code
+either (1) a copy of the Corresponding Source for all the software in the
+product that is covered by this License, on a durable physical medium customarily
+used for software interchange, for a price no more than your reasonable cost
+of physically performing this conveying of source, or (2) access to copy the
+Corresponding Source from a network server at no charge.
+
+c) Convey individual copies of the object code with a copy of the written
+offer to provide the Corresponding Source. This alternative is allowed only
+occasionally and noncommercially, and only if you received the object code
+with such an offer, in accord with subsection 6b.
+
+d) Convey the object code by offering access from a designated place (gratis
+or for a charge), and offer equivalent access to the Corresponding Source
+in the same way through the same place at no further charge. You need not
+require recipients to copy the Corresponding Source along with the object
+code. If the place to copy the object code is a network server, the Corresponding
+Source may be on a different server (operated by you or a third party) that
+supports equivalent copying facilities, provided you maintain clear directions
+next to the object code saying where to find the Corresponding Source. Regardless
+of what server hosts the Corresponding Source, you remain obligated to ensure
+that it is available for as long as needed to satisfy these requirements.
+
+e) Convey the object code using peer-to-peer transmission, provided you inform
+other peers where the object code and Corresponding Source of the work are
+being offered to the general public at no charge under subsection 6d.
+
+A separable portion of the object code, whose source code is excluded from
+the Corresponding Source as a System Library, need not be included in conveying
+the object code work.
+
+A "User Product" is either (1) a "consumer product", which means any tangible
+personal property which is normally used for personal, family, or household
+purposes, or (2) anything designed or sold for incorporation into a dwelling.
+In determining whether a product is a consumer product, doubtful cases shall
+be resolved in favor of coverage. For a particular product received by a particular
+user, "normally used" refers to a typical or common use of that class of product,
+regardless of the status of the particular user or of the way in which the
+particular user actually uses, or expects or is expected to use, the product.
+A product is a consumer product regardless of whether the product has substantial
+commercial, industrial or non-consumer uses, unless such uses represent the
+only significant mode of use of the product.
+
+"Installation Information" for a User Product means any methods, procedures,
+authorization keys, or other information required to install and execute modified
+versions of a covered work in that User Product from a modified version of
+its Corresponding Source. The information must suffice to ensure that the
+continued functioning of the modified object code is in no case prevented
+or interfered with solely because modification has been made.
+
+If you convey an object code work under this section in, or with, or specifically
+for use in, a User Product, and the conveying occurs as part of a transaction
+in which the right of possession and use of the User Product is transferred
+to the recipient in perpetuity or for a fixed term (regardless of how the
+transaction is characterized), the Corresponding Source conveyed under this
+section must be accompanied by the Installation Information. But this requirement
+does not apply if neither you nor any third party retains the ability to install
+modified object code on the User Product (for example, the work has been installed
+in ROM).
+
+The requirement to provide Installation Information does not include a requirement
+to continue to provide support service, warranty, or updates for a work that
+has been modified or installed by the recipient, or for the User Product in
+which it has been modified or installed. Access to a network may be denied
+when the modification itself materially and adversely affects the operation
+of the network or violates the rules and protocols for communication across
+the network.
+
+Corresponding Source conveyed, and Installation Information provided, in accord
+with this section must be in a format that is publicly documented (and with
+an implementation available to the public in source code form), and must require
+no special password or key for unpacking, reading or copying.
+
+   7. Additional Terms.
+
+"Additional permissions" are terms that supplement the terms of this License
+by making exceptions from one or more of its conditions. Additional permissions
+that are applicable to the entire Program shall be treated as though they
+were included in this License, to the extent that they are valid under applicable
+law. If additional permissions apply only to part of the Program, that part
+may be used separately under those permissions, but the entire Program remains
+governed by this License without regard to the additional permissions.
+
+When you convey a copy of a covered work, you may at your option remove any
+additional permissions from that copy, or from any part of it. (Additional
+permissions may be written to require their own removal in certain cases when
+you modify the work.) You may place additional permissions on material, added
+by you to a covered work, for which you have or can give appropriate copyright
+permission.
+
+Notwithstanding any other provision of this License, for material you add
+to a covered work, you may (if authorized by the copyright holders of that
+material) supplement the terms of this License with terms:
+
+a) Disclaiming warranty or limiting liability differently from the terms of
+sections 15 and 16 of this License; or
+
+b) Requiring preservation of specified reasonable legal notices or author
+attributions in that material or in the Appropriate Legal Notices displayed
+by works containing it; or
+
+c) Prohibiting misrepresentation of the origin of that material, or requiring
+that modified versions of such material be marked in reasonable ways as different
+from the original version; or
+
+d) Limiting the use for publicity purposes of names of licensors or authors
+of the material; or
+
+e) Declining to grant rights under trademark law for use of some trade names,
+trademarks, or service marks; or
+
+f) Requiring indemnification of licensors and authors of that material by
+anyone who conveys the material (or modified versions of it) with contractual
+assumptions of liability to the recipient, for any liability that these contractual
+assumptions directly impose on those licensors and authors.
+
+All other non-permissive additional terms are considered "further restrictions"
+within the meaning of section 10. If the Program as you received it, or any
+part of it, contains a notice stating that it is governed by this License
+along with a term that is a further restriction, you may remove that term.
+If a license document contains a further restriction but permits relicensing
+or conveying under this License, you may add to a covered work material governed
+by the terms of that license document, provided that the further restriction
+does not survive such relicensing or conveying.
+
+If you add terms to a covered work in accord with this section, you must place,
+in the relevant source files, a statement of the additional terms that apply
+to those files, or a notice indicating where to find the applicable terms.
+
+Additional terms, permissive or non-permissive, may be stated in the form
+of a separately written license, or stated as exceptions; the above requirements
+apply either way.
+
+   8. Termination.
+
+You may not propagate or modify a covered work except as expressly provided
+under this License. Any attempt otherwise to propagate or modify it is void,
+and will automatically terminate your rights under this License (including
+any patent licenses granted under the third paragraph of section 11).
+
+However, if you cease all violation of this License, then your license from
+a particular copyright holder is reinstated (a) provisionally, unless and
+until the copyright holder explicitly and finally terminates your license,
+and (b) permanently, if the copyright holder fails to notify you of the violation
+by some reasonable means prior to 60 days after the cessation.
+
+Moreover, your license from a particular copyright holder is reinstated permanently
+if the copyright holder notifies you of the violation by some reasonable means,
+this is the first time you have received notice of violation of this License
+(for any work) from that copyright holder, and you cure the violation prior
+to 30 days after your receipt of the notice.
+
+Termination of your rights under this section does not terminate the licenses
+of parties who have received copies or rights from you under this License.
+If your rights have been terminated and not permanently reinstated, you do
+not qualify to receive new licenses for the same material under section 10.
+
+   9. Acceptance Not Required for Having Copies.
+
+You are not required to accept this License in order to receive or run a copy
+of the Program. Ancillary propagation of a covered work occurring solely as
+a consequence of using peer-to-peer transmission to receive a copy likewise
+does not require acceptance. However, nothing other than this License grants
+you permission to propagate or modify any covered work. These actions infringe
+copyright if you do not accept this License. Therefore, by modifying or propagating
+a covered work, you indicate your acceptance of this License to do so.
+
+   10. Automatic Licensing of Downstream Recipients.
+
+Each time you convey a covered work, the recipient automatically receives
+a license from the original licensors, to run, modify and propagate that work,
+subject to this License. You are not responsible for enforcing compliance
+by third parties with this License.
+
+An "entity transaction" is a transaction transferring control of an organization,
+or substantially all assets of one, or subdividing an organization, or merging
+organizations. If propagation of a covered work results from an entity transaction,
+each party to that transaction who receives a copy of the work also receives
+whatever licenses to the work the party's predecessor in interest had or could
+give under the previous paragraph, plus a right to possession of the Corresponding
+Source of the work from the predecessor in interest, if the predecessor has
+it or can get it with reasonable efforts.
+
+You may not impose any further restrictions on the exercise of the rights
+granted or affirmed under this License. For example, you may not impose a
+license fee, royalty, or other charge for exercise of rights granted under
+this License, and you may not initiate litigation (including a cross-claim
+or counterclaim in a lawsuit) alleging that any patent claim is infringed
+by making, using, selling, offering for sale, or importing the Program or
+any portion of it.
+
+   11. Patents.
+
+A "contributor" is a copyright holder who authorizes use under this License
+of the Program or a work on which the Program is based. The work thus licensed
+is called the contributor's "contributor version".
+
+A contributor's "essential patent claims" are all patent claims owned or controlled
+by the contributor, whether already acquired or hereafter acquired, that would
+be infringed by some manner, permitted by this License, of making, using,
+or selling its contributor version, but do not include claims that would be
+infringed only as a consequence of further modification of the contributor
+version. For purposes of this definition, "control" includes the right to
+grant patent sublicenses in a manner consistent with the requirements of this
+License.
+
+Each contributor grants you a non-exclusive, worldwide, royalty-free patent
+license under the contributor's essential patent claims, to make, use, sell,
+offer for sale, import and otherwise run, modify and propagate the contents
+of its contributor version.
+
+In the following three paragraphs, a "patent license" is any express agreement
+or commitment, however denominated, not to enforce a patent (such as an express
+permission to practice a patent or covenant not to sue for patent infringement).
+To "grant" such a patent license to a party means to make such an agreement
+or commitment not to enforce a patent against the party.
+
+If you convey a covered work, knowingly relying on a patent license, and the
+Corresponding Source of the work is not available for anyone to copy, free
+of charge and under the terms of this License, through a publicly available
+network server or other readily accessible means, then you must either (1)
+cause the Corresponding Source to be so available, or (2) arrange to deprive
+yourself of the benefit of the patent license for this particular work, or
+(3) arrange, in a manner consistent with the requirements of this License,
+to extend the patent license to downstream recipients. "Knowingly relying"
+means you have actual knowledge that, but for the patent license, your conveying
+the covered work in a country, or your recipient's use of the covered work
+in a country, would infringe one or more identifiable patents in that country
+that you have reason to believe are valid.
+
+If, pursuant to or in connection with a single transaction or arrangement,
+you convey, or propagate by procuring conveyance of, a covered work, and grant
+a patent license to some of the parties receiving the covered work authorizing
+them to use, propagate, modify or convey a specific copy of the covered work,
+then the patent license you grant is automatically extended to all recipients
+of the covered work and works based on it.
+
+A patent license is "discriminatory" if it does not include within the scope
+of its coverage, prohibits the exercise of, or is conditioned on the non-exercise
+of one or more of the rights that are specifically granted under this License.
+You may not convey a covered work if you are a party to an arrangement with
+a third party that is in the business of distributing software, under which
+you make payment to the third party based on the extent of your activity of
+conveying the work, and under which the third party grants, to any of the
+parties who would receive the covered work from you, a discriminatory patent
+license (a) in connection with copies of the covered work conveyed by you
+(or copies made from those copies), or (b) primarily for and in connection
+with specific products or compilations that contain the covered work, unless
+you entered into that arrangement, or that patent license was granted, prior
+to 28 March 2007.
+
+Nothing in this License shall be construed as excluding or limiting any implied
+license or other defenses to infringement that may otherwise be available
+to you under applicable patent law.
+
+   12. No Surrender of Others' Freedom.
+
+If conditions are imposed on you (whether by court order, agreement or otherwise)
+that contradict the conditions of this License, they do not excuse you from
+the conditions of this License. If you cannot convey a covered work so as
+to satisfy simultaneously your obligations under this License and any other
+pertinent obligations, then as a consequence you may not convey it at all.
+For example, if you agree to terms that obligate you to collect a royalty
+for further conveying from those to whom you convey the Program, the only
+way you could satisfy both those terms and this License would be to refrain
+entirely from conveying the Program.
+
+   13. Use with the GNU Affero General Public License.
+
+Notwithstanding any other provision of this License, you have permission to
+link or combine any covered work with a work licensed under version 3 of the
+GNU Affero General Public License into a single combined work, and to convey
+the resulting work. The terms of this License will continue to apply to the
+part which is the covered work, but the special requirements of the GNU Affero
+General Public License, section 13, concerning interaction through a network
+will apply to the combination as such.
+
+   14. Revised Versions of this License.
+
+The Free Software Foundation may publish revised and/or new versions of the
+GNU General Public License from time to time. Such new versions will be similar
+in spirit to the present version, but may differ in detail to address new
+problems or concerns.
+
+Each version is given a distinguishing version number. If the Program specifies
+that a certain numbered version of the GNU General Public License "or any
+later version" applies to it, you have the option of following the terms and
+conditions either of that numbered version or of any later version published
+by the Free Software Foundation. If the Program does not specify a version
+number of the GNU General Public License, you may choose any version ever
+published by the Free Software Foundation.
+
+If the Program specifies that a proxy can decide which future versions of
+the GNU General Public License can be used, that proxy's public statement
+of acceptance of a version permanently authorizes you to choose that version
+for the Program.
+
+Later license versions may give you additional or different permissions. However,
+no additional obligations are imposed on any author or copyright holder as
+a result of your choosing to follow a later version.
+
+   15. Disclaimer of Warranty.
+
+THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE
+LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
+EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM
+PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR
+CORRECTION.
+
+   16. Limitation of Liability.
+
+IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL
+ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM
+AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL,
+INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO
+USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
+INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE
+PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER
+PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+   17. Interpretation of Sections 15 and 16.
+
+If the disclaimer of warranty and limitation of liability provided above cannot
+be given local legal effect according to their terms, reviewing courts shall
+apply local law that most closely approximates an absolute waiver of all civil
+liability in connection with the Program, unless a warranty or assumption
+of liability accompanies a copy of the Program in return for a fee. END OF
+TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Programs
+
+If you develop a new program, and you want it to be of the greatest possible
+use to the public, the best way to achieve this is to make it free software
+which everyone can redistribute and change under these terms.
+
+To do so, attach the following notices to the program. It is safest to attach
+them to the start of each source file to most effectively state the exclusion
+of warranty; and each file should have at least the "copyright" line and a
+pointer to where the full notice is found.
+
+<one line to give the program's name and a brief idea of what it does.>
+
+Copyright (C) <year> <name of author>
+
+This program is free software: you can redistribute it and/or modify it under
+the terms of the GNU General Public License as published by the Free Software
+Foundation, either version 3 of the License, or (at your option) any later
+version.
+
+This program is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+
+You should have received a copy of the GNU General Public License along with
+this program. If not, see <https://www.gnu.org/licenses/>.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program does terminal interaction, make it output a short notice like
+this when it starts in an interactive mode:
+
+<program> Copyright (C) <year> <name of author>
+
+This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+
+This is free software, and you are welcome to redistribute it under certain
+conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License. Of course, your program's commands might
+be different; for a GUI interface, you would use an "about box".
+
+You should also get your employer (if you work as a programmer) or school,
+if any, to sign a "copyright disclaimer" for the program, if necessary. For
+more information on this, and how to apply and follow the GNU GPL, see <https://www.gnu.org/licenses/>.
+
+The GNU General Public License does not permit incorporating your program
+into proprietary programs. If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library. If this is what you want to do, use the GNU Lesser General Public
+License instead of this License. But first, please read <https://www.gnu.org/
+licenses /why-not-lgpl.html>.
diff --git a/meta/files/common-licenses/GPL-3.0-or-later b/meta/files/common-licenses/GPL-3.0-or-later
new file mode 100644
index 0000000000..e142a525bd
--- /dev/null
+++ b/meta/files/common-licenses/GPL-3.0-or-later
@@ -0,0 +1,625 @@
+GNU GENERAL PUBLIC LICENSE
+
+Version 3, 29 June 2007
+
+Copyright © 2007 Free Software Foundation, Inc. <https://fsf.org/>
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+Preamble
+
+The GNU General Public License is a free, copyleft license for software and
+other kinds of works.
+
+The licenses for most software and other practical works are designed to take
+away your freedom to share and change the works. By contrast, the GNU General
+Public License is intended to guarantee your freedom to share and change all
+versions of a program--to make sure it remains free software for all its users.
+We, the Free Software Foundation, use the GNU General Public License for most
+of our software; it applies also to any other work released this way by its
+authors. You can apply it to your programs, too.
+
+When we speak of free software, we are referring to freedom, not price. Our
+General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for them if you wish), that
+you receive source code or can get it if you want it, that you can change
+the software or use pieces of it in new free programs, and that you know you
+can do these things.
+
+To protect your rights, we need to prevent others from denying you these rights
+or asking you to surrender the rights. Therefore, you have certain responsibilities
+if you distribute copies of the software, or if you modify it: responsibilities
+to respect the freedom of others.
+
+For example, if you distribute copies of such a program, whether gratis or
+for a fee, you must pass on to the recipients the same freedoms that you received.
+You must make sure that they, too, receive or can get the source code. And
+you must show them these terms so they know their rights.
+
+Developers that use the GNU GPL protect your rights with two steps: (1) assert
+copyright on the software, and (2) offer you this License giving you legal
+permission to copy, distribute and/or modify it.
+
+For the developers' and authors' protection, the GPL clearly explains that
+there is no warranty for this free software. For both users' and authors'
+sake, the GPL requires that modified versions be marked as changed, so that
+their problems will not be attributed erroneously to authors of previous versions.
+
+Some devices are designed to deny users access to install or run modified
+versions of the software inside them, although the manufacturer can do so.
+This is fundamentally incompatible with the aim of protecting users' freedom
+to change the software. The systematic pattern of such abuse occurs in the
+area of products for individuals to use, which is precisely where it is most
+unacceptable. Therefore, we have designed this version of the GPL to prohibit
+the practice for those products. If such problems arise substantially in other
+domains, we stand ready to extend this provision to those domains in future
+versions of the GPL, as needed to protect the freedom of users.
+
+Finally, every program is threatened constantly by software patents. States
+should not allow patents to restrict development and use of software on general-purpose
+computers, but in those that do, we wish to avoid the special danger that
+patents applied to a free program could make it effectively proprietary. To
+prevent this, the GPL assures that patents cannot be used to render the program
+non-free.
+
+The precise terms and conditions for copying, distribution and modification
+follow.
+
+TERMS AND CONDITIONS
+
+   0. Definitions.
+
+   "This License" refers to version 3 of the GNU General Public License.
+
+"Copyright" also means copyright-like laws that apply to other kinds of works,
+such as semiconductor masks.
+
+"The Program" refers to any copyrightable work licensed under this License.
+Each licensee is addressed as "you". "Licensees" and "recipients" may be individuals
+or organizations.
+
+To "modify" a work means to copy from or adapt all or part of the work in
+a fashion requiring copyright permission, other than the making of an exact
+copy. The resulting work is called a "modified version" of the earlier work
+or a work "based on" the earlier work.
+
+A "covered work" means either the unmodified Program or a work based on the
+Program.
+
+To "propagate" a work means to do anything with it that, without permission,
+would make you directly or secondarily liable for infringement under applicable
+copyright law, except executing it on a computer or modifying a private copy.
+Propagation includes copying, distribution (with or without modification),
+making available to the public, and in some countries other activities as
+well.
+
+To "convey" a work means any kind of propagation that enables other parties
+to make or receive copies. Mere interaction with a user through a computer
+network, with no transfer of a copy, is not conveying.
+
+An interactive user interface displays "Appropriate Legal Notices" to the
+extent that it includes a convenient and prominently visible feature that
+(1) displays an appropriate copyright notice, and (2) tells the user that
+there is no warranty for the work (except to the extent that warranties are
+provided), that licensees may convey the work under this License, and how
+to view a copy of this License. If the interface presents a list of user commands
+or options, such as a menu, a prominent item in the list meets this criterion.
+
+   1. Source Code.
+
+The "source code" for a work means the preferred form of the work for making
+modifications to it. "Object code" means any non-source form of a work.
+
+A "Standard Interface" means an interface that either is an official standard
+defined by a recognized standards body, or, in the case of interfaces specified
+for a particular programming language, one that is widely used among developers
+working in that language.
+
+The "System Libraries" of an executable work include anything, other than
+the work as a whole, that (a) is included in the normal form of packaging
+a Major Component, but which is not part of that Major Component, and (b)
+serves only to enable use of the work with that Major Component, or to implement
+a Standard Interface for which an implementation is available to the public
+in source code form. A "Major Component", in this context, means a major essential
+component (kernel, window system, and so on) of the specific operating system
+(if any) on which the executable work runs, or a compiler used to produce
+the work, or an object code interpreter used to run it.
+
+The "Corresponding Source" for a work in object code form means all the source
+code needed to generate, install, and (for an executable work) run the object
+code and to modify the work, including scripts to control those activities.
+However, it does not include the work's System Libraries, or general-purpose
+tools or generally available free programs which are used unmodified in performing
+those activities but which are not part of the work. For example, Corresponding
+Source includes interface definition files associated with source files for
+the work, and the source code for shared libraries and dynamically linked
+subprograms that the work is specifically designed to require, such as by
+intimate data communication or control flow between those subprograms and
+other parts of the work.
+
+The Corresponding Source need not include anything that users can regenerate
+automatically from other parts of the Corresponding Source.
+
+   The Corresponding Source for a work in source code form is that same work.
+
+   2. Basic Permissions.
+
+All rights granted under this License are granted for the term of copyright
+on the Program, and are irrevocable provided the stated conditions are met.
+This License explicitly affirms your unlimited permission to run the unmodified
+Program. The output from running a covered work is covered by this License
+only if the output, given its content, constitutes a covered work. This License
+acknowledges your rights of fair use or other equivalent, as provided by copyright
+law.
+
+You may make, run and propagate covered works that you do not convey, without
+conditions so long as your license otherwise remains in force. You may convey
+covered works to others for the sole purpose of having them make modifications
+exclusively for you, or provide you with facilities for running those works,
+provided that you comply with the terms of this License in conveying all material
+for which you do not control copyright. Those thus making or running the covered
+works for you must do so exclusively on your behalf, under your direction
+and control, on terms that prohibit them from making any copies of your copyrighted
+material outside their relationship with you.
+
+Conveying under any other circumstances is permitted solely under the conditions
+stated below. Sublicensing is not allowed; section 10 makes it unnecessary.
+
+   3. Protecting Users' Legal Rights From Anti-Circumvention Law.
+
+No covered work shall be deemed part of an effective technological measure
+under any applicable law fulfilling obligations under article 11 of the WIPO
+copyright treaty adopted on 20 December 1996, or similar laws prohibiting
+or restricting circumvention of such measures.
+
+When you convey a covered work, you waive any legal power to forbid circumvention
+of technological measures to the extent such circumvention is effected by
+exercising rights under this License with respect to the covered work, and
+you disclaim any intention to limit operation or modification of the work
+as a means of enforcing, against the work's users, your or third parties'
+legal rights to forbid circumvention of technological measures.
+
+   4. Conveying Verbatim Copies.
+
+You may convey verbatim copies of the Program's source code as you receive
+it, in any medium, provided that you conspicuously and appropriately publish
+on each copy an appropriate copyright notice; keep intact all notices stating
+that this License and any non-permissive terms added in accord with section
+7 apply to the code; keep intact all notices of the absence of any warranty;
+and give all recipients a copy of this License along with the Program.
+
+You may charge any price or no price for each copy that you convey, and you
+may offer support or warranty protection for a fee.
+
+   5. Conveying Modified Source Versions.
+
+You may convey a work based on the Program, or the modifications to produce
+it from the Program, in the form of source code under the terms of section
+4, provided that you also meet all of these conditions:
+
+a) The work must carry prominent notices stating that you modified it, and
+giving a relevant date.
+
+b) The work must carry prominent notices stating that it is released under
+this License and any conditions added under section 7. This requirement modifies
+the requirement in section 4 to "keep intact all notices".
+
+c) You must license the entire work, as a whole, under this License to anyone
+who comes into possession of a copy. This License will therefore apply, along
+with any applicable section 7 additional terms, to the whole of the work,
+and all its parts, regardless of how they are packaged. This License gives
+no permission to license the work in any other way, but it does not invalidate
+such permission if you have separately received it.
+
+d) If the work has interactive user interfaces, each must display Appropriate
+Legal Notices; however, if the Program has interactive interfaces that do
+not display Appropriate Legal Notices, your work need not make them do so.
+
+A compilation of a covered work with other separate and independent works,
+which are not by their nature extensions of the covered work, and which are
+not combined with it such as to form a larger program, in or on a volume of
+a storage or distribution medium, is called an "aggregate" if the compilation
+and its resulting copyright are not used to limit the access or legal rights
+of the compilation's users beyond what the individual works permit. Inclusion
+of a covered work in an aggregate does not cause this License to apply to
+the other parts of the aggregate.
+
+   6. Conveying Non-Source Forms.
+
+You may convey a covered work in object code form under the terms of sections
+4 and 5, provided that you also convey the machine-readable Corresponding
+Source under the terms of this License, in one of these ways:
+
+a) Convey the object code in, or embodied in, a physical product (including
+a physical distribution medium), accompanied by the Corresponding Source fixed
+on a durable physical medium customarily used for software interchange.
+
+b) Convey the object code in, or embodied in, a physical product (including
+a physical distribution medium), accompanied by a written offer, valid for
+at least three years and valid for as long as you offer spare parts or customer
+support for that product model, to give anyone who possesses the object code
+either (1) a copy of the Corresponding Source for all the software in the
+product that is covered by this License, on a durable physical medium customarily
+used for software interchange, for a price no more than your reasonable cost
+of physically performing this conveying of source, or (2) access to copy the
+Corresponding Source from a network server at no charge.
+
+c) Convey individual copies of the object code with a copy of the written
+offer to provide the Corresponding Source. This alternative is allowed only
+occasionally and noncommercially, and only if you received the object code
+with such an offer, in accord with subsection 6b.
+
+d) Convey the object code by offering access from a designated place (gratis
+or for a charge), and offer equivalent access to the Corresponding Source
+in the same way through the same place at no further charge. You need not
+require recipients to copy the Corresponding Source along with the object
+code. If the place to copy the object code is a network server, the Corresponding
+Source may be on a different server (operated by you or a third party) that
+supports equivalent copying facilities, provided you maintain clear directions
+next to the object code saying where to find the Corresponding Source. Regardless
+of what server hosts the Corresponding Source, you remain obligated to ensure
+that it is available for as long as needed to satisfy these requirements.
+
+e) Convey the object code using peer-to-peer transmission, provided you inform
+other peers where the object code and Corresponding Source of the work are
+being offered to the general public at no charge under subsection 6d.
+
+A separable portion of the object code, whose source code is excluded from
+the Corresponding Source as a System Library, need not be included in conveying
+the object code work.
+
+A "User Product" is either (1) a "consumer product", which means any tangible
+personal property which is normally used for personal, family, or household
+purposes, or (2) anything designed or sold for incorporation into a dwelling.
+In determining whether a product is a consumer product, doubtful cases shall
+be resolved in favor of coverage. For a particular product received by a particular
+user, "normally used" refers to a typical or common use of that class of product,
+regardless of the status of the particular user or of the way in which the
+particular user actually uses, or expects or is expected to use, the product.
+A product is a consumer product regardless of whether the product has substantial
+commercial, industrial or non-consumer uses, unless such uses represent the
+only significant mode of use of the product.
+
+"Installation Information" for a User Product means any methods, procedures,
+authorization keys, or other information required to install and execute modified
+versions of a covered work in that User Product from a modified version of
+its Corresponding Source. The information must suffice to ensure that the
+continued functioning of the modified object code is in no case prevented
+or interfered with solely because modification has been made.
+
+If you convey an object code work under this section in, or with, or specifically
+for use in, a User Product, and the conveying occurs as part of a transaction
+in which the right of possession and use of the User Product is transferred
+to the recipient in perpetuity or for a fixed term (regardless of how the
+transaction is characterized), the Corresponding Source conveyed under this
+section must be accompanied by the Installation Information. But this requirement
+does not apply if neither you nor any third party retains the ability to install
+modified object code on the User Product (for example, the work has been installed
+in ROM).
+
+The requirement to provide Installation Information does not include a requirement
+to continue to provide support service, warranty, or updates for a work that
+has been modified or installed by the recipient, or for the User Product in
+which it has been modified or installed. Access to a network may be denied
+when the modification itself materially and adversely affects the operation
+of the network or violates the rules and protocols for communication across
+the network.
+
+Corresponding Source conveyed, and Installation Information provided, in accord
+with this section must be in a format that is publicly documented (and with
+an implementation available to the public in source code form), and must require
+no special password or key for unpacking, reading or copying.
+
+   7. Additional Terms.
+
+"Additional permissions" are terms that supplement the terms of this License
+by making exceptions from one or more of its conditions. Additional permissions
+that are applicable to the entire Program shall be treated as though they
+were included in this License, to the extent that they are valid under applicable
+law. If additional permissions apply only to part of the Program, that part
+may be used separately under those permissions, but the entire Program remains
+governed by this License without regard to the additional permissions.
+
+When you convey a copy of a covered work, you may at your option remove any
+additional permissions from that copy, or from any part of it. (Additional
+permissions may be written to require their own removal in certain cases when
+you modify the work.) You may place additional permissions on material, added
+by you to a covered work, for which you have or can give appropriate copyright
+permission.
+
+Notwithstanding any other provision of this License, for material you add
+to a covered work, you may (if authorized by the copyright holders of that
+material) supplement the terms of this License with terms:
+
+a) Disclaiming warranty or limiting liability differently from the terms of
+sections 15 and 16 of this License; or
+
+b) Requiring preservation of specified reasonable legal notices or author
+attributions in that material or in the Appropriate Legal Notices displayed
+by works containing it; or
+
+c) Prohibiting misrepresentation of the origin of that material, or requiring
+that modified versions of such material be marked in reasonable ways as different
+from the original version; or
+
+d) Limiting the use for publicity purposes of names of licensors or authors
+of the material; or
+
+e) Declining to grant rights under trademark law for use of some trade names,
+trademarks, or service marks; or
+
+f) Requiring indemnification of licensors and authors of that material by
+anyone who conveys the material (or modified versions of it) with contractual
+assumptions of liability to the recipient, for any liability that these contractual
+assumptions directly impose on those licensors and authors.
+
+All other non-permissive additional terms are considered "further restrictions"
+within the meaning of section 10. If the Program as you received it, or any
+part of it, contains a notice stating that it is governed by this License
+along with a term that is a further restriction, you may remove that term.
+If a license document contains a further restriction but permits relicensing
+or conveying under this License, you may add to a covered work material governed
+by the terms of that license document, provided that the further restriction
+does not survive such relicensing or conveying.
+
+If you add terms to a covered work in accord with this section, you must place,
+in the relevant source files, a statement of the additional terms that apply
+to those files, or a notice indicating where to find the applicable terms.
+
+Additional terms, permissive or non-permissive, may be stated in the form
+of a separately written license, or stated as exceptions; the above requirements
+apply either way.
+
+   8. Termination.
+
+You may not propagate or modify a covered work except as expressly provided
+under this License. Any attempt otherwise to propagate or modify it is void,
+and will automatically terminate your rights under this License (including
+any patent licenses granted under the third paragraph of section 11).
+
+However, if you cease all violation of this License, then your license from
+a particular copyright holder is reinstated (a) provisionally, unless and
+until the copyright holder explicitly and finally terminates your license,
+and (b) permanently, if the copyright holder fails to notify you of the violation
+by some reasonable means prior to 60 days after the cessation.
+
+Moreover, your license from a particular copyright holder is reinstated permanently
+if the copyright holder notifies you of the violation by some reasonable means,
+this is the first time you have received notice of violation of this License
+(for any work) from that copyright holder, and you cure the violation prior
+to 30 days after your receipt of the notice.
+
+Termination of your rights under this section does not terminate the licenses
+of parties who have received copies or rights from you under this License.
+If your rights have been terminated and not permanently reinstated, you do
+not qualify to receive new licenses for the same material under section 10.
+
+   9. Acceptance Not Required for Having Copies.
+
+You are not required to accept this License in order to receive or run a copy
+of the Program. Ancillary propagation of a covered work occurring solely as
+a consequence of using peer-to-peer transmission to receive a copy likewise
+does not require acceptance. However, nothing other than this License grants
+you permission to propagate or modify any covered work. These actions infringe
+copyright if you do not accept this License. Therefore, by modifying or propagating
+a covered work, you indicate your acceptance of this License to do so.
+
+   10. Automatic Licensing of Downstream Recipients.
+
+Each time you convey a covered work, the recipient automatically receives
+a license from the original licensors, to run, modify and propagate that work,
+subject to this License. You are not responsible for enforcing compliance
+by third parties with this License.
+
+An "entity transaction" is a transaction transferring control of an organization,
+or substantially all assets of one, or subdividing an organization, or merging
+organizations. If propagation of a covered work results from an entity transaction,
+each party to that transaction who receives a copy of the work also receives
+whatever licenses to the work the party's predecessor in interest had or could
+give under the previous paragraph, plus a right to possession of the Corresponding
+Source of the work from the predecessor in interest, if the predecessor has
+it or can get it with reasonable efforts.
+
+You may not impose any further restrictions on the exercise of the rights
+granted or affirmed under this License. For example, you may not impose a
+license fee, royalty, or other charge for exercise of rights granted under
+this License, and you may not initiate litigation (including a cross-claim
+or counterclaim in a lawsuit) alleging that any patent claim is infringed
+by making, using, selling, offering for sale, or importing the Program or
+any portion of it.
+
+   11. Patents.
+
+A "contributor" is a copyright holder who authorizes use under this License
+of the Program or a work on which the Program is based. The work thus licensed
+is called the contributor's "contributor version".
+
+A contributor's "essential patent claims" are all patent claims owned or controlled
+by the contributor, whether already acquired or hereafter acquired, that would
+be infringed by some manner, permitted by this License, of making, using,
+or selling its contributor version, but do not include claims that would be
+infringed only as a consequence of further modification of the contributor
+version. For purposes of this definition, "control" includes the right to
+grant patent sublicenses in a manner consistent with the requirements of this
+License.
+
+Each contributor grants you a non-exclusive, worldwide, royalty-free patent
+license under the contributor's essential patent claims, to make, use, sell,
+offer for sale, import and otherwise run, modify and propagate the contents
+of its contributor version.
+
+In the following three paragraphs, a "patent license" is any express agreement
+or commitment, however denominated, not to enforce a patent (such as an express
+permission to practice a patent or covenant not to sue for patent infringement).
+To "grant" such a patent license to a party means to make such an agreement
+or commitment not to enforce a patent against the party.
+
+If you convey a covered work, knowingly relying on a patent license, and the
+Corresponding Source of the work is not available for anyone to copy, free
+of charge and under the terms of this License, through a publicly available
+network server or other readily accessible means, then you must either (1)
+cause the Corresponding Source to be so available, or (2) arrange to deprive
+yourself of the benefit of the patent license for this particular work, or
+(3) arrange, in a manner consistent with the requirements of this License,
+to extend the patent license to downstream recipients. "Knowingly relying"
+means you have actual knowledge that, but for the patent license, your conveying
+the covered work in a country, or your recipient's use of the covered work
+in a country, would infringe one or more identifiable patents in that country
+that you have reason to believe are valid.
+
+If, pursuant to or in connection with a single transaction or arrangement,
+you convey, or propagate by procuring conveyance of, a covered work, and grant
+a patent license to some of the parties receiving the covered work authorizing
+them to use, propagate, modify or convey a specific copy of the covered work,
+then the patent license you grant is automatically extended to all recipients
+of the covered work and works based on it.
+
+A patent license is "discriminatory" if it does not include within the scope
+of its coverage, prohibits the exercise of, or is conditioned on the non-exercise
+of one or more of the rights that are specifically granted under this License.
+You may not convey a covered work if you are a party to an arrangement with
+a third party that is in the business of distributing software, under which
+you make payment to the third party based on the extent of your activity of
+conveying the work, and under which the third party grants, to any of the
+parties who would receive the covered work from you, a discriminatory patent
+license (a) in connection with copies of the covered work conveyed by you
+(or copies made from those copies), or (b) primarily for and in connection
+with specific products or compilations that contain the covered work, unless
+you entered into that arrangement, or that patent license was granted, prior
+to 28 March 2007.
+
+Nothing in this License shall be construed as excluding or limiting any implied
+license or other defenses to infringement that may otherwise be available
+to you under applicable patent law.
+
+   12. No Surrender of Others' Freedom.
+
+If conditions are imposed on you (whether by court order, agreement or otherwise)
+that contradict the conditions of this License, they do not excuse you from
+the conditions of this License. If you cannot convey a covered work so as
+to satisfy simultaneously your obligations under this License and any other
+pertinent obligations, then as a consequence you may not convey it at all.
+For example, if you agree to terms that obligate you to collect a royalty
+for further conveying from those to whom you convey the Program, the only
+way you could satisfy both those terms and this License would be to refrain
+entirely from conveying the Program.
+
+   13. Use with the GNU Affero General Public License.
+
+Notwithstanding any other provision of this License, you have permission to
+link or combine any covered work with a work licensed under version 3 of the
+GNU Affero General Public License into a single combined work, and to convey
+the resulting work. The terms of this License will continue to apply to the
+part which is the covered work, but the special requirements of the GNU Affero
+General Public License, section 13, concerning interaction through a network
+will apply to the combination as such.
+
+   14. Revised Versions of this License.
+
+The Free Software Foundation may publish revised and/or new versions of the
+GNU General Public License from time to time. Such new versions will be similar
+in spirit to the present version, but may differ in detail to address new
+problems or concerns.
+
+Each version is given a distinguishing version number. If the Program specifies
+that a certain numbered version of the GNU General Public License "or any
+later version" applies to it, you have the option of following the terms and
+conditions either of that numbered version or of any later version published
+by the Free Software Foundation. If the Program does not specify a version
+number of the GNU General Public License, you may choose any version ever
+published by the Free Software Foundation.
+
+If the Program specifies that a proxy can decide which future versions of
+the GNU General Public License can be used, that proxy's public statement
+of acceptance of a version permanently authorizes you to choose that version
+for the Program.
+
+Later license versions may give you additional or different permissions. However,
+no additional obligations are imposed on any author or copyright holder as
+a result of your choosing to follow a later version.
+
+   15. Disclaimer of Warranty.
+
+THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE
+LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
+EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS
+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM
+PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR
+CORRECTION.
+
+   16. Limitation of Liability.
+
+IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL
+ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE PROGRAM
+AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL,
+INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO
+USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED
+INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE
+PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER
+PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+   17. Interpretation of Sections 15 and 16.
+
+If the disclaimer of warranty and limitation of liability provided above cannot
+be given local legal effect according to their terms, reviewing courts shall
+apply local law that most closely approximates an absolute waiver of all civil
+liability in connection with the Program, unless a warranty or assumption
+of liability accompanies a copy of the Program in return for a fee. END OF
+TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Programs
+
+If you develop a new program, and you want it to be of the greatest possible
+use to the public, the best way to achieve this is to make it free software
+which everyone can redistribute and change under these terms.
+
+To do so, attach the following notices to the program. It is safest to attach
+them to the start of each source file to most effectively state the exclusion
+of warranty; and each file should have at least the "copyright" line and a
+pointer to where the full notice is found.
+
+<one line to give the program's name and a brief idea of what it does.>
+
+Copyright (C) <year> <name of author>
+
+This program is free software: you can redistribute it and/or modify it under
+the terms of the GNU General Public License as published by the Free Software
+Foundation, either version 3 of the License, or (at your option) any later
+version.
+
+This program is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
+
+You should have received a copy of the GNU General Public License along with
+this program. If not, see <https://www.gnu.org/licenses/>.
+
+Also add information on how to contact you by electronic and paper mail.
+
+If the program does terminal interaction, make it output a short notice like
+this when it starts in an interactive mode:
+
+<program> Copyright (C) <year> <name of author>
+
+This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+
+This is free software, and you are welcome to redistribute it under certain
+conditions; type `show c' for details.
+
+The hypothetical commands `show w' and `show c' should show the appropriate
+parts of the General Public License. Of course, your program's commands might
+be different; for a GUI interface, you would use an "about box".
+
+You should also get your employer (if you work as a programmer) or school,
+if any, to sign a "copyright disclaimer" for the program, if necessary. For
+more information on this, and how to apply and follow the GNU GPL, see <https://www.gnu.org/licenses/>.
+
+The GNU General Public License does not permit incorporating your program
+into proprietary programs. If your program is a subroutine library, you may
+consider it more useful to permit linking proprietary applications with the
+library. If this is what you want to do, use the GNU Lesser General Public
+License instead of this License. But first, please read <https://www.gnu.org/
+licenses /why-not-lgpl.html>.
diff --git a/meta/files/common-licenses/LGPL-2.0 b/meta/files/common-licenses/LGPL-2.0
deleted file mode 100644
index 5931d439b4..0000000000
--- a/meta/files/common-licenses/LGPL-2.0
+++ /dev/null
@@ -1,342 +0,0 @@
-GNU LIBRARY GENERAL PUBLIC LICENSE
-
-
-
-Version 2, June 1991
-
-
-
-Copyright (C) 1991 Free Software Foundation, Inc.
-
-51 Franklin St, Fifth Floor, Boston, MA  02110-1301, USA
-
-Everyone is permitted to copy and distribute verbatim copies
-
-of this license document, but changing it is not allowed.
-
-
-
-[This is the first released version of the library GPL.  It is
-
- numbered 2 because it goes with version 2 of the ordinary GPL.]
-
-Preamble
-
-
-
-The licenses for most software are designed to take away your freedom to share and change it. By contrast, the GNU General Public Licenses are intended to guarantee your freedom to share and change free software--to make sure the software is free for all its users.
-
-
-
-This license, the Library General Public License, applies to some specially designated Free Software Foundation software, and to any other libraries whose authors decide to use it. You can use it for your libraries, too.
-
-
-
-When we speak of free software, we are referring to freedom, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for this service if you wish), that you receive source code or can get it if you want it, that you can change the software or use pieces of it in new free programs; and that you know you can do these things.
-
-
-
-To protect your rights, we need to make restrictions that forbid anyone to deny you these rights or to ask you to surrender the rights. These restrictions translate to certain responsibilities for you if you distribute copies of the library, or if you modify it.
-
-
-
-For example, if you distribute copies of the library, whether gratis or for a fee, you must give the recipients all the rights that we gave you. You must make sure that they, too, receive or can get the source code. If you link a program with the library, you must provide complete object files to the recipients so that they can relink them with the library, after making changes to the library and recompiling it. And you must show them these terms so they know their rights.
-
-
-
-Our method of protecting your rights has two steps: (1) copyright the library, and (2) offer you this license which gives you legal permission to copy, distribute and/or modify the library.
-
-
-
-Also, for each distributor's protection, we want to make certain that everyone understands that there is no warranty for this free library. If the library is modified by someone else and passed on, we want its recipients to know that what they have is not the original version, so that any problems introduced by others will not reflect on the original authors' reputations.
-
-
-
-Finally, any free program is threatened constantly by software patents. We wish to avoid the danger that companies distributing free software will individually obtain patent licenses, thus in effect transforming the program into proprietary software. To prevent this, we have made it clear that any patent must be licensed for everyone's free use or not licensed at all.
-
-
-
-Most GNU software, including some libraries, is covered by the ordinary GNU General Public License, which was designed for utility programs. This license, the GNU Library General Public License, applies to certain designated libraries. This license is quite different from the ordinary one; be sure to read it in full, and don't assume that anything in it is the same as in the ordinary license.
-
-
-
-The reason we have a separate public license for some libraries is that they blur the distinction we usually make between modifying or adding to a program and simply using it. Linking a program with a library, without changing the library, is in some sense simply using the library, and is analogous to running a utility program or application program. However, in a textual and legal sense, the linked executable is a combined work, a derivative of the original library, and the ordinary General Public License treats it as such.
-
-
-
-Because of this blurred distinction, using the ordinary General Public License for libraries did not effectively promote software sharing, because most developers did not use the libraries. We concluded that weaker conditions might promote sharing better.
-
-
-
-However, unrestricted linking of non-free programs would deprive the users of those programs of all benefit from the free status of the libraries themselves. This Library General Public License is intended to permit developers of non-free programs to use free libraries, while preserving your freedom as a user of such programs to change the free libraries that are incorporated in them. (We have not seen how to achieve this as regards changes in header files, but we have achieved it as regards changes in the actual functions of the Library.) The hope is that this will lead to faster development of free libraries.
-
-
-
-The precise terms and conditions for copying, distribution and modification follow. Pay close attention to the difference between a "work based on the library" and a "work that uses the library". The former contains code derived from the library, while the latter only works together with the library.
-
-
-
-Note that it is possible for a library to be covered by the ordinary General Public License rather than by this special one.
-
-
-
-TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-
-
-
-0. This License Agreement applies to any software library which contains a notice placed by the copyright holder or other authorized party saying it may be distributed under the terms of this Library General Public License (also called "this License"). Each licensee is addressed as "you".
-
-
-
-A "library" means a collection of software functions and/or data prepared so as to be conveniently linked with application programs (which use some of those functions and data) to form executables.
-
-
-
-The "Library", below, refers to any such software library or work which has been distributed under these terms. A "work based on the Library" means either the Library or any derivative work under copyright law: that is to say, a work containing the Library or a portion of it, either verbatim or with modifications and/or translated straightforwardly into another language. (Hereinafter, translation is included without limitation in the term "modification".)
-
-
-
-"Source code" for a work means the preferred form of the work for making modifications to it. For a library, complete source code means all the source code for all modules it contains, plus any associated interface definition files, plus the scripts used to control compilation and installation of the library.
-
-
-
-Activities other than copying, distribution and modification are not covered by this License; they are outside its scope. The act of running a program using the Library is not restricted, and output from such a program is covered only if its contents constitute a work based on the Library (independent of the use of the Library in a tool for writing it). Whether that is true depends on what the Library does and what the program that uses the Library does.
-
-
-
-1. You may copy and distribute verbatim copies of the Library's complete source code as you receive it, in any medium, provided that you conspicuously and appropriately publish on each copy an appropriate copyright notice and disclaimer of warranty; keep intact all the notices that refer to this License and to the absence of any warranty; and distribute a copy of this License along with the Library.
-
-
-
-You may charge a fee for the physical act of transferring a copy, and you may at your option offer warranty protection in exchange for a fee.
-
-
-
-2. You may modify your copy or copies of the Library or any portion of it, thus forming a work based on the Library, and copy and distribute such modifications or work under the terms of Section 1 above, provided that you also meet all of these conditions:
-
-
-
-a) The modified work must itself be a software library.
-
-b) You must cause the files modified to carry prominent notices stating that you changed the files and the date of any change.
-
-c) You must cause the whole of the work to be licensed at no charge to all third parties under the terms of this License.
-
-d) If a facility in the modified Library refers to a function or a table of data to be supplied by an application program that uses the facility, other than as an argument passed when the facility is invoked, then you must make a good faith effort to ensure that, in the event an application does not supply such function or table, the facility still operates, and performs whatever part of its purpose remains meaningful.
-
-(For example, a function in a library to compute square roots has a purpose that is entirely well-defined independent of the application. Therefore, Subsection 2d requires that any application-supplied function or table used by this function must be optional: if the application does not supply it, the square root function must still compute square roots.)
-
-
-
-These requirements apply to the modified work as a whole. If identifiable sections of that work are not derived from the Library, and can be reasonably considered independent and separate works in themselves, then this License, and its terms, do not apply to those sections when you distribute them as separate works. But when you distribute the same sections as part of a whole which is a work based on the Library, the distribution of the whole must be on the terms of this License, whose permissions for other licensees extend to the entire whole, and thus to each and every part regardless of who wrote it.
-
-
-
-Thus, it is not the intent of this section to claim rights or contest your rights to work written entirely by you; rather, the intent is to exercise the right to control the distribution of derivative or collective works based on the Library.
-
-
-
-In addition, mere aggregation of another work not based on the Library with the Library (or with a work based on the Library) on a volume of a storage or distribution medium does not bring the other work under the scope of this License.
-
-
-
-3. You may opt to apply the terms of the ordinary GNU General Public License instead of this License to a given copy of the Library. To do this, you must alter all the notices that refer to this License, so that they refer to the ordinary GNU General Public License, version 2, instead of to this License. (If a newer version than version 2 of the ordinary GNU General Public License has appeared, then you can specify that version instead if you wish.) Do not make any other change in these notices.
-
-
-
-Once this change is made in a given copy, it is irreversible for that copy, so the ordinary GNU General Public License applies to all subsequent copies and derivative works made from that copy.
-
-
-
-This option is useful when you wish to copy part of the code of the Library into a program that is not a library.
-
-
-
-4. You may copy and distribute the Library (or a portion or derivative of it, under Section 2) in object code or executable form under the terms of Sections 1 and 2 above provided that you accompany it with the complete corresponding machine-readable source code, which must be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange.
-
-
-
-If distribution of object code is made by offering access to copy from a designated place, then offering equivalent access to copy the source code from the same place satisfies the requirement to distribute the source code, even though third parties are not compelled to copy the source along with the object code.
-
-
-
-5. A program that contains no derivative of any portion of the Library, but is designed to work with the Library by being compiled or linked with it, is called a "work that uses the Library". Such a work, in isolation, is not a derivative work of the Library, and therefore falls outside the scope of this License.
-
-
-
-However, linking a "work that uses the Library" with the Library creates an executable that is a derivative of the Library (because it contains portions of the Library), rather than a "work that uses the library". The executable is therefore covered by this License. Section 6 states terms for distribution of such executables.
-
-
-
-When a "work that uses the Library" uses material from a header file that is part of the Library, the object code for the work may be a derivative work of the Library even though the source code is not. Whether this is true is especially significant if the work can be linked without the Library, or if the work is itself a library. The threshold for this to be true is not precisely defined by law.
-
-
-
-If such an object file uses only numerical parameters, data structure layouts and accessors, and small macros and small inline functions (ten lines or less in length), then the use of the object file is unrestricted, regardless of whether it is legally a derivative work. (Executables containing this object code plus portions of the Library will still fall under Section 6.)
-
-
-
-Otherwise, if the work is a derivative of the Library, you may distribute the object code for the work under the terms of Section 6. Any executables containing that work also fall under Section 6, whether or not they are linked directly with the Library itself.
-
-
-
-6. As an exception to the Sections above, you may also compile or link a "work that uses the Library" with the Library to produce a work containing portions of the Library, and distribute that work under terms of your choice, provided that the terms permit modification of the work for the customer's own use and reverse engineering for debugging such modifications.
-
-
-
-You must give prominent notice with each copy of the work that the Library is used in it and that the Library and its use are covered by this License. You must supply a copy of this License. If the work during execution displays copyright notices, you must include the copyright notice for the Library among them, as well as a reference directing the user to the copy of this License. Also, you must do one of these things:
-
-
-
-a) Accompany the work with the complete corresponding machine-readable source code for the Library including whatever changes were used in the work (which must be distributed under Sections 1 and 2 above); and, if the work is an executable linked with the Library, with the complete machine-readable "work that uses the Library", as object code and/or source code, so that the user can modify the Library and then relink to produce a modified executable containing the modified Library. (It is understood that the user who changes the contents of definitions files in the Library will not necessarily be able to recompile the application to use the modified definitions.)
-
-b) Accompany the work with a written offer, valid for at least three years, to give the same user the materials specified in Subsection 6a, above, for a charge no more than the cost of performing this distribution.
-
-c) If distribution of the work is made by offering access to copy from a designated place, offer equivalent access to copy the above specified materials from the same place.
-
-d) Verify that the user has already received a copy of these materials or that you have already sent this user a copy.
-
-For an executable, the required form of the "work that uses the Library" must include any data and utility programs needed for reproducing the executable from it. However, as a special exception, the source code distributed need not include anything that is normally distributed (in either source or binary form) with the major components (compiler, kernel, and so on) of the operating system on which the executable runs, unless that component itself accompanies the executable.
-
-
-
-It may happen that this requirement contradicts the license restrictions of other proprietary libraries that do not normally accompany the operating system. Such a contradiction means you cannot use both them and the Library together in an executable that you distribute.
-
-
-
-7. You may place library facilities that are a work based on the Library side-by-side in a single library together with other library facilities not covered by this License, and distribute such a combined library, provided that the separate distribution of the work based on the Library and of the other library facilities is otherwise permitted, and provided that you do these two things:
-
-
-
-a) Accompany the combined library with a copy of the same work based on the Library, uncombined with any other library facilities. This must be distributed under the terms of the Sections above.
-
-b) Give prominent notice with the combined library of the fact that part of it is a work based on the Library, and explaining where to find the accompanying uncombined form of the same work.
-
-8. You may not copy, modify, sublicense, link with, or distribute the Library except as expressly provided under this License. Any attempt otherwise to copy, modify, sublicense, link with, or distribute the Library is void, and will automatically terminate your rights under this License. However, parties who have received copies, or rights, from you under this License will not have their licenses terminated so long as such parties remain in full compliance.
-
-
-
-9. You are not required to accept this License, since you have not signed it. However, nothing else grants you permission to modify or distribute the Library or its derivative works. These actions are prohibited by law if you do not accept this License. Therefore, by modifying or distributing the Library (or any work based on the Library), you indicate your acceptance of this License to do so, and all its terms and conditions for copying, distributing or modifying the Library or works based on it.
-
-
-
-10. Each time you redistribute the Library (or any work based on the Library), the recipient automatically receives a license from the original licensor to copy, distribute, link with or modify the Library subject to these terms and conditions. You may not impose any further restrictions on the recipients' exercise of the rights granted herein. You are not responsible for enforcing compliance by third parties to this License.
-
-
-
-11. If, as a consequence of a court judgment or allegation of patent infringement or for any other reason (not limited to patent issues), conditions are imposed on you (whether by court order, agreement or otherwise) that contradict the conditions of this License, they do not excuse you from the conditions of this License. If you cannot distribute so as to satisfy simultaneously your obligations under this License and any other pertinent obligations, then as a consequence you may not distribute the Library at all. For example, if a patent license would not permit royalty-free redistribution of the Library by all those who receive copies directly or indirectly through you, then the only way you could satisfy both it and this License would be to refrain entirely from distribution of the Library.
-
-
-
-If any portion of this section is held invalid or unenforceable under any particular circumstance, the balance of the section is intended to apply, and the section as a whole is intended to apply in other circumstances.
-
-
-
-It is not the purpose of this section to induce you to infringe any patents or other property right claims or to contest validity of any such claims; this section has the sole purpose of protecting the integrity of the free software distribution system which is implemented by public license practices. Many people have made generous contributions to the wide range of software distributed through that system in reliance on consistent application of that system; it is up to the author/donor to decide if he or she is willing to distribute software through any other system and a licensee cannot impose that choice.
-
-
-
-This section is intended to make thoroughly clear what is believed to be a consequence of the rest of this License.
-
-
-
-12. If the distribution and/or use of the Library is restricted in certain countries either by patents or by copyrighted interfaces, the original copyright holder who places the Library under this License may add an explicit geographical distribution limitation excluding those countries, so that distribution is permitted only in or among countries not thus excluded. In such case, this License incorporates the limitation as if written in the body of this License.
-
-
-
-13. The Free Software Foundation may publish revised and/or new versions of the Library General Public License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns.
-
-
-
-Each version is given a distinguishing version number. If the Library specifies a version number of this License which applies to it and "any later version", you have the option of following the terms and conditions either of that version or of any later version published by the Free Software Foundation. If the Library does not specify a license version number, you may choose any version ever published by the Free Software Foundation.
-
-
-
-14. If you wish to incorporate parts of the Library into other free programs whose distribution conditions are incompatible with these, write to the author to ask for permission. For software which is copyrighted by the Free Software Foundation, write to the Free Software Foundation; we sometimes make exceptions for this. Our decision will be guided by the two goals of preserving the free status of all derivatives of our free software and of promoting the sharing and reuse of software generally.
-
-
-
-NO WARRANTY
-
-
-
-15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE LIBRARY IS WITH YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
-
-
-
-16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
-
-
-
-END OF TERMS AND CONDITIONS
-
-
-
-How to Apply These Terms to Your New Libraries
-
-
-
-If you develop a new library, and you want it to be of the greatest possible use to the public, we recommend making it free software that everyone can redistribute and change. You can do so by permitting redistribution under these terms (or, alternatively, under the terms of the ordinary General Public License).
-
-
-
-To apply these terms, attach the following notices to the library. It is safest to attach them to the start of each source file to most effectively convey the exclusion of warranty; and each file should have at least the "copyright" line and a pointer to where the full notice is found.
-
-
-
-one line to give the library's name and an idea of what it does.
-
-Copyright (C) year  name of author
-
-
-
-This library is free software; you can redistribute it and/or
-
-modify it under the terms of the GNU Library General Public
-
-License as published by the Free Software Foundation; either
-
-version 2 of the License, or (at your option) any later version.
-
-
-
-This library is distributed in the hope that it will be useful,
-
-but WITHOUT ANY WARRANTY; without even the implied warranty of
-
-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-
-Library General Public License for more details.
-
-
-
-You should have received a copy of the GNU Library General Public
-
-License along with this library; if not, write to the
-
-Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
-
-Boston, MA  02110-1301, USA.
-
-Also add information on how to contact you by electronic and paper mail.
-
-
-
-You should also get your employer (if you work as a programmer) or your school, if any, to sign a "copyright disclaimer" for the library, if necessary. Here is a sample; alter the names:
-
-
-
-Yoyodyne, Inc., hereby disclaims all copyright interest in
-
-the library `Frob' (a library for tweaking knobs) written
-
-by James Random Hacker.
-
-
-
-signature of Ty Coon, 1 April 1990
-
-Ty Coon, President of Vice
-
-That's all there is to it!
-
diff --git a/meta/files/common-licenses/LGPL-2.0-only b/meta/files/common-licenses/LGPL-2.0-only
new file mode 100644
index 0000000000..5c96471aaf
--- /dev/null
+++ b/meta/files/common-licenses/LGPL-2.0-only
@@ -0,0 +1,446 @@
+GNU LIBRARY GENERAL PUBLIC LICENSE
+
+Version 2, June 1991 Copyright (C) 1991 Free Software Foundation, Inc.
+
+51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+[This is the first released version of the library GPL. It is numbered 2 because
+it goes with version 2 of the ordinary GPL.]
+
+Preamble
+
+The licenses for most software are designed to take away your freedom to share
+and change it. By contrast, the GNU General Public Licenses are intended to
+guarantee your freedom to share and change free software--to make sure the
+software is free for all its users.
+
+This license, the Library General Public License, applies to some specially
+designated Free Software Foundation software, and to any other libraries whose
+authors decide to use it. You can use it for your libraries, too.
+
+When we speak of free software, we are referring to freedom, not price. Our
+General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for this service if you
+wish), that you receive source code or can get it if you want it, that you
+can change the software or use pieces of it in new free programs; and that
+you know you can do these things.
+
+To protect your rights, we need to make restrictions that forbid anyone to
+deny you these rights or to ask you to surrender the rights. These restrictions
+translate to certain responsibilities for you if you distribute copies of
+the library, or if you modify it.
+
+For example, if you distribute copies of the library, whether gratis or for
+a fee, you must give the recipients all the rights that we gave you. You must
+make sure that they, too, receive or can get the source code. If you link
+a program with the library, you must provide complete object files to the
+recipients so that they can relink them with the library, after making changes
+to the library and recompiling it. And you must show them these terms so they
+know their rights.
+
+Our method of protecting your rights has two steps: (1) copyright the library,
+and (2) offer you this license which gives you legal permission to copy, distribute
+and/or modify the library.
+
+Also, for each distributor's protection, we want to make certain that everyone
+understands that there is no warranty for this free library. If the library
+is modified by someone else and passed on, we want its recipients to know
+that what they have is not the original version, so that any problems introduced
+by others will not reflect on the original authors' reputations.
+
+Finally, any free program is threatened constantly by software patents. We
+wish to avoid the danger that companies distributing free software will individually
+obtain patent licenses, thus in effect transforming the program into proprietary
+software. To prevent this, we have made it clear that any patent must be licensed
+for everyone's free use or not licensed at all.
+
+Most GNU software, including some libraries, is covered by the ordinary GNU
+General Public License, which was designed for utility programs. This license,
+the GNU Library General Public License, applies to certain designated libraries.
+This license is quite different from the ordinary one; be sure to read it
+in full, and don't assume that anything in it is the same as in the ordinary
+license.
+
+The reason we have a separate public license for some libraries is that they
+blur the distinction we usually make between modifying or adding to a program
+and simply using it. Linking a program with a library, without changing the
+library, is in some sense simply using the library, and is analogous to running
+a utility program or application program. However, in a textual and legal
+sense, the linked executable is a combined work, a derivative of the original
+library, and the ordinary General Public License treats it as such.
+
+Because of this blurred distinction, using the ordinary General Public License
+for libraries did not effectively promote software sharing, because most developers
+did not use the libraries. We concluded that weaker conditions might promote
+sharing better.
+
+However, unrestricted linking of non-free programs would deprive the users
+of those programs of all benefit from the free status of the libraries themselves.
+This Library General Public License is intended to permit developers of non-free
+programs to use free libraries, while preserving your freedom as a user of
+such programs to change the free libraries that are incorporated in them.
+(We have not seen how to achieve this as regards changes in header files,
+but we have achieved it as regards changes in the actual functions of the
+Library.) The hope is that this will lead to faster development of free libraries.
+
+The precise terms and conditions for copying, distribution and modification
+follow. Pay close attention to the difference between a "work based on the
+library" and a "work that uses the library". The former contains code derived
+from the library, while the latter only works together with the library.
+
+Note that it is possible for a library to be covered by the ordinary General
+Public License rather than by this special one.
+
+TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+0. This License Agreement applies to any software library which contains a
+notice placed by the copyright holder or other authorized party saying it
+may be distributed under the terms of this Library General Public License
+(also called "this License"). Each licensee is addressed as "you".
+
+A "library" means a collection of software functions and/or data prepared
+so as to be conveniently linked with application programs (which use some
+of those functions and data) to form executables.
+
+The "Library", below, refers to any such software library or work which has
+been distributed under these terms. A "work based on the Library" means either
+the Library or any derivative work under copyright law: that is to say, a
+work containing the Library or a portion of it, either verbatim or with modifications
+and/or translated straightforwardly into another language. (Hereinafter, translation
+is included without limitation in the term "modification".)
+
+"Source code" for a work means the preferred form of the work for making modifications
+to it. For a library, complete source code means all the source code for all
+modules it contains, plus any associated interface definition files, plus
+the scripts used to control compilation and installation of the library.
+
+Activities other than copying, distribution and modification are not covered
+by this License; they are outside its scope. The act of running a program
+using the Library is not restricted, and output from such a program is covered
+only if its contents constitute a work based on the Library (independent of
+the use of the Library in a tool for writing it). Whether that is true depends
+on what the Library does and what the program that uses the Library does.
+
+1. You may copy and distribute verbatim copies of the Library's complete source
+code as you receive it, in any medium, provided that you conspicuously and
+appropriately publish on each copy an appropriate copyright notice and disclaimer
+of warranty; keep intact all the notices that refer to this License and to
+the absence of any warranty; and distribute a copy of this License along with
+the Library.
+
+You may charge a fee for the physical act of transferring a copy, and you
+may at your option offer warranty protection in exchange for a fee.
+
+2. You may modify your copy or copies of the Library or any portion of it,
+thus forming a work based on the Library, and copy and distribute such modifications
+or work under the terms of Section 1 above, provided that you also meet all
+of these conditions:
+
+      a) The modified work must itself be a software library.
+
+b) You must cause the files modified to carry prominent notices stating that
+you changed the files and the date of any change.
+
+c) You must cause the whole of the work to be licensed at no charge to all
+third parties under the terms of this License.
+
+d) If a facility in the modified Library refers to a function or a table of
+data to be supplied by an application program that uses the facility, other
+than as an argument passed when the facility is invoked, then you must make
+a good faith effort to ensure that, in the event an application does not supply
+such function or table, the facility still operates, and performs whatever
+part of its purpose remains meaningful.
+
+(For example, a function in a library to compute square roots has a purpose
+that is entirely well-defined independent of the application. Therefore, Subsection
+2d requires that any application-supplied function or table used by this function
+must be optional: if the application does not supply it, the square root function
+must still compute square roots.)
+
+These requirements apply to the modified work as a whole. If identifiable
+sections of that work are not derived from the Library, and can be reasonably
+considered independent and separate works in themselves, then this License,
+and its terms, do not apply to those sections when you distribute them as
+separate works. But when you distribute the same sections as part of a whole
+which is a work based on the Library, the distribution of the whole must be
+on the terms of this License, whose permissions for other licensees extend
+to the entire whole, and thus to each and every part regardless of who wrote
+it.
+
+Thus, it is not the intent of this section to claim rights or contest your
+rights to work written entirely by you; rather, the intent is to exercise
+the right to control the distribution of derivative or collective works based
+on the Library.
+
+In addition, mere aggregation of another work not based on the Library with
+the Library (or with a work based on the Library) on a volume of a storage
+or distribution medium does not bring the other work under the scope of this
+License.
+
+3. You may opt to apply the terms of the ordinary GNU General Public License
+instead of this License to a given copy of the Library. To do this, you must
+alter all the notices that refer to this License, so that they refer to the
+ordinary GNU General Public License, version 2, instead of to this License.
+(If a newer version than version 2 of the ordinary GNU General Public License
+has appeared, then you can specify that version instead if you wish.) Do not
+make any other change in these notices.
+
+Once this change is made in a given copy, it is irreversible for that copy,
+so the ordinary GNU General Public License applies to all subsequent copies
+and derivative works made from that copy.
+
+This option is useful when you wish to copy part of the code of the Library
+into a program that is not a library.
+
+4. You may copy and distribute the Library (or a portion or derivative of
+it, under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you accompany it with the complete corresponding
+machine-readable source code, which must be distributed under the terms of
+Sections 1 and 2 above on a medium customarily used for software interchange.
+
+If distribution of object code is made by offering access to copy from a designated
+place, then offering equivalent access to copy the source code from the same
+place satisfies the requirement to distribute the source code, even though
+third parties are not compelled to copy the source along with the object code.
+
+5. A program that contains no derivative of any portion of the Library, but
+is designed to work with the Library by being compiled or linked with it,
+is called a "work that uses the Library". Such a work, in isolation, is not
+a derivative work of the Library, and therefore falls outside the scope of
+this License.
+
+However, linking a "work that uses the Library" with the Library creates an
+executable that is a derivative of the Library (because it contains portions
+of the Library), rather than a "work that uses the library". The executable
+is therefore covered by this License. Section 6 states terms for distribution
+of such executables.
+
+When a "work that uses the Library" uses material from a header file that
+is part of the Library, the object code for the work may be a derivative work
+of the Library even though the source code is not. Whether this is true is
+especially significant if the work can be linked without the Library, or if
+the work is itself a library. The threshold for this to be true is not precisely
+defined by law.
+
+If such an object file uses only numerical parameters, data structure layouts
+and accessors, and small macros and small inline functions (ten lines or less
+in length), then the use of the object file is unrestricted, regardless of
+whether it is legally a derivative work. (Executables containing this object
+code plus portions of the Library will still fall under Section 6.)
+
+Otherwise, if the work is a derivative of the Library, you may distribute
+the object code for the work under the terms of Section 6. Any executables
+containing that work also fall under Section 6, whether or not they are linked
+directly with the Library itself.
+
+6. As an exception to the Sections above, you may also compile or link a "work
+that uses the Library" with the Library to produce a work containing portions
+of the Library, and distribute that work under terms of your choice, provided
+that the terms permit modification of the work for the customer's own use
+and reverse engineering for debugging such modifications.
+
+You must give prominent notice with each copy of the work that the Library
+is used in it and that the Library and its use are covered by this License.
+You must supply a copy of this License. If the work during execution displays
+copyright notices, you must include the copyright notice for the Library among
+them, as well as a reference directing the user to the copy of this License.
+Also, you must do one of these things:
+
+a) Accompany the work with the complete corresponding machine-readable source
+code for the Library including whatever changes were used in the work (which
+must be distributed under Sections 1 and 2 above); and, if the work is an
+executable linked with the Library, with the complete machine-readable "work
+that uses the Library", as object code and/or source code, so that the user
+can modify the Library and then relink to produce a modified executable containing
+the modified Library. (It is understood that the user who changes the contents
+of definitions files in the Library will not necessarily be able to recompile
+the application to use the modified definitions.)
+
+b) Accompany the work with a written offer, valid for at least three years,
+to give the same user the materials specified in Subsection 6a, above, for
+a charge no more than the cost of performing this distribution.
+
+c) If distribution of the work is made by offering access to copy from a designated
+place, offer equivalent access to copy the above specified materials from
+the same place.
+
+d) Verify that the user has already received a copy of these materials or
+that you have already sent this user a copy.
+
+For an executable, the required form of the "work that uses the Library" must
+include any data and utility programs needed for reproducing the executable
+from it. However, as a special exception, the source code distributed need
+not include anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the operating
+system on which the executable runs, unless that component itself accompanies
+the executable.
+
+It may happen that this requirement contradicts the license restrictions of
+other proprietary libraries that do not normally accompany the operating system.
+Such a contradiction means you cannot use both them and the Library together
+in an executable that you distribute.
+
+7. You may place library facilities that are a work based on the Library side-by-side
+in a single library together with other library facilities not covered by
+this License, and distribute such a combined library, provided that the separate
+distribution of the work based on the Library and of the other library facilities
+is otherwise permitted, and provided that you do these two things:
+
+a) Accompany the combined library with a copy of the same work based on the
+Library, uncombined with any other library facilities. This must be distributed
+under the terms of the Sections above.
+
+b) Give prominent notice with the combined library of the fact that part of
+it is a work based on the Library, and explaining where to find the accompanying
+uncombined form of the same work.
+
+8. You may not copy, modify, sublicense, link with, or distribute the Library
+except as expressly provided under this License. Any attempt otherwise to
+copy, modify, sublicense, link with, or distribute the Library is void, and
+will automatically terminate your rights under this License. However, parties
+who have received copies, or rights, from you under this License will not
+have their licenses terminated so long as such parties remain in full compliance.
+
+9. You are not required to accept this License, since you have not signed
+it. However, nothing else grants you permission to modify or distribute the
+Library or its derivative works. These actions are prohibited by law if you
+do not accept this License. Therefore, by modifying or distributing the Library
+(or any work based on the Library), you indicate your acceptance of this License
+to do so, and all its terms and conditions for copying, distributing or modifying
+the Library or works based on it.
+
+10. Each time you redistribute the Library (or any work based on the Library),
+the recipient automatically receives a license from the original licensor
+to copy, distribute, link with or modify the Library subject to these terms
+and conditions. You may not impose any further restrictions on the recipients'
+exercise of the rights granted herein. You are not responsible for enforcing
+compliance by third parties to this License.
+
+11. If, as a consequence of a court judgment or allegation of patent infringement
+or for any other reason (not limited to patent issues), conditions are imposed
+on you (whether by court order, agreement or otherwise) that contradict the
+conditions of this License, they do not excuse you from the conditions of
+this License. If you cannot distribute so as to satisfy simultaneously your
+obligations under this License and any other pertinent obligations, then as
+a consequence you may not distribute the Library at all. For example, if a
+patent license would not permit royalty-free redistribution of the Library
+by all those who receive copies directly or indirectly through you, then the
+only way you could satisfy both it and this License would be to refrain entirely
+from distribution of the Library.
+
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply,
+and the section as a whole is intended to apply in other circumstances.
+
+It is not the purpose of this section to induce you to infringe any patents
+or other property right claims or to contest validity of any such claims;
+this section has the sole purpose of protecting the integrity of the free
+software distribution system which is implemented by public license practices.
+Many people have made generous contributions to the wide range of software
+distributed through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing to
+distribute software through any other system and a licensee cannot impose
+that choice.
+
+This section is intended to make thoroughly clear what is believed to be a
+consequence of the rest of this License.
+
+12. If the distribution and/or use of the Library is restricted in certain
+countries either by patents or by copyrighted interfaces, the original copyright
+holder who places the Library under this License may add an explicit geographical
+distribution limitation excluding those countries, so that distribution is
+permitted only in or among countries not thus excluded. In such case, this
+License incorporates the limitation as if written in the body of this License.
+
+13. The Free Software Foundation may publish revised and/or new versions of
+the Library General Public License from time to time. Such new versions will
+be similar in spirit to the present version, but may differ in detail to address
+new problems or concerns.
+
+Each version is given a distinguishing version number. If the Library specifies
+a version number of this License which applies to it and "any later version",
+you have the option of following the terms and conditions either of that version
+or of any later version published by the Free Software Foundation. If the
+Library does not specify a license version number, you may choose any version
+ever published by the Free Software Foundation.
+
+14. If you wish to incorporate parts of the Library into other free programs
+whose distribution conditions are incompatible with these, write to the author
+to ask for permission. For software which is copyrighted by the Free Software
+Foundation, write to the Free Software Foundation; we sometimes make exceptions
+for this. Our decision will be guided by the two goals of preserving the free
+status of all derivatives of our free software and of promoting the sharing
+and reuse of software generally.
+
+   NO WARRANTY
+
+15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR
+THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE
+STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE LIBRARY
+"AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
+OF THE LIBRARY IS WITH YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE
+THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE
+OR INABILITY TO USE THE LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA
+OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES
+OR A FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH
+HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+END OF TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Libraries
+
+If you develop a new library, and you want it to be of the greatest possible
+use to the public, we recommend making it free software that everyone can
+redistribute and change. You can do so by permitting redistribution under
+these terms (or, alternatively, under the terms of the ordinary General Public
+License).
+
+To apply these terms, attach the following notices to the library. It is safest
+to attach them to the start of each source file to most effectively convey
+the exclusion of warranty; and each file should have at least the "copyright"
+line and a pointer to where the full notice is found.
+
+one line to give the library's name and an idea of what it does.
+
+Copyright (C) year name of author
+
+This library is free software; you can redistribute it and/or modify it under
+the terms of the GNU Library General Public License as published by the Free
+Software Foundation; either version 2 of the License, or (at your option)
+any later version.
+
+This library is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU Library General Public License for more
+details.
+
+You should have received a copy of the GNU Library General Public License
+along with this library; if not, write to the Free Software Foundation, Inc.,
+51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+You should also get your employer (if you work as a programmer) or your school,
+if any, to sign a "copyright disclaimer" for the library, if necessary. Here
+is a sample; alter the names:
+
+Yoyodyne, Inc., hereby disclaims all copyright interest in
+
+the library `Frob' (a library for tweaking knobs) written
+
+by James Random Hacker.
+
+signature of Ty Coon, 1 April 1990
+
+Ty Coon, President of Vice
+
+That's all there is to it!
diff --git a/meta/files/common-licenses/LGPL-2.0-or-later b/meta/files/common-licenses/LGPL-2.0-or-later
new file mode 100644
index 0000000000..5c96471aaf
--- /dev/null
+++ b/meta/files/common-licenses/LGPL-2.0-or-later
@@ -0,0 +1,446 @@
+GNU LIBRARY GENERAL PUBLIC LICENSE
+
+Version 2, June 1991 Copyright (C) 1991 Free Software Foundation, Inc.
+
+51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+[This is the first released version of the library GPL. It is numbered 2 because
+it goes with version 2 of the ordinary GPL.]
+
+Preamble
+
+The licenses for most software are designed to take away your freedom to share
+and change it. By contrast, the GNU General Public Licenses are intended to
+guarantee your freedom to share and change free software--to make sure the
+software is free for all its users.
+
+This license, the Library General Public License, applies to some specially
+designated Free Software Foundation software, and to any other libraries whose
+authors decide to use it. You can use it for your libraries, too.
+
+When we speak of free software, we are referring to freedom, not price. Our
+General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for this service if you
+wish), that you receive source code or can get it if you want it, that you
+can change the software or use pieces of it in new free programs; and that
+you know you can do these things.
+
+To protect your rights, we need to make restrictions that forbid anyone to
+deny you these rights or to ask you to surrender the rights. These restrictions
+translate to certain responsibilities for you if you distribute copies of
+the library, or if you modify it.
+
+For example, if you distribute copies of the library, whether gratis or for
+a fee, you must give the recipients all the rights that we gave you. You must
+make sure that they, too, receive or can get the source code. If you link
+a program with the library, you must provide complete object files to the
+recipients so that they can relink them with the library, after making changes
+to the library and recompiling it. And you must show them these terms so they
+know their rights.
+
+Our method of protecting your rights has two steps: (1) copyright the library,
+and (2) offer you this license which gives you legal permission to copy, distribute
+and/or modify the library.
+
+Also, for each distributor's protection, we want to make certain that everyone
+understands that there is no warranty for this free library. If the library
+is modified by someone else and passed on, we want its recipients to know
+that what they have is not the original version, so that any problems introduced
+by others will not reflect on the original authors' reputations.
+
+Finally, any free program is threatened constantly by software patents. We
+wish to avoid the danger that companies distributing free software will individually
+obtain patent licenses, thus in effect transforming the program into proprietary
+software. To prevent this, we have made it clear that any patent must be licensed
+for everyone's free use or not licensed at all.
+
+Most GNU software, including some libraries, is covered by the ordinary GNU
+General Public License, which was designed for utility programs. This license,
+the GNU Library General Public License, applies to certain designated libraries.
+This license is quite different from the ordinary one; be sure to read it
+in full, and don't assume that anything in it is the same as in the ordinary
+license.
+
+The reason we have a separate public license for some libraries is that they
+blur the distinction we usually make between modifying or adding to a program
+and simply using it. Linking a program with a library, without changing the
+library, is in some sense simply using the library, and is analogous to running
+a utility program or application program. However, in a textual and legal
+sense, the linked executable is a combined work, a derivative of the original
+library, and the ordinary General Public License treats it as such.
+
+Because of this blurred distinction, using the ordinary General Public License
+for libraries did not effectively promote software sharing, because most developers
+did not use the libraries. We concluded that weaker conditions might promote
+sharing better.
+
+However, unrestricted linking of non-free programs would deprive the users
+of those programs of all benefit from the free status of the libraries themselves.
+This Library General Public License is intended to permit developers of non-free
+programs to use free libraries, while preserving your freedom as a user of
+such programs to change the free libraries that are incorporated in them.
+(We have not seen how to achieve this as regards changes in header files,
+but we have achieved it as regards changes in the actual functions of the
+Library.) The hope is that this will lead to faster development of free libraries.
+
+The precise terms and conditions for copying, distribution and modification
+follow. Pay close attention to the difference between a "work based on the
+library" and a "work that uses the library". The former contains code derived
+from the library, while the latter only works together with the library.
+
+Note that it is possible for a library to be covered by the ordinary General
+Public License rather than by this special one.
+
+TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+0. This License Agreement applies to any software library which contains a
+notice placed by the copyright holder or other authorized party saying it
+may be distributed under the terms of this Library General Public License
+(also called "this License"). Each licensee is addressed as "you".
+
+A "library" means a collection of software functions and/or data prepared
+so as to be conveniently linked with application programs (which use some
+of those functions and data) to form executables.
+
+The "Library", below, refers to any such software library or work which has
+been distributed under these terms. A "work based on the Library" means either
+the Library or any derivative work under copyright law: that is to say, a
+work containing the Library or a portion of it, either verbatim or with modifications
+and/or translated straightforwardly into another language. (Hereinafter, translation
+is included without limitation in the term "modification".)
+
+"Source code" for a work means the preferred form of the work for making modifications
+to it. For a library, complete source code means all the source code for all
+modules it contains, plus any associated interface definition files, plus
+the scripts used to control compilation and installation of the library.
+
+Activities other than copying, distribution and modification are not covered
+by this License; they are outside its scope. The act of running a program
+using the Library is not restricted, and output from such a program is covered
+only if its contents constitute a work based on the Library (independent of
+the use of the Library in a tool for writing it). Whether that is true depends
+on what the Library does and what the program that uses the Library does.
+
+1. You may copy and distribute verbatim copies of the Library's complete source
+code as you receive it, in any medium, provided that you conspicuously and
+appropriately publish on each copy an appropriate copyright notice and disclaimer
+of warranty; keep intact all the notices that refer to this License and to
+the absence of any warranty; and distribute a copy of this License along with
+the Library.
+
+You may charge a fee for the physical act of transferring a copy, and you
+may at your option offer warranty protection in exchange for a fee.
+
+2. You may modify your copy or copies of the Library or any portion of it,
+thus forming a work based on the Library, and copy and distribute such modifications
+or work under the terms of Section 1 above, provided that you also meet all
+of these conditions:
+
+      a) The modified work must itself be a software library.
+
+b) You must cause the files modified to carry prominent notices stating that
+you changed the files and the date of any change.
+
+c) You must cause the whole of the work to be licensed at no charge to all
+third parties under the terms of this License.
+
+d) If a facility in the modified Library refers to a function or a table of
+data to be supplied by an application program that uses the facility, other
+than as an argument passed when the facility is invoked, then you must make
+a good faith effort to ensure that, in the event an application does not supply
+such function or table, the facility still operates, and performs whatever
+part of its purpose remains meaningful.
+
+(For example, a function in a library to compute square roots has a purpose
+that is entirely well-defined independent of the application. Therefore, Subsection
+2d requires that any application-supplied function or table used by this function
+must be optional: if the application does not supply it, the square root function
+must still compute square roots.)
+
+These requirements apply to the modified work as a whole. If identifiable
+sections of that work are not derived from the Library, and can be reasonably
+considered independent and separate works in themselves, then this License,
+and its terms, do not apply to those sections when you distribute them as
+separate works. But when you distribute the same sections as part of a whole
+which is a work based on the Library, the distribution of the whole must be
+on the terms of this License, whose permissions for other licensees extend
+to the entire whole, and thus to each and every part regardless of who wrote
+it.
+
+Thus, it is not the intent of this section to claim rights or contest your
+rights to work written entirely by you; rather, the intent is to exercise
+the right to control the distribution of derivative or collective works based
+on the Library.
+
+In addition, mere aggregation of another work not based on the Library with
+the Library (or with a work based on the Library) on a volume of a storage
+or distribution medium does not bring the other work under the scope of this
+License.
+
+3. You may opt to apply the terms of the ordinary GNU General Public License
+instead of this License to a given copy of the Library. To do this, you must
+alter all the notices that refer to this License, so that they refer to the
+ordinary GNU General Public License, version 2, instead of to this License.
+(If a newer version than version 2 of the ordinary GNU General Public License
+has appeared, then you can specify that version instead if you wish.) Do not
+make any other change in these notices.
+
+Once this change is made in a given copy, it is irreversible for that copy,
+so the ordinary GNU General Public License applies to all subsequent copies
+and derivative works made from that copy.
+
+This option is useful when you wish to copy part of the code of the Library
+into a program that is not a library.
+
+4. You may copy and distribute the Library (or a portion or derivative of
+it, under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you accompany it with the complete corresponding
+machine-readable source code, which must be distributed under the terms of
+Sections 1 and 2 above on a medium customarily used for software interchange.
+
+If distribution of object code is made by offering access to copy from a designated
+place, then offering equivalent access to copy the source code from the same
+place satisfies the requirement to distribute the source code, even though
+third parties are not compelled to copy the source along with the object code.
+
+5. A program that contains no derivative of any portion of the Library, but
+is designed to work with the Library by being compiled or linked with it,
+is called a "work that uses the Library". Such a work, in isolation, is not
+a derivative work of the Library, and therefore falls outside the scope of
+this License.
+
+However, linking a "work that uses the Library" with the Library creates an
+executable that is a derivative of the Library (because it contains portions
+of the Library), rather than a "work that uses the library". The executable
+is therefore covered by this License. Section 6 states terms for distribution
+of such executables.
+
+When a "work that uses the Library" uses material from a header file that
+is part of the Library, the object code for the work may be a derivative work
+of the Library even though the source code is not. Whether this is true is
+especially significant if the work can be linked without the Library, or if
+the work is itself a library. The threshold for this to be true is not precisely
+defined by law.
+
+If such an object file uses only numerical parameters, data structure layouts
+and accessors, and small macros and small inline functions (ten lines or less
+in length), then the use of the object file is unrestricted, regardless of
+whether it is legally a derivative work. (Executables containing this object
+code plus portions of the Library will still fall under Section 6.)
+
+Otherwise, if the work is a derivative of the Library, you may distribute
+the object code for the work under the terms of Section 6. Any executables
+containing that work also fall under Section 6, whether or not they are linked
+directly with the Library itself.
+
+6. As an exception to the Sections above, you may also compile or link a "work
+that uses the Library" with the Library to produce a work containing portions
+of the Library, and distribute that work under terms of your choice, provided
+that the terms permit modification of the work for the customer's own use
+and reverse engineering for debugging such modifications.
+
+You must give prominent notice with each copy of the work that the Library
+is used in it and that the Library and its use are covered by this License.
+You must supply a copy of this License. If the work during execution displays
+copyright notices, you must include the copyright notice for the Library among
+them, as well as a reference directing the user to the copy of this License.
+Also, you must do one of these things:
+
+a) Accompany the work with the complete corresponding machine-readable source
+code for the Library including whatever changes were used in the work (which
+must be distributed under Sections 1 and 2 above); and, if the work is an
+executable linked with the Library, with the complete machine-readable "work
+that uses the Library", as object code and/or source code, so that the user
+can modify the Library and then relink to produce a modified executable containing
+the modified Library. (It is understood that the user who changes the contents
+of definitions files in the Library will not necessarily be able to recompile
+the application to use the modified definitions.)
+
+b) Accompany the work with a written offer, valid for at least three years,
+to give the same user the materials specified in Subsection 6a, above, for
+a charge no more than the cost of performing this distribution.
+
+c) If distribution of the work is made by offering access to copy from a designated
+place, offer equivalent access to copy the above specified materials from
+the same place.
+
+d) Verify that the user has already received a copy of these materials or
+that you have already sent this user a copy.
+
+For an executable, the required form of the "work that uses the Library" must
+include any data and utility programs needed for reproducing the executable
+from it. However, as a special exception, the source code distributed need
+not include anything that is normally distributed (in either source or binary
+form) with the major components (compiler, kernel, and so on) of the operating
+system on which the executable runs, unless that component itself accompanies
+the executable.
+
+It may happen that this requirement contradicts the license restrictions of
+other proprietary libraries that do not normally accompany the operating system.
+Such a contradiction means you cannot use both them and the Library together
+in an executable that you distribute.
+
+7. You may place library facilities that are a work based on the Library side-by-side
+in a single library together with other library facilities not covered by
+this License, and distribute such a combined library, provided that the separate
+distribution of the work based on the Library and of the other library facilities
+is otherwise permitted, and provided that you do these two things:
+
+a) Accompany the combined library with a copy of the same work based on the
+Library, uncombined with any other library facilities. This must be distributed
+under the terms of the Sections above.
+
+b) Give prominent notice with the combined library of the fact that part of
+it is a work based on the Library, and explaining where to find the accompanying
+uncombined form of the same work.
+
+8. You may not copy, modify, sublicense, link with, or distribute the Library
+except as expressly provided under this License. Any attempt otherwise to
+copy, modify, sublicense, link with, or distribute the Library is void, and
+will automatically terminate your rights under this License. However, parties
+who have received copies, or rights, from you under this License will not
+have their licenses terminated so long as such parties remain in full compliance.
+
+9. You are not required to accept this License, since you have not signed
+it. However, nothing else grants you permission to modify or distribute the
+Library or its derivative works. These actions are prohibited by law if you
+do not accept this License. Therefore, by modifying or distributing the Library
+(or any work based on the Library), you indicate your acceptance of this License
+to do so, and all its terms and conditions for copying, distributing or modifying
+the Library or works based on it.
+
+10. Each time you redistribute the Library (or any work based on the Library),
+the recipient automatically receives a license from the original licensor
+to copy, distribute, link with or modify the Library subject to these terms
+and conditions. You may not impose any further restrictions on the recipients'
+exercise of the rights granted herein. You are not responsible for enforcing
+compliance by third parties to this License.
+
+11. If, as a consequence of a court judgment or allegation of patent infringement
+or for any other reason (not limited to patent issues), conditions are imposed
+on you (whether by court order, agreement or otherwise) that contradict the
+conditions of this License, they do not excuse you from the conditions of
+this License. If you cannot distribute so as to satisfy simultaneously your
+obligations under this License and any other pertinent obligations, then as
+a consequence you may not distribute the Library at all. For example, if a
+patent license would not permit royalty-free redistribution of the Library
+by all those who receive copies directly or indirectly through you, then the
+only way you could satisfy both it and this License would be to refrain entirely
+from distribution of the Library.
+
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply,
+and the section as a whole is intended to apply in other circumstances.
+
+It is not the purpose of this section to induce you to infringe any patents
+or other property right claims or to contest validity of any such claims;
+this section has the sole purpose of protecting the integrity of the free
+software distribution system which is implemented by public license practices.
+Many people have made generous contributions to the wide range of software
+distributed through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing to
+distribute software through any other system and a licensee cannot impose
+that choice.
+
+This section is intended to make thoroughly clear what is believed to be a
+consequence of the rest of this License.
+
+12. If the distribution and/or use of the Library is restricted in certain
+countries either by patents or by copyrighted interfaces, the original copyright
+holder who places the Library under this License may add an explicit geographical
+distribution limitation excluding those countries, so that distribution is
+permitted only in or among countries not thus excluded. In such case, this
+License incorporates the limitation as if written in the body of this License.
+
+13. The Free Software Foundation may publish revised and/or new versions of
+the Library General Public License from time to time. Such new versions will
+be similar in spirit to the present version, but may differ in detail to address
+new problems or concerns.
+
+Each version is given a distinguishing version number. If the Library specifies
+a version number of this License which applies to it and "any later version",
+you have the option of following the terms and conditions either of that version
+or of any later version published by the Free Software Foundation. If the
+Library does not specify a license version number, you may choose any version
+ever published by the Free Software Foundation.
+
+14. If you wish to incorporate parts of the Library into other free programs
+whose distribution conditions are incompatible with these, write to the author
+to ask for permission. For software which is copyrighted by the Free Software
+Foundation, write to the Free Software Foundation; we sometimes make exceptions
+for this. Our decision will be guided by the two goals of preserving the free
+status of all derivatives of our free software and of promoting the sharing
+and reuse of software generally.
+
+   NO WARRANTY
+
+15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR
+THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE
+STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE LIBRARY
+"AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
+OF THE LIBRARY IS WITH YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE
+THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE
+OR INABILITY TO USE THE LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA
+OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES
+OR A FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH
+HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+END OF TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Libraries
+
+If you develop a new library, and you want it to be of the greatest possible
+use to the public, we recommend making it free software that everyone can
+redistribute and change. You can do so by permitting redistribution under
+these terms (or, alternatively, under the terms of the ordinary General Public
+License).
+
+To apply these terms, attach the following notices to the library. It is safest
+to attach them to the start of each source file to most effectively convey
+the exclusion of warranty; and each file should have at least the "copyright"
+line and a pointer to where the full notice is found.
+
+one line to give the library's name and an idea of what it does.
+
+Copyright (C) year name of author
+
+This library is free software; you can redistribute it and/or modify it under
+the terms of the GNU Library General Public License as published by the Free
+Software Foundation; either version 2 of the License, or (at your option)
+any later version.
+
+This library is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU Library General Public License for more
+details.
+
+You should have received a copy of the GNU Library General Public License
+along with this library; if not, write to the Free Software Foundation, Inc.,
+51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
+
+Also add information on how to contact you by electronic and paper mail.
+
+You should also get your employer (if you work as a programmer) or your school,
+if any, to sign a "copyright disclaimer" for the library, if necessary. Here
+is a sample; alter the names:
+
+Yoyodyne, Inc., hereby disclaims all copyright interest in
+
+the library `Frob' (a library for tweaking knobs) written
+
+by James Random Hacker.
+
+signature of Ty Coon, 1 April 1990
+
+Ty Coon, President of Vice
+
+That's all there is to it!
diff --git a/meta/files/common-licenses/LGPL-2.1 b/meta/files/common-licenses/LGPL-2.1
deleted file mode 100644
index a0e735a98b..0000000000
--- a/meta/files/common-licenses/LGPL-2.1
+++ /dev/null
@@ -1,176 +0,0 @@
-
-GNU LESSER GENERAL PUBLIC LICENSE
-
-Version 2.1, February 1999
-
-Copyright (C) 1991, 1999 Free Software Foundation, Inc.
-51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
-Everyone is permitted to copy and distribute verbatim copies
-of this license document, but changing it is not allowed.
-
-[This is the first released version of the Lesser GPL.  It also counts
- as the successor of the GNU Library Public License, version 2, hence
- the version number 2.1.]
-Preamble
-
-The licenses for most software are designed to take away your freedom to share and change it. By contrast, the GNU General Public Licenses are intended to guarantee your freedom to share and change free software--to make sure the software is free for all its users.
-
-This license, the Lesser General Public License, applies to some specially designated software packages--typically libraries--of the Free Software Foundation and other authors who decide to use it. You can use it too, but we suggest you first think carefully about whether this license or the ordinary General Public License is the better strategy to use in any particular case, based on the explanations below.
-
-When we speak of free software, we are referring to freedom of use, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for this service if you wish); that you receive source code or can get it if you want it; that you can change the software and use pieces of it in new free programs; and that you are informed that you can do these things.
-
-To protect your rights, we need to make restrictions that forbid distributors to deny you these rights or to ask you to surrender these rights. These restrictions translate to certain responsibilities for you if you distribute copies of the library or if you modify it.
-
-For example, if you distribute copies of the library, whether gratis or for a fee, you must give the recipients all the rights that we gave you. You must make sure that they, too, receive or can get the source code. If you link other code with the library, you must provide complete object files to the recipients, so that they can relink them with the library after making changes to the library and recompiling it. And you must show them these terms so they know their rights.
-
-We protect your rights with a two-step method: (1) we copyright the library, and (2) we offer you this license, which gives you legal permission to copy, distribute and/or modify the library.
-
-To protect each distributor, we want to make it very clear that there is no warranty for the free library. Also, if the library is modified by someone else and passed on, the recipients should know that what they have is not the original version, so that the original author`s reputation will not be affected by problems that might be introduced by others.
-
-Finally, software patents pose a constant threat to the existence of any free program. We wish to make sure that a company cannot effectively restrict the users of a free program by obtaining a restrictive license from a patent holder. Therefore, we insist that any patent license obtained for a version of the library must be consistent with the full freedom of use specified in this license.
-
-Most GNU software, including some libraries, is covered by the ordinary GNU General Public License. This license, the GNU Lesser General Public License, applies to certain designated libraries, and is quite different from the ordinary General Public License. We use this license for certain libraries in order to permit linking those libraries into non-free programs.
-
-When a program is linked with a library, whether statically or using a shared library, the combination of the two is legally speaking a combined work, a derivative of the original library. The ordinary General Public License therefore permits such linking only if the entire combination fits its criteria of freedom. The Lesser General Public License permits more lax criteria for linking other code with the library.
-
-We call this license the "Lesser" General Public License because it does Less to protect the user`s freedom than the ordinary General Public License. It also provides other free software developers Less of an advantage over competing non-free programs. These disadvantages are the reason we use the ordinary General Public License for many libraries. However, the Lesser license provides advantages in certain special circumstances.
-
-For example, on rare occasions, there may be a special need to encourage the widest possible use of a certain library, so that it becomes a de-facto standard. To achieve this, non-free programs must be allowed to use the library. A more frequent case is that a free library does the same job as widely used non-free libraries. In this case, there is little to gain by limiting the free library to free software only, so we use the Lesser General Public License.
-
-In other cases, permission to use a particular library in non-free programs enables a greater number of people to use a large body of free software. For example, permission to use the GNU C Library in non-free programs enables many more people to use the whole GNU operating system, as well as its variant, the GNU/Linux operating system.
-
-Although the Lesser General Public License is Less protective of the users` freedom, it does ensure that the user of a program that is linked with the Library has the freedom and the wherewithal to run that program using a modified version of the Library.
-
-The precise terms and conditions for copying, distribution and modification follow. Pay close attention to the difference between a "work based on the library" and a "work that uses the library". The former contains code derived from the library, whereas the latter must be combined with the library in order to run.
-
-TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-
-0. This License Agreement applies to any software library or other program which contains a notice placed by the copyright holder or other authorized party saying it may be distributed under the terms of this Lesser General Public License (also called "this License"). Each licensee is addressed as "you".
-
-A "library" means a collection of software functions and/or data prepared so as to be conveniently linked with application programs (which use some of those functions and data) to form executables.
-
-The "Library", below, refers to any such software library or work which has been distributed under these terms. A "work based on the Library" means either the Library or any derivative work under copyright law: that is to say, a work containing the Library or a portion of it, either verbatim or with modifications and/or translated straightforwardly into another language. (Hereinafter, translation is included without limitation in the term "modification".)
-
-"Source code" for a work means the preferred form of the work for making modifications to it. For a library, complete source code means all the source code for all modules it contains, plus any associated interface definition files, plus the scripts used to control compilation and installation of the library.
-
-Activities other than copying, distribution and modification are not covered by this License; they are outside its scope. The act of running a program using the Library is not restricted, and output from such a program is covered only if its contents constitute a work based on the Library (independent of the use of the Library in a tool for writing it). Whether that is true depends on what the Library does and what the program that uses the Library does.
-
-1. You may copy and distribute verbatim copies of the Library`s complete source code as you receive it, in any medium, provided that you conspicuously and appropriately publish on each copy an appropriate copyright notice and disclaimer of warranty; keep intact all the notices that refer to this License and to the absence of any warranty; and distribute a copy of this License along with the Library.
-
-You may charge a fee for the physical act of transferring a copy, and you may at your option offer warranty protection in exchange for a fee.
-
-2. You may modify your copy or copies of the Library or any portion of it, thus forming a work based on the Library, and copy and distribute such modifications or work under the terms of Section 1 above, provided that you also meet all of these conditions:
-
-a) The modified work must itself be a software library.
-b) You must cause the files modified to carry prominent notices stating that you changed the files and the date of any change.
-c) You must cause the whole of the work to be licensed at no charge to all third parties under the terms of this License.
-d) If a facility in the modified Library refers to a function or a table of data to be supplied by an application program that uses the facility, other than as an argument passed when the facility is invoked, then you must make a good faith effort to ensure that, in the event an application does not supply such function or table, the facility still operates, and performs whatever part of its purpose remains meaningful.
-(For example, a function in a library to compute square roots has a purpose that is entirely well-defined independent of the application. Therefore, Subsection 2d requires that any application-supplied function or table used by this function must be optional: if the application does not supply it, the square root function must still compute square roots.)
-
-These requirements apply to the modified work as a whole. If identifiable sections of that work are not derived from the Library, and can be reasonably considered independent and separate works in themselves, then this License, and its terms, do not apply to those sections when you distribute them as separate works. But when you distribute the same sections as part of a whole which is a work based on the Library, the distribution of the whole must be on the terms of this License, whose permissions for other licensees extend to the entire whole, and thus to each and every part regardless of who wrote it.
-
-Thus, it is not the intent of this section to claim rights or contest your rights to work written entirely by you; rather, the intent is to exercise the right to control the distribution of derivative or collective works based on the Library.
-
-In addition, mere aggregation of another work not based on the Library with the Library (or with a work based on the Library) on a volume of a storage or distribution medium does not bring the other work under the scope of this License.
-
-3. You may opt to apply the terms of the ordinary GNU General Public License instead of this License to a given copy of the Library. To do this, you must alter all the notices that refer to this License, so that they refer to the ordinary GNU General Public License, version 2, instead of to this License. (If a newer version than version 2 of the ordinary GNU General Public License has appeared, then you can specify that version instead if you wish.) Do not make any other change in these notices.
-
-Once this change is made in a given copy, it is irreversible for that copy, so the ordinary GNU General Public License applies to all subsequent copies and derivative works made from that copy.
-
-This option is useful when you wish to copy part of the code of the Library into a program that is not a library.
-
-4. You may copy and distribute the Library (or a portion or derivative of it, under Section 2) in object code or executable form under the terms of Sections 1 and 2 above provided that you accompany it with the complete corresponding machine-readable source code, which must be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange.
-
-If distribution of object code is made by offering access to copy from a designated place, then offering equivalent access to copy the source code from the same place satisfies the requirement to distribute the source code, even though third parties are not compelled to copy the source along with the object code.
-
-5. A program that contains no derivative of any portion of the Library, but is designed to work with the Library by being compiled or linked with it, is called a "work that uses the Library". Such a work, in isolation, is not a derivative work of the Library, and therefore falls outside the scope of this License.
-
-However, linking a "work that uses the Library" with the Library creates an executable that is a derivative of the Library (because it contains portions of the Library), rather than a "work that uses the library". The executable is therefore covered by this License. Section 6 states terms for distribution of such executables.
-
-When a "work that uses the Library" uses material from a header file that is part of the Library, the object code for the work may be a derivative work of the Library even though the source code is not. Whether this is true is especially significant if the work can be linked without the Library, or if the work is itself a library. The threshold for this to be true is not precisely defined by law.
-
-If such an object file uses only numerical parameters, data structure layouts and accessors, and small macros and small inline functions (ten lines or less in length), then the use of the object file is unrestricted, regardless of whether it is legally a derivative work. (Executables containing this object code plus portions of the Library will still fall under Section 6.)
-
-Otherwise, if the work is a derivative of the Library, you may distribute the object code for the work under the terms of Section 6. Any executables containing that work also fall under Section 6, whether or not they are linked directly with the Library itself.
-
-6. As an exception to the Sections above, you may also combine or link a "work that uses the Library" with the Library to produce a work containing portions of the Library, and distribute that work under terms of your choice, provided that the terms permit modification of the work for the customer`s own use and reverse engineering for debugging such modifications.
-
-You must give prominent notice with each copy of the work that the Library is used in it and that the Library and its use are covered by this License. You must supply a copy of this License. If the work during execution displays copyright notices, you must include the copyright notice for the Library among them, as well as a reference directing the user to the copy of this License. Also, you must do one of these things:
-
-a) Accompany the work with the complete corresponding machine-readable source code for the Library including whatever changes were used in the work (which must be distributed under Sections 1 and 2 above); and, if the work is an executable linked with the Library, with the complete machine-readable "work that uses the Library", as object code and/or source code, so that the user can modify the Library and then relink to produce a modified executable containing the modified Library. (It is understood that the user who changes the contents of definitions files in the Library will not necessarily be able to recompile the application to use the modified definitions.)
-b) Use a suitable shared library mechanism for linking with the Library. A suitable mechanism is one that (1) uses at run time a copy of the library already present on the user`s computer system, rather than copying library functions into the executable, and (2) will operate properly with a modified version of the library, if the user installs one, as long as the modified version is interface-compatible with the version that the work was made with.
-c) Accompany the work with a written offer, valid for at least three years, to give the same user the materials specified in Subsection 6a, above, for a charge no more than the cost of performing this distribution.
-d) If distribution of the work is made by offering access to copy from a designated place, offer equivalent access to copy the above specified materials from the same place.
-e) Verify that the user has already received a copy of these materials or that you have already sent this user a copy.
-For an executable, the required form of the "work that uses the Library" must include any data and utility programs needed for reproducing the executable from it. However, as a special exception, the materials to be distributed need not include anything that is normally distributed (in either source or binary form) with the major components (compiler, kernel, and so on) of the operating system on which the executable runs, unless that component itself accompanies the executable.
-
-It may happen that this requirement contradicts the license restrictions of other proprietary libraries that do not normally accompany the operating system. Such a contradiction means you cannot use both them and the Library together in an executable that you distribute.
-
-7. You may place library facilities that are a work based on the Library side-by-side in a single library together with other library facilities not covered by this License, and distribute such a combined library, provided that the separate distribution of the work based on the Library and of the other library facilities is otherwise permitted, and provided that you do these two things:
-
-a) Accompany the combined library with a copy of the same work based on the Library, uncombined with any other library facilities. This must be distributed under the terms of the Sections above.
-b) Give prominent notice with the combined library of the fact that part of it is a work based on the Library, and explaining where to find the accompanying uncombined form of the same work.
-8. You may not copy, modify, sublicense, link with, or distribute the Library except as expressly provided under this License. Any attempt otherwise to copy, modify, sublicense, link with, or distribute the Library is void, and will automatically terminate your rights under this License. However, parties who have received copies, or rights, from you under this License will not have their licenses terminated so long as such parties remain in full compliance.
-
-9. You are not required to accept this License, since you have not signed it. However, nothing else grants you permission to modify or distribute the Library or its derivative works. These actions are prohibited by law if you do not accept this License. Therefore, by modifying or distributing the Library (or any work based on the Library), you indicate your acceptance of this License to do so, and all its terms and conditions for copying, distributing or modifying the Library or works based on it.
-
-10. Each time you redistribute the Library (or any work based on the Library), the recipient automatically receives a license from the original licensor to copy, distribute, link with or modify the Library subject to these terms and conditions. You may not impose any further restrictions on the recipients` exercise of the rights granted herein. You are not responsible for enforcing compliance by third parties with this License.
-
-11. If, as a consequence of a court judgment or allegation of patent infringement or for any other reason (not limited to patent issues), conditions are imposed on you (whether by court order, agreement or otherwise) that contradict the conditions of this License, they do not excuse you from the conditions of this License. If you cannot distribute so as to satisfy simultaneously your obligations under this License and any other pertinent obligations, then as a consequence you may not distribute the Library at all. For example, if a patent license would not permit royalty-free redistribution of the Library by all those who receive copies directly or indirectly through you, then the only way you could satisfy both it and this License would be to refrain entirely from distribution of the Library.
-
-If any portion of this section is held invalid or unenforceable under any particular circumstance, the balance of the section is intended to apply, and the section as a whole is intended to apply in other circumstances.
-
-It is not the purpose of this section to induce you to infringe any patents or other property right claims or to contest validity of any such claims; this section has the sole purpose of protecting the integrity of the free software distribution system which is implemented by public license practices. Many people have made generous contributions to the wide range of software distributed through that system in reliance on consistent application of that system; it is up to the author/donor to decide if he or she is willing to distribute software through any other system and a licensee cannot impose that choice.
-
-This section is intended to make thoroughly clear what is believed to be a consequence of the rest of this License.
-
-12. If the distribution and/or use of the Library is restricted in certain countries either by patents or by copyrighted interfaces, the original copyright holder who places the Library under this License may add an explicit geographical distribution limitation excluding those countries, so that distribution is permitted only in or among countries not thus excluded. In such case, this License incorporates the limitation as if written in the body of this License.
-
-13. The Free Software Foundation may publish revised and/or new versions of the Lesser General Public License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns.
-
-Each version is given a distinguishing version number. If the Library specifies a version number of this License which applies to it and "any later version", you have the option of following the terms and conditions either of that version or of any later version published by the Free Software Foundation. If the Library does not specify a license version number, you may choose any version ever published by the Free Software Foundation.
-
-14. If you wish to incorporate parts of the Library into other free programs whose distribution conditions are incompatible with these, write to the author to ask for permission. For software which is copyrighted by the Free Software Foundation, write to the Free Software Foundation; we sometimes make exceptions for this. Our decision will be guided by the two goals of preserving the free status of all derivatives of our free software and of promoting the sharing and reuse of software generally.
-
-NO WARRANTY
-
-15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE LIBRARY "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE LIBRARY IS WITH YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
-
-16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
-
-END OF TERMS AND CONDITIONS
-
-How to Apply These Terms to Your New Libraries
-
-If you develop a new library, and you want it to be of the greatest possible use to the public, we recommend making it free software that everyone can redistribute and change. You can do so by permitting redistribution under these terms (or, alternatively, under the terms of the ordinary General Public License).
-
-To apply these terms, attach the following notices to the library. It is safest to attach them to the start of each source file to most effectively convey the exclusion of warranty; and each file should have at least the "copyright" line and a pointer to where the full notice is found.
-
-one line to give the library`s name and an idea of what it does.
-Copyright (C) year  name of author
-
-This library is free software; you can redistribute it and/or
-modify it under the terms of the GNU Lesser General Public
-License as published by the Free Software Foundation; either
-version 2.1 of the License, or (at your option) any later version.
-
-This library is distributed in the hope that it will be useful,
-but WITHOUT ANY WARRANTY; without even the implied warranty of
-MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-Lesser General Public License for more details.
-
-You should have received a copy of the GNU Lesser General Public
-License along with this library; if not, write to the Free Software
-Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
-Also add information on how to contact you by electronic and paper mail.
-
-You should also get your employer (if you work as a programmer) or your school, if any, to sign a "copyright disclaimer" for the library, if necessary. Here is a sample; alter the names:
-
-Yoyodyne, Inc., hereby disclaims all copyright interest in
-the library `Frob` (a library for tweaking knobs) written
-by James Random Hacker.
-
-signature of Ty Coon, 1 April 1990
-Ty Coon, President of Vice
-That`s all there is to it!
-
diff --git a/meta/files/common-licenses/LGPL-2.1-only b/meta/files/common-licenses/LGPL-2.1-only
new file mode 100644
index 0000000000..130dffb311
--- /dev/null
+++ b/meta/files/common-licenses/LGPL-2.1-only
@@ -0,0 +1,467 @@
+GNU LESSER GENERAL PUBLIC LICENSE
+
+Version 2.1, February 1999
+
+Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+
+51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+[This is the first released version of the Lesser GPL. It also counts as the
+successor of the GNU Library Public License, version 2, hence the version
+number 2.1.]
+
+Preamble
+
+The licenses for most software are designed to take away your freedom to share
+and change it. By contrast, the GNU General Public Licenses are intended to
+guarantee your freedom to share and change free software--to make sure the
+software is free for all its users.
+
+This license, the Lesser General Public License, applies to some specially
+designated software packages--typically libraries--of the Free Software Foundation
+and other authors who decide to use it. You can use it too, but we suggest
+you first think carefully about whether this license or the ordinary General
+Public License is the better strategy to use in any particular case, based
+on the explanations below.
+
+When we speak of free software, we are referring to freedom of use, not price.
+Our General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for this service if you
+wish); that you receive source code or can get it if you want it; that you
+can change the software and use pieces of it in new free programs; and that
+you are informed that you can do these things.
+
+To protect your rights, we need to make restrictions that forbid distributors
+to deny you these rights or to ask you to surrender these rights. These restrictions
+translate to certain responsibilities for you if you distribute copies of
+the library or if you modify it.
+
+For example, if you distribute copies of the library, whether gratis or for
+a fee, you must give the recipients all the rights that we gave you. You must
+make sure that they, too, receive or can get the source code. If you link
+other code with the library, you must provide complete object files to the
+recipients, so that they can relink them with the library after making changes
+to the library and recompiling it. And you must show them these terms so they
+know their rights.
+
+We protect your rights with a two-step method: (1) we copyright the library,
+and (2) we offer you this license, which gives you legal permission to copy,
+distribute and/or modify the library.
+
+To protect each distributor, we want to make it very clear that there is no
+warranty for the free library. Also, if the library is modified by someone
+else and passed on, the recipients should know that what they have is not
+the original version, so that the original author's reputation will not be
+affected by problems that might be introduced by others.
+
+Finally, software patents pose a constant threat to the existence of any free
+program. We wish to make sure that a company cannot effectively restrict the
+users of a free program by obtaining a restrictive license from a patent holder.
+Therefore, we insist that any patent license obtained for a version of the
+library must be consistent with the full freedom of use specified in this
+license.
+
+Most GNU software, including some libraries, is covered by the ordinary GNU
+General Public License. This license, the GNU Lesser General Public License,
+applies to certain designated libraries, and is quite different from the ordinary
+General Public License. We use this license for certain libraries in order
+to permit linking those libraries into non-free programs.
+
+When a program is linked with a library, whether statically or using a shared
+library, the combination of the two is legally speaking a combined work, a
+derivative of the original library. The ordinary General Public License therefore
+permits such linking only if the entire combination fits its criteria of freedom.
+The Lesser General Public License permits more lax criteria for linking other
+code with the library.
+
+We call this license the "Lesser" General Public License because it does Less
+to protect the user's freedom than the ordinary General Public License. It
+also provides other free software developers Less of an advantage over competing
+non-free programs. These disadvantages are the reason we use the ordinary
+General Public License for many libraries. However, the Lesser license provides
+advantages in certain special circumstances.
+
+For example, on rare occasions, there may be a special need to encourage the
+widest possible use of a certain library, so that it becomes a de-facto standard.
+To achieve this, non-free programs must be allowed to use the library. A more
+frequent case is that a free library does the same job as widely used non-free
+libraries. In this case, there is little to gain by limiting the free library
+to free software only, so we use the Lesser General Public License.
+
+In other cases, permission to use a particular library in non-free programs
+enables a greater number of people to use a large body of free software. For
+example, permission to use the GNU C Library in non-free programs enables
+many more people to use the whole GNU operating system, as well as its variant,
+the GNU/Linux operating system.
+
+Although the Lesser General Public License is Less protective of the users'
+freedom, it does ensure that the user of a program that is linked with the
+Library has the freedom and the wherewithal to run that program using a modified
+version of the Library.
+
+The precise terms and conditions for copying, distribution and modification
+follow. Pay close attention to the difference between a "work based on the
+library" and a "work that uses the library". The former contains code derived
+from the library, whereas the latter must be combined with the library in
+order to run.
+
+TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+0. This License Agreement applies to any software library or other program
+which contains a notice placed by the copyright holder or other authorized
+party saying it may be distributed under the terms of this Lesser General
+Public License (also called "this License"). Each licensee is addressed as
+"you".
+
+A "library" means a collection of software functions and/or data prepared
+so as to be conveniently linked with application programs (which use some
+of those functions and data) to form executables.
+
+The "Library", below, refers to any such software library or work which has
+been distributed under these terms. A "work based on the Library" means either
+the Library or any derivative work under copyright law: that is to say, a
+work containing the Library or a portion of it, either verbatim or with modifications
+and/or translated straightforwardly into another language. (Hereinafter, translation
+is included without limitation in the term "modification".)
+
+"Source code" for a work means the preferred form of the work for making modifications
+to it. For a library, complete source code means all the source code for all
+modules it contains, plus any associated interface definition files, plus
+the scripts used to control compilation and installation of the library.
+
+Activities other than copying, distribution and modification are not covered
+by this License; they are outside its scope. The act of running a program
+using the Library is not restricted, and output from such a program is covered
+only if its contents constitute a work based on the Library (independent of
+the use of the Library in a tool for writing it). Whether that is true depends
+on what the Library does and what the program that uses the Library does.
+
+1. You may copy and distribute verbatim copies of the Library's complete source
+code as you receive it, in any medium, provided that you conspicuously and
+appropriately publish on each copy an appropriate copyright notice and disclaimer
+of warranty; keep intact all the notices that refer to this License and to
+the absence of any warranty; and distribute a copy of this License along with
+the Library.
+
+You may charge a fee for the physical act of transferring a copy, and you
+may at your option offer warranty protection in exchange for a fee.
+
+2. You may modify your copy or copies of the Library or any portion of it,
+thus forming a work based on the Library, and copy and distribute such modifications
+or work under the terms of Section 1 above, provided that you also meet all
+of these conditions:
+
+      a) The modified work must itself be a software library.
+
+b) You must cause the files modified to carry prominent notices stating that
+you changed the files and the date of any change.
+
+c) You must cause the whole of the work to be licensed at no charge to all
+third parties under the terms of this License.
+
+d) If a facility in the modified Library refers to a function or a table of
+data to be supplied by an application program that uses the facility, other
+than as an argument passed when the facility is invoked, then you must make
+a good faith effort to ensure that, in the event an application does not supply
+such function or table, the facility still operates, and performs whatever
+part of its purpose remains meaningful.
+
+(For example, a function in a library to compute square roots has a purpose
+that is entirely well-defined independent of the application. Therefore, Subsection
+2d requires that any application-supplied function or table used by this function
+must be optional: if the application does not supply it, the square root function
+must still compute square roots.)
+
+These requirements apply to the modified work as a whole. If identifiable
+sections of that work are not derived from the Library, and can be reasonably
+considered independent and separate works in themselves, then this License,
+and its terms, do not apply to those sections when you distribute them as
+separate works. But when you distribute the same sections as part of a whole
+which is a work based on the Library, the distribution of the whole must be
+on the terms of this License, whose permissions for other licensees extend
+to the entire whole, and thus to each and every part regardless of who wrote
+it.
+
+Thus, it is not the intent of this section to claim rights or contest your
+rights to work written entirely by you; rather, the intent is to exercise
+the right to control the distribution of derivative or collective works based
+on the Library.
+
+In addition, mere aggregation of another work not based on the Library with
+the Library (or with a work based on the Library) on a volume of a storage
+or distribution medium does not bring the other work under the scope of this
+License.
+
+3. You may opt to apply the terms of the ordinary GNU General Public License
+instead of this License to a given copy of the Library. To do this, you must
+alter all the notices that refer to this License, so that they refer to the
+ordinary GNU General Public License, version 2, instead of to this License.
+(If a newer version than version 2 of the ordinary GNU General Public License
+has appeared, then you can specify that version instead if you wish.) Do not
+make any other change in these notices.
+
+Once this change is made in a given copy, it is irreversible for that copy,
+so the ordinary GNU General Public License applies to all subsequent copies
+and derivative works made from that copy.
+
+This option is useful when you wish to copy part of the code of the Library
+into a program that is not a library.
+
+4. You may copy and distribute the Library (or a portion or derivative of
+it, under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you accompany it with the complete corresponding
+machine-readable source code, which must be distributed under the terms of
+Sections 1 and 2 above on a medium customarily used for software interchange.
+
+If distribution of object code is made by offering access to copy from a designated
+place, then offering equivalent access to copy the source code from the same
+place satisfies the requirement to distribute the source code, even though
+third parties are not compelled to copy the source along with the object code.
+
+5. A program that contains no derivative of any portion of the Library, but
+is designed to work with the Library by being compiled or linked with it,
+is called a "work that uses the Library". Such a work, in isolation, is not
+a derivative work of the Library, and therefore falls outside the scope of
+this License.
+
+However, linking a "work that uses the Library" with the Library creates an
+executable that is a derivative of the Library (because it contains portions
+of the Library), rather than a "work that uses the library". The executable
+is therefore covered by this License. Section 6 states terms for distribution
+of such executables.
+
+When a "work that uses the Library" uses material from a header file that
+is part of the Library, the object code for the work may be a derivative work
+of the Library even though the source code is not. Whether this is true is
+especially significant if the work can be linked without the Library, or if
+the work is itself a library. The threshold for this to be true is not precisely
+defined by law.
+
+If such an object file uses only numerical parameters, data structure layouts
+and accessors, and small macros and small inline functions (ten lines or less
+in length), then the use of the object file is unrestricted, regardless of
+whether it is legally a derivative work. (Executables containing this object
+code plus portions of the Library will still fall under Section 6.)
+
+Otherwise, if the work is a derivative of the Library, you may distribute
+the object code for the work under the terms of Section 6. Any executables
+containing that work also fall under Section 6, whether or not they are linked
+directly with the Library itself.
+
+6. As an exception to the Sections above, you may also combine or link a "work
+that uses the Library" with the Library to produce a work containing portions
+of the Library, and distribute that work under terms of your choice, provided
+that the terms permit modification of the work for the customer's own use
+and reverse engineering for debugging such modifications.
+
+You must give prominent notice with each copy of the work that the Library
+is used in it and that the Library and its use are covered by this License.
+You must supply a copy of this License. If the work during execution displays
+copyright notices, you must include the copyright notice for the Library among
+them, as well as a reference directing the user to the copy of this License.
+Also, you must do one of these things:
+
+a) Accompany the work with the complete corresponding machine-readable source
+code for the Library including whatever changes were used in the work (which
+must be distributed under Sections 1 and 2 above); and, if the work is an
+executable linked with the Library, with the complete machine-readable "work
+that uses the Library", as object code and/or source code, so that the user
+can modify the Library and then relink to produce a modified executable containing
+the modified Library. (It is understood that the user who changes the contents
+of definitions files in the Library will not necessarily be able to recompile
+the application to use the modified definitions.)
+
+b) Use a suitable shared library mechanism for linking with the Library. A
+suitable mechanism is one that (1) uses at run time a copy of the library
+already present on the user's computer system, rather than copying library
+functions into the executable, and (2) will operate properly with a modified
+version of the library, if the user installs one, as long as the modified
+version is interface-compatible with the version that the work was made with.
+
+c) Accompany the work with a written offer, valid for at least three years,
+to give the same user the materials specified in Subsection 6a, above, for
+a charge no more than the cost of performing this distribution.
+
+d) If distribution of the work is made by offering access to copy from a designated
+place, offer equivalent access to copy the above specified materials from
+the same place.
+
+e) Verify that the user has already received a copy of these materials or
+that you have already sent this user a copy.
+
+For an executable, the required form of the "work that uses the Library" must
+include any data and utility programs needed for reproducing the executable
+from it. However, as a special exception, the materials to be distributed
+need not include anything that is normally distributed (in either source or
+binary form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component itself
+accompanies the executable.
+
+It may happen that this requirement contradicts the license restrictions of
+other proprietary libraries that do not normally accompany the operating system.
+Such a contradiction means you cannot use both them and the Library together
+in an executable that you distribute.
+
+7. You may place library facilities that are a work based on the Library side-by-side
+in a single library together with other library facilities not covered by
+this License, and distribute such a combined library, provided that the separate
+distribution of the work based on the Library and of the other library facilities
+is otherwise permitted, and provided that you do these two things:
+
+a) Accompany the combined library with a copy of the same work based on the
+Library, uncombined with any other library facilities. This must be distributed
+under the terms of the Sections above.
+
+b) Give prominent notice with the combined library of the fact that part of
+it is a work based on the Library, and explaining where to find the accompanying
+uncombined form of the same work.
+
+8. You may not copy, modify, sublicense, link with, or distribute the Library
+except as expressly provided under this License. Any attempt otherwise to
+copy, modify, sublicense, link with, or distribute the Library is void, and
+will automatically terminate your rights under this License. However, parties
+who have received copies, or rights, from you under this License will not
+have their licenses terminated so long as such parties remain in full compliance.
+
+9. You are not required to accept this License, since you have not signed
+it. However, nothing else grants you permission to modify or distribute the
+Library or its derivative works. These actions are prohibited by law if you
+do not accept this License. Therefore, by modifying or distributing the Library
+(or any work based on the Library), you indicate your acceptance of this License
+to do so, and all its terms and conditions for copying, distributing or modifying
+the Library or works based on it.
+
+10. Each time you redistribute the Library (or any work based on the Library),
+the recipient automatically receives a license from the original licensor
+to copy, distribute, link with or modify the Library subject to these terms
+and conditions. You may not impose any further restrictions on the recipients'
+exercise of the rights granted herein. You are not responsible for enforcing
+compliance by third parties with this License.
+
+11. If, as a consequence of a court judgment or allegation of patent infringement
+or for any other reason (not limited to patent issues), conditions are imposed
+on you (whether by court order, agreement or otherwise) that contradict the
+conditions of this License, they do not excuse you from the conditions of
+this License. If you cannot distribute so as to satisfy simultaneously your
+obligations under this License and any other pertinent obligations, then as
+a consequence you may not distribute the Library at all. For example, if a
+patent license would not permit royalty-free redistribution of the Library
+by all those who receive copies directly or indirectly through you, then the
+only way you could satisfy both it and this License would be to refrain entirely
+from distribution of the Library.
+
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply,
+and the section as a whole is intended to apply in other circumstances.
+
+It is not the purpose of this section to induce you to infringe any patents
+or other property right claims or to contest validity of any such claims;
+this section has the sole purpose of protecting the integrity of the free
+software distribution system which is implemented by public license practices.
+Many people have made generous contributions to the wide range of software
+distributed through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing to
+distribute software through any other system and a licensee cannot impose
+that choice.
+
+This section is intended to make thoroughly clear what is believed to be a
+consequence of the rest of this License.
+
+12. If the distribution and/or use of the Library is restricted in certain
+countries either by patents or by copyrighted interfaces, the original copyright
+holder who places the Library under this License may add an explicit geographical
+distribution limitation excluding those countries, so that distribution is
+permitted only in or among countries not thus excluded. In such case, this
+License incorporates the limitation as if written in the body of this License.
+
+13. The Free Software Foundation may publish revised and/or new versions of
+the Lesser General Public License from time to time. Such new versions will
+be similar in spirit to the present version, but may differ in detail to address
+new problems or concerns.
+
+Each version is given a distinguishing version number. If the Library specifies
+a version number of this License which applies to it and "any later version",
+you have the option of following the terms and conditions either of that version
+or of any later version published by the Free Software Foundation. If the
+Library does not specify a license version number, you may choose any version
+ever published by the Free Software Foundation.
+
+14. If you wish to incorporate parts of the Library into other free programs
+whose distribution conditions are incompatible with these, write to the author
+to ask for permission. For software which is copyrighted by the Free Software
+Foundation, write to the Free Software Foundation; we sometimes make exceptions
+for this. Our decision will be guided by the two goals of preserving the free
+status of all derivatives of our free software and of promoting the sharing
+and reuse of software generally.
+
+   NO WARRANTY
+
+15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR
+THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE
+STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE LIBRARY
+"AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
+OF THE LIBRARY IS WITH YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE
+THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE
+OR INABILITY TO USE THE LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA
+OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES
+OR A FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH
+HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+END OF TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Libraries
+
+If you develop a new library, and you want it to be of the greatest possible
+use to the public, we recommend making it free software that everyone can
+redistribute and change. You can do so by permitting redistribution under
+these terms (or, alternatively, under the terms of the ordinary General Public
+License).
+
+To apply these terms, attach the following notices to the library. It is safest
+to attach them to the start of each source file to most effectively convey
+the exclusion of warranty; and each file should have at least the "copyright"
+line and a pointer to where the full notice is found.
+
+< one line to give the library's name and an idea of what it does. >
+
+Copyright (C) < year > < name of author >
+
+This library is free software; you can redistribute it and/or modify it under
+the terms of the GNU Lesser General Public License as published by the Free
+Software Foundation; either version 2.1 of the License, or (at your option)
+any later version.
+
+This library is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
+details.
+
+You should have received a copy of the GNU Lesser General Public License along
+with this library; if not, write to the Free Software Foundation, Inc., 51
+Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA Also add information
+on how to contact you by electronic and paper mail.
+
+You should also get your employer (if you work as a programmer) or your school,
+if any, to sign a "copyright disclaimer" for the library, if necessary. Here
+is a sample; alter the names:
+
+Yoyodyne, Inc., hereby disclaims all copyright interest in
+
+the library `Frob' (a library for tweaking knobs) written
+
+by James Random Hacker.
+
+< signature of Ty Coon > , 1 April 1990
+
+Ty Coon, President of Vice
+
+That's all there is to it!
diff --git a/meta/files/common-licenses/LGPL-2.1-or-later b/meta/files/common-licenses/LGPL-2.1-or-later
new file mode 100644
index 0000000000..04bb156e77
--- /dev/null
+++ b/meta/files/common-licenses/LGPL-2.1-or-later
@@ -0,0 +1,468 @@
+GNU LESSER GENERAL PUBLIC LICENSE
+
+Version 2.1, February 1999
+
+Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+
+51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+[This is the first released version of the Lesser GPL. It also counts as the
+successor of the GNU Library Public License, version 2, hence the version
+number 2.1.]
+
+Preamble
+
+The licenses for most software are designed to take away your freedom to share
+and change it. By contrast, the GNU General Public Licenses are intended to
+guarantee your freedom to share and change free software--to make sure the
+software is free for all its users.
+
+This license, the Lesser General Public License, applies to some specially
+designated software packages--typically libraries--of the Free Software Foundation
+and other authors who decide to use it. You can use it too, but we suggest
+you first think carefully about whether this license or the ordinary General
+Public License is the better strategy to use in any particular case, based
+on the explanations below.
+
+When we speak of free software, we are referring to freedom of use, not price.
+Our General Public Licenses are designed to make sure that you have the freedom
+to distribute copies of free software (and charge for this service if you
+wish); that you receive source code or can get it if you want it; that you
+can change the software and use pieces of it in new free programs; and that
+you are informed that you can do these things.
+
+To protect your rights, we need to make restrictions that forbid distributors
+to deny you these rights or to ask you to surrender these rights. These restrictions
+translate to certain responsibilities for you if you distribute copies of
+the library or if you modify it.
+
+For example, if you distribute copies of the library, whether gratis or for
+a fee, you must give the recipients all the rights that we gave you. You must
+make sure that they, too, receive or can get the source code. If you link
+other code with the library, you must provide complete object files to the
+recipients, so that they can relink them with the library after making changes
+to the library and recompiling it. And you must show them these terms so they
+know their rights.
+
+We protect your rights with a two-step method: (1) we copyright the library,
+and (2) we offer you this license, which gives you legal permission to copy,
+distribute and/or modify the library.
+
+To protect each distributor, we want to make it very clear that there is no
+warranty for the free library. Also, if the library is modified by someone
+else and passed on, the recipients should know that what they have is not
+the original version, so that the original author's reputation will not be
+affected by problems that might be introduced by others.
+
+Finally, software patents pose a constant threat to the existence of any free
+program. We wish to make sure that a company cannot effectively restrict the
+users of a free program by obtaining a restrictive license from a patent holder.
+Therefore, we insist that any patent license obtained for a version of the
+library must be consistent with the full freedom of use specified in this
+license.
+
+Most GNU software, including some libraries, is covered by the ordinary GNU
+General Public License. This license, the GNU Lesser General Public License,
+applies to certain designated libraries, and is quite different from the ordinary
+General Public License. We use this license for certain libraries in order
+to permit linking those libraries into non-free programs.
+
+When a program is linked with a library, whether statically or using a shared
+library, the combination of the two is legally speaking a combined work, a
+derivative of the original library. The ordinary General Public License therefore
+permits such linking only if the entire combination fits its criteria of freedom.
+The Lesser General Public License permits more lax criteria for linking other
+code with the library.
+
+We call this license the "Lesser" General Public License because it does Less
+to protect the user's freedom than the ordinary General Public License. It
+also provides other free software developers Less of an advantage over competing
+non-free programs. These disadvantages are the reason we use the ordinary
+General Public License for many libraries. However, the Lesser license provides
+advantages in certain special circumstances.
+
+For example, on rare occasions, there may be a special need to encourage the
+widest possible use of a certain library, so that it becomes a de-facto standard.
+To achieve this, non-free programs must be allowed to use the library. A more
+frequent case is that a free library does the same job as widely used non-free
+libraries. In this case, there is little to gain by limiting the free library
+to free software only, so we use the Lesser General Public License.
+
+In other cases, permission to use a particular library in non-free programs
+enables a greater number of people to use a large body of free software. For
+example, permission to use the GNU C Library in non-free programs enables
+many more people to use the whole GNU operating system, as well as its variant,
+the GNU/Linux operating system.
+
+Although the Lesser General Public License is Less protective of the users'
+freedom, it does ensure that the user of a program that is linked with the
+Library has the freedom and the wherewithal to run that program using a modified
+version of the Library.
+
+The precise terms and conditions for copying, distribution and modification
+follow. Pay close attention to the difference between a "work based on the
+library" and a "work that uses the library". The former contains code derived
+from the library, whereas the latter must be combined with the library in
+order to run.
+
+TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+
+0. This License Agreement applies to any software library or other program
+which contains a notice placed by the copyright holder or other authorized
+party saying it may be distributed under the terms of this Lesser General
+Public License (also called "this License"). Each licensee is addressed as
+"you".
+
+A "library" means a collection of software functions and/or data prepared
+so as to be conveniently linked with application programs (which use some
+of those functions and data) to form executables.
+
+The "Library", below, refers to any such software library or work which has
+been distributed under these terms. A "work based on the Library" means either
+the Library or any derivative work under copyright law: that is to say, a
+work containing the Library or a portion of it, either verbatim or with modifications
+and/or translated straightforwardly into another language. (Hereinafter, translation
+is included without limitation in the term "modification".)
+
+"Source code" for a work means the preferred form of the work for making modifications
+to it. For a library, complete source code means all the source code for all
+modules it contains, plus any associated interface definition files, plus
+the scripts used to control compilation and installation of the library.
+
+Activities other than copying, distribution and modification are not covered
+by this License; they are outside its scope. The act of running a program
+using the Library is not restricted, and output from such a program is covered
+only if its contents constitute a work based on the Library (independent of
+the use of the Library in a tool for writing it). Whether that is true depends
+on what the Library does and what the program that uses the Library does.
+
+1. You may copy and distribute verbatim copies of the Library's complete source
+code as you receive it, in any medium, provided that you conspicuously and
+appropriately publish on each copy an appropriate copyright notice and disclaimer
+of warranty; keep intact all the notices that refer to this License and to
+the absence of any warranty; and distribute a copy of this License along with
+the Library.
+
+You may charge a fee for the physical act of transferring a copy, and you
+may at your option offer warranty protection in exchange for a fee.
+
+2. You may modify your copy or copies of the Library or any portion of it,
+thus forming a work based on the Library, and copy and distribute such modifications
+or work under the terms of Section 1 above, provided that you also meet all
+of these conditions:
+
+      a) The modified work must itself be a software library.
+
+b) You must cause the files modified to carry prominent notices stating that
+you changed the files and the date of any change.
+
+c) You must cause the whole of the work to be licensed at no charge to all
+third parties under the terms of this License.
+
+d) If a facility in the modified Library refers to a function or a table of
+data to be supplied by an application program that uses the facility, other
+than as an argument passed when the facility is invoked, then you must make
+a good faith effort to ensure that, in the event an application does not supply
+such function or table, the facility still operates, and performs whatever
+part of its purpose remains meaningful.
+
+(For example, a function in a library to compute square roots has a purpose
+that is entirely well-defined independent of the application. Therefore, Subsection
+2d requires that any application-supplied function or table used by this function
+must be optional: if the application does not supply it, the square root function
+must still compute square roots.)
+
+These requirements apply to the modified work as a whole. If identifiable
+sections of that work are not derived from the Library, and can be reasonably
+considered independent and separate works in themselves, then this License,
+and its terms, do not apply to those sections when you distribute them as
+separate works. But when you distribute the same sections as part of a whole
+which is a work based on the Library, the distribution of the whole must be
+on the terms of this License, whose permissions for other licensees extend
+to the entire whole, and thus to each and every part regardless of who wrote
+it.
+
+Thus, it is not the intent of this section to claim rights or contest your
+rights to work written entirely by you; rather, the intent is to exercise
+the right to control the distribution of derivative or collective works based
+on the Library.
+
+In addition, mere aggregation of another work not based on the Library with
+the Library (or with a work based on the Library) on a volume of a storage
+or distribution medium does not bring the other work under the scope of this
+License.
+
+3. You may opt to apply the terms of the ordinary GNU General Public License
+instead of this License to a given copy of the Library. To do this, you must
+alter all the notices that refer to this License, so that they refer to the
+ordinary GNU General Public License, version 2, instead of to this License.
+(If a newer version than version 2 of the ordinary GNU General Public License
+has appeared, then you can specify that version instead if you wish.) Do not
+make any other change in these notices.
+
+Once this change is made in a given copy, it is irreversible for that copy,
+so the ordinary GNU General Public License applies to all subsequent copies
+and derivative works made from that copy.
+
+This option is useful when you wish to copy part of the code of the Library
+into a program that is not a library.
+
+4. You may copy and distribute the Library (or a portion or derivative of
+it, under Section 2) in object code or executable form under the terms of
+Sections 1 and 2 above provided that you accompany it with the complete corresponding
+machine-readable source code, which must be distributed under the terms of
+Sections 1 and 2 above on a medium customarily used for software interchange.
+
+If distribution of object code is made by offering access to copy from a designated
+place, then offering equivalent access to copy the source code from the same
+place satisfies the requirement to distribute the source code, even though
+third parties are not compelled to copy the source along with the object code.
+
+5. A program that contains no derivative of any portion of the Library, but
+is designed to work with the Library by being compiled or linked with it,
+is called a "work that uses the Library". Such a work, in isolation, is not
+a derivative work of the Library, and therefore falls outside the scope of
+this License.
+
+However, linking a "work that uses the Library" with the Library creates an
+executable that is a derivative of the Library (because it contains portions
+of the Library), rather than a "work that uses the library". The executable
+is therefore covered by this License. Section 6 states terms for distribution
+of such executables.
+
+When a "work that uses the Library" uses material from a header file that
+is part of the Library, the object code for the work may be a derivative work
+of the Library even though the source code is not. Whether this is true is
+especially significant if the work can be linked without the Library, or if
+the work is itself a library. The threshold for this to be true is not precisely
+defined by law.
+
+If such an object file uses only numerical parameters, data structure layouts
+and accessors, and small macros and small inline functions (ten lines or less
+in length), then the use of the object file is unrestricted, regardless of
+whether it is legally a derivative work. (Executables containing this object
+code plus portions of the Library will still fall under Section 6.)
+
+Otherwise, if the work is a derivative of the Library, you may distribute
+the object code for the work under the terms of Section 6. Any executables
+containing that work also fall under Section 6, whether or not they are linked
+directly with the Library itself.
+
+6. As an exception to the Sections above, you may also combine or link a "work
+that uses the Library" with the Library to produce a work containing portions
+of the Library, and distribute that work under terms of your choice, provided
+that the terms permit modification of the work for the customer's own use
+and reverse engineering for debugging such modifications.
+
+You must give prominent notice with each copy of the work that the Library
+is used in it and that the Library and its use are covered by this License.
+You must supply a copy of this License. If the work during execution displays
+copyright notices, you must include the copyright notice for the Library among
+them, as well as a reference directing the user to the copy of this License.
+Also, you must do one of these things:
+
+a) Accompany the work with the complete corresponding machine-readable source
+code for the Library including whatever changes were used in the work (which
+must be distributed under Sections 1 and 2 above); and, if the work is an
+executable linked with the Library, with the complete machine-readable "work
+that uses the Library", as object code and/or source code, so that the user
+can modify the Library and then relink to produce a modified executable containing
+the modified Library. (It is understood that the user who changes the contents
+of definitions files in the Library will not necessarily be able to recompile
+the application to use the modified definitions.)
+
+b) Use a suitable shared library mechanism for linking with the Library. A
+suitable mechanism is one that (1) uses at run time a copy of the library
+already present on the user's computer system, rather than copying library
+functions into the executable, and (2) will operate properly with a modified
+version of the library, if the user installs one, as long as the modified
+version is interface-compatible with the version that the work was made with.
+
+c) Accompany the work with a written offer, valid for at least three years,
+to give the same user the materials specified in Subsection 6a, above, for
+a charge no more than the cost of performing this distribution.
+
+d) If distribution of the work is made by offering access to copy from a designated
+place, offer equivalent access to copy the above specified materials from
+the same place.
+
+e) Verify that the user has already received a copy of these materials or
+that you have already sent this user a copy.
+
+For an executable, the required form of the "work that uses the Library" must
+include any data and utility programs needed for reproducing the executable
+from it. However, as a special exception, the materials to be distributed
+need not include anything that is normally distributed (in either source or
+binary form) with the major components (compiler, kernel, and so on) of the
+operating system on which the executable runs, unless that component itself
+accompanies the executable.
+
+It may happen that this requirement contradicts the license restrictions of
+other proprietary libraries that do not normally accompany the operating system.
+Such a contradiction means you cannot use both them and the Library together
+in an executable that you distribute.
+
+7. You may place library facilities that are a work based on the Library side-by-side
+in a single library together with other library facilities not covered by
+this License, and distribute such a combined library, provided that the separate
+distribution of the work based on the Library and of the other library facilities
+is otherwise permitted, and provided that you do these two things:
+
+a) Accompany the combined library with a copy of the same work based on the
+Library, uncombined with any other library facilities. This must be distributed
+under the terms of the Sections above.
+
+b) Give prominent notice with the combined library of the fact that part of
+it is a work based on the Library, and explaining where to find the accompanying
+uncombined form of the same work.
+
+8. You may not copy, modify, sublicense, link with, or distribute the Library
+except as expressly provided under this License. Any attempt otherwise to
+copy, modify, sublicense, link with, or distribute the Library is void, and
+will automatically terminate your rights under this License. However, parties
+who have received copies, or rights, from you under this License will not
+have their licenses terminated so long as such parties remain in full compliance.
+
+9. You are not required to accept this License, since you have not signed
+it. However, nothing else grants you permission to modify or distribute the
+Library or its derivative works. These actions are prohibited by law if you
+do not accept this License. Therefore, by modifying or distributing the Library
+(or any work based on the Library), you indicate your acceptance of this License
+to do so, and all its terms and conditions for copying, distributing or modifying
+the Library or works based on it.
+
+10. Each time you redistribute the Library (or any work based on the Library),
+the recipient automatically receives a license from the original licensor
+to copy, distribute, link with or modify the Library subject to these terms
+and conditions. You may not impose any further restrictions on the recipients'
+exercise of the rights granted herein. You are not responsible for enforcing
+compliance by third parties with this License.
+
+11. If, as a consequence of a court judgment or allegation of patent infringement
+or for any other reason (not limited to patent issues), conditions are imposed
+on you (whether by court order, agreement or otherwise) that contradict the
+conditions of this License, they do not excuse you from the conditions of
+this License. If you cannot distribute so as to satisfy simultaneously your
+obligations under this License and any other pertinent obligations, then as
+a consequence you may not distribute the Library at all. For example, if a
+patent license would not permit royalty-free redistribution of the Library
+by all those who receive copies directly or indirectly through you, then the
+only way you could satisfy both it and this License would be to refrain entirely
+from distribution of the Library.
+
+If any portion of this section is held invalid or unenforceable under any
+particular circumstance, the balance of the section is intended to apply,
+and the section as a whole is intended to apply in other circumstances.
+
+It is not the purpose of this section to induce you to infringe any patents
+or other property right claims or to contest validity of any such claims;
+this section has the sole purpose of protecting the integrity of the free
+software distribution system which is implemented by public license practices.
+Many people have made generous contributions to the wide range of software
+distributed through that system in reliance on consistent application of that
+system; it is up to the author/donor to decide if he or she is willing to
+distribute software through any other system and a licensee cannot impose
+that choice.
+
+This section is intended to make thoroughly clear what is believed to be a
+consequence of the rest of this License.
+
+12. If the distribution and/or use of the Library is restricted in certain
+countries either by patents or by copyrighted interfaces, the original copyright
+holder who places the Library under this License may add an explicit geographical
+distribution limitation excluding those countries, so that distribution is
+permitted only in or among countries not thus excluded. In such case, this
+License incorporates the limitation as if written in the body of this License.
+
+13. The Free Software Foundation may publish revised and/or new versions of
+the Lesser General Public License from time to time. Such new versions will
+be similar in spirit to the present version, but may differ in detail to address
+new problems or concerns.
+
+Each version is given a distinguishing version number. If the Library specifies
+a version number of this License which applies to it and "any later version",
+you have the option of following the terms and conditions either of that version
+or of any later version published by the Free Software Foundation. If the
+Library does not specify a license version number, you may choose any version
+ever published by the Free Software Foundation.
+
+14. If you wish to incorporate parts of the Library into other free programs
+whose distribution conditions are incompatible with these, write to the author
+to ask for permission. For software which is copyrighted by the Free Software
+Foundation, write to the Free Software Foundation; we sometimes make exceptions
+for this. Our decision will be guided by the two goals of preserving the free
+status of all derivatives of our free software and of promoting the sharing
+and reuse of software generally.
+
+   NO WARRANTY
+
+15. BECAUSE THE LIBRARY IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR
+THE LIBRARY, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE
+STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE LIBRARY
+"AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
+OF THE LIBRARY IS WITH YOU. SHOULD THE LIBRARY PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+16. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE
+THE LIBRARY AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE
+OR INABILITY TO USE THE LIBRARY (INCLUDING BUT NOT LIMITED TO LOSS OF DATA
+OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES
+OR A FAILURE OF THE LIBRARY TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF SUCH
+HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+END OF TERMS AND CONDITIONS
+
+How to Apply These Terms to Your New Libraries
+
+If you develop a new library, and you want it to be of the greatest possible
+use to the public, we recommend making it free software that everyone can
+redistribute and change. You can do so by permitting redistribution under
+these terms (or, alternatively, under the terms of the ordinary General Public
+License).
+
+To apply these terms, attach the following notices to the library. It is safest
+to attach them to the start of each source file to most effectively convey
+the exclusion of warranty; and each file should have at least the "copyright"
+line and a pointer to where the full notice is found.
+
+<one line to give the library's name and an idea of what it does.>
+
+Copyright (C) <year> <name of author>
+
+This library is free software; you can redistribute it and/or modify it under
+the terms of the GNU Lesser General Public License as published by the Free
+Software Foundation; either version 2.1 of the License, or (at your option)
+any later version.
+
+This library is distributed in the hope that it will be useful, but WITHOUT
+ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
+FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
+details.
+
+You should have received a copy of the GNU Lesser General Public License along
+with this library; if not, write to the Free Software Foundation, Inc., 51
+Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+
+Also add information on how to contact you by electronic and paper mail.
+
+You should also get your employer (if you work as a programmer) or your school,
+if any, to sign a "copyright disclaimer" for the library, if necessary. Here
+is a sample; alter the names:
+
+Yoyodyne, Inc., hereby disclaims all copyright interest in
+
+the library `Frob' (a library for tweaking knobs) written
+
+by James Random Hacker.
+
+< signature of Ty Coon > , 1 April 1990
+
+Ty Coon, President of Vice
+
+That's all there is to it!
diff --git a/meta/files/common-licenses/LGPL-3.0 b/meta/files/common-licenses/LGPL-3.0
deleted file mode 100644
index 6be29bf206..0000000000
--- a/meta/files/common-licenses/LGPL-3.0
+++ /dev/null
@@ -1,65 +0,0 @@
-GNU LESSER GENERAL PUBLIC LICENSE
-
-Version 3, 29 June 2007
-
-Copyright © 2007 Free Software Foundation, Inc. <http://fsf.org/>
-
-Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.
-
-This version of the GNU Lesser General Public License incorporates the terms and conditions of version 3 of the GNU General Public License, supplemented by the additional permissions listed below.
-0. Additional Definitions.
-
-As used herein, “this License” refers to version 3 of the GNU Lesser General Public License, and the “GNU GPL” refers to version 3 of the GNU General Public License.
-
-“The Library” refers to a covered work governed by this License, other than an Application or a Combined Work as defined below.
-
-An “Application” is any work that makes use of an interface provided by the Library, but which is not otherwise based on the Library. Defining a subclass of a class defined by the Library is deemed a mode of using an interface provided by the Library.
-
-A “Combined Work” is a work produced by combining or linking an Application with the Library. The particular version of the Library with which the Combined Work was made is also called the “Linked Version”.
-
-The “Minimal Corresponding Source” for a Combined Work means the Corresponding Source for the Combined Work, excluding any source code for portions of the Combined Work that, considered in isolation, are based on the Application, and not on the Linked Version.
-
-The “Corresponding Application Code” for a Combined Work means the object code and/or source code for the Application, including any data and utility programs needed for reproducing the Combined Work from the Application, but excluding the System Libraries of the Combined Work.
-1. Exception to Section 3 of the GNU GPL.
-
-You may convey a covered work under sections 3 and 4 of this License without being bound by section 3 of the GNU GPL.
-2. Conveying Modified Versions.
-
-If you modify a copy of the Library, and, in your modifications, a facility refers to a function or data to be supplied by an Application that uses the facility (other than as an argument passed when the facility is invoked), then you may convey a copy of the modified version:
-
-    * a) under this License, provided that you make a good faith effort to ensure that, in the event an Application does not supply the function or data, the facility still operates, and performs whatever part of its purpose remains meaningful, or
-    * b) under the GNU GPL, with none of the additional permissions of this License applicable to that copy.
-
-3. Object Code Incorporating Material from Library Header Files.
-
-The object code form of an Application may incorporate material from a header file that is part of the Library. You may convey such object code under terms of your choice, provided that, if the incorporated material is not limited to numerical parameters, data structure layouts and accessors, or small macros, inline functions and templates (ten or fewer lines in length), you do both of the following:
-
-    * a) Give prominent notice with each copy of the object code that the Library is used in it and that the Library and its use are covered by this License.
-    * b) Accompany the object code with a copy of the GNU GPL and this license document.
-
-4. Combined Works.
-
-You may convey a Combined Work under terms of your choice that, taken together, effectively do not restrict modification of the portions of the Library contained in the Combined Work and reverse engineering for debugging such modifications, if you also do each of the following:
-
-    * a) Give prominent notice with each copy of the Combined Work that the Library is used in it and that the Library and its use are covered by this License.
-    * b) Accompany the Combined Work with a copy of the GNU GPL and this license document.
-    * c) For a Combined Work that displays copyright notices during execution, include the copyright notice for the Library among these notices, as well as a reference directing the user to the copies of the GNU GPL and this license document.
-    * d) Do one of the following:
-          o 0) Convey the Minimal Corresponding Source under the terms of this License, and the Corresponding Application Code in a form suitable for, and under terms that permit, the user to recombine or relink the Application with a modified version of the Linked Version to produce a modified Combined Work, in the manner specified by section 6 of the GNU GPL for conveying Corresponding Source.
-          o 1) Use a suitable shared library mechanism for linking with the Library. A suitable mechanism is one that (a) uses at run time a copy of the Library already present on the user's computer system, and (b) will operate properly with a modified version of the Library that is interface-compatible with the Linked Version.
-    * e) Provide Installation Information, but only if you would otherwise be required to provide such information under section 6 of the GNU GPL, and only to the extent that such information is necessary to install and execute a modified version of the Combined Work produced by recombining or relinking the Application with a modified version of the Linked Version. (If you use option 4d0, the Installation Information must accompany the Minimal Corresponding Source and Corresponding Application Code. If you use option 4d1, you must provide the Installation Information in the manner specified by section 6 of the GNU GPL for conveying Corresponding Source.)
-
-5. Combined Libraries.
-
-You may place library facilities that are a work based on the Library side by side in a single library together with other library facilities that are not Applications and are not covered by this License, and convey such a combined library under terms of your choice, if you do both of the following:
-
-    * a) Accompany the combined library with a copy of the same work based on the Library, uncombined with any other library facilities, conveyed under the terms of this License.
-    * b) Give prominent notice with the combined library that part of it is a work based on the Library, and explaining where to find the accompanying uncombined form of the same work.
-
-6. Revised Versions of the GNU Lesser General Public License.
-
-The Free Software Foundation may publish revised and/or new versions of the GNU Lesser General Public License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns.
-
-Each version is given a distinguishing version number. If the Library as you received it specifies that a certain numbered version of the GNU Lesser General Public License “or any later version” applies to it, you have the option of following the terms and conditions either of that published version or of any later version published by the Free Software Foundation. If the Library as you received it does not specify a version number of the GNU Lesser General Public License, you may choose any version of the GNU Lesser General Public License ever published by the Free Software Foundation.
-
-If the Library as you received it specifies that a proxy can decide whether future versions of the GNU Lesser General Public License shall apply, that proxy's public statement of acceptance of any version is permanent authorization for you to choose that version for the Library.
diff --git a/meta/files/common-licenses/LGPL-3.0-only b/meta/files/common-licenses/LGPL-3.0-only
new file mode 100644
index 0000000000..bd405afbef
--- /dev/null
+++ b/meta/files/common-licenses/LGPL-3.0-only
@@ -0,0 +1,163 @@
+GNU LESSER GENERAL PUBLIC LICENSE
+
+Version 3, 29 June 2007
+
+Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+This version of the GNU Lesser General Public License incorporates the terms
+and conditions of version 3 of the GNU General Public License, supplemented
+by the additional permissions listed below.
+
+   0. Additional Definitions.
+
+      
+
+As used herein, "this License" refers to version 3 of the GNU Lesser General
+Public License, and the "GNU GPL" refers to version 3 of the GNU General Public
+License.
+
+      
+
+"The Library" refers to a covered work governed by this License, other than
+an Application or a Combined Work as defined below.
+
+      
+
+An "Application" is any work that makes use of an interface provided by the
+Library, but which is not otherwise based on the Library. Defining a subclass
+of a class defined by the Library is deemed a mode of using an interface provided
+by the Library.
+
+      
+
+A "Combined Work" is a work produced by combining or linking an Application
+with the Library. The particular version of the Library with which the Combined
+Work was made is also called the "Linked Version".
+
+      
+
+The "Minimal Corresponding Source" for a Combined Work means the Corresponding
+Source for the Combined Work, excluding any source code for portions of the
+Combined Work that, considered in isolation, are based on the Application,
+and not on the Linked Version.
+
+      
+
+The "Corresponding Application Code" for a Combined Work means the object
+code and/or source code for the Application, including any data and utility
+programs needed for reproducing the Combined Work from the Application, but
+excluding the System Libraries of the Combined Work.
+
+   1. Exception to Section 3 of the GNU GPL.
+
+You may convey a covered work under sections 3 and 4 of this License without
+being bound by section 3 of the GNU GPL.
+
+   2. Conveying Modified Versions.
+
+If you modify a copy of the Library, and, in your modifications, a facility
+refers to a function or data to be supplied by an Application that uses the
+facility (other than as an argument passed when the facility is invoked),
+then you may convey a copy of the modified version:
+
+a) under this License, provided that you make a good faith effort to ensure
+that, in the event an Application does not supply the function or data, the
+facility still operates, and performs whatever part of its purpose remains
+meaningful, or
+
+b) under the GNU GPL, with none of the additional permissions of this License
+applicable to that copy.
+
+   3. Object Code Incorporating Material from Library Header Files.
+
+The object code form of an Application may incorporate material from a header
+file that is part of the Library. You may convey such object code under terms
+of your choice, provided that, if the incorporated material is not limited
+to numerical parameters, data structure layouts and accessors, or small macros,
+inline functions and templates (ten or fewer lines in length), you do both
+of the following:
+
+a) Give prominent notice with each copy of the object code that the Library
+is used in it and that the Library and its use are covered by this License.
+
+b) Accompany the object code with a copy of the GNU GPL and this license document.
+
+   4. Combined Works.
+
+You may convey a Combined Work under terms of your choice that, taken together,
+effectively do not restrict modification of the portions of the Library contained
+in the Combined Work and reverse engineering for debugging such modifications,
+if you also do each of the following:
+
+a) Give prominent notice with each copy of the Combined Work that the Library
+is used in it and that the Library and its use are covered by this License.
+
+b) Accompany the Combined Work with a copy of the GNU GPL and this license
+document.
+
+c) For a Combined Work that displays copyright notices during execution, include
+the copyright notice for the Library among these notices, as well as a reference
+directing the user to the copies of the GNU GPL and this license document.
+
+      d) Do one of the following:
+
+0) Convey the Minimal Corresponding Source under the terms of this License,
+and the Corresponding Application Code in a form suitable for, and under terms
+that permit, the user to recombine or relink the Application with a modified
+version of the Linked Version to produce a modified Combined Work, in the
+manner specified by section 6 of the GNU GPL for conveying Corresponding Source.
+
+1) Use a suitable shared library mechanism for linking with the Library. A
+suitable mechanism is one that (a) uses at run time a copy of the Library
+already present on the user's computer system, and (b) will operate properly
+with a modified version of the Library that is interface-compatible with the
+Linked Version.
+
+e) Provide Installation Information, but only if you would otherwise be required
+to provide such information under section 6 of the GNU GPL, and only to the
+extent that such information is necessary to install and execute a modified
+version of the Combined Work produced by recombining or relinking the Application
+with a modified version of the Linked Version. (If you use option 4d0, the
+Installation Information must accompany the Minimal Corresponding Source and
+Corresponding Application Code. If you use option 4d1, you must provide the
+Installation Information in the manner specified by section 6 of the GNU GPL
+for conveying Corresponding Source.)
+
+   5. Combined Libraries.
+
+You may place library facilities that are a work based on the Library side
+by side in a single library together with other library facilities that are
+not Applications and are not covered by this License, and convey such a combined
+library under terms of your choice, if you do both of the following:
+
+a) Accompany the combined library with a copy of the same work based on the
+Library, uncombined with any other library facilities, conveyed under the
+terms of this License.
+
+b) Give prominent notice with the combined library that part of it is a work
+based on the Library, and explaining where to find the accompanying uncombined
+form of the same work.
+
+   6. Revised Versions of the GNU Lesser General Public License.
+
+The Free Software Foundation may publish revised and/or new versions of the
+GNU Lesser General Public License from time to time. Such new versions will
+be similar in spirit to the present version, but may differ in detail to address
+new problems or concerns.
+
+Each version is given a distinguishing version number. If the Library as you
+received it specifies that a certain numbered version of the GNU Lesser General
+Public License "or any later version" applies to it, you have the option of
+following the terms and conditions either of that published version or of
+any later version published by the Free Software Foundation. If the Library
+as you received it does not specify a version number of the GNU Lesser General
+Public License, you may choose any version of the GNU Lesser General Public
+License ever published by the Free Software Foundation.
+
+If the Library as you received it specifies that a proxy can decide whether
+future versions of the GNU Lesser General Public License shall apply, that
+proxy's public statement of acceptance of any version is permanent authorization
+for you to choose that version for the Library.
diff --git a/meta/files/common-licenses/LGPL-3.0-or-later b/meta/files/common-licenses/LGPL-3.0-or-later
new file mode 100644
index 0000000000..bd405afbef
--- /dev/null
+++ b/meta/files/common-licenses/LGPL-3.0-or-later
@@ -0,0 +1,163 @@
+GNU LESSER GENERAL PUBLIC LICENSE
+
+Version 3, 29 June 2007
+
+Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+
+Everyone is permitted to copy and distribute verbatim copies of this license
+document, but changing it is not allowed.
+
+This version of the GNU Lesser General Public License incorporates the terms
+and conditions of version 3 of the GNU General Public License, supplemented
+by the additional permissions listed below.
+
+   0. Additional Definitions.
+
+      
+
+As used herein, "this License" refers to version 3 of the GNU Lesser General
+Public License, and the "GNU GPL" refers to version 3 of the GNU General Public
+License.
+
+      
+
+"The Library" refers to a covered work governed by this License, other than
+an Application or a Combined Work as defined below.
+
+      
+
+An "Application" is any work that makes use of an interface provided by the
+Library, but which is not otherwise based on the Library. Defining a subclass
+of a class defined by the Library is deemed a mode of using an interface provided
+by the Library.
+
+      
+
+A "Combined Work" is a work produced by combining or linking an Application
+with the Library. The particular version of the Library with which the Combined
+Work was made is also called the "Linked Version".
+
+      
+
+The "Minimal Corresponding Source" for a Combined Work means the Corresponding
+Source for the Combined Work, excluding any source code for portions of the
+Combined Work that, considered in isolation, are based on the Application,
+and not on the Linked Version.
+
+      
+
+The "Corresponding Application Code" for a Combined Work means the object
+code and/or source code for the Application, including any data and utility
+programs needed for reproducing the Combined Work from the Application, but
+excluding the System Libraries of the Combined Work.
+
+   1. Exception to Section 3 of the GNU GPL.
+
+You may convey a covered work under sections 3 and 4 of this License without
+being bound by section 3 of the GNU GPL.
+
+   2. Conveying Modified Versions.
+
+If you modify a copy of the Library, and, in your modifications, a facility
+refers to a function or data to be supplied by an Application that uses the
+facility (other than as an argument passed when the facility is invoked),
+then you may convey a copy of the modified version:
+
+a) under this License, provided that you make a good faith effort to ensure
+that, in the event an Application does not supply the function or data, the
+facility still operates, and performs whatever part of its purpose remains
+meaningful, or
+
+b) under the GNU GPL, with none of the additional permissions of this License
+applicable to that copy.
+
+   3. Object Code Incorporating Material from Library Header Files.
+
+The object code form of an Application may incorporate material from a header
+file that is part of the Library. You may convey such object code under terms
+of your choice, provided that, if the incorporated material is not limited
+to numerical parameters, data structure layouts and accessors, or small macros,
+inline functions and templates (ten or fewer lines in length), you do both
+of the following:
+
+a) Give prominent notice with each copy of the object code that the Library
+is used in it and that the Library and its use are covered by this License.
+
+b) Accompany the object code with a copy of the GNU GPL and this license document.
+
+   4. Combined Works.
+
+You may convey a Combined Work under terms of your choice that, taken together,
+effectively do not restrict modification of the portions of the Library contained
+in the Combined Work and reverse engineering for debugging such modifications,
+if you also do each of the following:
+
+a) Give prominent notice with each copy of the Combined Work that the Library
+is used in it and that the Library and its use are covered by this License.
+
+b) Accompany the Combined Work with a copy of the GNU GPL and this license
+document.
+
+c) For a Combined Work that displays copyright notices during execution, include
+the copyright notice for the Library among these notices, as well as a reference
+directing the user to the copies of the GNU GPL and this license document.
+
+      d) Do one of the following:
+
+0) Convey the Minimal Corresponding Source under the terms of this License,
+and the Corresponding Application Code in a form suitable for, and under terms
+that permit, the user to recombine or relink the Application with a modified
+version of the Linked Version to produce a modified Combined Work, in the
+manner specified by section 6 of the GNU GPL for conveying Corresponding Source.
+
+1) Use a suitable shared library mechanism for linking with the Library. A
+suitable mechanism is one that (a) uses at run time a copy of the Library
+already present on the user's computer system, and (b) will operate properly
+with a modified version of the Library that is interface-compatible with the
+Linked Version.
+
+e) Provide Installation Information, but only if you would otherwise be required
+to provide such information under section 6 of the GNU GPL, and only to the
+extent that such information is necessary to install and execute a modified
+version of the Combined Work produced by recombining or relinking the Application
+with a modified version of the Linked Version. (If you use option 4d0, the
+Installation Information must accompany the Minimal Corresponding Source and
+Corresponding Application Code. If you use option 4d1, you must provide the
+Installation Information in the manner specified by section 6 of the GNU GPL
+for conveying Corresponding Source.)
+
+   5. Combined Libraries.
+
+You may place library facilities that are a work based on the Library side
+by side in a single library together with other library facilities that are
+not Applications and are not covered by this License, and convey such a combined
+library under terms of your choice, if you do both of the following:
+
+a) Accompany the combined library with a copy of the same work based on the
+Library, uncombined with any other library facilities, conveyed under the
+terms of this License.
+
+b) Give prominent notice with the combined library that part of it is a work
+based on the Library, and explaining where to find the accompanying uncombined
+form of the same work.
+
+   6. Revised Versions of the GNU Lesser General Public License.
+
+The Free Software Foundation may publish revised and/or new versions of the
+GNU Lesser General Public License from time to time. Such new versions will
+be similar in spirit to the present version, but may differ in detail to address
+new problems or concerns.
+
+Each version is given a distinguishing version number. If the Library as you
+received it specifies that a certain numbered version of the GNU Lesser General
+Public License "or any later version" applies to it, you have the option of
+following the terms and conditions either of that published version or of
+any later version published by the Free Software Foundation. If the Library
+as you received it does not specify a version number of the GNU Lesser General
+Public License, you may choose any version of the GNU Lesser General Public
+License ever published by the Free Software Foundation.
+
+If the Library as you received it specifies that a proxy can decide whether
+future versions of the GNU Lesser General Public License shall apply, that
+proxy's public statement of acceptance of any version is permanent authorization
+for you to choose that version for the Library.
diff --git a/vscode-bitbake-build/bitbake-cookerdaemon.log b/vscode-bitbake-build/bitbake-cookerdaemon.log
new file mode 100644
index 0000000000..3a26e48b81
--- /dev/null
+++ b/vscode-bitbake-build/bitbake-cookerdaemon.log
@@ -0,0 +1,489 @@
+21941 10:14:26.922580 --- Starting bitbake server pid 21941 at 2020-10-13 10:14:26.922536 ---
+21941 10:14:26.935619 Started bitbake server pid 21941
+21941 10:14:26.936015 Entering server connection loop
+21941 10:14:26.936301 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+21941 10:14:26.937385 Processing Client
+21941 10:14:26.937601 Connecting Client
+21941 10:14:26.938871 Running command ['setFeatures', [2]]
+21941 10:14:26.939400 Command Completed
+21941 10:14:26.940960 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+21941 10:14:27.200468 Command Completed
+21941 10:14:27.201052 Processing Client
+21941 10:14:27.201147 Disconnecting Client
+21941 10:14:27.201289 No timeout, exiting.
+21941 10:14:27.301580 Exiting
+21941 10:14:27.307390 Original lockfile contents: ['21941\n']
+21941 10:14:27.307901 Exiting as we could obtain the lock
+21982 10:14:28.030878 --- Starting bitbake server pid 21982 at 2020-10-13 10:14:28.030823 ---
+21982 10:14:28.046813 Started bitbake server pid 21982
+21982 10:14:28.047264 Entering server connection loop
+21982 10:14:28.047597 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+21982 10:14:28.048432 Processing Client
+21982 10:14:28.048565 Connecting Client
+21982 10:14:28.049370 Running command ['setFeatures', [2, 1]]
+21982 10:14:28.049714 Command Completed
+21982 10:14:28.050910 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+21982 10:14:28.403314 Command Completed
+21982 10:14:28.403574 Running command ['clientComplete']
+21982 10:15:28.463371 Processing Client
+21982 10:15:28.463874 Disconnecting Client
+21982 10:15:28.464301 No timeout, exiting.
+21982 10:15:28.564754 Exiting
+21982 10:15:28.565145 Original lockfile contents: ['21982\n']
+21982 10:15:28.565480 Exiting as we could obtain the lock
+22092 10:15:29.991905 --- Starting bitbake server pid 22092 at 2020-10-13 10:15:29.991864 ---
+22092 10:15:30.004688 Started bitbake server pid 22092
+22092 10:15:30.005141 Entering server connection loop
+22092 10:15:30.005459 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+22092 10:15:30.006296 Processing Client
+22092 10:15:30.006418 Connecting Client
+22092 10:15:30.007004 Running command ['setFeatures', [2]]
+22092 10:15:30.007245 Command Completed
+22092 10:15:30.008316 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+22092 10:15:30.229327 Command Completed
+22092 10:15:30.230061 Processing Client
+22092 10:15:30.230163 Disconnecting Client
+22092 10:15:30.230336 No timeout, exiting.
+22092 10:15:30.330611 Exiting
+22092 10:15:30.331201 Original lockfile contents: ['22092\n']
+22092 10:15:30.331614 Exiting as we could obtain the lock
+22133 10:15:31.025300 --- Starting bitbake server pid 22133 at 2020-10-13 10:15:31.025258 ---
+22133 10:15:31.041082 Started bitbake server pid 22133
+22133 10:15:31.041409 Entering server connection loop
+22133 10:15:31.041694 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+22133 10:15:31.042623 Processing Client
+22133 10:15:31.042753 Connecting Client
+22133 10:15:31.043382 Running command ['setFeatures', [2, 1]]
+22133 10:15:31.043683 Command Completed
+22133 10:15:31.045398 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+22133 10:15:31.397901 Command Completed
+22133 10:15:31.398223 Running command ['clientComplete']
+22133 10:16:31.460009 Processing Client
+22133 10:16:31.460414 Disconnecting Client
+22133 10:16:31.460718 No timeout, exiting.
+22133 10:16:31.561072 Exiting
+22133 10:16:31.567237 Original lockfile contents: ['22133\n']
+22133 10:16:31.567735 Exiting as we could obtain the lock
+22250 10:16:33.044856 --- Starting bitbake server pid 22250 at 2020-10-13 10:16:33.044814 ---
+22250 10:16:33.058018 Started bitbake server pid 22250
+22250 10:16:33.058366 Entering server connection loop
+22250 10:16:33.058661 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+22250 10:16:33.059816 Processing Client
+22250 10:16:33.059991 Connecting Client
+22250 10:16:33.060776 Running command ['setFeatures', [2]]
+22250 10:16:33.061115 Command Completed
+22250 10:16:33.062208 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+22250 10:16:33.289998 Command Completed
+22250 10:16:33.290664 Processing Client
+22250 10:16:33.290760 Disconnecting Client
+22250 10:16:33.290924 No timeout, exiting.
+22250 10:16:33.391193 Exiting
+22250 10:16:33.391820 Original lockfile contents: ['22250\n']
+22250 10:16:33.392295 Exiting as we could obtain the lock
+22291 10:16:34.244701 --- Starting bitbake server pid 22291 at 2020-10-13 10:16:34.244626 ---
+22291 10:16:34.271254 Started bitbake server pid 22291
+22291 10:16:34.271910 Entering server connection loop
+22291 10:16:34.272349 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+22291 10:16:34.275054 Processing Client
+22291 10:16:34.275191 Connecting Client
+22291 10:16:34.275952 Running command ['setFeatures', [2, 1]]
+22291 10:16:34.276404 Command Completed
+22291 10:16:34.278188 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+22291 10:16:34.741090 Command Completed
+22291 10:16:34.741968 Running command ['clientComplete']
+22291 10:17:34.799978 Processing Client
+22291 10:17:34.800719 Disconnecting Client
+22291 10:17:34.801732 No timeout, exiting.
+22291 10:17:34.902151 Exiting
+22291 10:17:34.902630 Original lockfile contents: ['22291\n']
+22291 10:17:34.903053 Exiting as we could obtain the lock
+22683 10:17:36.454983 --- Starting bitbake server pid 22683 at 2020-10-13 10:17:36.454940 ---
+22683 10:17:36.468235 Started bitbake server pid 22683
+22683 10:17:36.468700 Entering server connection loop
+22683 10:17:36.469041 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+22683 10:17:36.469950 Processing Client
+22683 10:17:36.470055 Connecting Client
+22683 10:17:36.470841 Running command ['setFeatures', [2]]
+22683 10:17:36.471900 Command Completed
+22683 10:17:36.472469 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+22683 10:17:36.722246 Command Completed
+22683 10:17:36.722436 Processing Client
+22683 10:17:36.722518 Disconnecting Client
+22683 10:17:36.722679 No timeout, exiting.
+22683 10:17:36.822986 Exiting
+22683 10:17:36.823471 Original lockfile contents: ['22683\n']
+22683 10:17:36.823831 Exiting as we could obtain the lock
+22724 10:17:37.674534 --- Starting bitbake server pid 22724 at 2020-10-13 10:17:37.674492 ---
+22724 10:17:37.687061 Started bitbake server pid 22724
+22724 10:17:37.687468 Entering server connection loop
+22724 10:17:37.687803 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+22724 10:17:37.688455 Processing Client
+22724 10:17:37.688590 Connecting Client
+22724 10:17:37.689156 Running command ['setFeatures', [2, 1]]
+22724 10:17:37.689421 Command Completed
+22724 10:17:37.690502 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+22724 10:17:38.066125 Command Completed
+22724 10:17:38.066374 Running command ['clientComplete']
+22724 10:18:38.124019 Processing Client
+22724 10:18:38.124378 Disconnecting Client
+22724 10:18:38.125404 No timeout, exiting.
+22724 10:18:38.225778 Exiting
+22724 10:18:38.226184 Original lockfile contents: ['22724\n']
+22724 10:18:38.226491 Exiting as we could obtain the lock
+22915 10:18:39.774579 --- Starting bitbake server pid 22915 at 2020-10-13 10:18:39.774524 ---
+22915 10:18:39.793157 Started bitbake server pid 22915
+22915 10:18:39.793679 Entering server connection loop
+22915 10:18:39.794048 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+22915 10:18:39.794918 Processing Client
+22915 10:18:39.795068 Connecting Client
+22915 10:18:39.795812 Running command ['setFeatures', [2]]
+22915 10:18:39.796110 Command Completed
+22915 10:18:39.797351 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+22915 10:18:40.194486 Command Completed
+22915 10:18:40.195127 Processing Client
+22915 10:18:40.195221 Disconnecting Client
+22915 10:18:40.195375 No timeout, exiting.
+22915 10:18:40.295636 Exiting
+22915 10:18:40.303248 Original lockfile contents: ['22915\n']
+22915 10:18:40.303667 Exiting as we could obtain the lock
+22961 10:18:41.152035 --- Starting bitbake server pid 22961 at 2020-10-13 10:18:41.151991 ---
+22961 10:18:41.165625 Started bitbake server pid 22961
+22961 10:18:41.165949 Entering server connection loop
+22961 10:18:41.166189 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+22961 10:18:41.168579 Processing Client
+22961 10:18:41.168733 Connecting Client
+22961 10:18:41.169622 Running command ['setFeatures', [2, 1]]
+22961 10:18:41.169985 Command Completed
+22961 10:18:41.171667 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+22961 10:18:41.534332 Command Completed
+22961 10:18:41.534610 Running command ['clientComplete']
+22961 10:19:41.594665 Processing Client
+22961 10:19:41.595164 Disconnecting Client
+22961 10:19:41.595606 No timeout, exiting.
+22961 10:19:41.696047 Exiting
+22961 10:19:41.696515 Original lockfile contents: ['22961\n']
+22961 10:19:41.696899 Exiting as we could obtain the lock
+23189 10:19:43.314797 --- Starting bitbake server pid 23189 at 2020-10-13 10:19:43.314756 ---
+23189 10:19:43.329995 Started bitbake server pid 23189
+23189 10:19:43.330348 Entering server connection loop
+23189 10:19:43.330643 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+23189 10:19:43.331838 Processing Client
+23189 10:19:43.331945 Connecting Client
+23189 10:19:43.332763 Running command ['setFeatures', [2]]
+23189 10:19:43.333010 Command Completed
+23189 10:19:43.334101 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+23189 10:19:43.578222 Command Completed
+23189 10:19:43.578920 Processing Client
+23189 10:19:43.579053 Disconnecting Client
+23189 10:19:43.579241 No timeout, exiting.
+23189 10:19:43.679597 Exiting
+23189 10:19:43.680299 Original lockfile contents: ['23189\n']
+23189 10:19:43.681077 Exiting as we could obtain the lock
+23230 10:19:44.474698 --- Starting bitbake server pid 23230 at 2020-10-13 10:19:44.474650 ---
+23230 10:19:44.493348 Started bitbake server pid 23230
+23230 10:19:44.493831 Entering server connection loop
+23230 10:19:44.494209 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+23230 10:19:44.494401 Processing Client
+23230 10:19:44.494517 Connecting Client
+23230 10:19:44.495441 Running command ['setFeatures', [2, 1]]
+23230 10:19:44.495853 Command Completed
+23230 10:19:44.497829 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+23230 10:19:45.007872 Command Completed
+23230 10:19:45.008299 Running command ['clientComplete']
+23230 10:20:45.070302 Processing Client
+23230 10:20:45.070700 Disconnecting Client
+23230 10:20:45.071134 No timeout, exiting.
+23230 10:20:45.171545 Exiting
+23230 10:20:45.172013 Original lockfile contents: ['23230\n']
+23230 10:20:45.172403 Exiting as we could obtain the lock
+23515 10:20:46.682245 --- Starting bitbake server pid 23515 at 2020-10-13 10:20:46.682197 ---
+23515 10:20:46.696290 Started bitbake server pid 23515
+23515 10:20:46.696712 Entering server connection loop
+23515 10:20:46.697067 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+23515 10:20:46.697690 Processing Client
+23515 10:20:46.697812 Connecting Client
+23515 10:20:46.698698 Running command ['setFeatures', [2]]
+23515 10:20:46.700509 Command Completed
+23515 10:20:46.700883 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+23515 10:20:46.990986 Command Completed
+23515 10:20:46.992277 Processing Client
+23515 10:20:46.992415 Disconnecting Client
+23515 10:20:46.992573 No timeout, exiting.
+23515 10:20:47.092890 Exiting
+23515 10:20:47.099331 Original lockfile contents: ['23515\n']
+23515 10:20:47.099811 Exiting as we could obtain the lock
+23556 10:20:47.883655 --- Starting bitbake server pid 23556 at 2020-10-13 10:20:47.883612 ---
+23556 10:20:47.898146 Started bitbake server pid 23556
+23556 10:20:47.898716 Entering server connection loop
+23556 10:20:47.899090 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+23556 10:20:47.899976 Processing Client
+23556 10:20:47.900129 Connecting Client
+23556 10:20:47.900812 Running command ['setFeatures', [2, 1]]
+23556 10:20:47.901167 Command Completed
+23556 10:20:47.903070 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+23556 10:20:48.337445 Command Completed
+23556 10:20:48.337708 Running command ['clientComplete']
+23556 10:21:48.397076 Processing Client
+23556 10:21:48.397495 Disconnecting Client
+23556 10:21:48.397938 No timeout, exiting.
+23556 10:21:48.498381 Exiting
+23556 10:21:48.498777 Original lockfile contents: ['23556\n']
+23556 10:21:48.499098 Exiting as we could obtain the lock
+23776 10:21:49.924872 --- Starting bitbake server pid 23776 at 2020-10-13 10:21:49.924831 ---
+23776 10:21:49.938072 Started bitbake server pid 23776
+23776 10:21:49.938538 Entering server connection loop
+23776 10:21:49.938876 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+23776 10:21:49.939683 Processing Client
+23776 10:21:49.939802 Connecting Client
+23776 10:21:49.940350 Running command ['setFeatures', [2]]
+23776 10:21:49.940581 Command Completed
+23776 10:21:49.941535 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+23776 10:21:50.171355 Command Completed
+23776 10:21:50.171828 Processing Client
+23776 10:21:50.172002 Disconnecting Client
+23776 10:21:50.172150 No timeout, exiting.
+23776 10:21:50.272475 Exiting
+23776 10:21:50.279473 Original lockfile contents: ['23776\n']
+23776 10:21:50.279980 Exiting as we could obtain the lock
+23817 10:21:51.027538 --- Starting bitbake server pid 23817 at 2020-10-13 10:21:51.027495 ---
+23817 10:21:51.040766 Started bitbake server pid 23817
+23817 10:21:51.041223 Entering server connection loop
+23817 10:21:51.041554 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+23817 10:21:51.042644 Processing Client
+23817 10:21:51.042801 Connecting Client
+23817 10:21:51.043683 Running command ['setFeatures', [2, 1]]
+23817 10:21:51.044083 Command Completed
+23817 10:21:51.045220 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+23817 10:21:51.405486 Command Completed
+23817 10:21:51.405727 Running command ['clientComplete']
+23817 10:22:51.466799 Processing Client
+23817 10:22:51.467260 Disconnecting Client
+23817 10:22:51.467678 No timeout, exiting.
+23817 10:22:51.568110 Exiting
+23817 10:22:51.568556 Original lockfile contents: ['23817\n']
+23817 10:22:51.568894 Exiting as we could obtain the lock
+23969 10:22:53.003721 --- Starting bitbake server pid 23969 at 2020-10-13 10:22:53.003679 ---
+23969 10:22:53.016841 Started bitbake server pid 23969
+23969 10:22:53.017308 Entering server connection loop
+23969 10:22:53.017641 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+23969 10:22:53.018593 Processing Client
+23969 10:22:53.018723 Connecting Client
+23969 10:22:53.019316 Running command ['setFeatures', [2]]
+23969 10:22:53.019559 Command Completed
+23969 10:22:53.020575 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+23969 10:22:53.242031 Command Completed
+23969 10:22:53.242693 Processing Client
+23969 10:22:53.242789 Disconnecting Client
+23969 10:22:53.242981 No timeout, exiting.
+23969 10:22:53.343289 Exiting
+23969 10:22:53.343892 Original lockfile contents: ['23969\n']
+23969 10:22:53.344302 Exiting as we could obtain the lock
+24010 10:22:54.107290 --- Starting bitbake server pid 24010 at 2020-10-13 10:22:54.107249 ---
+24010 10:22:54.120643 Started bitbake server pid 24010
+24010 10:22:54.121123 Entering server connection loop
+24010 10:22:54.121476 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+24010 10:22:54.122333 Processing Client
+24010 10:22:54.122470 Connecting Client
+24010 10:22:54.123068 Running command ['setFeatures', [2, 1]]
+24010 10:22:54.123318 Command Completed
+24010 10:22:54.124446 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+24010 10:22:54.495101 Command Completed
+24010 10:22:54.495301 Running command ['clientComplete']
+24010 10:23:54.555885 Processing Client
+24010 10:23:54.556336 Disconnecting Client
+24010 10:23:54.556719 No timeout, exiting.
+24010 10:23:54.657138 Exiting
+24010 10:23:54.657612 Original lockfile contents: ['24010\n']
+24010 10:23:54.658001 Exiting as we could obtain the lock
+24215 10:23:56.115084 --- Starting bitbake server pid 24215 at 2020-10-13 10:23:56.115041 ---
+24215 10:23:56.131619 Started bitbake server pid 24215
+24215 10:23:56.132099 Entering server connection loop
+24215 10:23:56.132429 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+24215 10:23:56.133210 Processing Client
+24215 10:23:56.133331 Connecting Client
+24215 10:23:56.133948 Running command ['setFeatures', [2]]
+24215 10:23:56.134192 Command Completed
+24215 10:23:56.135152 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+24215 10:23:56.357406 Command Completed
+24215 10:23:56.358008 Processing Client
+24215 10:23:56.358114 Disconnecting Client
+24215 10:23:56.358253 No timeout, exiting.
+24215 10:23:56.458577 Exiting
+24215 10:23:56.459316 Original lockfile contents: ['24215\n']
+24215 10:23:56.459938 Exiting as we could obtain the lock
+24259 10:23:57.315394 --- Starting bitbake server pid 24259 at 2020-10-13 10:23:57.315343 ---
+24259 10:23:57.329340 Started bitbake server pid 24259
+24259 10:23:57.329854 Entering server connection loop
+24259 10:23:57.330218 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+24259 10:23:57.331052 Processing Client
+24259 10:23:57.331179 Connecting Client
+24259 10:23:57.331781 Running command ['setFeatures', [2, 1]]
+24259 10:23:57.332033 Command Completed
+24259 10:23:57.333095 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+24259 10:23:57.787601 Command Completed
+24259 10:23:57.787910 Running command ['clientComplete']
+24259 10:24:57.843368 Processing Client
+24259 10:24:57.843518 Disconnecting Client
+24259 10:24:57.843666 No timeout, exiting.
+24259 10:24:57.943934 Exiting
+24259 10:24:57.951666 Original lockfile contents: ['24259\n']
+24259 10:24:57.952149 Exiting as we could obtain the lock
+24598 10:24:59.546534 --- Starting bitbake server pid 24598 at 2020-10-13 10:24:59.546492 ---
+24598 10:24:59.560745 Started bitbake server pid 24598
+24598 10:24:59.561172 Entering server connection loop
+24598 10:24:59.561522 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+24598 10:24:59.562256 Processing Client
+24598 10:24:59.562395 Connecting Client
+24598 10:24:59.563003 Running command ['setFeatures', [2]]
+24598 10:24:59.563253 Command Completed
+24598 10:24:59.564265 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+24598 10:24:59.827216 Command Completed
+24598 10:24:59.827797 Processing Client
+24598 10:24:59.827912 Disconnecting Client
+24598 10:24:59.828068 No timeout, exiting.
+24598 10:24:59.928403 Exiting
+24598 10:24:59.929190 Original lockfile contents: ['24598\n']
+24598 10:24:59.929816 Exiting as we could obtain the lock
+24639 10:25:00.722965 --- Starting bitbake server pid 24639 at 2020-10-13 10:25:00.722908 ---
+24639 10:25:00.736214 Started bitbake server pid 24639
+24639 10:25:00.736556 Entering server connection loop
+24639 10:25:00.736858 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+24639 10:25:00.737988 Processing Client
+24639 10:25:00.738115 Connecting Client
+24639 10:25:00.738751 Running command ['setFeatures', [2, 1]]
+24639 10:25:00.739018 Command Completed
+24639 10:25:00.741253 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+24639 10:25:01.083854 Command Completed
+24639 10:25:01.084146 Running command ['clientComplete']
+24639 10:26:01.143734 Processing Client
+24639 10:26:01.144016 Disconnecting Client
+24639 10:26:01.144219 No timeout, exiting.
+24639 10:26:01.244518 Exiting
+24639 10:26:01.244926 Original lockfile contents: ['24639\n']
+24639 10:26:01.245233 Exiting as we could obtain the lock
+24963 10:26:02.697736 --- Starting bitbake server pid 24963 at 2020-10-13 10:26:02.697687 ---
+24963 10:26:02.711843 Started bitbake server pid 24963
+24963 10:26:02.712323 Entering server connection loop
+24963 10:26:02.712670 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+24963 10:26:02.713735 Processing Client
+24963 10:26:02.713897 Connecting Client
+24963 10:26:02.715116 Running command ['setFeatures', [2]]
+24963 10:26:02.715652 Command Completed
+24963 10:26:02.717341 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+24963 10:26:02.936683 Command Completed
+24963 10:26:02.937477 Processing Client
+24963 10:26:02.937572 Disconnecting Client
+24963 10:26:02.937720 No timeout, exiting.
+24963 10:26:03.038083 Exiting
+24963 10:26:03.038830 Original lockfile contents: ['24963\n']
+24963 10:26:03.039292 Exiting as we could obtain the lock
+25004 10:26:03.751078 --- Starting bitbake server pid 25004 at 2020-10-13 10:26:03.751020 ---
+25004 10:26:03.768190 Started bitbake server pid 25004
+25004 10:26:03.768664 Entering server connection loop
+25004 10:26:03.769000 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+25004 10:26:03.769972 Processing Client
+25004 10:26:03.770127 Connecting Client
+25004 10:26:03.771018 Running command ['setFeatures', [2, 1]]
+25004 10:26:03.773073 Command Completed
+25004 10:26:03.774846 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+25004 10:26:04.149527 Command Completed
+25004 10:26:04.149730 Running command ['clientComplete']
+25004 10:27:04.207515 Processing Client
+25004 10:27:04.207751 Disconnecting Client
+25004 10:27:04.207981 No timeout, exiting.
+25004 10:27:04.308344 Exiting
+25004 10:27:04.319214 Original lockfile contents: ['25004\n']
+25004 10:27:04.319628 Exiting as we could obtain the lock
+25363 10:27:05.837275 --- Starting bitbake server pid 25363 at 2020-10-13 10:27:05.837235 ---
+25363 10:27:05.850221 Started bitbake server pid 25363
+25363 10:27:05.850673 Entering server connection loop
+25363 10:27:05.851019 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+25363 10:27:05.852722 Processing Client
+25363 10:27:05.852836 Connecting Client
+25363 10:27:05.853626 Running command ['setFeatures', [2]]
+25363 10:27:05.854006 Command Completed
+25363 10:27:05.855120 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+25363 10:27:06.100073 Command Completed
+25363 10:27:06.100795 Processing Client
+25363 10:27:06.100927 Disconnecting Client
+25363 10:27:06.101120 No timeout, exiting.
+25363 10:27:06.201438 Exiting
+25363 10:27:06.211256 Original lockfile contents: ['25363\n']
+25363 10:27:06.211635 Exiting as we could obtain the lock
+25405 10:27:07.098067 --- Starting bitbake server pid 25405 at 2020-10-13 10:27:07.098026 ---
+25405 10:27:07.111873 Started bitbake server pid 25405
+25405 10:27:07.112283 Entering server connection loop
+25405 10:27:07.112620 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+25405 10:27:07.113315 Processing Client
+25405 10:27:07.113434 Connecting Client
+25405 10:27:07.114243 Running command ['setFeatures', [2, 1]]
+25405 10:27:07.114602 Command Completed
+25405 10:27:07.115861 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+25405 10:27:07.463319 Command Completed
+25405 10:27:07.463614 Running command ['clientComplete']
+25405 10:28:07.520929 Processing Client
+25405 10:28:07.521089 Disconnecting Client
+25405 10:28:07.521237 No timeout, exiting.
+25405 10:28:07.621523 Exiting
+25405 10:28:07.627210 Original lockfile contents: ['25405\n']
+25405 10:28:07.627641 Exiting as we could obtain the lock
+25652 10:28:09.233497 --- Starting bitbake server pid 25652 at 2020-10-13 10:28:09.233456 ---
+25652 10:28:09.247065 Started bitbake server pid 25652
+25652 10:28:09.247525 Entering server connection loop
+25652 10:28:09.247900 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+25652 10:28:09.248685 Processing Client
+25652 10:28:09.248802 Connecting Client
+25652 10:28:09.249355 Running command ['setFeatures', [2]]
+25652 10:28:09.249595 Command Completed
+25652 10:28:09.250551 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+25652 10:28:09.468818 Command Completed
+25652 10:28:09.469344 Processing Client
+25652 10:28:09.469452 Disconnecting Client
+25652 10:28:09.469596 No timeout, exiting.
+25652 10:28:09.569875 Exiting
+25652 10:28:09.570426 Original lockfile contents: ['25652\n']
+25652 10:28:09.570838 Exiting as we could obtain the lock
+25693 10:28:10.418939 --- Starting bitbake server pid 25693 at 2020-10-13 10:28:10.418880 ---
+25693 10:28:10.432054 Started bitbake server pid 25693
+25693 10:28:10.432366 Entering server connection loop
+25693 10:28:10.432643 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+25693 10:28:10.433696 Processing Client
+25693 10:28:10.433815 Connecting Client
+25693 10:28:10.434422 Running command ['setFeatures', [2, 1]]
+25693 10:28:10.434659 Command Completed
+25693 10:28:10.437247 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+25693 10:28:10.794749 Command Completed
+25693 10:28:10.794979 Running command ['clientComplete']
+25693 10:29:10.851679 Processing Client
+25693 10:29:10.851981 Disconnecting Client
+25693 10:29:10.852364 No timeout, exiting.
+25693 10:29:10.952791 Exiting
+25693 10:29:10.959227 Original lockfile contents: ['25693\n']
+25693 10:29:10.959667 Exiting as we could obtain the lock
+26095 10:29:12.447060 --- Starting bitbake server pid 26095 at 2020-10-13 10:29:12.447015 ---
+26095 10:29:12.463728 Started bitbake server pid 26095
+26095 10:29:12.464218 Entering server connection loop
+26095 10:29:12.464570 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+26095 10:29:12.466438 Processing Client
+26095 10:29:12.466553 Connecting Client
+26095 10:29:12.467206 Running command ['setFeatures', [2]]
+26095 10:29:12.467485 Command Completed
+26095 10:29:12.468969 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake', '-p']]
+26095 10:29:12.701275 Command Completed
+26095 10:29:12.702076 Processing Client
+26095 10:29:12.702156 Disconnecting Client
+26095 10:29:12.702283 No timeout, exiting.
+26095 10:29:12.802649 Exiting
+26095 10:29:12.803253 Original lockfile contents: ['26095\n']
+26095 10:29:12.803688 Exiting as we could obtain the lock
+26138 10:29:13.542188 --- Starting bitbake server pid 26138 at 2020-10-13 10:29:13.542136 ---
+26138 10:29:13.555278 Started bitbake server pid 26138
+26138 10:29:13.555608 Entering server connection loop
+26138 10:29:13.555894 Accepting [<socket.socket fd=7, family=AddressFamily.AF_UNIX, type=SocketKind.SOCK_STREAM, proto=0, laddr=bitbake.sock>] ([])
+26138 10:29:13.556910 Processing Client
+26138 10:29:13.557036 Connecting Client
+26138 10:29:13.557646 Running command ['setFeatures', [2, 1]]
+26138 10:29:13.557885 Command Completed
+26138 10:29:13.559433 Running command ['updateConfig', {'abort': True, 'force': False, 'invalidate_stamp': None, 'dry_run': False, 'dump_signatures': [], 'extra_assume_provided': [], 'profile': False, 'prefile': [], 'postfile': [], 'server_timeout': None, 'nosetscene': False, 'setsceneonly': False, 'skipsetscene': False, 'runall': None, 'runonly': None, 'writeeventlog': None, 'build_verbose_shell': False, 'build_verbose_stdout': False, 'default_loglevel': 20, 'debug_domains': {}}, {'SSH_AUTH_SOCK': '/run/user/1000/keyring/ssh', 'USER': 'idadel', 'PWD': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'HOME': '/home/idadel', 'SSH_AGENT_PID': '3035', 'BBPATH': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'BB_ENV_EXTRAWHITE': 'ALL_PROXY BBPATH_EXTRA BB_LOGCONFIG BB_NO_NETWORK BB_NUMBER_THREADS BB_SETSCENE_ENFORCE BB_SRCREV_POLICY DISTRO FTPS_PROXY FTP_PROXY GIT_PROXY_COMMAND HTTPS_PROXY HTTP_PROXY MACHINE NO_PROXY PARALLEL_MAKE SCREENDIR SDKMACHINE SOCKS5_PASSWD SOCKS5_USER SSH_AGENT_PID SSH_AUTH_SOCK STAMPS_DIR TCLIBC TCMODE all_proxy ftp_proxy ftps_proxy http_proxy https_proxy no_proxy ', 'SHELL': '/bin/bash', 'LOGNAME': 'idadel', 'PATH': '/home/idadel/Desktop/Outreachy/poky/scripts:/home/idadel/Desktop/Outreachy/poky/bitbake/bin:/home/idadel/Desktop/Outreachy/poky/node_modules/.bin:/home/idadel/Desktop/Outreachy/node_modules/.bin:/home/idadel/Desktop/node_modules/.bin:/home/idadel/node_modules/.bin:/home/node_modules/.bin:/node_modules/.bin:/usr/share/code:/home/idadel/.local/bin:/home/idadel/anaconda3/bin:/home/idadel/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/dart/bin:/usr/lib/dart/bin', 'LC_ALL': 'en_US.UTF-8', 'CLUTTER_IM_MODULE': 'xim', 'VSCODE_NODE_CACHED_DATA_DIR': '/home/idadel/.config/Code/CachedData/e790b931385d72cf5669fcefc51cdf65990efa5d', 'LS_COLORS': '', 'VSCODE_LOGS': '/home/idadel/.config/Code/logs/20201013T101013', 'VSCODE_NLS_CONFIG': '{"locale":"en-us","availableLanguages":{},"_languagePackSupport":true}', 'LESSCLOSE': '/usr/bin/lesspipe %s %s', 'XDG_MENU_PREFIX': 'gnome-', 'LANG': 'en_US.UTF-8', 'MANAGERPID': '2905', 'DISPLAY': ':0', 'AMD_ENTRYPOINT': 'vs/workbench/services/extensions/node/extensionHostProcess', 'OLDPWD': '/home/idadel/Desktop/Outreachy/poky', 'ORIGINAL_XDG_CURRENT_DESKTOP': 'ubuntu:GNOME', 'INVOCATION_ID': '6afc10c66b874317bde1cc34ea926f9b', 'VSCODE_LOG_STACK': 'false', 'GNOME_SHELL_SESSION_MODE': 'ubuntu', 'VSCODE_IPC_HOOK_EXTHOST': '/tmp/vscode-ipc-4764d477-8fd1-4363-9ad9-cde709fc578a.sock', 'USERNAME': 'idadel', 'CHROME_DESKTOP': 'code-url-handler.desktop', 'XDG_VTNR': '2', 'GIO_LAUNCHED_DESKTOP_FILE_PID': '21177', 'APPLICATION_INSIGHTS_NO_DIAGNOSTIC_CHANNEL': 'true', 'XDG_SESSION_ID': '2', 'DESKTOP_SESSION': 'ubuntu', 'CRASH_REPORTER_START_OPTIONS': '{"companyName":"Microsoft","productName":"VSCode","submitURL":"appcenter://code?aid=fba07a4d-84bd-4fc8-a125-9640fc8ce171&uid=a9555920-d878-4ac1-a3c1-57ef67403018&iid=a9555920-d878-4ac1-a3c1-57ef67403018&sid=a9555920-d878-4ac1-a3c1-57ef67403018","uploadToServer":true}', 'QT4_IM_MODULE': 'xim', 'TEXTDOMAINDIR': '/usr/share/locale/', 'JOURNAL_STREAM': '9:40141', 'TEXTDOMAIN': 'im-config', 'QT_ACCESSIBILITY': '1', 'XDG_SESSION_TYPE': 'x11', 'XDG_DATA_DIRS': '/usr/share/ubuntu:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop', 'XDG_SESSION_DESKTOP': 'ubuntu', 'DBUS_STARTER_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'BUILDDIR': '/home/idadel/Desktop/Outreachy/poky/vscode-bitbake-build', 'GTK_MODULES': 'gail:atk-bridge', 'VSCODE_PID': '21177', 'WINDOWPATH': '2', 'QT_IM_MODULE': 'ibus', 'XMODIFIERS': '@im=ibus', 'VSCODE_HANDLES_UNCAUGHT_ERRORS': 'true', 'IM_CONFIG_PHASE': '2', 'DBUS_STARTER_BUS_TYPE': 'session', 'XDG_CURRENT_DESKTOP': 'Unity', 'GPG_AGENT_INFO': '/run/user/1000/gnupg/S.gpg-agent:0:1', 'GIO_LAUNCHED_DESKTOP_FILE': '/usr/share/applications/code.desktop', 'SHLVL': '2', 'XDG_SEAT': 'seat0', 'GDMSESSION': 'ubuntu', 'PIPE_LOGGING': 'true', 'GNOME_DESKTOP_SESSION_ID': 'this-is-deprecated', 'DBUS_SESSION_BUS_ADDRESS': 'unix:path=/run/user/1000/bus,guid=defc67f877a9e5f502ab995d5f853c68', 'XDG_RUNTIME_DIR': '/run/user/1000', 'XAUTHORITY': '/run/user/1000/gdm/Xauthority', 'XDG_CONFIG_DIRS': '/etc/xdg/xdg-ubuntu:/etc/xdg', 'VSCODE_IPC_HOOK': '/run/user/1000/vscode-56dd5b96-1.49.0-main.sock', 'SESSION_MANAGER': 'local/ida-station:@/tmp/.ICE-unix/2940,unix/ida-station:/tmp/.ICE-unix/2940', 'BREAKPAD_DUMP_LOCATION': '/home/idadel/.config/Code/exthost Crash Reports', 'LESSOPEN': '| /usr/bin/lesspipe %s', 'VERBOSE_LOGGING': 'true', 'GTK_IM_MODULE': 'ibus', '_': '/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers'}, ['/home/idadel/Desktop/Outreachy/poky/bitbake/bin/bitbake-layers', 'show-layers']]
+26138 10:29:13.925582 Command Completed
+26138 10:29:13.925758 Running command ['clientComplete']
diff --git a/vscode-bitbake-build/bitbake.lock b/vscode-bitbake-build/bitbake.lock
new file mode 100644
index 0000000000..5aa9c7182d
--- /dev/null
+++ b/vscode-bitbake-build/bitbake.lock
@@ -0,0 +1 @@
+26138
diff --git a/vscode-bitbake-build/cache/bb_persist_data.sqlite3 b/vscode-bitbake-build/cache/bb_persist_data.sqlite3
new file mode 100644
index 0000000000000000000000000000000000000000..1714735c8734ec0acfbea5000316e87f6816f4a1
GIT binary patch
literal 12288
zcmeI#F-yZh6u|MzDO!Y*ZXI0Ss6+&D7EScPVr*@iik(8l2*qfzrlO-C%a7tWar7?G
zB}-Q+{|9%Mmv<MqU#2%2#?z{h$JzWjujE*Dl-BA@L@A~1*sx<6o_*L{CU$lCs?h52
z^r!9rD(xHP8~=ON0qO`KfB*srAb<b@2q1s}0tozDfw{Nc4Fd0Lx61F!B8swc(#tMQ
zc#)XfQ6tsoi3w99X&A*u8pXY*;!{#{m&#4jyAG3yT$zdV2dVVOaeN@}dATU+4f`j0
zt2+!lHGO#~KHgqS+r?-3qMFrt*7$CA)Og|g`j+!-yQ$+Q0s#aNKmY**5I_I{1Q0*~
l0R+}nV8>mI{(oJ6FZV(K0R#|0009ILKmY**5I~?7_yY#~K7;@O

literal 0
HcmV?d00001

diff --git a/vscode-bitbake-build/conf/bblayers.conf b/vscode-bitbake-build/conf/bblayers.conf
new file mode 100644
index 0000000000..71e81505a9
--- /dev/null
+++ b/vscode-bitbake-build/conf/bblayers.conf
@@ -0,0 +1,12 @@
+# POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
+# changes incompatibly
+POKY_BBLAYERS_CONF_VERSION = "2"
+
+BBPATH = "${TOPDIR}"
+BBFILES ?= ""
+
+BBLAYERS ?= " \
+  /home/idadel/Desktop/Outreachy/poky/meta \
+  /home/idadel/Desktop/Outreachy/poky/meta-poky \
+  /home/idadel/Desktop/Outreachy/poky/meta-yocto-bsp \
+  "
diff --git a/vscode-bitbake-build/conf/local.conf b/vscode-bitbake-build/conf/local.conf
new file mode 100644
index 0000000000..032f2623ee
--- /dev/null
+++ b/vscode-bitbake-build/conf/local.conf
@@ -0,0 +1,277 @@
+#
+# This file is your local configuration file and is where all local user settings
+# are placed. The comments in this file give some guide to the options a new user
+# to the system might want to change but pretty much any configuration option can
+# be set in this file. More adventurous users can look at local.conf.extended
+# which contains other examples of configuration which can be placed in this file
+# but new users likely won't need any of them initially.
+#
+# Lines starting with the '#' character are commented out and in some cases the
+# default values are provided as comments to show people example syntax. Enabling
+# the option is a question of removing the # character and making any change to the
+# variable as required.
+
+#
+# Machine Selection
+#
+# You need to select a specific machine to target the build with. There are a selection
+# of emulated machines available which can boot and run in the QEMU emulator:
+#
+#MACHINE ?= "qemuarm"
+#MACHINE ?= "qemuarm64"
+#MACHINE ?= "qemumips"
+#MACHINE ?= "qemumips64"
+#MACHINE ?= "qemuppc"
+#MACHINE ?= "qemux86"
+#MACHINE ?= "qemux86-64"
+#
+# There are also the following hardware board target machines included for 
+# demonstration purposes:
+#
+#MACHINE ?= "beaglebone-yocto"
+#MACHINE ?= "genericx86"
+#MACHINE ?= "genericx86-64"
+#MACHINE ?= "edgerouter"
+#
+# This sets the default machine to be qemux86-64 if no other machine is selected:
+MACHINE ??= "qemux86-64"
+
+#
+# Where to place downloads
+#
+# During a first build the system will download many different source code tarballs
+# from various upstream projects. This can take a while, particularly if your network
+# connection is slow. These are all stored in DL_DIR. When wiping and rebuilding you
+# can preserve this directory to speed up this part of subsequent builds. This directory
+# is safe to share between multiple builds on the same machine too.
+#
+# The default is a downloads directory under TOPDIR which is the build directory.
+#
+#DL_DIR ?= "${TOPDIR}/downloads"
+
+#
+# Where to place shared-state files
+#
+# BitBake has the capability to accelerate builds based on previously built output.
+# This is done using "shared state" files which can be thought of as cache objects
+# and this option determines where those files are placed.
+#
+# You can wipe out TMPDIR leaving this directory intact and the build would regenerate
+# from these files if no changes were made to the configuration. If changes were made
+# to the configuration, only shared state files where the state was still valid would
+# be used (done using checksums).
+#
+# The default is a sstate-cache directory under TOPDIR.
+#
+#SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
+
+#
+# Where to place the build output
+#
+# This option specifies where the bulk of the building work should be done and
+# where BitBake should place its temporary files and output. Keep in mind that
+# this includes the extraction and compilation of many applications and the toolchain
+# which can use Gigabytes of hard disk space.
+#
+# The default is a tmp directory under TOPDIR.
+#
+#TMPDIR = "${TOPDIR}/tmp"
+
+#
+# Default policy config
+#
+# The distribution setting controls which policy settings are used as defaults.
+# The default value is fine for general Yocto project use, at least initially.
+# Ultimately when creating custom policy, people will likely end up subclassing 
+# these defaults.
+#
+DISTRO ?= "poky"
+# As an example of a subclass there is a "bleeding" edge policy configuration
+# where many versions are set to the absolute latest code from the upstream 
+# source control systems. This is just mentioned here as an example, its not
+# useful to most new users.
+# DISTRO ?= "poky-bleeding"
+
+#
+# Package Management configuration
+#
+# This variable lists which packaging formats to enable. Multiple package backends
+# can be enabled at once and the first item listed in the variable will be used
+# to generate the root filesystems.
+# Options are:
+#  - 'package_deb' for debian style deb files
+#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
+#  - 'package_rpm' for rpm style packages
+# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
+# We default to rpm:
+PACKAGE_CLASSES ?= "package_rpm"
+
+#
+# SDK target architecture
+#
+# This variable specifies the architecture to build SDK items for and means
+# you can build the SDK packages for architectures other than the machine you are
+# running the build on (i.e. building i686 packages on an x86_64 host).
+# Supported values are i686 and x86_64
+#SDKMACHINE ?= "i686"
+
+#
+# Extra image configuration defaults
+#
+# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated
+# images. Some of these options are added to certain image types automatically. The
+# variable can contain the following options:
+#  "dbg-pkgs"       - add -dbg packages for all installed packages
+#                     (adds symbol information for debugging/profiling)
+#  "src-pkgs"       - add -src packages for all installed packages
+#                     (adds source code for debugging)
+#  "dev-pkgs"       - add -dev packages for all installed packages
+#                     (useful if you want to develop against libs in the image)
+#  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
+#                     (useful if you want to run the package test suites)
+#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"    - add debugging tools (gdb, strace)
+#  "eclipse-debug"  - add Eclipse remote debugging support
+#  "tools-profile"  - add profiling tools (oprofile, lttng, valgrind)
+#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "debug-tweaks"   - make an image suitable for development
+#                     e.g. ssh root access has a blank password
+# There are other application targets that can be used here too, see
+# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
+# We default to enabling the debugging tweaks.
+EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
+
+#
+# Additional image features
+#
+# The following is a list of additional classes to use when building images which
+# enable extra features. Some available options which can be included in this variable
+# are:
+#   - 'buildstats' collect build statistics
+#   - 'image-mklibs' to reduce shared library files size for an image
+#   - 'image-prelink' in order to prelink the filesystem image
+# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
+# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
+USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+
+#
+# Runtime testing of images
+#
+# The build system can test booting virtual machine images under qemu (an emulator)
+# after any root filesystems are created and run tests against those images. It can also
+# run tests against any SDK that are built. To enable this uncomment these lines.
+# See classes/test{image,sdk}.bbclass for further details.
+#IMAGE_CLASSES += "testimage testsdk"
+#TESTIMAGE_AUTO_qemuall = "1"
+
+#
+# Interactive shell configuration
+#
+# Under certain circumstances the system may need input from you and to do this it
+# can launch an interactive shell. It needs to do this since the build is
+# multithreaded and needs to be able to handle the case where more than one parallel
+# process may require the user's attention. The default is iterate over the available
+# terminal types to find one that works.
+#
+# Examples of the occasions this may happen are when resolving patches which cannot
+# be applied, to use the devshell or the kernel menuconfig
+#
+# Supported values are auto, gnome, xfce, rxvt, screen, konsole (KDE 3.x only), none
+# Note: currently, Konsole support only works for KDE 3.x due to the way
+# newer Konsole versions behave
+#OE_TERMINAL = "auto"
+# By default disable interactive patch resolution (tasks will just fail instead):
+PATCHRESOLVE = "noop"
+
+#
+# Disk Space Monitoring during the build
+#
+# Monitor the disk space during the build. If there is less that 1GB of space or less
+# than 100K inodes in any key build location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully
+# shutdown the build. If there is less that 100MB or 1K inodes, perform a hard abort
+# of the build. The reason for this is that running completely out of space can corrupt
+# files and damages the build in ways which may not be easily recoverable.
+# It's necesary to monitor /tmp, if there is no space left the build will fail
+# with very exotic errors.
+BB_DISKMON_DIRS ??= "\
+    STOPTASKS,${TMPDIR},1G,100K \
+    STOPTASKS,${DL_DIR},1G,100K \
+    STOPTASKS,${SSTATE_DIR},1G,100K \
+    STOPTASKS,/tmp,100M,100K \
+    ABORT,${TMPDIR},100M,1K \
+    ABORT,${DL_DIR},100M,1K \
+    ABORT,${SSTATE_DIR},100M,1K \
+    ABORT,/tmp,10M,1K"
+
+#
+# Shared-state files from other locations
+#
+# As mentioned above, shared state files are prebuilt cache data objects which can
+# used to accelerate build time. This variable can be used to configure the system
+# to search other mirror locations for these objects before it builds the data itself.
+#
+# This can be a filesystem directory, or a remote url such as http or ftp. These
+# would contain the sstate-cache results from previous builds (possibly from other
+# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the
+# cache locations to check for the shared objects.
+# NOTE: if the mirror uses the same structure as SSTATE_DIR, you need to add PATH
+# at the end as shown in the examples below. This will be substituted with the
+# correct path within the directory structure.
+#SSTATE_MIRRORS ?= "\
+#file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
+#file://.* file:///some/local/dir/sstate/PATH"
+
+#
+# Yocto Project SState Mirror
+#
+# The Yocto Project has prebuilt artefacts available for its releases, you can enable
+# use of these by uncommenting the following line. This will mean the build uses
+# the network to check for artefacts at the start of builds, which does slow it down
+# equally, it will also speed up the builds by not having to build things if they are
+# present in the cache. It assumes you can download something faster than you can build it
+# which will depend on your network.
+#
+#SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/2.5/PATH;downloadfilename=PATH"
+
+#
+# Qemu configuration
+#
+# By default native qemu will build with a builtin VNC server where graphical output can be
+# seen. The line below enables the SDL UI frontend too.
+PACKAGECONFIG_append_pn-qemu-system-native = " sdl"
+# By default libsdl2-native will be built, if you want to use your host's libSDL instead of 
+# the minimal libsdl built by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
+#ASSUME_PROVIDED += "libsdl2-native"
+
+# You can also enable the Gtk UI frontend, which takes somewhat longer to build, but adds
+# a handy set of menus for controlling the emulator.
+#PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
+
+#
+# Hash Equivalence
+#
+# Enable support for automatically running a local hash equivalence server and
+# instruct bitbake to use a hash equivalence aware signature generator. Hash
+# equivalence improves reuse of sstate by detecting when a given sstate
+# artifact can be reused as equivalent, even if the current task hash doesn't
+# match the one that generated the artifact.
+#
+# A shared hash equivalent server can be set with "<HOSTNAME>:<PORT>" format
+#
+#BB_HASHSERVE = "auto"
+#BB_SIGNATURE_HANDLER = "OEEquivHash"
+
+#
+# Memory Resident Bitbake
+#
+# Bitbake's server component can stay in memory after the UI for the current command
+# has completed. This means subsequent commands can run faster since there is no need
+# for bitbake to reload cache files and so on. Number is in seconds, after which the
+# server will shut down.
+#
+#BB_SERVER_TIMEOUT = "60"
+
+# CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
+# track the version of this file when it was generated. This can safely be ignored if
+# this doesn't mean anything to you.
+CONF_VERSION = "1"
diff --git a/vscode-bitbake-build/conf/templateconf.cfg b/vscode-bitbake-build/conf/templateconf.cfg
new file mode 100644
index 0000000000..7480a55b98
--- /dev/null
+++ b/vscode-bitbake-build/conf/templateconf.cfg
@@ -0,0 +1 @@
+meta-poky/conf
diff --git a/vscode-bitbake-build/executeBitBakeCmd.sh b/vscode-bitbake-build/executeBitBakeCmd.sh
new file mode 100755
index 0000000000..d7a4c5a5aa
--- /dev/null
+++ b/vscode-bitbake-build/executeBitBakeCmd.sh
@@ -0,0 +1,3 @@
+#!/bin/bash
+. ./oe-init-build-env vscode-bitbake-build > /dev/null
+bitbake-layers show-layers
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/[ b/vscode-bitbake-build/tmp/hosttools/[
new file mode 120000
index 0000000000..f0645f936c
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/[
@@ -0,0 +1 @@
+/usr/bin/[
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/ar b/vscode-bitbake-build/tmp/hosttools/ar
new file mode 120000
index 0000000000..b0b6b72467
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/ar
@@ -0,0 +1 @@
+/usr/bin/ar
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/as b/vscode-bitbake-build/tmp/hosttools/as
new file mode 120000
index 0000000000..3a1f1ac9bb
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/as
@@ -0,0 +1 @@
+/usr/bin/as
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/awk b/vscode-bitbake-build/tmp/hosttools/awk
new file mode 120000
index 0000000000..048dbad680
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/awk
@@ -0,0 +1 @@
+/usr/bin/awk
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/basename b/vscode-bitbake-build/tmp/hosttools/basename
new file mode 120000
index 0000000000..9dccfc71be
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/basename
@@ -0,0 +1 @@
+/usr/bin/basename
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/bash b/vscode-bitbake-build/tmp/hosttools/bash
new file mode 120000
index 0000000000..5d4150d089
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/bash
@@ -0,0 +1 @@
+/bin/bash
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/bzip2 b/vscode-bitbake-build/tmp/hosttools/bzip2
new file mode 120000
index 0000000000..f7be93ff90
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/bzip2
@@ -0,0 +1 @@
+/home/idadel/anaconda3/bin/bzip2
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/cat b/vscode-bitbake-build/tmp/hosttools/cat
new file mode 120000
index 0000000000..513b307012
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/cat
@@ -0,0 +1 @@
+/bin/cat
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/chgrp b/vscode-bitbake-build/tmp/hosttools/chgrp
new file mode 120000
index 0000000000..7a41ade2c6
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/chgrp
@@ -0,0 +1 @@
+/bin/chgrp
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/chmod b/vscode-bitbake-build/tmp/hosttools/chmod
new file mode 120000
index 0000000000..b5c0666bb9
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/chmod
@@ -0,0 +1 @@
+/bin/chmod
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/chown b/vscode-bitbake-build/tmp/hosttools/chown
new file mode 120000
index 0000000000..82ff2ccdb2
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/chown
@@ -0,0 +1 @@
+/bin/chown
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/cmp b/vscode-bitbake-build/tmp/hosttools/cmp
new file mode 120000
index 0000000000..cffe2947d4
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/cmp
@@ -0,0 +1 @@
+/usr/bin/cmp
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/comm b/vscode-bitbake-build/tmp/hosttools/comm
new file mode 120000
index 0000000000..09d741b434
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/comm
@@ -0,0 +1 @@
+/usr/bin/comm
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/cp b/vscode-bitbake-build/tmp/hosttools/cp
new file mode 120000
index 0000000000..4fe8dfb0be
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/cp
@@ -0,0 +1 @@
+/bin/cp
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/cpio b/vscode-bitbake-build/tmp/hosttools/cpio
new file mode 120000
index 0000000000..6314ef2f93
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/cpio
@@ -0,0 +1 @@
+/bin/cpio
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/cpp b/vscode-bitbake-build/tmp/hosttools/cpp
new file mode 120000
index 0000000000..00fc3c4ea4
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/cpp
@@ -0,0 +1 @@
+/usr/bin/cpp
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/cut b/vscode-bitbake-build/tmp/hosttools/cut
new file mode 120000
index 0000000000..d0bccf195a
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/cut
@@ -0,0 +1 @@
+/usr/bin/cut
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/date b/vscode-bitbake-build/tmp/hosttools/date
new file mode 120000
index 0000000000..884ba3e7b0
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/date
@@ -0,0 +1 @@
+/bin/date
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/dd b/vscode-bitbake-build/tmp/hosttools/dd
new file mode 120000
index 0000000000..87582e52be
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/dd
@@ -0,0 +1 @@
+/bin/dd
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/diff b/vscode-bitbake-build/tmp/hosttools/diff
new file mode 120000
index 0000000000..a94884ff73
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/diff
@@ -0,0 +1 @@
+/usr/bin/diff
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/diffstat b/vscode-bitbake-build/tmp/hosttools/diffstat
new file mode 120000
index 0000000000..d759baefdb
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/diffstat
@@ -0,0 +1 @@
+/usr/bin/diffstat
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/dirname b/vscode-bitbake-build/tmp/hosttools/dirname
new file mode 120000
index 0000000000..25b8f308b9
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/dirname
@@ -0,0 +1 @@
+/usr/bin/dirname
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/du b/vscode-bitbake-build/tmp/hosttools/du
new file mode 120000
index 0000000000..e80e9cd0e3
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/du
@@ -0,0 +1 @@
+/usr/bin/du
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/echo b/vscode-bitbake-build/tmp/hosttools/echo
new file mode 120000
index 0000000000..7bbf7ccd5e
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/echo
@@ -0,0 +1 @@
+/bin/echo
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/egrep b/vscode-bitbake-build/tmp/hosttools/egrep
new file mode 120000
index 0000000000..7abe40ddd7
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/egrep
@@ -0,0 +1 @@
+/bin/egrep
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/env b/vscode-bitbake-build/tmp/hosttools/env
new file mode 120000
index 0000000000..b59570a68d
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/env
@@ -0,0 +1 @@
+/usr/bin/env
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/expand b/vscode-bitbake-build/tmp/hosttools/expand
new file mode 120000
index 0000000000..212b8d4d5a
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/expand
@@ -0,0 +1 @@
+/usr/bin/expand
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/expr b/vscode-bitbake-build/tmp/hosttools/expr
new file mode 120000
index 0000000000..097f25100a
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/expr
@@ -0,0 +1 @@
+/usr/bin/expr
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/false b/vscode-bitbake-build/tmp/hosttools/false
new file mode 120000
index 0000000000..274d1de97b
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/false
@@ -0,0 +1 @@
+/bin/false
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/fgrep b/vscode-bitbake-build/tmp/hosttools/fgrep
new file mode 120000
index 0000000000..ea92d936af
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/fgrep
@@ -0,0 +1 @@
+/bin/fgrep
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/file b/vscode-bitbake-build/tmp/hosttools/file
new file mode 120000
index 0000000000..719090aadb
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/file
@@ -0,0 +1 @@
+/usr/bin/file
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/find b/vscode-bitbake-build/tmp/hosttools/find
new file mode 120000
index 0000000000..cff52feeef
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/find
@@ -0,0 +1 @@
+/usr/bin/find
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/flock b/vscode-bitbake-build/tmp/hosttools/flock
new file mode 120000
index 0000000000..129c2093d7
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/flock
@@ -0,0 +1 @@
+/usr/bin/flock
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/g++ b/vscode-bitbake-build/tmp/hosttools/g++
new file mode 120000
index 0000000000..e51afadfc0
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/g++
@@ -0,0 +1 @@
+/usr/bin/g++
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/gcc b/vscode-bitbake-build/tmp/hosttools/gcc
new file mode 120000
index 0000000000..cd91449a4d
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/gcc
@@ -0,0 +1 @@
+/usr/bin/gcc
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/getconf b/vscode-bitbake-build/tmp/hosttools/getconf
new file mode 120000
index 0000000000..d0e2eeeb5f
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/getconf
@@ -0,0 +1 @@
+/usr/bin/getconf
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/getopt b/vscode-bitbake-build/tmp/hosttools/getopt
new file mode 120000
index 0000000000..f557aa52dd
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/getopt
@@ -0,0 +1 @@
+/usr/bin/getopt
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/git b/vscode-bitbake-build/tmp/hosttools/git
new file mode 120000
index 0000000000..8987a51c68
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/git
@@ -0,0 +1 @@
+/usr/bin/git
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/grep b/vscode-bitbake-build/tmp/hosttools/grep
new file mode 120000
index 0000000000..f3aad9cae1
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/grep
@@ -0,0 +1 @@
+/bin/grep
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/gunzip b/vscode-bitbake-build/tmp/hosttools/gunzip
new file mode 120000
index 0000000000..4572960046
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/gunzip
@@ -0,0 +1 @@
+/bin/gunzip
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/gzip b/vscode-bitbake-build/tmp/hosttools/gzip
new file mode 120000
index 0000000000..b807cd53e0
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/gzip
@@ -0,0 +1 @@
+/bin/gzip
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/head b/vscode-bitbake-build/tmp/hosttools/head
new file mode 120000
index 0000000000..b53c359340
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/head
@@ -0,0 +1 @@
+/usr/bin/head
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/hostname b/vscode-bitbake-build/tmp/hosttools/hostname
new file mode 120000
index 0000000000..5779a11960
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/hostname
@@ -0,0 +1 @@
+/bin/hostname
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/iconv b/vscode-bitbake-build/tmp/hosttools/iconv
new file mode 120000
index 0000000000..ce42271358
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/iconv
@@ -0,0 +1 @@
+/usr/bin/iconv
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/id b/vscode-bitbake-build/tmp/hosttools/id
new file mode 120000
index 0000000000..5f8fa7d023
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/id
@@ -0,0 +1 @@
+/usr/bin/id
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/install b/vscode-bitbake-build/tmp/hosttools/install
new file mode 120000
index 0000000000..c790c19587
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/install
@@ -0,0 +1 @@
+/usr/bin/install
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/ld b/vscode-bitbake-build/tmp/hosttools/ld
new file mode 120000
index 0000000000..6954c61c79
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/ld
@@ -0,0 +1 @@
+/usr/bin/ld
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/ldd b/vscode-bitbake-build/tmp/hosttools/ldd
new file mode 120000
index 0000000000..246d3c644f
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/ldd
@@ -0,0 +1 @@
+/usr/bin/ldd
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/ln b/vscode-bitbake-build/tmp/hosttools/ln
new file mode 120000
index 0000000000..832e6e798f
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/ln
@@ -0,0 +1 @@
+/bin/ln
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/ls b/vscode-bitbake-build/tmp/hosttools/ls
new file mode 120000
index 0000000000..e9b4575782
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/ls
@@ -0,0 +1 @@
+/bin/ls
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/make b/vscode-bitbake-build/tmp/hosttools/make
new file mode 120000
index 0000000000..060df749e9
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/make
@@ -0,0 +1 @@
+/usr/bin/make
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/md5sum b/vscode-bitbake-build/tmp/hosttools/md5sum
new file mode 120000
index 0000000000..6ed7acf899
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/md5sum
@@ -0,0 +1 @@
+/usr/bin/md5sum
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/mkdir b/vscode-bitbake-build/tmp/hosttools/mkdir
new file mode 120000
index 0000000000..9c6e0f8a9d
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/mkdir
@@ -0,0 +1 @@
+/bin/mkdir
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/mknod b/vscode-bitbake-build/tmp/hosttools/mknod
new file mode 120000
index 0000000000..0ea9c1a859
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/mknod
@@ -0,0 +1 @@
+/bin/mknod
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/mktemp b/vscode-bitbake-build/tmp/hosttools/mktemp
new file mode 120000
index 0000000000..dd352d25d8
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/mktemp
@@ -0,0 +1 @@
+/bin/mktemp
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/mv b/vscode-bitbake-build/tmp/hosttools/mv
new file mode 120000
index 0000000000..5f41dba6f0
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/mv
@@ -0,0 +1 @@
+/bin/mv
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/nm b/vscode-bitbake-build/tmp/hosttools/nm
new file mode 120000
index 0000000000..94b52ef353
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/nm
@@ -0,0 +1 @@
+/usr/bin/nm
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/objcopy b/vscode-bitbake-build/tmp/hosttools/objcopy
new file mode 120000
index 0000000000..9250aef296
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/objcopy
@@ -0,0 +1 @@
+/usr/bin/objcopy
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/objdump b/vscode-bitbake-build/tmp/hosttools/objdump
new file mode 120000
index 0000000000..72d2d6ed4b
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/objdump
@@ -0,0 +1 @@
+/usr/bin/objdump
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/od b/vscode-bitbake-build/tmp/hosttools/od
new file mode 120000
index 0000000000..2204c37df3
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/od
@@ -0,0 +1 @@
+/usr/bin/od
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/patch b/vscode-bitbake-build/tmp/hosttools/patch
new file mode 120000
index 0000000000..2dcb349c48
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/patch
@@ -0,0 +1 @@
+/usr/bin/patch
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/perl b/vscode-bitbake-build/tmp/hosttools/perl
new file mode 120000
index 0000000000..26cae473d1
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/perl
@@ -0,0 +1 @@
+/usr/bin/perl
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/pr b/vscode-bitbake-build/tmp/hosttools/pr
new file mode 120000
index 0000000000..fdbde1ff5f
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/pr
@@ -0,0 +1 @@
+/usr/bin/pr
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/printf b/vscode-bitbake-build/tmp/hosttools/printf
new file mode 120000
index 0000000000..2b5c01f57d
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/printf
@@ -0,0 +1 @@
+/usr/bin/printf
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/pwd b/vscode-bitbake-build/tmp/hosttools/pwd
new file mode 120000
index 0000000000..e83316f19c
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/pwd
@@ -0,0 +1 @@
+/bin/pwd
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/python3 b/vscode-bitbake-build/tmp/hosttools/python3
new file mode 120000
index 0000000000..709427070c
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/python3
@@ -0,0 +1 @@
+/home/idadel/anaconda3/bin/python3
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/ranlib b/vscode-bitbake-build/tmp/hosttools/ranlib
new file mode 120000
index 0000000000..d7dff9892f
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/ranlib
@@ -0,0 +1 @@
+/usr/bin/ranlib
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/readelf b/vscode-bitbake-build/tmp/hosttools/readelf
new file mode 120000
index 0000000000..41956a6d8e
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/readelf
@@ -0,0 +1 @@
+/usr/bin/readelf
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/readlink b/vscode-bitbake-build/tmp/hosttools/readlink
new file mode 120000
index 0000000000..2b38589fe5
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/readlink
@@ -0,0 +1 @@
+/bin/readlink
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/realpath b/vscode-bitbake-build/tmp/hosttools/realpath
new file mode 120000
index 0000000000..55ac4875a4
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/realpath
@@ -0,0 +1 @@
+/usr/bin/realpath
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/rm b/vscode-bitbake-build/tmp/hosttools/rm
new file mode 120000
index 0000000000..3530dc465b
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/rm
@@ -0,0 +1 @@
+/bin/rm
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/rmdir b/vscode-bitbake-build/tmp/hosttools/rmdir
new file mode 120000
index 0000000000..c32dad593e
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/rmdir
@@ -0,0 +1 @@
+/bin/rmdir
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/rpcgen b/vscode-bitbake-build/tmp/hosttools/rpcgen
new file mode 120000
index 0000000000..0fd3e4564f
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/rpcgen
@@ -0,0 +1 @@
+/usr/bin/rpcgen
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/sed b/vscode-bitbake-build/tmp/hosttools/sed
new file mode 120000
index 0000000000..16f91f85db
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/sed
@@ -0,0 +1 @@
+/bin/sed
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/seq b/vscode-bitbake-build/tmp/hosttools/seq
new file mode 120000
index 0000000000..dc67beae4c
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/seq
@@ -0,0 +1 @@
+/usr/bin/seq
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/sh b/vscode-bitbake-build/tmp/hosttools/sh
new file mode 120000
index 0000000000..db1611f66d
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/sh
@@ -0,0 +1 @@
+/bin/sh
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/sha1sum b/vscode-bitbake-build/tmp/hosttools/sha1sum
new file mode 120000
index 0000000000..66dc902a36
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/sha1sum
@@ -0,0 +1 @@
+/usr/bin/sha1sum
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/sha224sum b/vscode-bitbake-build/tmp/hosttools/sha224sum
new file mode 120000
index 0000000000..ba568d3aef
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/sha224sum
@@ -0,0 +1 @@
+/usr/bin/sha224sum
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/sha256sum b/vscode-bitbake-build/tmp/hosttools/sha256sum
new file mode 120000
index 0000000000..89e9a942ae
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/sha256sum
@@ -0,0 +1 @@
+/usr/bin/sha256sum
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/sha384sum b/vscode-bitbake-build/tmp/hosttools/sha384sum
new file mode 120000
index 0000000000..561baa714f
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/sha384sum
@@ -0,0 +1 @@
+/usr/bin/sha384sum
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/sha512sum b/vscode-bitbake-build/tmp/hosttools/sha512sum
new file mode 120000
index 0000000000..d602293eef
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/sha512sum
@@ -0,0 +1 @@
+/usr/bin/sha512sum
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/sleep b/vscode-bitbake-build/tmp/hosttools/sleep
new file mode 120000
index 0000000000..48f35bbaed
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/sleep
@@ -0,0 +1 @@
+/bin/sleep
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/sort b/vscode-bitbake-build/tmp/hosttools/sort
new file mode 120000
index 0000000000..ac0d121cda
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/sort
@@ -0,0 +1 @@
+/usr/bin/sort
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/split b/vscode-bitbake-build/tmp/hosttools/split
new file mode 120000
index 0000000000..18cd014abb
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/split
@@ -0,0 +1 @@
+/usr/bin/split
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/stat b/vscode-bitbake-build/tmp/hosttools/stat
new file mode 120000
index 0000000000..919bb7a763
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/stat
@@ -0,0 +1 @@
+/usr/bin/stat
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/strings b/vscode-bitbake-build/tmp/hosttools/strings
new file mode 120000
index 0000000000..f7018195e5
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/strings
@@ -0,0 +1 @@
+/usr/bin/strings
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/strip b/vscode-bitbake-build/tmp/hosttools/strip
new file mode 120000
index 0000000000..06d90837d4
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/strip
@@ -0,0 +1 @@
+/usr/bin/strip
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/tail b/vscode-bitbake-build/tmp/hosttools/tail
new file mode 120000
index 0000000000..e3ac6bd590
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/tail
@@ -0,0 +1 @@
+/usr/bin/tail
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/tar b/vscode-bitbake-build/tmp/hosttools/tar
new file mode 120000
index 0000000000..dbba4ddd84
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/tar
@@ -0,0 +1 @@
+/bin/tar
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/tee b/vscode-bitbake-build/tmp/hosttools/tee
new file mode 120000
index 0000000000..a2b87ec017
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/tee
@@ -0,0 +1 @@
+/usr/bin/tee
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/test b/vscode-bitbake-build/tmp/hosttools/test
new file mode 120000
index 0000000000..8762d0a45d
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/test
@@ -0,0 +1 @@
+/usr/bin/test
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/touch b/vscode-bitbake-build/tmp/hosttools/touch
new file mode 120000
index 0000000000..8d1374b56a
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/touch
@@ -0,0 +1 @@
+/usr/bin/touch
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/tr b/vscode-bitbake-build/tmp/hosttools/tr
new file mode 120000
index 0000000000..6521695778
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/tr
@@ -0,0 +1 @@
+/usr/bin/tr
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/true b/vscode-bitbake-build/tmp/hosttools/true
new file mode 120000
index 0000000000..63b10de421
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/true
@@ -0,0 +1 @@
+/bin/true
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/uname b/vscode-bitbake-build/tmp/hosttools/uname
new file mode 120000
index 0000000000..8abc4d42ec
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/uname
@@ -0,0 +1 @@
+/bin/uname
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/uniq b/vscode-bitbake-build/tmp/hosttools/uniq
new file mode 120000
index 0000000000..0aa3ac997c
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/uniq
@@ -0,0 +1 @@
+/usr/bin/uniq
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/wc b/vscode-bitbake-build/tmp/hosttools/wc
new file mode 120000
index 0000000000..1f2220108a
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/wc
@@ -0,0 +1 @@
+/usr/bin/wc
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/wget b/vscode-bitbake-build/tmp/hosttools/wget
new file mode 120000
index 0000000000..0915eda001
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/wget
@@ -0,0 +1 @@
+/usr/bin/wget
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/which b/vscode-bitbake-build/tmp/hosttools/which
new file mode 120000
index 0000000000..82324477ff
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/which
@@ -0,0 +1 @@
+/usr/bin/which
\ No newline at end of file
diff --git a/vscode-bitbake-build/tmp/hosttools/xargs b/vscode-bitbake-build/tmp/hosttools/xargs
new file mode 120000
index 0000000000..ad526c4ab7
--- /dev/null
+++ b/vscode-bitbake-build/tmp/hosttools/xargs
@@ -0,0 +1 @@
+/usr/bin/xargs
\ No newline at end of file
-- 
2.17.1

