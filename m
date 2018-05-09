Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C072674B5D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 13:04:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a8so24601044wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Zm4pZcK9mNu4ycaXsxoIjHhCtVNgmo1lOp0AdZ5/lc8=;
	b=E0IlqKaAq5peXLE1M5uZal6/a8uchC2sNhEXzEb6p4U1mkELeGugM5NGpfMNJel6Qs
	rnr84s1YNGG11pCdCBmGLrvSxneBPyJLBkhheXf9D1twEJe1QeJISabjPKpIv2Tzl3kk
	cqu+Z8GoCjONOVfrwE+FuHN1bKZRr19csWyft7L06MrCUuVooByRg8wsutgMjNyWztSg
	tM2OZ3yzttVEnMqriesjE+RxT4hisf1IUt0imqgQjyqWrLLrNu2KePyHLGORo1r5YRrc
	lMQDZNwRSeae2dUWeTOtzcpKZkZDxQMJ6G/LyKa0OXUXyg0L4DK+VQ0LoC3JIvHe5Obn
	qLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Zm4pZcK9mNu4ycaXsxoIjHhCtVNgmo1lOp0AdZ5/lc8=;
	b=LzfDV7dL/ELRCzgazLQCEe2NsSEsRDTmsrkdUmw1FUhIqtvux81nPrjDkWijb5ScHD
	F1sz8KPNbmE4GghbibCxHzJ8w8TmlabCIoThKRscYWZaeaGGIkPwba4ARHKn6thAgIZF
	1IEFvjqwIZitYgv2Me9T+UVzdQliBdWo2JnvPNurrL3JigxfYaHQfk6LV5mXVf2xkFim
	/lL26qBa7pNttxqChGCIllRdAgeAeJTAM0mzzGmD3dwhfjwrjMfDD5gxe03VC41CkxPD
	Mww8rWN7ae44G5eisp6376+5Ed+7bZtJJaGxaR5gZCKzgdzKNYLWU5POFfv98Cp2Jd0F
	i48Q==
X-Gm-Message-State: ALQs6tDPNt40dvYCTE4jdYAXXFhhMFJzHGQSngVrIxPIxmOb4v8pCPnp
	JfOWqSHxPkW3ymzsmRQkg7vBq+UY
X-Google-Smtp-Source: AB8JxZoi/aNuHKAIxg31DK4EiPeqsWxJfzgOXpvCX4/+XzUAQteglDKEEsLdJiCyu2UWEhLlUbFuZQ==
X-Received: by 2002:a1c:8045:: with SMTP id
	b66-v6mr5446599wmd.108.1525871093551; 
	Wed, 09 May 2018 06:04:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k3-v6sm45119857wri.28.2018.05.09.06.04.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 06:04:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 14:04:48 +0100
Message-Id: <20180509130448.1011-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] clutter-gst-3.0: upgrade 3.0.24 -> 3.0.26
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
X-List-Received-Date: Wed, 09 May 2018 13:04:54 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../clutter/{clutter-gst-3.0_3.0.24.bb => clutter-gst-3.0_3.0.26.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.24.bb => clutter-gst-3.0_3.0.26.bb} (58%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.24.bb b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.26.bb
similarity index 58%
rename from meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.24.bb
rename to meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.26.bb
index ca5e0ae4149..8a0dda54274 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.24.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.26.bb
@@ -3,5 +3,5 @@ require clutter-gst-3.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
 
-SRC_URI[archive.md5sum] = "3e145e24bb3c340eeeddafd18efe547d"
-SRC_URI[archive.sha256sum] = "e9f1c87d8f4c47062e952fb8008704f8942cf2d6f290688f3f7d13e83578cc6c"
+SRC_URI[archive.md5sum] = "7809ca6ce9d1a3490597fd4a7375c389"
+SRC_URI[archive.sha256sum] = "d8618a6d9accec0f2a8574c5e1220051f8505fb82b20336c26bdbd482aa6cb3a"
-- 
2.11.0


