Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 35681782F7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Sep 2017 04:04:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m127so4397575wmm.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Sep 2017 21:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xe/OLiv4JHc+Lfg5cm1WCqHNVwmTkIOgoG6m2kV/1cY=;
	b=FRN0/3/349fbex3o5d+pNVzC19QzTeZD/hkG3NFx6iurfdbQ8oXPXNlrckkSEZeKeb
	AosipoYpsfrDkLTq90VWXZgvF9zr7aGEOj/8PA0Wzk6ADYlVmvH4kjislffwfTIN57Lk
	z5EwF8z43F9Ocn1dt/hb4n6Az8CQaq65VsmR0IDB3ZzgDuDU8HRyIFUV4c2x8GUXskig
	rrVJvHVCtQ3wmj7yT7cWjqTJLcEhw/uRndMqsglIVjQM1MNQakhMloJ2Ws8REn//1VLd
	QJBEzeE2XjlASDIr4tjur/CWJrKouaPkdVq9dH2LTnNipZwsHFlu8Agy3bld23hNmI2n
	UIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xe/OLiv4JHc+Lfg5cm1WCqHNVwmTkIOgoG6m2kV/1cY=;
	b=NTv9xyd25ANpfDo64MxiLlFAoePb7l5DUjCICW1wkWifrimEg7HELwM0pjHhLzsn+2
	DvjON0OudQC7obC3IBVIHDX8+hE6thbro3hdrjGV+aRi3Tia2wOOXWCUASK2UBRokAcd
	n4Cl+MI5tiR4blTD8iJrd10qjrEJoUDbhn90xPKMtHn0hFn2vbtkBbbtTFZ//w9K0K6M
	GvuNwXKGgzKK4C+UKX0ju5XCVhiZfBGudJlOzqVcJvapZKufH00iJK/c1VC+GltYxEgN
	IyCcB2zj2uEjWLbuKyNX3mNm3ljoFL834/piftLpQVa58JAb62tTuaLAl3MY8lS6YNuJ
	hvPQ==
X-Gm-Message-State: AHPjjUioF6fzQoNzrQN2RoOyvnCqZqpazq2J/adOLZ47lrSy8PjFRjiU
	x8MolSkguYzp7tWQ21t1UbHegQ==
X-Google-Smtp-Source: AOwi7QA7IR07f9FK9OYQ2Y4rszdPqzQdv6YtmagHceSJOhD7DujmvkJS31Bg7wf/d1uU8MW8qyy7PQ==
X-Received: by 10.80.165.200 with SMTP id b8mr10433015edc.186.1506225875656;
	Sat, 23 Sep 2017 21:04:35 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	x28sm2263161edd.83.2017.09.23.21.04.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Sep 2017 21:04:35 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Sep 2017 06:04:24 +0200
Message-Id: <1506225864-14457-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] scripts: drop True option to getVar calls
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Sep 2017 04:04:35 -0000

From: Ming Liu <liu.ming50@gmail.com>

Search made with the following regex: getVar ?\((.*), True\).

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 scripts/lib/checklayer/__init__.py | 8 ++++----
 scripts/lib/devtool/deploy.py      | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 6c2b86a..6395261 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -46,16 +46,16 @@ def _get_layer_collections(layer_path, lconf=None, data=None):
         raise LayerError(exc)
     ldata.expandVarref('LAYERDIR')
 
-    collections = (ldata.getVar('BBFILE_COLLECTIONS', True) or '').split()
+    collections = (ldata.getVar('BBFILE_COLLECTIONS') or '').split()
     if not collections:
         name = os.path.basename(layer_path)
         collections = [name]
 
     collections = {c: {} for c in collections}
     for name in collections:
-        priority = ldata.getVar('BBFILE_PRIORITY_%s' % name, True)
-        pattern = ldata.getVar('BBFILE_PATTERN_%s' % name, True)
-        depends = ldata.getVar('LAYERDEPENDS_%s' % name, True)
+        priority = ldata.getVar('BBFILE_PRIORITY_%s' % name)
+        pattern = ldata.getVar('BBFILE_PATTERN_%s' % name)
+        depends = ldata.getVar('LAYERDEPENDS_%s' % name)
         collections[name]['priority'] = priority
         collections[name]['pattern'] = pattern
         collections[name]['depends'] = depends
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 7c57174..9cc4927 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -178,13 +178,13 @@ def deploy(args, config, basepath, workspace):
         if args.strip and not args.dry_run:
             # Fakeroot copy to new destination
             srcdir = recipe_outdir
-            recipe_outdir = os.path.join(rd.getVar('WORKDIR', True), 'deploy-target-stripped')
+            recipe_outdir = os.path.join(rd.getVar('WORKDIR'), 'deploy-target-stripped')
             if os.path.isdir(recipe_outdir):
                 bb.utils.remove(recipe_outdir, True)
             exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
-            os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH', True) or ''])
-            oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP', True), rd.getVar('libdir', True),
-                        rd.getVar('base_libdir', True))
+            os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH') or ''])
+            oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP'), rd.getVar('libdir'),
+                        rd.getVar('base_libdir'))
 
         filelist = []
         ftotalsize = 0
-- 
2.7.4


