Return-Path: <fabien.mahot@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90109EB64D0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 15:33:57 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web10.16351.1686670436045792287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 08:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20221208.gappssmtp.com header.s=20221208 header.b=GZY+9D0g;
 spf=pass (domain: smile.fr, ip: 209.85.167.65, mailfrom: fabien.mahot@smile.fr)
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-4f61d79b0f2so7296390e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 08:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686670433; x=1689262433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbnK0cbVp9IW4wfH24x5+QGnzeX3xlVxMmvjhWdGy1A=;
        b=GZY+9D0gnqOshtoYvdNMDyYA0zemiC39fb7u/v1IDieDuv+dSplp3Aiabh+x6CWHhZ
         WNsBS8PwNmVzJKfqUib6k2JlOV1wwDoEz8Rxap5lxPW8Vg/F4uXF9ZNAtdLB4bIx4crf
         fh/OwgKcvo/HupPry3H3rHv/QNucH8P8TVOP9l3K9goIsudp4UTFoRIk4Oft/4ogIjaf
         xQPJwQiyw6KwdgUNl+2O91WED9qJHkmPWt9FtZxgVSeg5xAaLv113qP+HqZfkNlWyFuO
         Z1iah86EEDlJEvwOKih2sQCs3Ot1nFuH13qFQua51OAVQ9NaBRTH2dksUiTXTaOh3Czl
         LJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670433; x=1689262433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbnK0cbVp9IW4wfH24x5+QGnzeX3xlVxMmvjhWdGy1A=;
        b=jRQJCvoKOdeGDiEXsqUxuMYAfCzg9JxX8/OScPlbP0nX19NQE/YFWqRAop8PVWpg6P
         f5bGDFY/lE5t+4m670SVLOS+cQzguO6Ka3RhYhOu/xS0i/uF+qduxSFOdZuogJu2fNwV
         uN/QUC1L2iohT1Za1KhLtXg8k4Coo1Kb3fVcA4i3NI38gVYFKD29X1T2q+f16ZOOJoiF
         JaK2cnysA8iPyWJhPdNXKTkGcu+ry+5f4RTVgU4Yzceh5vRadCeHs50pkOYw41MV0WYj
         vsOsnxlr3QiGpcgMJvtITEnsQ/WnTDHtPnOzlNzQFGMMgzWYIYV8ahWjfPdVRv7ZlXOG
         P6pA==
X-Gm-Message-State: AC+VfDzSC/SiaUqQe0gja+FGdZKLYe2J4AptE9zYF4Bpf7sU770JLV2+
	LDq+3G6sKycJlMxEn0qyiE/AbejuifpYfQ/BbCMhScsq
X-Google-Smtp-Source: ACHHUZ6IPMkD37IU6eG/i/rosHJk+WQNObK8PnMhPgzB2hPlrmAwPCEFB0SIS3mvqGT0e+acqZsdvQ==
X-Received: by 2002:a19:f00a:0:b0:4f3:b883:fc4e with SMTP id p10-20020a19f00a000000b004f3b883fc4emr5358678lfc.43.1686670433507;
        Tue, 13 Jun 2023 08:33:53 -0700 (PDT)
Received: from P-NAN-AMETHYSTE.. (2a02-8428-803c-c201-e267-a137-cfd0-6092.rev.sfr.net. [2a02:8428:803c:c201:e267:a137:cfd0:6092])
        by smtp.gmail.com with ESMTPSA id e5-20020adff345000000b0030630120e56sm15832020wrp.57.2023.06.13.08.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 08:33:53 -0700 (PDT)
From: Fabien Mahot <fabien.mahot@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fabien Mahot <fabien.mahot@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] useradd-example: package typo correction
Date: Tue, 13 Jun 2023 17:33:44 +0200
Message-Id: <20230613153344.399044-1-fabien.mahot@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 15:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182720

Fixes [YOCTO #15143]

Signed-off-by: Fabien Mahot <fabien.mahot@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index cff624e2f9..d7a5a95bac 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -32,7 +32,7 @@ USERADD_PACKAGES = "${PN} ${PN}-user3"
 # user1 and user2:
 USERADD_PARAM:${PN} = "-u 1200 -d /home/user1 -r -s /bin/bash user1; -u 1201 -d /home/user2 -r -s /bin/bash user2"
 
-# user3 will be managed in the useradd-example-user3 pacakge:
+# user3 will be managed in the useradd-example-user3 package:
 # As an example, we use the -p option to set password ('user3') for user3
 USERADD_PARAM:${PN}-user3 = "-u 1202 -d /home/user3 -r -s /bin/bash -p '\$6\$XAWr.8nc\$bUE4pYYaVb8n6BbnBitU0zeJMtfhTpFpiOBLL9zRl4e4YQo88UU4r/1kjRzmTimCy.BvDh4xoFwVqcO.pihLa1' user3"
 
-- 
2.34.1


