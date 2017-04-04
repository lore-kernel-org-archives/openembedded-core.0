Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE2471ABB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 01:58:48 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id o123so33580324pga.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 18:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2C2Rd52bnarXfJdMHUpHV8X2NN7bbLW1+jIMQrMjFhU=;
	b=Zwud2Vr2svEuLBw7/4obSAnfO1ePM8iDDMEK3p+oTmdKd6CZS0OZxi7sOBi+horisl
	RLqadiZTM2JRbid461vyNPzk1c5hXipkXGCMZOrmk6Zt2chrJ0WncXiYJLTyMX8mghps
	E0KPD+4ucvk335nfeT2hCa1mPdxdMYlfK4h6u4pCuSFlVqNJGZpw/mhsXpxA/1HeaUHq
	+JzGyYbiq4b/SmpoCnhvWJkuPerZQOxMvKHFj+r+ckJFsovV29G5AsbzqkuYyIF3SDQT
	XvAz1uC+4MrmMmG7zNfEA2PG5cSn2lDOfS1rG7upnKCBCeQ066Q8MdKGXbnUzW2Ph3Ui
	nqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2C2Rd52bnarXfJdMHUpHV8X2NN7bbLW1+jIMQrMjFhU=;
	b=mPEDysJP/7bDmEzGz4pNNz+FTZZdQtcFJgTQRu1TdRlRXPUD+IBp3BCneUuKY08mu0
	qDftu56oQiaM9Y+2PC6ud9saAiRVHZscomBCk6c4mCmr+1WJdQm+KRHR7TMtCXMbnJWc
	wsLtbDSSZn5MIcLXZ0ybO+aqJM8eQlBbDWGPbIkqUCaRU2a12CMD6K2RomEXLXZfobSp
	0wiBDef+Gv1jSfGeQALNM4QNLtKxUJ7sJg1aMrruGidwyEjPrBC+Ni7/mB26BAMcZUZv
	uzN8tYkjkH/SeImY7NKDHBmi1sw6z841R+DbhA2DnAMM6pFpp/okSArMV6ppkXtjYOQa
	bHmA==
X-Gm-Message-State: AFeK/H1BgtqJ601bQ8dBDOiJYOqltgkdEBPzTfxRrdz62OBN1+95e3IBD923biHXlZvwDQ==
X-Received: by 10.99.115.92 with SMTP id d28mr20791869pgn.33.1491271129709;
	Mon, 03 Apr 2017 18:58:49 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	s17sm28161768pgo.27.2017.04.03.18.58.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Apr 2017 18:58:48 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 18:58:43 -0700
Message-Id: <1491271123-9771-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox.inc: drop comment explaining '-e MAKEFLAGS=' in EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 04 Apr 2017 01:58:49 -0000

EXTRA_OEMAKE no longer contains '-e MAKEFLAGS=' so the comment
explaining that it needs to be removed / over-ridden is obsolete.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 6246c95..375632d 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -18,7 +18,6 @@ BUSYBOX_SPLIT_SUID ?= "1"
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 
-# We don't want '-e MAKEFLAGS=' in EXTRA_OEMAKE
 EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
-- 
1.9.1


