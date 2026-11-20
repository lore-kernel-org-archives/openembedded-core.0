Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6386.1795182827902775215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:53:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=O9yoBDyc;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8337795e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182826; x=1795787626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36PISSeuZF8VjgxufAYHZcqgrQ/dXVu9sOTMES5F2JE=;
        b=O9yoBDycND5pfeG/niLmQPaqe+a6Y6pUmF1cCDESFKL+IMMVzRx90yvUwYp/+0S3ZX
         SeYDDAmRHkzlNr6JSrT+ZwK/zw1ltYS5f93tZ8LahehFdEziNYXpyIw86Ad17Dfl1Dj1
         zqE9/xeykei1qADCGSz5jeCtzWBC1g2qmdjsPlypYWWMxlrv2DTxDBr4owHeC+RkB/EX
         vQdlkcyq6L9A4cDzq1oHEQBfh49xWzvO6s0Slh/Q6EWtLe+2t4QkQbC+siCWE+aPrvlW
         U0f+pEa5/nNK1aZkhT0ND7r+ODUqmt0Y8IH6lvHBDP31HEYw6bp05eHn8IMEeOw3MpVE
         AKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182826; x=1795787626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=36PISSeuZF8VjgxufAYHZcqgrQ/dXVu9sOTMES5F2JE=;
        b=AnolIsSPMxebmDj2Uh+EsVV3+zEkvNFY2zqzVpm1UkYUoXzyrz0W8Qc+U/s8qsKigI
         0UGD15K1SSpgkSiTyGuYSEjf/VfUBHzIM5B0uKR56vMEH0h01JpOmhrSfGqpI3cvVFi+
         7MkHvjiUCvL/wcRRVrc8Ww+gE8tl5kmPHdORtARJYLXt/bSEHcfce3udbFC637POG0mU
         XtvcShi7mlelBLKbAOT5KEsr78YNNLWqWlYovs/rBbn0lBHWqwQxmN7MncdoChYIU/E5
         Pup9DD7JrbtvWeh/6aWHbUN/l0It5AzFh5IqAq/PDhxiYOb8qG1tkpqN6Ue/MTdw+eu8
         1X/Q==
X-Gm-Message-State: APuU4Z+gJc4W0F7yKESV1hYJavlk6NC9PQK6IAuADFb0+UeWzUUMVXp6
	gpterajQVYqjvaUu1Gl0Qqw5vVnFPQ10WoUEGQ4hFos4zWvbFdRa4jVNxkEqujyn
X-Gm-Gg: AYBFou22JSvJik7RZmVYRh5pfdVwHKpSI8bWloU2GFcL+KwPIX0sB51ekEGJ7xFNopL
	ykhDzEzZ9DNFBuX6awiO0MNyHCMkZxpvaVTz9J+O/5AGLQy3LVr/bKwCGd+/rwaFvxR88/zqGc0
	hQsUj8tdBqpDvD+ZIud04bentQkjfGXFIl+XWLx06ROS2b8qugtl5mixrRXeiGRnfbQsEVakQVd
	jkoJM2swDZp5HFtKlGhQydSKoasyzyepHJEmMlVp4IN71Pfmau8TV+IwO3xkUnHfdL+ZEk3N5t7
	DVGS2pnhg+CuCPjknE/rW6Ywvp8Bp1e+514CV7h2x2HTr1AaAdBXfiK9k2f2HQXEVNOzOhxfoHV
	GBK8C/W7b5WjRJR7aqZwhsC5fyF+s1j8mEHFQhvN8E2hyHjaPLv9SRIs/eNT5YGQs3CqWF9KJOx
	ojitQayaSOw/G8wEJFQpb25ogMlyrLqbL2WXZUgV2SyCOWyY08VcCvRGPKpH9KearOBOnRMV2Kx
	1H7k2DJuprpSi/hQc3v+OKFedmiVLCtmO5zp+qQFq7XiOupK/u8qlvsqMcHFOVKKJEUL1cXK///
	Sirt2F+5pQa3
X-Received: by 2002:a05:600c:1c0f:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4bb8881d4a3mr75203535e9.33.1795182825830;
        Fri, 20 Nov 2026 05:53:45 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:45 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 02/10] recipetool: create: Get the checksum of npm packages from the registry
Date: Fri, 20 Nov 2026 14:53:33 +0100
Message-ID: <20261120135342.2628228-3-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120135342.2628228-1-stondo@gmail.com>
References: <20261120135342.2628228-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250795
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Since bitbake 9e45e00a2 ("fetch/{npm,npmsw}: re-enable fetchers now
that checksums come from SRC_URI"), an npm:// URL needs a checksum.
recipetool create gets an npm:// URL without a checksum, so it fails
before the fetch:

  MissingParameterError: ... Missing checksum for npm package

The usual way, a fetch with BB_STRICT_CHECKSUM = "ignore", does not
work for npm on purpose. So get the checksum from the registry
("dist.integrity") before the fetch, and add it to the URL in the
recipe. For a new recipe, the registry is the only source of this
checksum.

Update the selftest for the checksum in SRC_URI.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py |  4 +++-
 scripts/lib/recipetool/create.py           | 22 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 0aaa090ff5..c6aa77399f 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -449,7 +449,9 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['HOMEPAGE'] = 'https://github.com/savoirfairelinux/node-server-example#readme'
         checkvars['LICENSE'] = 'BSD-3-Clause AND ISC AND MIT AND Unknown'
         urls = []
-        urls.append('npm://registry.npmjs.org/;package=@savoirfairelinux/node-server-example;version=${PV}')
+        urls.append('npm://registry.npmjs.org/;package=@savoirfairelinux/node-server-example;version=${PV}'
+                    ';sha512sum=f2dd7d88cb9a129fbb97eb87a8b5103bab24f783420fd7587f8000a355a12bf7'
+                    '83f1263230afc588123958b73e36bb241f63eaf08119aac5aa2a870bc4de9223')
         urls.append('npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json')
         checkvars['SRC_URI'] = set(urls)
         checkvars['S'] = '${WORKDIR}/npm'
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 662e7a6232..2df17dd6e4 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -413,6 +413,18 @@ def is_package(url):
         return True
     return False
 
+def get_npm_checksum(registry, package, version):
+    """Get the checksum of an npm package from the registry.
+
+    The npm fetcher needs a checksum before the download. When a new recipe
+    is created, the registry is the only source of this checksum.
+    """
+    import urllib.request
+    from bb.fetch.npm import npm_integrity
+    url = "https://%s/%s/%s" % (registry.strip("/"), package, version)
+    with urllib.request.urlopen(url, timeout=60) as response:
+        return npm_integrity(json.load(response)["dist"]["integrity"])
+
 def create_recipe(args):
     import bb.process
     import tempfile
@@ -523,6 +535,15 @@ def create_recipe(args):
         # Assume 'master' branch if not set
         if scheme in ['git', 'gitsm'] and 'branch' not in params and 'nobranch' not in params:
             params['branch'] = 'master'
+        npm_checksum = {}
+        if scheme == 'npm' and not any(p in params for p in bb.fetch.npm.CHECKSUM_PARMS):
+            try:
+                checksum_name, checksum = get_npm_checksum(network + path, params.get('package', ''), params.get('version', ''))
+            except Exception as e:
+                logger.error('Unable to get the checksum of %s from the registry: %s' % (srcuri, e))
+                sys.exit(1)
+            npm_checksum[checksum_name] = checksum
+            params.update(npm_checksum)
         fetchuri = bb.fetch.encodeurl((scheme, network, path, user, passwd, params))
 
         tmpparent = tinfoil.config_data.getVar('BASE_WORKDIR')
@@ -587,6 +608,7 @@ def create_recipe(args):
         # Since we might have a value in srcbranch, we need to
         # recontruct the srcuri to include 'branch' in params.
         scheme, network, path, user, passwd, params = bb.fetch.decodeurl(srcuri)
+        params.update(npm_checksum)
         if scheme in ['git', 'gitsm']:
             params['branch'] = srcbranch or 'master'
 
-- 
2.56.1

