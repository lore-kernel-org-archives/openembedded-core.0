Return-Path: <>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD927F9CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 19:19:31 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v9so3583551wrq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 12:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+XuDKFsQZK7CLhLNwn+62FnsA4HPIY9MD2F7O83DGzA=;
	b=reuISnEHP+pI+2KBqp2caQQ/JEtljtG9VJNWE9sjUPiHjdgFDnyk+t/MbF1QdzlCvT
	8BaHOPGvqs5pdSH8DLKbnasgVmBHxT1ooyJ2eA43IXWG2KjvJw8tAF9Wwprzlt754sl0
	yVKOiLxTZCluuMOR8ncldGJz6flh6umMg95qHRE5a7TU6KCerWnFo0Bs+8e9PV3G1tfe
	ovpiJ+FlYBnHjaaDjYW/44A7ZWSYyzDfBKeohWvGQ6DXaVTny+o2olN6aKhq76XR33k3
	9sg/ehfQBbRNAxfOVD3/vrPvyDxaKAOdKr1dfJo9+hjG3GGKBnplZT45JQj+CP4yrU/E
	1siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+XuDKFsQZK7CLhLNwn+62FnsA4HPIY9MD2F7O83DGzA=;
	b=kW4LqJQ4zaW9Sv+dUwbxQw9Uzmxo82Ic/WX8a/np4ByX3xNi4GBTojwMsuIw5eF7Ez
	6G4g96AYFKsIEEzoY53mjA38sa02IWnEhG9KCQFEox3BukAVlemewDvuR16+HqlJwKYR
	EKaFIZVBdHfvSyauxULBFziL13SrTEX8nbfo0Qmdc1TDbrg/x/VSCHgRMJDIdbzxJP7y
	8qM96zSWsLToZ+BUmq67zx7B1Ovvy5HfDLVUi7iZ3ukh0lKXHFbGlIqTPHHsofmcBpTd
	UkHDjwPSMyy+ZStr+YOoGMd1BNQAP4V1BTm8fltSOxfFa0wR+y1piJuB/oY0lA/4AHH7
	ps1w==
X-Gm-Message-State: APjAAAW9Qm0ly/U70X3YgWvNUJuitQmi/03bmD0OUu/6w3CF+/OUEkgd
	f2wHfGR4meFruXlUfrD6yzXxAele
X-Google-Smtp-Source: APXvYqz7RRyE6hzOgxIldI5ehfu+lvKerrEJo64qK6kQI+Ud6DtML1zsBO7YeJpZrLbBdcwECIFttw==
X-Received: by 2002:a5d:4748:: with SMTP id o8mr4589272wrs.239.1572031172500; 
	Fri, 25 Oct 2019 12:19:32 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id l5sm2388137wmj.44.2019.10.25.12.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 12:19:32 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:13 +0430
Message-Id: <20191025191915.80874-3-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191025191915.80874-1-alexander.j.kube@gmail.com>
References: <20191025191915.80874-1-alexander.j.kube@gmail.com>
Subject: [PATCH v5 3/5] go: Change default GOVERSION to 1.13
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
X-List-Received-Date: Fri, 25 Oct 2019 19:19:32 -0000

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


