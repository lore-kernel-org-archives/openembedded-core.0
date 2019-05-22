Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5039C7E3DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 23:30:05 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id y3so3885349wmm.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 16:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8MDwPsAn2EhwkxTt30NtyJdRSj0lZM972n5Cfz8EpZA=;
	b=GnQm6yJof+XeWxJFG7lCwXVj22zRm/4BiVIONLS7wyIOwFCEFROe/6ghP95DzHxutz
	K800l7CZUugoc7u2NV99m0UzOc2eCDcrIww+9oQaIyG+aGC09sxJB5YTASqhKyhzHRGk
	MEfbef+G79Ik1hSHFDv3HZrX/EFxPw6vMAWobZPB7v3MOVXO3wCEaI9++bRm0HYVdP5G
	FZyZ6xJmYQ9jAVY2iSRYiLqcZRSi3B0hNKwz6Qp1ow+5eXfBWgsEjJR0P5TItawuobOX
	g6XktOscrXCyU+RR7hZKJOoLgcIWkfc3EJIaBrfPakwurXgVbwaVcfYQz+znZXJwCeVq
	LBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8MDwPsAn2EhwkxTt30NtyJdRSj0lZM972n5Cfz8EpZA=;
	b=Gon+XKJp/bKvGXCQA9mCxSiqndK1qYAk4YExi98uAFuEMRD5/ezvPx4jUJADTBGi30
	ApHYYdb7gGFce3qrgzhSoCD+h1hmAI9l4VQmqwoIg6TEihoeXfcoy9qKHfJquFJ0y6cR
	tsHv+tCaQ4iLPRBP+mEzigFb7Y8kwvXDCQl8FbT7poOWZ8HDRDil3+I0/9Q3M/t9N+hg
	TjDmAogDBy0Ddwenl+eN6aNESyAB/dQpqlro+Iim7nBqE9o99ah23Rb2B3oR3ugYU4jd
	xVXKrJJtcoqO7cH4j6X52SJnZDS+3aTXRQ/5gfLqlx/VDfKuUt9EFvUI+myIkw3n9MOz
	qpAA==
X-Gm-Message-State: APjAAAWfmjrXx//zU/DI5NvcTn0KBLx+2TeZK6vm++DjJfO18h4JJ/lU
	Li9ihVnocv4GIIDGw57QdDruDH5Z
X-Google-Smtp-Source: APXvYqzNygl75sox4bp90Htt91P0WcRU5jOBEa0CO63dSK48cdIIRvq1YAftQm0RKdt9x8T4I5j9XA==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr9764715wmi.15.1558567805711;
	Wed, 22 May 2019 16:30:05 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	p17sm9437460wrq.95.2019.05.22.16.30.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 16:30:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 23:30:14 +0000
Message-Id: <20190522233014.25325-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bc: use u-a for bc as well
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
X-List-Received-Date: Wed, 22 May 2019 23:30:05 -0000

* bc can be provided by busybox as well (e.g. if you have your own
  defconfig and forget to explicitly disable it:
  ...
  *
  * Miscellaneous Utilities
  *
  adjtimex (4.7 kb) (ADJTIMEX) [N/y/?] n
  bbconfig (9.7 kb) (BBCONFIG) [N/y/?] n
  bc (45 kb) (BC) [Y/n/?] (NEW) dc (36 kb) (DC) [Y/n/?] y
    Use bc code base for dc (larger, more features) (FEATURE_DC_BIG) [Y] (NEW) y
      Interactive mode (+4kb) (FEATURE_BC_INTERACTIVE) [Y/n/?] (NEW)     Enable bc/dc long options (FEATURE_BC_LONG_OPTIONS) [Y/n] (NEW) beep (2.4 kb) (BEEP) [N/y/?] n
  chat (6.3 kb) (CHAT) [N/y/?] n
  conspy (10 kb) (CONSPY) [N/y/?] n
  ...
  ), causing conflict in u-a:

  update-alternatives: Error: not linking /usr/bin/bc to /bin/busybox.nosuid since /usr/bin/bc exists and is not a link

  and then whole do_rootfs or do_populate_sdk to fail because busybox postinst is failing:

  do_populate_sdk: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
  then please place them into pkg_postinst_ontarget_${PN} (). Deferring to first boot via 'exit 1' is no longer supported.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/bc/bc_1.07.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index e80857745e..809b864c1a 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -27,7 +27,7 @@ do_compile_prepend() {
     cp -f ${WORKDIR}/libmath.h ${B}/bc/libmath.h
 }
 
-ALTERNATIVE_${PN} = "dc"
+ALTERNATIVE_${PN} = "bc dc"
 ALTERNATIVE_PRIORITY = "100"
 
-BBCLASSEXTEND = "native"
\ No newline at end of file
+BBCLASSEXTEND = "native"
-- 
2.17.1


