Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U3b25-000427-BT
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:37:33 +0100
Received: by mail-pa0-f53.google.com with SMTP id bg4so1669840pad.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2013 15:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=0fQuPDYNDfbv41b5jV0r6/u+LGTJgzx0hFchQkWxTa4=;
	b=FbHWoXJb+y3MeUlo/2Hkd+jqyzmk1OTeiAO4XO85unhR77rH3J4UupqRavwUAKSpx6
	DHf9YSgtRNKY4N0rEfAw0nM7wGjPzX4OYxDv77rkGLPZCq/Gxk6gYtY8bk+2C3Ar8RXt
	WoUZKu6XZTG+AoYTKb9HLH1Np/N/AsXO6DJq4IDIUargADdHdbJyShjCt5Nr8PYEhRAj
	gN0IjkSrLv89wdCE+rhTZRw10bmGLQ/v32/FGruaxuc7kfzb/VxEadtdOk7Grs/k/xgp
	1pA6T/v3fGPE2qWhtwEz7T52zJlBIpwFw8JYNxAuAzxI8BoNTgLMPKeQkDaZC6dolsbk
	4jTw==
X-Received: by 10.66.52.79 with SMTP id r15mr6162966pao.46.1360245701329;
	Thu, 07 Feb 2013 06:01:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id x2sm46232354paw.8.2013.02.07.06.01.38
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Feb 2013 06:01:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2013 15:01:31 +0100
Message-Id: <1360245691-7589-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] qemu: disable smartcard support
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
X-List-Received-Date: Thu, 07 Feb 2013 23:37:33 -0000

* sometimes it's autodetected and fails to build:
  | /usr/bin/ld: libcacard/.libs/cac.o: Relocations in generic ELF (EM:40)
  | libcacard/.libs/cac.o: could not read symbols: File in wrong format
  | collect2: ld returned 1 exit status
  | make[1]: *** [libcacard.la] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2b60347..6c44b31 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,7 +32,7 @@ SRC_URI_append_class-nativesdk = "\
     file://relocatable_sdk.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman --disable-smartcard"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
 				--disable-curl \
-- 
1.8.1.2



