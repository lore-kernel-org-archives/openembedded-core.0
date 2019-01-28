Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 269A47C041
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:19 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t6so17851893wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ub6W4KcDym9ciJ/jQSrDTzt8K56eD9qNdAqAFFEb/SE=;
	b=l3+lsic6H8zRvjchH2srjgHelIhVMAfFHbrr1yyApD2T8jPWfYvizmu/WIw/ggOMnb
	7aCulOsgzdMszTwnEqEdrwLoLmbzH/dQ8InnZ6IlsK7oOyI1dOJvbJPAiEq2h6zhqrr9
	UoX9Eh/61rFXWx9mk4rb9DB+eLMtUej22RhoAGjKQ02F49+c+tEbw56+6yMCNyQNqIud
	LxdipeR7BcpJpq1wG2nirbsPgUYZ+fW0xp+72nCNvOzHX9bpzIwdP78gwVLxsTgol3B8
	cDXBMwgUh7n2vMsih+5LaOiOm0jaP2tk7pyUBrXzyRDDHPETyTtlBg1dOsco6TI9BdaN
	xaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ub6W4KcDym9ciJ/jQSrDTzt8K56eD9qNdAqAFFEb/SE=;
	b=i/NI9n3ZF2Ie3L6GuJA47zlW0/JtNvUmuGL3Z/E9WxRkh/sMHxalIXeEygwNXL0ZGG
	QnFoGuNcIUzFkC66Xm2u6xOM1QHkMNR52QAFGBqdP3s0RIwCVr0IY06/9W8LKHBBULv2
	mC0XwYoWONvXQ8RWH46rIiiqfzNYhkDpNmBrICsU3Vt4wZnTCfJ+Btqq1kgh1uPTBXTK
	9wN/8F8WOaAf9p5p0Y5CCowtLpRFUWPs2rBbdiTM9/9Xzfg6+v2zJ+9V8Ax1KN57T23/
	fW4f+NGdlUExXs9R+uqsyoG/l3npxo1ZV1ucqESUVWCGEmbDjboIvtOAnXkm9Lp8FJgX
	5XbA==
X-Gm-Message-State: AJcUukeExwGw/UTWFdA8mWaIxtuJnZSBrKbuMlQTpEmU33WkxDFPNhTr
	lpIg6O8yalZ4dC28W2qdwtL9L/t7
X-Google-Smtp-Source: ALg8bN4zm4LgffU/ye1R7pVV00ToLmoSClFHCb1ZrIBHQCNsNl95EHy1zHoPablH5+ioSBcSnrJ16g==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr22250663wru.177.1548679640446;
	Mon, 28 Jan 2019 04:47:20 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:43 +0100
Message-Id: <55014eb7848a67772c711faf0068d8e83dbd6866.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 12/24] local.conf.sample: adjust the qemu config to enable gtk+ instead of sdl
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:20 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta-poky/conf/local.conf.sample | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-poky/conf/local.conf.sample b/meta-poky/conf/local.conf.sample
index cf96598819c..961387acbae 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -236,12 +236,9 @@ BB_DISKMON_DIRS ??= "\
 # Qemu configuration
 #
 # By default qemu will build with a builtin VNC server where graphical output can be
-# seen. The two lines below enable the SDL backend too. By default libsdl2-native will
-# be built, if you want to use your host's libSDL instead of the minimal libsdl built
-# by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
-PACKAGECONFIG_append_pn-qemu-native = " sdl"
-PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
-#ASSUME_PROVIDED += "libsdl2-native"
+# seen. The two lines below enable the Gtk UI frontend.
+PACKAGECONFIG_append_pn-qemu-native = " gtk+"
+PACKAGECONFIG_append_pn-nativesdk-qemu = " gtk+"
 
 # CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
 # track the version of this file when it was generated. This can safely be ignored if
-- 
2.17.1


