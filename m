Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9BB789C8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 01:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 381EC20B6F;
	Sat,  3 Mar 2018 01:47:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id iwWJQKWv0mMp; Sat,  3 Mar 2018 01:47:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0B0D520862;
	Sat,  3 Mar 2018 01:46:59 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 59BFC1632F1;
	Fri,  2 Mar 2018 20:46:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 20:46:51 -0500
Message-Id: <1520041611-39622-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520041611-39622-1-git-send-email-denis@denix.org>
References: <1520041611-39622-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] layer.conf: add busybox-inittab to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Sat, 03 Mar 2018 01:47:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Similar to sysvinit-inittab

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index df67716..91935e4 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -21,6 +21,7 @@ COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 # opkg-utils is for update-alternatives :(
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
+  busybox-inittab \
   shadow-securetty \
   opkg-arch-config \
   netbase \
-- 
2.7.4


