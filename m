Return-Path: <kergoth@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0DEC260762
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 22:58:06 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id qs7so39599632wjc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 14:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rWgzvWrFgpoUuwG4a9zl8WtaNcPBvY/siew0eapvceU=;
	b=dnGDMlSplv55svQDMvHd42CK9Sc/cjdz49KUXUO0LZtRX19ynITYs2wIl8fdTmv6CQ
	S7bQWqDofWMTjIiXsRBU0a1hu2UVpNaUmKnjnpWBD8U9kBsAa7vnX4X+yJttQ13TEdSs
	ZXE4rURSW/R/xMalVPMZYrCh7gP+crSXC87OuS81vcWJRi5qEjy027RWmly/Tk3uTHKd
	Fwgi9Mb8OaW5B1An4tAQEs822Eyvq1fy3S0k5BsnEkxVvPcyDQde/uE4hPT29rifzYmV
	yjHhX4zqkKKxQ1HqrOxk8l3hwwXhRMbhVlhADUxcKnqgPi8nvWwynw/pPVdYoxrfS0NM
	IQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rWgzvWrFgpoUuwG4a9zl8WtaNcPBvY/siew0eapvceU=;
	b=FhCSYLgfSbWsnhVD9witj9ylQdt47qwjtXnOf0Q4PhKhAZH0p7189wvUQvZsH7iGjU
	2k2glknMgyXvSQF9pl7Z9irDscMZGy/sHjdbiKrEJi1keVIK9gfS3mD8F/jH4g1rgn++
	mbb2n9mn8oPuE7p3iUjvDI1ZWCkvV3rrLPmQze7sK21fgp65EQ1Kat9ymtmNq8N70LT5
	1+Q5fwTci6IwvI9+G10YzcKAjsuT9Wlv67hzfT73cIU1V+ZtAwNU5A52eMCiGztGc170
	7nnKVffaUWfFUS7W2dEbdiiAUrXgFF66zVlDc4Rbt/AQmq0XrCfna8pXLCjk/xkdQqE9
	Qo3g==
X-Gm-Message-State: AIkVDXLlgQZa6ThbvinIIHIIlxgHOvORrNYFqQQZkLE+LsxCC7fMq2MA5W+Aq6PpGd/Jxw==
X-Received: by 10.194.242.101 with SMTP id wp5mr58851573wjc.11.1483570686090; 
	Wed, 04 Jan 2017 14:58:06 -0800 (PST)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id 6sm100453855wjt.5.2017.01.04.14.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jan 2017 14:58:05 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 15:57:52 -0700
Message-Id: <0f858d235ef2116b29251f6e471abdb62490532d.1483570577.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483570577.git.chris_larson@mentor.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/6] libglu: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 04 Jan 2017 22:58:06 -0000

From: Christopher Larson <chris_larson@mentor.com>

This requires libgl, and mesa requires the opengl distro feature.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-graphics/mesa/libglu_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/libglu_9.0.0.bb b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
index 010998d..8b94613 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
@@ -24,7 +24,7 @@ DEPENDS = "virtual/libgl"
 inherit autotools pkgconfig distro_features_check
 
 # Requires libGL.so which is provided by mesa when x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 # Remove the mesa-glu dependency in mesa-glu-dev, as mesa-glu is empty
 RDEPENDS_${PN}-dev = ""
-- 
2.8.0


