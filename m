Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.1037.1607474160536930130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 16:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vB88KpYs;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e2so37827pgi.5
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 16:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sGiVKhC0tmQPeCNF8TgtvtGZctT7peT1mRDL3CN9D6o=;
        b=vB88KpYs90inZdZVpwCdnSNVDHASDflQfcfWZLW71eoAO3RREuGstmZ2tzRvyLzdjm
         1reglBjvdySINuVRIEk5eWaCeY9fPYI75v3nFakAXO2Jh3xiir2/76nlZUCyf2CtpL0r
         DJrn8fawVu2eRBXmGtoCAj3sDH7ELCz4Y8pVSwiDtay3SpBzxCD0mC70TxH9rxfRfxLY
         qn3wkOuzJDk8/ZaWuHZPyDNQyu9twwiJBrwCinFpqsvYgpkx/ZXtrZu0Q+Uow5Tlujkk
         qIGNvZidT5/QSKDqdQlKa7y+bggD4uMlhQPreGqvqUm9ow6B8oeFVaVc0CxOcVHC399g
         fk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sGiVKhC0tmQPeCNF8TgtvtGZctT7peT1mRDL3CN9D6o=;
        b=Zh4AavQVApg+eVHXGbLLtaZ2L+KJIlqzJdtG3DxFA+NSXDdonKRu8xZOlwtM9XgLsT
         anBcNVjXiKN8e3ibVGeqLL1OM1eWEvEUhIS2EZzrfgCf71zxCzibY/FSfHRHH14k3Ixx
         DrJvCyC0A6C02XP2R4LYbQKjJFSHuzbTvpvPnoqQXeNYRsESPXYHvkWt8bNM4U9BVgh/
         tr4SVurIVMuum76uFahZFzzPshSSzFSSk7rTXcrMxQ4RDi34C+7btwTXKDMYR0A46S0n
         FGx3DWA6bcYk94uCTIGDqIMveOANJ3m3M2BTpTOL02JlJdFp7H/PEUqiBW1ZvbdqgmW+
         dFSQ==
X-Gm-Message-State: AOAM533X+zJTn9nuW48I4hRswPpZ6JAGZTHDCtYdc+KI4+kHL2aXw53h
	UlfEfrptj8yUI+NFXLe1pusB0ldhrjZDRw==
X-Google-Smtp-Source: ABdhPJzqU4Sx/p/Oh1stziC4VpWVnzA5Gt5ysIUz4vOU14hlg23JfPqi4U02cYOHmBmYQHrUq6HDOw==
X-Received: by 2002:a62:528c:0:b029:19e:4a39:d9ea with SMTP id g134-20020a62528c0000b029019e4a39d9eamr42672pfb.20.1607474159853;
        Tue, 08 Dec 2020 16:35:59 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:183:c5f6:e3c0:185c])
        by smtp.gmail.com with ESMTPSA id v1sm58181pjs.16.2020.12.08.16.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 16:35:59 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 2/5] python3-importlib-metadata: upgrade 3.1.0 -> 3.1.1
Date: Tue,  8 Dec 2020 16:35:44 -0800
Message-Id: <3ed25611065ac11429a225d650ba9a3a4856d258.1607473952.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
References: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

No upstream release notes.

Commits since 3.1.0 tag:
155bc48 (HEAD, tag: v3.1.1) Merge branch 'maint/2.x'
83c7dd2 (tag: v2.1.1, origin/maint/2.x) Merge pull request #264 from
  python/bugfix/261-versionless-egg-info-pre-normalized-fallback
4cb3bd0 Update changelog. Ref #261.
6036a37 Avoid relying on new-style normalization for legacy eggs.
4098b51 Perform exact match on Prepared.normalized, and then add a
  separate check for an empty self.normalized instead of relying on a
  degenerate result from startswith.
7bdbb57 Add test to ensure that a prefix isn't matched
595eb5f Compare the name against self.normalized. Fixes #261 but also
  will cause 'lib' to match 'lib_foo'.
fea6e75 Move is_egg into prepared.
313535a Extract method for matching a name in a prepared search.
4335def Add test capturing expectation where versionless metadata exists
  but hasn't been updated to the new normalization technique. Ref #261.
9aee90b Fix syntax in changelog
55e64a4 Merge pull request #258 from python/feature/skeleton
8721a05 Merge branch 'master' into feature/skeleton
ed672ee Consolidate coverage files
eabd24d Restore diffcov
b29baea Correct syntax for invoking pytest
d5a5c90 Bring back perf
67cb123 Run tests to exercise coverage

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...-metadata_3.1.0.bb => python3-importlib-metadata_3.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_3.1.0.bb => python3-importlib-metadata_3.1.1.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_3.1.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_3.1.1.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-importlib-metadata_3.1.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_3.1.1.bb
index d89621bedd6..56b57cc32a5 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_3.1.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
 
 inherit pypi setuptools3
 
-SRC_URI = "https://files.pythonhosted.org/packages/7d/d4/dbc58eed92be61bae65a7d80a7604d35bf6ded3e3c53c14f2d45b4a28831/importlib_metadata-3.1.0.tar.gz"
-SRC_URI[sha256sum] = "d9b8a46a0885337627a6430db287176970fff18ad421becec1d64cfc763c2099"
+SRC_URI = "https://files.pythonhosted.org/packages/3f/a8/16dc098b0addd1c20719c18a86e985be851b3ec1e103e703297169bb22cc/importlib_metadata-3.1.1.tar.gz"
+SRC_URI[sha256sum] = "b0c2d3b226157ae4517d9625decf63591461c66b3a808c2666d538946519d170"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.0

