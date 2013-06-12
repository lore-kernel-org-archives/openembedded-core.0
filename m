Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 46D0E6AA99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:47 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so7287362eaj.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=SGub7vw2yafG17tcRHuodFKQ33pjec9juky2R1e15wA=;
	b=hQNxFEC4WqbgNzZxlLLbNKmzqMJmiu83b0E6uO6pL0eeyCR+5MZpdQEmOucMUT36tJ
	GvepMzUDHW1HeyVZ4No0rWWT88XIN/RXwyNeYisr29YJN7/fUTcIPX5mXLIy6Z7o2pDI
	7lQAe4VhNeoKm8tIWGs292kkcZPEI/GVnc3u6mOOrGZ2cGTTGx3PCKkz8Klewv1t0I+R
	lWuUmBcXClpHGQjqyo+zh8TtLFmaLCunB06t3uvTao6txGpL//cAZBvn6Zyl74zmCZZc
	FLK525jbKN2NeuBjbEQK7+NzIyIO7+bDOpzmLQwdoMW53RA6ydA4eVFgw1TdrCPFc4Jx
	fA+Q==
X-Received: by 10.14.241.136 with SMTP id g8mr10690668eer.104.1371079187931;
	Wed, 12 Jun 2013 16:19:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	s8sm39812648eeo.4.2013.06.12.16.19.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:19:59 +0200
Message-Id: <6dae54526e4e378c57f8c3ba92a61ddd31ed7ab0.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
References: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/10] mesa: remove more .la files
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9d59166..a210415 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -71,6 +71,9 @@ do_install_append () {
 
     # Drivers never need libtool .la files
     rm -f ${D}${libdir}/dri/*.la
+    rm -f ${D}${libdir}/egl/*.la
+    rm -f ${D}${libdir}/gallium-pipe/*.la
+    rm -f ${D}${libdir}/gbm/*.la
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
-- 
1.8.2.1


