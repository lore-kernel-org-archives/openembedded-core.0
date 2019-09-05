Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id BAA367F291
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:38:04 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id j16so2991576ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=N4TvOlxL46EEXA11xr/RbZ79bkB2zYLmLfJ6W/OY+Pk=;
	b=QASo5HSLdTQmalGXUhNwkdZRybCKzk7iP0x2PdF6eyiswcffOueWwbYym7KkH1oHXU
	WD030Ku+MczLvM/c9D1rGONlEja1SMxZKZ8xCqsr4kyRrcCuGbeXSvWNiZF61Gt0C7KZ
	btwDNLPkni9AG0kVKoI2bvzN07npK5PZH6xFxk3mkx8iF2sw31yqrozU1rDivV8ILDiI
	/4oSwZMp89tVmG993GDO4AD36whLoxewGnIyuRnAXPurFUjgXrdpXU/xnaij4iZogBow
	zFLg693y2XtHkxTEulBC1SoJnEG9S0N5SGx1s/kXM1Q2sEN3wYKAQXXrPZbd86/bjQ4u
	08qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N4TvOlxL46EEXA11xr/RbZ79bkB2zYLmLfJ6W/OY+Pk=;
	b=uPhtNMwVaCWQp6n0IRtvwTzGxQ4MOgNpGzpWYljMMBvyVGPm/sjgyq2YLS6JzU64E6
	XsNbXyipgmL8mM4yPznUh+yFCh9CFPRy2ZhqV0wwGU4rBCvC/BckvrTQ9YYalPKbbPoE
	kNpQ+4xwZztAy/763POfEKVK37ipX8flPZKAcsOGIXeyDEvECtCd+Has/0JWRPFzUaGE
	HdsFdNVYK9srD7SqlG2As0lneIShQi32jbGcvNPf6DUe25cMo4pXOm2jB5hnfjz750Eb
	AlcS1vNbcRy7rdxosBhnnV4PjvTCMV/Sm3/WYKTjMyDS6C1M44KQRphodA1zNMrlu4ks
	rj8w==
X-Gm-Message-State: APjAAAV4CdZuO9Q2z6M02XNxrQLKTp/Ga+vKtY0lYLHATIoPBCblMlbE
	wdF4MU1NyeJDwHkWRRvpbqiIgHLuVYE=
X-Google-Smtp-Source: APXvYqx4E0KFy+aXDZBgE8MVUhob5OQYK8J3/A6vjOhiuowouhPYAjxtiPfKEJF57lWWlaj0ivssrg==
X-Received: by 2002:a2e:b0cf:: with SMTP id g15mr2514625ljl.237.1567697884878; 
	Thu, 05 Sep 2019 08:38:04 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id h21sm433614ljg.34.2019.09.05.08.38.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 08:38:04 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 17:38:01 +0200
Message-Id: <20190905153801.24843-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxcrypt: update to 4.4.8
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
X-List-Received-Date: Thu, 05 Sep 2019 15:38:05 -0000

LICENSE file checksum changed because few contributors were mentioned
(see @edbdbbc50beced9c723e7405334583c60a702796).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{libxcrypt-compat_4.4.6.bb => libxcrypt-compat_4.4.8.bb} | 0
 .../libxcrypt/{libxcrypt_4.4.6.bb => libxcrypt_4.4.8.bb}    | 6 ++----
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.6.bb => libxcrypt-compat_4.4.8.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.6.bb => libxcrypt_4.4.8.bb} (86%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.6.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.8.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.6.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.8.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
similarity index 86%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
index 5270e58c2b..1787f6921e 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.8.bb
@@ -3,16 +3,14 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSING;md5=be275bc7f91642efe7709a8ae7a1433b \
+LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
                      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
 inherit autotools pkgconfig
 
-PV = "4.4.6"
-
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "398943774c5ff38baf1bc5ee088855fd8983bb05"
+SRCREV = "acd84997a5a8b2badd28b70a642abee11272fad2"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
-- 
2.17.1


