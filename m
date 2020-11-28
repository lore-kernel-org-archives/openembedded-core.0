Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.28927.1606537520425715616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M8+wdt+S;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id n137so6162311pfd.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Tsed2ucaYPlyUiFnNsUqlSUDhz8Me9DUUXTRZTuh6HM=;
        b=M8+wdt+Sz0Ci4nOZ0ZJN1dQqLsrMpfQibjSxDqXv7nibP+XAJ+zgOuQ2AARNLiiVi4
         rZmNWKdYvqkEDKHnYrnd8FTg1wU54V/eGkyO9b8ScUh6wPEQIwvq/VZVXEnrXLIIdeCC
         5AnkPkb18WKCmKc0ckGn9sQW1zthnRaT3o8zEl7ChoY5jEo3AXJyL0AVkZT6TAzSQS9K
         iy+YRqATRcCM0Rc701DL/kgN9EEoxQnmJ1RL9RWeafOWv9MhM7rr6JEMwiOz4QtbsfZJ
         LCvdFsyPzEKSZTvjeWvan8AnfPXPKPR4hTeD/YZFcf5T16flzJVIKIrGjMfxqnYLkEMy
         0efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tsed2ucaYPlyUiFnNsUqlSUDhz8Me9DUUXTRZTuh6HM=;
        b=qBI8zEyLNsn98ijs2frPUK0INHcaSu1R0I/ZCvY+4ywOFSet8WLw3O6ppW1FDem5jk
         LjY2nds0Wvee9W341s/bTbWZilmMSs5hurBm1gr6Azrlr5BS5eGoBx1mdRfyqOHfrQkE
         3AmFtclDOopirQ1VURPRV4u6uxr8hX0XDsWOeUzrGaIQbvZD2B3l5ZVHp8FEMlnjZE4/
         BfCRcVTJSujAUnxuZ9DM05RSDwjFl94uigSYyit7Hk3n8e+dFqnWfo5bxl80jrmXGXW/
         zVY0DHiLsnyQeVR3mwDa3J+KT7yLw3utYJwAMWCBHZrtFXvQ2kLazQ+GEvHsyty2n7Mw
         +6ag==
X-Gm-Message-State: AOAM532TjGEyHfNt4rWMiXGyYmKJ/V90B5kaV0sUpVDfniX2uPgC9s8x
	xn/9SMK4vxRvaTU4V10+MTqgiFzlFi1x1w==
X-Google-Smtp-Source: ABdhPJxoV5CEdErwq40obHwgHJHNbi49x3XMFqhk7TePWqhmcG5VQCiwF0ReVNFXa3YoPUae8aMpnQ==
X-Received: by 2002:a17:90a:7343:: with SMTP id j3mr14172555pjs.51.1606537519869;
        Fri, 27 Nov 2020 20:25:19 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.25.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:25:19 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/18] python3-pytest: RDEPENDS on python3-toml
Date: Fri, 27 Nov 2020 20:24:31 -0800
Message-Id: <7790d9b16011aec9551dbb526d6e558772670165.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

The generated requires.txt in pytest-*-py3.9.egg-info shows the
requirement.

Caught during ptest of python3-wcwidth:

Signed-off-byROR collecting tests/test_core.py ______________________
tests/test_core.py:4: in <module>
    import pkg_resources
../../python3.9/site-packages/pkg_resources/__init__.py:3239: in
<module>
    def _initialize_master_working_set():
../../python3.9/site-packages/pkg_resources/__init__.py:3222: in
_call_aside
    f(*args, **kwargs)
../../python3.9/site-packages/pkg_resources/__init__.py:3251: in
_initialize_master_working_set
    working_set = WorkingSet._build_master()
../../python3.9/site-packages/pkg_resources/__init__.py:567: in
_build_master
    ws.require(__requires__)
../../python3.9/site-packages/pkg_resources/__init__.py:884: in require
    needed = self.resolve(parse_requirements(requirements))
../../python3.9/site-packages/pkg_resources/__init__.py:770: in resolve
    raise DistributionNotFound(req, requirers)
E   pkg_resources.DistributionNotFound: The 'toml' distribution was not
found and is required by pytest

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/python/python3-pytest_6.1.2.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pytest_6.1.2.bb b/meta/recipes-devtools/python/python3-pytest_6.1.2.bb
index 6872da5cfac..6fc3b6f3284 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.1.2.bb
@@ -10,21 +10,22 @@ SRC_URI[sha256sum] = "c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316a
 inherit update-alternatives pypi setuptools3
 
 RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-atomicwrites \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-debugger \
     ${PYTHON_PN}-doctest \
+    ${PYTHON_PN}-importlib-metadata \
     ${PYTHON_PN}-iniconfig \
     ${PYTHON_PN}-json \
+    ${PYTHON_PN}-more-itertools \
+    ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-pathlib2 \
     ${PYTHON_PN}-pluggy \
     ${PYTHON_PN}-py \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
-    ${PYTHON_PN}-atomicwrites \
-    ${PYTHON_PN}-importlib-metadata \
-    ${PYTHON_PN}-pathlib2 \
+    ${PYTHON_PN}-toml \
     ${PYTHON_PN}-wcwidth \
-    ${PYTHON_PN}-more-itertools \
-    ${PYTHON_PN}-packaging \
 "
 
 ALTERNATIVE_${PN} += "py.test pytest"
-- 
2.25.0

