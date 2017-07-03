Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF9E71A62
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 21:57:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u23so22887602wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 14:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xNGzPlnE6ZOSnv3+9QMZdCraxIoLPYCE2gUGGHRyuqE=;
	b=W3zf90WM26HktLOXYQeHFGxWrW/Sp+daPVjgoK6D7iZAynnUl9kp6gWye1A62wNl8s
	nML0NIzkP/HyiXgUXWgsWfYfXuabJheT+kV/elf0Pt5MEvXHw9ARdll3wJDFi6xssB5v
	uWpcm4zp6nH22e428u548sSGMD4w1RtuRWy0lvVMayR8JCuIj+tUn2IJekzNLW7O4XZL
	UnkHXxAxrh9SEC2neeNv9p+Gzgv+VDnwyLfoTyPgpqUdvsUYHnYM8qpT4vqMN4obmHrN
	JUo+zjE6DBrhfXR0FSfCixzkFmvZafTdJPUovOh6WqeRAlNA+GtLFisaECVmGjp6N4ph
	8nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xNGzPlnE6ZOSnv3+9QMZdCraxIoLPYCE2gUGGHRyuqE=;
	b=auGmAyA/x+jer2Go1z2xnagvsgGh2GYCMvA4JjSfeXKINr4WVEJZDKaXUtWG4exE6y
	dvEjOuetPfTP1fKBf7GVNzHr9uUSRmjetVvuYTr/+Vfm/lFGC866alb34BPnYVfkFifU
	Wil+wsHL2hMwstNXgxkxhGR+xsIpt4bZu16gG29RcuY2F9ZN9E3xQLK64kYeafFEUYUM
	NNpF/ErfG4ATfdvDEUfhPZ/jkaMVmbdt0onpmpf5Q1H7qY8dcziKmsV8nN+5Wu6d+jsc
	3xJPu6ju5/LOwkhzdIozXH601BnOJ8yI9MbzUkbzKIwXLKUBC+c+WM3d0zm2vzRQSIhq
	yShQ==
X-Gm-Message-State: AIVw112Y/0tkvl9SUmmxPQsXNw5lXJyts+s+45IUe8/SYoJmSRXQWQtO
	xI2WGHORgDOX2/D/GM4=
X-Received: by 10.80.170.26 with SMTP id o26mr9394351edc.164.1499119075356;
	Mon, 03 Jul 2017 14:57:55 -0700 (PDT)
Received: from localhost.localdomain (80-71-134-83.u.parknet.dk.
	[80.71.134.83])
	by smtp.gmail.com with ESMTPSA id g38sm8985515edc.7.2017.07.03.14.57.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 14:57:54 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 23:57:42 +0200
Message-Id: <20170703215744.19096-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170703215744.19096-1-ricardo.ribalda@gmail.com>
References: <20170703215744.19096-1-ricardo.ribalda@gmail.com>
Subject: [PATCH v3 2/4] libgfortran: Add missing dependency gcc-cross
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
X-List-Received-Date: Mon, 03 Jul 2017 21:57:54 -0000

Due to the fact that the recipe uses INHIBIT_DEFAULT_DEPS, we need to
manually add the cross compiler as a dependency.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 4846decbb834..3b94c1b85b70 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -37,7 +37,7 @@ do_install () {
 }
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "gcc-runtime"
+DEPENDS = "gcc-runtime gcc-cross-${TARGET_ARCH}"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
2.11.0


