Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6454.1794455917448530779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 19:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CexGym+H;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1601396a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 19:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794455917; x=1795060717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1buTejLNLEUMYN5D8y8OPhTNjlU3XPZg52p1N9Yv1Y=;
        b=CexGym+H14wnHymx1Uj7GEEIxvBmqYP26UqXmKYJBX1XU7nAh7fMT383fxJcN6P1VP
         GEOwHrIFotqLsSMPUFfVy7kEbYTk1i8aHG4eAraAw0BWa6uMQmnlntmOuqzIrKZKL4h8
         CuXKxwqwYcnmX05nkmfhx0PTAfvqanJs75Y9Dfxk9j0p9Ax/9EE39L9EEyWqUbT6GRK1
         /SOLlrp7UolZBD2TTUgMvTZHXO58VIecEKfo12cGEi3N+vFH6+Q1RHzVHro0YMmbkN2u
         At4hg9njGTyhjZuC6cfBXOtmaxvkMUxW4I+WKsR1yPYzMok3BRzYJmybqBk7xiQKXpgm
         Vb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794455917; x=1795060717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1buTejLNLEUMYN5D8y8OPhTNjlU3XPZg52p1N9Yv1Y=;
        b=Cu/m9nlSCtLiPXHWMtouqZILAWZQGgS8Rp4FWMOp06fToMlnR2lAsDqXTFfEHTx6BU
         LkUGaBZ31SPp9GkxDyoNDe7T3hTN1oHpp2Hyj5gqylqxgOsHT63tLvOBZdWkZblJHkrf
         //qJMO13Oyijm+ebAfk5e5JNgJoKiZkHzUfxZH8fsKF1j9eFY+hPt1KzUJn0ZE51LmGY
         5Vl8UtuTmAuYj1Q+blZUhCZ6Q9mIlKknM6x8z3SwY/nqXkmSQvXVKYgJC8if1aGzm7E9
         4JWJQDORZL9KWUD+K99MnKVC8vkbhB72BtMpBMMr7nuEfKGOEuRo4mfN8492Og+6Xbem
         KIzQ==
X-Gm-Message-State: APuU4Z/r0zojGf1Ejx++SXS23hNcnwPSNnkwDVvaV7MRuXx5dTGI3GYB
	DE7+wZKOhxEs963hSyN2KMNE1KI+PNqWfazuSv5hAoJjNpLY7hnKtUIljUSedaAX
X-Gm-Gg: AYBFou3cdEP7VMSINh+kRLvwvK2syfogAYaQ6g5k0+EzL+YU5xpPzsH2QhjQbcVhWOj
	ebIeZR9WyEgXoLHOc7fggnLgM6aa8J2wEMiPMnnsUvYSDZ230K3WItdj08+Vd1n3tyNfUc3wxcV
	mrxBB6A4MCJGSXviLvp9B1F06B0A93cPRNRMMft50KBtOqvge283WlGbmNFtGH4OJOjKDrKgBSV
	X2I5eX0ylaPdFxk0WUIKle5870skIXK4+6AgMRo0VeYLzW+zBuOMenS/sq0E4WxEmGL5d2QeTaq
	XF3G8iBsRUihS6HustOOpeIAoIf8RP0ZeDf3C7cqheQcAftIY5hl5UMvPpE+jitJ9lVzGjv8qzU
	G2PbfH76uhtZIyKzxsaOqgQyWJr8y0OoDFobAe5dAxo5nHd0bFx6uJLFKxtsHydMlPX1n8576zX
	XbW+Fil2tuJp0l0UWdTruty0jGhHJ1wRXRd9vtkg+4HHtWEpPJ0U4cW5WU6L+9xw/GbuwsaN8ce
	aJZ4ovul6OmB0KVfH70OpSuTapuHuRkFA+gJH7jlHVc01a18MSEz3uQQmxuVnWAQ8nOBCbiTdaO
	u7/OOHuFIgk+jJFFNbO77fDQipf2WpCd1ZIJ1tO6ZwcUkauCnfyDwemnQbE56/4=
X-Received: by 2002:a17:90b:1642:b0:3b0:9941:ec79 with SMTP id 98e67ed59e1d1-3b182f85322mr4143341a91.53.1794455916576;
        Wed, 11 Nov 2026 19:58:36 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm2254249a91.10.2026.11.11.19.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 19:58:36 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 1/2] recipetool: create: keep tag= in SRC_URI
Date: Thu, 12 Nov 2026 03:58:33 +0000
Message-ID: <20261112035834.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 03:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250062
Content-Type: text/plain; charset="utf-8"

The fetcher now checks that tag= resolves to SRCREV, so stop dropping
the tag from the SRC_URI of the recipe.

[YOCTO #15816]

Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 7 ++++++-
 scripts/lib/recipetool/create.py           | 2 --
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 54b7cb3a65..c278abdab2 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -776,7 +776,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
-    def _test_recipetool_create_git(self, srcuri, branch=None):
+    def _test_recipetool_create_git(self, srcuri, branch=None, extravars=None):
         # Basic test to check http git URL mangling works
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
@@ -792,6 +792,7 @@ class RecipetoolCreateTests(RecipetoolBase):
                 checkvars['SRC_URI'] = 'git%s;protocol=%s' % (srcuri[len(scheme):], scheme)
         if ';branch=' not in srcuri:
             checkvars['SRC_URI'] += ';branch=' + (branch or 'master')
+        checkvars.update(extravars or {})
         self._test_recipe_contents(recipefile, checkvars, [])
 
     def test_recipetool_create_git_http(self):
@@ -806,6 +807,10 @@ class RecipetoolCreateTests(RecipetoolBase):
     def test_recipetool_create_git_srcbranch(self):
         self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;protocol=https', 'matchbox-keyboard-0-1')
 
+    def test_recipetool_create_git_srcuri_branch_tag(self):
+        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=matchbox-keyboard-0-1;protocol=https;tag=0.1.1',
+                                         extravars={'SRCREV': '630d89068dc0a1e9199306d405cb32f892dfa4d3'})
+
     def _go_urifiy(self, url, version, modulepath = None, pathmajor = None, subdir = None):
         modulepath = ",path='%s'" % modulepath if len(modulepath) else ''
         pathmajor = ",pathmajor='%s'" % pathmajor if len(pathmajor) else ''
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index e0da96dea0..662e7a6232 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -600,8 +600,6 @@ def create_recipe(args):
                 logger.error(str(err))
                 logger.error("Possibly wrong tag name is provided")
                 sys.exit(1)
-            # Drop tag from srcuri as it will have conflicts with SRCREV during recipe parse.
-            del params['tag']
         srcuri = bb.fetch.encodeurl((scheme, network, path, user, passwd, params))
 
         if os.path.exists(os.path.join(srctree, '.gitmodules')) and srcuri.startswith('git://'):
-- 
2.43.0

