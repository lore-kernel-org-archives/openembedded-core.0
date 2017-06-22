Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm02.jp.fujitsu.com (mgwkm02.jp.fujitsu.com [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id CF68977DB6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 04:29:15 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 292d_1edc_430e769d_1100_408e_adb3_bffac25f5e35;
	Thu, 22 Jun 2017 13:29:10 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id B8A91AC00D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 13:29:09 +0900 (JST)
Received: from G01JPEXCHYT16.g01.fujitsu.local
	(G01JPEXCHYT16.g01.fujitsu.local [10.128.194.55])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	9CDB86D6792 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 13:29:08 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT16.g01.fujitsu.local (10.128.194.55) with Microsoft SMTP
	Server id 14.3.266.1; Thu, 22 Jun 2017 13:29:07 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jun 2017 13:30:35 +0900
Message-ID: <1498105835-7580-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] libinput: 1.6.1 -> 1.7.3
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
X-List-Received-Date: Thu, 22 Jun 2017 04:29:16 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../recipes-graphics/wayland/{libinput_1.6.1.bb => libinput_1.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.6.1.bb => libinput_1.7.3.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.6.1.bb b/meta/recipes-graphics/wayland/libinput_1.7.3.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/libinput_1.6.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.7.3.bb
index c8714f2..6194fba 100644
--- a/meta/recipes-graphics/wayland/libinput_1.6.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.7.3.bb
@@ -10,8 +10,8 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
 "
-SRC_URI[md5sum] = "7e282344f8ed7ec5cf87ca9fc22674fb"
-SRC_URI[sha256sum] = "9d816f13eee63bcca0e9c3bb652c52ab55f39be4d1b90b54e4bfd1dc92ef55a8"
+SRC_URI[md5sum] = "f2993b477db8d7ec0e785ce04ffecb03"
+SRC_URI[sha256sum] = "096d612d2711f0caa2de544976ff3729e6233511ab373808644cc2dd5affcb1d"
 
 inherit autotools pkgconfig
 
-- 
2.7.4


