Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id AF71860B05
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:07:42 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so6771983wgg.19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I6GIr5F4E/RTKYAdCqJH/fx/dRTxn3XeUJxVfGYiqAo=;
	b=eTIpsoQ5o01EV/KRHb/mdP+sEcrZpHaMldEGVeY+M9Jova2TVoZfrjC6nRa6kTNAJY
	/Q2P+CLWETnfGjMQnVDxX74Y2loKrsbFzCsBXO7NHCKcfbRFX0u8vk6hBzW7y4PJrsd1
	yptBCi4QyYtC/JgSCEIwrddtnFgrra+KvjPkx0x24gDwxlww10hSi9gtvO+LZcimc7jW
	zzZ8B5Q+Zw/vgyqcjUd5LavEFYMBZ2WzhHJ1pr7HdBCIkAUpcmjBBCDjCa/FblUlrjD1
	Afv++wFrqRXUDU2Yqdjn04t0hoOxcsol1kjHpxiiabAnPG7WYkhXs0Q5Q7fvR/1UnUzz
	qHbQ==
X-Received: by 10.180.212.12 with SMTP id ng12mr11944079wic.9.1407600463955;
	Sat, 09 Aug 2014 09:07:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm25524436wjr.22.2014.08.09.09.07.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:07:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:03 +0200
Message-Id: <1407600483-31215-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 8/8] guile: add dependency on ncurses and readline
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
X-List-Received-Date: Sat, 09 Aug 2014 16:07:44 -0000

* fixes floating dependency:
  guile/guile/latest lost dependency on  ncurses-libncurses readline

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/guile/guile_2.0.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index d19460a..5b1e061 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "aed0a4a6db4e310cbdfeb3613fa6f86fddc91ef624c1e3f8937a6304c6
 inherit autotools gettext pkgconfig texinfo
 BBCLASSEXTEND = "native"
 
-DEPENDS = "libunistring bdwgc gmp libtool libffi"
+DEPENDS = "libunistring bdwgc gmp libtool libffi ncurses readline"
 # add guile-native only to the target recipe's DEPENDS
 DEPENDS_append_class-target = " guile-native libatomics-ops"
 
-- 
2.0.4


