Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 60B767808D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 20:55:04 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id b23so1761220uak.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 12:55:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=jjbJ+dTv9Y2ulCKC0zuCkCrtttuOHeYAsbIDzosOMTY=;
	b=rsz7DcC0hJGGvdbtNwSrYPvlduVCqOkv3KJ79QluUZcX6CHvlPMUnMiBpWLEt/AOQQ
	LULrrSgltm85MST9Cml/ssxj55oD3yXKP1etiaykzyNKX1osXFUO0dEpN8wLfft5fSd+
	5yYNujh7Oa0SVXsdptTqdAXgWw0f9+Ua0thl8aHUqyNOy/E1LqdyVLMVuo3ftBpJeFeo
	8SpaCgsAD27g9d91g44/vO2HXZgPH7Qxf9TRXe4HpU78ofUmZ23/XYtSh4yMt6x03wD6
	412CYJNTtcDMguYrFOzzPFEdsQO8zX40Yjuy0YB4qdwaaI2OEeOl8V+zzcmNQJKyTyOc
	UypQ==
X-Gm-Message-State: APf1xPCgK31S2gxxG/XOAYx4ywkfjXWnr/2NtC1SWzc/ohndZ/DLKMeN
	G/qBbiuWUgwgrykZRBLtOxXpeA==
X-Google-Smtp-Source: AH8x224/zAlrhgV2JTegO5J9SEApgocwlHA3IEyQCCHuyxOz3e5yl78BGyCgz46mSRJmn6twzQ1GwA==
X-Received: by 10.159.56.74 with SMTP id q10mr1498797uad.53.1519332905744;
	Thu, 22 Feb 2018 12:55:05 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 5sm798124vkj.28.2018.02.22.12.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 12:55:04 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 22 Feb 2018 17:54:58 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Feb 2018 17:54:57 -0300
Message-Id: <20180222205457.25512-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4] u-boot-mkimage: Add dependency on dtc
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
X-List-Received-Date: Thu, 22 Feb 2018 20:55:05 -0000

The dtc is used when generating images which use Device Tree and we
must use the OE version to avoid relying on the host one.

Reported-by: Renato Caldas <rm.santos.caldas@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
- just rdepends on dtc; it is not used during mkimage build

Changes in v2:
- add rdepends on dtc
- fix depends on dtc-native for native

 meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
index f1fc5644922..1c008be96e7 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.01.bb
@@ -24,4 +24,6 @@ do_install () {
 	ln -sf uboot-mkimage ${D}${bindir}/mkimage
 }
 
+RDEPENDS_${PN} += "dtc"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.16.2


