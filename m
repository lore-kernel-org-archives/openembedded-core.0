Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E41F6AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 08:46:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s648kSCs017296
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jul 2014 01:46:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 4 Jul 2014 01:46:28 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jul 2014 16:45:14 +0800
Message-ID: <90313c71f3056db00149363ceaf259da8db81346.1404463017.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404463017.git.Chong.Lu@windriver.com>
References: <cover.1404463017.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] adt_installer: fix syntax error
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
X-List-Received-Date: Fri, 04 Jul 2014 08:46:33 -0000
Content-Type: text/plain

We need to check YOCTOADT_QEMU variable whether is equal to "y".
So we should use "==" rather than "=".

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../installer/adt-installer/scripts/adt_installer_internal              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index f9c6d18..6a219a3 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -169,7 +169,7 @@ for target_type in $YOCTOADT_TARGETS; do
   $SUDO sed -i -e "s%##SDKTARGETSYSROOT##%$target_sysroot%g" $env_script
 done
 
-if [ "$YOCTOADT_QEMU" == "Y" ] || [ "$YOCTOADT_QEMU" = "y" ]; then
+if [ "$YOCTOADT_QEMU" == "Y" ] || [ "$YOCTOADT_QEMU" == "y" ]; then
   echo_info "\nInstalling qemu native ..."
   $OPKG_INSTALL_NATIVE_CMD nativesdk-qemu &>> $YOCTOADT_INSTALL_LOG_FILE
   check_result
-- 
1.9.1


