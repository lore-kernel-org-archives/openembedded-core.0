Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D2DC433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:54 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.338.1636573192882860195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GMuXHw5f;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id w29so5861410wra.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bSgg6fx+/HxCG+nb4jn4znyK+ijHskSDvCeH6rUtCDY=;
        b=GMuXHw5f6RD/EfdnfsASTVKvQy7iPcY7Tg0RiTD+JTPtZabHWIybMJhudXcAay4z+W
         uiDUeLb74qurncstoEXbflrm6JaYCV9O927UkMtvcT/6Sm6eiPvNUSpABeIb/dYyAv9/
         6Ngq6Ed0eyZcpHOXPvftOCmW9NhNNig8dXvZgIPD0+2CxZnUkXckewxNEiAC7U3A52JC
         esXicUCcdtE0dFsHTeS1Zf7Ep5uktEbHuvpxTZtHPwsPjyy0wR8/J4ib3Jowe8ctigh7
         f6LxUHOacHCs2BbMu6U58RtZKEp498lZWc7yaG9ryk4WQyihAA1IXqb9+h216J2UI5yt
         mbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bSgg6fx+/HxCG+nb4jn4znyK+ijHskSDvCeH6rUtCDY=;
        b=D1nq/AIPVBH7plXuyXhayPQhsITw+1C8ME4lhf0uaSedG4hEWwzPQTCCC5GYmpVf5D
         ItzhW04kMpDyyErKoTwxD9X06GnaMVPEv4iHk2lxxpoq3cdTg1iLHRjLcS/sVemAZszK
         6bdiifEBIEfcZYd/cnf6Om6azR30tmCFKwESyIB0BkyltdtQ2U2yOldOIeXUmxkz1DgV
         bZ/KHaQh8z5nYVrB+lTjQOqdcERVO5NtGhpsXTlgsnmzvYy4flpAaValGwIPoMdxIaHl
         ZoGoIjbcsNejix9lKR9mEiQHelB4jN9rkm+zQA1dLwcdqxOwKH0mlEOcfgFJ7mX0gX0p
         BZUw==
X-Gm-Message-State: AOAM532hNmjpPYKfbkoPsBboVDQ1eHVvlHSHGfrl/+sm3ZH161pU1p1W
	S2B790sKiITGvWylta3DimnEYmWcSRQ=
X-Google-Smtp-Source: 
 ABdhPJw/xHs8WvDl0WUWezI5SeDvGpjNn3XKCeLu3K+ED+D1VBrU0gTdZ3UQGowok92yuTJ8WQ696A==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr1882147wrr.143.1636573191498;
        Wed, 10 Nov 2021 11:39:51 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/24] python3-py: upgrade 1.10.0 -> 1.11.0
Date: Wed, 10 Nov 2021 20:39:27 +0100
Message-Id: <20211110193937.2606747-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158098

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-py_1.10.0.bb => python3-py_1.11.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-py_1.10.0.bb => python3-py_1.11.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-py_1.10.0.bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-py_1.10.0.bb
rename to meta/recipes-devtools/python/python3-py_1.11.0.bb
index 8225c6b6c8..f8be3935e5 100644
--- a/meta/recipes-devtools/python/python3-py_1.10.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://py.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
-SRC_URI[sha256sum] = "21b81bda15b66ef5e1a777a21c4dcd9c20ad3efd0b3f817e7a809035269e1bd3"
+SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.20.1


