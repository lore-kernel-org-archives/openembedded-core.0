Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Srqu1-0005Qo-CN for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 15:36:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JDP3Vx002569
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:25:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02518-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:24:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JDOtFs002559
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 14:24:56 +0100
Message-ID: <1342704299.7940.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 14:24:59 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] staging.bbclass: Also don't bother staging locale files, its pointless
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
X-List-Received-Date: Thu, 19 Jul 2012 13:36:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 1af9b15..cf160a7 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -51,8 +51,8 @@ sysroot_stage_dirs() {
 		sysroot_stage_libdir $from${base_libdir} $to${base_libdir}
 	fi
 	sysroot_stage_dir $from${datadir} $to${datadir}
-	# We don't care about docs/info/manpages
-	rm -rf $to${mandir}/ $to${docdir}/ $to${infodir}/
+	# We don't care about docs/info/manpages/locales
+	rm -rf $to${mandir}/ $to${docdir}/ $to${infodir}/ ${to}${datadir}/locale/
 }
 
 sysroot_stage_all() {




