Return-Path: <>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 24E2E7FAC5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:58:59 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id s1so2500817wro.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 06:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+XuDKFsQZK7CLhLNwn+62FnsA4HPIY9MD2F7O83DGzA=;
	b=N7iReFxWN+p1CyK0rUl84ZwhP0LM2QhahXjdBgQpSZZds8ZuOFv0AcqmA8Vzi/00jb
	K9edfv9TgvQVbbGdkiC2hwAk3qQVu16qUkSjqKqGN+O8P+ofwL3MTLwR/5nXx28YRq0c
	QypSwhX1ny4oeZFY6cSOPXI0vnQJ8Z7rB3iZQQF90c307lvQncZGYwetBG0ZQkCHSEAa
	18r7FbzHtUmhxZohpJVVOy6/RUoGTnST+zuMHj1DvsnSjYxGXBMPRJ4z8rpw4lmVlpe3
	OXOVURQCCkCW2IeHAqmhT0lJfe/fBdeTGlFWxwo73LKt88f4RQTpHXR42QOL5DrxXlfN
	HJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+XuDKFsQZK7CLhLNwn+62FnsA4HPIY9MD2F7O83DGzA=;
	b=NiRh/E/SZvT2CyLyQxSIrO4Zpb/h5/6W1FWL9+uewYZ9tgRX+hfFL21g+EEcTRlFRc
	mT53rftzwfTpMWKBRLVl4Jr4tMZ4AHefpUhwjE6yVmab5x3ZqD+UAJJULrwyO8zzy/0/
	H+UG2kLilxp/YgLDYKtXfdgruTelBtCl4gMODKmpcdRmgGqFaSvY+mmjYMGJbt+qH9cN
	FYRpWwDTu2WfgUFaHIUGVrX312uZ9jqf8pYNYDRhyFUL4yTtRf7qRy4lALszCLKXhEaZ
	5B5i6D13zjxeC2PRwc0ISeQoT4g8arNAry7Nt1JNbva167RN3xD+NtviGLkMgEy0KiHj
	DsNA==
X-Gm-Message-State: APjAAAW8+ImKEdw9obTBfvyr15GKrekljuw/xftVXrXpJqXnUPc73WlB
	YE2DRi0LT1QfjaKN96B03O+q584Z
X-Google-Smtp-Source: APXvYqwiBRDmc1yzN8F7GUjHY1aU0zJ2mjyuP9QUACz71oNGiu+V//vHNL1c488/CBcf0FwuGxBTGA==
X-Received: by 2002:a5d:44c6:: with SMTP id z6mr3087349wrr.313.1572011940533; 
	Fri, 25 Oct 2019 06:59:00 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id
	w22sm2380726wmc.16.2019.10.25.06.58.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 06:59:00 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 18:28:46 +0430
Message-Id: <20191025135847.77492-3-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191025135847.77492-1-alexander.j.kube@gmail.com>
References: <20191025135847.77492-1-alexander.j.kube@gmail.com>
Subject: [PATCH v4 3/4] go: Change default GOVERSION to 1.13
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
X-List-Received-Date: Fri, 25 Oct 2019 13:59:00 -0000

From: Alex Kube <alexander.j.kube@gmail.com>

Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4a23c50631..c6c4cf7ce0 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "8.3%"
 GLIBCVERSION ?= "2.30%"
 LINUXLIBCVERSION ?= "5.2%"
 QEMUVERSION ?= "4.1%"
-GOVERSION ?= "1.12%"
+GOVERSION ?= "1.13%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "9.0.0"
-- 
2.17.1 (Apple Git-112)


