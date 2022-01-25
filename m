Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77843C433FE
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:44 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZGX4AABm;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118395; x=1674654395;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ekx45G9IhhXpv/8fmjUuWNFYu6vlbjs1U2jJRU3iXAA=;
  b=ZGX4AABm9m+GLh03Mt1WI0d+HU2748ofPiJz3xFf0FFlW/nwCJqHHIB8
   7s42xTwjJSnchqypU2u1NRb26Ua10VV0HuAnVnf9Zlpshdc9aVwNhDUy/
   NnDle5bDpn3/mRQTi+NiAjfioEwxknMyznG/FQM/CzlMzETJdklY5wfzs
   Xn22rnHt0colGAtx5jtvKqBR1R1id9gAdeAiE1XbFShNkrsbZ6WTtOl+G
   0P0qiCjienpjFERoFI/qn6jGIEsOG4gqyoQV2MtsTkl4PihvrbrFfONcD
   f60G4vzThpyjn8uu0/W0jWGnIjh09S4UC3KnQN9i46TgEApAW1I3iJ+Kd
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016445"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016445"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494310"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/13] socat: update SRC_URI
Date: Tue, 25 Jan 2022 21:45:56 +0800
Message-Id: 
 <0014b0d5d1fe503387ecbcc078916830a8e6c307.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643113252.git.anuj.mittal@intel.com>
References: <cover.1643113252.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160923

From: Mingli Yu <mingli.yu@windriver.com>

The orginal one is unaccessible now.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/socat/socat_1.7.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.1.bb b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
index 1ad5f15b93..41c8552f25 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
+SRC_URI = "http://www.dest-unreach.org/socat/download/Archive/socat-${PV}.tar.bz2 \
 "
 
 SRC_URI[md5sum] = "36cad050ecf4981ab044c3fbd75c643f"
-- 
2.34.1


