Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50845C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.11393.1634657690175570108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mWcxR+1s;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p21so12445207wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rXjUgd+h6oGpmg5rWf2zNT9YFcEPcaolkDyXWoq7G/E=;
        b=mWcxR+1sCHWHaXWHJDGiWQaYKgc/0mTovX8FBM/SjEJBCdmx068kQZyq1oGcAUv7tD
         0m4MKLiYChuuSUqLKWPU4WhTrRmeAtOLheYiAoJPcLER9A+xqmxJuIn1QOJRsWApvgUm
         WrCJke7HGx/cqJfHQO1qcvoUyaHmjZJPhrLLf4UC+8E3zus5x9AfH7mwpLcIuwDrnRqL
         iaIR5JZaXXIzMcbmFINLJik8OO6RHA/s3l4m51kB196FDHogQ9rWePNPyzwMiyREyw+Q
         1PBNHWkqdRR4vz+cfRtyu/1FF3Vp02E9gCe4mEfYk6IKIALdJmqy6N6shdLNC3MCUsy8
         OyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rXjUgd+h6oGpmg5rWf2zNT9YFcEPcaolkDyXWoq7G/E=;
        b=nAZTSPI7jKVuKRcn2KZEzF80laGjkt2cwNR9Qln7XIICMTE/vWTk5FadwVphsaPGIg
         3E41DtAC/jSUnVVNXAZw5dOaucbshl0lyh42lCATTniQdVutxXkS5bqKhol42CKgldhv
         CVxFG3tw3w/M9wS734HtBNJ1YVv+4Qumt+8RYXRzcAdUoWnszQUTEEE05Kp60i4JdvpM
         1Zfqfh1TiHFkJh1GQWwLNS8sCiJsGUXiHlcfGUkbgMpEpu+19r8Y9hqaUspg8UC/Mawq
         OZK2ic7d9Ua2mNJM6+jTPQpQVK7TWl4U/+IFS94oWHERDYdYcLHnSemHVQvgh01NRU9F
         u0iQ==
X-Gm-Message-State: AOAM531Qs0V8AV53LiaI/Tiz+AUJAI4B/+MiY/hOBwi5rhSviBDGxJpp
	wv/u8DOiJRianNrU2uwBQPIS8/kdjKs=
X-Google-Smtp-Source: 
 ABdhPJw1rcBahOLJcoYYNkyAEbQ+GP+dV539PZLR5PSOmIROVyr7MekI4EJ2Icxt2nxflGsQXUTWjw==
X-Received: by 2002:a05:600c:1550:: with SMTP id
 f16mr6927741wmg.5.1634657688829;
        Tue, 19 Oct 2021 08:34:48 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 35/65] python3-pygobject: upgrade 3.40.1 -> 3.42.0
Date: Tue, 19 Oct 2021 17:33:49 +0200
Message-Id: <20211019153419.3319802-35-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157154

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...{python3-pygobject_3.40.1.bb => python3-pygobject_3.42.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.40.1.bb => python3-pygobject_3.42.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.40.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
index a0d4f04965..461ddcfe31 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[sha256sum] = "00c6d591f4cb40c335ab1fd3e8c17869ba15cfda54416fe363290af766790035"
+SRC_URI[sha256sum] = "9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-- 
2.20.1


