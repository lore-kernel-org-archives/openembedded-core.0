Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 77CC07E1CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 06:55:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4V6tIDx021548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2019 23:55:18 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 30 May 2019 23:55:17 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 31 May 2019 02:54:29 -0400
Message-ID: <20190531065430.7717-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531065430.7717-1-kai.kang@windriver.com>
References: <20190531065430.7717-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [meta-poky][PATCH v5 2/3] poky-tiny.conf: not backfill distro feature systemd
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
X-List-Received-Date: Fri, 31 May 2019 06:55:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

systemd has been added to DISTRO_FEATURES_BACKFILL for poky by default,
but it is compatible with poky-tiny. So not backfile it to
DISTRO_FEATURES by adding it to DISTRO_FEATURES_BACKFILL_CONSIDERED.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index 1f8b6e8ff3..ad95919e6c 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -87,7 +87,7 @@ VIRTUAL-RUNTIME_login_manager = "busybox"
 VIRTUAL-RUNTIME_init_manager = "busybox"
 VIRTUAL-RUNTIME_initscripts = "initscripts"
 VIRTUAL-RUNTIME_keymaps = "keymaps"
-DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
+DISTRO_FEATURES_BACKFILL_CONSIDERED += "systemd sysvinit"
 
 # FIXME: Consider adding "modules" to MACHINE_FEATURES and using that in
 # packagegroup-core-base to select modutils-initscripts or not.  Similar with "net" and
-- 
2.20.0


