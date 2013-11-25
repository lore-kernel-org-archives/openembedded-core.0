Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB306D12C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 10:34:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAPAY1ax027792
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 02:34:01 -0800 (PST)
Received: from otp-fsarbu-l1.corp.ad.wrs.com (128.224.171.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Mon, 25 Nov 2013 02:34:00 -0800
From: Florin Sarbu <florin.sarbu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Nov 2013 12:33:50 +0200
Message-ID: <1385375630-4260-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.171.135]
Subject: [bitbake-devel] bitbake: fetch2: Remove the unused urldata from the git fetcher.
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
X-List-Received-Date: Mon, 25 Nov 2013 10:34:02 -0000
Content-Type: text/plain

Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
---
 bitbake/lib/bb/fetch2/git.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index b236631..a9470e4 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -125,7 +125,7 @@ class Git(FetchMethod):
             if not ud.revisions[name] or len(ud.revisions[name]) != 40  or (False in [c in "abcdef0123456789" for c in ud.revisions[name]]):
                 if ud.revisions[name]:
                     ud.branches[name] = ud.revisions[name]
-                ud.revisions[name] = self.latest_revision(ud.url, ud, d, name)
+                ud.revisions[name] = self.latest_revision(ud, d, name)
 
         gitsrcname = '%s%s' % (ud.host.replace(':','.'), ud.path.replace('/', '.').replace('*', '.'))
         # for rebaseable git repo, it is necessary to keep mirror tar ball
-- 
1.8.3.2


