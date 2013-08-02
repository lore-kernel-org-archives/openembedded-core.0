Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 805B56B4C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 07:52:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r727qr69010902
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Aug 2013 00:52:53 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 2 Aug 2013 00:52:52 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2013 15:52:58 +0800
Message-ID: <df597c576dddb5c32bab00dc28646f425740dba3.1375429844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375429844.git.Qi.Chen@windriver.com>
References: <cover.1375429844.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 3/4] xtscal: fix bashism
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2013 07:52:52 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../xtscal/xtscal/30xTs_Calibrate.sh               |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xtscal/xtscal/30xTs_Calibrate.sh b/meta/recipes-graphics/xtscal/xtscal/30xTs_Calibrate.sh
index b8383bf..fa43617 100644
--- a/meta/recipes-graphics/xtscal/xtscal/30xTs_Calibrate.sh
+++ b/meta/recipes-graphics/xtscal/xtscal/30xTs_Calibrate.sh
@@ -8,6 +8,6 @@ if [ "$HAVE_TOUCHSCREEN" = "1" ]; then
 	do
 	   /usr/bin/xtscal
 	   sleep 1
-	   let "n += 1"
+	   n=$(($n+1))
 	done
 fi
-- 
1.7.9.5


