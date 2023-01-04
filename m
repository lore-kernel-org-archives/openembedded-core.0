Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104C3C54EBD
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9388.1672830376764924673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZS9ufMFc;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id az7so8167442wrb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uoNY30Eil2Jyw5VFxMQlOlAdJC1culizCobLzO+3mk=;
        b=ZS9ufMFcUI0vs1xCk/bFLGBA+dxeCaO29Xc/ciMcrTjaxTDnZj59LHaVMyTOC274Ib
         ptQj8ilxoUcx3lRNhHxa/LNr9ln0Nhj1Ee+Y+ayYbBoepjFEW1sWIBSR9pCeOkL1Js2c
         vKXy0BfTUSbOpO+/I1LpcmY3JyE/JGdv4eHlMZcDlauuv6emBlYNwGOLDrq0+OVThz86
         OBpsSPa22ZHRlQOFN8LolzD53qhfE5GDyBRz/BpD9kM4WUXeZ3FH6exUp5Krj0U+k7nc
         IIrTnazEgyEXfh1KQy76EayxmXrS3d0b+Hv05ZN0q9zM6GODatab6NYniiaUg2WXgdsv
         OoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uoNY30Eil2Jyw5VFxMQlOlAdJC1culizCobLzO+3mk=;
        b=wikk1VfUJpjb4qqDzsaKnSTKR72teDM6eTYe4ctwkUDWk2saidHuHvJ+9n/qdLOpO0
         GwiZDLF7FZB444lQXphPCU3ll2jrJ5Hox2dT20g96uLumjLpgwVtmbowr9AIG+Lgh4kI
         0hN9tkplu2jej8acRD1lRw1vExgq4gLvNJLYE0ZtCJQB1bOt1qtB4s4oAlky6xYqkmvf
         OpREfy9owgWjLB3Qmgpo4SOvNXDTDRtcAp2bEEu/YocFmE2rIjKwQVwp8aY/KPkeKIU8
         WWHOGYvvxcsGaaN8uQeDNsUd25D05X7bQBewHFav9UIursreIIvfZX1W+PRiaVLjtTiA
         VaRQ==
X-Gm-Message-State: AFqh2koYlH7S0hobZ2/jzhCiD6Z/z30JCjZuMhfv9z5JrFhKMsxDgXrt
	nHRGhVPqMvd50Aq6On7/0ASKbkPUdw0=
X-Google-Smtp-Source: AMrXdXuKRonSEdHeYEXzfbDOvYmHYArKujcCUTMtUGThdSOiGhuPtiXJ5BIeeXqe0xdn5Y8FcHrzOw==
X-Received: by 2002:a05:6000:697:b0:28d:be60:9d1a with SMTP id bo23-20020a056000069700b0028dbe609d1amr13695612wrb.71.1672830386898;
        Wed, 04 Jan 2023 03:06:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 45/77] python3-setuptools: upgrade 65.5.1 -> 65.6.3
Date: Wed,  4 Jan 2023 12:05:16 +0100
Message-Id: <20230104110548.2537259-45-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175430

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_65.5.1.bb => python3-setuptools_65.6.3.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_65.5.1.bb => python3-setuptools_65.6.3.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 1b5f9c7577..2110c4a877 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From a0e0873a8ee6674d43e604d66bf66d94fc8eeb6f Mon Sep 17 00:00:00 2001
+From 2e57369593ede5336f947e7b9903ebc673f98fef Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_65.5.1.bb b/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_65.5.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
index 8dc724e55a..a8bcb3a602 100644
--- a/meta/recipes-devtools/python/python3-setuptools_65.5.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_65.6.3.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "e197a19aa8ec9722928f2206f8de752def0e4c9fc6953527360d1c36d94ddb2f"
+SRC_URI[sha256sum] = "a7620757bf984b58deaf32fc8a4577a9bbc0850cf92c20e1ce41c38c19e5fb75"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


