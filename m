Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.2492.1625035336417341449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 23:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tOPCMNE0;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id s14so1567293pfg.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 23:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=294Y05eKOl/lpxhHrW/b9kDSa/5TZk7RcKMESXx05oU=;
        b=tOPCMNE0xX/cgiEG802C0GOu+oMOxtTlA61YYakIYN/7Ff0sAX7qKdRh7Z6RtfoEMR
         RkAAk3dm6DJMFyKJryhGMstQR8GZAkgSJxXrcoswkCmXvyUccnpLHrXVf1Jm7trBSYGT
         CYycOjq86JFEGtRB+e1mkob0bLLu0hNJ85OLiru85grNZzuvxWChbvguY78OAAhUo0ZB
         DFuzQ8gJItWD9fcOZy8zWsenv9WEnIE0trRecpwMEHLxM4VoIme1sHF0kQ15fo4o06qQ
         Vj7NqvoAZlwjkJZqEfef9Xcr/JfnvfUfhaNQDG9Ljio6BM4UZNd5/BIqCLWNLbhODGS9
         ts0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=294Y05eKOl/lpxhHrW/b9kDSa/5TZk7RcKMESXx05oU=;
        b=IDccViNEjNA40fKGiMaupcfE1J5qvyGMDCYZv0Vw57HF/FtmLFEr6gIH8+el2o5h8+
         IVnBZEEpb+bfIImSF2epI2TEaCCrDCsbHFCyz+Jq6VheyYyoh6ZIfMyc6+d2gtGT5E4A
         q0YHgJqfVSuJ9YDcfKgAdgJ1SZ7D3FcIkIFJqJjS2xr7U23Til8CENcrNRQ2nI/EeqFI
         efjyLeHqhy8W3BweFlo+OP01XXan+VCOpo/e6RVXCT3DPlYUnofjyTwh+woGzXdJ3kli
         5u92ZzmQrBsjNwjU63SwQqFpPoItp46oPp6AsNuYHUAgntNrhfp5eQrQHSXD1AmmKvN3
         AUig==
X-Gm-Message-State: AOAM5309d9OPXjg/rqBstIS4V9h11x8ye/eoZ8wtbYvOtdCPDL49ft3L
	NoxTix/67SvRh3SY9S5z+g0teHkik1xc1w==
X-Google-Smtp-Source: ABdhPJz9FCaATK/48n6fxRh0XerqfHgsGKqF0iCJiKtEr370vI8rsBfGmTw557lKLQ3ZryDUGBhwkw==
X-Received: by 2002:a65:568c:: with SMTP id v12mr32973695pgs.88.1625035335611;
        Tue, 29 Jun 2021 23:42:15 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:6643:31d:878c:751d])
        by smtp.gmail.com with ESMTPSA id y206sm19507636pfb.3.2021.06.29.23.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 23:42:15 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH] python3-importlib-metadata: upgrade 4.5.0 -> 4.6.0
Date: Tue, 29 Jun 2021 23:42:08 -0700
Message-Id: <20210630064208.2866-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream release notes:

v4.6.0
======

* #326: Performance tests now rely on
  `pytest-perf <https://pypi.org/project/pytest-perf>`_.
  To disable these tests, which require network access
  and a git checkout, pass ``-p no:perf`` to pytest.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ib-metadata_4.5.0.bb => python3-importlib-metadata_4.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.5.0.bb => python3-importlib-metadata_4.6.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
index 7c156787a03..b9fd2fe59e2 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "b142cc1dd1342f31ff04bb7d022492b09920cb64fed867cd3ea6f80fe3ebd139"
+SRC_URI[sha256sum] = "4a5611fea3768d3d967c447ab4e93f567d95db92225b43b7b238dbfb855d70bb"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.30.2

