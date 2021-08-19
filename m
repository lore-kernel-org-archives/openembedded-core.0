Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.65454.1629350315057072857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 22:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CuHDf/si;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id bo18so4243408pjb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 22:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IUfEJ+URtPIRcwTyCI9cUw039mh+dN369ndEa6q2QdI=;
        b=CuHDf/sir959+DELUVz1KTto6mceFUvSSjv1LJgIxqc8za+dck1ZpTIn1D2NnQuRCI
         ew6diZt7IR1PApHwRbFuvaMcwC7tGmLdwX/kNUMKAxtg57MU3RZDctZw7movsDU3lK0B
         ygnCl3SYeDMXHYvhFH6LxUWm4hBKsZOaO/nI2iPUo9YhIUPlfCa3XTHqwwkL5PCPylOn
         b7JHOCBsVA1j4BDhzZ/Y3nuGJ9exxqeTHUwIdJIrsaM6N4MJdwZVARPGh99qOz+DlzvG
         LOun5wQnC30ObgcN7me/suY3fVGIY2SnCjBecai4Jvj2XtnfWqDdXEILWL98YCHn8DjS
         H5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IUfEJ+URtPIRcwTyCI9cUw039mh+dN369ndEa6q2QdI=;
        b=NYwKrMjL57zAtJVcqesPjMYJgTXP0b/sk+47P74wYkXTSQHbmZIhF9aOeWB/TYEGao
         dt+zAY8hGLtNeXcY70h/RYWws+zozRur1ud+AEhD6F/VE/m5ByEPjztSdWX3WAzA/je2
         CYP5prY1KWT0GPRsXnOXzJH7XRZCQ1rB/06ZBql0OOiK8rW9BSyygbLpx1sy29wOJXnz
         9JIHNcTuZxp1Ts4rgoEL1koOMhJOG0D7jJ7LRlA+tcSf1A9NrUy4DKY84gPP2fe3ZC+2
         qQfg3EpAXDpn169BpiL5vuLlbIGA5dehLamtu1L+5GRGIUMczDZTFbHi86lWIVyDhZC9
         yPGQ==
X-Gm-Message-State: AOAM532cOSExlf89o/P4qaqALJOt8kQmnfa9vjYTlwbSQKZBL7N86Cpd
	nLlS+K/mJD9EFCDAlVavUFK9UHoCuBI=
X-Google-Smtp-Source: ABdhPJyXJoHvG4D3iAQ49RCON1J3fCFEwEyZLA0M1q951uUviEv8hQLXUnUyrsS4H2J0Dh2twjZvJg==
X-Received: by 2002:a17:902:ac97:b029:12d:4ce1:ce4d with SMTP id h23-20020a170902ac97b029012d4ce1ce4dmr10329649plr.74.1629350314438;
        Wed, 18 Aug 2021 22:18:34 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:8209:a97b:7f2d:5bd9])
        by smtp.gmail.com with ESMTPSA id b6sm1700969pgs.94.2021.08.18.22.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 22:18:34 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 2/2] python3-hypothesis: upgrade 6.14.5 -> 6.14.8
Date: Wed, 18 Aug 2021 22:18:25 -0700
Message-Id: <20210819051825.3577665-2-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819051825.3577665-1-timothy.t.orling@intel.com>
References: <20210819051825.3577665-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

6.14.8 - 2021-08-16
This patch ensures that registering a strategy for a subclass of a
parametrised generic type such as class Lines(Sequence[str]): will not
“leak” into unrelated strategies such as st.from_type(Sequence[int])
(issue #2951). Unfortunately this fix requires PEP 560, meaning Python
3.7 or later.

6.14.7 - 2021-08-14
This patch fixes issue #3050, where attrs classes could cause an internal
error in the ghostwriter.

6.14.6 - 2021-08-07
This patch improves the error message for issue #3016, where PEP 585 builtin
generics with self-referential forward-reference strings cannot be resolved
to a strategy by from_type().

References:
https://github.com/HypothesisWorks/hypothesis/issues/2951
https://www.python.org/dev/peps/pep-0560
https://github.com/HypothesisWorks/hypothesis/issues/3050
https://www.python.org/dev/peps/pep-0585

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ython3-hypothesis_6.14.5.bb => python3-hypothesis_6.14.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.14.5.bb => python3-hypothesis_6.14.8.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.14.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.14.8.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hypothesis_6.14.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.14.8.bb
index 0460a43198..bc29b94a54 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.14.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.14.8.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "0563b9711fd9bf478cb591580a575c369d2c396f283efa85d0f9a75b26db65b5"
+SRC_URI[sha256sum] = "cb80e06ca44992b08d2889734b740e67c8b41337315bbd6dba2ef43ca816cfe3"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2

