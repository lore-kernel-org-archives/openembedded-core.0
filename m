Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 10D5478297
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:30 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id z6so17943071iob.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UILp/DtFFSe9G4yDi0ApVjLFwMjLbFWxQ8Nx577vi1g=;
	b=K3BkGhT4etD0/FuNTwq53/2lkX8w/HGkfu5EdkAeCazJE4OeQL0L2msgmtAd9Dk03A
	j4rfHkX44DAnB7IHlOCts3wHRdcNk10FfkWLQXjENS7io0DDcQ6v8Xa+TouK5FJS0UxW
	reI619jgP6F5lkr97rpY16MR7i9OlXC5kXkWnxwwbRaaQ2ozDRaHgbsRzDpfKimW11yF
	3hvBbxuN5hbk4Yhg6fOkecORbJNEfFHS2pOli5j63v9RCJLjPH0FKMYzASB0OenPoG3I
	yos0tNqfl8ry4Pk/2f84h04f5aKVhjldL/myCBsA+GJYlt/Y41wMxYpNiKbldbecNcbs
	1nOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UILp/DtFFSe9G4yDi0ApVjLFwMjLbFWxQ8Nx577vi1g=;
	b=MRAIn3Q53vTmeiJDwq4UcZJgxZU+bWxEiaz3n8yek2wuS9vsYusFLRvZIlAn272luU
	S0035GudNDig+yFms8lHDLfD7D8ldNAho+qO+X45Czcwc3Ksz5LNnPKaPNL6y92UpSff
	VQ+859KMA6yOYMIOlGeLAWpqO4UK2cECkyjOkk37f6fRIrbMmtG5bIF/UPd5/8uOyEAF
	16GFHr3LFc/RMQmBoeGHOGGF6eNJ6aroNxDOopc/Thx6X8AG7/PYZ5j6jn9DHHoEp/Hx
	5sJ9zQNRO1gH8rVivLJAa7FB7OSFeTmBhLsSwJyq0vXvPSaPl1dQRHhhHxGdYyVVuFIK
	q3fg==
X-Gm-Message-State: APf1xPDFZylwjMW0mhs6Z7yloh8d17MsUc0eFrfw0rgu3Dd/j222eijt
	1A6Ek/DTJLSLgH0Pcu1H+ybOBhK1
X-Google-Smtp-Source: AH8x226Aguu8XqtKVfP+90QNp2Ja6IhfpllBWKAnkMvAY4VD5ui8ezZSYtiAl5pxupzX/lOF1PxQdw==
X-Received: by 10.107.184.10 with SMTP id i10mr3515359iof.283.1518454351986;
	Mon, 12 Feb 2018 08:52:31 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:31 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:52:05 -0600
Message-Id: <38275d23cf7dd08ad0c84089a423a0eb13cd2d50.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 10/17] icecc-create-env: Add support for nativesdk
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:31 -0000

icecc-create-env can now be built as a nativesdk recipe, allowing the
script to be included as part of an SDK

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../{icecc-create-env-native_0.1.bb => icecc-create-env_0.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/icecc-create-env/{icecc-create-env-native_0.1.bb => icecc-create-env_0.1.bb} (98%)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
similarity index 98%
rename from meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
rename to meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
index f8f4aef3923..053945ebbc6 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
@@ -12,8 +12,6 @@ PR = "r2"
 DEPENDS = ""
 INHIBIT_DEFAULT_DEPS = "1"
 
-inherit native
-
 # This is needed, because otherwise there is dependency loop from quilt-native
 # Dependency loop #1 found:
 #  Task 10907 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_install) (dependent Tasks ['quilt-native, do_compile'])
@@ -34,3 +32,5 @@ do_install() {
     install -d ${D}/${bindir}
     install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.3


