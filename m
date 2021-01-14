Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3701.1610640599644781266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3HpJDxAjLvavTaur1MVU4vP5xJXBTENU34UEaCJEOsfvgRcNA8VuL/oc456V54RAAg1nt25lJs
 YaMpDR5MZ35A==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062673"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062673"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:07 -0800
IronPort-SDR: fsJzWUFGX40XrbuSWg2kSIc0j8VZPNWum1QMB8xKMODxna5RxSLL5W6DB9mfqQmSrX289HVOtR
 MkuGrFLwpSIw==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986602"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:06 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 09/14] mobile-broadband-provider-info: upgrade 20190618 ->20201225
Date: Fri, 15 Jan 2021 00:09:43 +0800
Message-Id: <d813abdb9170325dfbf8085f92869fd7d80c3547.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 812eb3121e0aabe4e3de9a8c61b1e62c87f55aa4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 0b0bbab168..7dccc15e03 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProvider
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "22b49d86fb7aded2c195a9d49e5924da696b3228"
-PV = "20190618"
+SRCREV = "90f3fe28aa25135b7e4a54a7816388913bfd4a2a"
+PV = "20201225"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https"
-- 
2.29.2

