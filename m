Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QTjwd-0002pi-OL
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 02:14:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p570Bc48009438
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 17:11:38 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 6 Jun 2011 17:11:37 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jun 2011 19:21:32 -0500
Message-ID: <15dc7d03abd73179735de93624ec8453f36aed8b.1307406014.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307406014.git.mark.hatle@windriver.com>
References: <cover.1307406014.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/3] create-pull-request: Add URL documentation
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
X-List-Received-Date: Tue, 07 Jun 2011 00:14:56 -0000
Content-Type: text/plain

If we can't find the URL, tell the user how to correct the issue.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 scripts/create-pull-request |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index d52098e..7d021d3 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -94,6 +94,9 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
 		REMOTE_URL=$(git config remote.$REMOTE.url)
 		if [ $? -ne 0 ]; then
 			echo "ERROR: git config failed to find a url for '$REMOTE'"
+			echo
+			echo "To add a remote url for $REMOTE, use:"
+			echo "  git config remote.$REMOTE.url <url>"
 			exit 1
 		fi
 
-- 
1.7.3.4



