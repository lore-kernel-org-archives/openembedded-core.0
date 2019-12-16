Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 251087FDA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:11 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id k25so3952301pgt.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iGADoFnbYiL0oAbo6YptiMBwUSWQdzjHNQhdT5n4niM=;
	b=Wwew9PUOHIIetwCRJDp0W4hqAFSIwSZKJvJTA/tQ/KKY6FmrywwM9S/EpNoq94KJT3
	tFpw+sIp71KVl4IvbkYVUOPDIOLMulkt8BcsxI+dumllEg7DFHwMt8RVhtC60xUtVU0r
	tvx4llYEyGp0imbcMEf5l57OY+5fD1CYD0RnziLIIUOiovPGz7m2SXPUssHd5Fs8/yN7
	sn0DF+kEVp1XH/iSjou+v0whOOQjKdOJA3ya/RIvw3wjIzT/kbKLiZj4yaNU5Jx40kfh
	84U4mdhOUB7WsRnWbeexFoEqMyasqrp2GGP2gAfEbJ/u3c2IJ09cBSnlBA0yN60uzxKM
	cUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iGADoFnbYiL0oAbo6YptiMBwUSWQdzjHNQhdT5n4niM=;
	b=VKgrgXh0sxUrBLJoW4Mh2kid5l8hIguoRbgt9sZ+H3wuoqIPY6ZtFXzveuhoRUMwJz
	s90zvaqe4WdBmpKKDwlYzRqiMRbqrLVSQZCaHazBfTqRyZ28jYSQZfnnOaycb1rINLzU
	cULGGXPCyOvVPBn1Yjjew6P9vWyTdKp+okyVn+0CSAZ3zoLlQkVk2LmLXRimEcW4ape+
	2A8tPhMxdvDpEP1R+AtTKAX1uPzcEcY20kU2ZkjfvT0Y+8+yz1iPI6dy0lLWHq8ifl8D
	oD0Mt+RciN+SPkNtn/U+Z6ZMt/Cwo2fEOgLM5pQhNhEvoYz3viS8/vQqzfiHLqMLDyLd
	v/CA==
X-Gm-Message-State: APjAAAXGByxfmsZfaFgAbbd1O9ch/A7KbipI6pD3LXPRRVJ+BO9zvXru
	vBJ4PKUx4ZNijL+Oibw/Qg0pP66ijr4=
X-Google-Smtp-Source: APXvYqwFVIlqAU8J8klWl0oOyC3O3fiD2kcgMDZ+qtIfOF93FWf+EfQjWJ0i2X+MhLelzpjpzNoV5A==
X-Received: by 2002:a63:780d:: with SMTP id t13mr18505041pgc.82.1576512011998; 
	Mon, 16 Dec 2019 08:00:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 07:59:51 -0800
Message-Id: <3aead67fc219ab20617a2a0462cba550a08a4455.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 01/18] at-spi2: fix dbus-daemon path
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:11 -0000

From: Jed <jed.openxt@gmail.com>

"dbus_daemon" is supposed to be set to the full dbus-daemon file
path, not just its directory.

Signed-off-by: Jed <jed.openxt@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/at-spi2-core_2.28.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.28.0.bb b/meta/recipes-support/atk/at-spi2-core_2.28.0.bb
index 7975f58..0bdb1e3 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.28.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.28.0.bb
@@ -18,7 +18,7 @@ inherit meson gtk-doc gettext systemd pkgconfig distro_features_check upstream-v
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
-                  -Ddbus_daemon=${bindir}"
+                  -Ddbus_daemon=${bindir}/dbus-daemon"
 
 GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
 GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
-- 
2.7.4


