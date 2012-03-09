Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S62hl-0002vM-0a
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 17:30:09 +0100
Received: by mail-gy0-f175.google.com with SMTP id z2so914506ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 08:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=syZBNgyCmXN/IPlzw2nAEDz61ZfmL2ffVA9bzGpDvMY=;
	b=N/Tz2DPtc8Emg8xL7VPPmiz93kU4Cr402Z9GtBwzAdZBRS1XF1Gmyux+2/AI+ER3ph
	ITA+HQPuPk2S7cbwrMQMuUC2rfXWsRr18DU8eY4ebmbt0z4sVQ5ETseYyi62yHPuJd1Z
	mt11gPM2I50na1vQYjIITlQcWKuyXeXOT3TlBDLkn6o0kXETtngT793XZnJj1z9xxpJ4
	fhvgLc3yuaRMwhNP3/pP/pFQLWFHrlpMYfnF/l85MFU5uIeWtKTFgMZVfZkmRT6bf79c
	j+nhF005rxicGpQwm2aIao4B4hL0LCCIY8zwRsPo0r7d2yTyM1Q2qSsGizooHLOxBvET
	OMFg==
Received: by 10.236.102.230 with SMTP id d66mr3042610yhg.72.1331310091640;
	Fri, 09 Mar 2012 08:21:31 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm15000143yhj.7.2012.03.09.08.21.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 08:21:30 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 16:21:15 +0000
Message-Id: <96971e5660b4883a9d98b0b33ca75b48b15307c3.1331310044.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
References: <cover.1331310044.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
References: <cover.1331310044.git.otavio@ossystems.com.br>
Subject: [PATCH 4/6] opkg: rename postinst trigger script
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
X-List-Received-Date: Fri, 09 Mar 2012 16:30:09 -0000

Use 'run-postinsts' as trigger script name as it describes better the
intent of it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/opkg/opkg.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index a67066f..689bd4a 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -11,7 +11,7 @@ DEPENDS_virtclass-native = "curl-native"
 DEPENDS_virtclass-nativesdk = "curl-nativesdk"
 
 PE = "1"
-INC_PR = "r7"
+INC_PR = "r8"
 
 FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/opkg"
 
@@ -60,9 +60,9 @@ if [ "x$D" != "x" ]; then
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
 opkg-cl configure
-rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
-" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
-	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
+" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
+	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 fi
 
 update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
-- 
1.7.2.5



