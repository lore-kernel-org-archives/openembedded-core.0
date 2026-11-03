Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7818.1793700734839792234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=So05aVpK;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2263849f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793700733; x=1794305533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nq4N2RwdlDLvq6fFLfTbd5Auzz2O6+BU2I0pm/5too0=;
        b=So05aVpKiw1u09qAQDDsEkw5u5x/AGlLfGnglKrMPgG/MZqDbCp7H3goUIWVceBjwu
         Z5Btdq76vjai30quFQfjrXcE+hLktIxulNvgzGauYC4ChY4WTuhcxQ5XLfFFaSyP/Cxv
         CX+0/k6CqgSxLCBDJD6PDeYyRg1EuTi7VqbTZA1aMDrF+nvGka7Hafr6SmxM2dHV/oDP
         DR94mBBycOinByL8f6oOyQVhu35JXqKPFrkKFbr70aUscrMmihNu3OEX7RNbb7VGGqPz
         gtV1gkKGlOcUvFKKxptyHcuvwTn/TXIHQqxpkNQ55dyTL/j5ECi1fqTIC2OpCXKcoNC3
         E/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700733; x=1794305533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nq4N2RwdlDLvq6fFLfTbd5Auzz2O6+BU2I0pm/5too0=;
        b=by0kg2GDxNqqs3pZ7XbWFTzj1NR8JQEILGxgRQmqJh5Fv59/kR3veCzTTvkzWLR45d
         KpZ7EC3Xjv2VLKQ+tLArUbqfUMbqfefFlmpCk3eBtANsWwE3Savq9x+rhDGZWbcvWa0D
         +vYeuStZomV6OJxXB7a1djMGgEXlLETzWlt4qjldVXGYsV7tXAs9xH/aIz1mqHGGg0F9
         31pPvHHARk2C/xH/M4I8T/e21uczkvYmJ0fn7ofNXpgwuMn+BcFQ0n9cnrLTVHemkWve
         7vCPPsg77s285CK3PysLKc5y7LLb4Etn2us+kVvZa7BMshUOmzwbDMgHvACzKfItXGy3
         uj+g==
X-Gm-Message-State: APuU4Z+BKf+zG5PIF6jalIRcJ55HAgkHD2YAL08B29RU/YuWG9IO+kry
	kF1wKolAafME3M09OWQaVTJTKnt6zXvtSyWOebKIoToveEzmZvHDNz2qX7ZEE6d2Ud4Igt/m6UE
	Z1c523eU=
X-Gm-Gg: AYBFou1hxRDu9wHx3SEcU4HEb1gzLsplGJ3g+i6OVXXLPt1Pnkd2BdYJzyAtDabLD6T
	1GHpneDwfyzFJkp3n8UVjxtimw5oBi8wbuu1VetzYdkb6atk71cHuM3x45WgoIJEjjaJiMU/k2T
	Nl74ma77fhO2/7Sn3Ja3gCzrjYcznM3ZPStYQPqrLLnUjBqGpSY6QOlnmaZqC9qlWnhXzAntUqF
	NA8mh53LhGJrk2tHNoeXeN8FWKF8Cz4Qb2oaNKvrzR/pdPz1EcXJQtm5WdZkYcgNV1bjYKnX6vo
	LeHm0enDhdOIgTAqUOixUcYKAJhgeLgdJR/ERBZTG1XMTlDWV/hFTmC6B7xYCkoKIIUC8VZb5rR
	RIzwO1nrjX26MxzigyKgQ+mgd/Sn5/G2yjvHCvC4+9ryRd+6AD+F1krXcqJofWvhW93SY90j73O
	SCsDTnjFXZQjzUc+qhxk62XYZKGiF8SzUorcrv1padVPWlrT0zjzfXs0U5BLAKardec+ukoirGM
	EpC0/abZaByvri9JaXZ82QGKaEKIvsDlgILkdVsq67AozXryYpga2MwDiJY71kv3ISeU/lSXo9W
	cafH0cu8vC5O1Tz9UXO1/243bGOqiTXacQyPsEQjav0vOLnEm74HiHvKDQH8RDIVu6QL6cwmXoI
	DOff1BwctwFzrJK+wqrnFGs8DWWgouMGNTyUhUBZRAUv9aXLfojYwShNavw==
X-Received: by 2002:a05:6000:420c:b0:48d:f855:d1e0 with SMTP id ffacd0b85a97d-48e6e50b9ddmr28120644f8f.57.1793700733016;
        Tue, 03 Nov 2026 02:12:13 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm23962894f8f.46.2026.11.03.02.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:12:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [blacksail][PATCH] README: Add blacksail subject-prefix to git-send-email suggestion
Date: Tue,  3 Nov 2026 11:12:10 +0100
Message-ID: <20261103101210.871946-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 10:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249276
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 92373e4a047..7e38fe580cb 100644
--- a/README.md
+++ b/README.md
@@ -26,7 +26,7 @@ As a quick guide, patches should be sent to openembedded-core@lists.openembedded
 The git command to do that would be:
 
 ```
-git send-email -M -1 --to openembedded-core@lists.openembedded.org
+git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='blacksail][PATCH'
 ```
 
 Mailing list:
