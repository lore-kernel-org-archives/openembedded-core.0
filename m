Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.31498.1620651682379662649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BYHnOsxM;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id l7so18620762edb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XHGG//rucPiGSZtDzG/95G6qdqAeqLibiT6qaBNU+fM=;
        b=BYHnOsxMeH7/XFUm1rZ5BczWkrguu6d4RN1Lt70egyRjwP2aLVKM6rpsaXi4e+86Us
         tcZ33TsqjnZTi5qqNLpdK2DJms0k4Sa+Z+W8rufMXE/eTzotskWbjUg0dbl855yIMIak
         8fCsmzvePRDieYfWBjluL9LmFpbvmuGbPjeBQ47UIDs0y5DCPYuyEuUPlLrRoJvTQKBv
         FoSiO1nz++hlFO9lvNFXcJL1dQ0DVGykM+KGvaJijZLpgOfTHMLKqMQrF8NnyJ8wOuvn
         B7b5Gkag/JfTObJbahUgdTdTypQrZqMcbXpK2SQDk2qvZO3DJkXf2PlG8O18Phw2a53H
         x5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XHGG//rucPiGSZtDzG/95G6qdqAeqLibiT6qaBNU+fM=;
        b=a7pOiv1boJOdhRFwC+TGKko5CE+Sz0MY1wKmMOKCBBJU/AgOICvnKP1x0VkbF32pJo
         Zxkf1qcJnAqEBgtfTehsQkzxXdoAQUkQDwjz52iqAoKoSHnMagZrdmL79QOQhizlHi1k
         VMfUu+y90HRBU3/+rNsd9tT6h5HeA+hoSlIcCCQsrrMy+L0p0Dw7hNQRLWWdIsXUUOaM
         X+F0+fm3+gh7CidFfDgXtjWW2/eRkrOrvElyuqg4fnXpjSy5rJuMxmFSI4LYyatnHEn4
         JVj2GbLr+K0WvBSV6n/bZY9XGuwUWg3KG579xnl/f6C+YQT+DPi2s8btnEbzfQx1FMJQ
         Z0Og==
X-Gm-Message-State: AOAM532hMFUhVT06fi4d3E3TWz83jHVV0Em9NxCYmFgvEijOCODJ285p
	zuaVDQBv+jRVrjfRpd3JwrLDDlwpB/Y=
X-Google-Smtp-Source: ABdhPJwWEVjWkSzm/27uWbIRbkVLJgrC/F0QGX1XRetlVwXd4qgbXGwZLXHlS3fmK1IACn93u1+vFQ==
X-Received: by 2002:aa7:c914:: with SMTP id b20mr30245423edt.199.1620651681059;
        Mon, 10 May 2021 06:01:21 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id pw11sm9057361ejb.88.2021.05.10.06.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:01:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 6/8] mesa: add lmsensors PACKAGECONFIG
Date: Mon, 10 May 2021 15:01:08 +0200
Message-Id: <20210510130110.939820-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510130110.939820-1-alex.kanavin@gmail.com>
References: <20210510130110.939820-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a85f94c75e..4cec1034e4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -167,6 +167,8 @@ PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
 
 PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 
+PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
+
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
-- 
2.31.1

