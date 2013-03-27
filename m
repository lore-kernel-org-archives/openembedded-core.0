Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1UKqwq-000136-V3
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 15:03:42 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 27 Mar 2013 14:46:27 +0100
Received: by sestofb10.enea.se (Postfix, from userid 3976)	id 1BD7E288AF6;
	Wed, 27 Mar 2013 14:46:27 +0100 (CET)
From: <anders.roxell@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2013 14:46:22 +0100
Message-ID: <1364391983-9919-2-git-send-email-anders.roxell@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1364391983-9919-1-git-send-email-anders.roxell@gmail.com>
References: <1364391983-9919-1-git-send-email-anders.roxell@gmail.com>
MIME-Version: 1.0
Received-SPF: Neutral (SESTOEX08.enea.se: 172.21.3.145 is neither permitted
	nor denied by domain of anders.roxell@gmail.com)
Cc: Anders Roxell <anders.roxell@enea.com>
Subject: [PATCH 1/2] oe-setup-builddir: Possibility to customize text.
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
X-List-Received-Date: Wed, 27 Mar 2013 14:03:46 -0000
Content-Type: text/plain

From: Anders Roxell <anders.roxell@enea.com>

Possibility to customize the text that is presented to the user when
they execute the script.

Signed-off-by: Anders Roxell <anders.roxell@enea.com>
Tested-by: Maxin B. John <maxin.john@enea.com>
---
 scripts/oe-setup-builddir |   16 ++++++----------
 1 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 560453e..be5811d 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -55,6 +55,7 @@ if [ "x" != "x$TEMPLATECONF" ]; then
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
+    OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"
 fi
 
 if [ "x" = "x$OECORELOCALCONF" ]; then
@@ -113,14 +114,9 @@ cat <<EOM
 
 You can now run 'bitbake <target>'
 
-Common targets are:
-    core-image-minimal
-    core-image-sato
-    meta-toolchain
-    meta-toolchain-sdk
-    adt-installer
-    meta-ide-support
-
-You can also run generated qemu images with a command like 'runqemu qemux86'
-
 EOM
+if [ "x" = "x$OECORENOTESCONF" ]; then
+    OECORENOTESCONF="$OEROOT/meta/conf/conf-notes.txt"
+fi
+cat $OECORENOTESCONF
+unset OECORENOTESCONF
-- 
1.7.5.4



