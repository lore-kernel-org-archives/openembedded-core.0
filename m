Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19DCC705C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:29:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FETDER024446
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:29:13 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:29:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:29:11 -0700
Message-ID: <1660df897ae3d6e36aa46e6234fea4be78f87dd1.1405434230.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405434230.git.liezhi.yang@windriver.com>
References: <cover.1405434230.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] connman: add python to RDEPENDS_connman-tests
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
X-List-Received-Date: Tue, 15 Jul 2014 14:29:19 -0000
Content-Type: text/plain

We don't need this in theory since:
connman-tests -> python-subprocess -> python-core

But the rpmdeps can't figure out the dependencies recursively, and add
python to fix the warning.

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f121a81..d393f13 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -154,7 +154,9 @@ PACKAGES =+ "${PN}-tools ${PN}-tests ${PN}-client"
 FILES_${PN}-tools = "${bindir}/wispr"
 
 FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${BPN}/test/*"
-RDEPENDS_${PN}-tests = "python-dbus python-pygobject python-textutils python-subprocess python-fcntl python-netclient"
+RDEPENDS_${PN}-tests = "python-dbus python-pygobject python-textutils \
+    python-subprocess python-fcntl python-netclient python \
+    "
 
 FILES_${PN}-client = "${bindir}/connmanctl"
 
-- 
1.7.9.5


