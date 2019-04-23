Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 60A3D7D2D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:19:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 10so853501wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HDJF5WnWCHpeyilKsTW9uly+DcplRO9aavvO0OecsF8=;
	b=K8ouKTB6DJZ2I/ItC5A6pz/M/KzpykvJfOeo08JR3qaD7QQPku/Vq6ZzwlCP5AAR/w
	ozDD5EyrFMavFEPqUVSNYN7ORtRHLSFcMkytDw18v8ITeupx4xPiTwqGv86t0ZG+uL0+
	jeVxfyZwkVZ9bEziCS40mbAtNedhb3vvmB6yaBVQ1FEMvRNel4MmFi/4u6nhyV80g53O
	htCKVvSKUQKj0jQO5caedVQ0hw67WmqxwEjcse/ZfwPToGYXZMrUjyoyCIbrS13LjNPL
	eoEgLi/H5RWJfiBjxY64WY3S0mz0eji3q47Rl39D2OgNzszAXM9j4RKJ9h9auaf5OBa/
	YViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HDJF5WnWCHpeyilKsTW9uly+DcplRO9aavvO0OecsF8=;
	b=WvvTNY1q1NMNHfnBppgIIMhID3Pen7ueGG+zOQAASufQpAQirxQh5QqMHCJzNwktA5
	3hYCGPPMPJ+4JCFxkdmzLrua4HaJkxImt50GXHjIALRVLf+uOSdD3sb+QDrIJnmuHG9U
	vWpA9hqbX2VIBxBEpKDuxfcPTDITMcMhaMIHrcAotwo+z5NxEiEEiHUb8QGu62Un7TOH
	J+/PqpKApKwdkWIUPuYrXIMoQA373jNHTclMsXrHer1J2YI+RhcoGV7//XR2oQHLAsQR
	GqQ2pXv6dqi/4/WPe3B4C7d+t7ro7SWyESO2QKuyDoWv7QRT4hK8RF0Jyro5ZH00omuk
	QsMg==
X-Gm-Message-State: APjAAAVZZitjHZ2OgPXpnnWKgHJl1GvuRxcP/nKd0yHMxB4FBVrwwYUc
	iqzJd7udcIB4UC1rfC8f28qliFlfLtI=
X-Google-Smtp-Source: APXvYqwR+If7WL7WjPyAa3dQknfc/gxJoMbYkIb1IvJZe7IjCSY5dQlB/x80I1lw0Cz+SfI6UXubHQ==
X-Received: by 2002:a05:600c:2153:: with SMTP id
	v19mr630379wml.112.1556036369112; 
	Tue, 23 Apr 2019 09:19:29 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t76sm22599142wmt.8.2019.04.23.09.19.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:19:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 18:19:12 +0200
Message-Id: <20190423161916.25572-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423161916.25572-1-alex.kanavin@gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/9] python-setuptools: update to 41.0.1
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
X-List-Received-Date: Tue, 23 Apr 2019 16:19:28 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-setuptools.inc            | 4 ++--
 ...ython-setuptools_40.8.0.bb => python-setuptools_41.0.1.bb} | 0
 ...hon3-setuptools_40.8.0.bb => python3-setuptools_41.0.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_40.8.0.bb => python-setuptools_41.0.1.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_40.8.0.bb => python3-setuptools_41.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 9092d7ad03a..357aa07086a 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -10,8 +10,8 @@ inherit pypi
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI[md5sum] = "712697a5bc975cf479d487cd68206c20"
-SRC_URI[sha256sum] = "6e4eec90337e849ade7103723b9a99631c1f0d19990d6e8412dc42f5ae8b304d"
+SRC_URI[md5sum] = "6404ca798bb9a9073aff3b91b2df35c8"
+SRC_URI[sha256sum] = "a222d126f5471598053c9a77f4b5d4f26eaa1f150ad6e01dcf1a42e185d05613"
 
 DEPENDS += "${PYTHON_PN}"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_40.8.0.bb b/meta/recipes-devtools/python/python-setuptools_41.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_40.8.0.bb
rename to meta/recipes-devtools/python/python-setuptools_41.0.1.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_40.8.0.bb b/meta/recipes-devtools/python/python3-setuptools_41.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_40.8.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_41.0.1.bb
-- 
2.17.1


