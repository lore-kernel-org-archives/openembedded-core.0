Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACA2D2FFED
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 10:01:47 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.18592.1729245702799580400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 03:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ib1WzmLr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d51055097so1338278f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 03:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729245701; x=1729850501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWuMznFxFJtEgBb4ivOpVcj/nR4bZSfUcXmC8B2IQgc=;
        b=ib1WzmLrjUVQ0Oib7TLLb/cOiNtTLBTLzXq3yWSFjRek0rsNMWEYPq6Bea55XcfOYZ
         5VOm9b2UsEnniKfrdQPNTqgm2ezaZoOIiSBox76kTTssDM3rniY8xlmPv1S3HYR877VC
         mIynvyTsNYS/zDZW3O2mcNHxK+ViiS4BwyApA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245701; x=1729850501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWuMznFxFJtEgBb4ivOpVcj/nR4bZSfUcXmC8B2IQgc=;
        b=Rpe07QO6BiBaBEHayBF+/gt1/zFPPR6ibbjsBBbfmynRrrQ1OlZaa78Qu5uhgm/BYq
         zQhqHJbK97G1CMdH1lxoxl50kQjcqeMCv+F4IVCF7+lAyN+c2or2SRrBGdkI7VOPud5G
         hxA5p4tBcHGxdMTICr3Ay9Ey1askzEMa6iE2VwCcbtNBp67ifuN/OX2l1GOD29uL4qrS
         x9sM54xPIQ9kHsW4AOImEp7sE1YgOojVmU5UoPafrLKEuBZgkvj+xBL4T+aW1kwhkKOv
         9pJdKNXYssPu0NxtqAzMwXoqVH9mxrEHaQb3eoykTBSUtALdnQT2QHxycfs0Op7cueqD
         e8uA==
X-Gm-Message-State: AOJu0Yw20lbnF7Ekh5DcHzXDHn8Ewuj53ygxns8WSpk4l3igwRPF8g59
	Y+Xw3ZAuBXWvmxy9uIAoL15glzTdtBDUyDb6CrDLKfMCLbZ4H0W4+TNVszZLmhVsW4pFjAKZg5L
	z
X-Google-Smtp-Source: AGHT+IEml/3stl06uAXaA16cJ6syb6rYyqzMsujFKW6uA9p7/xO0P9la+Md0T2Su9ICWseFmce7KRQ==
X-Received: by 2002:adf:ecc3:0:b0:37d:45ad:8394 with SMTP id ffacd0b85a97d-37ea2164cf9mr1145121f8f.15.1729245700872;
        Fri, 18 Oct 2024 03:01:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b6b8:7e19:2b4e:cb76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed5e9sm1491533f8f.76.2024.10.18.03.01.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:01:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] python3-markupsafe: Upgrade 2.1.5 -> 3.0.1
Date: Fri, 18 Oct 2024 11:01:35 +0100
Message-ID: <20241018100138.2341819-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
References: <20241018100138.2341819-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 10:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206047

Update to match the upstream repo name change and the renamed license file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...hon3-markupsafe_2.1.5.bb => python3-markupsafe_3.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_2.1.5.bb => python3-markupsafe_3.0.1.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb b/meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
rename to meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb
index 821332fe7cd..294532c6af0 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_3.0.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Implements a XML/HTML/XHTML Markup safe string for Python"
 HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "d283d37a890ba4c1ae73ffadf8046435c76e7bc2247bbb63c00bd1a709c6544b"
+SRC_URI[sha256sum] = "3e683ee4f5d0fa2dde4db77ed8dd8a876686e3fc417655c2ece9a90576905344"
 
-PYPI_PACKAGE = "MarkupSafe"
+PYPI_PACKAGE = "markupsafe"
 inherit pypi python_setuptools_build_meta ptest
 
 RDEPENDS:${PN} += "python3-stringold"

