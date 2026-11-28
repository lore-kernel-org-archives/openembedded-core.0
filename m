Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.222.1795827023895458568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 16:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZdUzya3n;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: c137.marques@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso62038835e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 16:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795827022; x=1796431822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggPwdA43quuACAiz2JyfVL1xD9LZ4yYzOtUs3+tvUlo=;
        b=ZdUzya3nUTbXpy82C2lv5y220gR7625asZDKtEY65ydZTXZdnMpWBe2pFkbj0dvUIY
         GnOJthnbQCUyuVUPyVg2JYUSa8s5rwizKiEPXG+R/7gTrbGK0yecDxfboGTTuh8AoESf
         FG+t7YF5KZ7ASmMRPtvx2xwZJ9c8CQOLtBowNtKPjv4x+hLznRCyBd/BXiGzjN9CnB9i
         2t/T00IUN0HvxP8o0GH+WnCs2I0vpH7t/qncboX9un7E8Ena0LkP1pezq9KPxIxxfPbI
         H99MJUQHkIzpLTChst+qHVGOAgF9L4NtOBJ+FUPpwJRKGtlky4qTlfqqH2eWZ2z3aUzH
         bXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795827022; x=1796431822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ggPwdA43quuACAiz2JyfVL1xD9LZ4yYzOtUs3+tvUlo=;
        b=0hlo+SHybUIQeazOLekaGQoVOZ6xNL/IYZlWFiEdBeoQivyF9xyCdVoba2+ho7qbxm
         3KWi8CchZpTeFUh75Kyh5W/9Qwu15bY+pa7c7w7nvN+q1FoWu67LtiEnWegsuMc+cXSy
         RlTOjQVYg3/JXUVD8uv+fIwr4OYVFJfRMBsbCJhesIiT/Ohq0/CuRt7ktzQLznXMSxfj
         hRlxb9Z5dVfQJBRh2o+ABWDOOeyfLhEr3L6Yt0ZgQIMiUnA6x1bflHYD10pKljjMC8ga
         bAifL9Udx/U69trEuliQJzjKdx+N6IrCs/iKlxf8nkoFMEvubshsU8ypLe1uVWBUTvdx
         Xt6Q==
X-Gm-Message-State: APuU4Z/2guBq/MJXrt4l6I7eo1Fp1M505p2Wi8ddZBG1GCW6nwNZM6TE
	Vn59cjuUpowBoP+2vvZ3+XoQx1WBwzb6NS8j9fnlc5cM8h3/T9QX1SI4eIp7Dp9K
X-Gm-Gg: AZFdTZdqyr9EL+lVlX46qryFlGG9JYwSr4vN5xN+Adv/bwGxkrF6/p0azcw8SEkKOy8
	WCR9xnmUW65d99hz1xgyvf8E3vg+dNnj7sTr3lCnItUOlYwGIUpzg4SKlHpN5pUpgxEGMIKEXqI
	qcAyYEYCKvTsVxy0KXoVSrEuBoGpOwA2A6I8QwOnniBZWkcE6ShkNtZO3smXcCdwNfhVYS/uxyR
	SUSdphqk15oXuA8yN2p2NSLn7orIA7e5CQ79yPJb7utMkC5/y7uOHGxfZvx5kXvn2gYiS2yG7vu
	MO0LDlxKlq/uDpoN0cetiNoR3NqDMFAbx21IHi/dNseJw8B6wsWCePlfYiT5K93201sYB+ZncAe
	OUBYJqdJFYrzB3w/ReGmhn04Gl0VaxQHtoXTyyCNfdAMV5gvjeF155lHPw/Sk+GriwYxhQxGJMW
	f54Km0r/XtAKrKIV1VUab1YvBtBokStPDYAWsSdCyBUj8Yfuo65ct8YJxtvKtNU93WWtSr5ZS90
	I7DcphVx0adufl7e3fzWMDIMg7f3msq1cNhl1J6dxLQT84KFjNVBa5NoR9YuzzndG1OYrN6ftw/
	X9aCICcY7vm91JAw7xba2g==
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id 5b1f17b1804b1-4bb8880abafmr630450825e9.9.1795827021998;
        Fri, 27 Nov 2026 16:50:21 -0800 (PST)
Return-Path: <c137.marques@gmail.com>
Received: from pc ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm46864646f8f.18.2026.11.27.16.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 16:50:21 -0800 (PST)
From: Alexandre Marques <c137.marques@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre Marques <alexandre.marques@ctw.bmwgroup.com>
Subject: [wrynose][PATCH 2/2] spdx30_tasks: fix missing SPDX runtime dependencies
Date: Sat, 28 Nov 2026 00:50:09 +0000
Message-ID: <20261128005009.4101905-3-c137.marques@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128005009.4101905-1-c137.marques@gmail.com>
References: <20261128005009.4101905-1-c137.marques@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 00:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251469
Content-Type: text/plain; charset="utf-8"

From: Pascal Eberhard <pascal.eberhard@se.com>

The runtime dependsOn relationship entries between software_Package
is missing from the generated SPDX files.

Remove the subpkgdata lookup as the final pkg_name is already resolved
by collect_package_providers().

Rename variables to avoid shadowing the 'dep' variable and to make it
explicit which package/pkg name is being used.

Signed-off-by: Pascal Eberhard <pascal.eberhard@se.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a67f44021f39b19f42791441616ba57d522f1d00)
[Adjusted context: wrynose does not have 28ffcc0653 ("spdx: Reformat")]
Signed-off-by: Alexandre Marques <alexandre.marques@ctw.bmwgroup.com>
---
 meta/lib/oe/spdx30_tasks.py | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 953a4ba052..d89763743c 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1129,9 +1129,13 @@ def create_spdx(d):
 
 def create_package_spdx(d):
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
+    pkgdatadir = Path(d.getVar('PKGDATA_DIR'))
 
     direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
 
+    # providers[package_name] = pkg_name, where:
+    # - package_name is the name in the recipe in PACKAGES/RDEPENDS, and
+    # - pkg_name is the final name given by the package manager.
     providers = oe.spdx_common.collect_package_providers(d, direct_deps)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
@@ -1185,26 +1189,24 @@ def create_package_spdx(d):
             if dep not in providers:
                 continue
 
-            (dep, _) = providers[dep]
+            dep_pkg_name, _ = providers[dep]
 
-            if not oe.packagedata.packaged(dep, localdata):
+            if not os.path.exists(pkgdatadir / "runtime-reverse" / dep_pkg_name):
+                bb.debug(1, f"pkg_name {dep_pkg_name}, package {dep} missing for {package}")
                 continue
 
-            dep_pkg_data = oe.packagedata.read_subpkgdata_dict(dep, d)
-            dep_pkg = dep_pkg_data["PKG"]
-
-            if dep in dep_package_cache:
-                dep_spdx_package = dep_package_cache[dep]
+            if dep_pkg_name in dep_package_cache:
+                dep_spdx_package = dep_package_cache[dep_pkg_name]
             else:
-                bb.debug(1, "Searching for %s" % dep_pkg)
+                bb.debug(1, "Searching for %s" % dep_pkg_name)
                 dep_spdx_package, _ = oe.sbom30.find_root_obj_in_jsonld(
                     d,
                     "packages-staging",
-                    "package-" + dep_pkg,
+                    "package-" + dep_pkg_name,
                     oe.spdx30.software_Package,
                     software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.install,
                 )
-                dep_package_cache[dep] = dep_spdx_package
+                dep_package_cache[dep_pkg_name] = dep_spdx_package
 
             runtime_spdx_deps.add(dep_spdx_package)
             seen_deps.add(dep)
