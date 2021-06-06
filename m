Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.28875.1623018030379512477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 15:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PjDViiyC;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id u126so7695391pfu.13
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 15:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H7hMwPiqThvEjnKLdbTEP0w4InsXPFaKPwIQDfNlZKw=;
        b=PjDViiyCTzgxa9xAMVAsMRw/pqELtH10hURc9tvaviITwNbbpCoiPT7ZVd/K1tpQFT
         BZozwvRYKV3HLM9Tr6v16fpNqejIZu4ngPuUqYjAhcFy9jjuZkAKuMNvDJQM5N1Iulsa
         Kww04jTz8N1dPGrR1C55q943QNlrDufrvdBA/X363SFq0mzWDzBJz0qn4qzRHtwNCHPA
         EbqhWP+gijtR4tDvCNlxmFtPD0CuOgOGmEicRYQ8y+ykxY6s9cmOW2cKmU2da0CO2gnC
         XTrORfL1Je61LK7i7rPZQPyl+vntjZIoY/4k1OLe2fDyqyqr+m8bnMwrGnb1cLr5J1uv
         bNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H7hMwPiqThvEjnKLdbTEP0w4InsXPFaKPwIQDfNlZKw=;
        b=X3CMqzp8nBRjkHyp1hxqNNfHVK5Yh3XDF2OHJMoAGzoruv1SoE4j/0CTWSyan0tU2u
         cjT6qi/dYwyzZLSu21g8IX330l+1biSY4UgeSB2OPwYQP7TmjG5vIAmmkgytOUb+idvx
         jJPOsqeQc7mjvMsg1TCsEDCUAAmqReMwf0rHZGhsk+m1TCxJXL/hljbuXcKq9yCGrc6s
         6YDoc/7u0fFByeZjIoFIMIGrHugwhA0wHlgUoP3Hm1M7VkS8XiI45v5Mp4k5NX9cnQer
         0XeJ1H9V6mBU+hKAS/zEt8PeHFRR6XZxEhev1gKEcMPkMUc4nPASPYe45XmevRbiMosT
         yfsA==
X-Gm-Message-State: AOAM533Z0qXkWWZVN8DKnPB/H8Fgptoo3epmJm+X9LbfCw9kYMBPqaD3
	4ghaaA5olxLLchzluM0BzuQIDhJ83qCfUw==
X-Google-Smtp-Source: ABdhPJxvHLi1wiuq+zILm8bA8/fuEjUdPqfv6PT1N0hYwAayjJra10aFVeZefk9IDI0pEK+oR7pfvA==
X-Received: by 2002:a63:8c09:: with SMTP id m9mr9414912pgd.392.1623018029633;
        Sun, 06 Jun 2021 15:20:29 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:d783:82a8:8b1b:d4e0])
        by smtp.gmail.com with ESMTPSA id z6sm6818369pfr.99.2021.06.06.15.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 15:20:29 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 4/5] python3-importlib-metadata: upgrade 4.3.0 -> 4.5.0
Date: Sun,  6 Jun 2021 15:20:15 -0700
Message-Id: <66698cab05c726e44f633e17692078c55da1683d.1623016777.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1623016777.git.timothy.t.orling@intel.com>
References: <cover.1623016777.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream release notes:

v4.5.0
Issue 319: Remove SelectableGroups deprecation exception for flake8.

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
 ...ib-metadata_4.3.0.bb => python3-importlib-metadata_4.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.3.0.bb => python3-importlib-metadata_4.5.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
index f4ac3c44ec0..7c156787a03 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "c4646abbce80191bb548636f846e353ff1edc46a06bc536ea0a60d53211dc690"
+SRC_URI[sha256sum] = "b142cc1dd1342f31ff04bb7d022492b09920cb64fed867cd3ea6f80fe3ebd139"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.29.2

