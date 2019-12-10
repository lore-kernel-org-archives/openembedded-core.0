Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id B6F107F7AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 14:31:58 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id w7so7369363plz.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 06:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Wrx3j/BHObDtQ2tv0EDVDLlH+JDGa8Kw84snQ0q6LXo=;
	b=vdE4mxZ34fl1MKKJCgsayx2E9MR0ruEvl7jKiKWX0cV7B7nFY2iTIeOYtvcL6WVBWN
	5FJh5h7I1dU8cZVenp9sqw1Ozr3gDu5eEVVi5ULxYaM4NPKNd2Ae9wfwjNVPOGtHShjn
	JqktXe8rxiIkVisz4LuzwF4nztWHjuOuosshjwmNNm88rpYjfUlrZff6ywIZcPmk3zsa
	wTz+QiABRwbSXMuvXcdfmmtk2UeiC3CaKiih77OOFgNtJvLRnyAMmOOOL8irk/Khoo9I
	bkgwYSFOaTpbyXm87lUz7P5ZAWNOgJVBDZ1IlVxk7ZX2c0DIQV95DLETDyDQ+2oAnebR
	eXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Wrx3j/BHObDtQ2tv0EDVDLlH+JDGa8Kw84snQ0q6LXo=;
	b=rqzVuH0ZvND+Jtc9M8UJeOv3j/Iw7nvjmlGmvqvV/rXBRxL/bIruYhGqiEL5ELjuwg
	olQzq3NgZ7F0m4rKde8DXT49aGtq1Lv//II7u4VLN59hfTdqxTnRslJLGe5XI/1zmYSK
	UcahCTIwpph8SDGsj6roQGL4GpDxwhLeswdwmCxBVjC+BNlyy5kVedhiKcjUDLQ+WYxY
	qFFq+jE0ThBWeo15WqSQ5vN76hELcQAlr3rijOxzeQ5IkMUXsaW75jocve1kUtxH0/SO
	RWQ90cBgnYFxnTPGaqenOaMDwhe0yV4z2rA2PsUEKepZxCznBQryul8hEqCgq+LgbOt5
	GnEw==
X-Gm-Message-State: APjAAAUl17JvaQh1E2RW1QRCmABw60nt12l6zCAXtPaaDNrDYpDi3yEN
	pIZ01nFT+R3l0QtQf47rtqq2tez3
X-Google-Smtp-Source: APXvYqz7MaG+2ALvaXUqpN+bylcHNLXGGRg/1NBilL7drrbQM0+bmhwO2EnKTTDIwRAYy1jaVjK4xw==
X-Received: by 2002:a17:90a:8008:: with SMTP id
	b8mr5758011pjn.37.1575988319678; 
	Tue, 10 Dec 2019 06:31:59 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	b65sm3755818pgc.18.2019.12.10.06.31.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Dec 2019 06:31:58 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2019 14:31:53 +0000
Message-Id: <1575988313-2868-1-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] u-boot: Move B from u-boot.inc to u-boot-common.inc
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
X-List-Received-Date: Tue, 10 Dec 2019 14:31:58 -0000

Use the same value of B between u-boot and u-boot-fw-utils.
This patch also enable the out-of-tree builds of u-boot-fw-utils actually.

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 1 +
 meta/recipes-bsp/u-boot/u-boot.inc        | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index a0f9c41..48402e4 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -21,3 +21,4 @@ SRC_URI = "git://git.denx.de/u-boot.git \
           "
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 55d8b47..ec77762 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -1,8 +1,6 @@
 SUMMARY = "Universal Boot Loader for embedded devices"
 PROVIDES = "virtual/bootloader"
 
-B = "${WORKDIR}/build"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "kern-tools-native"
-- 
2.7.4


