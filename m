Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.24511.1623633495089784675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 18:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a7sfTho0;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id y11so7335125pgp.11
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 18:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QL0c0eyyIto6diq/jqjdYwuDITVmFjl/4eGcA9Y8lQk=;
        b=a7sfTho0IdHn/IYB6ea4cydVTtNKkBRQQeprC1jNamKERvbisGMZqX7rYmWXlLp7Kh
         jzWDUzLl52sCjiDVwPkxeuqeZO+g1oEGpDUJhu3l2t3FVZvWvuVG2d8EJ+UnTpVv60CK
         njyvjqMGTWgBbASTYjPOfg3jnfc+onB/APdarekfL6/GYOpYeN1wDlTyzjJc/BSBZH2+
         jU+SQd3BbKquTnw9WysMtoAbIU79C6iXDFjgpwa7RCuRIklORWNbrpDK17enV02VM1n/
         uOHykdHeqQ2flr27RikZj+D/AyrDvMZXO4yT0qTiK50BpO9PBchmJU2AHZqyqUeu7Ccb
         gT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QL0c0eyyIto6diq/jqjdYwuDITVmFjl/4eGcA9Y8lQk=;
        b=oSmFdJOyjyngTmXVwuLyP2NzmbOSXF79EoRyLgW+J1aUp2AFdlMS3HC0ZAHckpkbhx
         FKLHtZo9DONfrd3T0iDG7182e2JHZot+pnWICC7WWcanGrZM7jWWiQOpzfgZm0bP4gZT
         fHiPj9XF5f219uHzOh+NUUOHNyqo8kICpdA71kBM6lb3JPwvr2OzV6uIxPO8yWMcXcDT
         fm09MwKJhyVs9VPKi+/kx9/vjI8xeS/GdRqUHswz1SJxUcctto8t7hK5RlXT8rC+3Cm6
         jC5GRt/2C7xBPsoBZJjskj4W4f/gv/aWHjyn3BkUDokgyYMdZJK/NXd2GemYJorXNoOX
         Uu2A==
X-Gm-Message-State: AOAM533q3rfr5QwWJDDP1j/3VZYAoWfxeDyWN/PFio4ygImk01mdshHe
	+DRXNG+zV0YCM36Jfnahhad+NwvtuLp05g==
X-Google-Smtp-Source: ABdhPJwA8HVvRUQQCjVdGTSTrQg8kO3j/hbEiFE5rnH1cZJOIlwrTIQgM7qsSi4ZfdVdM1/hc44BUQ==
X-Received: by 2002:a63:dc03:: with SMTP id s3mr14736179pgg.354.1623633494417;
        Sun, 13 Jun 2021 18:18:14 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:fceb:f044:c379:f400])
        by smtp.gmail.com with ESMTPSA id cq24sm15909706pjb.18.2021.06.13.18.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 18:18:14 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 1/2] python3-manifest: add statistics subpackage
Date: Sun, 13 Jun 2021 18:18:06 -0700
Message-Id: <e716149e64b94c23b40d63095754c64cfe02a17a.1623633335.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1623633335.git.timothy.t.orling@intel.com>
References: <cover.1623633335.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpython/Lib/statistics.py contains common statistics functions

"""
Basic statistics module.
This module provides functions for calculating statistics of data, including
averages, variance, and standard deviation.
"""

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../python/python3/python3-manifest.json          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 615dc3a5e5d..d65cf49cb8c 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -814,6 +814,7 @@
             "shell",
             "smtpd",
             "sqlite3",
+	    "statistics",
             "stringold",
             "syslog",
             "terminal",
@@ -1085,6 +1086,20 @@
         ],
         "cached": []
     },
+    "statistics": {
+	"summary": "Basic statistics module",
+	"rdepends": [
+	    "core",
+	    "math",
+	    "numbers"
+	],
+	"files": [
+	    "${libdir}/python${PYTHON_MAJMIN}/statistics.py"
+	],
+	"cached": [
+	    "${libdir}/python${PYTHON_MAJMIN}/__pycache__/statistics.*.pyc"
+	]
+    },
     "stringold": {
         "summary": "Python string APIs [deprecated]",
         "rdepends": [
-- 
2.29.2

