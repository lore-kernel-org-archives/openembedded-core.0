Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TwiNP-0001En-JO for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 01:03:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0JNlfmK004719
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 23:47:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05510-10 for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 23:47:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0JNlaDH004713
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 23:47:36 GMT
Message-ID: <1358639256.14265.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 19 Jan 2013 23:47:36 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] cpan_build: Fix bashism
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
X-List-Received-Date: Sun, 20 Jan 2013 00:03:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fix a build failure caused by a bashism and improve quoting whilst in
the area.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bbclass
index 0809602..78592be 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -20,7 +20,7 @@ def cpan_build_dep_prepend(d):
 DEPENDS_prepend = "${@cpan_build_dep_prepend(d)}"
 
 cpan_build_do_configure () {
-	if [ ${@is_target(d)} == "yes" ]; then
+	if [ "${@is_target(d)}" = "yes" ]; then
 		# build for target
 		. ${STAGING_LIBDIR}/perl/config.sh
 	fi




