Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 646BD66114
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 10:40:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4FAe5wd000668
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 03:40:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 03:40:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 18:40:24 +0800
Message-ID: <6fca99c6c3cdd8ae23101dce873f3cf86f221a1c.1400150280.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1400150280.git.Qi.Chen@windriver.com>
References: <cover.1400150280.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] init-live.sh: list block devices correctly
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
X-List-Received-Date: Thu, 15 May 2014 10:40:05 -0000
Content-Type: text/plain

Instead of using 'ls /dev/sd*' command to list block devices, we
should rather use 'cat /proc/partitions'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 9e53a25..0bc38b7 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -134,7 +134,7 @@ do
 	   echo "Mounted filesystems"
            mount | grep media
            echo "Available block devices"
-           ls /dev/sd*
+           cat /proc/partitions
            fatal "Cannot find $ROOT_IMAGE file in /media/* , dropping to a shell "
       fi
       C=$(( C + 1 ))
-- 
1.7.9.5


