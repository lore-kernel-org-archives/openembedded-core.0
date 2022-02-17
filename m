Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFE9C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:04 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.1803.1645114204102782627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UzRHsXMe;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a23so8465925eju.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BAK4u0ep1Ef2eCNwMT+jqp6ClPPBuV8TveuF/PqikFw=;
        b=UzRHsXMeqjFeeUuxqxeK3FEUFRN5XHpazEgAYT1IBmnc+kNqihONmXQwF60i+6vQwq
         lZ6jWGrcDtY6mj1cmKqAJtMuv++hDTYHlQb4R56Ni4GvVR0wwDvARxk93+lj+P7QOmKG
         aGLvniSZK0OklNagb/MOsIrHpjLESRuYFCFvxjs3M3uuVLe+RTXyLHKmdMzKiVkABvC3
         mFHGc0akSg4dZt8XxsGZMldzcW76lgpyID7emqd7ebfAh7YCLPDqPKkP6r4hFWbDenhy
         Et1909LZf4IT248/vMj1OZbbWSY+N9kmM3w4/ztaggBLpyFAJhO+ku6G7YtJicFV/ME7
         ZwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BAK4u0ep1Ef2eCNwMT+jqp6ClPPBuV8TveuF/PqikFw=;
        b=YAxW/2RzBlYpuyErQQxDpy3/Y77F8p4yFVyLQBEB7+VKYGBm+gTV6NRQNVpuH7xqEs
         tEJ7GyFbOZlT7XVgdd/6k1528SIQnYK3dbfpVnqFQDH7RgDNkllIfmdv4VVjUcSszGGy
         sLgsvlPev820FgrEbDFgjBHHt4r3SDYnnQsPMRA8PTp5C/Ny+kJIeKO+Pu22aj00j84j
         MU3wuBSmn/GU1JwbQ6329zMrCbkqRdZkv4pRksgIOTbJSoFnD4TrDC6x5HPQJJz2riZK
         KBdSd7p7ftkoPSnXn8If9uGUfbSyCfiDGFnJgCTd/Atkk+z4YB+3OEoVaxhsSC12D6u0
         c9lg==
X-Gm-Message-State: AOAM5308qi2dmcdyJM+NAm2+h+ciyTt7tjKNRZMGl5aLky4G2Sy26LrD
	SSnRkhxOly/J5byxGQkm3PX7/PubccM=
X-Google-Smtp-Source: 
 ABdhPJyCh+fwPECiaMcwxowehEDEa1jsvzSlYOcY4lo7MPyxhhEVdTzrYsMZCvcz9sTp6rojeTIu+g==
X-Received: by 2002:a17:906:6848:b0:6cf:6273:9c47 with SMTP id
 a8-20020a170906684800b006cf62739c47mr2997688ejs.1.1645114202707;
        Thu, 17 Feb 2022 08:10:02 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/28] python3-tomli: upgrade 2.0.0 -> 2.0.1
Date: Thu, 17 Feb 2022 17:09:25 +0100
Message-Id: <20220217160939.1424397-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161831

From: Alexander Kanavin <alex.kanavin@gmail.com>

sources moved to src/tomli

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-tomli_2.0.0.bb => python3-tomli_2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-tomli_2.0.0.bb => python3-tomli_2.0.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-tomli_2.0.0.bb b/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-tomli_2.0.0.bb
rename to meta/recipes-devtools/python/python3-tomli_2.0.1.bb
index aa23ad856d..c3d51282c2 100644
--- a/meta/recipes-devtools/python/python3-tomli_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-tomli_2.0.1.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c292c34f58502a1eb2bbb9f5bbc9a5ebc37bee10ffb8c2d6bbdfa8eb13cc14e1"
+SRC_URI[sha256sum] = "de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f"
 
 do_configure:prepend() {
 cat > ${S}/setup.py <<-EOF
 from setuptools import setup
-setup(name="tomli", version="${PV}", packages=["tomli"], package_data={"": ["*"]})
+setup(name="tomli", version="${PV}", packages=["tomli"], package_dir={'tomli': 'src/tomli'}, package_data={"": ["*"]})
 EOF
 }
 
-- 
2.20.1


