Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A534C25B0F
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.22577.1659940978600102682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EZHJWa08;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id gk3so14781554ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+iZDt1NvsgLxWA4bcjGCul54VYOkyr5VktFeAad3xlM=;
        b=EZHJWa08Y18+a1Z3VYcu6pIQOojoJFVNn2be5CetEr0o9dWrHbZVWZ9PU6mo8m1IBt
         SjWdgRzuR4nIa/Jo3tAXxpRFstZlhUVSnVC/9RyVE7XTuCyzN3XnsF2kxDcLPc7Dx96T
         6CNODkUXUDpbzKWBoA9zWEKGOBJLV2hoO28elcr2zQRlc8Q40767hRalChUdpPag2Wpk
         yiOnmVRcgYBjgfqCst2esiK87esmJzULTuo1MaAPa1CizLCOfwebbd5D/Ela/zmeBghG
         3TJ+W2tL+ZZ4i/mZfdkvKtoGMX+vt38G/v8EWi+NTNOhrfvObJaiKhm8pKw/oR3xLfii
         2KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+iZDt1NvsgLxWA4bcjGCul54VYOkyr5VktFeAad3xlM=;
        b=3TVRE29J8a5TVbgxOZ9cezYmrP9A1EuDY2eQUH/isehdXM9t7sXSrOLPR0zGleU2kp
         uYMgIfyXH/ziBMtyEioVrxDHWtV4CT3lzbjZRoq5a2IqP2xZUWcjj0V62DmOp/dPmEh/
         CHZnT4PcwPtyMc0aSYpxbs0fjF9885eLnBVIv4Fmv8Ka1jtS7mA0nFA+e+d2btQ+w66t
         WP4UPuzgbSPLBN+T5Sm6J2vaU25QnL4QHJF6U7JLezSXwNoUR1+KIAldQExEFWdTo46L
         35oTx+CyzoIHL2ABS+zzcwRO3p7LAEKw66AeS9c021iSWl77Rreunq0EYMte60jcqA2x
         n0SA==
X-Gm-Message-State: ACgBeo2Z2jVMZuH4xAl1amp9/Mo07r1eJNcOF+ozPm8drQbZ0biqTtN8
	LJF1Mhb+m9KIdjWjWdmC/AAjY+otyxA=
X-Google-Smtp-Source: 
 AA6agR7NkQ2WVHEUA04pBrS/r0fvSPDE6cAuG141uw+z3OQ1j4hN8GENIsrVS3YU5UV3qeQiX5TN+g==
X-Received: by 2002:a17:907:6ea7:b0:731:7ef9:dbfa with SMTP id
 sh39-20020a1709076ea700b007317ef9dbfamr159160ejc.146.1659940991657;
        Sun, 07 Aug 2022 23:43:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 35/44] python3-jsonschema: upgrade 4.9.0 -> 4.9.1
Date: Mon,  8 Aug 2022 08:42:28 +0200
Message-Id: <20220808064237.3975347-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169059

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-jsonschema_4.9.0.bb => python3-jsonschema_4.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.9.0.bb => python3-jsonschema_4.9.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.9.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.9.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.9.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.9.1.bb
index 66e0affc64..125bc6b4d5 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.9.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.9.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "df10e65c8f3687a48e93d0d348ce0ce5f897b5a28e9bbcbbe8f7c7eaf019e850"
+SRC_URI[sha256sum] = "408c4c8ed0dede3b268f7a441784f74206380b04f93eb2d537c7befb3df3099f"
 
 inherit pypi python_hatchling
 
-- 
2.30.2


