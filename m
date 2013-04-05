Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1UO8wd-0003lz-A5
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 17:52:51 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Fri, 5 Apr 2013
	17:35:36 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 501992837E9;
	Fri,  5 Apr 2013 17:35:36 +0200 (CEST)
From: <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Apr 2013 17:35:33 +0200
Message-ID: <1365176133-59915-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] local.conf.sample: Add info about -ptest package group
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
X-List-Received-Date: Fri, 05 Apr 2013 15:52:51 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Add information about ptest package testing in local.conf.sample file.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/conf/local.conf.sample |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index e1f8c5b..85205c5 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -117,6 +117,8 @@ PACKAGE_CLASSES ?= "package_ipk"
 #                     (adds symbol information for debugging/profiling)
 #  "dev-pkgs"       - add -dev packages for all installed packages
 #                     (useful if you want to develop against libs in the image)
+#  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
+#                     (useful if you want to run the package test suites)
 #  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
 #  "tools-debug"    - add debugging tools (gdb, strace)
 #  "eclipse-debug"  - add Eclipse remote debugging support
-- 
1.7.10.4



