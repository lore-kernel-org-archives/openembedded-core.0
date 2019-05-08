Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5747D8DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 10:13:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r4so11115087wro.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 03:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=acXgx3azNFye29KHeVoFyITuelh4tJSwOaY9bLcTKvc=;
	b=fjAR/Tah2+rnhzST4WA4Xg54oPIB3HinonMu0wu6sm+7pXQXbrBbfjEvSWEhWz9LdC
	Ac97VbfuL4P/KXFaXWOHx6T/PLUf1le6D2Erdc5WfGRrp7bNBt+WTjYHLgTkr3ljFaaC
	+KUYI/5Ao8q6F4rIK2rwBo1y78oF9NoIIRo4IGN4fjG3sI/eBLBXOd3ACNBNPYNj49Ws
	1XJGlsZo+JM+GWl62pOsOc/xsVRE/EffhKIP+P2ECwuF4eGN3Ycw5x9WLSVtSa3fgQDq
	rQ3zz3oVoWI2uu5k4rdxZ8mEoRYlLiJsGKo1RTUKgqlerwyvoi3BwGOgJOvdrZP+k0ou
	yXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=acXgx3azNFye29KHeVoFyITuelh4tJSwOaY9bLcTKvc=;
	b=WqFcw9/NU49dLbEGYZLm2bzFWGBk6VS6YesqZ7qD4kATbDVu/H9sxADWWfotwivutu
	i9smt5a8ub0KBfv3rOpGAFuosP63496d+dKsYzHEgw+jJpKEvjf9kUkEUgH3Bcfslq1P
	8/faUfTBTcspEgKz+/VkNAZS14n+UpbP5d7p8kWx96TBuDsEvZaNuMVArykGq6MLGoAy
	+exVwMrHeCuME4iN99NShFPqzjucVv8QXQfeHpLcaubBLKQd7bBZn53zAYuBPYkRmx4P
	UQdNR43USva3ucdyjfAKNhtgnUPQT90o5E8et+XJE9u8gSfJ38ZpDjzGUoWICTzDmUND
	Mu6g==
X-Gm-Message-State: APjAAAULhq+HoabColvKXaUgMZj6etZQloA08t+6TEIqTOOoRqF5Wcmi
	XVsy4ZIYftRytftU6NRN8T8WhDnh
X-Google-Smtp-Source: APXvYqynUpgWio7YYag5TrggHL44SwOSRxKZZW0M2keSX2b26OA4MNCrOxYuIFVJm+dfIlZ69casZg==
X-Received: by 2002:a5d:4c4d:: with SMTP id n13mr740607wrt.144.1557310414076; 
	Wed, 08 May 2019 03:13:34 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c20sm19088365wre.28.2019.05.08.03.13.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 03:13:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 12:13:23 +0200
Message-Id: <20190508101325.51102-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508101325.51102-1-alex.kanavin@gmail.com>
References: <20190508101325.51102-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/5] qemu: add a gtk+ frontend to target builds
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
X-List-Received-Date: Wed, 08 May 2019 10:13:33 -0000

sdl frontend remains enabled and available.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_4.0.0.bb b/meta/recipes-devtools/qemu/qemu_4.0.0.bb
index 52cb3b8f3dc..72fdcccbdcc 100644
--- a/meta/recipes-devtools/qemu/qemu_4.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.0.0.bb
@@ -14,7 +14,7 @@ do_install_append_class-nativesdk() {
 }
 
 PACKAGECONFIG ??= " \
-    fdt sdl kvm \
+    fdt sdl gtk+ kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
 "
-- 
2.17.1


