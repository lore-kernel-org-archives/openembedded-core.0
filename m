Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.36672.1606592393380291208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hJCEf287;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id s63so7007248pgc.8
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 11:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ps9ypJNxkKv+mbU5EzdtHxYRDYdiCnO/fFQk4oKvEvs=;
        b=hJCEf287ySQNCBt4d+54alCaLhh27/PAcPgNnvbwpBvx/eDmBjkKnNH6mH9JcDVDb8
         dpChdtzl1moEeaZwYuIMjfEFFyakoDTh3UuJEdck1Ao0dRL0g3bvN4E07IUCppEE9TaR
         opeEoxT8q+BjTgCWicGh+exir2Gulc1OJ4UPa5qpOuF+dkjnriRtvoCUBrHS8/qf7xFL
         5+JSuY8lYRCYZlFdnR6xUJsryOiQvU5yPrqK50wh4CQPnlijDhkF2Algteqjn4mHXlSJ
         clWUAvX4LCjT+jDcC/F8LaZWYWhuMgoUMVOpu5Om3GM2a4vWseQ1frpB8s2qeK6hYmAp
         e4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ps9ypJNxkKv+mbU5EzdtHxYRDYdiCnO/fFQk4oKvEvs=;
        b=E6hb002l+tk84j92ynE6XZ6YTpyJu5fdg4z8qIuGHigFL+o2ZJPZzHw6VoHBnFROdF
         bF3b461OKzMzEppTrDTQR5gFy97pOtLFE2/FBMQzbAY893S2unzpLDwz448CiYzZ7CR1
         B99iZ9JWeuvYTidUYjmIgXPbYdd6WFOCioHHqlS7eTSm3u9DQAxjro2RN+Jn1Zy5q/x3
         q9w2xT0K7+iLz/xl/JI2G9RMRPMx2pnjLYCje30XNdsEI+8pRAplEVLRiO7OBnnliz37
         SbXZiEE1UcOIxtzPMJhS/wM+ytnRSaVu9c1zKqEPt6QwULPWodgJXl6pclIR3icPEUEf
         2nYw==
X-Gm-Message-State: AOAM532Hv0h52WZaODmp0e2Y9y5RmqU57ljY5Z+pFwCFDPTSIlb/DVsZ
	utL50WSypu8V6+pqgWh8UYcmhJnqbDMC6w==
X-Google-Smtp-Source: ABdhPJy97SUUNcITLWVJIaJyg8nHjQ/d4xJ16BGTEzyVBLfZXq9OquF86m6LGAeN1whfcM4LC4BRow==
X-Received: by 2002:a17:90a:7d08:: with SMTP id g8mr15140922pjl.180.1606592392820;
        Sat, 28 Nov 2020 11:39:52 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id z29sm2629795pgk.88.2020.11.28.11.39.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:39:52 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] maintainers.inc: add self for new python recipes
Date: Sat, 28 Nov 2020 11:39:36 -0800
Message-Id: <18ee3e2d1b819628836a392cf7eceaf7130b618a.1606584666.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606584666.git.timothy.t.orling@linux.intel.com>
References: <cover.1606584666.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

* Add self as maintainer for:
  - python3-hypothesis
  - python3-sortedcontainers

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f77965f8e0b..e9c69b2e6e7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -593,6 +593,7 @@ RECIPE_MAINTAINER_pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>
 RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-hypothesis = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-importlib-metadata = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-iniconfig = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -622,6 +623,7 @@ RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleks
 RECIPE_MAINTAINER_pn-python3-setuptools-scm = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-six = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-sortedcontainers = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-toml = "Tim Orling <timothy.t.orling@linux.intel.com>"
-- 
2.25.0

