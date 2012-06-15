Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SfPg8-00013c-Md
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:06:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5F5u2Hc000759
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jun 2012 22:56:02 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Thu, 14 Jun 2012 22:56:01 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 13:56:10 +0800
Message-ID: <27e7b8dc39fb0a415a2a9452df8f73b3975eec7f.1339739522.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339739522.git.kai.kang@windriver.com>
References: <cover.1339739522.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 4/4] cleanup-workdir: update help text
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
X-List-Received-Date: Fri, 15 Jun 2012 06:06:42 -0000
Content-Type: text/plain

Update the help text to tell user that the files and dirs under WORKDIR
which are not created by Yocto will be deleted.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 scripts/cleanup-workdir |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/cleanup-workdir b/scripts/cleanup-workdir
index 156a259..c748846 100755
--- a/scripts/cleanup-workdir
+++ b/scripts/cleanup-workdir
@@ -65,8 +65,11 @@ def main():
     parser = optparse.OptionParser(
         usage = """%prog
 
-Remove the obsolete packages' build directories in WORKDIR.
-This script must be ran under BUILDDIR after source file \"oe-init-build-env\".""")
+%prog removes the obsolete packages' build directories in WORKDIR.
+This script must be ran under BUILDDIR after source file \"oe-init-build-env\".
+
+Any file or directory under WORKDIR which is not created by Yocto
+will be deleted. Be CAUTIOUS.""")
 
     options, args = parser.parse_args(sys.argv)
 
-- 
1.7.5.4



