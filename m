Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.2820.1593155954223037463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lPTdZdcv;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id i14so8354683ejr.9
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6VwviXmk03nlWwGv/p1sCmOcqzsCYbjl4R1OgZ6AqLc=;
        b=lPTdZdcvZ8Rt8ZT2Dl06dWGJMCR/+73xqDs67UQpXe2i7X1KjlesnksKbzia+HsEoR
         Co7NwncrLwf+Fb3Oh/Av3M8Un+4q2pOISIcEP3jzB8O7RInRDzugWWGAIcphNcwAYM/T
         HA+VbyrruUiDSVngCx0TRKUxBPr4U76UDFj3xngZowOcfQcKhz9vS+7Rc6J3R70+8qNN
         9OfixLF9KcL4Mf0SZE4hvAs9eRbYrH+MCRc6FRjDQ863r9q7ttN6NpPfJR1iof6uZEgf
         TTKA1rxLPOhz9s5zRx5EC9qCnKuiy7Dr38Ib+zbr3pMy0GzRcJw3bNby45t1x6RqDM3n
         VM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6VwviXmk03nlWwGv/p1sCmOcqzsCYbjl4R1OgZ6AqLc=;
        b=iDnCuSvDDUQsBHOUusbvHcxVyscCMDY6Q9mZtN0cY86IvCQ+Gdxi0nY+lHoo1IaVEZ
         oe8Zlk3t8kZaCSeOuMrbMYhe5FJbC+Q46DE8S1YBRg4hbim1TPNQuSUm2P0z3PmhSTUf
         q5BFoQsjVbaC3o9KHjMP3hXEk/FBGTfvB3JZopGcLQ6aOyXFds1OcQyaSVDGXtqpexUY
         oBa9MSDI88bkZTJR44QWceVVvXM9nl56F9s+L5xTdM89qU6T0txKNU2ifb+F896REIAy
         e92Za+Y93L6Y0GX3iNHubJvKth0YLRf47KHtZdy6suP7OUuhz3iNdJNuQNGB5dE7FysS
         yhqw==
X-Gm-Message-State: AOAM530aWbZ4mdoBSsOSvPdvbo5F9HTg1tH+XGPW29pJWCMBGTzeLxyg
	NHCG/8HrAsl5qyPm9HgsM2VTGArgnEk=
X-Google-Smtp-Source: ABdhPJx6Q9PiRwIAD1RrzYYu6Mu9LtgD0XBykji9Z+JEBUKix7Ai0c2DR60c0p4pbeczs+x/z0pahQ==
X-Received: by 2002:a17:906:1d5b:: with SMTP id o27mr1376958ejh.344.1593155952606;
        Fri, 26 Jun 2020 00:19:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/30] bison: upgrade 3.6.3 -> 3.6.4
Date: Fri, 26 Jun 2020 09:18:25 +0200
Message-Id: <20200626071844.29134-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/bison/{bison_3.6.3.bb => bison_3.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.6.3.bb => bison_3.6.4.bb} (94%)

diff --git a/meta/recipes-devtools/bison/bison_3.6.3.bb b/meta/recipes-devtools/bison/bison_3.6.4.bb
similarity index 94%
rename from meta/recipes-devtools/bison/bison_3.6.3.bb
rename to meta/recipes-devtools/bison/bison_3.6.4.bb
index 1d0f5995c1..0c877c3c58 100644
--- a/meta/recipes-devtools/bison/bison_3.6.3.bb
+++ b/meta/recipes-devtools/bison/bison_3.6.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            file://0001-bison-fix-the-parallel-build.patch \
            "
-SRC_URI[sha256sum] = "06db793651de9dd5f0a85a6fe4bdbca413c0806bf2432377523da96ca0b4b73d"
+SRC_URI[sha256sum] = "8b13473b31ca7fcf65e5e8a74224368ffd5df19275602a9c9567ba393f18577d"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.27.0

