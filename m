Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6A91F719E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 08:51:33 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id y201so43657200qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ZQlSoM6TGas9PA/3NZk1vBO5wlpiCdiOa37LEal4BFE=;
	b=blAQGmDrwfzceUufVeLZzwLTeM+8X1H2W5LB89C5w9GttPowwxO/VOv8JQ+/3vbdLp
	nbXO7h6G0LqoCJVCIJp7rko2TZN2aXY1dKd6WON12XsfHxr16ey+CA3unoDwDQaU7orc
	q0rCYgQs1dsrxK31yuV3Ce6vYkf66prg4V8OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZQlSoM6TGas9PA/3NZk1vBO5wlpiCdiOa37LEal4BFE=;
	b=s2mw6eS4aUIRFNQ+R8YWnFV0ygejiXWEHnwC3vRhRUjf8KpDVz04UUJcgRup7m09FI
	Ax6v8ESxCKDdtUjRTIXRjWYZqCw7+auaMG61Iscgbepzz+pwn3VLpEts3mDgOirCKMhS
	UTp9zWWN80K3byoJKb364/KwBnCSniICibA2uQuYcKt3b+Ef1EgB2dHag0FkEEur9Cz8
	3z0wxhTKZ4kphwqrG6DVAzrSRm+n/kqk7CnIUEbhcGkurTzlVITnW4kFOod0NuILwMD2
	tqOZspyjtNYPvyjUgSZzDZI/kUng+K17s94h7aCuE75Ksre5KKKx+hcXpQmJItVMxJqy
	3xkQ==
X-Gm-Message-State: AODbwcDGDVa64H8QdrJS3/ifZcfLSazOgLrV6eh8n4s0DOEqbLRUtslU
	Bgbc6Tvp8ciKMlUpjkWHCQ==
X-Received: by 10.55.1.79 with SMTP id 76mr15883672qkb.69.1496047894175;
	Mon, 29 May 2017 01:51:34 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8])
	by smtp.gmail.com with ESMTPSA id 8sm5856635qkg.16.2017.05.29.01.51.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 01:51:33 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 10:51:24 +0200
Message-Id: <20170529085124.8881-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] kmscube: upgrade version
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
X-List-Received-Date: Mon, 29 May 2017 08:51:36 -0000

Upgrade to a more recent kmscube commit from git. Tested on DB410c and DB820c
with s/w and h/w codecs (v4l2).

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 518c98e123..0ec5b2a7fa 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm gstreamer1.0 gstreamer1.0-plugins
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "e56980c28766ffb0bf8edee96b529a5b47f97137"
+SRCREV = "0d8de4ce3a03f36af1817f9b0586d132ad2c5d2e"
 SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
2.11.0


