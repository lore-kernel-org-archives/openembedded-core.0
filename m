Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBNQV-0008K4-Hr
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 12:10:39 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 02:58:06 -0700
Received: by wibhq4 with SMTP id hq4so2880339wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 02:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Ytm6DolQx1DnNF4ZI5nfeWf2tIzhTeBTGivvsNRPuzA=;
	b=pcYE/Wx6lJv3rGVp41vd0A0t3oiOlmECwqDcu+89ER5nbCMinVlOdPmtre8XTGNJLk
	n5kDPwbi6K3owzrJatNgCz6hOTg6izmG/isArTxjjrm1mtxGl551bkk255xGZHkShaEW
	bpkxBzK/OZrp4hEDNYPWomkBmSZ6Se65hlSK6EZGL/tsw4Mq0Bw3g7lc8vsJXKs01QP6
	bWeneP3qEoWUaST8/dJuvVqaK6IWVXPqQi0vI71ghY9Ql8X8DIJPc1gZqCoZs9IacY32
	dnVUAwC6PX7ePLHCUqai5HKDGTEGWphCNqkbGyXI8PWYU/K1IB7zQ4zm9VhZvkoQUaxb
	dwgg==
Received: by 10.216.133.148 with SMTP id q20mr8923650wei.201.1347357484610;
	Tue, 11 Sep 2012 02:58:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bc2sm2825970wib.0.2012.09.11.02.58.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 02:58:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 10:57:15 +0100
Message-Id: <1347357435-22083-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkCnJxTOiuApzwGcxKCzyk7l5Gjfo6Hb/c3vX8cYXDLWiQlavjn7qcAx+D+4dM8+fs4ujPM
Subject: [PATCH] connman: remove trailing whitespace
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
X-List-Received-Date: Tue, 11 Sep 2012 10:10:40 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 59ec1fa..5b94a1e 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -1,5 +1,5 @@
 SUMMARY = "A daemon for managing internet connections within embedded devices"
-DESCRIPTION = "The ConnMan project provides a daemon for managing \ 
+DESCRIPTION = "The ConnMan project provides a daemon for managing \
 internet connections within embedded devices running the Linux \
 operating system.  The Connection Manager is designed to be slim and \
 to use as few resources as possible, so it can be easily integrated. \
-- 
1.7.10



