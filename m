Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8VlR-000268-70 for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 12:56:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GBlLjS002343
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 11:47:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01393-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 11:47:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GBlCH6002337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 11:47:13 GMT
Message-ID: <1331898432.18586.177.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 11:47:12 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] flac: Fix license warning
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
X-List-Received-Date: Fri, 16 Mar 2012 11:56:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

WARNING: flac: No generic license file exists for: FDLv1.2 in any provider

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index 5a9c66f..3c5b73c 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "FLAC stands for Free Lossless Audio Codec, an audio format simila
 HOMEPAGE = "http://flac.sourceforge.net/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=13478&atid=113478"
 SECTION = "libs"
-LICENSE = "FDLv1.2 & GPLv2+ & LGPLv2.1+ & BSD"
+LICENSE = "GFDL-1.2 & GPLv2+ & LGPLv2.1+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
                     file://src/Makefile.am;beginline=1;endline=16;md5=8dee151a56a3122f064a9dce771db37d \
                     file://COPYING.GPL;md5=079b27cd65c86dbc1b6997ffde902735 \




