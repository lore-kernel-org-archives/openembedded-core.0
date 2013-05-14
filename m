Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Uc9IH-0001Wp-5U
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 09:05:15 +0200
Received: by mail-pa0-f44.google.com with SMTP id jh10so237907pab.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 23:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=7z6AkQaBoKZ6dAFJFB1V2fbNr+5Rlv0TdjQO6Ysctg4=;
	b=cyza4fpmGp5fYoSKNfG+M+QL4WZ0sT7qK4/IL7D/M/6po1RSEX3hsSjJzfBHjX5SK4
	P12gjsk6PJtzeEzHDvuz3cd6yHMQyS4NqK7LyxKm/Fl5cYqoVCW4CvHJ87X5fIG/wb+q
	A834WIKqfcJ305ck0gJ8gLg8ZyBn4U8393n2A0XGNwXIoY2k4WuNqTLoXkPtp8ykVl1m
	HFHbDWhNFuuEDG36BoBP0SwHKZXRWr1yrn4hUOaLbckvmU+05sFI2eNmqggsoZgxT18p
	CKtB+cN5ipJLNWl0NYEw3ynVHPaV+y9/P285aL83hF/p6AUtU6zoG4sbtAw9ddYKEoXS
	R7dg==
X-Received: by 10.68.88.129 with SMTP id bg1mr32324100pbb.10.1368514013734;
	Mon, 13 May 2013 23:46:53 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id k2sm18106191pat.7.2013.05.13.23.46.52
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 23:46:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 23:45:18 -0700
Message-Id: <1368513918-16448-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] pam: Add libtirpc to build dependencies
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
X-List-Received-Date: Tue, 14 May 2013 07:05:25 -0000
X-List-Received-Date: Tue, 14 May 2013 07:05:25 -0000

libtirpc is looked for by configure and if found
its enabled. So lets make it consistent and enable
it always

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index c355634..581f687 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "bab887d6280f47fc3963df3b95735a27a16f0f663636163ddf3acab5f1
 
 SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
 
-DEPENDS = "bison flex flex-native cracklib"
+DEPENDS = "bison flex flex-native cracklib libtirpc"
 
 EXTRA_OECONF = "--with-db-uniquename=_pam \
                 --includedir=${includedir}/security \
-- 
1.7.9.5



