Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.29373.1623019798997467377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 15:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VFuqOsCQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id y15so11699284pfl.4
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 15:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJpNALhjl6V/EOknUJz4bptdBpJMdiAU0mRnDTg+peo=;
        b=VFuqOsCQK8/eGY4ThRfrK1m671a0JDP76+d2IsznQub/LMqesin9HPoQPPQd6C/SPZ
         PpQj5Rrh6W55V1RsIGaQfds3aOWxWjTRrJ/EwmG6LHoPac7o2rtnF1HxapBdeaC6cYMn
         Z3KFKWc/axPzbQanGU0VH6e+jvO7Ky6ZV8FhOTXYRN6gRN1d5xmNl88QiXvsVyKrmKrB
         H/tEMkFqX0Toy/LxbKJzlYZ4CmjCI9eT4kKhwAqUJ7wCmiNJlCHirznGgnprRDXeRRZA
         z8+RMeoRwvfV9J67Qat4464B0S5iJeGAGb9T4YlDBUOBJfCIOe/SEuEZmjErTW0PqB+A
         sogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XJpNALhjl6V/EOknUJz4bptdBpJMdiAU0mRnDTg+peo=;
        b=MPHrJQzqPIom77/2IMqIrLs1kBxxtlnDHUBQIjnUTn9aSYAvXOMsDw9HIXNpWmmvi+
         IzJVR5xLiNWWbu4oqcaHJ36+SHtwPLfP+o7Ctp31s+3JxQJ4PfCXGkGjLhi5AZQRQ1s/
         txIwmxWOGlDNRjYofdfYRXIoeBwxk8gI0bCtJVRR575KOss98NB10JocidNaYYaPDW0V
         C2uvbNjPd+CJyaxL3EzGUB42c2Rf46OQo9ejonuigH0YD2HHTPL1qsiLT9szQShRPY1Q
         mqkEwkD0hpLytW6Df5sO4UmEAslLS8QyacJs4NGOZwo/QMusxwRxJdwe5g/aPSWlTTfY
         PejQ==
X-Gm-Message-State: AOAM533xlVv7yv2M9XayHvIyWuGqLM/fXISdWFQlR+VKe7cNG0Jd+g2k
	SKKqUiM/BGyWjOqZHHyg5hw/AMyZO/UdEg==
X-Google-Smtp-Source: ABdhPJzrcEu8zYWL9tA3RJtBYfUQp7jZzdWuaXVvAExGryI3qqFg5wFOi+47Pr0eEUtD4cQ1AQHY/w==
X-Received: by 2002:a63:ee10:: with SMTP id e16mr15276629pgi.135.1623019798226;
        Sun, 06 Jun 2021 15:49:58 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:d783:82a8:8b1b:d4e0])
        by smtp.gmail.com with ESMTPSA id h18sm6978886pgl.87.2021.06.06.15.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 15:49:57 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH v2 4/5] python3-importlib-metadata: upgrade 4.4.0 -> 4.5.0
Date: Sun,  6 Jun 2021 15:49:44 -0700
Message-Id: <20210606224944.3485-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream release notes:

v4.5.0
Issue 319: Remove SelectableGroups deprecation exception for flake8.

Previous upgrade release notes:

v4.4.0
Issue 300: Restore compatibility in the result from Distribution.entry_points
(EntryPoints) to honor expectations in older implementations and issuing
deprecation warnings for these cases: EntryPoints objects are once again
mutable, allowing for sort() and other list-based mutation operations. Avoid
deprecation warnings by casting to a mutable sequence (e.g.
list(dist.entry_points).sort()). EntryPoints results once again allow for
access by index. To avoid deprecation warnings, cast the result to a Sequence
first (e.g. tuple(dist.entry_points)[0]).

v4.3.1
Issue 320: Fix issue where normalized name for eggs was incorrectly solicited,
leading to metadata being unavailable for eggs.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ib-metadata_4.4.0.bb => python3-importlib-metadata_4.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.4.0.bb => python3-importlib-metadata_4.5.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.4.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.4.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
index 9d22f97a6b0..7c156787a03 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "e592faad8de1bda9fe920cf41e15261e7131bcf266c30306eec00e8e225c1dd5"
+SRC_URI[sha256sum] = "b142cc1dd1342f31ff04bb7d022492b09920cb64fed867cd3ea6f80fe3ebd139"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.29.2

