Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 821147DFD8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c77so6288061wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QoffO7mYodqILjYVGdd3LSE2oVnMLO8SED8ubUWM3cY=;
	b=moZ3WHWrl99i1UZJ5x09bDWxIX3FGkKoolg0FE/oobCkJfd7t+03FovuYuMCK7qyIm
	98UvDJLuTXODF3/eZKmiiCKBPD/yf1DOe6B2RTgj3O/8yyF/kizrdm1REZKe568WaxNc
	ZkzcBANBrZZMlfP17s8FD2GN6tevRYTp8MJqQmtjjrxkHBrsTDB/rkm0bQfqv+wQRWpO
	kY0t49jGYQnbit8dqHeVlF5QaaZPZKZrQyrl+WB2gBkKUwVAYWIQkUkcZmZLkGSZCWvu
	RWU/AaJZAGP4rA9vmXQnixsIv7kHe0VAtfGxOtIRkrXtGoZHnXQJaULVV7ApjqFQrCps
	ALIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QoffO7mYodqILjYVGdd3LSE2oVnMLO8SED8ubUWM3cY=;
	b=epQSICB1/Sg5VjEpMvbzZkhHiLqrIBl6WGF2BEGrIzoTv8fJurFwwUkx8+fs34i/Au
	KlSgHS07IsIMmKb56rJbY6G1/UQxaojXEeaGY+W39DLgRpcrrY7kQEZgdgirTML6kH2Y
	VKX3sAtJDnstIK+pko9KS1ywZpxj6wmjUtACcuBZmOp+jr7Yn2EcaBuHQTG6ny/iTYnU
	GbmGZsMEb+I7a1YUQZPUiOhIZQcJOJ0fuij7D+4oySOs2elB6ZffXU3NRFyQR+BVEglS
	QAJI4Kbutkunu+c1dlFxvpmc9pAxaFc09O8EpFd/XlO5II799Q7SSPv91KH7aeberpL3
	A1tw==
X-Gm-Message-State: APjAAAWjBsvNMS4eut7oClmt/IieAzxO8+1tSHpRRE+1S72LTcL2sxNH
	jWJy8j1qx6XF8DfA8Eu8fbvacQ7a
X-Google-Smtp-Source: APXvYqwRdXgWodEifIqx1Jqg7KC6eXk3+MFzPn2b0WePyVGrPmYhL1kik+nmZznREyFF6iQtg9FdTw==
X-Received: by 2002:a1c:c909:: with SMTP id f9mr3113256wmb.115.1558116736238; 
	Fri, 17 May 2019 11:12:16 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:34 +0200
Message-Id: <20190517181151.44001-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 20/37] gnu-config: upgrade to latest revision
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
X-List-Received-Date: Fri, 17 May 2019 18:12:16 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index e597ebedbc1..f52597936db 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -8,7 +8,7 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "058639be227bbe8f03cc39f79f7ce84918012143"
+SRCREV = "b98424c249119b79d3f709e26eb86f2fd4d5e5f3"
 PV = "20181128+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
-- 
2.17.1


