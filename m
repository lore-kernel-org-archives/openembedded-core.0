Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id A21ED7C8A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 13:30:07 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v10so19114721qtp.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:organization:content-transfer-encoding;
	bh=WynGaxf0Vi1pIqKMywEDEp6MurccOV1Vx/k8OAJ14mM=;
	b=heo6/S0Bw0UMi32LgTVQfWH6wWnBOEjCNrFpv5l6/owxaMEUSJ+LB9J/zqEJ/pTq11
	AzbSDl1uLLIJo+56WBo017rztg7H2t2svpJiw++GdQ+S+9wAn+KaaCPfJVLwr1HgbD99
	Siq6pP+eduKN4J5lkGJuEPDsacSLorYf3ajprRmkuKXF51ngvZJaZNNhd7rh4sQmT1oW
	greB79piCamD2/txAdSoFUxgl1L9l3X5d+aEWi7q3b3xqFqLF4z6vTqGCC/OWsb5BJeX
	xvQ7NwdIghc3H0tGOmANuEXja8YYXwsQMvPjiCeso0gVN3CbzJ5myDQeW7H8bFVGLDUf
	GC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=WynGaxf0Vi1pIqKMywEDEp6MurccOV1Vx/k8OAJ14mM=;
	b=j57fOUflpRjwWNyOokYjTuiCXwACh1HfPKu6TPQn753Gd0Ke9vXalfLEHVIp7jpclJ
	Mnj2fuzaYI30Ztl6+S20hjGKTWIxqxzgE3wak39y44SiYlYXy5ZFpQfJqNYV8JcqDDV7
	tN2Mo7E2wzvln0UqkfkdeKQHtDizJcb5rO8fpezaAOawt30s2UqjNFNcSfePVU/YqmGL
	wFfQFbLLpWDIqibZ1ByrGi7vHQlN8XxgvnHbXRF74wWSvcQSanaf1JJFgzX21gjAqPO9
	IdwUv48SBj8bDi2M45aOLS8hNfffDQxyrdnKgMOj59bh84qdFKeIEHDaX9wmz1pWh8o3
	sf4w==
X-Gm-Message-State: AHQUAuZnu7Rr8NnbasmjmC23iPDK/btI7868kXUeCKALj6O/JCmao3Jt
	CbG8Px8X41CrUOr1Agj2bP3pVRkQizMjgg==
X-Google-Smtp-Source: AHgI3IZ0qQ1iUutHsI9+RzdosbtKx8AtfFVMGO3zFTihm+0Yy6Sej8PVmOoP2tOnLqFNMqfwiwG6mA==
X-Received: by 2002:ac8:2415:: with SMTP id c21mr16939427qtc.93.1550496608508; 
	Mon, 18 Feb 2019 05:30:08 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	q184sm6751768qkb.23.2019.02.18.05.30.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 05:30:07 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 10:29:48 -0300
Message-Id: <20190218132948.27668-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
References: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 3/3] mesa: Add opengl to native and nativesdk PACKAGECONFIG
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
X-List-Received-Date: Mon, 18 Feb 2019 13:30:08 -0000
Content-Transfer-Encoding: 8bit

Allow the use of opengl for native and nativesdk packages.

Based on https://patchwork.openembedded.org/patch/158748/

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8d3e976481..233de8eb27 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,8 +49,8 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri egl"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri egl"
+PACKAGECONFIG_class-native ?= "gbm dri egl opengl"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
-- 
2.20.1


