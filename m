Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 45E3D78262
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:34 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id n206so7272803itg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lq5hYnNWIIsWf9VqX5ddFyh9UvY+TFocxJCqE55QWz4=;
	b=I9OESPZJOmR47rLmWEHPJU0ndAOdLPGSoSD7zsuQCe1AnawDOofY5mo2Vam7do/s42
	5eGou8M5BnR9JQsSwh3YiDnjCsHdeBaq7ywIZWadm863Bn9b7RAUjSU4WwS9a/cxgeXF
	ndyhPhVEgg4+JPJnhxvw7jD66qyZV7jE3zXDI7jxtyTLOXknYUkjE+oP9keNviL3m7zK
	+o41iwi53xS/7HJ4XJDPRb3J8Crk6Txp6ICpb11auoLjPL8Dw5W0oegeIX2mdY6t0X+g
	dKCOBPM0SL/wyirohAO0IUDv4Bogo3NwSXXNPwBexgbTEGiUdUjCJDiHBgaIG07q940K
	odDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lq5hYnNWIIsWf9VqX5ddFyh9UvY+TFocxJCqE55QWz4=;
	b=HK0newdeVZY2KtHHhQ2lHSzo9BDds2zFcNezfDbwQK1Z06ld6uz5Clh557IA9jadAS
	tNbesMam7WAQxdSy/wtJa8OjQwI0SCHTUN9A++i0VEug5tuLoeyMxOD/lg+XVWaE/7R+
	+t18pgfX/pmnlJdSXnx20Xx2azg7GdZg87NkZlcT0Rw4YIFm3o6XrfWgFQDyhuMvLx/p
	zz9Wj92rU0rhI6o040q9dIo+BJ9uNcHFTeLyEmd5QGBydI11/qNbqeKh9yWXqv38OeFV
	K5Ei9Lu4vvQvIjcmcIsSbGB2xfB61TdxJJLbx8AxmasaKOoIuLaQNCpWZoagGSm+X4jG
	fClA==
X-Gm-Message-State: APf1xPCsZKuEGEOb2iNrwUXW9N0h4nAfYICQL6VspBizMpbEK5leBLB8
	DqMWaLzJj3REzBciaBGrJtqTM64y
X-Google-Smtp-Source: AH8x224KMVSZvgR1P+c6nLcLehraox/eiYHkma/UJ7AI+ejmpq/dwXUbFdSsQ9+pD32kVH5ol8hz5w==
X-Received: by 10.36.214.131 with SMTP id o125mr6488378itg.0.1518454355333;
	Mon, 12 Feb 2018 08:52:35 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:34 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:52:09 -0600
Message-Id: <b6003d1e4a53cc6f22609639ccfff5559873cccb.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 14/17] icecc.bbclass: Add Icecream support to SDK
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:34 -0000

If icecc is inherited, generated SDKs will automatically have optional
support for compiling using the Icecream distributed compiler

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 9d5eaed57ce..8492ece60c3 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -346,3 +346,10 @@ do_compile_kernelmodules_prepend() {
 do_install_prepend() {
     set_icecc_env
 }
+
+# IceCream is not (currently) supported in the extensible SDK
+ICECC_SDK_HOST_TASK = "nativesdk-icecc-toolchain"
+ICECC_SDK_HOST_TASK_task-populate-sdk-ext = ""
+
+# Add the toolchain scripts to the SDK
+TOOLCHAIN_HOST_TASK_append = " ${ICECC_SDK_HOST_TASK}"
-- 
2.14.3


