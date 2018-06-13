Return-Path: <sstncr@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF5A78A1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 19:56:10 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v131-v6so7658743wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 12:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BCYxUS6S+VKbMtB96iI3a8Utebu8sBc62+ZUFW4O4KI=;
	b=Mi1AWBFtQilrdr/elIFNWTqk9I40Sm7KGhhN/pfXo8GlUWXiTkKLfNyrOjCXauHw7B
	dRkSOFLr2AoepfDXSH/wlv0AWxHqEV7WyAuDYCBKE2lTKaphbmjvYFEskmaRnk7GiXvo
	+umrhWlpvZQteAxaIWJ5qbNHvVcyuEu9ijRixwu8i67vf5DVFfwYCWfpD6gPh7ZTnnqk
	uxlSYZ205JGSyViMcCSn1CrPmgWa2HyJcpu1140P6QvxFKcNP/OsUWMIF3hMkiGr76ua
	+1yOFTa46KU2tofrMKe93HEUtwalyBCfvZa4Gg48FSJCDckaC2lQDM356AV/U0HvZscZ
	PDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BCYxUS6S+VKbMtB96iI3a8Utebu8sBc62+ZUFW4O4KI=;
	b=ENrV9OBgTvMPPlcmhakigUAArCZtrweesoW22Uq4XeUQ/9UjrcfJQkl3oUX6lwG+dE
	pUbOFhN5EF/7pFhDha2nJVahjxedA7u3fHEr9f+8E+giFR7Y+8+8AK5Vrr1IS39Gg4UC
	reUau1yHy+hVSZmB7XvXznUprgXHuCq5jqQpugo3cRAw0NEKOtOtKdclOo+3olxX68AF
	moTmGUmR823NOxWUNZTsjRKvTJadcx9yfutfnBrhrR7SCLf7mOZQskqvy/0/9PSDmUAc
	zv7PWEq3dcYgNBlEpwSg5cVEknZcel4R5pk5FFuNfKA1i/LWtLGiLK5kiW35el2Nz72h
	iGKA==
X-Gm-Message-State: APt69E1OhZ4iKJrtlZ4PGAnnMWLWYU1TewGGMFOrlRYTX4WE8w7fbnqZ
	bNzeu3fhVA2biEkmqGnzLIUlsu8R
X-Google-Smtp-Source: ADUXVKJCxEDVwsIBWdOcBq4XDPeXLWDDTVj+MJ2oy6L3wj9nA+4SyYved76OCRFa2d7UQatHqul8pQ==
X-Received: by 2002:a1c:b2d0:: with SMTP id
	b199-v6mr4252146wmf.108.1528919771018; 
	Wed, 13 Jun 2018 12:56:11 -0700 (PDT)
Received: from ubuntu-xenial.corp.fitbit.com ([188.26.162.253])
	by smtp.gmail.com with ESMTPSA id
	p196-v6sm3533283wmb.20.2018.06.13.12.56.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Jun 2018 12:56:10 -0700 (PDT)
From: Stefan Stanacar <sstncr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 19:56:03 +0000
Message-Id: <20180613195603.5354-1-sstncr@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] default-versions.inc: use weak assignments to allow overwrite
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
X-List-Received-Date: Wed, 13 Jun 2018 19:56:10 -0000

default-versions.inc is included by defaultsetup.conf which in bitbake.conf
is included after local/machine/distro.conf.
If these are hard assignments distros can's overwrite them.

Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
---
 meta/conf/distro/include/default-versions.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 868073843a..3d88e8f656 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -2,6 +2,6 @@
 # Default preferred versions
 #
 
-PREFERRED_VERSION_openssl = "1.0.%"
-PREFERRED_VERSION_openssl-native = "1.0.%"
-PREFERRED_VERSION_nativesdk-openssl = "1.0.%"
+PREFERRED_VERSION_openssl ?= "1.0.%"
+PREFERRED_VERSION_openssl-native ?= "1.0.%"
+PREFERRED_VERSION_nativesdk-openssl ?= "1.0.%"
-- 
2.17.1


