Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SS7NV-0006TB-N0
	for Openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 15:56:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q49DkZDX022496
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 06:46:35 -0700 (PDT)
Received: from ord-jrw.wrs.com (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 06:46:35 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2012 08:46:32 -0500
Message-ID: <1336571192-15711-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
Subject: [PATCH] .gitignore: add /bitbake to the ignore list for external distributions
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
X-List-Received-Date: Wed, 09 May 2012 13:56:30 -0000
Content-Type: text/plain

External distributions based on the oe-core will typically include
bitbake in the top level directory.  The idea is to make it easy
for external distributions to easily assemble a distribution
with a pristine version of oe-core, add avoid the git untracked messages:

 # Untracked files:
 #   (use "git add <file>..." to include in what will be committed)
 #
 #       bitbake/

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .gitignore |    1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 04e36c5..366151c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,4 @@
+/bitbake
 *.pyc
 *.pyo
 build*/conf/local.conf
-- 
1.7.10



