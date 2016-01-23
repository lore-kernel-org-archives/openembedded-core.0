Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8F47708E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 01:26:29 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id a20so3848219pag.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=weNE2FNc2jRKlhiEu5oD50KkuUeEaV1eD61K7+tRJuo=;
	b=YJO+0cdO2+cD1g7ktE9kJ6rErihTYNlwsusmv62ufi7Izoz1SVJ0kzvi2kxyCepZsD
	kSb1OaKYJsiXxp6Fb2ajV5TH8a1lb58O9mPhNWBL7YfrtD7FhItuAhRbmVTvTPprwvjz
	pRhzsR5bfmtsw+WPBKi3Y/+OUN0mmBvzubCj1TR1vWUQDPjSWglr1Sf5Vug8QbAVPzSf
	TJgnQDeH1DTrY1PDazuXK/hdvms9DFQisPTu+6QNlNKQW0lDxdssoCRqVlL4ugQqJxen
	KlfhL/L/0rs/Je+bHZWjEgLfYxToAZKOMHwEh7mKhRgVIW+TU4QqFEO1Ce1zMc5xGlEk
	7zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=weNE2FNc2jRKlhiEu5oD50KkuUeEaV1eD61K7+tRJuo=;
	b=bOy7G+nx5gD/gX5muulqzQMGVLA8weS8K4+FnXqBQVyfx6d3VOlCCyHE/AW5FitqSZ
	nK4RH+gzaVS5Xrq3BBxrlf853u0Ao0DP6DPFwvvvkbQC/4MwxmN0bAjPxXtVPZW9k0m8
	UOExloHrbDRm9OcX9+TJ88G7wV8chwbr1iVk1vAvxi0BjvBJeeJlfBHwjG2FY/EegqHo
	YU3Drm7Esrh6s2X00JOAPxq4QhmwUWunZTzsKFxJvLLy9H0Psiw1l9x/REmZIDS9k1kP
	z0YcKrYfynQzmjvth2FR9KyhLTD52RwiD3jkQ0LNIQ2bc1uHQzEMFLdlPLVaP8Kty4DC
	zasw==
X-Gm-Message-State: AG10YORoDKhdgVcXVDpQ2offWm9LKCiKyp/TYlBxzuJX1EQkvf95Q9si+YIIVpb7wcJKNg==
X-Received: by 10.66.158.129 with SMTP id wu1mr8743413pab.146.1453512390525;
	Fri, 22 Jan 2016 17:26:30 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	qz9sm12302299pab.39.2016.01.22.17.26.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 17:26:29 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 17:26:04 -0800
Message-Id: <1453512366-11405-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
References: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/7] sqlite3.inc: add PACKAGECONFIG to support building against libedit
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
X-List-Received-Date: Sat, 23 Jan 2016 01:26:29 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 87cdf26..5bff33b 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -22,12 +22,12 @@ inherit autotools pkgconfig
 PACKAGECONFIG ?= ""
 PACKAGECONFIG_class-native = ""
 
+PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses"
 
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-threadsafe \
-    --disable-editline \
     --disable-static-shell \
 "
 
-- 
1.9.1


