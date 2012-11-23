Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tbzxt-0002AK-7h for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 21:35:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANKL1oB013577
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 20:21:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04388-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 20:20:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qANKKnMK013549
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 20:20:50 GMT
Message-ID: <1353702048.7657.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2012 20:20:48 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] scripts/sstate-cache-management.sh: Fix stamp handling after recent layout change
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
X-List-Received-Date: Fri, 23 Nov 2012 20:35:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 551d2f2..7d81daf 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -294,7 +294,7 @@ rm_by_stamps (){
   for i in $suffixes; do
       # There is no "\.sigdata" but "_setcene" when it is mirrored
       # from the SSTATE_MIRRORS, use them to figure out the sum.
-      sums=`find $stamps -maxdepth 2 -name "*.do_$i.*" \
+      sums=`find $stamps -maxdepth 3 -name "*.do_$i.*" \
         -o -name "*.do_${i}_setscene.*" | \
         sed -ne 's#.*_setscene\.##p' -e 's#.*\.sigdata\.##p' | \
         sed -e 's#\..*##' | sort -u`




