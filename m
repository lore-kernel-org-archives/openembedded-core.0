Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1S3A8r-0000mN-N0
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 18:50:13 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id AA825F812EF; Thu,  1 Mar 2012 10:41:44 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2012 10:41:37 -0700
Message-Id: <1330623698-25148-2-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1330623698-25148-1-git-send-email-gary@mlbassoc.com>
References: <1330623698-25148-1-git-send-email-gary@mlbassoc.com>
Subject: [PATCH v2 1/2] initscripts: Properly format date when set from timestamp
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
X-List-Received-Date: Thu, 01 Mar 2012 17:50:13 -0000

Reformat date, as stored in /etc/timestamp, to match CLI format.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../initscripts/initscripts-1.0/bootmisc.sh        |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index 20ec0a0..5b86e79 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -71,7 +71,7 @@ then
 	SYSTEMDATE=`date -u +%4Y%2m%2d%2H%2M`
 	read TIMESTAMP < /etc/timestamp
 	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
-		date -u $TIMESTAMP
+		date -u ${TIMESTAMP#????}${TIMESTAMP%????????}
 		/etc/init.d/hwclock.sh stop
 	fi
 fi
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index e16f19f..68701ce 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r131"
+PR = "r132"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.7.6



