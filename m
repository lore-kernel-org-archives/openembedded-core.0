Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.13912.1629891512993858911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X3keJvd8;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id q14so1801449wrp.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yS7qYvCGj2QAjIEaNXUZmQLgE2RDljpe2/svZuAneL4=;
        b=X3keJvd8JZhOKo9zLJV3QPNenHLzcznkDyxIKJ9JJhOVzuocJBLCEs9AACYqAgNITZ
         6eV9hX+6E4D7O/WLCnqhWiccjtu97Cg2E2qpqpLmZ4fgWT9gKFg2xy9xgLUHjOmgONnJ
         udRErf4ZczywfreM8NQkMuc1X8h9kY78NRABDUjA6//rWA/F79ia0vRMi7l3QNJ8OqT8
         glpbLAWKxyit7kzZrLh9xkC3O9Ne98nXJrntlqGTEPT2I7GhreKKmqmmEkQWd6soe0VM
         pai3zqc5bYjZa+bnhW/YiHjhNYfX3ABtLB6FLSY+XXNhDLg/EoVqeFrgQGyWZoLAIHBF
         PzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yS7qYvCGj2QAjIEaNXUZmQLgE2RDljpe2/svZuAneL4=;
        b=RzMbabaHH1ccF3+K7qlCm/iFmSBSzW6pxOwXbXpKblLw5D7kGKpTeMw6pOBroLAH5s
         AGQaOy9QxOAlbhlZEvdYaQtJILveESFDc9l0M6bjTJl43auOnis5XSJvmfa7Bu1D5LjY
         ID86o1cTT856QofSeIfai9vVJxxZe3tmOvitaQU9HgcxUBpy5bYvwiZY2BFP8fLiFf1q
         M0b7ooTUlMFpArf1QTZWIgOR8AMcVj8E7bSXENfQZZum501gIyTuGDlza3X8BA6qAZL3
         TmcuTOWJiH3I/dCqsT6RXDD3yLdpdn8h7Un9oZ8HXnhUvpQc8fo9bVwsck7XJJBY8mYb
         ZLHA==
X-Gm-Message-State: AOAM533/8mu6SofIjSHDihiJHiAZXDwabQOc+uQo1Soyl5tW8WuRFtfI
	/jzkREZoESmuJRDzyJQHMnMDiWtmYYFmtQ==
X-Google-Smtp-Source: ABdhPJyoafk01fgU8BcAYUoyEuVL7lWia94I4WHwSZzCpeoLsWbIUg5QfyMwmdwfuhtB67JjUKwR6A==
X-Received: by 2002:a05:6000:247:: with SMTP id m7mr24938086wrz.335.1629891511671;
        Wed, 25 Aug 2021 04:38:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/16] python3-mako: upgrade 1.1.4 -> 1.1.5
Date: Wed, 25 Aug 2021 13:37:59 +0200
Message-Id: <20210825113804.779395-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-mako_1.1.4.bb => python3-mako_1.1.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.4.bb => python3-mako_1.1.5.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.4.bb b/meta/recipes-devtools/python/python3-mako_1.1.5.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-mako_1.1.4.bb
rename to meta/recipes-devtools/python/python3-mako_1.1.5.bb
index 21ce33b808..f8be44a837 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.4.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.5.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "17831f0b7087c313c0ffae2bcbbd3c1d5ba9eeac9c38f2eb7b50e8c99fe9d5ab"
+SRC_URI[sha256sum] = "169fa52af22a91900d852e937400e79f535496191c63712e3b9fda5a9bed6fc3"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.31.1

