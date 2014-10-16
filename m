Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C386860DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 02:04:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9G24iC7006801
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 19:04:45 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 15 Oct 2014 19:04:43 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Oct 2014 10:02:30 +0800
Message-ID: <1413424950-14820-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] rpm: rpm needs gnupg to do signature
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
X-List-Received-Date: Thu, 16 Oct 2014 02:04:45 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

rpm needs gnupg to do signature, otherwise the below error:

    $ rpm -v --addsign m4-1.4.16-r4.0.x86_64.rpm
    Enter pass phrase:
    error: Could not exec gpg: No such file or directory
    $
Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index fb8a507..78a880a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -335,6 +335,7 @@ RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 RDEPENDS_${PN}-build = "file bash perl"
+RRECOMMENDS_${PN}_class-target = "gnupg"
 
 RDEPENDS_python-rpm = "${PN}"
 
-- 
1.9.1


