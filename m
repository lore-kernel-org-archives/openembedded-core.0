Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 65B5C71B99
	for <openembedded-core@openembedded.org>;
	Sun, 12 Jan 2020 06:14:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b137so3091832pga.6
	for <openembedded-core@openembedded.org>;
	Sat, 11 Jan 2020 22:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XliIPniO84ZtBu0Uwrcerz8+txIen9T5LsodVx6IZTM=;
	b=bD9PngCIt3qDyRvvMqs9jtSE/8pawHhDdxyl0+0/XDR//PL9h03CqS4JJrMGolG7RV
	WX4iL5F9xNTgculFr6QwZcWb355XfEsfWgsCRedzGLWkjkI0uSndv3xseEGR5t1DyUmG
	LEnNzdc6uXmUwHdVoIqrXdLAKwXFfG8eCpB5QWc9cp3jwxu7aVEPH4ldT9iCbWFQ7Pcq
	GgmiV5BWz3mAr4IaRstUmK6AsOIczNfea+tW6YaV3cCyZOS1Ea6nhLbrL5b77yUv4G60
	m1+E3aFkv6q/v0qDy6noBNcLbSbVJpOwRml5AzKP1SgmVvH4OgJ1IHBuSn3+ytWkfpfr
	mh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XliIPniO84ZtBu0Uwrcerz8+txIen9T5LsodVx6IZTM=;
	b=FJlucvFORwjAVPBUzy9y5xGGCzLw1qLgWrjRfowkviYaEa0cHsx+C6jXKQTA/ywdgl
	stRnxtBURKKPPX9KroWiL3M89a6PlIWvsJcokKiHH3N/C80d5jQ8N+XuKnMCeC+AK23q
	fFgd6UUX4J3fvOkO63/AhP0bdB1dxa3uZP7nJqyqbrb+uZZtKeaR/Puhduke86j8c7s8
	1okgRQzxyCHEwRkSlEw8do2di7jV+h4DgsFsdtTPrXdIVIvUcRJOXLJgDW6vsurqwOkC
	PRywoLhjobeu3gynl1drSUIjYoO/dgJew7mU1FnABfv9gsXF/8Z3+sQrA5w/QKp3Oy4O
	QAyQ==
X-Gm-Message-State: APjAAAXghCDQWf7C5YUPu3GPn2AWDPATUBjLjamCQhENJ2jXFhPfWX2a
	5BwsTPSjdnePHcTB6mqAxaEq+QGC
X-Google-Smtp-Source: APXvYqwNOaFjC3ahXeUTrPjHTFHcdtwhpFTIG+wvrCSQ96wW3ir95re1JsRS4avRKzLrVsUAfgwQmw==
X-Received: by 2002:a63:360a:: with SMTP id d10mr14341553pga.366.1578809699129;
	Sat, 11 Jan 2020 22:14:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:3849:7200:d754:59fc])
	by smtp.gmail.com with ESMTPSA id g8sm8978559pfh.43.2020.01.11.22.14.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 22:14:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sat, 11 Jan 2020 22:14:54 -0800
Message-Id: <20200112061457.10741-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [warrir][PATCH 1/4] popt: fix SRC_URI
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
X-List-Received-Date: Sun, 12 Jan 2020 06:14:58 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

rpm5.org has been down for about a year now. Use linuxfromscratch.org
as an alternative reliable source instead.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9224014da9a512b1b8837e4e7a736d465c97be3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/popt/popt_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 478288f9bf..27e49c2ca2 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -8,7 +8,7 @@ PR = "r3"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
+SRC_URI = "http://anduin.linuxfromscratch.org/BLFS/popt/popt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://popt_fix_for_automake-1.12.patch \
            file://disable_tests.patch \
-- 
2.17.1


