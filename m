Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE11C47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 15:35:07 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.18247.1706542506568178005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 07:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=ANs8iGHv;
 spf=pass (domain: snapchat.com, ip: 209.85.167.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5110fae7af5so1169330e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 07:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1706542504; x=1707147304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ad4Ksb/SSSjvsQD0lTQBCN77Pc6HZacMPu8F6dDxys=;
        b=ANs8iGHvPafKWzbHzDjp5VUfXfxE8UjusucGJ/9uWexRZS3rqJuMoWqBE1zQ2ecD2+
         yjuRnFs3kf2fDlhom19g/lle6mC9BlBK+nDhbqYk7Rg3H5zkQZeQp5yOYA8LYbeWoe8y
         Rd9fR68NmGiZfeaS+I0CbAfvbahhFNriC//Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706542504; x=1707147304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ad4Ksb/SSSjvsQD0lTQBCN77Pc6HZacMPu8F6dDxys=;
        b=EYxpD5zNShkf6uH9xVZT4TAK0ymDyr7IDLd4nIpZdWiUdgTaLhFyl9zuOkZ6zMqfpd
         ksAoNP+vnHFUHcpnobMGdV4/LKfE410d1tL/0G9c9AGOpFWXXxFbeqC/9CeSXTAJFm6U
         fpHmRc7VnMsLKwNGjtSlziW/uXJ+/dh+gPMuwTwhSlqxSaI9RniuMzpI/bk7w2XIDVV8
         E+ekJaMaYIUMcdnNPtsWLIDEQCZAtJq8S1I2Z61GoRdwI7mF6gamM5pJo1YfUX78TjTb
         O+Ys14VvlbeP1an7jHxMcL+UsY7DFS/Lyd9+tcW+HYo2vvZbPfL/CppvBI+2i03l3PY/
         D6uQ==
X-Gm-Message-State: AOJu0YxYI7ulUKV1nDHzPUA2wuFHhTBZXD/uF1WJwWhDn2D8RnSuX9Ot
	2VTufWwdh8DxYB3OU3dDTQUl5xzRuPkTOyaZN7h7BFDXlHfwSiip7JKrudnszRmA2WQOEHcql0q
	nE7/VMw==
X-Google-Smtp-Source: AGHT+IEipA27oe7HdpB7HPzx8wXErNlyoGe6OZ3rcDrcrcxhY+BbPr/ERStIHV1q+x1ErpDx95Bh7w==
X-Received: by 2002:a2e:860f:0:b0:2d0:41d1:8124 with SMTP id a15-20020a2e860f000000b002d041d18124mr2755352lji.1.1706542503881;
        Mon, 29 Jan 2024 07:35:03 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id g9-20020a056402428900b0055d333a0584sm3838224edc.72.2024.01.29.07.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:35:03 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] dropbear: remove unnecessary line
Date: Mon, 29 Jan 2024 16:34:54 +0100
Message-Id: <20240129153454.3610960-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 15:35:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194462

From: Etienne Cordonnier <ecordonnier@snap.com>

This line was added in 703e3faaec8c5a22, however
the default value of FILES:${PN} contains "${bindir}/*", so this directory does
not need to be explicitly added.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-core/dropbear/dropbear_2022.83.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index 12ac732f58..528eff1a10 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -130,5 +130,3 @@ pkg_postrm:${PN} () {
 }
 
 CONFFILES:${PN} = "${sysconfdir}/default/dropbear"
-
-FILES:${PN} += "${bindir}"
-- 
2.36.1.vfs.0.0


