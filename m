Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.46843.1590480764580652346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 01:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=qgkqOBQJ;
 spf=pass (domain: googlemail.com, ip: 209.85.218.44, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-ej1-f44.google.com with SMTP id d7so22822488eja.7
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XWVlRXgNg3KN485YsrCfC2VS/J/tzMn6WtNYvblMRac=;
        b=qgkqOBQJCpqxh5gIdcrEn9NLfc24vkj/8o2ByQotFGodGvFqiJ3jdWLsqsGsb5RW6a
         rD7H5L3Gai1c6VkYBe4k3wxCeaQaCuPNLZyP8yxyj8fpejbmJl2IBShl7s5s6p7BwvqW
         XgEwzBszNB4dSlQhUArIBXkjplDu4UkzvE1R5gNtQWuZyjAsn73o8IcpuhaFzGVPhJwa
         ffN76LS+srgKxgSI6WBPQsjn29AR5MGs1QfQHbiV86+dkspEBJ/BdOloyikAZw2VHZKI
         ieubeX6ojx0D8MM7g+ZKrHDpcUPD4k0gPXrGPjq9QVoOpAUNTb/AnLOnmxtSMN/4f2HU
         kfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XWVlRXgNg3KN485YsrCfC2VS/J/tzMn6WtNYvblMRac=;
        b=XJ8+t78CtMlKw6rjAWwu5gG8GDJmRykiE9QJ36aYiRtEoIBbzCWTpVk0xSVz0cwpQ4
         zpWDXiMgGXR7n546bDRM6gkNhMXjeicavEU7fDBv7gkduFfk+W1C7Rlla3sk5DsRNXLQ
         6kQI2GraRI2J8XJeBSGPnnYvGF3/qV0WpewvIIO7I1R4O4SnRP3DTGarHAXK4B0uBLjR
         SCa0xXMogPV+onXIdRFhvxt5sgFXPZKK+G6ezfTAaaXF3D7F1QlQt8PB+YakOunYhOdN
         G0/a8LS7R9OT+S47e682PwTNoSstfP3SWgeycf1uaUCrbmGDn2eLKMSOCaj9fI2Ys7qn
         8C1w==
X-Gm-Message-State: AOAM531iFKw30BVjSuQAXK2VT9hDHFZcJyatKBoKEjHeU2pe10dD7lVw
	UQIuXjWbcRPOScHm9Lh6A4ry6IZQcK4=
X-Google-Smtp-Source: ABdhPJwwh3qjZ6PgdotFhnJVpd4kuCaCo+6C0lCjwzsVABXegHrokNzBZEGqPuNMI+UbuaNHnkk9RA==
X-Received: by 2002:a17:906:2a45:: with SMTP id k5mr88288eje.149.1590480762741;
        Tue, 26 May 2020 01:12:42 -0700 (PDT)
Return-Path: <matthias.schoepfer@googlemail.com>
Received: from michelle.fritz.box (p200300f85702e800eba7f57533fa7a37.dip0.t-ipconnect.de. [2003:f8:5702:e800:eba7:f575:33fa:7a37])
        by smtp.gmail.com with ESMTPSA id w10sm16944519eju.106.2020.05.26.01.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 01:12:42 -0700 (PDT)
From: "Matthias Schoepfer" <matthias.schoepfer@googlemail.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Subject: [meta-oe][PATCH 2/4] elfutils: made elfutils-lic "GPLv2 | LGPLv3+"
Date: Tue, 26 May 2020 10:12:31 +0200
Message-Id: <20200526081233.62413-2-matthias.schoepfer@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>

If not set manually to "GPLv2 | LGPLv3+", install of non GPLv3 parts
of elfutils will be prevented in a setup that has

INCOMPATIBLE_LICENSE = "GPLv3 LGPLv3 GPLv3+ LGPLv3+ GPL-3.0 LGPL-3.0 AGPL-3.0"
COPY_LIC_MANIFEST = "1"
COPY_LIC_DIRS = "1"
LICENSE_CREATE_PACKAGE = "1"

set, because during image creation, elfutils-lic will have incompatible
license.

Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
---
 meta/recipes-devtools/elfutils/elfutils_0.179.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.179.bb b/meta/recipes-devtools/elfutils/elfutils_0.179.bb
index 1da95ec1de..ea185abd83 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.179.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.179.bb
@@ -105,6 +105,7 @@ PACKAGES =+ "${PN}-binutils libelf libasm libdw"
 # submit patches."
 LICENSE_${PN}-binutils = "GPLv3+"
 LICENSE_${PN} = "GPLv3+"
+LICENSE_${PN}-lic = "GPLv2 | LGPLv3+"
 LICENSE_libelf = "GPLv2 | LGPLv3+"
 LICENSE_libasm = "GPLv2 | LGPLv3+"
 LICENSE_libdw = "GPLv2 | LGPLv3+"
-- 
2.26.2

