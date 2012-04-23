Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMRE7-0000ae-TU for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 23:55:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3NLjkut026471
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 22:45:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26108-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 22:45:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3NLjane026465
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 22:45:37 +0100
Message-ID: <1335217536.12692.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Apr 2012 22:45:36 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH[ bitbake.conf: Add a STAGING_BASELIBDIR variable that recipes can use to find base_libdir
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
X-List-Received-Date: Mon, 23 Apr 2012 21:55:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 911854b..56e3e4d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -340,6 +340,7 @@ STAGING_DATADIR_NATIVE =
"${STAGING_DIR_NATIVE}${datadir_native}"
 STAGING_DIR_HOST = "${STAGING_DIR}/${MACHINE}"
 STAGING_BINDIR = "${STAGING_DIR_HOST}${bindir}"
 STAGING_LIBDIR = "${STAGING_DIR_HOST}${libdir}"
+STAGING_BASELIBDIR = "${STAGING_DIR_HOST}${base_libdir}"
 STAGING_INCDIR = "${STAGING_DIR_HOST}${includedir}"
 STAGING_DATADIR = "${STAGING_DIR_HOST}${datadir}"
 STAGING_EXECPREFIXDIR = "${STAGING_DIR_HOST}${exec_prefix}"




