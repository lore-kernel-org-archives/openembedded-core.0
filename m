Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC094C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:15 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.64613.1656877092336652872
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OQV3twRf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso29350pjh.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ucRra75ISpMDFwZ0uymN3CXWiRc/rrexx/O6lXQ61Hs=;
        b=OQV3twRfuaSkZ0TgmwTWwHDGbbGKH7RXfzqY5iFbv+KpP2Q4DnC8I+oQprDCSDtDis
         LFU6OalAGUMHDhR/KV4ycfEnH/GX2jNX91khl4JtDrZ1AT0Md3eOZk0EDDutiks29nWV
         UaqsRl6R/EEKWQyGNNWmmC4/QAHBQs+bnF0nmzsXA2Gv9SA5Mj+lk0iObEH1ssSpGTq5
         vLy+jkLzK3hFfASgRsvd+Vfpei2YUVgUK+yCCIVht3sNFG0rjQen1n1kTkNn/uP90ao1
         RHJp5JgTPh22cF8iBeFXr6KkSiOWa+plhmtD+F8XWqVcXeZ3TbNbvUr2QoIDZKKavJcx
         +CqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ucRra75ISpMDFwZ0uymN3CXWiRc/rrexx/O6lXQ61Hs=;
        b=I6nHYcxHpWLH4EvaC12KbyOn42Ojz22Mxxfw+VolT3L6xUnaTghZqzK0io5dLfU7n/
         ndNQ5+4dY58+sXbeEeEt3Wa1sjdPzjyHnKVj/yMEef0I/bu3dpk6dZRHZAcy7kIX/Xmo
         wG9Oq2drSO5SksO2/EHl2DOJViJkr+kxiKDxhxzot1gZ7KJmcWGgVnW/BrkRMDKDgWAX
         siI+Fiaeo+BpCuucs+9+XuIsYOZjswdaWHGBlYLqUrXDfdYzqq1JCnSR9NADtZEQq9WB
         4oiDKsbQk7QkLSgwEZ+on7YAUTg3G3/XH68iq3RuVzTYRZ+T3Y3hC7V8I3FIzgsXuz3b
         XxOw==
X-Gm-Message-State: AJIora9fqeJQBooT09Znkg3QAPHtN0NC2+drTPwUy6T+zkhnKn6JqFR/
	DaDFvbxsYLuvVEhtoMZLMACNjKX5D9mzaql1
X-Google-Smtp-Source: 
 AGRyM1sAL/tYzeIA/Qb7XrBlhqY8KYjDPzza3Gpdeg4Y8tLHI1uLLw/OYntb+y3EBJq2P9F4pIDZ+Q==
X-Received: by 2002:a17:90a:f8ce:b0:1ef:798c:ae03 with SMTP id
 l14-20020a17090af8ce00b001ef798cae03mr8797256pjd.8.1656877091303;
        Sun, 03 Jul 2022 12:38:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:38:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/30] recipetool/devtool: Fix python egg
 whitespace issues in PACKAGECONFIG
Date: Sun,  3 Jul 2022 09:35:58 -1000
Message-Id: 
 <5a1fd88439c28c473a1723a040d780f100d6295e.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167583

From: Thomas Roos <throos@amazon.de>

Substitute expressions or whitespace from python egg requires.txt when
generating PACKAGECONFIG

Pysetuptools sees the uvicorn.egg-info/requires.txt as extra requirements.
Recipetool parses this information to generate the PACKAGECONFIG.
These extra requirements contain expressions and whitespace, which are not allowed in PACKGAGECONFIG.
This patch substitute them by hyphens to make PACKAGECONFIG parsable and readable.
Also adding an oe-selftest for this.

[YOCTO #14446]

Signed-off-by: Thomas Roos <throos@amazon.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a854d95a79e64f3f82abfa4cc1daec750abf4249)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py          | 15 ++++++++++++++-
 scripts/lib/recipetool/create_buildsys_python.py | 13 +++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3eea2b1a0e..ddf6c0c9f8 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -444,7 +444,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['S'] = '${WORKDIR}/MarkupSafe-%s' % testver
         checkvars['SRC_URI'] = url
         self._test_recipe_contents(recipefile, checkvars, [])
-
+     
     def test_devtool_add_fetch_git(self):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
@@ -544,6 +544,19 @@ class DevtoolAddTests(DevtoolBase):
         # Test devtool build
         result = runCmd('devtool build %s' % pn)
 
+    def test_devtool_add_python_egg_requires(self):
+        # Fetch source
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        testver = '0.14.0'
+        url = 'https://files.pythonhosted.org/packages/e9/9e/25d59f5043cf763833b2581c8027fa92342c4cf8ee523b498ecdf460c16d/uvicorn-%s.tar.gz' % testver
+        testrecipe = 'python3-uvicorn'
+        srcdir = os.path.join(tempdir, testrecipe)
+        # Test devtool add
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool add %s %s -f %s' % (testrecipe, srcdir, url))
+
 class DevtoolModifyTests(DevtoolBase):
 
     def test_devtool_modify(self):
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index f4f51c88b4..5686a62d3f 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -209,6 +209,18 @@ class PythonRecipeHandler(RecipeHandler):
                             continue
 
                         if line.startswith('['):
+                            # PACKAGECONFIG must not contain expressions or whitespace
+                            line = line.replace(" ", "")
+                            line = line.replace(':', "")
+                            line = line.replace('.', "-dot-")
+                            line = line.replace('"', "")
+                            line = line.replace('<', "-smaller-")
+                            line = line.replace('>', "-bigger-")
+                            line = line.replace('_', "-")
+                            line = line.replace('(', "")
+                            line = line.replace(')', "")
+                            line = line.replace('!', "-not-")
+                            line = line.replace('=', "-equals-")
                             current_feature = line[1:-1]
                         elif current_feature:
                             extras_req[current_feature].append(line)
@@ -297,6 +309,7 @@ class PythonRecipeHandler(RecipeHandler):
                 lines_after.append('# The following configs & dependencies are from setuptools extras_require.')
                 lines_after.append('# These dependencies are optional, hence can be controlled via PACKAGECONFIG.')
                 lines_after.append('# The upstream names may not correspond exactly to bitbake package names.')
+                lines_after.append('# The configs are might not correct, since PACKAGECONFIG does not support expressions as may used in requires.txt - they are just replaced by text.')
                 lines_after.append('#')
                 lines_after.append('# Uncomment this line to enable all the optional features.')
                 lines_after.append('#PACKAGECONFIG ?= "{}"'.format(' '.join(k.lower() for k in extras_req)))
-- 
2.25.1


