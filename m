Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.28893.1623018026373887951
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 15:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tS2i9k2l;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id t9so12381459pgn.4
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 15:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5W/6eYLyJXEmSrnEEbUzlkTauCh98NF4UN40tAzAY90=;
        b=tS2i9k2lryIT39z6BeAEEtAZERICLum0AMX7izQPxyJiImgMGhDjKOStPFawOrfBL6
         nv0ZICMf02PkXmBuQ3Ud7XxEoxhytxXB4yiTPqgoIcbeMahPHrDm5GZHV2H57UgyfZaa
         JIarOCeGIMIB2Vt6UjijQ9JgZYCAHxgQjfgDJ6NIAaIrcjhpOL5C2mGLdCZcDeSbUjKG
         hOTgTCmXHVEK6mo+6rY84H0kkEXL7bHNvTDDkyKYN3DJnznZzjn2nIJvn+i7Re4ycWnK
         fS/4OfT4MB0Mh8XXnr6Vr3CY8DCqwSWgXnXNOFjQl7ZPm7gg5UYVl11NYQtcFnChd79M
         I9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5W/6eYLyJXEmSrnEEbUzlkTauCh98NF4UN40tAzAY90=;
        b=iMtaKF6FJquMbWJQEBvOpxlmFwKSF1Mhkyb4CJeuzlr8973W1NkydbeZf3u9sw1uli
         ZqHCOYodIsCteF3ZDOneKW0NrYxOqTtjGkPqLDMmda+bmSt0HgzmLUeHVSFCCAwBARyM
         ZF6s1LQP1i8rCNeIf8T68KHXeAZ5wCZvjRIfNbH2Z7ayJMqGWM4Bleqq7nHeZyXMFvA+
         7EBLijX76q8V4Ktm+ohqKiffzVh2KPymnMcidyQUDFImiJbbbP9L2uIWksRpSdaUBYZg
         TGthRcFJmny7XO6aH8AP5xz6DM56dYpQFtyLHL40Skcma8YaYCZZrsdtCNsWDquatI2N
         SUkA==
X-Gm-Message-State: AOAM533F8jDJJJ/wa2aRDe6sW+hRaeHmc1DGpD8BLZu3wGJuYNyNbmBG
	2EbEAwtF7798kitf5N4XfCX1D/7e5NcyuQ==
X-Google-Smtp-Source: ABdhPJxXYignQDTzObWbiLSKFFQ3MHf6keJeiQYVAOE//NYOaoMkKQ8WJ1d6EeRV5vqiqLjMsFZLBw==
X-Received: by 2002:a05:6a00:124d:b029:2e9:e07c:f290 with SMTP id u13-20020a056a00124db02902e9e07cf290mr14546554pfi.25.1623018025632;
        Sun, 06 Jun 2021 15:20:25 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:d783:82a8:8b1b:d4e0])
        by smtp.gmail.com with ESMTPSA id z6sm6818369pfr.99.2021.06.06.15.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 15:20:25 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 3/5] python3-hypothesis: upgrade 6.13.7 -> 6.13.14
Date: Sun,  6 Jun 2021 15:20:14 -0700
Message-Id: <63f463840419b88d25e87c6256f3b47e93813f49.1623016777.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1623016777.git.timothy.t.orling@intel.com>
References: <cover.1623016777.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RDEPENDS on python3-unittest

Upstream release notes:

6.13.14
  This patch improves the :func:`~hypothesis.strategies.tuples` strategy
  type annotations, to preserve the element types for up to length-five
  tuples (:issue:`3005`).

  As for :func:`~hypothesis.strategies.one_of`, this is the best we can do
  before a `planned extension <https://mail.python.org/archives/list/typing-sigpython.org/thread/LOQFV3IIWGFDB7F5BDX746EZJG4VVBI3/>`__
  to :pep:`646` is released, hopefully in Python 3.11.

6.13.13
  This patch teaches :doc:`the Ghostwriter <ghostwriter>` how to find
  :np-ref:`custom ufuncs <ufuncs.html>` from *any* module that defines them,
  and that ``yaml.unsafe_load()`` does not undo ``yaml.safe_load()``.

6.13.12
  This patch reduces the amount of internal code excluded from our test suite's
  code coverage checks.

  There is no user-visible change.

6.13.11
  This patch removes some old internal helper code that previously existed
  to make Python 2 compatibility easier.

  There is no user-visible change.

6.13.10
  This release adjusts some internal code to help make our test suite more
  reliable.

  There is no user-visible change.

6.13.9
  This patch cleans up some internal code related to filtering strategies.

  There is no user-visible change.

6.13.8
  This patch slightly improves the performance of some internal code for
  generating integers.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...on3-hypothesis_6.13.7.bb => python3-hypothesis_6.13.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.13.7.bb => python3-hypothesis_6.13.14.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
index 7688ff6d18c..150dc8a5d6b 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.13.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
@@ -7,8 +7,8 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "262bb8cee0293ad06c453e78cf89bddcb613b91f82ea5587f3787611ee62861b"
+SRC_URI[sha256sum] = "36ef2d58f600be2973f694f45a55a5502de705d7594f9cf841276aec9082c414"
 
-RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
+RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers python3-unittest"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

