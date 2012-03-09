Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S62hm-0002p6-Fu
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 17:30:10 +0100
Received: by mail-yw0-f47.google.com with SMTP id j56so913457yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 08:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=3zU4KS3fqn2UrLnEB2svT9m4LmD+dvtgG8p+8bXeoio=;
	b=OV4wsJUZV1MdXIChM89o4UJXC1Js5w54waij8mBOQdSbKIdpLar34i7fRP3wXoEdUW
	EhrNy4udYyvYhHfp7PH+ty2LxZRJwrOBicZ50f5ryR5BDFT+zhDTcUHZI2GagIKYq/5j
	ij3/0R0becfJf5qVwLv3EOYog0nPx0HRz8M+JMW0mVZvAT/fffjRWnqKB/4vaZR45KBA
	8yr6q0XEcz4dDzVcwj8n9dqtEuDwVp23OsfFWmUeiedZNEn2PklgY7ZiXItwKidq4Fm1
	9S4ogYYsv7zKACzEvBnZA8yTmMuliK9Jo/S0yhaeY+o4eiqg0cFJovNWpW+zm0q+b//b
	JekA==
Received: by 10.236.154.232 with SMTP id h68mr3164659yhk.51.1331310093115;
	Fri, 09 Mar 2012 08:21:33 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id o41sm15000143yhj.7.2012.03.09.08.21.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 08:21:32 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2012 16:21:16 +0000
Message-Id: <bf2df7acf50db86203a81b400d1e59716330eaf5.1331310044.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
References: <cover.1331310044.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
References: <cover.1331310044.git.otavio@ossystems.com.br>
Subject: [PATCH 5/6] dpkg: rename postinst trigger script
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
X-List-Received-Date: Fri, 09 Mar 2012 16:30:11 -0000

Use 'run-postinsts' as trigger script name as it describes better the
intent of it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/dpkg/dpkg.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 69fd50a..09bfbbc 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -42,9 +42,9 @@ do_install_prepend () {
 	# this happens at S98 where our good 'ole packages script used to run
 	printf "#!/bin/sh
 dpkg --configure -a
-rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
-" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
-	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}configure
+rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
+" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
+	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
 }
 
 do_install_append () {
-- 
1.7.2.5



