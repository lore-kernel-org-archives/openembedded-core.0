Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E755BC27C53
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 02:07:16 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5660.1718244429276957014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 19:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JKETlarT;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f4c7b022f8so5143115ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 19:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718244428; x=1718849228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZagNaIX+4KeXR9avQZuq8lDiusM/uTs+nxuNDayYcw=;
        b=JKETlarTcT4UeKHVEcehT0lE7CVzcgmorzHjlfbBqNBma799skU1Ouw6awVsywKRhV
         Wp2pnbkbAdSymQNgG6htxYIl0zkMTjO4dGkcUXn1V/FcVooxfbsSNT3ssgr/tCdLKNkc
         GIob0oSX/EBB20IRsmeNOx/UhTKz0Q60/r/OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718244428; x=1718849228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZagNaIX+4KeXR9avQZuq8lDiusM/uTs+nxuNDayYcw=;
        b=Yye3Ti+XPAwR1rL2+yDCTmx/+Wpk2VlFfHx3lXsH1Iv/eoCZy4YhO4n7g0udFKJY5F
         ZqilXKvxWmkW+ltOpWO1Vn6+Zwq7xgtxMpmw/GCIjdge0YGLHbCsCDgIcijgWjUTm0Ku
         HoJr/VVkqRmXeFYN4cu6E1A4BwiNajcDTJYTu1j/ig/C/WtjcZ/jdTTTyWloz7TYvRii
         5VwdG/j9a3AF7xU7BFeYJW7m7PP2XzrXabjN84Ch9CjLlx7k3p8wqeOaehQmalqxJD30
         tL1mTmzIjLhE7Y+27eMuKkprqf8uv5AIGDB/jEk7Xe4T+k/9i2yj56eKMaqdJhbuYRV5
         D+Rw==
X-Gm-Message-State: AOJu0YxcRWP2xZMrAEcNEw9XfkQ4BfG35rQhoerCOuASj19Ccm+Wc94r
	8fZX0NVgxrQHtHWhqnt8KmHKEf8yiqipjId67qL36bPlsS0kQWBopcVRzE71n9OX71PwHySp5zi
	C
X-Google-Smtp-Source: AGHT+IFjnrNHUmsrOb0e9Ymx/Shqz2xa2LIVECdI20aE49Tr4Tk/1f7ZB8iEUk1XsH6Wdk4i5Rlxvg==
X-Received: by 2002:a17:902:e844:b0:1f7:167d:e291 with SMTP id d9443c01a7336-1f83b7047c7mr38521885ad.47.1718244427961;
        Wed, 12 Jun 2024 19:07:07 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.45.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5cee9sm1609995ad.34.2024.06.12.19.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 19:07:07 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH] cups: Upgrade 2.4.7 -> 2.4.9
Date: Thu, 13 Jun 2024 07:36:57 +0530
Message-Id: <20240613020657.85553-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 02:07:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200585

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed by upgrade:
CVE-2024-35235 cups: Cupsd Listen arbitrary chmod 0140777

Other Changes between 2.4.7 -> 2.4.9
====================================
https://github.com/OpenPrinting/cups/blob/2.4.x/CHANGES.md

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-extended/cups/{cups_2.4.7.bb => cups_2.4.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.7.bb => cups_2.4.9.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.7.bb b/meta/recipes-extended/cups/cups_2.4.9.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.7.bb
rename to meta/recipes-extended/cups/cups_2.4.9.bb
index f4b0282e4c..e0a3522004 100644
--- a/meta/recipes-extended/cups/cups_2.4.7.bb
+++ b/meta/recipes-extended/cups/cups_2.4.9.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c"
+SRC_URI[sha256sum] = "38fbf4535a10554113e013d54fedda03ee88007ea6a9761d626a04e1e4489e8c"
-- 
2.34.1


