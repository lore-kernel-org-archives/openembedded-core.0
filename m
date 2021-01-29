Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.10823.1611933059522775664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 07:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=C2AnFWZn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id v1so8866464ott.10
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 07:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ilL0hLm/BX5thtP3GrTJ0RJmDtj5bmHjlUoy7zLuIYk=;
        b=C2AnFWZn0JuJlFv+k3qZs0zVVmoXpryH//40UZX2O1Xh08jHY16vQOqy0lv2Dkt1UA
         Ob1+zY8GCL8KcbAXiIPps53jAWIjTfz4iJW6lhUkKJut4QKN+HVkD/h/CT8fp1JTkODT
         YNRnQ9zrYKL6cXURaCZ6P0ZmhSLaOeOAr15BLxcIRotrHu+kj0AoVye4P+rg1l6m3JxU
         3XsHM3Qkg0AqNtL08GQSH+pI9bl49foXlr4cATx0eVne2uKdYcLAQxzbmPi89LVbkS3M
         5fxdS9kv4+NgEXCwuoBlwBSp31+nRPcopYnM3o9vHcAXWyXDj++cGEg+VFMPDQrViqJk
         v0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ilL0hLm/BX5thtP3GrTJ0RJmDtj5bmHjlUoy7zLuIYk=;
        b=pqLGVzGOL8Bb/2xrTkraICkqn/bS+Q8lhO0YBjKWDc790huEchQmq5gCyaUxxXbc1x
         sSGCm7XEdUu2Hg1z4Gj6+p3UDOIV+9YAtNWmogr50Ffg4OCWpzSgroZjeK7vy24L+dyR
         XJO9H0kVLdtlM9qw3S5js2WO62qBuf7KZ+ifFOAe3Pw4ZwqvoKrDU+78sRJ2WwXm2M6p
         juPfttUwG0Vk50Mn4t4inUKufAF2gNIYJibUVOfkhwoG/YR6SXhR88xH0nYnf9vv+dGI
         K63hHL67ENeXh6QhKKoNHwR+E7nKTfDfNFftssQklItFH1tSc2M02ThoQwT51NLu1z9G
         Ak4g==
X-Gm-Message-State: AOAM531LtERTrTwubv0eWw5ygcQ5ImSXmmGHvz+kDFwAbu42OjuTZ4cS
	EQf5A/2GIcZldh7kt5Dks0hRYYgbPkiZ/TURmWU=
X-Google-Smtp-Source: ABdhPJytYXB4HLoylz3dW0eAbWGLsoTiIueMeex5JS/nKrURKlPPQLNo8A9iE7lFj5FYILTmtfy9ow==
X-Received: by 2002:a05:6830:134d:: with SMTP id r13mr3240919otq.140.1611933058165;
        Fri, 29 Jan 2021 07:10:58 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id 2sm2164979otg.6.2021.01.29.07.10.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 07:10:57 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/46] Pull request (cover letter only)
Date: Fri, 29 Jan 2021 05:10:35 -1000
Message-Id: <cover.1611932916.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit b286258fc2f6974a88ebd90d3c2f9465437cfcfd:

  linuxloader: Avoid confusing string concat errors (2021-01-27 09:32:57 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Jack Mitchell (1):
  distutils3: allow setup.py to be run from a different directory to
    ${S}

Joe Slater (1):
  pseudo: fix renaming to self

Martin Jansa (2):
  base.bbclass: use os.path.normpath instead of just comparing WORKDIR
    and S as strings
  license.bbclass: Add COMMON_LICENSE_DIR and LICENSE_PATH dirs to
    PSEUDO_IGNORE_PATHS

Mingli Yu (2):
  tcl: adapt to potential pseudo changes
  bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database

Paul Barker (8):
  bitbake.conf: Prevent pyc file generation in pseudo context
  wic: Add workdir argument
  wic: Allow exec_native_cmd to run HOSTTOOLS
  wic: Ensure internal workdir is not reused
  image_types_wic: Move wic working directory
  wic: Update pseudo db when excluding content from rootfs
  wic: Copy rootfs dir if fstab needs updating
  wic: Optimise fstab modification for ext2/3/4 and msdos partitions

Peter Kjellerstedt (4):
  pseudo: Simplify pseudo_client_ignore_path_chroot()
  lib/oe/path: Add canonicalize()
  bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
  wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS

Ricardo Ribalda Delgado (4):
  wic: Fix permissions when using exclude or include path
  wic: Fix multi images .wks with bitbake
  wic: Avoid creating invalid pseudo directory
  wic: Add --change-directory argument

Richard Purdie (23):
  pseudo: Switch to oe-core branch in git repo
  pseudo: merge in fixes for setfacl issue
  pseudo: Update to add OFC fcntl lock updates
  pseudo: Ignore mismatched inodes from the db
  pseudo: Add support for ignoring paths from the pseudo DB
  pseudo: Abort on mismatch patch
  psuedo: Add tracking of linked files for fds
  pseudo: Fix xattr segfault
  pseudo: Add may unlink patch
  pseudo: Add pathfix patch
  base/bitbake.conf: Enable pseudo path filtering
  wic: Handle new PSEUDO_IGNORE_PATHS variable
  pseudo: Fix statx function usage
  bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
  abi_version,sanity: Tell users TMPDIR must be clean after pseudo
    changes
  pseudo: Update to account for patches merged on branch
  pseudo: Upgrade to include mkostemp64 wrapper
  oeqa/selftest/runtime_test: Exclude gpg directory from pseudo database
  uninative: Don't use single sstate for pseudo-native
  pseudo: Drop patches merged into upstream branch
  bitbake.conf: Add /run/ to PSEUDO_IGNORE_PATHS
  pseudo: Add lchmod wrapper
  pseudo: Update for arm host and memleak fixes/cleanup

Tomasz Dziendzielski (1):
  pseudo: Update to print PSEUDO_LOGFILE in abort message on path
    mismatches

 meta-selftest/lib/pseudo_pyc_test1.py         |   1 +
 meta-selftest/lib/pseudo_pyc_test2.py         |   1 +
 .../pseudo-pyc-test/pseudo-pyc-test.bb        |  15 ++
 meta/classes/archiver.bbclass                 |   2 +-
 meta/classes/base.bbclass                     |   6 +
 meta/classes/distutils3.bbclass               |  10 +-
 meta/classes/image_types_wic.bbclass          |  20 ++-
 meta/classes/license.bbclass                  |   1 +
 meta/classes/populate_sdk_base.bbclass        |   2 +
 meta/classes/sanity.bbclass                   |   3 +
 meta/classes/sstate.bbclass                   |   4 +
 meta/conf/abi_version.conf                    |   2 +-
 meta/conf/bitbake.conf                        |  13 +-
 meta/lib/oe/path.py                           |  21 +++
 meta/lib/oe/sstatesig.py                      |   4 +-
 meta/lib/oeqa/selftest/cases/pseudo.py        |  27 ++++
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   1 +
 .../pseudo/files/0001-Add-statx.patch         | 106 --------------
 ...001-maketables-wrappers-use-Python-3.patch |  34 -----
 ...ixup-remove-files-that-do-not-exist-.patch |  49 -------
 .../0001-pseudo_ipc.h-Fix-enum-typedef.patch  |  31 ----
 ...1-realpath.c-Remove-trailing-slashes.patch |  57 --------
 ...xattr-adjust-for-attr-2.4.48-release.patch |  48 ------
 .../pseudo/files/moreretries.patch            |  19 ---
 .../pseudo/files/seccomp.patch                | 137 ------------------
 .../pseudo/files/toomanyfiles.patch           |  71 ---------
 .../pseudo/files/xattr_version.patch          |  54 -------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  14 +-
 meta/recipes-devtools/tcltk/tcl_8.6.10.bb     |   1 +
 scripts/lib/wic/help.py                       |   6 +
 scripts/lib/wic/ksparser.py                   |   1 +
 scripts/lib/wic/misc.py                       |   7 +-
 scripts/lib/wic/partition.py                  |  66 ++++++---
 scripts/lib/wic/plugins/imager/direct.py      |  48 +++---
 scripts/lib/wic/plugins/source/rootfs.py      |  85 +++++++++--
 scripts/postinst-intercepts/update_font_cache |   2 +
 scripts/wic                                   |   2 +
 37 files changed, 281 insertions(+), 690 deletions(-)
 create mode 100644 meta-selftest/lib/pseudo_pyc_test1.py
 create mode 100644 meta-selftest/lib/pseudo_pyc_test2.py
 create mode 100644 meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/pseudo.py
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/moreretries.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/seccomp.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/toomanyfiles.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch

-- 
2.25.1

