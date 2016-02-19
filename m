Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7ABA077059
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 01:31:05 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id kf7so10695681obb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 17:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6KKByLgy6L3v8ACR471t0XKvrRWya8VgHzLVx3fOuvw=;
	b=fdHXr4MeOaNlkwikzm7sc5+9Ld8G7C5PwqcSpDEJua2QbdofaCcC9ZhxQMuKaGXhMZ
	tzXPzuc/kHqLKCzKQEoAkgUTU/vTSagAGNkt5lNWqTmbndtIS/ZBCi5KQ4z+VQMy2MjJ
	gR5JcVaSC1+CKUtS7BN0ND80XAmrX/61tCAyzvL2CdhHGYDT5FZBXhYwZuBefye367wq
	8kzY8L1HYKmX0TBAS+FbDK/fnkK0dOzLDcoPT0Jhk7NRQlNklbXm6jtbaxb2/ZdEVVAP
	sNzRkBx5jJjVmBYtkDRI8Kvz8dHyrr9X/cZn5/f3TDKyupgWyKsb96NzrX9cbWtEvRbU
	ZAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6KKByLgy6L3v8ACR471t0XKvrRWya8VgHzLVx3fOuvw=;
	b=IduYxYy7hNCBZmqVYoCiOkTRNpXIKpl8PDGoIRZIXfYPT8Dci3O1EX9H7IUtEpPb/2
	3Xok6axHY3eu3hVO8NCUv28Hc9a+b8dQ/mTFUh2hg+VI1GpooNUCOvgxxZ7E2gOCrYXA
	nTDjVkZ0WTauHIQIVcocrpz2BHpbDW5zlyvpC5l5JW+9P8f4D9jZm6GeDtikMxstgA+M
	ad+zfpSJuXSPdl47vkbcTE5885T4IhgQaXX5hp8AcZzJtl8JqSO/f9VJlGhWyEzoapHZ
	lqJkox+6ZLqsn1qpjhwzlgFhre7wPXKHa/7OM7tEd7zgLmw03kx1u1YUoSTxnywECFk0
	7rHA==
X-Gm-Message-State: AG10YOT+SLt+LcUi1lOLTtDmcDgeas/bZaJOQiFPi6Z1NHLhlpYY8sW4jOQaD3+9xZ5PUQ==
X-Received: by 10.60.162.102 with SMTP id xz6mr9443495oeb.62.1455845466013;
	Thu, 18 Feb 2016 17:31:06 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id wa8sm5566371obc.7.2016.02.18.17.31.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 17:31:04 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 17:30:51 -0800
Message-Id: <1455845451-25185-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455845451-25185-1-git-send-email-armccurdy@gmail.com>
References: <1455845451-25185-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 3/3] libsoup-2.4: disable libsoup-gnome by default
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
X-List-Received-Date: Fri, 19 Feb 2016 01:31:05 -0000

libsoup-gnome is entirely deprecated and has just been stubs since 2.42.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
index a9d8050..13ff685 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
@@ -18,9 +18,8 @@ S = "${WORKDIR}/libsoup-${PV}"
 
 inherit autotools gettext pkgconfig upstream-version-is-even
 
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards.  Enable
-# by default but let it be easily disabled.
-PACKAGECONFIG ??= "gnome"
+# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. Disable by default.
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 
 EXTRA_OECONF = "--disable-vala"
-- 
1.9.1


