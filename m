Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212D2C433FE
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 14:07:25 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.12316.1636034844588126339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=w4WPKMzu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id p18so7323356plf.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n30hgHWkVWk3gq40QYym7UUQhCg+e7wrxlBNPP6SWFA=;
        b=w4WPKMzuPTdbod0xFZ5AIAmUdU1FgWyQFrGIvoJGqOKBerjAYRVHCv2hL15UjAhZ6K
         wxGqf8M0poGPSb0fsEr2wmYc/WgraGLUB14XfHCVPv8aUYfcBLpG4qytfEos1i+BarSW
         qRC9jXBTvvnD9y8sV0IKVa57AG++mq52+ezZfS5Qz8mRMqmTwQgUershvovgzlqc6lhu
         X6U1gj5Ii8S4OZzO5IHfRzgFZsYKGgQ4ay8UajUw/ovQQScjDQMLdURkGmtFznSK4x5t
         bfG32LwMJ0SG8KmMNlmnNv1KDeHV11lOpKG0fyzTf5UiFKMcY4A66fPcosnMdCwQSPqG
         nu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n30hgHWkVWk3gq40QYym7UUQhCg+e7wrxlBNPP6SWFA=;
        b=Fgfu/46H5bfbsDlPjHODAuyrUEmV0BOOkfVipQgLwliECEAdfX/ZZE8+oLsBpOU3xE
         r5Uw2/+ZZdLXTf496BphpomWr74JuJbundx9xmj/0Yiytt5wzyOpYwWMArzcMyDaCyz5
         wCgupgbPGC1FxgNCrFeixfm6gRhD3bMvCP01UuVyEbSTLIbx77qxUXkqtyaULhAQiaLn
         EeKB9ZPTWlUxC2VawHhlD0f7FdhHTzxshwKUSbREqsnF9AeikedHdNo/kTfMpyjsIMZy
         HA1pz8SI2RCAW0NoFUmxNqlyRjKVrpNm2az8SHA5ByJl9DX9icuD0mfQRMdtvOrWYTQo
         qldw==
X-Gm-Message-State: AOAM5336m4z7Y4xWj3++xCgvIrGRnZyAHuF64xDSRhxvHXyIaAxSHMFd
	L32hpO1qK6O9V5rViK4dHgr0WZ7SphXlphxzn+g=
X-Google-Smtp-Source: 
 ABdhPJybdYTHYXMXojA2vPx+uM6f9cUo1Mrx9/HLQ9HprDPF5J4VJq35/xYHmJXxQ351ZMN3tahydA==
X-Received: by 2002:a17:90a:4a82:: with SMTP id
 f2mr22806155pjh.236.1636034843601;
        Thu, 04 Nov 2021 07:07:23 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 m22sm4973291pfo.71.2021.11.04.07.07.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 07:07:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/3] meta/scripts: Manual git url branch additions
Date: Thu,  4 Nov 2021 04:06:49 -1000
Message-Id: 
 <38fc0807eea14dc12610da4ba73c082d5a4b0744.1636034660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636034660.git.steve@sakoman.com>
References: <cover.1636034660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 14:07:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157848

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Following the scripted conversion adding branches to git://
SRC_URI entries, add the remaining references, mainly in the selftests
and recipetool.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5340c0d688036c1be6c938f05d8a8c1e3b49ec38)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 meta/lib/oeqa/selftest/cases/devtool.py         | 4 ++--
 meta/lib/oeqa/selftest/cases/recipetool.py      | 6 +++---
 meta/lib/oeqa/selftest/cases/sstatetests.py     | 2 +-
 scripts/lib/recipetool/create.py                | 3 +++
 5 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 433d4b6651..0240589c81 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -47,5 +47,5 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # The CONNECTIVITY_CHECK_URIS are used to test whether we can succesfully
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
-# Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master
+# Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
 CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0985434238..713efd71bd 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -340,7 +340,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '0.1+git${SRCPV}'
-        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https'
+        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/dbus-wait;protocol=https;branch=master'
         checkvars['SRCREV'] = srcrev
         checkvars['DEPENDS'] = set(['dbus'])
         self._test_recipe_contents(recipefile, checkvars, [])
@@ -880,7 +880,7 @@ class DevtoolUpdateTests(DevtoolBase):
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
         result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
-        addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
+        addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"']
         srcurilines = src_uri.split()
         srcurilines[0] = 'SRC_URI = "' + srcurilines[0]
         srcurilines.append('"')
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index c2ade2543a..e8aeea3023 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -370,7 +370,7 @@ class RecipetoolTests(RecipetoolBase):
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
         recipefile = os.path.join(self.tempdir, 'libmatchbox.bb')
-        srcuri = 'git://git.yoctoproject.org/libmatchbox'
+        srcuri = 'git://git.yoctoproject.org/libmatchbox;branch=master'
         result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
@@ -456,7 +456,7 @@ class RecipetoolTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['Apache-2.0'])
-        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https'
+        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=master'
         inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
@@ -523,7 +523,7 @@ class RecipetoolTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['GPLv2'])
-        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/matchbox-terminal;protocol=http'
+        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/matchbox-terminal;protocol=http;branch=master'
         inherits = ['pkgconfig', 'autotools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index f0c94c8422..1bfe88c87d 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -39,7 +39,7 @@ class SStateTests(SStateBase):
 
         recipefile = os.path.join(tempdir, "recipes-test", "dbus-wait-test", 'dbus-wait-test_git.bb')
         os.makedirs(os.path.dirname(recipefile))
-        srcuri = 'git://' + srcdir + ';protocol=file'
+        srcuri = 'git://' + srcdir + ';protocol=file;branch=master'
         result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
 
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 566c75369a..116bdfd697 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -389,6 +389,9 @@ def reformat_git_uri(uri):
                 parms.update({('protocol', 'ssh')})
         elif (scheme == "http" or scheme == 'https' or scheme == 'ssh') and not ('protocol' in parms):
             parms.update({('protocol', scheme)})
+        # We assume 'master' branch if not set
+        if not 'branch' in parms:
+            parms.update({('branch', 'master')})
         # Always append 'git://'
         fUrl = bb.fetch2.encodeurl(('git', host, path, user, pswd, parms))
         return fUrl
-- 
2.25.1


