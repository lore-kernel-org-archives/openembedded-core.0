Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6389BC4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.9729.1633945281539195543
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jZItpjs8;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id e12so54130737wra.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GSkRhOt1RheDaqc/4QOGsPmB4RCcaNQE6vx1laz181o=;
        b=jZItpjs8c2sWTEGFNGrRLy+EdRSD1GybgtWXBRM/dbbrVYx41sT2KGvTmn8idTEIh/
         ED8F56PqNOuHeTa7JO1ay6Vy8ZLJVzjbgxBs4SMuTdfmSlAwsmceqCeIgjgAcYy4Zrun
         Ap4aE1yY+r+o4+n4m5uCAbUBN8wWNVYOB/LHfcRy5MPfXYci9EZ9concotawXs+ZMTp8
         eNHInLnIK7unQvIKaEOb+Y5HkCPg/FiWEz8bC3VMPC+E0/doiHuQo4nLOfWM118NnGEO
         iZ0DAF1zgL4iVLt9D5sAmm894y1h0nAZTDjW/q01eDF+mCm9csGoafT5Lw1PIh4wQgaM
         utbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GSkRhOt1RheDaqc/4QOGsPmB4RCcaNQE6vx1laz181o=;
        b=VaOH0gz2jCbKwhNgFAsrIlU62xUHmHIqJZXHkERaFwicp+pbw+wt97Wb+QrilcO3Tu
         GxyErS27W6OP2dC80oUmud3B5jUmTmPTvPz8jNBQ16p7dFZvX+xTWvQj47OdmVBPRdGU
         nYE3pgEt/oy1B1hMNsPJmsmVPcEhXS7scLCayJijiNu06p/U6t41vVLbqUrmmzXHaKrB
         1FHvaT984ZmWnXpWPq8rM2kLALgwwFYnOieVfGFqXIbtm60yIBZ3zt+5I5xDT9bl+B65
         1WS2gOGBjjAmjzOt2X2g6gdvEMbl1DCc/jhLvzznzZaRLM/j664MxDFUOUSYJKl8U7pG
         oeJQ==
X-Gm-Message-State: AOAM533zQm8YV5yADMB9EymEnp40DODuxU4PktPa/vx/FrHgt+WwBpqp
	n/pM3Yg/JAKz98msfJv/cTJI6fB1dOE=
X-Google-Smtp-Source: 
 ABdhPJzgGJDML7ghZRcennZ6pDV2wXe3M2eZSCXRZKP6aUujx5ABwQKN1R1hIwzp+eOjGlC8p4yRxg==
X-Received: by 2002:a05:600c:190a:: with SMTP id
 j10mr1498771wmq.184.1633945279607;
        Mon, 11 Oct 2021 02:41:19 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/25] epiphany: update 40.3 -> 41.0
Date: Mon, 11 Oct 2021 11:40:59 +0200
Message-Id: <20211011094059.4184654-25-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156838

Correct an option to use libsoup 3.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../epiphany/{epiphany_40.3.bb => epiphany_41.0.bb}           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_40.3.bb => epiphany_41.0.bb} (91%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_40.3.bb b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
similarity index 91%
rename from meta/recipes-gnome/epiphany/epiphany_40.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_41.0.bb
index e74b75c802a..09210b68aaf 100644
--- a/meta/recipes-gnome/epiphany/epiphany_40.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_41.0.bb
@@ -28,7 +28,9 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "dad138b9f2d55de271128fca38b61f53fd980c587d29e1ba6b508fff3b19f564"
+SRC_URI[archive.sha256sum] = "b39d1825492595b0b74c5d6a6686a857f9419dfa4c02f8013c297bc870e26dd0"
+
+EXTRA_OEMESON += "-Dsoup2=disabled"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.20.1


