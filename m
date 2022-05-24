Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AEBC433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 17:18:18 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.12135.1653412694684123773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 10:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QPu0o5/M;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id y13so35970964eje.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 10:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9JEM8PQXC+auSmWfnwTpWepO9ElJt7hRolZRLOL0Gmg=;
        b=QPu0o5/MekJ5b/E0jyw6a4K70Wael5+V78yKJ1B36Q7gnKMAQTEIdmf38cunH4Mvwn
         DnOChpUZ5MNRZEbZ5dt7sH949VgGdBFNmi3IWjg4bs/NMYJ4L2QxvVG7OLzaiHr2G1Z5
         TNVG1FNqBExrnvTyl3iA4oB2Dink0umx8lUAxddsQS8FaHFZi8kiUi8sM+XWsGbvdULh
         NoU8ma5mHP7v5VTZZirvQsj+IPOHFBeF/YxqJpl/6z7MCOy8D/fptbyi48Stanr7sOqa
         5jGuTDvTT3Hqu26LZ5RsbeJ4i3ZfXXTmyImEYj0p+gKxE1/ZNvv1F1tUHgOWdhyFkrxz
         Pm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9JEM8PQXC+auSmWfnwTpWepO9ElJt7hRolZRLOL0Gmg=;
        b=F6+CtuM/NyCQzmwy8xxs8Knx6b1pA4awNnDJw/XJ9QxDbxCAvsvruh+n7WgjwSTuys
         NC7i+N4NvNImrF2mywn27mhjHU81ZLTLtQSyLvU/7iMKQOGm33Jj/9kKDrRLpqRItpUV
         kfGlpVqVkcegoiSSjPEWI39dYXewjequvF+vnjdkn9BaPBrCuct+EqXeg4eVVUUkz3P7
         VuCclaEQwQk/d4LzxnVBdUhLg8sDtytTLyXXNnF98BiHShgpr7IfV+PcOSmnZYo+KOqI
         sA4nxrboT1beGvhWvEw5hBJqXrBWw2GOj10Aqlx5EaYMV+6iuPRIO2mXbDmzigAV3Z+2
         F4TQ==
X-Gm-Message-State: AOAM532EqkG8qVxXxk2TvgBGUEQ1/Onq/BTEskpllNT1YzaULtMzT56G
	v6lYM+VW0gkhzYXySxpLD7FgMFv5s00=
X-Google-Smtp-Source: 
 ABdhPJwKf5l+CMhnfzTMRrXl7c/uwnr2FtiSfHW5gwzhqil5mI4Pwa0SHb9j54Gh8lMab8UHZ6moug==
X-Received: by 2002:a17:906:1f52:b0:6f4:ebc2:da82 with SMTP id
 d18-20020a1709061f5200b006f4ebc2da82mr26047063ejk.176.1653412693302;
        Tue, 24 May 2022 10:18:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a056402164700b0042617ba63b3sm9775578edx.61.2022.05.24.10.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 10:18:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] bash: submit patch upstream
Date: Tue, 24 May 2022 19:18:06 +0200
Message-Id: <20220524171807.4029924-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524171807.4029924-1-alex@linutronix.de>
References: <20220524171807.4029924-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 17:18:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166083

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/bash/bash/makerace2.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash/makerace2.patch b/meta/recipes-extended/bash/bash/makerace2.patch
index 43cdd04157..abb51a5086 100644
--- a/meta/recipes-extended/bash/bash/makerace2.patch
+++ b/meta/recipes-extended/bash/bash/makerace2.patch
@@ -11,7 +11,7 @@ moved or are being rewritten.
 
 See [YOCTO #14227]
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://savannah.gnu.org/patch/index.php?10210]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Index: bash-5.1.8/builtins/Makefile.in
-- 
2.30.2


