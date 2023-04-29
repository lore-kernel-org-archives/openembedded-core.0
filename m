Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FBFC77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 22:30:38 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.58244.1682807430205079970
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 15:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iDrJ0iro;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-506bcf9aa50so176797a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 15:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682807428; x=1685399428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJZ2eMbTP9swYunC1rB8fHs1RTvl9ZbLG6h8GD9G69I=;
        b=iDrJ0iroDGtBsUshGbOo4US/QGNJOl/pAdcIBclXZMpdCUFjKiL1WtdalZivgCVRzy
         P/vJ13w8IopVUlnVV0kyVR9OK0/HHry5qRtQwWPDKrZFXQnVEqdJAakZfCZyXuilAH+u
         eFoSlya5x3MsL+Rc8a5WHzQ6JpCuyWGqYtCLIGi876fHLjPEdLkfdkLSrDyPP5xKk66m
         /HUGXAthER8nAK13gYncS8R9r2Nt5EJCz0UCQ3iDISS2Enc+oOpH43Ztx6m0P+mCloLC
         8jdkT0FpkX3Svbg7uuqFXNaCWcrcoADxTE2EozMo8wH2H/XzIh77fX4cZEDFLinElAUs
         Salw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682807428; x=1685399428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJZ2eMbTP9swYunC1rB8fHs1RTvl9ZbLG6h8GD9G69I=;
        b=lLOJYDNQKJ1ztdea/a68AuwMb7r99VP1rYbFLdTc9t9QIVcWo8MiTNkXGHo94YzhHd
         fS7ryIdMYDTOQbmvp/0QdGNFyJgQxGRjUTiMVAiZBcHBrBHrC37po9B7axaRoJVI5Ok9
         zE9vwhZb+qZg+0Orgml2NlDYm+Ro8S1K6LoJe3vc6ygllOly7CJMBK3cjZhMBuXl4hxd
         kVivnaSgYUUN/jwhV81dK4EBHdlHpEepEWjHAbmfiytJogt7DyXg2q3a2wrAi9p9lI+E
         +RQKdLf962wzKPIx7jDIVPFp99rLLHup3o2X5Bn9rA3pot+13Dy8XHFglT6vQxsvN9q2
         Gq5g==
X-Gm-Message-State: AC+VfDwx8KPEohDnXB/RB3GCUw6brSXBhO5DmW/pyBnk9k13N0EnGXoB
	NOeW9YJZok5Ub+bxhpIJMPK+G9n7gZA=
X-Google-Smtp-Source: ACHHUZ5DnG/AcdLAk7O7w0AhfyoI6gjEzLt7SJ3/PaUxsHCzcGKLfgsz08gXl1+vB2qRNekdNCcLkQ==
X-Received: by 2002:a05:6402:524e:b0:504:b68e:9676 with SMTP id t14-20020a056402524e00b00504b68e9676mr5360345edd.2.1682807428170;
        Sat, 29 Apr 2023 15:30:28 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aec7a.dynamic.kabel-deutschland.de. [95.90.236.122])
        by smtp.gmail.com with ESMTPSA id i17-20020a056402055100b0050685927971sm10600968edx.30.2023.04.29.15.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 15:30:27 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH 1/2] iproute2: upgrade 6.2.0 -> 6.3.0
Date: Sat, 29 Apr 2023 22:30:06 +0000
Message-Id: <20230429223007.86655-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 22:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180560

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_6.2.0.bb => iproute2_6.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.2.0.bb => iproute2_6.3.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
index 65ddfa8223..892fa854da 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.2.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "4d72730200ec5b2aabaa1a2f20553c6748292f065d9a154c7d5e22559df9fd62"
+SRC_URI[sha256sum] = "dfb2a98db96e7a653cffc6693335a1a466e29a34b6ac528be48f35e1d2766732"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.34.1


