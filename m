Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A35FCCA486
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:52 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.3659.1657094865831250598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N92X4Xv6;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id m16so2733276edb.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NO0HI7WhBDsPrmHhCrh/Qorc/CZ9nablCc0HWUOAUto=;
        b=N92X4Xv6a9181q+RmTHK4espPQeAKGZXSPtOiP3bN0ife1cq55vvJiRfr8MBn8buqR
         LyMBfDceL1BRP+D6Y5lkeFjiGLNWj4FExbLCEHi8DBCB9cGctrqdqRqYHY/Baioqx+Mv
         bKhDw3VcmgxcYGgu26mjERAihgr2W6OMEzCjXv+pgJlXggsB6Xd3MapKgAPEVWw+YpIA
         UFj5x2m+HuXUpFFBSji9/2EeyAIsJa4zxK97OPt3oL9Zj6izypmm78fezE6IjOOQahcF
         aubpDD4CiHvafgSNr6ViZYK8BInaiJqA4Z1ncLCIajqxPiu2jxOdhPh30t2JtiX/ageY
         slCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NO0HI7WhBDsPrmHhCrh/Qorc/CZ9nablCc0HWUOAUto=;
        b=V46XE9XB0w3uYuMJ6XjiLE/AZHq8oPaMgY7G2CZHN6uGr5MDRZFe0PWxd1+Pt/hGYv
         YMDe5ZNn6gB88S7VyvIXxe615wzpXX2xj4d+EWdITRNJxvTWah56IjZvGsM+oQMUU8DL
         y6dDxvR+WpKAjFH3YzkoLHg/NhHQ394yTp5TlZ8W3wH/ij3hN3UMBxxcAR+FnFC8zliT
         1T2wJaa1Fi4wc79nGqJv4Vqd/q4vePs1iimE4sFDN41afDg1tP2YUCul46DfcOB2IGjp
         wOaqc9L3RAM7MpJ7kyZybJv6ux21fco8vhKYCeCJrJWtadMfySs4RjHDszBkufOP967D
         Jm6A==
X-Gm-Message-State: AJIora9j2dTY2R7e/oJ7dTpJMiq4FfSzuyi7xirVmInkfwFoVdiEQbhY
	+wpg904FVB+oQ4A6CyBDQm9GKDgXzjtshw==
X-Google-Smtp-Source: 
 AGRyM1uyZk2mptTpOo79PYVsTpTLp3Z37Vo9y3Cxu1ZWA2DOVzz1uxUjlVaHwwffJYaSeTDlepjlPA==
X-Received: by 2002:a05:6402:2404:b0:437:d11f:b9c7 with SMTP id
 t4-20020a056402240400b00437d11fb9c7mr52379692eda.176.1657094864418;
        Wed, 06 Jul 2022 01:07:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/27] python3-jsonschema: upgrade 4.6.0 -> 4.6.1
Date: Wed,  6 Jul 2022 10:07:13 +0200
Message-Id: <20220706080721.3072553-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167706

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-jsonschema_4.6.0.bb => python3-jsonschema_4.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.6.0.bb => python3-jsonschema_4.6.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.6.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.6.1.bb
index edd7fafc77..5a5c80c821 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.6.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.6.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "9d6397ba4a6c0bf0300736057f649e3e12ecbc07d3e81a0dacb72de4e9801957"
+SRC_URI[sha256sum] = "ec2802e6a37517f09d47d9ba107947589ae1d25ff557b925d83a321fc2aa5d3b"
 
 inherit pypi python_hatchling
 
-- 
2.30.2


