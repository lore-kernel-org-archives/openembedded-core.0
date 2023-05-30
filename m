Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BD3C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 22:28:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.30.1685485697002116670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 15:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=q1IAVjwN;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so36942035e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 15:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685485695; x=1688077695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJUzj4Q2oJwjjB/exvQciTX3ARutOqjyziKMxGWGc1k=;
        b=q1IAVjwN5uPYsmJhtOkeNEvzm8eTw4W2KxvEAcrSAM4j2a+IuIb9jwEZMkHy9OQVRo
         G+PIjmlSzHYMbCtyNO1TcFaTwxNoswj3GBwsmh03Dwjy3zF1RzsXaQ7fVCscAx4/61K4
         /6dtoIEZy9H+Dj1TtKQyKVs3dg8JMibarRbK1MIhm/VigS2yautP+B8Q7jNum6vOvXj9
         S2H44WHrCQQibK9GS34jcYPJzgSMjcl09s8bwELMGohoz5y8YQ1dh/1g5EFnuG5O3q+k
         3TsOnZqzNcXLpsNv1iMv6RZeWuVwtz0mZHoswn+yrgN9QCd2Z4L304ZfHZXz2ZkHyUst
         BKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685485695; x=1688077695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJUzj4Q2oJwjjB/exvQciTX3ARutOqjyziKMxGWGc1k=;
        b=YqVzh74hmkNAeR9UzrKw/vZ9E8XNoeb/k6/R53fyjwzihlgZUbVqc+GThquJA7sWV3
         B6w898sW7KjVcyybHtEtVBjtloaqwZs/kBpt4Rrd7I7SF01YoufDbbzWz43W7QMkBVpf
         tbjAOd+ydPHkWtqkJ/qDOQNaAy1/OI5TlGItn+uQud2CEpi54bq+s8lfjgI4vnTp0EZm
         +7s32v5U1VGJkdA6qlCsCX2q5YT+7usTvj20SkPC59IC5+I5XjkL0qyKQfkD6rRCbqa9
         Z8vYNonUhxIFQiu1eSS9fxf00BAWwqFgvEcc08ASTlpbFi9HtSCeC+NIrzZQhzGfl5Nf
         xdsQ==
X-Gm-Message-State: AC+VfDwVNXqro7s7NBg+T9BirZX5nmHdbHqzZfJNwP3jFNyiH6+QYzjD
	SyZPFJH1rw8unmCUWlljOHQXK40MEZVW/UXg
X-Google-Smtp-Source: ACHHUZ6BI+YBhkcQr4xWU8oQF1cFSCAkBagg1jH28s4AksYXaZm6VXRy2wj2jgWPuVNs6yRoUl9ncw==
X-Received: by 2002:a7b:c3c6:0:b0:3f6:ed5:7e8a with SMTP id t6-20020a7bc3c6000000b003f60ed57e8amr2596701wmj.30.1685485695001;
        Tue, 30 May 2023 15:28:15 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-af81-84f4-744a-71c9.rev.sfr.net. [2a02:842a:2e:7001:af81:84f4:744a:71c9])
        by smtp.gmail.com with ESMTPSA id f16-20020a7bcc10000000b003f60fb2addbsm22515276wmh.44.2023.05.30.15.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 15:28:14 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: f.lahoudere@technologyandstrategy.com,
	e.aubineau@technologyandstrategy.com,
	j.guignard@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [master][PATCH 2/6] classes: npm: Handle peer dependencies for npm packages
Date: Wed, 31 May 2023 00:27:48 +0200
Message-Id: <20230530222752.42503-2-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
References: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 22:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181962

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

NPM changed its manner to handle peer dependencies over its versions.
Before NPM 3: NPM installs automatically peer dependencies
between NPM 3 and 7: NPM shows a warning about peer dependencies
After NPM 3: NPM reworked its manner how to handle peer dependencies

The shrinkwrap doesn't have the parameters of the peer dependencies, so we cannot
fetch them. in the same time peer dependencies are not direct dependencies, they should
be installed as run time dependencies.

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 meta/classes-recipe/npm.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 639f461a3a..92e59fefce 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -109,6 +109,7 @@ python npm_do_configure() {
     import tempfile
     from bb.fetch2.npm import NpmEnvironment
     from bb.fetch2.npm import npm_unpack
+    from bb.fetch2.npm import npm_package
     from bb.fetch2.npmsw import foreach_dependencies
     from bb.progress import OutOfProgressHandler
     from oe.npm_registry import NpmRegistry
@@ -169,6 +170,7 @@ python npm_do_configure() {
     if has_shrinkwrap_file:
        cached_shrinkwrap = copy.deepcopy(orig_shrinkwrap)
        cached_shrinkwrap.pop("dependencies", None)
+       cached_shrinkwrap["packages"][""].pop("peerDependencies", None)
 
     # Manage the dependencies
     progress = OutOfProgressHandler(d, r"^(\d+)/(\d+)$")
@@ -203,6 +205,19 @@ python npm_do_configure() {
     if has_shrinkwrap_file:
         foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
         foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)
+    
+    # Manage Peer Dependencies
+    if has_shrinkwrap_file:
+        packages = orig_shrinkwrap.get("packages", {})
+        peer_deps = packages.get("", {}).get("peerDependencies", {})
+        package_runtime_dependencies = d.getVar("RDEPENDS:%s" % d.getVar("PN"))
+        
+        for peer_dep in peer_deps:
+            peer_dep_yocto_name = npm_package(peer_dep)
+            if peer_dep_yocto_name not in package_runtime_dependencies:
+                bb.warn(peer_dep + " is a peer dependencie that is not in RDEPENDS variable. " + 
+                "Please add this peer dependencie to the RDEPENDS variable as %s and generate its recipe with devtool"
+                % peer_dep_yocto_name)
 
     # Configure the main package
     with tempfile.TemporaryDirectory() as tmpdir:
@@ -279,6 +294,9 @@ python npm_do_compile() {
         args.append(("target_arch", d.getVar("NPM_ARCH")))
         args.append(("build-from-source", "true"))
 
+        # Don't install peer dependencies as they should be in RDEPENDS variable
+        args.append(("legacy-peer-deps", "true"))
+
         # Pack and install the main package
         (tarball, _) = npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
         cmd = "npm install %s %s" % (shlex.quote(tarball), d.getVar("EXTRA_OENPM"))
-- 
2.25.1


