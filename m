Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.8733.1604910713493279648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FVLd4gAh;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id k9so7779935edo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSDVKV122iT0f1HONE3X3pv3NYIXsR5zDBpU6drlWFI=;
        b=FVLd4gAhpIVuata4qgQHtW36iei7UUdIA1T9wlkxtjkFIeyc9JrfCDGs1j2gB0yCCa
         9tomiNo+EctK5tJv787t4qiLgO3SAf3BUCP+mwSMG3MZLmR1xVojfz3QqteH68tXKq9Z
         naEUe9ZhTk76zrjkQ6gPpdgwdiLeEaTLyLbtbS0CmUZ6lTDrwzHFOpqReyWnanxsqpLM
         2vSFXQXSvdnqq4hEmstDTuFmeSTLuExMnbBVGESeKQYVOwqzODiETCngjwo+m//9iB3/
         dtlDUKuhKYJGJ0ZMlso4Ik9EA6S7C7MB9CQH4tIicLwbcrshxor1SEkgt4toxucHcD48
         WewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSDVKV122iT0f1HONE3X3pv3NYIXsR5zDBpU6drlWFI=;
        b=Hyeo9qOFw/O1pfbxbS+nOAMtW1HCjREA+C4KdqI8J+qMwtvl8GOH1t/+zj2s8P4qmK
         K9hmQU8o+gzSodux8soI5VH5HPUPicqHXT8XBs9e083Vg74iq6TZfxgr5/F9erTRsq1P
         X9H4fyowW5SZhzc1H/npfJSfzaxvMoSt26WTNrxmXyKNy3ZjqQ8n+trFlnccATIavBa+
         haBZqpzT900B3nxf72OoHodTtRkLn57EtfqC5KzKOB3bTY/mY62auGl9i9J/H7uidiST
         7j/cifdmONyBqmpuAfxsY/q6E4XQUGoheqz/lnQNgAu6msPhrClOZmWE1lgWLMbXAUzN
         r7xg==
X-Gm-Message-State: AOAM532+H0AVzytIVe557HrtdreakMOByMkKoRx9BEXioiWBrov1vRV4
	yvTFLC5eZtxxkMqhRMHlMLkhVv/UmbzIXA==
X-Google-Smtp-Source: ABdhPJxwVy/XCXy+X8Sph9Jb1qMaGiA9MlEyRQTeSPLGZDOaHuwHLSxhduSVwZEoNirTsXPmwNiXDA==
X-Received: by 2002:a50:ee97:: with SMTP id f23mr14592393edr.333.1604910711917;
        Mon, 09 Nov 2020 00:31:51 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:51 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 11/12] poky/conf-notes.txt: mention more important images than just sato
Date: Mon,  9 Nov 2020 09:31:32 +0100
Message-Id: <20201109083133.16503-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/conf-notes.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-poky/conf/conf-notes.txt b/meta-poky/conf/conf-notes.txt
index 67c177db40..084cc98369 100644
--- a/meta-poky/conf/conf-notes.txt
+++ b/meta-poky/conf/conf-notes.txt
@@ -5,7 +5,9 @@ You can now run 'bitbake <target>'
 
 Common targets are:
     core-image-minimal
+    core-image-full-cmdline
     core-image-sato
+    core-image-weston
     meta-toolchain
     meta-ide-support
 
-- 
2.29.1

