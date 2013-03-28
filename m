Received: from mail-qc0-f172.google.com ([209.85.216.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ULGKR-0000yk-5f
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 18:09:32 +0100
Received: by mail-qc0-f172.google.com with SMTP id b25so4270151qca.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=JjjbvXDDsZlPMZAOwGgq1s5YPnHGIhe8ooptFNWmVUo=;
	b=FbuORuDsrzs+gzuH0ZzKIz47YYXHjzfnKX2apo6sq6kV4u1Pey6moZMsSyHFppgo9Q
	htLbqISWnk8JSdVtth9a//KQQsGxpfpoK0pzxsOAivbasLKXwoeOjP/OxPbtaPa+PdMi
	owBN9qIBgR2Smj/oIbz35VnY3ooAOZlc1NmeMBye7ibHaKSxfLzleorE+cku5f9+ClQZ
	nAsc05x3/HgLUZ/8UhnBq1xoEDj0V00m7AwtC25Ey+5rpi8ScMqOv59vymG27lCzRy+J
	BZVKHb0rrzOwcig1tDBliSAcp9LqpBcUNszmpFdZM2oulTEW/aMzQTixEUiU3HrkHN5U
	SHuA==
X-Received: by 10.224.72.148 with SMTP id m20mr19468776qaj.24.1364489548133;
	Thu, 28 Mar 2013 09:52:28 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id eb7sm27757987qab.11.2013.03.28.09.52.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 09:52:27 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2013 13:58:13 -0300
Message-Id: <1364489896-25975-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1364489896-25975-1-git-send-email-otavio@ossystems.com.br>
References: <1364489896-25975-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/5] linux-firmware: Remove duplicaed license from rtlwifi subdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2013 17:09:34 -0000

The rtlwifi will is deployed onto /lib/firmware so we don't need to
duplicate it inside of rtlwifi subdir.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 2b05172..a75a0e1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -45,9 +45,6 @@ do_install() {
 	ln -sf libertas/sd8686_v9.bin ${D}/lib/firmware/sd8686.bin
 	ln -sf libertas/sd8686_v9_helper.bin ${D}/lib/firmware/sd8686_helper.bin
 
-	# Realtek rtl8192* 
-	install -m 0644 LICENCE.rtlwifi_firmware.txt ${D}/lib/firmware/rtlwifi/LICENCE.rtlwifi_firmware.txt
-
 	# fixup wl12xx location, after 2.6.37 the kernel searches a different location for it
 	( cd ${D}/lib/firmware ; ln -sf ti-connectivity/* . )
 }
-- 
1.8.1



