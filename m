Return-Path: <>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 139427F9D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 21:27:51 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id q70so4378734wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+XuDKFsQZK7CLhLNwn+62FnsA4HPIY9MD2F7O83DGzA=;
	b=TIRbKYxAK4V4TTQRV48Sy/YkHUCVchU78w52fSeew9641BbMBz8i2jshXVH2PpG2ak
	xpBACbyIYNzO4klUwTZAi89ylJMPMMRdrWtL1NZXpaaCWKrooIaxB0+oJQkX8BTirVFp
	22KbP7EGDb4ZwVz3L74Kln9dhY9TAf4K4gvZZfbnbj/OvC4os30sC9AlT4TPuRWjiD/+
	YzOklA/oOCA76431/zh3n3UBkHynjTwuq99H5IIeymBNflZlbjkrWexBVZ7rwAHrB3KK
	LuHDDlZmEgzar2Jz5MrF2likYdO6JWJEDEXX23KD7YmAYtZwqGP3uEy0+jyKz5tyvyO6
	9B+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+XuDKFsQZK7CLhLNwn+62FnsA4HPIY9MD2F7O83DGzA=;
	b=oFp5ZK69C49ombKI/bacob8iyDLDadErRmFTHG1pq17Yv+yi8yfvzxcpbFk+94GaQ9
	sAZ2jHDyx6tlcXndE9Wl+SaEVKA5Fk76uxYtxas5ggRFeoYdHJ9p7V9PZPEuc5pIl19Z
	Y2wpvmxPhRBaEWRlc4M3SDN9p2X3eJzNNNxakE+YN1VyRMP2QciSArvzmzYcZYuFVQQb
	PKU/b0cv8IQQew9bnZWP/cnuq4I3LN8gpWcyPe22ZwcyZelfL3mZHDAJyHoeGbI11YTK
	a7M6ExwZsvfxImKmNo244TpPmRE5ifNW/hj1RDnN2DnpYlbindA26bF1gYvBvKuA3NJR
	0+cg==
X-Gm-Message-State: APjAAAUYXHTl662OyZaB2Ma5yTzwEU1L30/PUuwaDBRaYXuBxMckzhp7
	KBZWXFBy37gkReo4RRgjFuPrntk4
X-Google-Smtp-Source: APXvYqzRRDLi5FP64EcX0Za6b+QEVhxSKqRawg7j6KuX2rWWUNwvrbMWfxJc0HvDCt4ZA3zRZ6TSAw==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr399732wmj.6.1571952471651;
	Thu, 24 Oct 2019 14:27:51 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id l7sm91359wro.17.2019.10.24.14.27.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Oct 2019 14:27:51 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 01:57:36 +0430
Message-Id: <20191024212736.73979-3-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191024212736.73979-1-alexander.j.kube@gmail.com>
References: <20191024172908.68056-1-alexander.j.kube@gmail.com>
	<20191024212736.73979-1-alexander.j.kube@gmail.com>
Subject: [PATCH v4 3/3] go: Change default GOVERSION to 1.13
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
X-List-Received-Date: Thu, 24 Oct 2019 21:27:51 -0000

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


