Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.17503.1590940426931310129
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hf8qyIUx;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id m21so5383553eds.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QHjhXkDu0O281Iee3HzwNDct3eWkdTsPGpIal/42/+I=;
        b=hf8qyIUxWO7ZlKjF+0SldlI+ITztSYkYc8QWpoEhfjWYAbXclnLfnByJcrbPFCjtdH
         INtAf9YiZgBax57Mzlm/Eu+2v7UfVmpBxDFhMr5XC6sdkAs1EqPbO2eBpeKy/oDqt6wu
         NygbzpHyKYWC4KdYJYV6sepzisnU6T240x8Vhaegzf7oSoZDmpgx7H+Qu6A22IO26e4Y
         960GmWQW4sOweUU8LjpfqUiQzvWP5MJQRJd6Txk5QY5rtRNzh3JV/DAvy89DdVe8Zbdf
         WAJ9KpeblBGopx3x4JAf17V/AqMLBj1fbKaGgxTyFR508n3SZ/nLW5ToAOkKIfOQKWyi
         hLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QHjhXkDu0O281Iee3HzwNDct3eWkdTsPGpIal/42/+I=;
        b=t431SQP5FKg3RIW8C4+TDJWYojJceGz8ayZNs53VfdCORbHr3k0LP9qjigaesvlvz9
         3Q5U8MHC620ne2Rdw/dfu84XKyQsW7QKlJtj6DiFNN8KkSATRjWESY1yaJsx/qF8iuYv
         hOndlsG8KS3DsDH/SDViZqqrdnMCDaVc83bP8tt6z/EuXEEsSMnRsQYzMPOQgYaAq3dz
         gI4Yig14abMq6tVYAy95ep3af0ev+i5Op18TelK0rGvguLPG9rjATCX/XsI1ZZhPuh6N
         wAS/mtjmt0R8c0FNkwoTVQwy1lLvu+NQlS1PbvqrdwgzhaIwYvAfrriZ+6pxRskSD6ZZ
         i5rw==
X-Gm-Message-State: AOAM531sX8lWaUSaV6+5D5dt4UNEKidvokU3QsPdHEe5kVUWkyLvNg8i
	0FwCy+rnDXc1hsmP3j6ubo+9Vwj4
X-Google-Smtp-Source: ABdhPJz2wqloF7MFe+pmtHB3UpkwZ2oMe6u7wnyqvYBwyQLAMfA9B1rdrOk4lnfb0cLhdRT2CaN+Xg==
X-Received: by 2002:a50:8d5e:: with SMTP id t30mr17235585edt.332.1590940425307;
        Sun, 31 May 2020 08:53:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/70] libsolv: upgrade 0.7.10 -> 0.7.14
Date: Sun, 31 May 2020 17:52:05 +0200
Message-Id: <20200531155254.10283-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsolv/{libsolv_0.7.10.bb => libsolv_0.7.14.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.10.bb => libsolv_0.7.14.bb} (84%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb b/meta/recipes-extended/libsolv/libsolv_0.7.14.bb
similarity index 84%
rename from meta/recipes-extended/libsolv/libsolv_0.7.10.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.14.bb
index 265a27c00d..5179d4565a 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.14.bb
@@ -10,7 +10,7 @@ DEPENDS = "expat zlib"
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
 "
 
-SRCREV = "605dd2645ef899e2b7c95709476fb51e28d7e378"
+SRCREV = "b264537ea43ce39d93d8d97fcca16e97825beaa0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_RPMDB_BDB=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON"
 
-- 
2.26.2

