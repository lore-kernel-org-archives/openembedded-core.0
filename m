Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8B92978650
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 03:27:34 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 17so2286619pfw.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 19:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ivfTfNk0dewXpE6/QxsH4XG9P/7CQ6dmsDylpmSrldI=;
	b=Zc3U5saFhnuC6ueVu+A5ECkIo7enAtgv1baXQicdail1P0wUn5OqT2rNGg6lgzR9MO
	4+QOOJtNgOU/Eyl00i60n7KHzh59rs3zZOgvOe3vJW54jCwUd6gYP+NkYZNzuWO96pTL
	jthlB6GGG74SUeIx2mNOq9GsafjDYLrYvCkjI54VX5uYCWPHCJtvPShHQCvO1jwfxkw0
	+JGSBPs+BoPYuDSkJxTzfTr2rSpwrvN5IrGZyro5MSDKigkGuf7vjfrCwDuyMtAkhBXt
	XkLGEuM5lb4g21f2xJ0TcJdvpVIYdTWVKotOjPy9/ogMn57RsEcU8K21qfFDuHMubue+
	NFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ivfTfNk0dewXpE6/QxsH4XG9P/7CQ6dmsDylpmSrldI=;
	b=OAfPRikh0Yi11zwnTLcfTHRAM0qjNJtw8XknZP9E/bH+1LeYOhk/JWS185x3YW6Hk+
	dsTEF4WBjR/CixFIykQZhbLE1lwAD8BPCmV8Q+eO1d/Dga6/QuYTDxuSsRdD/dLR49lj
	+/2e64fkCSSU9Ytal2Fb4q6f1p1Y8HcGROZ72ap/lcEKlWTAykwDlpTXq6yc+ujD/Lbk
	D0eJLbxdNyoIWsRECCroh+5POgzf4533rYQePjhTNR4GHQke4LVF9rxh0Xq01Nua4dVo
	6UaWthJ4C05mgoxTq9Z23bILePnKRPb74PbkD+twQ3qCD02oscTd+0+ez08b0lx5WF6u
	rdeA==
X-Gm-Message-State: AKwxytdM2FfTiNdksF4SEKXrm9iejUrWG2oxnwKcwgjDOXO53DRXvdIs
	EYuO6PEm+qrtLL4k1WaiMDwJ1w==
X-Google-Smtp-Source: AH8x226w5r3mAgSyiQvpY3X0Ff0KcNQj3YyLXfUnf1bMxJFY+QV7qJZSxnRdlBQuBOC831yqgmmAcg==
X-Received: by 2002:a17:902:624:: with SMTP id
	33-v6mr20113586plg.327.1517196455783; 
	Sun, 28 Jan 2018 19:27:35 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	y5sm29184689pfd.163.2018.01.28.19.27.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jan 2018 19:27:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jan 2018 19:27:18 -0800
Message-Id: <1738903d1af876c493371ac28dab36d1c2dcf978.1517196242.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517196242.git.raj.khem@gmail.com>
References: <cover.1517196242.git.raj.khem@gmail.com>
Subject: [PATCH 7/8] musl: Update to latest master
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
X-List-Received-Date: Mon, 29 Jan 2018 03:27:34 -0000

The changes are
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=4000b0107ddd7fe733fa31d4f078c6fcd35851d6..628cf979b249fa76a80962e2eefe05073216a4db

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 04ce5bbb1b..8b2cb4d49d 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "4000b0107ddd7fe733fa31d4f078c6fcd35851d6"
+SRCREV = "628cf979b249fa76a80962e2eefe05073216a4db"
 
 PV = "1.1.18+git${SRCPV}"
 
-- 
2.16.1


