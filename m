Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5161D6FE64
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 08:46:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s648kUwu010543
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jul 2014 01:46:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 4 Jul 2014 01:46:29 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jul 2014 16:45:15 +0800
Message-ID: <cd071aa7eb78e7e002fcff0b47576523badf01ac.1404463017.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404463017.git.Chong.Lu@windriver.com>
References: <cover.1404463017.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] adt_installer: check the result of updating opkg
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

We should check the result of updating opkg rather than echo_info.
So we should call check_result function after updating opkg.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../installer/adt-installer/scripts/adt_installer_internal              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 6a219a3..cdf93da 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -131,8 +131,8 @@ fi
 
 echo_info "Updating opkg..."
 $OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR update &>> $YOCTOADT_INSTALL_LOG_FILE
-echo_info "opkg update process ended..."
 check_result
+echo_info "opkg update process ended..."
 
 #install below must sdk-host packages
 OPKG_INSTALL_CMD="$OPKG_CMD "
-- 
1.9.1


