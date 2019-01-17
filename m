Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6A37C219
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:12 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b20so8237468lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rT1mBjIJWBuD/gRVsLG7ab5RfpKj9xIy9fS8ZPzwMK0=;
	b=VATh5GLniLAK3SBQPVnPvLqiSdOmUc0mVwcuAAbvRqaA6k2ZArdzZZY83WsO698KkE
	R9UGXTQSVgsQqKSBF7Ee+ArFjX2PpWSUevViLuRsPTl4IYCG+cvTb8VHuaihzDk7Unw2
	YC0tFpy3ce3pxBgb48/FsaG0FDskpU9vrxUe9SFQKtwxWIhFqACLN9B70d8jaDxs3FwQ
	woq2Az2NM9Gwn1w91SU+R61x4qcXMdVR+7cVo4c455WeD9psEmCALucMQPbiuHtR280x
	4WfD97tQ7Hlcglin8SkcFXWeQnr6ybWKutEHZtiMeWO5Bbc+M7T5uRpPgzGUCRxoynRs
	AzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rT1mBjIJWBuD/gRVsLG7ab5RfpKj9xIy9fS8ZPzwMK0=;
	b=IfDD+345DMtRoC6riyZjWyCU45pqhQCSVLrKlygFOsrHa0X4sqWkE72T1kIPiz81Sp
	B3r3YvBRcBl+CbqIKHDMCrgwMB3yMVIJxcaEaFmHz4xx2f3nFkpjlMjZWNEz8A25tJHG
	lDFHUKuJFIG/pIrQgb51PZ8waNUgnc16JTlmC5OdxWMEXiOEZ1e98yNw9Uww8JEwmX5B
	N4Pc909blObj4i6JTtXet56V3YTsuZCBSTekDUnaxgrSljKUWmFdFtE32qSwggfzZXKS
	mRKucMuuETp+ycfDjcx/Zy9bhfWCDWNbzzqO/mm+sZ2kUvSbwQkiHMc1S0iOvSoy4YLQ
	zOFw==
X-Gm-Message-State: AJcUuke9SSjWKyudVmJIGrloF03AmJ2oEsbDpnJwj+Ik0aJ//TyVsrO6
	4WbFOvqkP+dmX6zLGrRwUV8R1QH+
X-Google-Smtp-Source: ALg8bN4cOyE6IRLmP1oS96N7mQdV+p8clRANOHoy968BUqfU2ktz1b2aTg3dPHolyvHTCft9qjTICQ==
X-Received: by 2002:a19:24c6:: with SMTP id k189mr10877252lfk.77.1547742433308;
	Thu, 17 Jan 2019 08:27:13 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:54 +0100
Message-Id: <20190117162659.24997-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117162659.24997-1-alex.kanavin@gmail.com>
References: <20190117162659.24997-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/11] mobile-broadband-provider-info: upgrade 20170310 -> 20190116
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:13 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../multilibfix.patch                          | 18 ------------------
 .../mobile-broadband-provider-info_git.bb      |  8 +++-----
 2 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch
deleted file mode 100644
index 7e97e8ec356..00000000000
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info/multilibfix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-The mobile-broadband-provider-info.pc file is installed into a non-arch directory
-yet contains libdir which can vary depending on which multilib is configured.
-The .pc file does not require libdir so remove this to fix multilib builds.
-
-Upstream-Status: Backport [8109fcd3c7299fae859fb891ff416927581a9955]
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-
-Index: git/mobile-broadband-provider-info.pc.in
-===================================================================
---- git.orig/mobile-broadband-provider-info.pc.in	2018-08-07 13:09:31.811364063 +0800
-+++ git/mobile-broadband-provider-info.pc.in	2018-08-10 17:49:25.645288320 +0800
-@@ -1,6 +1,5 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
--libdir=@libdir@
- datarootdir = @datarootdir@
- pkgdatadir=${datarootdir}/@PACKAGE@
- includedir=@includedir@
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 7f1dd78c14e..77adcebbae7 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -3,13 +3,11 @@ HOMEPAGE = "http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProvider
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "befcbbc9867e742ac16415660b0b7521218a530c"
-PV = "20170310"
+SRCREV = "c7def60ba50d9cc30a90f69f89d7e82243501e86"
+PV = "20190116"
 PE = "1"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https \
-           file://multilibfix.patch \
-"
+SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.17.1


