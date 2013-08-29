Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 51E606BF13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:15 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so347664eak.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mzvgrku4HSyipfM54HfaF0fnG0phBQi24J1yHsNo0BY=;
	b=gZ4hJoF8EziiEKKfLzYg/dryORIKAiiFCbevCOtsvFS8b89p4BJTZbB6Rb1gWUmNc5
	ugIIXCRwcBu/kHZ9G+YjyfGNaWu3e/GTR4zXEgEPwPJHveff1aM19TjVJPdhxw9QHiMc
	c9KTo/bnuun+V5VD+34qvw8Xd5cbjhRGnwUEf7BHQB18G9HEnmGx/zUs8fjMeVCwXHH+
	AfF+vt9kaXziMeBGgTl6B0Azem2oraRtCCz9HMTanUvpa/r1YtK+zdTc8i5BwVf1V1N2
	Vz/bJv03Scfw0sBaeUHQ6uLAk54WLNp2RzqEpLcvbtqJy/raF2CZz+TEt/F2uo72OVX0
	t2YA==
X-Received: by 10.14.22.68 with SMTP id s44mr4163566ees.74.1377792135765;
	Thu, 29 Aug 2013 09:02:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm47281513eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:03:03 +0200
Message-Id: <b9d2b395c0170d413eb20c686e7dc19d58b41800.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 16/20] lame: Add dependency on ncurses
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:15 -0000

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


