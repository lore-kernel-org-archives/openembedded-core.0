Return-Path: <abelous@broadcom.com>
Received: from mail-gw3-out.broadcom.com (mail-gw3-out.broadcom.com
	[216.31.210.64])
	by mail.openembedded.org (Postfix) with ESMTP id A4BC460B9B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 18:58:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,639,1389772800"; d="scan'208";a="18887057"
Received: from irvexchcas06.broadcom.com (HELO
	IRVEXCHCAS06.corp.ad.broadcom.com) ([10.9.208.53])
	by mail-gw3-out.broadcom.com with ESMTP; 12 Mar 2014 12:11:38 -0700
Received: from IRVEXCHSMTP2.corp.ad.broadcom.com (10.9.207.52) by
	IRVEXCHCAS06.corp.ad.broadcom.com (10.9.208.53) with Microsoft SMTP
	Server (TLS) id 14.3.174.1; Wed, 12 Mar 2014 11:58:06 -0700
Received: from mail-irva-13.broadcom.com (10.10.10.20) by
	IRVEXCHSMTP2.corp.ad.broadcom.com (10.9.207.52) with Microsoft SMTP
	Server id 14.3.174.1; Wed, 12 Mar 2014 11:58:07 -0700
Received: from stbboot-mhtb-01.and.broadcom.com
	(stbboot-mhtb-01.and.broadcom.com [10.28.6.99])	by
	mail-irva-13.broadcom.com (Postfix) with ESMTP id 84B99EAD4B;
	Wed, 12 Mar 2014 11:58:06 -0700 (PDT)
From: Andrey Belous <abelous@broadcom.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 14:57:03 -0400
Message-ID: <1394650623-18854-1-git-send-email-abelous@broadcom.com>
X-Mailer: git-send-email 1.9.0
MIME-Version: 1.0
Cc: Andrey Belous <abelous@hotmail.com>
Subject: [PATCH] tclibc-uclibc: Changing assignment to conditional variable assignment
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
X-List-Received-Date: Wed, 12 Mar 2014 18:58:12 -0000
Content-Type: text/plain

From: Andrey Belous <abelous@hotmail.com>

Setting of a variable PREFERRED_PROVIDER_virtual/libc only if it doesn't have a value

Signed-off-by: Andrey Belous <abelous@broadcom.com>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/conf/distro/include/tclibc-uclibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 9245112..a4d8c39 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -8,7 +8,7 @@ LIBCEXTENSION = "-uclibc"
 LIBCOVERRIDE = ":libc-uclibc"
 OVERRIDES .= "${LIBCOVERRIDE}"
 
-PREFERRED_PROVIDER_virtual/libc = "uclibc"
+PREFERRED_PROVIDER_virtual/libc ?= "uclibc"
 PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
 PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
-- 
1.9.0


