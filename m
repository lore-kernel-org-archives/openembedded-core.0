Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9262C4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 17:15:15 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web09.284.1666026908289483898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 10:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aF4DZiTJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: festevam@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so6171164otu.7
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 10:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T2MouWZowhJMhnY2lXwiLJJ73z8gy7Wf5SRlLuPJng0=;
        b=aF4DZiTJHqvDX3IWQmt5B4lRSzKdV0d4lP68guLP6QZMMVCr2X4oM9P9Uc8sq3bEME
         v88dUA7ZVZ/uKWhRJ3ixq+bys1V+BFN8q/6uPwLhYSCvkJMG3ciwggpUj7tXeUq0Ro9D
         e0btVnbsSeyPsqqItaKIXhrNK+sa7p2arW/yLc6LsNFyPC7VKR/nylnjUn5qlrHXajXb
         Hx0ZZ3Vz41drXoC5S+yd1GLUUMgF7tnTmVjVM6dAuISeWFobYgDaf4XAeT0E+j9SYO1W
         DvOZDQL1/ej+VB4xOnlOcLwB3gqUblj7teF/V/AKaD/Bm4bhpFC1tOco+YYVWJ5VS59A
         ZUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2MouWZowhJMhnY2lXwiLJJ73z8gy7Wf5SRlLuPJng0=;
        b=wVqZURzjJJgPN14I4d0hhwNqn9ZWDjuyD0O/mrAD/nMnvuSPivgobns0I0/FiMUg3J
         SmrQ3u8CsZ2ZPas8Uwc5lU8d69SOGsGUDAFjBqESr8DFjwqfvlwhjezBPwIYmfGRB4L/
         HHz7esoJVd9ZwzDXlOvciQSksTqZ3pN1RiE7hxwYrnYGGHQfmUtMbbHimw6Q8OmoR2mm
         pmHNwFFdOPDh0/gBtatCjNVuwpr/iyP7lDIIb0qrgQwOGy+sTCcky822D+Ea3V+xsD4i
         cOWli0ptymNKRuLHrcwf8WC25ZvijE7BIbTeSv809yqLPhYBeg2KQaa7O3uqvPqL6euo
         pqoQ==
X-Gm-Message-State: ACrzQf0Q4J+2wG4L6e4yVWB0bz4Mk5hwqqrzcCPa85zecj9LlFVXgIpA
	4lMpjdgsogiRqMnWNT5vo96J/eb09fI=
X-Google-Smtp-Source: AMsMyM5BQ3wgdaO36/WhKe99CUbaEcMrk6reJDRt4YJ2SPXk82Z+//wSecOXBuG3usEC7TZW4okOCw==
X-Received: by 2002:a05:6830:25d4:b0:661:e2a4:96d2 with SMTP id d20-20020a05683025d400b00661e2a496d2mr5370474otu.383.1666026907210;
        Mon, 17 Oct 2022 10:15:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:9e9c:7f4e:2671:f50b])
        by smtp.gmail.com with ESMTPSA id 15-20020a9d080f000000b006618fc435absm5149659oty.43.2022.10.17.10.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 10:15:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] go-mod.bbclass: Remove repeated word
Date: Mon, 17 Oct 2022 14:15:01 -0300
Message-Id: <20221017171501.3457090-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 17:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171916

The word 'the' appears repeatedly. Remove one occurrence.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 meta/classes-recipe/go-mod.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass
index 927746a338be..61571596bcfa 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -6,7 +6,7 @@
 
 # Handle Go Modules support
 #
-# When using Go Modules, the the current working directory MUST be at or below
+# When using Go Modules, the current working directory MUST be at or below
 # the location of the 'go.mod' file when the go tool is used, and there is no
 # way to tell it to look elsewhere.  It will automatically look upwards for the
 # file, but not downwards.
-- 
2.25.1


