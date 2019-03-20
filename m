Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE576069C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 23:06:10 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id q3so3488312edg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 16:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=NCYxv3+v8XJ0CiDV3H1l4JEh4zQcoOBDcwhTnV5HcQk=;
	b=1zS6csKNEXBWGEIhDzXDiZWU4R9VbDzSMOXQf5JkohY9aqbYK12xrFqnb35B7sG5SO
	x/S1cVjJGCO+mkU85rmnQru4RORPvYumH/Q1TkHdZMvju1qUVDY3zzVJ0ZSFnyrIvm47
	dY3okkVEodUQKyS4+MetXv+s32Kiajo15H65tREjKIjP7IzkChk/tjepebjCAAZlJfU5
	zUeckirS6cOkEcA4m34PG5mcGRpd2vJbYk9QaiJ204wt5j5zlpgayWmbTBCYRBP690vn
	uHmvhs5YMEVMoFgJw6En5cAWijZ3FUGbn98vWHoYYLBUGQpzIStn5ceVjP6PMtjoc68P
	gNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NCYxv3+v8XJ0CiDV3H1l4JEh4zQcoOBDcwhTnV5HcQk=;
	b=gcB95uMKNNUJqYDBPkvKsWZbHWh2dSgapXQorWX73STKbPyILAnWGrrJ/sBijgsqPz
	dKlzLRTQA5B0YQGFIfCPhboHCy+pkFmdEdFmJHbjLP4D3dZoxgL98teTGyABwPebdzvp
	ERHbcvwztHVnNfL/brv2Gg8oPp6jfjGbG8ELtxC/yoEbyPzB8NxxeM0OAhnEkcaLgrOw
	YVUBtWObAi40rlZ6vTTk3KUlz1olTAFLcjrE5L5QICWz3sdLPOiLjkvoy2zEDG/xtZam
	sSUHWUsCwmo87KgBRd2ff+zMb/F1Q+LIv5f1o9ybeKeF56QZc+3meWH41QDduG8yY2oi
	A3lQ==
X-Gm-Message-State: APjAAAV4hOcMT5SNR+bIrDIOD9x8Ivtp3BrtESYDD9S2XhamUHLIo8gB
	mxjwkSKitlOlrQK5+kvpOn+pWhgpsao=
X-Google-Smtp-Source: APXvYqwVG1al7Qn1Lse/QI1ZnrFDdlJ9nfOhxz0uUvVIR4aD8IsHpFdGvBNXplAqfYGNvEQo/ew62A==
X-Received: by 2002:a17:906:d1d0:: with SMTP id
	bs16mr400734ejb.18.1553123171450; 
	Wed, 20 Mar 2019 16:06:11 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id m5sm684104ejk.8.2019.03.20.16.06.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Mar 2019 16:06:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 00:05:57 +0100
Message-Id: <20190320230557.7094-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ninja: upate to 1.9.0
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
X-List-Received-Date: Wed, 20 Mar 2019 23:06:11 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb} (92%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.8.2.bb b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
similarity index 92%
rename from meta/recipes-devtools/ninja/ninja_1.8.2.bb
rename to meta/recipes-devtools/ninja/ninja_1.9.0.bb
index c6fcfef3dd..5c4f87cf93 100644
--- a/meta/recipes-devtools/ninja/ninja_1.8.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "253e94c1fa511704baeb61cf69995bbf09ba435e"
+SRCREV = "b25c08bda4949192c69cea4cee057887341a2ffc"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.17.1


