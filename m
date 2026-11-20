Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6392.1795182838765092756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VqJAwY45;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so8364465e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182837; x=1795787637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dh3CddWyAc8EdAOuyBMk6UWEKR1I6aiNupgWVQ2ZM5A=;
        b=VqJAwY45HugSuSPDmUgg4Nzg+T5Z1EY5tWf+7Hmb1bXCf8rIu7U59GgCt4MX/AS2/A
         t7uyMZjyTek6cbVt9qf6UmLgK6sykdI3qCjcVel3nbEdwMPIrmHbmBTZSt3AxEavLgXB
         qod5SSmsKAbvYRzzCYHUkk71yi8ls0LLDVCVtQTjFg6XtiV3MltT7qiwohyA/Cycj+qM
         oPiNfrOAMeaacXc56STY2Tmuo/aRjGL8muP4qzgydSdzx83eTiqohCDonQKxQ2wxSK2l
         ongK6+FBBLyJ48ZZJSEQuM+o8dqILz/BYNqq7MCDKptq7RJzHOHYATQdD07ujkctRp/Z
         pG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182837; x=1795787637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dh3CddWyAc8EdAOuyBMk6UWEKR1I6aiNupgWVQ2ZM5A=;
        b=Tengk4slhQZSobAWH1UZ+zrHBkkhhpzyaDoZ3O+ltyMXl98T7qt2AiYejvS3i0BFgF
         Z07vq42Wz9B2eODh+5340BwEkildMqYdC4YPZgMy2sn8Jjd7AZVYD5Ro9EjksrFElXrv
         cAqY1z+7nji1RKZqW17YBiRJOOMmLys/t4LeBilOCptwfKyKUXwJgrpPiRvSq4sTEf8U
         gsmVUhz/ZENqS3sxajIktpCjLvFwHSV6crXiE0ZBE74dhP75XqyCYh/5TMzWJYUL8z0/
         spWVRZaqUYVoyZkUQ7JCqXa3oF1nKEneWu8ert98Lfx2JTr1ElyP6MoqmCMxkO2Orlpt
         3iig==
X-Gm-Message-State: APuU4Z/04AsOd9lUEBk4lquu5FfABe00gnO6ZvL2ZQIZf6+UZK6oVaYN
	SdaCe2itg3hvSodcOmWu2cm3mtiMFZOokb8djuLtByOAJWnbw5Ni3vyYQNTPyAnd
X-Gm-Gg: AYBFou0V8XPYtvpzwcWDH5aZRUI+s+rD7Omyt0/glBGIEGcuhz8X2lKU+/pFEL1/5za
	E+PdmjD5MeJqKeANeOb/+U81WOs3bev7mK+No2SFeqg6Ew51NsO1r69KLaVFghCHMlsSK8I6j1x
	bQsdW3gum0uFgW5pohXUZPngmVhCHuwz6ZKMZTd+ffa5bkN5Mjs9888hVwaAyjQBWWnB/2a+4i1
	KDHgmnVTgj0zJAQ3PwXDdRy6nddY7MTu/Ou4LmnSAOdEvbUrKHtgoArJUjBx7rYBBrKkh8/TqFI
	p3g5pDRLU0vvsbpYAAfwZm3M2lfNYtrZyqwGJ6wGble/hwZgkQEuFypxaX8murUY4ZXCHOPc//J
	pZbYds8MLPq4GCE7Lrpz6qOr/uETHNaRV51Zh7ZWcndQV9KHP+ZWWJRY+sFGDRgO968Voc3Dzmf
	Xzw3kIBc/ID2ixGin8XLaD9fnT91otUKv9FSEO6NNPAglA5onSlCaftlwp0OSGtWopQ2PWOMowq
	CZkH7WkO9QqN6Cksmo7VRoGVdCRxAvI3WKVXTVq9DA0ya4Lim8NsVp5TV8/kB+f1ENWY8SeAY7R
	i8fodxBunAE=
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr66589475e9.11.1795182836909;
        Fri, 20 Nov 2026 05:53:56 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:56 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 08/10] npm: Check that SRC_URI lists all dependencies of the shrinkwrap file
Date: Fri, 20 Nov 2026 14:53:39 +0100
Message-ID: <20261120135342.2628228-9-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120135342.2628228-1-stondo@gmail.com>
References: <20261120135342.2628228-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250801
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

When a recipe lists the npm dependencies in SRC_URI, the list can become
different from npm-shrinkwrap.json, for example after an upgrade. Then
npm.bbclass packs a wrong set of dependencies.

If SRC_URI has no npmsw:// entry, compare SRC_URI with the shrinkwrap
file in do_configure. Fail if a dependency is missing, or if an entry
unpacks into node_modules but the shrinkwrap file does not have it. The
error tells the user to run the update task.

Do not check with externalsrc, which removes the dependencies from
SRC_URI. There the external source tree must contain them.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes-recipe/npm.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 6f3261238d..e0d3d88d2b 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -111,6 +111,24 @@ def npm_pack(env, srcdir, workdir, excludes=None):
 
     return (tarball, j)
 
+def npm_check_src_uri(d, shrinkwrap):
+    """Check that SRC_URI has one entry for each dependency of the shrinkwrap file"""
+    import oe.npm
+
+    destdir = os.path.relpath(d.getVar("S"), d.getVar("UNPACKDIR"))
+    dev = bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
+    try:
+        expected = oe.npm.shrinkwrap_src_uri(shrinkwrap, destdir, dev)
+    except ValueError as e:
+        bb.fatal("npm-shrinkwrap.json: %s" % e)
+
+    missing, extra = oe.npm.src_uri_differences(expected, d.getVar("SRC_URI").split())
+    if missing or extra:
+        bb.fatal("SRC_URI does not match npm-shrinkwrap.json (%d missing, %d extra entries). "
+                 "Inherit npm-update-dependencies and run 'bitbake -c update_npm_deps %s'.\n%s"
+                 % (len(missing), len(extra), d.getVar("PN"),
+                    "\n".join(["missing: " + url for url in missing] + ["extra: " + url for url in extra])))
+
 python npm_do_configure() {
     """
     Step one: configure the npm cache and the main npm package
@@ -177,6 +195,12 @@ python npm_do_configure() {
        if int(orig_shrinkwrap.get("lockfileVersion", 0)) < 2:
            bb.fatal("%s: lockfileVersion version 2 or later is required" % orig_shrinkwrap_file)
 
+       # externalsrc removes the dependencies from SRC_URI: the external
+       # source tree must contain them
+       if not d.getVar("EXTERNALSRC") and \
+               not any(url.startswith("npmsw://") for url in d.getVar("SRC_URI").split()):
+           npm_check_src_uri(d, orig_shrinkwrap)
+
        cached_shrinkwrap = copy.deepcopy(orig_shrinkwrap)
        for package in orig_shrinkwrap["packages"]:
             if package != "":
-- 
2.56.1

