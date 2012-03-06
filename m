Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4yG1-0004il-Oa
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:33:05 +0100
Received: by yenm3 with SMTP id m3so2303574yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:24:29 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.101.5.24 as permitted sender) client-ip=10.101.5.24; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.101.5.24 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.101.5.24])
	by 10.101.5.24 with SMTP id h24mr10917336ani.45.1331054669525 (num_hops
	= 1); Tue, 06 Mar 2012 09:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=syZBNgyCmXN/IPlzw2nAEDz61ZfmL2ffVA9bzGpDvMY=;
	b=WKI78ck4RyI6eAIBDEQW+JQo5L4mkFbwxLOaFQvydgujpKCltUKWlSoRuyvFavyOZ5
	zeEWlQgx400GLE9yklSatDPR9VrdBkP7LjyJNThx5MbxBqq7VZE9N7B2jA8mRGYO6Sah
	iB7fNdH7gHoaLus06ASrF8cNu0aAyZWNYJofzcPofveKN+ft+b2zm4kaoptEaDYlTr0w
	/Jn/61bX3YydKgfhQX/Rd+jc6ZC1Iqn+Svsa3ODfo/qmC2+40VXYro1Zf8pYM/3S9QCj
	vi4+HEuErJGkCQjPcPgMCq5Kl+1yNNHdhxOMHDypRHxFT7EyrO2LZHEQzmysGCi1LU3B
	SKpQ==
Received: by 10.101.5.24 with SMTP id h24mr8664909ani.45.1331054669466;
	Tue, 06 Mar 2012 09:24:29 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm50620004yhj.7.2012.03.06.09.24.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 09:24:28 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 17:24:14 +0000
Message-Id: <8d538d914e85c76eb3a466ca7d3dbae26a06a52b.1331054558.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331054558.git.otavio@ossystems.com.br>
References: <cover.1331054558.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331054558.git.otavio@ossystems.com.br>
References: <cover.1331054558.git.otavio@ossystems.com.br>
Subject: [PATCH v2 4/5] opkg: rename postinst trigger script
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
X-List-Received-Date: Tue, 06 Mar 2012 17:33:06 -0000

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



