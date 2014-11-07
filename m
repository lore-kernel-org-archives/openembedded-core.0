Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F41CC71F4E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:56:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA78uKDX008726
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 00:56:20 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Fri, 7 Nov 2014 00:56:20 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 16:51:21 +0800
Message-ID: <32c8d18dbaf01579b0804bb19f81eb08ecb01bfa.1415350038.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415350038.git.kai.kang@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 16/24] packagegroup-core-tools-profile: remove sysprof for aarch64
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
X-List-Received-Date: Fri, 07 Nov 2014 08:56:26 -0000
Content-Type: text/plain

Remove sysprof from packagegroup-core-tools-profile that sysprof doesn't
support arch aarch64.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 41d2548..3cf7027 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -12,6 +12,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 PROFILE_TOOLS_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sysprof', '', d)}"
+# sysprof doesn't support aarch64
+PROFILE_TOOLS_X_aarch64 = ""
 PROFILE_TOOLS_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-analyze', '', d)}"
 
 RRECOMMENDS_${PN} = "\
-- 
1.9.1


