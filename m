Return-Path: <abelous@broadcom.com>
Received: from mail-gw2-out.broadcom.com (mail-gw2-out.broadcom.com
	[216.31.210.63])
	by mail.openembedded.org (Postfix) with ESMTP id D722A6BE7E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 20:41:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,587,1389772800"; d="scan'208";a="17737993"
Received: from irvexchcas07.broadcom.com (HELO
	IRVEXCHCAS07.corp.ad.broadcom.com) ([10.9.208.55])
	by mail-gw2-out.broadcom.com with ESMTP; 04 Mar 2014 12:58:26 -0800
Received: from IRVEXCHSMTP3.corp.ad.broadcom.com (10.9.207.53) by
	IRVEXCHCAS07.corp.ad.broadcom.com (10.9.208.55) with Microsoft SMTP
	Server (TLS) id 14.3.174.1; Tue, 4 Mar 2014 12:41:18 -0800
Received: from mail-irva-13.broadcom.com (10.10.10.20) by
	IRVEXCHSMTP3.corp.ad.broadcom.com (10.9.207.53) with Microsoft SMTP
	Server id 14.3.174.1; Tue, 4 Mar 2014 12:41:18 -0800
Received: from stbboot-mhtb-01.and.broadcom.com
	(stbboot-mhtb-01.and.broadcom.com [10.28.6.99])	by
	mail-irva-13.broadcom.com (Postfix) with ESMTP id 857C7EAE5E;
	Tue,  4 Mar 2014 12:40:55 -0800 (PST)
From: Andrey Belous <abelous@broadcom.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Mar 2014 15:40:44 -0500
Message-ID: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
X-Mailer: git-send-email 1.9.0
MIME-Version: 1.0
Subject: [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
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
X-List-Received-Date: Tue, 04 Mar 2014 20:41:35 -0000
Content-Type: text/plain

Setting of a variable PREFERRED_PROVIDER_virtual/libc only if it doesn't have a value
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


