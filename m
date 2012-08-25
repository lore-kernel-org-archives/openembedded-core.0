Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5Ilw-0002v7-TB for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 17:59:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PFlWe9008247
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:47:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08209-01 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:47:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PFlOqo008241
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:47:26 +0100
Message-ID: <1345909645.14369.112.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Aug 2012 16:47:25 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] staging.bbclass: Might as well drop the applications, fonts and pixmap directories from ${datadir}
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
X-List-Received-Date: Sat, 25 Aug 2012 15:59:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These cause various file conflicts and aren't useful within the sysroot anyway. We might
as well remove them. Whitelisting the contents of ${datadir} that *is* useful might
be a better option in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 8b3dcb4..82624cb 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -53,6 +53,7 @@ sysroot_stage_dirs() {
 	sysroot_stage_dir $from${datadir} $to${datadir}
 	# We don't care about docs/info/manpages/locales
 	rm -rf $to${mandir}/ $to${docdir}/ $to${infodir}/ ${to}${datadir}/locale/
+	rm -rf $to${datadir}/applications/ $to${datadir}/fonts/ $to${datadir}/pixmaps/
 }
 
 sysroot_stage_all() {




