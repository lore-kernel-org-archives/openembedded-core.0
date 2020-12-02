Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.2966.1606904854847571665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 02:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AZnUeUDD;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id l11so3757440lfg.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Dec 2020 02:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AgMB6OaaLa3Zoc4FuXclYYOyzgWL+pbeYQquC6VHw4g=;
        b=AZnUeUDDL6sifZmGLbhaTnJbosv3wz/25pnSiBNBJGYdX0LDCM482eFFaueWfeHtXN
         G1jDiVRqs94ji5KNN5rbGk8ZOc0wZUidW0Gl2KYvYxgJkmb9BzumKrcg5tTfNSsBGXsq
         zMopNF2QotPvPmOvkfw89784fgPh3wpgJmhhZI1A/ew3sciAFvfEar/edYmGDPxbGDqw
         rQk6uO+9lUWd2nvwhQFUrk9Bhi1xLbzECi525qGFIJAY3tgCZvE3KDFLisUSD4xsyJfE
         AvVvpGlJCoW2t2ZdDpkDB4oz5KAhBNThTc1Js9w39N50QU+D/g/JWoUU059TETCylhPc
         eNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AgMB6OaaLa3Zoc4FuXclYYOyzgWL+pbeYQquC6VHw4g=;
        b=XNHqwxAqHwZub5fFQOZ0M1pFEVOt1NuHlBAnr5M7zamHZYSEBUnINc5nEkbOLG5G3E
         aszUj7qTKtzZheP06Z2Ra1G5SaBgmuMaj53LPyvyerAC2t1j0hXu7FPTxRxji6unI+TZ
         Psu/p84J5BCue01ctix13sd6uNC6AtTjlnj+T70eaXy1/ub4yxt+rY2vz/IItJo5oeda
         0i76xTCoqNPVAGOvba+61BQ01Mawynm130Bo8S505a5RkYzjsPNCMSacim7NbCzAHCgV
         391dOry1FLvewDv0vA6pA6iNpmN8Kwldca6Ks2mXAd/R9MTvmag8Wc+KFIejOBETbEgy
         dk7g==
X-Gm-Message-State: AOAM530NBTjITt70soIsTpN/eIaaksDokLHLB5XEkjhaMqJIUewL9Unw
	9Oc1eOCy6MBY9l4W0nsLLB4F3w7T2uE770SS
X-Google-Smtp-Source: ABdhPJzKhgWCz3c70CElUdxubT74URwUEw5hUFFw4Rldxw6vc3Tc5ShT5VoUrUCRRtgzUKyEk9bhQw==
X-Received: by 2002:ac2:5a05:: with SMTP id q5mr919295lfn.320.1606904852652;
        Wed, 02 Dec 2020 02:27:32 -0800 (PST)
Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from localhost.localdomain (h124200.man.tk-internet.pl. [93.175.124.200])
        by smtp.gmail.com with ESMTPSA id q16sm344993lfc.179.2020.12.02.02.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 02:27:31 -0800 (PST)
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] pseudo: Update to print PSEUDO_LOGFILE in abort message on path mismatches
Date: Wed,  2 Dec 2020 11:29:46 +0100
Message-Id: <20201202102946.3502-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 2e13fec540..600885b5c2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "cca0d7f15b7197095cd587420d31b187620c3093"
+SRCREV = "69f205c41902e17933b81b1450636848e8da2126"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.29.2

