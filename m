Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 176937C9BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 16:59:20 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m9so99416qkl.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 08:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=WynGaxf0Vi1pIqKMywEDEp6MurccOV1Vx/k8OAJ14mM=;
	b=s3R2Xf98VIUHH5xlmpdO+olz/WlDqEp2pYz9cHbbg5KfUcjWhhYWbSBJJTmKzwXQ4n
	e5eNUDJYkUddRLlUzRgOos/W083BWMjg3ProZuKu3gE7vYOCbZ5UsT8VYQUIl9kQ0idd
	H6tWoKWFlU5k5yUhRDHDeeZz5PsEgXam1SWxNW1QQSLRS7n0XIVgaYHpkJp7ggtYvYSB
	JYXugLvencfJJ1XMnbVabl85EL+nicAzEK3Zm7veAb/f3b8jGi6Kj7FvwFu+lex+c8Pg
	PFZFgXiDrYEiL5kVqz2pAsVwfWvo9fjDzZvKna8iSL6XUK4W5Q8yMV5UTiR1pNh63sXT
	F2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=WynGaxf0Vi1pIqKMywEDEp6MurccOV1Vx/k8OAJ14mM=;
	b=eM/+UJHT+u8gD5gXHJ+ohN4eTvsmnPlKqAs2unUSIU+rinzlV6ThlH7XrPO+qMG3Jv
	pRQnQhUFhAHyPQ0OAiCceOecIiIVK5RgFvjQF8mwzodIfwCAXmhCAJHYDef52tzshuXe
	RIKKAfaPjtj9S+v3Fspm6Vw1dkjNbOnqR5a5Aw8BMy1p13o7VIPJwz5JSOqW6irKByIM
	pBjFUv8uNlz3gwgUIN/04V9JDazHqO3XZf2uEakfPIB8EN4qvZ3m3xqvyFxjXFYYhlrk
	12kF9VYlKNpMivLwMpb0IxGxV/3JqfDjbp/HkTVAUcTIGnXPKryCmT20wyJLdOvFwXgK
	odkg==
X-Gm-Message-State: AHQUAub+o0hS1Q8MZnHX55Ms7nfMHEH7Vra1Szg4efWK5m4Fs9l27CSv
	bsOKDnVXrd44mXXLGNajcZQ9Ni1r3qr/3w==
X-Google-Smtp-Source: AHgI3IZIxvpiEfLx1141YtqAeMQ/G7xp+peJym3tfSDLA6E/x/GN4cxzgmRXD5r/D4RMcMiZbOGMsg==
X-Received: by 2002:a37:d612:: with SMTP id t18mr21179964qki.215.1550595561924;
	Tue, 19 Feb 2019 08:59:21 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	t20sm2003377qtb.58.2019.02.19.08.59.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 08:59:21 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 13:59:06 -0300
Message-Id: <20190219165906.14377-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
References: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v2 3/3] mesa: Add opengl to native and nativesdk PACKAGECONFIG
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
X-List-Received-Date: Tue, 19 Feb 2019 16:59:21 -0000
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


