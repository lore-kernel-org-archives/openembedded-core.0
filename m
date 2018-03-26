Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id DABE27876D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:29 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u2so1308409pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+a4o3Co3C6M2ptuunGksxltBcJgT/YBg6RuaTkKb0ww=;
	b=DB1HIJ2lYKQRDXTARgRMBsVVl+1+sKNHQr8qODSwnU5vnGRY6rTX7zb3Ujo/3ru5p7
	bHpj8HX7sxQdJkD0Ev8k7jegaPMzJBskVFKTsAtvwV6+4IZqS6wsmNBzv07unnX+4wIX
	4zlhEBB0WkvblPnTnFsFf1yIFIqA0vv6ejGvUj/TnME87mUBvYYlkOoTT+vLNff3zqc2
	+hemFyl5+QXIv9Du5T5ko3LIlcRxeoMxF8i8Wm3qul/u1Qn2QSyenN+tSHKT+36WWIT5
	+0eA34OJJY/+j7cia96ok3IJdqNt4e8+ASzqPxxVHA09xUQvfyw04r2hqenGtQ+JbZvV
	I9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+a4o3Co3C6M2ptuunGksxltBcJgT/YBg6RuaTkKb0ww=;
	b=gwe1km8ZbY+eO+em3OYu0o4JOHz8/iVO9dt638KbeBXNyjND8nDIBehe/mkyCnAxlS
	v12mmkUObwjaTFB3xyqpVAgW94O3Y/XRs8E4b5cV3HPfanfZdTpz+NDod/rzk4m2pw8r
	4dsmQuL0GwahsCo4CfaNN90VNydbdO6GnooLFkXlBH3VuLy80etp47e+JezmtdRtJe7u
	ML/k02rshr8Tczans5+b++v1cCAVm6lvhHaynn5XzNCz2A7BEsXjXgkeOylqM+y323EP
	m9/14t8eIV3DPlt2DVcKXyb01310kmUeWbcmQOhpG/O1JNZPADXq3wcwKMl3tko/45li
	/HFw==
X-Gm-Message-State: AElRT7HJyMI0OeiuGu99MuaMEafpsWQZ4jE8sOIDJMDAfCUUgsZXR1cm
	a6cMQ1CFnY5JrXc3OJEvPtlaag==
X-Google-Smtp-Source: AIpwx4+ZbRpp5Wo26gl1jETWGTGVPMY9iywdmeatts78MwsBrV6FGSG8NYNoU6M/eCqUHnyWZjVP3g==
X-Received: by 10.98.238.3 with SMTP id e3mr2751269pfi.88.1522074691045;
	Mon, 26 Mar 2018 07:31:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:18 -0700
Message-Id: <cf44b71e0c214b7fc5a18384a2c89e073cdb9b25.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 15/21] mkfontscale: update to 1.1.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2018 14:31:30 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-app/{mkfontscale_1.1.2.bb => mkfontscale_1.1.3.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.2.bb => mkfontscale_1.1.3.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
index 31cf186..88c88f1 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.3.bb
@@ -14,5 +14,5 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e0d129d05305176d1a790e0ac1acb7f"
 
-SRC_URI[md5sum] = "9bdd6ebfa62b1bbd474906ac86a40fd8"
-SRC_URI[sha256sum] = "8c6d5228af885477b9aec60ca6f172578e7d2de42234357af62fb00439453f20"
+SRC_URI[md5sum] = "987c438e79f5ddb84a9c5726a1610819"
+SRC_URI[sha256sum] = "1e98df69ee5f4542d711e140e1d93e2c3f2775407ccbb7849110d52b91782a6a"
-- 
2.7.4


