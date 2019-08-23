Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id D9F987F391
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:52:50 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id i30so7226199pfk.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0vSUL4BWv0DKhs9m6kjJWR8AjrGbuT0aqonjAaWlI8I=;
	b=gqw/GNIgUu/rnAhz6rv7LWthY7SAx7KRznaCzMCqBXqd62JkK2czAjPRgzey6OqznT
	uM9JOeaTHdQOlbTf38xQZaF3qhhSzKx4BBQJhrfY6dNzrDW0ton0L7hw13W6a5t4sR4n
	sDEXrnbO9XV9oPpNCCuwmUztvGQ9HJJel9jNxK1b+bBeWXR+WqpC7QgJi1NG3PsOhVSW
	onwPBN6l5Ba8rNLNbQygPe2OppqQyTjBsPAjyQ2ANkSC6eW3MKhapP7HYO9Wfw9OKQmf
	xryEChICdGpJ9yWF9PgLcE6Ao+UPp03S7lVidQuXMShnWGEAY/lllEu274oxaiIsVVxX
	jktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0vSUL4BWv0DKhs9m6kjJWR8AjrGbuT0aqonjAaWlI8I=;
	b=G0tKXMgI8AS+jqtrRgnP+//wGbc+iQwc58Q6crI7d4YfgT/vVsKF/Ck6cKq+QQmhtm
	xP50hHgcJwxw3IZV1QiMhOXFJI6f6EtU3TyIt3XKPVIz5Dh0+9ujqNhYhjrlWpFZhdFc
	EefckvKGIeoloXwnEPCRZFY7pfYXEtjIoe0A9JWXcz/67vnjoUcdSI/wtcAx0pT84Wl/
	pSHuEY4X4kRqPxrMYUatQmC82q9VK5hQuF/Ar2Uaw+172ogGX1V5lNbIuZbxjmBSSLdr
	2Qge668Gt57qyrNOxmPBc9L4W337FGoyGytE3oWtrTC++fkmhJJD8ZCLTYjVSL+9Vl8D
	j97A==
X-Gm-Message-State: APjAAAVEk0g5Trff+4rU/bZoTEjV6wbwIpaToath9sBGuqcKMCPcjxri
	Cp6JK0V3DYUFHaTnKSsizWpueEGw
X-Google-Smtp-Source: APXvYqzW5v4vrYsayxkqziujDqLEc/6ZFl9vXWpLg6dDN9cpknPgg4YQKuIx/fOfHN1f3PKy8kdfFw==
X-Received: by 2002:a65:6713:: with SMTP id u19mr5243621pgf.403.1566593571794; 
	Fri, 23 Aug 2019 13:52:51 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.52.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:52:51 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:37 -0700
Message-Id: <1566593504-21918-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
References: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 06/13] packagegroup-core-boot: drop duplicate MACHINE_ESSENTIAL_EXTRA_RDEPENDS, etc
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
X-List-Received-Date: Fri, 23 Aug 2019 20:52:51 -0000

Default values for MACHINE_ESSENTIAL_EXTRA_RDEPENDS and
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS are set from bitbake.conf and so
don't need to be duplicated in the packagegroup-core-boot recipe.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 3a2f50f..abbee14 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -10,12 +10,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-#
-# Set by the machine configuration with packages essential for device bootup
-#
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
-
 # Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
-- 
1.9.1


