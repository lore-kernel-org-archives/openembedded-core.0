Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.938.1619398561833316893
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ipK4U/Okb/OhNyVNYWi+RDKHDo3O/fVOIYWBjBhAXJYJ5sIS4YZ6Tfd5i3RtkzYVg2vFmGKU5E
 tjr3+FTdcE3w==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818257"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818257"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:59 -0700
IronPort-SDR: NhTXC+rEeS2he4pG247Km+3M/lKhkIuz1YTFSJYQ39MAmPeu8LKpbsfF6qfNk030ni/y7wpEiv
 rPTKfxJhCUbg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067502"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:58 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 46/64] arch-armv6m.inc: fix access rights
Date: Mon, 26 Apr 2021 08:53:17 +0800
Message-Id: <f07b527676d2dba05559a972b1db885db050471d.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f7ebe444c2a78ef149b8c5f0f005ab23f24a176)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/machine/include/arm/arch-armv6m.inc | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 meta/conf/machine/include/arm/arch-armv6m.inc

diff --git a/meta/conf/machine/include/arm/arch-armv6m.inc b/meta/conf/machine/include/arm/arch-armv6m.inc
old mode 100755
new mode 100644
-- 
2.30.2

