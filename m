Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6389.1795182830191692025
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=q3z0pOOO;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so6184635e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182828; x=1795787628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+nWPS+sYOm8kcYbdd/JaIdRX6YVtZqKdNHWi7mMUy4=;
        b=q3z0pOOOYWP0JgM2O50qq8EfapPPCMoTdWQdNBFZiJqJCrF3wigenf9zdNfriIJIyM
         kp53uhVX/2A96buOJFGV1+33o7dYsXWMWaCBaUoeCLMP80uKdaUpfn8/iBuybylzFI4u
         vhim2iOY7qynblPnpKXProQ/gGup3ZVEhCKJUpavF3isOl/gXZz3RMhU/aH92cZIeNMI
         QQ3rCYUoOTZhJHMcrSPzdEWejXAmW3zm0sceGVEC9RCNz0AoDFUL74eOLKXSXWMN3fbF
         W3eEgt0BZPpaFBqiQFzDDHT83uJbdiY2bnVYgMjz72cakviZO0V8VMsawI7R0Ncsv0wH
         FhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182828; x=1795787628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+nWPS+sYOm8kcYbdd/JaIdRX6YVtZqKdNHWi7mMUy4=;
        b=j3MMUGjLb31D3jBP97gphDxe8B51Il53xuBwkn5l7siaR6RBfq0ERiJxs4wadfwHmi
         5ZYIIu17KB6xtph9ULAflbgzR+05cXgnbY8A/rA8MxrDCLl9fFLvHa2ZvrITLazyQZZA
         LRdyOURcrYYDmt8zlMrvbxPnZxsIM89jnzIsOQnWaXoz0+ofwTBjuvdAeRJbMRJ3pLC1
         /npzJuV2uF9l19KH1M9L7sXP/OEK6UXPni3ePN7LqxCbuC4s3ZbDby2m/BErjNq/RyWu
         rPbggk/7eOhLHzLX0oyVfVOgISWwWTu6MpmPAWZK83OoqgV2VitdG1643/FrpXbuDtus
         Wnsg==
X-Gm-Message-State: APuU4Z93T3LZqCv3+DRjeQzKKlW9A81Xhd1fx2iO2dwmKPhNlbawx1NX
	C62CULHZIF9S0WBkwP3PcbEHOLZJ5HjIAuoWJ1XGdVIUl+kJaynBb12V2v0lWJ1Q
X-Gm-Gg: AYBFou3bwEj9LHmx0AHfidHPVOhMNfrUKMDKx4uaxsMkaIMBc+sbHvrL/A0Pplr2Hrx
	CeTA3N3nV/8XI5dHD/CnEfvdpGZBzdHk2oiScF51odedfskOI1PUVl9JFsK9zZkALRFZ9A8j2a4
	lyOWCQLWJl9a7Vv71V77eMguKUk4yF+Ix88yE1xcEuxc9EIjHQv2nHlz6HU4bITgaFZathLMQ3a
	x2qHDUj5GZNrOLP7vIJ8Ru1KCKKTVSM/pk5cH6B3fbFOAomnswvKIaFYTj+0+K0sQrnRlGlN3rJ
	ayUU388ESIcDOBP7Mk/2TInhi96pgWhBK2wJe7xGCVKJYa68QZkHEfGgpQdixdZ8Pe5OXX16BWZ
	5MIxe6BHOM5ejAqrR6js47/bZPL7jU8A2QqCcFkD5EQAmVbJzWWIVX889SHP9+DGVRW1Qkh64tw
	jhlNRYkQIm6QiZyGzOlC/fblHeRr0v4Lg1kBgSUQRrPsXAWQq8iMLUcRrnRplsbeiWJy/NhvhDV
	jqRyyrj1z2Qq+DdZkjvZpfM6UNvdNvm+OKmujSmZ29u66S8idBiBhZv+v0DFo8JsPKXwPZm+KNV
	wQQg/uuFuBg=
X-Received: by 2002:a05:600c:3547:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb888098bfmr67461895e9.11.1795182828415;
        Fri, 20 Nov 2026 05:53:48 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:47 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 04/10] recipetool: create_npm: Remove the "@" of a scope from generated names
Date: Fri, 20 Nov 2026 14:53:35 +0100
Message-ID: <20261120135342.2628228-5-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120135342.2628228-1-stondo@gmail.com>
References: <20261120135342.2628228-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250797
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Since bitbake commit 7c9573cb6, npm_package() keeps the "@" of a
scoped package. This gives unique download file names. recipetool also
uses npm_package() for the recipe name and the package names. So it
creates "@savoirfairelinux-node-server-example_1.0.0.bb", and for a
scoped dependency it writes overrides that bitbake cannot parse:

  LICENSE:${PN}-@-execute = "MIT"

Remove the "@" from these names. The selftest expects the recipe name
without it.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 scripts/lib/recipetool/create_npm.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 437cb91ad4..50dd45c7d2 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -23,6 +23,12 @@ logger = logging.getLogger('recipetool')
 
 TINFOIL = None
 
+def npm_recipe_name(package):
+    """Get a recipe or package name from an npm package name"""
+    # npm_package() keeps the "@" of a scope for unique download file names.
+    # An override cannot have it.
+    return npm_package(package).lstrip("@").strip("-")
+
 def tinfoil_init(instance):
     """Initialize tinfoil"""
     global TINFOIL
@@ -147,7 +153,7 @@ class NpmRecipeHandler(RecipeHandler):
         # Handle the dependencies
         def _handle_dependency(name, params, destdir):
             deptree = destdir.split('node_modules/')
-            suffix = "-".join([npm_package(dep) for dep in deptree])
+            suffix = "-".join([npm_recipe_name(dep) for dep in deptree])
             packages["${PN}" + suffix] = destdir
             _get_package_licenses(destdir, "${PN}" + suffix)
 
@@ -171,7 +177,7 @@ class NpmRecipeHandler(RecipeHandler):
         peer_deps = packages.get("", {}).get("peerDependencies", {})
 
         for peer_dep in peer_deps:
-            peer_dep_yocto_name = npm_package(peer_dep)
+            peer_dep_yocto_name = npm_recipe_name(peer_dep)
             bb.warn(peer_dep + " is a peer dependencie of the actual package. " +
             "Please add this peer dependencie to the RDEPENDS variable as %s and generate its recipe with devtool"
             % peer_dep_yocto_name)
@@ -195,7 +201,7 @@ class NpmRecipeHandler(RecipeHandler):
         if "name" not in data or "version" not in data:
             return False
 
-        extravalues["PN"] = npm_package(data["name"])
+        extravalues["PN"] = npm_recipe_name(data["name"])
         extravalues["PV"] = data["version"]
 
         if "description" in data:
-- 
2.56.1

