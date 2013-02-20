Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U82uF-0000BU-8R
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 07:11:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1K5tgcD027808
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 21:55:42 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 19 Feb 2013 21:55:40 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 13:55:34 +0800
Message-ID: <fc06c499d04a1cf82c2d426c17cd2331a6bf718d.1361338900.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1361338900.git.Qi.Chen@windriver.com>
References: <cover.1361338900.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V2 5/5] populate-volatile.sh: remove trailing whitespaces
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
X-List-Received-Date: Wed, 20 Feb 2013 06:11:56 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Remove trailing whitespaces.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts-1.0/populate-volatile.sh           |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 24daeb4..d7937b4 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -48,9 +48,9 @@ create_file() {
 }
 
 mk_dir() {
-	EXEC=" 
-	mkdir -p \"$1\"; 
-	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1; 
+	EXEC="
+	mkdir -p \"$1\";
+	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
-- 
1.7.9.5



