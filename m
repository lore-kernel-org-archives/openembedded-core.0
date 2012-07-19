Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1Srnnx-00010S-Qr
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 12:17:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=1088; q=dns/txt;
	s=iport; t=1342692398; x=1343901998;
	h=from:to:cc:subject:date:message-id;
	bh=dQBiG36VHSdEX00kU7L4m+HorYUJmANF5NfVs5XujTs=;
	b=by6V9Rzg5gyNXol6nGkGf1ZQoIPNJOZWKipXv4hsgNF1va2xbv+0NcHM
	Qj9MDjT3o7awkceJ80Kk3iIeldGk6gInaP5qbloOnvFSDAkfkPTEApiPI
	i74QKDpPElOPWtdZPuzLob61N5rErcmF40bCZE88YBp/MSU5VG2iPBoa8 Q=;
X-IronPort-AV: E=Sophos;i="4.77,615,1336348800"; d="scan'208";a="75409020"
Received: from ams-core-3.cisco.com ([144.254.72.76])
	by ams-iport-2.cisco.com with ESMTP; 19 Jul 2012 10:05:32 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id q6JA5WIQ020840;
	Thu, 19 Jul 2012 10:05:32 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 12:00:51 +0200
Message-Id: <1342692051-5963-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Cc: Martin Ertsaas <mertsas@cisco.com>
Subject: [PATCH] Remove the - between ${TARGET_PREFIX} and ar/nm for the env script, as this will make autotools look for arm-none-linux-gnueabi--ar instead of arm-none-linux-gnueabi-ar.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 10:17:57 -0000

Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
---
 meta/classes/toolchain-scripts.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index bf37ec9..8f7c644 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -68,8 +68,8 @@ toolchain_create_tree_env_script () {
 	echo 'export RANLIB=${TARGET_PREFIX}ranlib' >> $script
 	echo 'export OBJCOPY=${TARGET_PREFIX}objcopy' >> $script
 	echo 'export OBJDUMP=${TARGET_PREFIX}objdump' >> $script
-	echo 'export AR=${TARGET_PREFIX}-ar' >> $script
-	echo 'export NM=${TARGET_PREFIX}-nm' >> $script
+	echo 'export AR=${TARGET_PREFIX}ar' >> $script
+	echo 'export NM=${TARGET_PREFIX}nm' >> $script
 	echo 'export TARGET_PREFIX=${TARGET_PREFIX}' >> $script
 	echo 'export CONFIGURE_FLAGS="--target=${TARGET_SYS} --host=${TARGET_SYS} --build=${BUILD_SYS} --with-libtool-sysroot=${STAGING_DIR_TARGET}"' >> $script
 	if [ "${TARGET_OS}" = "darwin8" ]; then
-- 
1.7.8.6



