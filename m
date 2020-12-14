Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.35604.1607956633957145549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xwuoTc2X;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id t8so12165060pfg.8
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=UXwnVoOZSviOnWIAhowaVyo62JJBze2ANzyX1NGi2Po=;
        b=xwuoTc2XRZA0fcNijdilpZ+jkg7r+XWCoOmd8114oAaDManK8PgDV1LDLcQjfflwq1
         zxfa6pS72GfJFHOCsd4kDUk2rRhYfW0HlkPIWASS/wORbBY6hqZux+eo66RybZx+6c4f
         pMx4iUk1MK5/O+1rWOM60T7sGBh37OcYzgzC4qIK4RsmWOEeGj62ULar5GQwQxcyZu0q
         RRvl9Vs/kiMsUiRxhLUE14HLj5andah0+Wnd9CnFNRi41jGVaCEGZWmeTwGs3Gcm85l0
         PvEItGs6+LJ4Crw+XNKZxxLmuijqip3qNBCMSlOS5qbc9KufGqs2bzGhUK9i2y6E7K3G
         h+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=UXwnVoOZSviOnWIAhowaVyo62JJBze2ANzyX1NGi2Po=;
        b=QAbEewWyOqtuoUz8C7Iadfn2p1orfaPk+lc4S9DrfzAL0B75eVz1AE8l0Sg1DYwCNT
         95Lg/v8o8CDko7rHXwHUz6Ap6WqPvlhcrNw1aYeKqw92CzqN5jRu+uzdC4JOJZ5cWCgM
         smT445ts0Wj9Eewx003NTgd/JxWPqZvSneGvtz/90Aj0mm577EnTLQmmxxLKBjGqphwO
         pdUQeMPuYfGp6TONrMZcScjETjRD4h/2Pbgg0AnsO1l4OBCUdEKLpnI/LI/GtJ32nSsA
         pL2sxZ4cxA9oFOgP+zMS85azwS4nOalKeJvtzFIfhIdqM5Ifea3L89zH+iCecDZTUnKe
         NS/g==
X-Gm-Message-State: AOAM530NykRD/3y+aGDelVYd8R8VNXkvKHPChy6xx+fwTMoDkRQCOpNj
	4DCeOXOmPQpRzIozOYJO9RkTEpeLTu8z+mhn
X-Google-Smtp-Source: ABdhPJz3mprj6S/2X/juc4upaePt60C0IRoQy+tvq0+Hl3PeC4orBlZe/mzqX7KQ4DJ/4sv4CihTNg==
X-Received: by 2002:aa7:904b:0:b029:19e:c8a5:5154 with SMTP id n11-20020aa7904b0000b029019ec8a55154mr19196648pfo.41.1607956633112;
        Mon, 14 Dec 2020 06:37:13 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/25] wireless-regdb: upgrade 2020.04.29 -> 2020.11.20
Date: Mon, 14 Dec 2020 04:36:31 -1000
Message-Id: <d01a4149891637561b4bb1e9120eccb9619dadf4.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: zangrc <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5461c6b0e21877c58a75834f62324a4798c2000)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2020.04.29.bb => wireless-regdb_2020.11.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.04.29.bb => wireless-regdb_2020.11.20.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
index 30d4cb523f..b3567bca95 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.11.20.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "89fd031aed5977c219a71501e144375a10e7c90d1005d5d086ea7972886a2c7a"
+SRC_URI[sha256sum] = "b4164490d82ff7b0086e812ac42ab27baf57be24324d4c0ee1c5dd6ba27f2a52"
 
 inherit bin_package allarch
 
-- 
2.17.1

