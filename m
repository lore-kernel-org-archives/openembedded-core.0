Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 02A2478A9B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 22:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F24F420B37;
	Sun,  4 Mar 2018 22:58:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Hmbh-AMQjxCz; Sun,  4 Mar 2018 22:58:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BAAB820855;
	Sun,  4 Mar 2018 22:58:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 17C5F163308;
	Sun,  4 Mar 2018 17:58:26 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 17:58:13 -0500
Message-Id: <1520204294-38993-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520204294-38993-1-git-send-email-denis@denix.org>
References: <1520204294-38993-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [rocko][PATCH 2/3] layer.conf: add busybox-inittab to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Sun, 04 Mar 2018 22:58:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Similar to sysvinit-inittab

(From OE-Core rev: a673d5bbf7e4db6de9a5151df041e6c5db7e413e)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 4ba0b93..0c3dae5 100644
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


