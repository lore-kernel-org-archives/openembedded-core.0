Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3BB226BE2A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 01:15:11 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r25so4982724lfn.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 18:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=mEsNrXoJDGtKi317iSndcU3zg4T6YETc4FNqwTyNEv8=;
	b=vw9CSt2ziFBUdJrjaIzyY6Jl3o/b9i0JIpdSsKwTm/2ZP4WoliWKOebKPvxjy24ilU
	/FfaOSKjaK/NHkdeL1gVgCnVRjGAAKNDYYPBgCSwvEkhT58EUXNoO6Ctz4+A/l7/Es2Z
	F3igj0mGh6nz6J9Y0nFnNZkMmKZxX8el84rOhNekINiCJ/wmXK9e3iKFVffqaSH70yZN
	rmHGBx423vAzmLrDieV1t9Z2D3Hgc4HJ7FR39yRP+GewFpJK4G6Ww+k+7ESlR+xXHtda
	H26kEdKgNkZgRtduH81LUAeyeNGo4+6YghgiTizh2xcK4kDtt446qmH99mcAqHPuVwl1
	zH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mEsNrXoJDGtKi317iSndcU3zg4T6YETc4FNqwTyNEv8=;
	b=Mgn1EwBuayTmio53yy+ml4sSns7MFfB8VQQfXvCzgIWLCXfy6Zr63Ck9RTqCgcYSPH
	xgHfTT13y/t8Xgto8wjPgYNbLTbbu3TkSQ/qZ2/Ntbb7mX7lh2+FO7CbSO3X8ERDzQOF
	qNKrkoTwk7wGtRvee3Na27+6cLuy0aek1GQ21wfgzOYaZAlc/lK9HYOfNd8a2+msV5zL
	YbB8gi2xa/30TynoXgc+ZFhUSPerqV5OzzlwnoDWmYbWnwVRXZMSsTjZJU7euw2B/Aea
	bQNuWU80J8Mg00tUBgU/XdNoSBya6Fr7k+AY9f0HDpE3ZQRq0UXFCplfq6JocaqmbapS
	qBjQ==
X-Gm-Message-State: APjAAAV/IWECnJa0/3gWhg2Fz6Jj8PyWfF77cgpE7rpVesfPHHkyFlKA
	XJL/u1ShBUM965gINp9EpI6SjhWEUS4=
X-Google-Smtp-Source: APXvYqzQsyuuDP/qOPUEFGIrTrAfEkf4xbPvuQT3EcpoP28SWgClgojmaXLCd2Jft5+aFTKQHeo3xw==
X-Received: by 2002:ac2:44a2:: with SMTP id c2mr30618177lfm.155.1554081311443; 
	Sun, 31 Mar 2019 18:15:11 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j27sm1555686lfk.97.2019.03.31.18.15.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 18:15:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 03:15:09 +0200
Message-Id: <20190401011509.8624-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxrandr: update to 1.5.2
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
X-List-Received-Date: Mon, 01 Apr 2019 01:15:11 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libxrandr_1.5.1.bb => libxrandr_1.5.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.5.1.bb => libxrandr_1.5.2.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb
index b90ebc6232..53a8335d64 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb
@@ -19,5 +19,5 @@ XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "28e486f1d491b757173dd85ba34ee884"
-SRC_URI[sha256sum] = "1ff9e7fa0e4adea912b16a5f0cfa7c1d35b0dcda0e216831f7715c8a3abcf51a"
+SRC_URI[md5sum] = "18f3b20d522f45e4dadd34afb5bea048"
+SRC_URI[sha256sum] = "8aea0ebe403d62330bb741ed595b53741acf45033d3bda1792f1d4cc3daee023"
-- 
2.17.1


