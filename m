Received: from mail-pd0-f182.google.com ([209.85.192.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UcoA3-000381-2T
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 04:43:29 +0200
Received: by mail-pd0-f182.google.com with SMTP id 3so1882549pdj.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 19:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=BLKSkvxiM3OSzgkEg0/BgmBigiHxhUtLvYWhhVIzVVg=;
	b=wUT1uRx9mFAMqBzJmhLBpAsbQ1WyGAgQ222MsAxHKYvyDNshsTzj2/KBItEJDJ/sQ0
	dGIr3pdTRXJy4v0Yav3sF9DuoxvHdCXjPZNyGZwKoWy8arPGPH7S8tZqIWys1XX6SbRY
	liK3HE+q+HSgrSiWHemEtInE6UjuqpioA9OtNtgxcWSlgasEth/2nZC404Uj1gtBQGzg
	j05hkR/C0tFhrnXsxYZbyqQItOim9Rh0FrdUF1akHY9kNHO4MBf4kWG4ogMoNhPcoAG4
	B3xAo2P665PyAjRjmfd9v7bGgO+jPDVCn3Q414jOQyRr336bj3/hKSWiL9nOufp3k2Vi
	YajA==
X-Received: by 10.66.221.70 with SMTP id qc6mr20630292pac.10.1368671104923;
	Wed, 15 May 2013 19:25:04 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id aa8sm5445571pad.14.2013.05.15.19.25.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 15 May 2013 19:25:03 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2013 12:37:33 +1000
Message-Id: <1368671853-19610-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] opkg: remove unnecessary extra leading slash in run-postinsts
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
X-List-Received-Date: Thu, 16 May 2013 02:43:55 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/opkg/opkg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index c34ac5b..631aafc 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -69,7 +69,7 @@ if [ "x$D" != "x" ] && [ -f $D${OPKGLIBDIR}/opkg/status ]; then
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
 opkg-cl configure ${REDIRECT_CMD}
-rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
+rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 " > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 fi
-- 
1.8.2.3



