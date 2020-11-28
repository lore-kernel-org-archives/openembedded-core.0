Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web08.36673.1606592392728831540
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mNdKTgdO;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id y7so7352209pfq.11
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 11:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eULjkAVKX5fYW3spfaG0ybQ2hl078d2I6xqv4JA7oZk=;
        b=mNdKTgdO7QEOXsRrA3KfgOtmzV9hU/FxeuD5VwiU8JIyGSUnlxd1k3kd/Ip5nisaxF
         4d2PGu55s5VgVw6DeL35UYsLk1T/++rRZLNXekuJl2mbQrLkmsa/zr51aI+WR3k6/pUL
         PbQqiM0SSIeEU/+mw6QFp946JGXg7gcE77xYi6ai0CL6rJlR0bKp453Aa0YjZ+mW4qt5
         cEBvnffcKHLMqLW3wlrX7m4ezzCs2xYDVsceHRmf55EGHu0IS/8ttlwtPQq0OO5I3uPs
         45ooowODiBNwsYGe8HlKxrachzBNEQyf7XO2vTD9MFoV2/ULE7vkyPaH4eskFcxwaaIU
         V8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eULjkAVKX5fYW3spfaG0ybQ2hl078d2I6xqv4JA7oZk=;
        b=NIenqlAUPzBgEI/vv46bfYbCwG3b4Q8HHmbB3iZq6zuxC3jz6IGgUYrOU1CL+IG6mH
         yawwB5hI8WXX79JdWigNsHCXNOnSnudj2KUMTjm0VIFpasaQTTSU7jYVa22i+88gy2ES
         TA0zlx5zTg+GR3N/JrRObeQVEu/GPGpRw2eIEvF3OulQq9ZSDMA8YA+1Ssgft77Pq/mt
         a1kPlDrX3PnB+XtCnHO/QCNcMniiQwSVhrrP/7WW/pTsN2fPtiu80Va/AjmbTJnNA6tp
         05qfREARdMZngu7b9wOXSuV9UI9IhiIKGUZ28bFXkEVwDmTBrIBpT2vfjdjimfp9agMa
         P9cA==
X-Gm-Message-State: AOAM530K8UoVp/Td0HqyatOa1KB7FPsrlkqWKtOFmCJWR2CCBJ4oN4pq
	5rP1F0lH81rwHjeThxFsGeQ+61ZZZaYvrg==
X-Google-Smtp-Source: ABdhPJxXybIjKtKdIMWz91yTNoQhxVFQL0XM7VjoIZQ5td5AciMeyxHclJrT9PD0G+piGy6km2e5uQ==
X-Received: by 2002:a63:2060:: with SMTP id r32mr11519022pgm.129.1606592391934;
        Sat, 28 Nov 2020 11:39:51 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id z29sm2629795pgk.88.2020.11.28.11.39.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:39:51 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] python3-sortedcontainers: move from meta-python
Date: Sat, 28 Nov 2020 11:39:35 -0800
Message-Id: <759d12061c9a7412e3c6a0cbb738706d4e5d549b.1606584666.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606584666.git.timothy.t.orling@linux.intel.com>
References: <cover.1606584666.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Sorted Containers is an Apache2 licensed sorted collections library,
written in pure-Python, and fast as C-extensions.

* Part of the dependency chain for python3-numpy ptest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../python/python3-sortedcontainers_2.3.0.bb             | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb

diff --git a/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
new file mode 100644
index 00000000000..6060c03723a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions."
+HOMEPAGE = "http://www.grantjenks.com/docs/sortedcontainers/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae"
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = "59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

