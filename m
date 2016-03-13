Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9584F7316B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:14:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n205so11550072wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ze9e0jHTUpKYRw9yPvUQlND1vwC9nUFCuLzkSN4c0U8=;
	b=xp/lWcAM1WkJGJLG+rD9BillOSB9o0maAhJRE1j8NJmJ+ciZjTa84KkxozILqcXc/0
	EgJQ8b2j9VGDP6LTg9H01iqy+DFnjKdA1TkugFKcEZSbm8PEXSaQPYjpMV3B6lUnCnwI
	wyY1UUJvrowc+Jg0Jd9nym4dkbgXvkpVZ6HIQPq7byz6VqNyiol8uWkRRtOGmInru+ca
	yQj321s/aqK7YMhAsE80GZqb66MitnFn4WdIjThCbj3DnYg5zPImJNcEx6V0e1gQ2YJQ
	qsQhuDJFPoiZB2PO6ju1IFYZQxIivvC2vR1V0I85nXdwri1/+fJHe7vkFu14WKJsEN5f
	WqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ze9e0jHTUpKYRw9yPvUQlND1vwC9nUFCuLzkSN4c0U8=;
	b=dvfCqGwNPGF4HYLvwgDD4bjjCGP7zq1U6RR/RDbMOq0SkdGwJT778j614ywSdNqt/u
	LKJHkkJt51TjCr6U+/XEgcAFH4GA/MWUxBn4Dj6WQw8e3DvPlkb9BZ7IiKHyS+OyVmdP
	8e6swR169jj2nvm5wWM980Cghd/HFuPwbcIsKcRvpEfgh49WUf8wwYpx0EG9NsVW9egO
	Pzo/yBcKu2nO4ZgNSyjcmI59UmQNmlUPeF8DnqrZpYTgM7P1P+R3e99ZYFM5Zbk7Czpw
	fXKCGADrIjW+bIxGrbDWXBU2gVCc2h3aj0ikY+SscGycQSTxMs9Y9x/OpUz5R0vfyOmw
	wlLg==
X-Gm-Message-State: AD7BkJJ73sHXvxpTTmM5YMYSuenVwdTo8PFpt7AzngVwwYFv5wXO8h6ipY2pRLUFKoW4lQ==
X-Received: by 10.28.229.132 with SMTP id c126mr13244309wmh.72.1457896500212; 
	Sun, 13 Mar 2016 12:15:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.14.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:14:59 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:18 +0100
Message-Id: <2c9ef810b05914422da0744780063265f1f2a5a2.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 20/42] util-linux: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:00 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 08ca040..f3c5685 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -54,7 +54,7 @@ PACKAGECONFIG_class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'p
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
 
 # Respect the systemd feature for uuidd
-PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/, --without-systemd --without-systemdsystemunitdir,systemd"
+PACKAGECONFIG[systemd] = "--with-systemd --with-systemdsystemunitdir=${systemd_system_unitdir}/, --without-systemd --without-systemdsystemunitdir,systemd"
 
 # Build setpriv requires libcap-ng
 PACKAGECONFIG[libcap-ng] = "--enable-setpriv,--disable-setpriv,libcap-ng,"
-- 
2.7.1


