Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3636B7EF28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 00:18:28 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id x25so35807060ljh.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 17:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gvxwiom2Lhi4DN1tu8uDuRx5iXmnFcb8J7K8785UGd4=;
	b=yd3RzZ3iUTIHWzpodE0TaC3RFb7eTckcrA/dGpsmpftB5u39UwK7N6Ieken+2tSkZZ
	S7RfQUjt3tPHGKaYN9r5A8ix6wc89HawP2UpdK6v/7YVzjelKIJa1E9jt4VYc9kgwHEC
	6BzX0ob4V6XpDreV4GGheIpfHXgyGajPkAc6Yk10m9aXNksjYGFYrfcA/HLlhjjgZwS4
	aMLmLbYLgyovXy9RaYNTqXv5YzdVJEOjyCL75JWkYBMvY1NfQ9ndZhwYghp9xZitHVxY
	Gg/+2d4pvBAiFaTU9gH4dfJm4DPvpWFP++5fM+v78atzfhy28DVIU83NPJDGy7sZJjhD
	Bjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gvxwiom2Lhi4DN1tu8uDuRx5iXmnFcb8J7K8785UGd4=;
	b=bQo8Q8CivXLgN2CnePFJEXQt5fPElxs0Kycw2ArZRMsmCQzYLavzCDf+XnZEtnvbVI
	DfwAEKrINMbpf0y/dDH2P9xx977e+trpqlO2mFDDo79E1j+QHsXHwXiURx07fPF+Icuj
	JIl7L3mHUY2on+zg5M49JeUTkEJ8THG6XnnKtToOmzkPzuJynIl9JCCuytoVHw4u7S27
	FhF7Hl46wmeCUaEGpVZmpZt5bQlP6dlv9mmNjXo054hg8hVMVrHtFbd6xc1/KdoWGUbV
	VIGL5VIi6tIToqudyD8r2+GfXydAHAUVqvu5x64DP5lZga2j7MNxrlwQ7ZueD3wRNnE2
	zdsA==
X-Gm-Message-State: APjAAAU2AcgXWFekJgdUguuiUAJ7ysx2droUoGp4mYmaOBnodyND7DIj
	ODXYYgf2do7dLmrjoiT85kVREX7y
X-Google-Smtp-Source: APXvYqzzzpcmx9+pBoHusGNa8znnXt1EnRkKDqAuf8xrx8xRh/7zLIS69DS8wbD/msSNAzmoIkHp9g==
X-Received: by 2002:a2e:8007:: with SMTP id j7mr34788922ljg.191.1563754708539; 
	Sun, 21 Jul 2019 17:18:28 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	d21sm5771826lfc.73.2019.07.21.17.18.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 17:18:28 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 02:18:12 +0200
Message-Id: <20190722001812.14947-6-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 6/6] python3-pbr: update to 5.4.1
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
X-List-Received-Date: Mon, 22 Jul 2019 00:18:28 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python3-pbr_5.4.0.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.4.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.1.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.0.bb b/meta/recipes-devtools/python/python3-pbr_5.4.0.bb
deleted file mode 100644
index 1f1ec3a420..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.4.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[md5sum] = "fcf120102d3e4859d41425638122058c"
-SRC_URI[sha256sum] = "36ebd78196e8c9588c972f5571230a059ff83783fabbbbedecc07be263ccd7e6"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.1.bb b/meta/recipes-devtools/python/python3-pbr_5.4.1.bb
new file mode 100644
index 0000000000..338ac8b707
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.4.1.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[md5sum] = "ab6e26026ab306989a636ec2d50a435a"
+SRC_URI[sha256sum] = "0ca44dc9fd3b04a22297c2a91082d8df2894862e8f4c86a49dac69eae9e85ca0"
-- 
2.17.1


