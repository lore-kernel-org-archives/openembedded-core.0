Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954D0C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:49:33 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.835.1643053772449197624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qBg5rt92;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id v3so11048577pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Q0ruYWGZOteiy4ZIf9tnhc3CT/JNbOiKDn5YTrSDAYo=;
        b=qBg5rt92cssEoJfvP3nSXwIdy3Razq/rAJluE8UMRdsKmxXzBeMNN/eVeaeUtNeDoA
         itYWXUYrxwORekLB9jjLlpTvHj/LlpstSZJtBfolB+bW+opQk//aX6vswiQ6/pN2FAAC
         X3v87TBjS/YTcTTxW8xkyi2h39aynFrGLjyrnu+5tYoSZ0I5cSotPPH5z4vDim+FpLHu
         dTUYNe76rUJXuKgzZruO6xsSHfK/MjEevHgzG1C50YrLkjg31E8IyzOvr8twmIqE+V73
         Rc89ugKiuwTkYKumPLH535677mfGWc5GU7ytDL6MYqZTLnjZF1vOJlpNE6ZF4as1AeaD
         2vMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q0ruYWGZOteiy4ZIf9tnhc3CT/JNbOiKDn5YTrSDAYo=;
        b=ZzoNtzHcAUJObY4GLan2XSTjVkKxDRmg04nCKtk4TpvCiXcvEE7reOLe9HJyrKSWlT
         j30STgY9XWm2Nsjp4JDNFpiql4Mlafy07yUfbF3lONkif03D9VMWO1LOVp3w6hLZ57tP
         12KGgubnPkRgWfWZL/OdSllnPdoUJqcWZ3Qc9KoElRk+VU8l5zuQATTFZpXZxOdDJVo/
         NN9pb1V+NDX0cdbyrL3tI3Numqtx2CL9tfUZOetcYrhk2Dc1l5CSIuCJzFHmJZtt9IpG
         IWMf0X6JZk1zWN92jLuyElUx16iZQNXvRDGsFGSbI2bCNPxN/0wLlf0qcV04y10sv5Yb
         6wog==
X-Gm-Message-State: AOAM533jnb13KVp33Pf1VMvRglOw0EowZKguSnSVNVyyuJAOgLTLhWxa
	eE7GgFZZDcoeD5xZIb4UE7yD2eLHYckjwQ==
X-Google-Smtp-Source: 
 ABdhPJwz8bQYMrdqoPVWlxl+7Aq3yUrRX2z2yLzgUeJRSL4VTANSnAu2pjb7pzLcNMxUlPMrw41o6A==
X-Received: by 2002:a63:7509:: with SMTP id q9mr12722776pgc.136.1643053771698;
        Mon, 24 Jan 2022 11:49:31 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f265:5b05:90c1:d910])
        by smtp.gmail.com with ESMTPSA id
 t2sm17617202pfj.170.2022.01.24.11.49.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 11:49:31 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] python3-setuptools-scm: upgrade 6.3.2 -> 6.4.2
Date: Mon, 24 Jan 2022 11:49:07 -0800
Message-Id: 
 <06f434b675f807f551d8238a8e28e0657e0a5c43.1643053417.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643053417.git.tim.orling@konsulko.com>
References: <cover.1643053417.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 19:49:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160900

v6.4.2
* fix #671 : NoReturn is not avaliable in painfully dead python 3.6

v6.4.1
* fix regression #669: restore get_version signature
* fix #668: harden the selftest for distribution extras

v6.4.0
* compatibility adjustments for setuptools >58
* only put minimal setuptools version into toml extra to warn people with old strict pins
* coorectly handle hg-git self-use
* better mercurial detection
* modernize packaging setup
* python 3.10 support
* better handling of setuptools install command deprecation
* consider pyproject.tomls when running as command
* use list in git describe command to avoid shell expansions while supporting both windows and posix
* add --strip-dev flag to python -m setuptools_scm to print the next guessed version cleanly
* ensure no-guess-dev will fail on bad tags instead of generating invalid versions
* ensure we use utc everywhere to avoid confusion

References:
https://github.com/pypa/setuptools_scm/issues/668
https://github.com/pypa/setuptools_scm/issues/669
https://github.com/pypa/setuptools_scm/issues/671

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...-setuptools-scm_6.3.2.bb => python3-setuptools-scm_6.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_6.3.2.bb => python3-setuptools-scm_6.4.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.3.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_6.3.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
index bc594d96201..10dad5a37be 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.3.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "a49aa8081eeb3514eb9728fa5040f2eaa962d6c6f4ec9c32f6c1fba88f88a0f2"
+SRC_URI[sha256sum] = "6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
-- 
2.30.2


