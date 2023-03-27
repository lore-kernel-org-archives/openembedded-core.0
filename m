Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B69C77B60
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 20:05:51 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.46696.1679947543619290391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 13:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GMbJMdXN;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17aceccdcf6so10531714fac.9
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 13:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679947542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOAfC5+gQNjZ0LaADnggghnPj2LYuu74mCisMzXJBZI=;
        b=GMbJMdXNL+J/d5kJzDRruTFoRS6NjGGr8Vam9eJPPQ5LssGi7B1AxH3HdWk8daXRtV
         7EjVLqI/DohqbOPBEx6HL+N7rpuONyzMmFr8vuy8wY/Y/UuEHmAw0Gg/4psH0y0VUzqw
         /A6OSA9MstjG24dZYiCiEo2FbYT8St8ppa5rx36N95XpR4KMt6LzywO/eA1fQLgEoVh8
         7yPoIluJPgeZUTvmnthSXYZw8wGEEEHtUSzl77lsbEaBXtSoHLASqeVo8EODifrjcexl
         pOClv96e16HQEXoiUySg7yO4wss8x7VTpHOSRl7xu8ZcfmV6ZsifJKNktB470p8PzyEL
         LDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679947542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOAfC5+gQNjZ0LaADnggghnPj2LYuu74mCisMzXJBZI=;
        b=pghFucjWr26RVbRk27YGS33Ynv/3+1z/H1ENFLTz72o9iM7BFyu2+affgWAmpc/I5P
         Oad+Phyi9opJjWYhgnf4aDoIwEDNyuB0K1JjgAmQFRVTkzzwlorXXARrkdp+nkCE6tzv
         uZI4zULrGsC545t2/12Ixy9gAmlaJBkJ6lXvLrFTQ8l1Xj0eHC1bJrZ/Ay+GaRO1JiY/
         a0iDYuE5eDhHi62vha1i1yMtMuHYw7/7G6kIBnKAqZpc5e1u8vZ6Doy1LxftzK0Sj7Qu
         CEC5U8BeJNEGwHE0P5tFyHnUcbUs/8e83srpyaCCHWH8Ir9WtJlaPcX3SV2pXnFJg+mG
         PeQQ==
X-Gm-Message-State: AO0yUKU0l7ElCakfo9trGnGuBzr6KZuQ6D9d0EXv9UHeyMdt7o0Pvocn
	VOwJGjn0qvQPWjuwU1I3FgOVf24YXC0=
X-Google-Smtp-Source: AKy350YRJV+C5p27dQFfUWgcpTsGt5IJAPKpv6v6tGvTKzr/TYrR0T1PEbnI2+0fJp33rfX3pf3Xdg==
X-Received: by 2002:a05:6870:73d2:b0:177:a62e:1025 with SMTP id a18-20020a05687073d200b00177a62e1025mr8322465oan.2.1679947542531;
        Mon, 27 Mar 2023 13:05:42 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id n16-20020a9d6f10000000b0069fa641bd25sm5942988otq.8.2023.03.27.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 13:05:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][dunfell][PATCH v2 3/5] licenses: Add GPL+ licenses to map
Date: Mon, 27 Mar 2023 15:05:28 -0500
Message-Id: <20230327200530.3354151-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230327200530.3354151-1-JPEWhacker@gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
 <20230327200530.3354151-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 20:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179179

Adds some missing licenses mappings related to the "+" versions of the
GPL licenses

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/licenses.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 0149b1dc44..d14c365977 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -22,21 +22,28 @@ SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
 SPDXLICENSEMAP[GPL-1.0-only] = "GPL-1.0"
 SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
 SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
+SPDXLICENSEMAP[GPLv2+] = "GPL-2.0+"
 SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
+SPDXLICENSEMAP[GPLv2.0+] = "GPL-2.0+"
 SPDXLICENSEMAP[GPL-2.0-only] = "GPL-2.0"
 SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
 SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
+SPDXLICENSEMAP[GPLv3+] = "GPL-3.0+"
 SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
+SPDXLICENSEMAP[GPLv3.0+] = "GPL-3.0+"
 SPDXLICENSEMAP[GPL-3.0-only] = "GPL-3.0"
 
 #LGPL variations
 SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
+SPDXLICENSEMAP[LGPLv2+] = "LGPL-2.0+"
 SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
 SPDXLICENSEMAP[LGPL-2.0-only] = "LGPL-2.0"
 SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
+SPDXLICENSEMAP[LGPLv2.1+] = "LGPL-2.1+"
 SPDXLICENSEMAP[LGPL-2.1-only] = "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
+SPDXLICENSEMAP[LGPLv3+] = "LGPL-3.0+"
 SPDXLICENSEMAP[LGPL-3.0-only] = "LGPL-3.0"
 
 #MPL variations
-- 
2.33.0


