Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97594C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 12:58:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.4869.1635512303508007075
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 05:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bMzsVrfN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id g13so500688wmg.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C2m6knHWP4+DxxHVT+JPudQ4IkTrtJTMWsparvqqgnw=;
        b=bMzsVrfNz1OciWotMDiQG2CwNCsixZgXXnjVICueX7WQRi7O9ZWTzzqnnxePEt8qhN
         Q4VQMgh+fY/EV2+m+wElmYr0AR1ja06JSOM8fLBL6a1c7cBw8DcH7YXz/eUPLojkYKfc
         LKYMBNLHrQ+GMui5yDm9Pp3TiPqh5pUKZK36M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C2m6knHWP4+DxxHVT+JPudQ4IkTrtJTMWsparvqqgnw=;
        b=AQoJFeUijNKmPIcNi830s7NybuE8wH/IAg6bYQLYcRRtNi8oiTI09OqN233vHac/kn
         OJg14+WDV9e/Qrk2P1yO4byzAUyWa6SRPsL6h6lfLY7gfAN2y3OVu+qR3S9HmQUtQ2gA
         bKzhzCcvGicOuQxll12RQg2/451JCwHRlxEteLMQ9U12p6PD76wWus+HfUXSMPPLVcAG
         HMDjLLYmLx6VtAfvxoYFo1tf40SCQXKxEuUiKMktgxLZKfy+Qt8k6NkYAdWtQtuaGLme
         kowd3vwCgCnbAmYmI8MQhICxe7L+nJ3Iq1jcC/SFrHl2FmioIEZIPCVl3QqB653dmO5h
         gHFA==
X-Gm-Message-State: AOAM532Rv7ht44VbVmmkInce4+ABzEeISIsSazI/jb06GTZOMHzE0qDd
	kif8PzooH8ntuP6wIspVLk6djTHIh89LgA==
X-Google-Smtp-Source: 
 ABdhPJxKLhlFDpu1O1z/LrLOtfrGpaPeocVaVw5KV82M+GaELZWwZUTL84agyJv3UxueINZWHOCJqw==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr19277076wmk.32.1635512301737;
        Fri, 29 Oct 2021 05:58:21 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f597:af8e:ac:d124])
        by smtp.gmail.com with ESMTPSA id
 u2sm5465252wrr.35.2021.10.29.05.58.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 05:58:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] meta/scripts: Manual git:// branch fixups
Date: Fri, 29 Oct 2021 13:58:20 +0100
Message-Id: <20211029125820.3423015-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211029125820.3423015-1-richard.purdie@linuxfoundation.org>
References: <20211029125820.3423015-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 12:58:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157622

Following the scripted conversion adding branches to git://
SRC_URI entries, fix up the remaining references, mainly in the selftests
and recipetool.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 meta/lib/oeqa/selftest/cases/devtool.py         | 4 ++--
 meta/lib/oeqa/selftest/cases/recipetool.py      | 6 +++---
 meta/lib/oeqa/selftest/cases/sstatetests.py     | 4 ++--
 scripts/lib/recipetool/create.py                | 3 +++
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index f91df632d5f..fb0f1097da9 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -53,5 +53,5 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # The CONNECTIVITY_CHECK_URIS are used to test whether we can succesfully
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
-# Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master
+# Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
 CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index f495e84c79b..d2b31af80e3 100644
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
@@ -904,7 +904,7 @@ class DevtoolUpdateTests(DevtoolBase):
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
         result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
-        addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git"']
+        addlines = ['SRCREV = ".*"', 'SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"']
         srcurilines = src_uri.split()
         srcurilines[0] = 'SRC_URI = "' + srcurilines[0]
         srcurilines.append('"')
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index c2a53815d0e..8dc00ac10e2 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -357,7 +357,7 @@ class RecipetoolTests(RecipetoolBase):
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
         recipefile = os.path.join(self.tempdir, 'libmatchbox.bb')
-        srcuri = 'git://git.yoctoproject.org/libmatchbox'
+        srcuri = 'git://git.yoctoproject.org/libmatchbox;branch=master'
         result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
@@ -447,7 +447,7 @@ class RecipetoolTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['Apache-2.0'])
-        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https'
+        checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=master'
         inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
@@ -514,7 +514,7 @@ class RecipetoolTests(RecipetoolBase):
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = set(['GPLv2'])
-        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/matchbox-terminal;protocol=http'
+        checkvars['SRC_URI'] = 'git://git.yoctoproject.org/git/matchbox-terminal;protocol=http;branch=master'
         inherits = ['pkgconfig', 'autotools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 3dab607eebe..a974a497f83 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -31,7 +31,7 @@ class SStateTests(SStateBase):
         # Use dbus-wait as a local git repo we can add a commit between two builds in
         pn = 'dbus-wait'
         srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
-        url = 'git://git.yoctoproject.org/dbus-wait'
+        url = 'git://git.yoctoproject.org/dbus-wait;branch=master'
         result = runCmd('git clone %s noname' % url, cwd=tempdir)
         srcdir = os.path.join(tempdir, 'noname')
         result = runCmd('git reset --hard %s' % srcrev, cwd=srcdir)
@@ -39,7 +39,7 @@ class SStateTests(SStateBase):
 
         recipefile = os.path.join(tempdir, "recipes-test", "dbus-wait-test", 'dbus-wait-test_git.bb')
         os.makedirs(os.path.dirname(recipefile))
-        srcuri = 'git://' + srcdir + ';protocol=file'
+        srcuri = 'git://' + srcdir + ';protocol=file;branch=master'
         result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
 
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 5a267fb57c6..b6c4564761f 100644
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
2.32.0


