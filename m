Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id A4D6A7C4BB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:04 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t6so6956396wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yhflArXU7zC3e8OxN0XEo57eWonMExFZT4mpcmTmBMU=;
	b=aTTjbGTMwhEwaP71yO+Y57HCRGYI202sPPFJsA6I673l+ZyvglgZ1514L+x9mxx8xW
	0SAUBmdLF8/VsLEYRDad2YOV9O90Py9pulDZ9ghhq/ITM9ihs5g7po4qP8aFRl9UpVxA
	DL9jZxvcAxX08sHSujzZBmP2Dei3TO97Aw3ir0CK/KnDToZp+a4BdAEAXcLVXSO9M5vL
	frlQ4+06oXHr9Hb7+6d4FbmvLoWvI10V1Zxe9GAKTDVY7mM+fDQNV5KL1ZLYd6zUnl4r
	kxNeUmMhQtr3zaeqNAcOTHOJ8rlxCu9oqmWswi3vl1PXyTj+jJq+rAAqKohn64tWqiEx
	IvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yhflArXU7zC3e8OxN0XEo57eWonMExFZT4mpcmTmBMU=;
	b=EUHCOHelWz5IO8JYdHxuiAJ+CV7QIJRaVnT/fDPuZ0cwAIxrTu9hUNBFanAsCfwkWu
	F6Fk8cHZM2Lrv/7ZIOoULxws6hSK3gl0oqKubE+wtP5k4arQfSYh28CGYnDkQxfmWXv0
	gWPDJ3rpcnek58f037c5aX4WoMee2418ltBZCH3TmeipE/QDfBWJ5g7XLhSGkeR2DUZB
	6ynwpcABw6QMwSYbSvv6MurubZgrD669qfCjvhfNoMH4m25qNFsXxs26q1X9SRXgTFrD
	yGeQRG8t998SaqY+Sv9ti+EMCZMFsmx2Fpdp5ayYzkjUDH8YBewv8ADGN83+UadnWCL5
	XahA==
X-Gm-Message-State: AJcUukff2yDz5TVBFJWg2UJyS9+Zut6m+eMRjam2j/Uh26VWPDv8PsyV
	SCMtHnxWlEKUWFJdGTW1A5bEJq/a
X-Google-Smtp-Source: ALg8bN7m+FqJIc0Wr09Y290iclIAgRIcXgcpY+SB4702/2nFXcGiXuU2KL8onyqfbeIQ8+rxdMfn4g==
X-Received: by 2002:adf:ee07:: with SMTP id y7mr39922136wrn.187.1549026365009; 
	Fri, 01 Feb 2019 05:06:05 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:44 +0100
Message-Id: <20190201130554.90094-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/13] qemu: drop --with-gtkabi option, as it is no longer supported
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:05 -0000

Recent qemu versions support gtk+3 only.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b6c98a4923b..95e9e0ede77 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -95,7 +95,7 @@ PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng
 PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
 PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
-PACKAGECONFIG[gtk+] = "--enable-gtk --with-gtkabi=3.0 --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
+PACKAGECONFIG[gtk+] = "--enable-gtk --enable-vte,--disable-gtk --disable-vte,gtk+3 vte"
 PACKAGECONFIG[libcap-ng] = "--enable-cap-ng,--disable-cap-ng,libcap-ng,"
 PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
-- 
2.17.1


