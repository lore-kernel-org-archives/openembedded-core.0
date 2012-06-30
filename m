Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SklUB-00043X-RP
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 02:24:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5U0DUIB006551
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 17:13:30 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 29 Jun 2012 17:13:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 19:22:37 -0500
Message-ID: <3112d19714501de42e197c3e05247065bbfea57a.1341015667.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341015667.git.mark.hatle@windriver.com>
References: <cover.1341015667.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] libc-common: Allow debug package to append, not set depends
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
X-List-Received-Date: Sat, 30 Jun 2012 00:24:28 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/libc-common.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 9b91f0a..8145d64 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -29,7 +29,7 @@ python populate_packages_prepend () {
 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
 		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
 		# For backward compatibility with old -dbg package
-		d.setVar('RPROVIDES_' + bpn + '-dbg', 'libc-dbg')
-		d.setVar('RCONFLICTS_' + bpn + '-dbg', 'libc-dbg')
-		d.setVar('RREPLACES_' + bpn + '-dbg', 'libc-dbg')
+		d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
+		d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
+		d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
 }
-- 
1.7.3.4



