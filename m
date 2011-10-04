Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RB4MH-0003aO-He for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 14:44:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94CjOZv032307 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 13:45:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kPYLkRdV7O7p
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 13:45:24 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94CjLMM032303
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 13:45:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 13:38:51 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317731939.14671.36.camel@ted>
Mime-Version: 1.0
Subject: autotools.bbclass: Allow dependency tracking option to be easily overridden
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
X-List-Received-Date: Tue, 04 Oct 2011 12:44:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index ff27842..a4ce851 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -64,8 +64,10 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --infodir=${infodir} \
 		  --mandir=${mandir} \
 		  --disable-silent-rules \
-		  --disable-dependency-tracking \
+		  ${CONFIGUREOPT_DEPTRACK} \
 		  ${@append_libtool_sysroot(d)}"
+CONFIGUREOPT_DEPTRACK = "--disable-dependency-tracking"
+
 
 oe_runconf () {
 	if [ -x ${S}/configure ] ; then




