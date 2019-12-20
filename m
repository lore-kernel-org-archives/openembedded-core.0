Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id DEA127FD10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:23:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p9so9536301wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q86MQ+5f2GjCbMQXnpWs2LtpH18Lj5UighipfRN4juo=;
	b=iNPwQem0xhTSjrW/KJQ8l8Dn+4yepenzHnizX5rpjpVJS80romc4yayf+0XAerC9qx
	mBEqqWyHX5DGDnH3Dq2dVQhpzwxgqon8QeSxWejRyYCl3mpF5L2VZXaTrXvIU1l0Q5ew
	q5dLulTPrcRFNFspLpbMvj4J8YXfUVYWPR65K8Uq3Up/kmQekJBelDToED1Lw6pcWyjD
	tmQX+XMA4TdFulYaUVgAAl9X6OibUvGWuUWevu7rvvFUtA6MUc9wUEZ1AbpMNXusE5Ih
	gR8MxNBjwwL4B2IPe/kkT1MQq4o8Fn3vQWLt280hN7jC7iZ8m5BsiH08ChWj2SQwnG7Q
	nBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q86MQ+5f2GjCbMQXnpWs2LtpH18Lj5UighipfRN4juo=;
	b=S9nAKwI5x+SoSeeL+bt0SAD1cetMVkLUJXJR4BLoaeFbFONHM56PsQdpwFJMB0hXv1
	SZryPr7lS78+Bk7ITwmYTG2avwi85zotfdpiFSYZb96mdKPaYMiqzyYKN2JcEIFU6LEI
	7MrrV1Hld+E/TyAHaKzbGqbTw+CbV8HrqQHFM5bYhSEF6dFn/DbO+X76ki+WQzHgW+l4
	mIBMeg3YZR47RI+JjzrNw1XhIWcXn+1BNhXLkTCAIOWS3tM5Igqogldb1m1hmA4esJmL
	f468KvpDBrUFt2UiFFsu3QepVIUSCwBW7mK/g3mx6u3pMYDnu7lJ2lQU8VwHaRy0QJee
	WZOg==
X-Gm-Message-State: APjAAAWAXLVW04atWGlbRZKd5cheg5aILsK4op1hFDjTSMTAGv59zxA7
	oGm+O5O8LozvCTMpYSuqPoK1IC1VLxo=
X-Google-Smtp-Source: APXvYqxe6kINbdMRQ4Kkdl4Qom1ZJHsB1tHdnhi+3z+PSB2g0yD+dC8lwIcJuKbaDp6mMDDDcF9BXg==
X-Received: by 2002:a05:600c:2298:: with SMTP id
	24mr18010509wmf.65.1576859038294; 
	Fri, 20 Dec 2019 08:23:58 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	w17sm10436356wrt.89.2019.12.20.08.23.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:23:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:23:43 +0100
Message-Id: <20191220162351.94498-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/11] recipetool: always use python 3 in recipe creation
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
X-List-Received-Date: Fri, 20 Dec 2019 16:23:58 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/lib/recipetool/create_buildsys.py | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 3cb02766c87..35a97c93454 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -226,9 +226,9 @@ class CmakeRecipeHandler(RecipeHandler):
                         elif pkg == 'PkgConfig':
                             inherits.append('pkgconfig')
                         elif pkg == 'PythonInterp':
-                            inherits.append('pythonnative')
+                            inherits.append('python3native')
                         elif pkg == 'PythonLibs':
-                            inherits.append('python-dir')
+                            inherits.append('python3-dir')
                         else:
                             # Try to map via looking at installed CMake packages in pkgdata
                             dep = find_cmake_package(pkg)
@@ -417,7 +417,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 }
         progclassmap = {'gconftool-2': 'gconf',
                 'pkg-config': 'pkgconfig',
-                'python': 'pythonnative',
+                'python': 'python3native',
                 'python3': 'python3native',
                 'perl': 'perlnative',
                 'makeinfo': 'texinfo',
@@ -566,16 +566,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
             elif keyword == 'AX_PROG_XSLTPROC':
                 deps.append('libxslt-native')
             elif keyword in ['AC_PYTHON_DEVEL', 'AX_PYTHON_DEVEL', 'AM_PATH_PYTHON']:
-                pythonclass = 'pythonnative'
-                res = version_re.search(value)
-                if res:
-                    if res.group(1).startswith('3'):
-                        pythonclass = 'python3native'
-                # Avoid replacing python3native with pythonnative
-                if not pythonclass in inherits and not 'python3native' in inherits:
-                    if 'pythonnative' in inherits:
-                        inherits.remove('pythonnative')
-                    inherits.append(pythonclass)
+                pythonclass = 'python3native'
             elif keyword == 'AX_WITH_CURSES':
                 deps.append('ncurses')
             elif keyword == 'AX_PATH_BDB':
-- 
2.17.1


