Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6249377677
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 08:31:45 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l37so20678651wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 00:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zQ9AW6VlJUUdrvY3naTk7tK50IQgOsB6hLUFzE4Cntc=;
	b=EXW8RyiiAosJW8LkMEesEl7WCqI1FGXYjLh8I3EQa1R35EhH+86GP7H2pQnAST6qMv
	BXk08wd0WacgO2KBTgUApGFXptTU8EvLIs0SphkmKg8/053E3iBBQJmv0m5Lh3FwGJZQ
	E2r1yGn5lt2lnm2PyYkp2X+zhL/0GojInKzvBQXhDEjMFkIs44aIVnwNq3WymnmpeAj5
	0h2fxEwVY3f0m/K7MtuiBf2aczJgo42PfyKkr5yypDMpo9+OmOl/SHO/zqO8s/XLiXbN
	NZeRGxtby9Eqo59Ws2GNtm/zRR1d2OD19IzOb+HyT+NSWq1vm53uCMIZOA+GlbSwy9EU
	cJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zQ9AW6VlJUUdrvY3naTk7tK50IQgOsB6hLUFzE4Cntc=;
	b=LyRH+kj+Qb73/EM1NcjjmfyhjUKZzV7s1De8xLtALUKbg16y6fpnXEYhUjoUAwkjW4
	PR+tlCb11pyPB1cyNq1/yfSKf4Msz2ITqiSH1o/nH8C8N2PX8s8QmPdtd2f5XWYN2273
	Ol9lftn8Zv4LAA8rdH/LUXAvTDgeV6gqOXb028DptrQ7VZx+QpS41XH1KcEk3N8IdhDV
	P8OroXUlIJn2eLK6fNrdcpdqT7kkN9EMnn9U+5+CBuu/1DFYLsxn0SWzHamHSqZpIXD7
	amfC4kvIlFTPARBvcbxdkjedRWH7adBtTnpSRFpVzntOqgC45KtKQVZ25nNR8+gtVqH5
	9OGg==
X-Gm-Message-State: AMke39mdPp7L3h5b3hMIHFj6wu9j/cXkM8oei12lzC+lT3WFGniDeNE8enb3yR1Se04WGA==
X-Received: by 10.223.134.157 with SMTP id 29mr12623260wrx.33.1488789106659;
	Mon, 06 Mar 2017 00:31:46 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id d6sm13870115wmd.6.2017.03.06.00.31.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 00:31:46 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 06 Mar 2017 09:31:41 +0100
Message-ID: <4236179.UN52qSrgop@crde-port-20.cahors.local>
MIME-Version: 1.0
Subject: [PATCH] busybox: conditional inclusion of login utilities
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
X-List-Received-Date: Mon, 06 Mar 2017 08:31:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

Ping

----------  Forwarded Message  ----------

Subject: [PATCH] busybox: conditional inclusion of login utilities
Date: jeudi 26 janvier 2017, 17:45:18 CET
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
CC: David Vincent <freesilicon@gmail.com>

If busybox is not selected as login manager, do not include the fragment
containing the corresponding utilities.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 meta/recipes-core/busybox/busybox_1.24.1.bb | 2 +-
 meta/recipes-core/busybox/busybox_git.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/
busybox/busybox_1.24.1.bb
index afb69d13e6..7d994dc10d 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-$
{PV}.tar.bz2;name=tarball \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
-           file://login-utilities.cfg \
+           ${@["", "file://login-utilities.cfg"][(d.getVar('VIRTUAL-
RUNTIME_login_manager') == 'busybox')]} \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-
and.patch \
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/
busybox/busybox_git.bb
index c2ee3e6c4b..4213ef4b1e 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -31,7 +31,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
-           file://login-utilities.cfg \
+           ${@["", "file://login-utilities.cfg"][(d.getVar('VIRTUAL-
RUNTIME_login_manager') == 'busybox')]} \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-
and.patch \
-- 
2.11.0


-----------------------------------------

