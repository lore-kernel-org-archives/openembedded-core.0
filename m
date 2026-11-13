Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12896.1794581053701500871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 06:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=V/smbMDN;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so4781395e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581052; x=1795185852; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4wTm3UZDTAGvediAH2uHO1lBRIpuOui36SO1PJdB8G8=;
        b=V/smbMDNktAHxyeyyc0/IoCJxQ/DwLpkzdJazaf4k+aRScai1NcC6XDXHtkNQyfGPW
         x+6aFJF8pfs3dGxgDhq47lbTnt3XUTNNnRaqz4dcZHd27vwaV+JJhTnHYq6GJvtLsDuG
         3uPuEv92WJj47FXlqMsblGksRoACdGQU3wDhFwB2/HbNCvHjqNn1tkuYndpKCCfDZfgp
         ypCpuzeBZu918M9Oznv/XkNycWhRB+HG40F1fXKdqWlKh8XWy5vWZrExMqkVsvjjQNtH
         pu2VI5yHhIFyWOUZc2pL9X5VES604LSNNi0cOvh5Hg/J0BMBhQe4e23quN8jYVqmE2Uh
         XQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581052; x=1795185852;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4wTm3UZDTAGvediAH2uHO1lBRIpuOui36SO1PJdB8G8=;
        b=jfMl19w3yGQxaZdetM046GKIv274lEg221fyOiVwH74pWEkJUo+Ryk82WAIdEmUKwY
         J+h3uuO5iSpLXem6oRrDam3BMSWqNFMzYBSYeizR8Qd+UulQBvefC9xb6W5oLDXh+D6B
         zbKwPb2I6PjMlJavdkLjOdapkR3ktbS1c8arVbXSwN9mb3FGqi4rgRElzwAwa0hRgT6e
         gR4r62aJ50zB5H/lRy1q13ZqevoMHJzg/FaIXs2j+ZDWHrtt/EKSiucXdyowetxaaVjU
         m9tA7K1r0ghjS4qKTRAb63uaBQX2zUl07FuosYdgZj6tatdLh44f44eWUQm+DH24MLrj
         8XlA==
X-Gm-Message-State: APuU4Z+yR6TLPtoec+guzKhzM1p3YO5Y6XTdRRJsdA4eP654FrElZ9On
	EPiM/BLXEalrnFKYFP6o46Oyqrt3AGuHjSCKJZsZzaqlmrn1UlEPLzNVufAFAS/8
X-Gm-Gg: AYBFou2fVXTwG6NDRV8Ok1oTYDdFYBpW3hQivGp/X4IHhwpBYTXNpu/I3NTDJzQUvxm
	Nu/SNLds0OK+bRGhSNsPyMPcDZNTWXoLAvCO5CkRlnUIvhogR2vRg2/A3CZeEgRU1Hmzh1ypI2I
	9zGW3smMzC4Fry9Idjh76wRA6XxZSQMAsEoRX4o8Ey2BEwrDKh7Vbe5X6kheyTgSSMmGJuSDmTL
	AcebNxbUcQJc3ein94NrFh++902k7GOV+WM7havJTif11+pvNpmSasI0rdi9jXR2HHXLy1k/GPD
	9dtNNR63XJQIhYec+rRgUS3tj9rRwwidEl9AltO3+FmyUGkGLK8JcVqkLMDB/3lBIM1e50Mpbbt
	uNDDkOfhC76Ap+dpOVZUL2hyMAgLTxoJqBLlzt7Y6KPNgUXSOl5LK2jkVfbITgX0PbPO3Wsa4gA
	Jjpp+OVFVf1/Z9tfn+bxLFl+08GgJuz5/oxLmfnu4W7irCfZq5i0maGl3Pb2AikRCimslH9OL4k
	tId0t7YTU9jPf115ZC85DrDp5CIS2CZVPdLQ/LF1kwUqEskFC2QjEd2kyCG+Om0rlqenVJCXDSe
	8OTbBgAge/RuC292/Jc5pmKmKnvTQGDn
X-Received: by 2002:a05:600c:8b38:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb55a7b45bmr59669675e9.10.1794581051885;
        Fri, 13 Nov 2026 06:44:11 -0800 (PST)
Return-Path: <michalwsieron@gmail.com>
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f97257sm38874595e9.4.2026.11.13.06.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:44:11 -0800 (PST)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Fri, 13 Nov 2026 15:43:56 +0100
Subject: [PATCH] tune-octeon.inc: Fix lack of whitespace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-msieron-octeon-whitespace-fix-v1-1-1bfa0d19ebb3@nokia.com>
X-B4-Tracking: v=1; b=H4sIACsi92oC/yXMywrCMBCF4Vcps3YgSbELX0VctPHEjmBSMvECp
 e/eUVeH7yz+lRRVoHTqVqp4iUrJBn/oKM5jvoHlaqbgwuC97/mhgloyl9hg856lQZcxgpN8OIU
 0ITgXBxzJGkuF3b/++fK3Pqc7YvtGadt2anM8o4EAAAA=
X-Change-ID: 20261113-msieron-octeon-whitespace-fix-f2fbe200c6e5
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 14:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250181

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/conf/machine/include/mips/tune-octeon.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/mips/tune-octeon.inc b/meta/conf/machine/include/mips/tune-octeon.inc
index 0004190c34..96df9b1a60 100644
--- a/meta/conf/machine/include/mips/tune-octeon.inc
+++ b/meta/conf/machine/include/mips/tune-octeon.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?="octeon2"
+DEFAULTTUNE ?= "octeon2"
 
 require conf/machine/include/mips/tune-mips64.inc
 

---
base-commit: 34991d0ce3cc5f38dd29e824af7579512d2b917e
change-id: 20261113-msieron-octeon-whitespace-fix-f2fbe200c6e5

Best regards,
--  
Michal Sieron <michal.sieron@nokia.com>

