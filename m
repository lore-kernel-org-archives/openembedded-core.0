Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yi.Zhao@windriver.com>) id 1SAFG1-0000l0-3m
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 07:42:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2L6XwlL004799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 23:33:58 -0700 (PDT)
Received: from localhost (128.224.162.177) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 20 Mar 2012 23:33:59 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 14:33:49 +0800
Message-ID: <fc8230099877dffac09cc0ac4c5f81faa94236b7.1332311035.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1332311035.git.yi.zhao@windriver.com>
References: <cover.1332311035.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.177]
Subject: [PATCH 1/1] scripts/qemuimage-testlib: fix typos
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
X-List-Received-Date: Wed, 21 Mar 2012 06:42:53 -0000
Content-Type: text/plain

---
 scripts/qemuimage-testlib |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 222e363..7bdaa4f 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -83,7 +83,7 @@ Test_SCP()
 	local src=$2
 	local des=$3
 	local tmpfile=`mktemp`
-	local timeout=60
+	local time_out=60
 	local ret=0
 
 	# We use expect to interactive with target by ssh
@@ -116,7 +116,7 @@ Test_SSH()
 	shift
 	local command=$@
 	local tmpfile=`mktemp`
-	local timeout=60
+	local time_out=60
 	local ret=0
 	local exp_cmd=`cat << EOF
 eval spawn ssh -o UserKnownHostsFile=$tmpfile root@$ip_addr "$command"
-- 
1.7.1



