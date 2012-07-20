Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SsMHT-0003sE-DA
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 01:06:43 +0200
Received: by pbbrq2 with SMTP id rq2so6139038pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 15:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gKNpbPWV1aWWWJ5WlErpf37iJcc8X4ZhYBBpNzKpCmg=;
	b=TYZv9ViYHDRtOXdco3TmtTg0Dh7H5lDDaR2m5oExek9MTOC0HHHlpvmvLkmIo0nmcl
	I5e0z1lnl606QI6BhuuZwe5OmdrQy4vRkYavQhRdKL2Qc06DADAUOFsx1DeP9Uf/Oyvy
	71MM07zrq0UW6JGZ7STjk+N0IoxH78ey4bHVhlgzRhNvkFwM31O/yzpANFqFLXcV76w1
	z/LTdpHghKXGnaO2/iObPrjLujsERX8N3j2mb67aX0rbF+cPu5YzE3HSmmaDMyxsyPEP
	EHK4wiSoaA3kn8+p/+/hcBFEYLuY5jyQNHXbPjSZ+ef1iVLmIjhEJWcdTdK8622lv+Mv
	BLwg==
Received: by 10.66.75.202 with SMTP id e10mr14647802paw.55.1342824919032;
	Fri, 20 Jul 2012 15:55:19 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ot4sm4775373pbb.65.2012.07.20.15.55.17
	(version=SSLv3 cipher=OTHER); Fri, 20 Jul 2012 15:55:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 15:55:14 -0700
Message-Id: <1342824914-24712-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342824914-24712-1-git-send-email-raj.khem@gmail.com>
References: <1342824914-24712-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/3] bitbake.conf: override -cpu for qemu on ppc with SPE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 23:06:43 -0000

We use -mtune flags which lets our application have
SPE intruction in them which is a good thing but when
running qemu especially in user mode these application
wont work with default powerpc emulation. Therefore we
have to add proper -cpu option to let qemu emulate for
a given cpu.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1525e44..f2d00aa 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -139,6 +139,10 @@ QEMU_OPTIONS = ""
 QEMU_OPTIONS_iwmmxt  = "-cpu pxa270-c5"
 QEMU_OPTIONS_armv6   = "-cpu arm1136"
 QEMU_OPTIONS_armv7a   = "-cpu cortex-a8"
+QEMU_OPTIONS_e500v2    = "-cpu e500v2"
+QEMU_OPTIONS_e500mc    = "-cpu e500mc"
+QEMU_OPTIONS_e5500     = "-cpu e5500"
+QEMU_OPTIONS_e5500-64b = "-cpu e5500"
 
 ##################################################################
 # Date/time variables.
-- 
1.7.9.5



