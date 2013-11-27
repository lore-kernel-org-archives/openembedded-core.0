Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id C65E66DE8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:07:21 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id w62so1510126wes.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7DvPiBjK/mxe4ERD5XGX2nwELCAIK13x7E/MXPnrCao=;
	b=DPwJFOjDsjHrBGJv53oAXnY/qn6al/bxBmPH4XLmfjR7oLfrbgm7I7pIR1qIiA8A+8
	52Gygy+Wl41AR21t/BvKbMAlri17LE5kMsVQoBX4Cl6NPsHY6fSlMTQgi22ovMTtzkpo
	YtWFQWKUuIAoFeH1IGYV+PS0YeZVRvOimf1J1H6sbI8TiB/PIVqp7S7obMK1wq+DUuSa
	RVrIy2jP0QZkRCrnY92hM8Gb9ZXMv9viLAViaT7wAq3gJHSJGQRO1/0zA+SCKev8I+P8
	7nUh2Anu/dDYMRwuLCpWcsatfQPWg7l11fl37j7DlRQlr55u7TC+ZZfSVTMuDWk36efW
	bnFw==
X-Received: by 10.180.37.201 with SMTP id a9mr3198016wik.18.1385575641078;
	Wed, 27 Nov 2013 10:07:21 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id w1sm37430090wib.6.2013.11.27.10.07.19
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 10:07:20 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 11:07:04 -0700
Message-Id: <9aca3423e88a05b533b1d61eb21b3c040df0b269.1385575572.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/7] cairo: add/use packageconfig for valgrind support
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
X-List-Received-Date: Wed, 27 Nov 2013 18:07:22 -0000

From: Christopher Larson <chris_larson@mentor.com>

It was currently autodetecting.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 2149997..5212f8b 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -16,6 +16,7 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
 PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
 PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
+PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
 BBCLASSEXTEND = "native"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
-- 
1.8.3.4


