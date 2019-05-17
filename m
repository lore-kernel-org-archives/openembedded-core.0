Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B47727DF13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:11:59 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id t5so6235579wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+/hvThw8Q7Sk1Lpt3E0FaG+nIPlginPE/xhswSLUKSQ=;
	b=Mjfuh9ak3ScYmSXO+cTKoX5NfuJIsDpFNc69bgcgh6MgrYtqJOwehmiX9XXgoep83Q
	/8NP9V7sij/W1Ka9/rWuBQov/Zw/qFSBS5mOQQltcc6j5AHJ9IK0jk/dHuCL0Ytg4i3y
	jrepYOT8ICBMzqXIrmpf6RZo2NSvu6GlfyIgd+w92dRC/W/GCJXJm5R30BOX9L6CdZPM
	wGg3nYdzCKBcEFvEB81BaZu3U00YAhG6smlGpvF+jf2bVwhqVQDgPvwPo29JYDt1Ri4l
	91Cgh5lcheSTjbgYOluXSQIlNiBosWdGeIUdLpPIGpk4mMr4ethXR5YtYrboB4W/k5ZG
	jTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+/hvThw8Q7Sk1Lpt3E0FaG+nIPlginPE/xhswSLUKSQ=;
	b=q1qu0kWFwI3KEjRTkzv77DcId8q9+7ERNpTEwLCT/2r2fOWrEcYXFg9ayCRpTH5/pm
	h8ggWCr63j7bx44CdKdWCrKIXAdg2IRjE0zav+Dzzi1EtEA7grNJIA8E3Ma6tcOT8A7S
	Bl8BEvtGR/S77lxy9TiX1wz/uof9GgXxdCXBr1mMlaRXhcb/y2P8OsUyGw9x9TC+ZwGO
	cu1JfEkGwKSbLAx7acLZv7PC2MoEGZiOpinm450lD6P1Otbq2r7TdN1vZ0hCT17OFWNm
	oyhdJ8upUfolmBIGtUP6nzav19NZFmGgEz4P3bdgJTJO6H1DNd9iEecSRGq8Q2Np3MCY
	emEA==
X-Gm-Message-State: APjAAAWihllTQTFQxvwVTTDw5qELDMbX3H1gaiPtjyNS/TzYMgKbAHFP
	MsnHpda/W5qC6SiHMUXv40TEUB9f
X-Google-Smtp-Source: APXvYqymRBe8qicK08EhDjj6rIqhnzbCGPF1uDDqrsNVY/5s/+8CNL2zLED3UEf7xHFta8D7h9ULyA==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr3044663wmh.14.1558116720224;
	Fri, 17 May 2019 11:12:00 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.11.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:11:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:17 +0200
Message-Id: <20190517181151.44001-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/37] createrepo-c: upgrade 0.12.2 -> 0.14.0
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
X-List-Received-Date: Fri, 17 May 2019 18:12:00 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{createrepo-c_0.12.2.bb => createrepo-c_0.14.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.12.2.bb => createrepo-c_0.14.0.bb} (93%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.12.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.0.bb
similarity index 93%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.12.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.14.0.bb
index c70523dca66..2a3007c38df 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.12.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.14.0.bb
@@ -8,11 +8,11 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "5b4c06f6af24633f667da37455281f24a4abd461"
+SRCREV = "8cffea9751b14366a7f6f3664f5d39fe4f0f9253"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
+DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm libmodulemd"
 DEPENDS_append_class-native = " file-replacement-native"
 
 inherit cmake pkgconfig bash-completion distutils3-base
-- 
2.17.1


