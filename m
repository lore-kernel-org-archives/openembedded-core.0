Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8447C30E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:59:57 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q18so25505989wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yhflArXU7zC3e8OxN0XEo57eWonMExFZT4mpcmTmBMU=;
	b=oXmlxvX17iSHzqZUtkjyQo8P/27udzKwEviD2xD/XZJqqKtIAHe+IUOx51mD6ssFUi
	iZXFMJmUlAVxhtp/CDBpeO97WNu+Kpqu4YpDP4ZeSPPYR0IQV9bjn5NwGB+GzxWP8H7I
	ZD7CFqWD/iRfnHizNFyvQKrpD1RwMN3VS1PJELhS7LVbIme2voRgV2pQ11R9X07bJxmW
	tA10IVwQFtSUUOGDyfqYXYHRRtiboXYwOx+sfXs0sWOhXMFcqKREyMkuibgnDZmZATCz
	9Ss5ZMF6gRHjAkdG/rX0Sn5Fewv87G+9TGjYTOPF4ecnQWGkcxnjtFnvHJFV15Lbm6Rn
	d7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yhflArXU7zC3e8OxN0XEo57eWonMExFZT4mpcmTmBMU=;
	b=uXY4PlpnSgokRu3qUCfg5Iem8grDl7STobe/eVoRXdpbNOM38/dM2xpGFVpJQsuU7e
	sAmK9vDe4a3L64hAwXoRrs/9sx9eL4TFdlLh28uywKLerbSQwyV1mSWDUsG1g5cOhOqr
	LmbLQpwizLv9iQSV0R3++5uRJtAUr/h/qjMPib8E3Gk7b7Ci5F84uMil3KzN84HRnOY/
	K5k2zorhLs9IswJaKXdCUYTGYAJsuSDs+ysErhPt9eOZMJB+9Dw++UV11IqIJUkIWlst
	6furV6NcgyAvC3DxzmRtEIZ+p29BZp/Lu7Aw97lGbKCmiJetP/RR3QtXx5hebH331msM
	4Ybw==
X-Gm-Message-State: AJcUukdis4vHB4j4DSC1eMBxi5G/zmTPYUkbeiUpUdkEraBLN8VDv0If
	Vs3vs4a15SN0+kze9U3zZ4nEdXZf
X-Google-Smtp-Source: ALg8bN5ep/sBJNEizn2SQTTyBJcmbt2PC+Jn1wyhIeaEjJHJCC20RdMHZJ5X+wmj9jjAJVEntJMGVg==
X-Received: by 2002:adf:b595:: with SMTP id c21mr28381000wre.125.1548845997559;
	Wed, 30 Jan 2019 02:59:57 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.02.59.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 02:59:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:30 +0100
Message-Id: <77742959b0b35da561a4f70401d66f1bf2361dda.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 07/20] qemu: drop --with-gtkabi option, as it is no longer supported
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
X-List-Received-Date: Wed, 30 Jan 2019 10:59:57 -0000

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


