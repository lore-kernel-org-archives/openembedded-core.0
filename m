Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.16248.1594908783170304990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 07:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BeTw5G+J;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id a12so6113340ion.13
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jRuUr4ZUz0fqk7RK0IaXoBPmn+ZJmw1wyJJDYfYoPdo=;
        b=BeTw5G+JZLdnNh99IKVzycBMQjbV5qcSdEJJAeOAJCzDAs0Ta+oCv09zFctRYmq9Py
         1fJENFljCaHtxZenpQrsUpOTQkqbX+zM6PCUiCLHboFIhE/W2wGGC9Oq7kNkyyG2Ptt7
         EXd2fBq0JCQLX2te1+gapRGXVEayxH0RoAXhRfclxOc5r+iwTNB9OW8dF6v8Hmu0uWlK
         ahQ31Ut+7eR8E6tJ5WaCMvO7c7lzjxjt50hfGWBjNzkSt/O0azOBD2WGd5UO3hyvLmws
         egTKJssF/1/xNnQveIYOPCcvrECKp5YtahBSNY/eiyDW5U96yv7OBQ+JAy1OiaZBiIx6
         KaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jRuUr4ZUz0fqk7RK0IaXoBPmn+ZJmw1wyJJDYfYoPdo=;
        b=FA30xF7AcYjO1FwFKwpIMWshdhab7BLnRT39VTiTnIQQ745EiP66jK3V/vSk7GwT2F
         ndte03eQWsudDdEsoVItLIToFjPmIaGIMUZkxgAG7RYAd0wKk3NWMzuXKCbyF89GiNV7
         XHOe6hhfCqogYlLNZQE96kHASKTFNvyLj9OqhnkwaobufhogUAObkijJB+lqxsQi2Bpp
         woFqioBfwmKjr8h/Moc+QM5c2fKEvY+kjPwvGEHbch8X1NoaBuLwj+lWa2Y+oFnrtPVf
         /xJGbGszKQzFmu95m/2XcfUuKGFPm6DhmkLiwZoYMK320R74m3tk7gZMxn1ipU0S6H4R
         02Jw==
X-Gm-Message-State: AOAM531B/bE/ICpT5j6hHrq7UYBnYS3wOsIPcEop3WMflYXnwrzYr8GZ
	XSprutBAgrnkQhY5dpFE26+MoeBsxKI=
X-Google-Smtp-Source: ABdhPJxMoxB2EQGQ4FzZxAWfHzAXrGZFIW/nPfux+XG8rEmEkOb87f37WBCyPHS3rhtpB5AKXujXOQ==
X-Received: by 2002:a6b:db17:: with SMTP id t23mr4665336ioc.4.1594908782303;
        Thu, 16 Jul 2020 07:13:02 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:8425:3b41:f78d:f429])
        by smtp.gmail.com with ESMTPSA id y8sm2725445ilq.21.2020.07.16.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:13:01 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] python3-pycryptodomex: upgrade 3.9.7 -> 3.9.8
Date: Thu, 16 Jul 2020 09:12:59 -0500
Message-Id: <20200716141259.27709-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...n3-pycryptodomex_3.9.7.bb => python3-pycryptodomex_3.9.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.9.7.bb => python3-pycryptodomex_3.9.8.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.9.8.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.9.8.bb
index abb03b9909..035c7fa636 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.9.8.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "50163324834edd0c9ce3e4512ded3e221c969086e10fdd5d3fdcaadac5e24a78"
+SRC_URI[sha256sum] = "48cc2cfc251f04a6142badeb666d1ff49ca6fdfc303fd72579f62b768aaa52b9"
 
 FILES_${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.27.0

