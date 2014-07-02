Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id D174165CC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 11:25:40 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Wed, 2 Jul 2014
	13:25:36 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 1630B285092;
	Wed,  2 Jul 2014 13:25:36 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 13:25:29 +0200
Message-ID: <1404300330-4094-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 1/2] gnutls: update to 3.3.5
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
X-List-Received-Date: Wed, 02 Jul 2014 11:25:48 -0000
Content-Type: text/plain

Bump version to 3.3.5

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/gnutls/gnutls_3.2.15.bb | 7 -------
 meta/recipes-support/gnutls/gnutls_3.3.5.bb  | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.2.15.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.3.5.bb

diff --git a/meta/recipes-support/gnutls/gnutls_3.2.15.bb b/meta/recipes-support/gnutls/gnutls_3.2.15.bb
deleted file mode 100644
index ce8bdfd..0000000
--- a/meta/recipes-support/gnutls/gnutls_3.2.15.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require gnutls.inc
-
-SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
-           "
-
-SRC_URI[md5sum] = "ec3b06f80e312137386c5d322183ca5a"
-SRC_URI[sha256sum] = "30bdc7b34b220258f714602cdf0afa1abf0883bf926f35f400c88b1c72ca77b9"
diff --git a/meta/recipes-support/gnutls/gnutls_3.3.5.bb b/meta/recipes-support/gnutls/gnutls_3.3.5.bb
new file mode 100644
index 0000000..b3daa49
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls_3.3.5.bb
@@ -0,0 +1,7 @@
+require gnutls.inc
+
+SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
+           "
+
+SRC_URI[md5sum] = "1f396dcf3c14ea67de7243821006d1a2"
+SRC_URI[sha256sum] = "48f34ae032692c498e782e9f1369506572be40ecf7f3f3604b0b00bad1b10477"
-- 
1.9.1


