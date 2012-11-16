Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TZOCx-0001zD-FN for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 16:51:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAGFbv1p000811
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 15:37:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32638-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 15:37:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAGFbmDR000805
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 15:37:49 GMT
Message-ID: <1353080270.3709.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Nov 2012 15:37:50 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bitbake.conf: Change WORKDIR to split by PN and version into seperate directories
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
X-List-Received-Date: Fri, 16 Nov 2012 15:51:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This changes WORKDIR to match the previous STAMP layout changes for the same reasons.

[I'll merge this into the other patch before merging, not sure why this
came out as two separate patches in my tree]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 897ca90..450a0ee 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -339,7 +339,7 @@ HGDIR = "${CO_DIR}/hg"
 
 STAMP = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
 STAMPCLEAN = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
-WORKDIR = "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}"
+WORKDIR = "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"




