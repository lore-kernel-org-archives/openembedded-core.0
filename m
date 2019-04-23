Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6BFD27D10D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:19:31 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q16so822313wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MqxQn+BUm3Yae2VYWLu3NNVu/ynL3FV5uMlsYaz0muU=;
	b=A6qIdihrfbac8TPleQ4VJq76+hdZPxYRwachkDFUNRnq8KKySxzwzPdi6SdTIALhyb
	fDgjhFvk0te9mr586CW661ERS0BAS9TNgJFWWglD2Y6KeBqbMnTjvglqfa6ahm8Ey8P7
	QCtXmiZDtxpYlpa0uaOXxp+f6xDDwOyxMJ+uxysmwsTov+v3ITqDw/WdARtTowRcxMVT
	kE1ui8JufDLQ3zn9PD/YL9sT5K+uvL02LCBpU28OTeI5JSidRoFhj1ybYpBWy8XH4QoK
	UO8ACAxSwEnyCAblQQqeGZZb3AUv1Q3iPO25K4UuOdG16iTbfJ4TQTbR5QduCQBH9o2L
	p4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MqxQn+BUm3Yae2VYWLu3NNVu/ynL3FV5uMlsYaz0muU=;
	b=TSwp4lYWU3H4Oiw++4KRmkK1MEvtkhGHfEL7BFNpkV++VmWm3SniCEAdpU3kgIz7yg
	PdBdPsZUq9GNvqC1njEv+abFC0KDpRPZnmGe8w/c3B1rmQMp9Pe8WWGy1q3vXUgCcG6Q
	qxMHeQaB7MkUx++fQpQHIi8khw8vgJ38Je1z0oPrUEK90LiZ/NBXlD22I+TIPiUDfTJu
	BBiG28NvJ1OmCbgV+AwfsjT+4PCAkxnG9q6CxHSVlzHPzY4qgUDXBxi8tbI11oO9FAbj
	LiLR1NQVWRwNVklFw9B8s+5zwxxvzkfCKHgxdYCRUdzVfMBj99yZ+q8bLhu487WQMbx/
	bIBg==
X-Gm-Message-State: APjAAAWZezR2oz5W31u25cPhOouByLul4Qizr9aoGRGveQ8tuR1CBbj+
	uRW8aDgByzvIVjw7jB+Nj6wBhNNzXgo=
X-Google-Smtp-Source: APXvYqwZNd7naWojPA901HIAdEq/cKRpghG3/gTLCCwfIB0qO9SZjR0IrjgVGWXr0VXcXE1SgPrmbQ==
X-Received: by 2002:a7b:c14c:: with SMTP id z12mr2947804wmi.138.1556036371904; 
	Tue, 23 Apr 2019 09:19:31 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t76sm22599142wmt.8.2019.04.23.09.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:19:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 18:19:15 +0200
Message-Id: <20190423161916.25572-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423161916.25572-1-alex.kanavin@gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
Subject: [PATCH 8/9] python3-pip: update to 19.0.3
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
X-List-Received-Date: Tue, 23 Apr 2019 16:19:31 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../python/{python3-pip_19.0.2.bb => python3-pip_19.0.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_19.0.2.bb => python3-pip_19.0.3.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-pip_19.0.2.bb b/meta/recipes-devtools/python/python3-pip_19.0.3.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-pip_19.0.2.bb
rename to meta/recipes-devtools/python/python3-pip_19.0.3.bb
index d81a60caa2b..4fdc7ee244f 100644
--- a/meta/recipes-devtools/python/python3-pip_19.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_19.0.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "526fd9ec1e6ea956b3571ebfb42cf83c"
-SRC_URI[sha256sum] = "f851133f8b58283fa50d8c78675eb88d4ff4cde29b6c41205cd938b06338e0e5"
+SRC_URI[md5sum] = "1c5edb0924a0d7d79f3a2e3df05009b4"
+SRC_URI[sha256sum] = "6e6f197a1abfb45118dbb878b5c859a0edbdd33fd250100bc015b67fded4b9f2"
 
 inherit pypi distutils3
 
-- 
2.17.1


