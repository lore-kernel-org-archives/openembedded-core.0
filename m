Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676F2EE49B2
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:57 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.13081.1692801416814911130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=XSnmxOwT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1bf078d5fb7so38469615ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801416; x=1693406216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXMHOAkLITpJ6ca+QCvspSo3nxzjyz9UV9BrQ9B6z/0=;
        b=XSnmxOwTfr0ksAA3oVrDQ6QIqDWvXBiilXIIcOcLsvdPXS1PCZ/7faZFNJ2/EGtsBn
         APLx8p9saMeEAInTfqVYTC/iCvqgHySA+XTiKr3IvLjtkELxDZtMWrjlm2Xn+TV5wiba
         zgMusTGZ0wXSPxq4pfbKmcij9ZKPKlu3IWLXye1+V8ZA3RHAl1TmDvC9f1kvLksEupBJ
         da0j7HrhlYbA85uF+7Sb/8DXs6qlE7Qw38hsQCOC9rgwLuoIb+FDM38Jrow1ldmn/aGL
         /LB5MYrtaG7AvPrc1SPWtLmB38GEUlcU35T/F9tv16BMlpHg+9YgdOn14YvvY3nHnrxQ
         efyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801416; x=1693406216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXMHOAkLITpJ6ca+QCvspSo3nxzjyz9UV9BrQ9B6z/0=;
        b=M/PpB1BX+pwRAaRQzc+ULrVVXsMq5zwORta/jJNBvW6IaROledDIcdkJeQM8kKEp6y
         FNiOENo19CW+qgSosxsXw6O+EJu4oQAhIwqe/HxQf9hRXhRJtMfYtv25DaQYbVtfkvU+
         zHjsKWe2InswrxqTH4MY/umYB7x3GSDBhZrpEdTdGvPss8cBHgiJ+NK515VplD/H7lEJ
         C/kIoZxZqLKRhbhrLq1KtVl77ggV3JhcGA++4FDVBg+b12vOkXSBqTypKRHoUF7zbi7w
         I0MtBraFWwdEK02an77XDXdX56/wCA7awPuFQa+RLrXMa/H0Sv6P464QbWx9MvW0f7fX
         WEjA==
X-Gm-Message-State: AOJu0YzdqKpRx4sNSOs6cgwABxeAS109Lsi725ASg5aT2rYYHhhHBP/L
	wL5Tn22ppVqaZ/jwygtacs06zu7Kb7Bp+ynV1P8=
X-Google-Smtp-Source: AGHT+IHQWNvJJFmPvR8FpvZZPiRJ2kzh1NhR+bToAGyCTnsibVvrKoBAaGeDZM0oDshD52HJfDT6Ig==
X-Received: by 2002:a17:903:2286:b0:1b3:b3c5:1d1f with SMTP id b6-20020a170903228600b001b3b3c51d1fmr13306144plh.8.1692801415949;
        Wed, 23 Aug 2023 07:36:55 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/36] pixman: Remove duplication of license MIT
Date: Wed, 23 Aug 2023 04:35:47 -1000
Message-Id: <76f928359f76d449de0d884c591a5d9fdba9d19c.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186598

From: Poonam Jadhav <ppjadhav456@gmail.com>

Remove duplication of license MIT from pixman bbfile.

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
index c56733eefd..63fd6d2978 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 PE = "1"
 
-LICENSE = "MIT & MIT & PD"
+LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=21;md5=4a018dff3e4e25302724c88ff95c2456 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
-- 
2.34.1


