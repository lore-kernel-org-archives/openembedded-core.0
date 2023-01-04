Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53763C63707
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9388.1672830376764924673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XdivRrLJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id az7so8167772wrb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsGMGIThuX4WVc+JSm+RjGQ8ly8cLvKPVlSPR7NAN7k=;
        b=XdivRrLJRg7WBz1GIK5VJtxIUy6hPkv3fY7Nr9OvbDiJiibLl8z4QufuxIV7Jq0NZG
         HfXUkPix4j2ePfzRzhL2mxjtFh7LHZDcLRprS5oZ4lGGposzmY55F7m5QGas/VXp0Ky2
         t4oaZiQYaQJj4QS0Rrl+utvZ0/EDIenf20pk2XAKrbwGjZ33XiQ9WdyAicf6jurBl9Ps
         wPBgkUcj/0OkLHkntPH5K+9ci+mtH2PbnXPH6XhZf6GLLVmbQv21tnU8Ef0Yvg5Bwn92
         OHbFQ6jrOtL+rKaD1H9z9s20XzispygUod4q5ghyHojUgrBpuf+KmqrgKkFqDYpmP2IZ
         AQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsGMGIThuX4WVc+JSm+RjGQ8ly8cLvKPVlSPR7NAN7k=;
        b=1sKxNiqPe4IAaoPmHh1UCXoqTj34ZCHzfqJqr/nNHQXUTYwXAFM1DDgpHEfhk8CDWy
         AgA4aJrbhZHWjpCrO3b+OM4INf64YHUm3DrEQv3PghqXrgBNkUgwsPCgMdnnhJaTcbqX
         Cx4OKc1uVx8ypklATo1lnKqjLPzBSdcb2+j5Y81IDevWmxlXhNW1pTKyHjVxO4ZQYLKs
         nRZ/p7yyqIzMsium0EN0zcUuqlLNAyaYp4pFL7GFnZ9sy4aX05xLNOwzuNRfd0YiOhf4
         pJ7YaALY/PpHO7a91deNo+LATD3fFkuEVrZhVYdTt9obUD9PlaEUDs4aDJ9PC9d5ZJv/
         dMYQ==
X-Gm-Message-State: AFqh2kpMXG3/GQZ3LsjR1efs5BhsJfnjfN0iPJDsYsQWNWvDPxx73YuR
	3GGQ9s9j52xpviZ3DZZxUG3w6Pk+BIw=
X-Google-Smtp-Source: AMrXdXtnD23HryvkiOGaxxWdW1fx784G6eR8IGGmW9USRVLZEnSquQhdWK2gQhbxKbyzQ+2wMwcUBg==
X-Received: by 2002:a5d:5c0e:0:b0:269:70f0:8142 with SMTP id cc14-20020a5d5c0e000000b0026970f08142mr31527160wrb.56.1672830395498;
        Wed, 04 Jan 2023 03:06:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 56/77] python3-git: upgrade 3.1.29 -> 3.1.30
Date: Wed,  4 Jan 2023 12:05:27 +0100
Message-Id: <20230104110548.2537259-56-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175441

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-git_3.1.29.bb => python3-git_3.1.30.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.29.bb => python3-git_3.1.30.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.29.bb b/meta/recipes-devtools/python/python3-git_3.1.30.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.29.bb
rename to meta/recipes-devtools/python/python3-git_3.1.30.bb
index e75f8b4e3f..80f50019b1 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.29.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.30.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cc36bfc4a3f913e66805a28e84703e419d9c264c1077e537b54f0e1af85dbefd"
+SRC_URI[sha256sum] = "769c2d83e13f5d938b7688479da374c4e3d49f71549aaf462b646db9602ea6f8"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.30.2


