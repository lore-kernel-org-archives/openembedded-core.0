Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487D2C87FDA
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:50:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.17687.1754643008647558516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WzHTYnUh;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23c8f179e1bso26767545ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754643008; x=1755247808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpF1IxqAU9/PEGB+MoIlW6eZdhSPZKkKBw3mRaTrLvY=;
        b=WzHTYnUh0rLixeR8fkE1Jl+Dp9DGvfvxuKUutcxpmY2D8qROEiixZEm0oKPvO3dCq6
         zunor/zsuqgE31EliPX5xgg08oLqaySdTbwc1MyDgGM2+lQB/EOgChPadw1NPW1zeLEi
         jE0Mv77v3meIRJDZp0Rc1KX/o2GkrB6YuJAahmllEytkDNeE7HAIgLV8EqcEsqIZWJjH
         UTspymMp1rgYj0qQlVPW7dox4BBn3boJClGJNQQmRPU7S7W0nSq+5/2FeYbsBaW+07wN
         9qlzEaDSteTlO0//qgTYU/cFGqJhvl9uXgCifHRFGHkcXIhflTPrFEwKABly5uH0O2og
         u0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754643008; x=1755247808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpF1IxqAU9/PEGB+MoIlW6eZdhSPZKkKBw3mRaTrLvY=;
        b=cDMedlGFDqF7kw3gi64RuqKlfn0+XOCRCfvCuFRl4J0Njaf9M4ekXX18pXM9UORCe/
         0pH0XXHK54KcSvQjSi9DNMDONIowGlVTuUG8JghYuoCq1k2xxdQxls55NaQJmKnudclL
         69+n+RPs4lpAt2DStf39oFdPTKTe52VUqABJcRnWDf74tg4Gq6JiBabg6JTOUMYX7rvl
         jmhE6y5qInAZIRpsFUOcpkd0Nu0+id1vALvD0z09HC0XoIFn+/+1xT7ip7x7aJb5y3TO
         W9lY2jGQR+ZR5mY+KJXU9N5grFxkinOivQzTd1WnnEvrdFf72x7DL3zYi9tA/2DgPCqZ
         n/5Q==
X-Gm-Message-State: AOJu0YwSv+Le9cT9tNMPNQbcEL/bOuvQn3XAsydBIfFs6S5lyQRk5Ne6
	1/LrTC9JDd0M5mjtS9u1+xUtXWhhrs0zRVFVNazmVAlcS9cduW2Zwj3G02+sjw==
X-Gm-Gg: ASbGncsxFdQLxzCejYEf3ThJgFhpBvJtfS7VWU0iMh1+uZ3hDkBtjU9Smu9h6eOyow9
	Zy+6bHn+FIqP/llj6VfeGYoExKm8bxVvGUnf7U1h7+bswuLhoeSi6I0qkpsWDopxU2H19UZnjdC
	+AN/uY9r1KbS8k9/9jv2fIr8lEp2vjxgHqmDO1+FdqLfy26fjhVTQ7Uq5OCJJxZ3s22e29c5V6R
	rp9b1f+9TgzRffPSHHDNU4T9Mb1SwNTf3xb86EU5j1tVGmtcS9sZxNMpOjuDDY0+lVk3x62OLHs
	CwqCmL+kx9yIe3lybaJqFE+GiKDwRciOd19jtlq+K9InqcrTC2ln4r5dwa88IPDy+aZAZePyzo9
	zMewqTefrhfhmlpiIqz2nEoFtb7Q4WYYU
X-Google-Smtp-Source: AGHT+IEjxaMh+rDfF3rObomgg0IwoxRusmYHfChjzb0L4Peh0JTKJYClpgkwPgmENw8PLGCIVf/G2w==
X-Received: by 2002:a17:903:2ace:b0:234:b123:b4ff with SMTP id d9443c01a7336-242c2011167mr35311685ad.21.1754643007672;
        Fri, 08 Aug 2025 01:50:07 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:50:07 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Patrik Nordvall <patrik.nordvall95@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 11/23] bitbake: fetch2/git: Restore escape quoting for the git url when used
Date: Fri,  8 Aug 2025 14:19:19 +0530
Message-Id: <20250808084931.2156763-11-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221608

From: Patrik Nordvall <patrik.nordvall95@gmail.com>

This fixes a bug where escapes in the url path would not be properly
restored for the git commands in the git fetcher. For example, a
space which is encoded as '%20' was not properly encoded before the
clone command.

e.g.

SRC_URI="git://git.openembedded.org/bitbake%20example/bitbake;protocol=https"

resulted in
git clone 'https://git.openembedded.org/bitbake example/bitbake'

instead of
git clone 'https://git.openembedded.org/bitbake%20example/bitbake'

(Bitbake rev: be48024253b93215bb110cd1d05925e789ec9680)

Signed-off-by: Patrik Nordvall <patrik.nordvall95@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8180865c22000adc5114a062dbe67f4b02ea06d5)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py  | 3 ++-
 bitbake/lib/bb/tests/fetch.py | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 9a15abaa79..a73fb79ac8 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -81,6 +81,7 @@ import shlex
 import shutil
 import subprocess
 import tempfile
+import urllib
 import bb
 import bb.progress
 from contextlib import contextmanager
@@ -888,7 +889,7 @@ class Git(FetchMethod):
             username = ud.user + '@'
         else:
             username = ""
-        return "%s://%s%s%s" % (ud.proto, username, ud.host, ud.path)
+        return "%s://%s%s%s" % (ud.proto, username, ud.host, urllib.parse.quote(ud.path))
 
     def _revision_key(self, ud, d, name):
         """
diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index ea91d20d1f..2d0bd29799 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -2442,11 +2442,13 @@ class GitURLWithSpacesTest(FetcherTest):
     test_git_urls = {
         "git://tfs-example.org:22/tfs/example%20path/example.git;branch=master" : {
             'url': 'git://tfs-example.org:22/tfs/example%20path/example.git;branch=master',
+            'repo_url': 'git://tfs-example.org:22/tfs/example%20path/example.git',
             'gitsrcname': 'tfs-example.org.22.tfs.example_path.example.git',
             'path': '/tfs/example path/example.git'
         },
         "git://tfs-example.org:22/tfs/example%20path/example%20repo.git;branch=master" : {
             'url': 'git://tfs-example.org:22/tfs/example%20path/example%20repo.git;branch=master',
+            'repo_url': 'git://tfs-example.org:22/tfs/example%20path/example%20repo.git',
             'gitsrcname': 'tfs-example.org.22.tfs.example_path.example_repo.git',
             'path': '/tfs/example path/example repo.git'
         }
@@ -2469,6 +2471,7 @@ class GitURLWithSpacesTest(FetcherTest):
             self.assertEqual(ud.lockfile, os.path.join(self.dldir, "git2", ref['gitsrcname'] + '.lock'))
             self.assertEqual(ud.clonedir, os.path.join(self.dldir, "git2", ref['gitsrcname']))
             self.assertEqual(ud.fullmirror, os.path.join(self.dldir, "git2_" + ref['gitsrcname'] + '.tar.gz'))
+            self.assertEqual(ud.method._get_repo_url(ud), ref['repo_url'])
 
 class CrateTest(FetcherTest):
     @skipIfNoNetwork()
-- 
2.25.1


