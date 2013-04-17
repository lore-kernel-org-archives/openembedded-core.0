Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1USOqw-0002g1-CE
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 11:41:09 +0200
Received: from mail102-ch1-R.bigfish.com (10.43.68.232) by
	CH1EHSOBE013.bigfish.com (10.43.70.63) with Microsoft SMTP Server id
	14.1.225.23; Wed, 17 Apr 2013 09:23:02 +0000
Received: from mail102-ch1 (localhost [127.0.0.1])	by
	mail102-ch1-R.bigfish.com (Postfix) with ESMTP id 4E0FB80205	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 09:23:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275chz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail102-ch1 (localhost.localdomain [127.0.0.1]) by mail102-ch1
	(MessageSwitch) id 1366190580636325_27081;
	Wed, 17 Apr 2013 09:23:00 +0000 (UTC)
Received: from CH1EHSMHS039.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.227])	by mail102-ch1.bigfish.com (Postfix) with ESMTP id
	8E0651A0053	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 09:23:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS039.bigfish.com
	(10.43.69.248) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 17 Apr 2013 09:22:59 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 17 Apr 2013 09:22:58 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r3H9MtLO027740;	Wed, 17 Apr 2013 02:22:56 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2013 17:22:54 +0800
Message-ID: <1366190574-13170-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] ltp: upgrade to 20130109 release
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
X-List-Received-Date: Wed, 17 Apr 2013 09:41:13 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

license changed: http://ltp.git.sourceforge.net/git/gitweb.cgi
commit	4548c6cf9bcdd96d8303caa4130ab638b61f8a30
Update FSF address
find . -type f -exec sed -i 's/675 Mass Ave, Cambridge, MA 02139, USA/51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA/g' {} \;
find . -type f -exec sed -i 's/59 Temple Place, Suite 330, Boston, MA 02111-1307 USA/51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA/g' {} \;

Change-Id: I88db5b1e53645a5fe083684fdc47a80266266c21
Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../ltp/{ltp_20120903.bb => ltp_20130109.bb}       |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20120903.bb => ltp_20130109.bb} (90%)

diff --git a/meta/recipes-extended/ltp/ltp_20120903.bb b/meta/recipes-extended/ltp/ltp_20130109.bb
similarity index 90%
rename from meta/recipes-extended/ltp/ltp_20120903.bb
rename to meta/recipes-extended/ltp/ltp_20130109.bb
index 87c45b0..3496379 100644
--- a/meta/recipes-extended/ltp/ltp_20120903.bb
+++ b/meta/recipes-extended/ltp/ltp_20130109.bb
@@ -12,21 +12,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
 		    file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
 		    file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-		    file://tools/netpipe-2.4/COPYING;md5=18810669f13b87348459e611d31ab760 \
-		    file://tools/netpipe-2.4-ipv6/COPYING;md5=18810669f13b87348459e611d31ab760 \
-		    file://tools/top-LTP/proc/COPYING;md5=6e29c688d912da12b66b73e32b03d812 \
+		    file://tools/netpipe-2.4/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa \
+		    file://tools/netpipe-2.4-ipv6/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa \
+		    file://tools/top-LTP/proc/COPYING;md5=aefc88eb8a41672fbfcfe6b69ab8c49c \
 		    file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		"
 
 DEPENDS = "attr libaio libcap"
 
-PR = "r2"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
 
-SRC_URI[md5sum] = "3c885047b137a6955e087ad20807a018"
-SRC_URI[sha256sum] = "41d2f4cd88619aa7b5cdad93cb7691b69166f7751bc9f2f72558937cbef581c2"
+SRC_URI[md5sum] = "06974c85542c78b6b6ff74ac3ac3a5d3"
+SRC_URI[sha256sum] = "471b21f1d6f952957f534cd0c5ee5bcbbf50b9fcb83519b0293be141e6f2338d"
 
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
-- 
1.7.5.4




