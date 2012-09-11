Received: from ams-iport-4.cisco.com ([144.254.224.147])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TBM7U-0004f1-IE
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 10:46:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=829; q=dns/txt; s=iport;
	t=1347352468; x=1348562068;
	h=from:to:cc:subject:date:message-id;
	bh=sZuKC1dWnoelkuZLFojPEwN3eW1MntGIr0qCWqihwoo=;
	b=ff9B95etmeHMQAAH11TJlQtCwKNKeaJFdsHOUGAAD4xM9baSKfp8fMyZ
	ljfqBPtj61z1PuqhYX24yYyUOiV/sTo3KiYNr1N5NDeYiI2leEeUhONrs
	Tam8ieGPjw3EXVILJpnCdFzkMNPdBUlDzyTkF7X2Sk4zbcMPK+bSdzyAw U=;
X-IronPort-AV: E=Sophos;i="4.80,402,1344211200"; 
   d="scan'208";a="7956640"
Received: from ams-core-4.cisco.com ([144.254.72.77])
	by ams-iport-4.cisco.com with ESMTP; 11 Sep 2012 08:33:21 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id q8B8XLjN011002;
	Tue, 11 Sep 2012 08:33:21 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 10:29:49 +0200
Message-Id: <1347352189-30965-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH 1/2] bash: Make bash_3.2.48 a nativesdk package.
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
X-List-Received-Date: Tue, 11 Sep 2012 08:46:56 -0000

3.2.48 is the bash package in oe-core which is not GPLv3. Making that a nativesdk
package makes sure we have the same bash version in our toolchain as in our image.

Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
---
 meta/recipes-extended/bash/bash_3.2.48.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 509d7a0..c317a02 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -48,3 +48,5 @@ pkg_postinst_${PN} () {
 	grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >> $D${sysconfdir}/shells
 	grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
 }
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.8.6



