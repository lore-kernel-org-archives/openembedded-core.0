Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S3t47-0000cJ-FF
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 18:48:19 +0100
Received: by mail-yx0-f175.google.com with SMTP id m3so1171174yen.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2012 09:39:49 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.197.100 as permitted sender) client-ip=10.236.197.100; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.197.100 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.197.100])
	by 10.236.197.100 with SMTP id s64mr19314539yhn.108.1330796389253
	(num_hops = 1); Sat, 03 Mar 2012 09:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=V9BmsV29Mew6B+SjsfwSi+sOKnhXi/wL6qk06GPJffw=;
	b=RB4SIZioF21QIUjDAb8Te2MVX4Fk2ooGNVf/7uRKncxmJxgSefCPWh1BHLB1KNJbdi
	4wmcf+v2L2MbZA6ZV5MtMOZptYQrTp9B05Ed65zknnxvGaR1ALXNmCpCSBB3ZGvp+Wny
	jtQNT6tve18ZjD0fZEsWIcpJDWGwp79KVW7wqJAPP0KNinD3cmcjYEZ/tDTin9LYIFDC
	Pl6JfptsUuEULt4SaIkJuWIAN8y0nS8Njyne06eYEh8djBNlM77RtMbeFyTqRl39s5Jz
	ry6m79K9L9Q7SOFvVKgkFrHNY5SmnY+J6yYxhCzjAgBS3AKcoJWky0H4gi33CYiXhRIh
	nNsA==
Received: by 10.236.197.100 with SMTP id s64mr15339574yhn.108.1330796389215;
	Sat, 03 Mar 2012 09:39:49 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o11sm15284275anl.11.2012.03.03.09.39.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 09:39:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2012 17:39:34 +0000
Message-Id: <719474c13dc70a5af0e5254648a8e0ff06e2bf0b.1330796256.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330796256.git.otavio@ossystems.com.br>
References: <cover.1330796256.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330796256.git.otavio@ossystems.com.br>
References: <cover.1330796256.git.otavio@ossystems.com.br>
Subject: [PATCH 4/4] opkg: rename postinst trigger script
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
X-List-Received-Date: Sat, 03 Mar 2012 17:48:19 -0000

Use 'run-postinsts' as trigger script name for consistency against
package managers.

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



