Return-Path: <kergoth@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 139DF60762
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 22:58:03 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id kp2so77206582wjc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 14:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tfwPedIqQDPaYdpP/JV56onwnJ5+EZ+NV1gT9Q2lK20=;
	b=u9ypFJvfIKu0XO/k5KTSIYldARMIeJ63hcitocqGT3A1Or4GMdVbSY2sfEJyrRfK/8
	dNypk01KcOxgzfD+QfZ3ZqEw/Eybh656pDZK11lpA9KAtEqJXeBiYmw90tL7C7m+A0yC
	XXV/U7D+ZKzVel29ld1xOR0AzP68AvQv/a+Do6aRGLI89U+h0zsBHnWZjIQpiIZ7RdZt
	2xVdX/KXrmq4JPQoKi6h8znpSAskgDdregO9I2NNQ8Sc1bxhSwUQOuMTVHTy15g89xe/
	YnafYgK8DI4+yimerHqPK0bxBvVI2XAMEzJk9xhJfYhG7z7XnGhaqgrnSuC4YtgiLnnw
	5jwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tfwPedIqQDPaYdpP/JV56onwnJ5+EZ+NV1gT9Q2lK20=;
	b=EOU8lBYOo4pUmsu9VFHRIGR/FlxvHByQYRIfmwCAwxRM0YDdxZmxZZx8Kq4hxdA042
	yIGJQwIY0Ibr3KWA9dPwLZOhyVlvuC4Qjo7yu0S1qcMyAUmlYUXp7WOKGX8tpNecf9m2
	7NqcZNSz3txy8ASQmYDCfcNRK2ecgwcjlpXoPOtvvd/KwTSLAbf3+3o8bb7Itp/yOu/c
	Oqq0K2+DEWdW8FDDWCm/6HOz1O/ZfKGFwp7MDE13kComWmBPOc9qOjcIGAXFUkEgmKeV
	XoHs2r/Kc5hb6iM63s0kB1OydT3eSVS7ZPU7vG0noc5NCcMf8Q7REjT6kPuCAjHMu7PJ
	zcog==
X-Gm-Message-State: AIkVDXIAaqlSuD1Rbes9XySiE98eXJ4qYP9znWUepGFgAKvJhla2JfNm5/663R54kmFBaQ==
X-Received: by 10.194.86.104 with SMTP id o8mr58070972wjz.196.1483570683972;
	Wed, 04 Jan 2017 14:58:03 -0800 (PST)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id 6sm100453855wjt.5.2017.01.04.14.58.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jan 2017 14:58:03 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 15:57:51 -0700
Message-Id: <c8db947eae994b012ce7e44737f39f5ae67fd3ec.1483570577.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483570577.git.chris_larson@mentor.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/6] piglit: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 04 Jan 2017 22:58:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

This recipe depend on virtual/libgl, whose providers require the opengl distro
feature.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 82adcde..b9cdce8 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -22,6 +22,9 @@ inherit cmake python3native distro_features_check bash-completion
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
+# depends on virtual/libgl
+REQUIRED_DISTRO_FEATURES += "opengl"
+
 # The built scripts go into the temporary directory according to tempfile
 # (typically /tmp) which can race if multiple builds happen on the same machine,
 # so tell it to use a directory in ${B} to avoid overwriting.
-- 
2.8.0


