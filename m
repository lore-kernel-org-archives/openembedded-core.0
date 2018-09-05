Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B918D74C97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:52:39 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 207-v6so8406004wme.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9nDiF3yMBHUh5qnAXhv+jyJBrXlwUmHNpJmIHFZLuUQ=;
	b=K5Y68lj+YaEqyAw0QBL3MeT9v+/sZ+qYpwsXC9Ktgg6BccUivDAHTZEhrrOys6UMeu
	To11iM199ca1/yEL223oJLw+NbXMsbxdI6Cgtc5dHIRQ8MQFMJqxRS1YcUSzykt12uHK
	+VAY0JpiBTvc2UpWN8z0Q1Fovh8DG6NmeBQAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9nDiF3yMBHUh5qnAXhv+jyJBrXlwUmHNpJmIHFZLuUQ=;
	b=XFxi/hfulxFmO/friRl4pcA7rEG2GAbTweY+kjD4xKNb+YsyebKoqGpq4gI2+UVx9M
	aNhBAjQPGCP49d5iM0Qt6QPkMkQ+nYWhQpxQi9Osz/2sHFVtpi96J/Ro0wxC0H0Iqg1G
	pXUbSM4+NV8MolhvQqdMuz5jXnZbojVzpIwd64DNMAygKyZGZW5IPdlS6R4Rz94YlyPy
	DI3DIHDZcP663SzHwJNaB/3MrnJ11AuQYlJE6cOPhAq/ABbbyI/RIjH3hmqkrihjeFC/
	hseW+rDxM+8LG1W9HNyEIKsLED790WI1x1uQPTUO5Dy2eMKKH458okYfZaNnlJBb+s9B
	fV3A==
X-Gm-Message-State: APzg51CssSCxp5x5hvU9yLau6Q/K9Sn569yS9UI+Zw8xqNjfgMB1s/Vy
	QzUxUD2M3Caq5mBvIChtNMwFIgFz1B0=
X-Google-Smtp-Source: ANB0VdbD1+t2ICRSkLrfRiwzSlDcYKC/wkJ3Ge19esqD3LEnEo+JKFpqXqALg1dWm3E7dL6Qn+brfQ==
X-Received: by 2002:a1c:f0a:: with SMTP id 10-v6mr853482wmp.58.1536166360307; 
	Wed, 05 Sep 2018 09:52:40 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u65-v6sm3476169wmd.31.2018.09.05.09.52.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 09:52:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 17:52:27 +0100
Message-Id: <20180905165227.29435-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 8/8] busybox: Sync arch and link locations with coreutils
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
X-List-Received-Date: Wed, 05 Sep 2018 16:52:40 -0000

coreutils installs these into bindir, folllow its lead to avoid postinst
failures when installing coreutils and busybox together.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/busybox/busybox.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index c26ef56bf78..c02e0623e37 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -208,6 +208,10 @@ do_install () {
 	sed -i "s:^/usr/bin/:BINDIR/:" busybox.links*
 	sed -i "s:^/usr/sbin/:SBINDIR/:" busybox.links*
 
+	# Move arch/link to BINDIR to match coreutils
+	sed -i "s:^BASE_BINDIR/arch:BINDIR/arch:" busybox.links*
+	sed -i "s:^BASE_BINDIR/link:BINDIR/link:" busybox.links*
+
 	sed -i "s:^BASE_BINDIR/:${base_bindir}/:" busybox.links*
 	sed -i "s:^BASE_SBINDIR/:${base_sbindir}/:" busybox.links*
 	sed -i "s:^BINDIR/:${bindir}/:" busybox.links*
-- 
2.17.1


