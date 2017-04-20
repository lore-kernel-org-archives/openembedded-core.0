Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id D384D71C70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 18:21:13 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id d203so19181488iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 11:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ic12tKmhmFlEFuvPuL4Qm3bsnC8Q4ePyU7OAhWP6tc8=;
	b=nqUB9sUtuOHyADeJYJ2bjB7DclGF0KY1gLUWO4j9VNBHhXP1OuxVq4fJTkMGhWXD2J
	919/GiUoBExFv0+c17p6jTFBrQrg3uqcyMeouQhVo1IeQqgMFAZK/DlEd8V9MNavd3cV
	YmfnqKvMfyI4pBuTObpQUeRBP8l/lNU7i6tTpPMi1cFn4jPcWCYChVEpOuv8QgXiyA/g
	Te2iR+8BsMOiRf3zzN/XHc3pemzpCuPpA2U8g33prizFX1/NjZu9bX+SvmGWg10rKWsC
	e/rRrsO/WOeRvl4pfebrFrEhSdoX8e65R/bWLL8WE2LIMAai8DHiHlc7vdIpx+eeenQd
	jWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ic12tKmhmFlEFuvPuL4Qm3bsnC8Q4ePyU7OAhWP6tc8=;
	b=mul+YiI+5I0wUbVdm4fjRWonBy0sr5dfATHcDkacEwWbuI23/iP2ZxZYbSAVZ6i+3b
	0UmzG2kD/2UaHsNxz84+E1MK3MMKlV5n0aemFekIdmHK52tPeAVhuA9a0NytEp7yB+mo
	jE4VLNPXq1Gs1rI4GjElHcDtSvte3wPAUtxpsKTiik+HGYDocoURU4oFnyQDoPDP3W6O
	DcVG6oFpRlBLmk+J+5i1TzNtvXEtY7QqN40KWZSLj/1tsIveJFgMAEb0W7gtcNovFSPY
	JXY5CdNC1UAvA6daGlgMI5ws6zQrhfMGbUCfwX0e5dsIfBSTRwj6CdlSFWcSE2mdQISh
	BQuQ==
X-Gm-Message-State: AN3rC/4vS7QMehuLBrlEkCLqMYCb1n+o6AzWrMxHzsAj/vEThP/h1s80
	h/qtNyJWfQJ/O+M1
X-Received: by 10.98.89.19 with SMTP id n19mr8928184pfb.230.1492712474586;
	Thu, 20 Apr 2017 11:21:14 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e131sm11795417pfg.10.2017.04.20.11.21.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Apr 2017 11:21:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 11:20:26 -0700
Message-Id: <20170420182028.31964-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170420182028.31964-1-raj.khem@gmail.com>
References: <20170420182028.31964-1-raj.khem@gmail.com>
Subject: [PATCH 3/5] bitbake.conf: Add pr to list of hosttools
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
X-List-Received-Date: Thu, 20 Apr 2017 18:21:14 -0000

pr is used by gstreamer1.0-libav during configure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 227babd1b21..16a1fcd9db4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -458,7 +458,7 @@ HOSTTOOLS += " \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname install ld ldd ln ls make makeinfo md5sum mkdir mknod \
-    mktemp mv nm objcopy objdump od patch perl pod2man printf pwd python \
+    mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python \
     python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
-- 
2.12.2


