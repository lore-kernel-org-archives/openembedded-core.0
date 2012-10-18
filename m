Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TOqvg-0003JO-TW
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 16:18:33 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 18 Oct 2012 07:04:51 -0700
Received: by mail-wi0-f171.google.com with SMTP id hj13so1911802wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 07:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=rl78NbCgRwmzt2CZHahMBhxCS1oSWflAV4oT/geEFDI=;
	b=ek1UDUG9ExcNEBZCn80+E9rRAtPNFMyMAiOydxTb9y5bSNpDw27nQlU69/STrMYfRD
	mmSmZa7AxGoJi3qGu4TeyWq2q6QUI4exzwSalEtGS5kPjzaUYkexXh2F/0x2TT+iBOCc
	hZqTJJgYiMvsHfAxKeUQWlT7pPWxCZCjpvKVsiL8QkFvJtTF5Okv2HLnwzWgwywxkWWM
	Bnu6MWurNwLhcMfbTs7dl8JYLv9UmArIy29KSH6E1C7YI54EowdCA/SkpRSHmm1EcHYw
	Lf35wLjOuoAXDCYIzzuqRs3ug0OiGWGJgUDwdUVX4PW37KDKA+a9WepnF/PCF5U0xrqL
	Ce8Q==
Received: by 10.216.214.92 with SMTP id b70mr14034931wep.86.1350569089927;
	Thu, 18 Oct 2012 07:04:49 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id v3sm29709483wiw.7.2012.10.18.07.04.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 07:04:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2012 15:03:41 +0100
Message-Id: <1350569021-17352-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmkQ5Yicl/HWs5aJHMvYr8zYOb42S/YQJ5wjyZ7u4e2DaWHOHh9zjBQyiUwc8Qe/bFgYxi1
Subject: [PATCH] linux-firmare: upgrade to latest commit
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
X-List-Received-Date: Thu, 18 Oct 2012 14:18:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 559f82a..f4eb4cf 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -19,10 +19,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                    "
 
-SRCREV = "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
+SRCREV = "0d6729f2b0bc6254d3628eb831bc80a36b5a17db"
 PE = "1"
 PV = "0.0+git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git"
 
-- 
1.7.10



