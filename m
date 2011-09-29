Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9I4D-0003MI-Tb for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 16:58:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TExPY2003283 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 15:59:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R5QVg2bvvk8P
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 15:59:25 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TExLBr003278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 15:59:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 15:52:56 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317307983.12332.90.camel@ted>
Mime-Version: 1.0
Subject: autotools: Disable dependency tracking
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
X-List-Received-Date: Thu, 29 Sep 2011 14:58:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is no point in us spending time generating a ton of dependency
information in source directories when we don't actually use it
for our one off builds. We might as well disable the option and
take the speed up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index c05ab4b..ff27842 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -64,6 +64,7 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --infodir=${infodir} \
 		  --mandir=${mandir} \
 		  --disable-silent-rules \
+		  --disable-dependency-tracking \
 		  ${@append_libtool_sysroot(d)}"
 
 oe_runconf () {



