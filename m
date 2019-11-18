Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F0507F96B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:23 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l17so17291382wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JobdxVctDF/BynbmmbR18/fOpan2G6o/N1VoegFhwNQ=;
	b=qxs9Ar+4blH4pdsmQtRwiH2dMxyKSmekyff1NfFjn5Z7El+LLsjxlPbWVpeHM5Syk/
	PSrWeeTHuHElFIo1j1/9CFI8MAVRfkgj6OgrSzg1jTQ7KaElDQdPmaI6fdJTut4qQFZ2
	qhoCiD5sqtGSYcWtf98ldsL+H04cLj5M1r21lOPCaoiXnJzad4McAT4/xrTlYcYhBVxm
	OKgbAFPB6CM8VO+5JnIP5guD6b2q2hKbQ9ibsS5mYLdyaLNjIWu4m5GNkG/NlV93/eRP
	B+q+OfiUziJCLMDk3A7vJghWVd5cXMw+P3WhOiKrJDTGT8cwctP/7mbxSMu8Dfh1iO26
	C62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JobdxVctDF/BynbmmbR18/fOpan2G6o/N1VoegFhwNQ=;
	b=fLNKQn3oZHyMbZdjezjMRpKVyPwVLeQGYPB3ERvpCVbPu5Vi9+oODCl4SF0kCXlJc/
	a4KM4HNqo0JDIztoNdSWxARW4GSQWyO+IVi4BGUHl50q/kmXepVbUHXMvZipf8llmgfm
	3TaXca4G+NcvaE2JMyiMseEOGuj/Q68vmPe74YHu/L/UKFD+RW9cDjSD2NIox+xixYyi
	5ef5IAdVBRR4yXzu0ybHcgEe8/VH9yJXiPXO/+60E/PiAME1qYo2tioNc8tC+MKXAmPG
	SpOSZEHbg0T5ehSaBZzKZG18d5IUCg4kV3nT7JZIpmNhzRmpbhdCUXe6YmJpUmUX26YO
	tuOw==
X-Gm-Message-State: APjAAAXoqfLUZTfJ0XDR96K2lK1cps3AJtkl/wf3fzvPrSR/x4idgDJ7
	Q3v5/9kkEcwliOKz0e/3XWTBeUjD
X-Google-Smtp-Source: APXvYqy9OPj7XPiKiRSwhmhjZGnORl2qNaY/52RxnOkIewGpxcWt/P2hqSz7Wx7K+/H/aCxdYLUB7A==
X-Received: by 2002:a1c:3b05:: with SMTP id i5mr29859779wma.8.1574082504568;
	Mon, 18 Nov 2019 05:08:24 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:07:53 +0100
Message-Id: <20191118130801.21860-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/13] librepo: upgrade 1.10.6 -> 1.11.0
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
X-List-Received-Date: Mon, 18 Nov 2019 13:08:24 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../librepo/{librepo_1.10.6.bb => librepo_1.11.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/librepo/{librepo_1.10.6.bb => librepo_1.11.0.bb} (93%)

diff --git a/meta/recipes-devtools/librepo/librepo_1.10.6.bb b/meta/recipes-devtools/librepo/librepo_1.11.0.bb
similarity index 93%
rename from meta/recipes-devtools/librepo/librepo_1.10.6.bb
rename to meta/recipes-devtools/librepo/librepo_1.11.0.bb
index cf4de22c474..30c8a5c55d5 100644
--- a/meta/recipes-devtools/librepo/librepo_1.10.6.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.11.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "2ec349f1c686c1704dc83da6c118035ff57c8dea"
+SRCREV = "497f5eb2293662835bed6bdb0f43521788b2cebe"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


