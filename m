Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8Z6e-0007DT-Iq for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 16:30:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GFLTiT004460
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:21:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04374-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:21:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GFLJhB004453
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 15:21:20 GMT
Message-ID: <1331911280.18586.191.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 15:21:20 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] foomatic-filters: Ensure cups and ppr files are packaged
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
X-List-Received-Date: Fri, 16 Mar 2012 15:30:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
index e3bcf78..b8f0c7a 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
@@ -36,4 +36,4 @@ do_install_append_linuxstdbase() {
     ln -sf ${bindir}/foomatic-rip ${D}${exec_prefix}/lib/cups/filter
 }
 
-FILES_${PN}_append_linuxstdbase += "${exec_prefix}/lib/cups/filter/foomatic-rip"
+FILES_${PN} += "${exec_prefix}/lib/cups/ ${exec_prefix}/lib/ppr/"




