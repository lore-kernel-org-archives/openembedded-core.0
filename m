Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4076B2BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 02:00:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6O20mt5007660
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 19:00:48 -0700 (PDT)
Received: from localhost (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 23 Jul 2013 19:00:46 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jul 2013 10:00:38 +0800
Message-ID: <40d54b37721400b9a49efe78bcc86f6f9dfd8d49.1374556931.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374556931.git.yi.zhao@windriver.com>
References: <cover.1374556931.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.215]
Subject: [PATCH 1/2] LSB_Test.sh: add -f option for curl
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
X-List-Received-Date: Wed, 24 Jul 2013 02:00:47 -0000
Content-Type: text/plain

In normal cases when a HTTP server fails to deliver a file, it returns
an HTML document to describe the reason (e.g. 404 Not Found). The curl
will output this page as a file and do not return error. Add a "-f"
option will prevent curl from outputting that and return error.

[YOCTO #4895]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index f14f485..af1d61c 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -128,7 +128,7 @@ CURL=`which curl`
 WGET=`which wget`
 if [ ! -z ${CURL} ]
 then
-	DOWNLOAD_CMD="${CURL} -R -L --retry 3 --retry-delay 4 --connect-timeout 180 --compressed -C - -o"
+	DOWNLOAD_CMD="${CURL} -R -L -f --retry 3 --retry-delay 4 --connect-timeout 180 --compressed -C - -o"
 elif [ ! -z ${WGET} ]
 then
 	DOWNLOAD_CMD="${WGET} -c -t 5 -O"
-- 
1.7.9.5


