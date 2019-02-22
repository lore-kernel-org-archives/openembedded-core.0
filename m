Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 546147CBCF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:09:49 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a15so1195829qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=MeK+OZPQkojOWJq5pdB1BuFDg6QoB9akeKk/46QtY5I=;
	b=XIrwzZMXKHUFRrQr5ZOEEMoj4/aJ2CbMrW+qIYeaYly6I6ouxhuUOydNVzFSEmjkJ3
	7pDU9oy64yyU7r3ZKxGAWO9aBJymsRcwbmhfhSi6+vEOtiM95pqZDf+3ChN2XX45Le2c
	4al210wXym52NHUGagwChJf6uF+Yr/K/lLElDhk2amZ7XqHLpRvuNf8akuJQ90m/ZbPM
	tj1TnQ6FfsgnceglUTs3Neyl+OtF3NCUBaGQsdZ6xzIUaN//A0s9b0/eUlvj37swt+kw
	NJxHiZwXy8w9PqfBMzyWyNONaVpqvPcx/RUcrJR+Eo0NAFbdC4FErD60WnTv47XIDdQX
	BPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=MeK+OZPQkojOWJq5pdB1BuFDg6QoB9akeKk/46QtY5I=;
	b=DOnIuGCyI11gqvNY7BgJzK3T3pPS0oqWaiKR+K5cJgFuNICdqso7+HSU+JAqv2ZOYl
	/yA0Hnjnb7P0IRFYVteSyuDaJJAdilemqI0sR0tNYeCS0DA1oFC6YSuEmmFJqApNqbht
	TGQjwkwlrzw6DEdptIAk+oY3LQ9lpfYeXMP7gqgAKFosIVZJhvBEZc2BnQ+ZpiPNfT2W
	wXQ5gDghng9Sq6nKc24748g28U4zUcxeHtzj1OrMwgUU6svrA6TiFd5o7mcU3qOjoZTK
	f1LWCuh5zmlYaC0EyczNqLHe6lCT1csaHB0LwBQy+xqG+UgcjmilGUm+SBJIj22yCwum
	klBA==
X-Gm-Message-State: AHQUAuaE9kG3PBv8LbHMdZxanGQsjCN3yb9IG3BZmIuO6jC+dPmKWhxE
	txHOt9tUTyDg6vnl0AbVIDZu1jyPz4Ml9g==
X-Google-Smtp-Source: AHgI3Iapg/4fX9V0brW6tZ6V3npJkijaO+dJSZuhvyt0QOkaAj0crBgHDDm1CqGBiQgOBZJ9uurb+A==
X-Received: by 2002:a37:4bd7:: with SMTP id y206mr3136013qka.167.1550844590089;
	Fri, 22 Feb 2019 06:09:50 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id e65sm842867qtb.51.2019.02.22.06.09.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:09:49 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 11:09:31 -0300
Message-Id: <20190222140931.13247-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222140931.13247-1-fabio.berton@ossystems.com.br>
References: <20190222140931.13247-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v5 3/3] mesa: Add opengl to native and nativesdk PACKAGECONFIG
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
X-List-Received-Date: Fri, 22 Feb 2019 14:09:49 -0000
Content-Transfer-Encoding: 8bit

Allow the use of opengl for native and nativesdk packages.

Based on https://patchwork.openembedded.org/patch/158748/

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b2c6395a31..59e8a204c7 100644
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


