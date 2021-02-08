Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.33757.1612781988549741224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AF467wYd;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id sa23so23967524ejb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hysYfAq7kZF0K4PAh/il6Zn6TOBqtM3cshXxLSB7n/c=;
        b=AF467wYd1cUPuPnvo+gR1LfyApKuic88hkFG6uenj1SCrrUd5yhd1IgT+EbXUpqHvr
         Ycn20r6T9ICSIhrj0m66+iyXohIyjJ3anVxI1M5GZ+XMLiEIFcmVdmYxF21DEiN4U9Gp
         7eCQkv6qlGnVADnxkaeTCbzifUf6kNGARDmClpzaskp0oH85zG7QgxNjQFbG5o8eq8tn
         APhf5tjF/qUyT0SuXP2qFuiCWPlFyItqX9U8RVU+gfZYUYK9XMX8gxTeKwqVxZp57w3D
         zbUeE7ps6cqRgtFqx2uBwNaQp0SXihPBBS3gTYabshg5fhe+A9TFnagQcJdIBZtDv8eB
         MazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hysYfAq7kZF0K4PAh/il6Zn6TOBqtM3cshXxLSB7n/c=;
        b=PKSU9oZRHU7/yEIq73RDg6Fqjm70zg7hXBuIZjq9UYwCi6ntC85m+FQIzH0/HWapal
         fq2lETGoftDHIzI85Vth8O+U1aUYiivGteQ0JAvYDzzexr8xJVJoh5zzMp0qf1NCpgvP
         iMA70xfzbHbHJUMdGrdXSRc6jubtYM0tTofqE++hk/jXs0MHhmWUwhhqxJMYNcKgQ4HO
         87Kr8sFp2vXclfp8KtzmX6Lx/xJlZTi+rFX0L74pyB6r2EiTs22nHQJGqqYGs8R0AcVB
         PsrSi2y8J9GDGXFHnDJcEfSiAkmm99TG57jpr3jAb0XzKC6i+5SF/K5XvZenUOIX44jk
         2+6w==
X-Gm-Message-State: AOAM532ozMnWlzvmA0xHT4V+YVpWtMcAvUR+wV03XL1sfd/O62WCsxC1
	5ShXMSuJg48rdpOkMS8x5B7aDfgmn3iq/A==
X-Google-Smtp-Source: ABdhPJzS15bVMJAcI3O+hxMW+IyRl1TubzQJg5mJyKBsmYdpP8xuE27+7Urc04XvFHlH1XY12moqAA==
X-Received: by 2002:a17:906:3f96:: with SMTP id b22mr4004230ejj.478.1612781987207;
        Mon, 08 Feb 2021 02:59:47 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:46 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/12] spirv-tools: correct version check
Date: Mon,  8 Feb 2021 11:59:32 +0100
Message-Id: <20210208105932.347925-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_2020.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
index 2c855d8d8e..4866558158 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "b27b1afd12d05bf238ac7368bb49de73cd620a8e"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git"
-UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
 inherit cmake python3native
-- 
2.29.2

