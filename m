Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RadWd-00057F-52
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 02:20:51 +0100
Received: by yenm12 with SMTP id m12so269259yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 17:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=YHnKz8QadyhIBvQbs/KFEVj9djqwrFXdz1axXYfrQCY=;
	b=EziGfrxt6V/2wjGiVepEW1gc2rGUHRqu162DReDNblqyuvxY9k4/dPWxDDIcDCEIYU
	p0nJu7egQcBXZlPLk6g//uFlnWK6aSOSJCkqE03c7oheou1pU9DT+pQfvpWwuO5J1o0r
	fj8BjVzWqvGW8GwpE7f/gOlkpcy6/jBXFxvjE=
Received: by 10.236.190.137 with SMTP id e9mr7466263yhn.36.1323825234795;
	Tue, 13 Dec 2011 17:13:54 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q52sm1308849yhh.3.2011.12.13.17.13.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 17:13:54 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 01:13:37 +0000
Message-Id: <e2303ed83311f14e09e13278e8940a7d12dc1413.1323825176.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323825176.git.otavio@ossystems.com.br>
References: <cover.1323825176.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323825176.git.otavio@ossystems.com.br>
References: <cover.1323825176.git.otavio@ossystems.com.br>
Subject: [PATCH 1/3] grub-efi-native_1.99.bb: drop 'PRIORITY = "optional"' as it is the default
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
X-List-Received-Date: Wed, 14 Dec 2011 01:20:51 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index 3c52ec9..40e618c 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -9,7 +9,6 @@ or package anything, it only deploys a target-arch GRUB EFI image."
 
 HOMEPAGE = "http://www.gnu.org/software/grub/"
 SECTION = "bootloaders"
-PRIORITY = "optional"
 
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-- 
1.7.2.5



