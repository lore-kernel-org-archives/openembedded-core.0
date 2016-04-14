Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3D0601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 22:38:27 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id kb1so4643047igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 15:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BsUgqE+fNDMO64mS4w1HnZjSLqkFmSw9JLDv20o44AI=;
	b=GTaiVj3duJrlfxlpK4qRFXrsmDFUUYXZPCb2meetQPsrOCZDRURCYof1sjJQkFfPOd
	LvXDhK/yyeiPv68ur0e240h6FXmTI1oLx05pIMPL8xFOh4pw++2uMZy/LRqLpbIlji8a
	tBj2P4XGQ6zbsNSAzNc8d9roINwqCU6QdJxb7PFjofocV9D7D9Gk4cEvp+k8b8c4c2G4
	drduo/fzKfFx331s59Ymxx7qGq+AxSw7/UPKIo3ojvGdTwurSq2D+dvnugnEKzrekEVz
	IDIAdzy2/+x10rn8cuu++R+QEecLNSsbq8BwHdRZRTcTdHKLATlgBKy26xF+DmmOeRsf
	Zccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BsUgqE+fNDMO64mS4w1HnZjSLqkFmSw9JLDv20o44AI=;
	b=I5QNH04TLHPt11DdLyPMvQ5MbrDPr4tp8Xgcfha25/3CDTyrS1onKEErm9J26jPhlb
	5WvHhPeW2CWtjvu2TVgBCjMpgwvLSUAP9fkPKUZ3KD+Z229uJFslojrloNjccRDnPQYK
	dy1ke80+bA/AyACAi0m/uBW7orzKasA9Y9+dp+Qaga+CcGJ2zQQB5Th1l9Q6ZhGpyrxf
	gPgxNYmr2+FkQHJPzA+IUiRJdxNbHQ17//PQZ8Ix6xrQ5AzO7L1hqdXK9iVI8iPM59w4
	BxDpsHZQJ3d6+yvxgfUFefOagxXsHc8tZzZjH6wBEVSA8j4i/doIH2pigNQv2c0vRtOx
	XF3A==
X-Gm-Message-State: AOPr4FWogZItHXGP+WzLjLzLxyNKGVwMGdbbV8T0Qm9kDkf1gKznxIjgMWooM4Kcgu/PHw==
X-Received: by 10.50.132.36 with SMTP id or4mr1133710igb.23.1460673508373;
	Thu, 14 Apr 2016 15:38:28 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	q198sm26388488iod.6.2016.04.14.15.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 15:38:27 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 15:38:16 -0700
Message-Id: <1460673496-15291-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] default-providers.inc: set openssl PREFERRED_PROVIDER to openssl
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
X-List-Received-Date: Thu, 14 Apr 2016 22:38:28 -0000

Although the oe-core openssl recipe is currently the only provider of
openssl, make the preference for using it explicit in anticipation of
a libressl recipe being added to meta-oe.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/default-providers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 5801b67..d5e8e42 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -53,3 +53,6 @@ PREFERRED_PROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','blu
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
 PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
+PREFERRED_PROVIDER_openssl ?= "openssl"
+PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
+PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
-- 
1.9.1


