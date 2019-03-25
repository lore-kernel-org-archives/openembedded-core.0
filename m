Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 83FAC7D121
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 23:44:26 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k3so3634018pga.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 16:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sfMywbliWlogk57JEOJH7iLac/p5AFgmKcd0eTaWwCc=;
	b=EKONx8nA5R/TojYGNmt9d1iCWZW6PiiW6SJD8myvSpVCCey3uV/7AEbmYhFE8ASuAS
	NnW3pFjTO3ohyWkct242u9UDAC8tKkGrORWIfuh2HkLO3/Oyq0NLtya6dmOaqC6XVNfr
	N209Dyx3ClEcppN4UuG0iQ447aFS3CLJ+g6ENXgddQ9M/Y+pqlwk3CS6KcQHDnizg3PK
	Vhd4r5xs7s+T6GwmY7bdf7GrtmmIYTViV55l1zBTbTcG/fmo8iu6ioag05WherwSkwTM
	1RNpMVT7LN0cCOD5EyO6kih5HSt323OCDzHZZdIBAkhYxY05uSBoJzAw6q4QnQsKcZAf
	VRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sfMywbliWlogk57JEOJH7iLac/p5AFgmKcd0eTaWwCc=;
	b=ru7vnN8r51wThVkcmO1Cpp216Hje1eCPrHjxxnsAqRqV2Xppn/men1OAnJlqRJBYvy
	6oIjFPGXfhEqlSSfGGz96VG9zWT3d6d/TCpIMzizy/bTqh0nZrpsMc3wHD7Jr2OakSys
	q80jcQ602Ei9v6hO4nWhKK4Lb6TBEI5pmgUhbdrBl/X4qC/sxpx1vsRch0MG/Da2doW2
	dK9z6sgBH7Qs3E8REJEL2ku92JgdmPeDFh0EUNpS3tj3ks4KdhpAR9T0BQ64cC4rg6Tj
	HWRpxuUrjVMiqWCaM+W5PviT7shX0Ymjmqm68Ac51OVKDwR1d9mg8NEEF2qqmzUH/M3f
	urZg==
X-Gm-Message-State: APjAAAWgHuPB3acjVP1Kp4dXjBodYvG1dqJ0B/4lYY0HQCWY2s4dEO4E
	pf+D7dlUPCf/8t0pKDUPhbatQaTf
X-Google-Smtp-Source: APXvYqwkkP9Blj40q/FnKkUJTnanmGC0BJ+BFPt3KCJgdlT4HGeY5Xdrw8HktnPwcTAuakvFbt5cSw==
X-Received: by 2002:a63:6e4c:: with SMTP id j73mr26743742pgc.276.1553557467556;
	Mon, 25 Mar 2019 16:44:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:3dea:ddac:f0ad:db91])
	by smtp.gmail.com with ESMTPSA id i1sm1393193pgc.63.2019.03.25.16.44.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Mar 2019 16:44:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 16:44:24 -0700
Message-Id: <1553557465-4980-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH 1/2] yocto-uninative: Correct sha256sum for aarch64
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
X-List-Received-Date: Mon, 25 Mar 2019 23:44:26 -0000

From: Michael Halstead <mhalstead@linuxfoundation.org>

Avoid uninative checksum warnings when building on aarch64 hardware.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index c9d502b..0d484f6 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -9,7 +9,7 @@
 UNINATIVE_MAXGLIBCVERSION = "2.28"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.3/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
+UNINATIVE_CHECKSUM[aarch64] ?= "e495046969c796b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
 UNINATIVE_CHECKSUM[i686] ?= "44253cddbf629082568cea4fff59419106871a0cf81b4845b5d34e7014887b20"
 UNINATIVE_CHECKSUM[x86_64] ?= "c6954563dad3c95608117c6fc328099036c832bbd924ebf5fdccb622fc0a8684"
 
-- 
2.7.4


