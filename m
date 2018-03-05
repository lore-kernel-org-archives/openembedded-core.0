Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B4A9278A91
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:20:58 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id n7so18112095wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EUbBe+qEUM6SQQT7tNdtigx1q3G7W9VXd8ACAp2lHkg=;
	b=cZJ+xwIXRAcNN2679v9HxCGGQQjwkvB7lH5m4HVSNbA0aho8g6n0IcHGG2+J2xMQmw
	4Oo1L7Cfy8Pr7kS2PmDXr7HIkj8vtsERjoS5nFlkvMFX20MD2N108/TAk5+w0rXFOTFd
	x6V9xbF4lUiuJHBocTnuK37uQaor3zmacyu8qqmvfLf7NHNXwQlPUjaz0dz68d6arhC6
	PnDrNjkrpHchZN2+MduR8zqMdFAW2BArUpCxWGIWMpo38KTajYZkz9FooLOY7Vv92Gu5
	PnAbv9ApgSf5uKbj/1peSwLYdvAcHNRWXkznsjwe6rNf4NZrztD+f8tdp94w8F49WIMp
	GeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EUbBe+qEUM6SQQT7tNdtigx1q3G7W9VXd8ACAp2lHkg=;
	b=fQHRKd26I17Fs/ho2LXWc5p9/9+gJsnE+2IHBgARGdMCDZ9l6deta/VsKDYCUsDxO0
	kT4IP1rRE0SlbEJKPhvxTwVD/w69nKW8HYnTsKWuzc5My9ShYC35cMG8FcDnIMr1jcnl
	lo/0cjoY9Q1iGXGPCY9Pz/HkDiB0xrBYX+2OsuR7X1RoWlbxo0pyWhYT7sVpGvqntBOO
	irKp66brwX6vYuDNuIneTgm017GPZZ0jsSIEl/zwKB3PKYlZKoILJ+W/dZnV/EkZlmO7
	hQaXqWj6/0G57XCY5UWmUeGaUfy4v4e9rvenEMlaJic5VAumWXQnVoi5OMj69BfOLqPB
	lmLg==
X-Gm-Message-State: APf1xPAddDxPAGYqDX3v0POq75+I8QU9foWNcnzRLFFnDybElA1PWMNG
	qMUzNPdT+eB5ff+ChMF6dEnyFpvV
X-Google-Smtp-Source: AG47ELtKU+aa55WALAS6Gu+CTrNH5+oUKr3lYHS30Nxnl8nqKWaMna0+GETACdWWykSEtz0jEXoFXQ==
X-Received: by 10.223.173.75 with SMTP id p69mr13268524wrc.222.1520270459307; 
	Mon, 05 Mar 2018 09:20:59 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.20.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:20:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:25 +0000
Message-Id: <20180305172046.21729-8-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 08/29] dropbear: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:20:59 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../dropbear/dropbear/0004-fix-2kb-keys.patch           | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch b/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
index 7539d2034f1..60c6a29d650 100644
--- a/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
+++ b/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
@@ -5,18 +5,15 @@ Upstream-Status: Inappropriate [configuration]
  kex.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/kex.h b/kex.h
-index 72430e9..375c677 100644
---- a/kex.h
-+++ b/kex.h
-@@ -67,6 +67,6 @@ struct KEXState {
- };
+Index: dropbear-2017.75/kex.h
+===================================================================
+--- dropbear-2017.75.orig/kex.h
++++ dropbear-2017.75/kex.h
+@@ -106,6 +106,6 @@ int curve25519_donna(unsigned char *out,
+ #endif
  
  
 -#define MAX_KEXHASHBUF 2000
 +#define MAX_KEXHASHBUF 3000
  
- #endif /* _KEX_H_ */
--- 
-1.7.11.7
-
+ #endif /* DROPBEAR_KEX_H_ */
-- 
2.11.0


