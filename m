Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QZ5b7-0002AT-CR
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:22:49 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Tue, 21 Jun 2011
	20:19:15 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 20:18:55 +0200
Message-ID: <4e9efffb9118e29178d087577c0cebb360872ebe.1308680000.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308680000.git.anders@chargestorm.se>
References: <cover.1308680000.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [RFC PATCH 3/5] linux-kernel-base: add support for Linux 3.x
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
X-List-Received-Date: Tue, 21 Jun 2011 18:22:49 -0000
Content-Type: text/plain

Return 2.X as major version for kernels 2.X, and return
X for kernels X.Y (X>=3).

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/classes/linux-kernel-base.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
index 510951a..fa32379 100644
--- a/meta/classes/linux-kernel-base.bbclass
+++ b/meta/classes/linux-kernel-base.bbclass
@@ -29,6 +29,9 @@ def get_kernelmajorversion(p):
 	r = re.compile("([0-9]+\.[0-9]+).*")
 	m = r.match(p);
 	if m:
+		i = m.group(1).partition('.')[0]
+		if int(i) > 2:
+			return i
 		return m.group(1)
 	return None
 
-- 
1.7.4.1



