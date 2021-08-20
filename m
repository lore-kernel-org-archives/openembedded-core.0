Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.80530.1629437259414399719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 22:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kabih4id;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id y11so7623070pfl.13
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 22:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X5bZp2HGFMsYyNo4yYpBtJAIBWZVyZ/aiUCBbRwI7gM=;
        b=Kabih4idXJPYYVLOFVZjuiwKyfi0YK+T/HUZDMtEveAwtlmQYt/K4znVbYyga4jjAh
         9ppj+w1ehDHpzb4Lv1xz7/Ub6oz6Y8LuGtMLf4jgemN0JvQJmEPO6IQl62Ch3QO9Ub2I
         zGTpP4B8Icu1BmVMyPsN+SVQtZSwFgFThuw9UNou7LKS+AOjd4edMsN0ttmcNwWrnSsN
         VAGaB9gEzZ41apBkGUmh2BiIx/43EyG2rT1oJuS3alfwzddR0v5fAx2MbXcTxio25aAr
         GDvj55qp5DVcIVgK8ynXvD1J+Vg82ETgvH0FZPi12dsAoKsqRakKDsztZjVfPx3hlGVm
         bcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X5bZp2HGFMsYyNo4yYpBtJAIBWZVyZ/aiUCBbRwI7gM=;
        b=QilKba7TUf/iR7z1ZeYkjWafeu4NNWZBiqd0NJSW13juVJQKmSklFA+v/PSSZSxQCt
         9WN5jeNpuLyhC8Q2roJfBhku6NEACeEdXuDD57Rrz9RLkmXJ3lUGmBoax2GVa4DhvR8r
         4vGCxSVuEnpN8b+C7BXkd20EHUNOIontaUUssnisa8d5gCBNPNbAHcYIVyXHTS/8zYnm
         WQHsAzxnp/efLnG6UQsMQtByughiC9x95LocvLp/d7toqn2Tyzl6FcG0P1vZMdfX2bRl
         LG84CEzHDE38RbJiaQSDNmJSg0pnJ7VX7pBFcx5QHMH20giOfSIQwUHfMlxcYadFAokq
         chvA==
X-Gm-Message-State: AOAM530huFgnnE3aSAEzIhstG8RgpHd/odO28xhIwYADAKnxj4zYaQJ4
	58HsjPTieoDCjuYz/xDilUQHFVfHNnnRtA==
X-Google-Smtp-Source: ABdhPJzb6fBV/jdI3tM0sGorkY8zNs31EgXueY24PBXlPmABu3l1ei2dzHCjatEhbITSbCvD1WoDwg==
X-Received: by 2002:a63:4b24:: with SMTP id y36mr17040067pga.230.1629437258668;
        Thu, 19 Aug 2021 22:27:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ff71:9627:ab75:ea06])
        by smtp.gmail.com with ESMTPSA id c7sm3642131pjc.31.2021.08.19.22.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 22:27:38 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 7/7] gnupg: upgrade 2.2.26 -> 2.2.27
Date: Thu, 19 Aug 2021 22:27:32 -0700
Message-Id: <20210820052732.2606-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820052732.2606-1-akuster808@gmail.com>
References: <20210820052732.2606-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 90798e892fd3e0d2ef77a7ba64a33ea9f8ef317b)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33a997a80a56fba4138780fadda231ae4fd751ea)
[gnupg 2.2 is an LTS release so this series are all bug fixes.
https://lists.gnupg.org/pipermail/gnupg-announce/2021q1/000452.html]
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/gnupg/{gnupg_2.2.26.bb => gnupg_2.2.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.26.bb => gnupg_2.2.27.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.26.bb b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.2.26.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.27.bb
index e2b03a520f..1181c8341b 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.26.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.27.bb
@@ -25,7 +25,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "517569e6c9fad22175df16be5900f94c991c41e53612db63c14493e814cfff6d"
+SRC_URI[sha256sum] = "34e60009014ea16402069136e0a5f63d9b65f90096244975db5cea74b3d02399"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1

