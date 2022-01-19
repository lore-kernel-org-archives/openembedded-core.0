Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06382C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.4641.1642588905620164474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VOtlGmLO;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso6767174wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ZMqZQawsIo8CzGNHjbPTvqqmGQJQhpxBIRlBvW79Rs=;
        b=VOtlGmLOrD/FB7/RtWJ33qq8up5ZXcoLUR1fxeZE3HhZ0J4xsOlAH1tvrpND/f7agP
         bkMSH0TJA1q3UbXtCZLZKW76msySuaH4Trp19C49NtEd9ICc5yOE99uLzJuzZU/+B2uk
         heWyyGkHg8AOeqEUqm3Z1GmTNInzp5cUyzKGwpLk0MUwaW74m6idbKN8NxEF+fDS/AM2
         uIHF86kIlDyL3+8Z8QKL3YmBoNyfu86DapeDpL9T3cKmr8vExSfkB4WNsPbSVlOc2IX7
         hIS/w5GUMOvKdd92ZrCR7n93u2t2eyDpztZ1xeu87OP8175VP44rj4BUlCmtpDGntsIx
         6URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ZMqZQawsIo8CzGNHjbPTvqqmGQJQhpxBIRlBvW79Rs=;
        b=1QLREN4SkQYS4Yeq6iCLoH9iUToVUBusTBFsIuTCDzmIDPGfr5lpYxkg/ptfhgR2TL
         J4sPHUXdA+FuwudnHYaSmX0S8v1ojjQayTzauShtzpu0ZkprpCx9WJxeFJoc6BTl3uRv
         SoYSiKp9+COhBOU0E3FjqoeCFV1dl0LGgTZHcNr9HusDNvbTHKBzBVGwxmQ2iwFmCEch
         4orT5/jAXHpvkO3Tf5da1L1J+q09IkInUJOUC0Bgdmsg1TGU/ZFqs0pmx82eG7OrFv10
         nHH00cYxhVP7+DoqsfqVhigDeGGMehcrianBfRrqIEoyNww9GbwrY1Bo+SVd9cZbt87/
         9MwQ==
X-Gm-Message-State: AOAM531HdDaJn+iF3JxMz/T9vZ3PPBN50bi9eG9VPe8F+fzU7uZfmIvR
	oPBfu0MiMO+Mn7l50o+PwLWY67b4pR4=
X-Google-Smtp-Source: 
 ABdhPJzaEga66M1XCIW1XCqSUykaMZ+SH/Z59b9w/umO4dx2h7LiQli/sM/2We0d1LSYMXJN9zHblQ==
X-Received: by 2002:a05:600c:28cc:: with SMTP id
 h12mr2906562wmd.18.1642588904192;
        Wed, 19 Jan 2022 02:41:44 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/39] python3-ruamel-yaml: upgrade 0.17.19 -> 0.17.20
Date: Wed, 19 Jan 2022 11:41:03 +0100
Message-Id: <20220119104117.2120127-25-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160717

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-ruamel-yaml_0.17.19.bb => python3-ruamel-yaml_0.17.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.19.bb => python3-ruamel-yaml_0.17.20.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.19.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.20.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.19.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.17.20.bb
index a0f5c89846..a6bee1bea1 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.19.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.20.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "https://pypi.org/project/ruamel.yaml/"
 AUTHOR = "Anthon van der Neut"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fa0a51dfb461e2f803969e0f3fa71dfe"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=034154b7344d15438bc5ed5ee9cc075f"
 
 PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b9ce9a925d0f0c35a1dbba56b40f253c53cd526b0fa81cf7b1d24996f28fb1d7"
+SRC_URI[sha256sum] = "4b8a33c1efb2b443a93fcaafcfa4d2e445f8e8c29c528d9f5cdafb7cc9e4004c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.20.1


