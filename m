Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE4777782F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 02:59:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w052x2uR020423
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jan 2018 18:59:03 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 4 Jan 2018 18:59:02 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Jan 2018 10:56:49 +0800
Message-ID: <20180105025649.19050-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] pulseaudio: change pulse to be a system group
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
X-List-Received-Date: Fri, 05 Jan 2018 02:59:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

pulse is added as a system user, so the group 'pulse' is
meant to be a system group as well, which is the same with
other distros like ubuntu/centos.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index fdbf5abc16..8189a569e1 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -160,7 +160,7 @@ do_install_append() {
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM_pulseaudio-server = "pulse"
+GROUPADD_PARAM_pulseaudio-server = "--system pulse"
 USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
                               --no-create-home --shell /bin/false \
                               --groups audio,pulse --gid pulse pulse"
-- 
2.11.0


