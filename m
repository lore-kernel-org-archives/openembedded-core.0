Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 626C4724D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 08:27:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB98RQL9017298
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Dec 2014 00:27:27 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Dec 2014 00:27:26 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Dec 2014 16:25:47 +0800
Message-ID: <6152fe99accf1a836c3bc9b3d2c7b9dc886b16f2.1418113325.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418113325.git.Chong.Lu@windriver.com>
References: <cover.1418113325.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/3] bitbake.conf: Set default value for SERIAL_CONSOLE
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
X-List-Received-Date: Tue, 09 Dec 2014 08:27:31 -0000
Content-Type: text/plain

Define a default value for SERIAL_CONSOLE, we can use it if machine doesn't
configure.

[YOCTO #6331]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7902bd7..7a659a7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -739,7 +739,7 @@ COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "wifi", d)}"
 COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
 
-SERIAL_CONSOLE ??= ""
+SERIAL_CONSOLE ??= "115200 ttyS0"
 SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE', True).replace(' ', ';')}"
 
 NO_RECOMMENDATIONS ?= ""
-- 
1.9.1


