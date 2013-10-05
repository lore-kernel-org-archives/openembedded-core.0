Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 61EC260FA7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:05 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so2262235eae.38
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=d7nzo6a+mCp5/6b+3geN/W6wu5fpeG3/j5L6dzYhUi0=;
	b=reCzJO5lFmAPmghnt0KJ7ex2vRxNrJSHFhCRoEfQUP9El9jc9f42i8itbQlAt7moRv
	AV/WjiC8L7J6quMp1Sw/Era3FxBMPSJf11LCHtvhOHqNojU0YWEtQgIHNCY8B1CPZlem
	D3MhAvKWkgxnwP5H6ac+bvKYrtTU+SegjfKJQe5JpdyV2tGHKMtn9ILW6kzobC1SB3o7
	R/oXdNgFa0t/jMsvTCc1kX384OZSians006XRKeW6EMvFZEJye3j2+JRHIZGKwYfzbu3
	L2l80RRyQvXqQaM8HXLDEyuoTnTW51NfoYciAcsmiTJdFYljPdkck6IVqqIu4uH86bWS
	gu+Q==
X-Received: by 10.14.107.68 with SMTP id n44mr30770966eeg.26.1380975786983;
	Sat, 05 Oct 2013 05:23:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	v8sm39197829eeo.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:22:58 +0200
Message-Id: <c7924d4b8353b3d6093c836347fefbc7eef361cc.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 01/14] gstreamer1.0-libav: Add PACKAGECONFIG for orc
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index c77a085..3d996bc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -17,6 +17,7 @@ PACKAGECONFIG ??= " "
 PACKAGECONFIG[libav] = "--with-system-libav,,libav"
 PACKAGECONFIG[lgpl]  = "--enable-lgpl,,"
 PACKAGECONFIG[yasm]  = "--enable-yasm,--disable-yasm,yasm-native"
+PACKAGECONFIG[orc]  = "--enable-orc,--disable-orc,orc"
 
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
-- 
1.8.3.2


