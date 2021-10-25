Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35953C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 22:44:32 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.4514.1635201871415675294
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FYJDKbDy;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id m21so12118468pgu.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GilERMulneIQbAFZHwqmB8opagdqTwCfbXYJSZtydxw=;
        b=FYJDKbDy8dvyxEfZ3+EsVgzrbRbiy5twL6s5DY98FQCNz81AsU8eFEkF+ZoBLV97My
         7WVjDsfhRUPaLLUhepj582llJuxtBx1ZXT079fpWt1oEHzZxdMU6iksjmqafUJ5w3nDI
         VPPT9w7vb+BT6FNAXoDhRZtjSudbFbMAsEd69J7pUaqaH+DffKWVUHAsMouEITHGLdnL
         g/wdnfBnfIJuWK6KkUbW5OP3zwfPp6/mEfi3YSoeE1qzAQdLK4CwEjfLhY2TylZ5MKqD
         9D9nsgp+Z7CYmG14jSMa2/8qdGRuhjzTVEu3McqWrwuXUbhp4R2i5N/n1OtwRkIV6UZe
         XYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GilERMulneIQbAFZHwqmB8opagdqTwCfbXYJSZtydxw=;
        b=nVtJt3eZ/NoVRVO6DW5jxFFjj+qC+Zi2XE6spZc8dzp+V2c9SudZTlKH6JsWhXHM+B
         xvIJOOMWs0mpRwn7ZWT+HRFAIgqQC/sHfeu5x7u2cYL7lFQWwqbf2SYiY8QNEBtvvla2
         XDHmdwtxmAZl2RFSaZscc0iiszF7NWdXVS4HYGgnA2LddyBf6VVRqjBnsXIPs9IoPK5p
         C1oV/7oDFMvijNC30x3pVFZJj3LloK+gp7U3t6vQdTn5KtowtRLv5UhMnDaGJYsQDYX9
         O/N07+nsVd11i7y4UiSpu/luchGHgVAQ58WSbvxNgNTAhX5Yx+7xAwuV+2mylTmEwXT7
         nVzg==
X-Gm-Message-State: AOAM530BnY1mPEWTxdkR7Ze02bE3mUIzdUohzW3x4fJBVE09xw8jwn7y
	Q4wWxiQ2LlkCAWre+u00wzRElKgBRUE=
X-Google-Smtp-Source: 
 ABdhPJxB4R47XV4/zSo38YSdks4nsLnmiYNNM6Px/3In7DTc1DzWk6tMIHHQwrHOLLEUCdA9bc/apw==
X-Received: by 2002:a62:2cc2:0:b0:47b:b52e:c6d8 with SMTP id
 s185-20020a622cc2000000b0047bb52ec6d8mr22015102pfs.12.1635201870729;
        Mon, 25 Oct 2021 15:44:30 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 k3sm22160363pjg.43.2021.10.25.15.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 15:44:30 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 3/3] python3-tomli: upgrade 1.2.1 -> 1.2.2
Date: Mon, 25 Oct 2021 22:44:04 +0000
Message-Id: <20211025224404.508616-3-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025224404.508616-1-timothy.t.orling@intel.com>
References: <20211025224404.508616-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 22:44:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157367

1.2.2

  * Fixed
    - Illegal characters in error messages were surrounded by two
      pairs of quotation marks
  * Improved
    - TOMLDecodeError.__module__ is now the public import path (tomli)
      instead of private import path (tomli._parser)
    - Eliminated an import cycle when typing.TYPE_CHECKING is True.
      This allows sphinx-autodoc-typehints to resolve type annotations.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../python/{python3-tomli_1.2.1.bb => python3-tomli_1.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-tomli_1.2.1.bb => python3-tomli_1.2.2.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-tomli_1.2.1.bb b/meta/recipes-devtools/python/python3-tomli_1.2.2.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-tomli_1.2.1.bb
rename to meta/recipes-devtools/python/python3-tomli_1.2.2.bb
index f62690ff2d..39030ed218 100644
--- a/meta/recipes-devtools/python/python3-tomli_1.2.1.bb
+++ b/meta/recipes-devtools/python/python3-tomli_1.2.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a5b75cb6f3968abb47af1b40c1819dc519ea82bcc065776a866e8d74c5ca9442"
+SRC_URI[sha256sum] = "c6ce0015eb38820eaf32b5db832dbc26deb3dd427bd5f6556cf0acac2c214fee"
 
 do_configure:prepend() {
 cat > ${S}/setup.py <<-EOF
-- 
2.30.2


