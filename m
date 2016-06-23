Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC83F73163
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 17:44:59 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id x7so7940208vka.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 10:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=KLcsI+Z8AzR/1Lvw8wCJ1IrojsrXv4exVFZ0hkl9aSU=;
	b=KVM9n3HdhgoWwOetI3SqF5Ex8CcdadLubmXyAkIcDLEzOFR2fEItRmlWLvIZ6K7jqR
	DGpuQtwKeWA/tRuy5JeRah1MhXDAlpWZReyBlJ/xkL5ezGn2AXKu9Yv0lg5zJiniK7ti
	zUh4rMubWPIENXpuAul7tQFWNTBbJpAFolKRLOvuH36uD9udKMdrkZ98DJO3YC5BDPVd
	5ECxjnKGYB0eO+nkbuG/ckeIzmQAgsLKtqsjGnR87a9MOZq9XMvGssLhK1/HJh+7crT2
	PvpLamdIsys6Mas1B+EsCvQ4J1LQ08ZRwOKEQAXxhBoRAMl/GB8YmkrRGUGUoWcoa+ah
	Vbhg==
X-Gm-Message-State: ALyK8tIlPPtw6sci92vGv4L2FoiqhM+NYPmYzARlSrHqyrfwchJ4VbdJFcVVQbRItGCk/w==
X-Received: by 10.31.84.131 with SMTP id i125mr16360451vkb.29.1466703900146;
	Thu, 23 Jun 2016 10:45:00 -0700 (PDT)
Received: from localhost ([179.105.243.72])
	by smtp.gmail.com with ESMTPSA id 48sm453063uai.3.2016.06.23.10.44.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 10:44:59 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 23 Jun 2016 14:44:55 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2016 14:44:48 -0300
Message-Id: <20160623174448.5504-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160623174448.5504-1-otavio@ossystems.com.br>
References: <20160623174448.5504-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/2] initramfs-framework: mdev: Add a runtime dependency on busybox-mdev
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
X-List-Received-Date: Thu, 23 Jun 2016 17:44:59 -0000

The mdev support relies on the mdev support inside busybox, which thus
builds the busybox-mdev package. Adding the runtime dependency ensures
its installation fails if mdev support is disabled.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 0664a95..e5cf9cb 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -50,7 +50,7 @@ PACKAGES = "${PN}-base \
 FILES_${PN}-base = "/init /init.d/99-finish /dev"
 
 SUMMARY_initramfs-module-mdev = "initramfs support for mdev"
-RDEPENDS_initramfs-module-mdev = "${PN}-base"
+RDEPENDS_initramfs-module-mdev = "${PN}-base busybox-mdev"
 FILES_initramfs-module-mdev = "/init.d/01-mdev"
 
 SUMMARY_initramfs-module-udev = "initramfs support for udev"
-- 
2.8.3


