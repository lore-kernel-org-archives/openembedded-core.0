Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 80BF57DF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:16 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b18so8029908wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Wpz5yItpWG8G1ChGFCjOdWQEOgjrEYPjWhvr1drR6Qk=;
	b=cciwPaZNC+LUmBTVz30UX6oaMWUWN6lr4b/JlCsarZAISiUSJZvXR7yF4uA3v3JcnE
	6jLk/M183Jn3klEyxAcjvUB1a/TyzlV6x3YqPJ/o7Mej4CGsOiPvEF8aJPwucPprLZoZ
	SSw2YcM4Yq1GMjd4SjpvDnjoEGKP8hP1N/tKlLWQuRFPZzQJwJR3yMtsXxN2IZwDX5is
	MFt8sY9oKtyKUTPqgbcd9lucleUjDZE7p3LC0pAagxnZYbQxOSGnA+bkKTuZ8ho1H2pq
	RMJd6VCx31vGh6wwIlHX31iVr6Ht+hFHzCQqboAUYAmF33HAg4Euz6eEa8844UXWBhrW
	zBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Wpz5yItpWG8G1ChGFCjOdWQEOgjrEYPjWhvr1drR6Qk=;
	b=rW8BAMLTGItlr6URC3+GpJ/w8nZtEVAtJIbmtYnaUiKrMefkDFrLFwF4l//NIjeqFk
	3M8CnB2a03t5LKSTKwLbETb6lu+nKCAfxiTg2TWlOksePtwQnW9Lu7x/HedWrWk3X55i
	sBNhxk56BDCDcGPo+5DgYyTZ4agTKok5ppnMFlwJw1lZYwEegLl8b1uWJZ166/sLMQHC
	RjU/u88GBdFlEB4nv4hMiAIg2Tjc6c+9enXwYrqt23Wz4YlRkXDGHlceKho45Jd+xWNI
	GR40MnnjyoRsk+xrBjfXXB40I8gbmN295b9O9OQUhvtghNcbV6mVThfEaBw9eMCaNUPY
	NqQA==
X-Gm-Message-State: APjAAAVGjGSjUhmO+7As8kt3k+ak/ssqKokGtRW7IhVg+IcHhf8NtlpE
	x/JUdFvdlKQV5cXpmzcGeB7TeIq3
X-Google-Smtp-Source: APXvYqyLmaRo6FWF5vn+WPhweuvFcw79uQThqKDJePsGGJxc+3i19YXW8fXDfuixOKY1nclAs51MJQ==
X-Received: by 2002:a5d:4a44:: with SMTP id v4mr35129754wrs.84.1558116737024; 
	Fri, 17 May 2019 11:12:17 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:35 +0200
Message-Id: <20190517181151.44001-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 21/37] python3-pip: upgrade 19.0.3 -> 19.1.1
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
X-List-Received-Date: Fri, 17 May 2019 18:12:16 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-pip_19.0.3.bb => python3-pip_19.1.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_19.0.3.bb => python3-pip_19.1.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pip_19.0.3.bb b/meta/recipes-devtools/python/python3-pip_19.1.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pip_19.0.3.bb
rename to meta/recipes-devtools/python/python3-pip_19.1.1.bb
index 4fdc7ee244f..baf32f4724e 100644
--- a/meta/recipes-devtools/python/python3-pip_19.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_19.1.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "1c5edb0924a0d7d79f3a2e3df05009b4"
-SRC_URI[sha256sum] = "6e6f197a1abfb45118dbb878b5c859a0edbdd33fd250100bc015b67fded4b9f2"
+SRC_URI[md5sum] = "4fb98a060f21c731d6743b90a714fc73"
+SRC_URI[sha256sum] = "44d3d7d3d30a1eb65c7e5ff1173cdf8f7467850605ac7cc3707b6064bddd0958"
 
 inherit pypi distutils3
 
-- 
2.17.1


