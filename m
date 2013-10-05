Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3146CC42
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:17 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so2299434eae.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mzvgrku4HSyipfM54HfaF0fnG0phBQi24J1yHsNo0BY=;
	b=AKX5n6MkTtrDJ7jwRb9J7jdXL523fSxE7Mrm43+jEDFUriq0Ad/vLy3crz8pVdwHxC
	YSO/dfN2e7vuE0L/zl76yyQqeAB+zfxdGxPhx5NLtlG/4bOmwF06qqu3honZS8OcXw0+
	lqEvv63azuCTiVVlAAqkssr/X22aZCyZfB3Kp1lJh1IfkUMvYNXt4jF05Gp5Ys0ohnqK
	W5o7vNkBW8n4llH8oKO1fCbPeyO5uWvP1T7o8Nx5yRopqNrxvs5XeNOyOd+TmWkBoeRy
	JdIN4ZUiZr28x+8B2ZJGuLacpyKpGKj59djdU4LZm5Esz9MuqShQEBHyMzPwvXkADsJe
	J5FQ==
X-Received: by 10.14.4.1 with SMTP id 1mr30696650eei.21.1380975798770;
	Sat, 05 Oct 2013 05:23:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm39201052eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:09 +0200
Message-Id: <8563aef04b44a264c305074a6628ac203b2f2185.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 12/14] lame: Add dependency on ncurses
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:17 -0000

* it's autodetected and configure doesn't allow to explicitly disable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/lame/lame_3.99.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/lame/lame_3.99.5.bb b/meta/recipes-multimedia/lame/lame_3.99.5.bb
index 764fcc1..978636a 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.5.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.5.bb
@@ -5,6 +5,8 @@ SECTION = "console/utils"
 LICENSE = "LGPLv2+"
 LICENSE_FLAGS = "commercial"
 
+DEPENDS = "ncurses"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
                     file://include/lame.h;beginline=1;endline=20;md5=a2258182c593c398d15a48262130a92b \
 "
-- 
1.8.3.2


