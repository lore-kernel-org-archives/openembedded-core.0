Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5F15B784EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:39:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j28so12828658pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f/cBHDZa6LZbwaareHVCxa+fIaNM4gGgrhjSRUqdfYk=;
	b=N6w/RnvR5YMi3ywg0d2B6NBP0mYmT5rEmVtWHbEAeqCe65psfdcy0MkPu8FfmwbfEo
	/765Oa1gekj/h4BloZTbEdDjIyCk9D3OOWQGLj8m4F1HSizG1A9bFAIZU1vTdu+nzxKi
	vvBblLmI5UTRWU6t8Q3Ce4nKF15gOUjSPnVLox7cNMv9N8/BruSLp6G9x2eOt6K8j60M
	pRGG9mUPU9Mj3n+DSbqnaU+Bw8xg5Av8k2FcDbBjrKzQan1l9Xhogj0nA6rTn7cfTLOW
	HkxxxrRjE8lebCwsJkGDz9BelrxvbU4IvycXPW3/6d6btYv33kdX4gGsSDaDZBJs8RIt
	qGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f/cBHDZa6LZbwaareHVCxa+fIaNM4gGgrhjSRUqdfYk=;
	b=h9qWEK8nksBz/G6NODDYVl/UAG2ZWLbK8hTHJPaaqH4KTLHHmmzyb82ldJWUYdU/2G
	IbVgpYZ/VxXy2pcF1BY/RivMz74oOas0Wf0mM/KW4HeldXjDpQuTvY+RPYh7Rw7m2y8v
	8H4Nbke6CYhfwtxPR+iMvV5t1jcxqEiaglQbli41+Pf+LAx+WhZcAZ+T+UJuNjObM/wT
	lVozpEw61rZFCSe4nXckh+ZS/joiJAHpX0pGaqqN9yfu4Hcw8VldZFqrO+GG22e5EzFP
	Rs/3ILNN3gDlGaIRJ7TWy5kxAzFdwsSFK4R6LsbY1sa2yyU+kY/1RR8iPzb6ogUsUlSp
	EIPw==
X-Gm-Message-State: AJaThX4KTgKsvqPX2ZM3bY/kvX8j1Rm9rJDOro0N40wi9EvrrxykmE7g
	ZJXRryojKjfTuyY4XTcQil2ulg==
X-Google-Smtp-Source: AGs4zMZKLP3aJvvO3BupdAXj7ZhwAEJ8N9Ic9CWJl7+5Jg1Haa6P4gNjplQTxqvWhOf8C2/SfR4HIA==
X-Received: by 10.84.232.76 with SMTP id f12mr13120952pln.195.1510688374271;
	Tue, 14 Nov 2017 11:39:34 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f4sm30804162pgs.30.2017.11.14.11.39.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Nov 2017 11:39:33 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 11:39:19 -0800
Message-Id: <1510688364-32667-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
References: <1510688364-32667-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/6] tclibc-musl.inc: disable ldconfig distro feature
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
X-List-Received-Date: Tue, 14 Nov 2017 19:39:33 -0000

Musl has no support for ldconfig, so ensure that the corresponding
distro feature is disabled when building with musl.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 3d3f6ac..9ae2a93 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -14,6 +14,8 @@ PREFERRED_PROVIDER_virtual/libintl ?= "musl"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
+DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
+
 #USE_NLS ?= "no"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
-- 
1.9.1


