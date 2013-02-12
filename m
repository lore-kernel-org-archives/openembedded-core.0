Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Kolcsar@windriver.com>) id 1U5MGn-0002Sr-1O
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 21:16:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1CGVW8H017033
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 08:31:32 -0800 (PST)
Received: from [128.224.19.178] (128.224.19.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 08:31:31 -0800
Message-ID: <1360686690.7843.5.camel@rockMachine>
From: Pete Kolcsar <peter.kolcsar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2013 18:31:30 +0200
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
MIME-Version: 1.0
Subject: [PATCH] - squashfs add missing SQUASHFS_FILE_MAX_LOG define in squashfs_fs.h file to fix unsquashfs build.
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
X-List-Received-Date: Tue, 12 Feb 2013 20:16:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

--- a/squashfs_fs.h	2011-02-11 17:49:24.000000000 +0200
+++ b/squashfs_fs.h	2013-02-12 15:53:04.360256607 +0200
@@ -36,9 +36,9 @@
 
 /* default size of data blocks */
 #define SQUASHFS_FILE_SIZE		131072
-#define SQUASHFS_FILE_LOG		17
 
 #define SQUASHFS_FILE_MAX_SIZE		1048576
+#define SQUASHFS_FILE_MAX_LOG		20
 
 /* Max number of uids and gids */
 #define SQUASHFS_IDS			65536




