Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13D9472ACC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8liDf022120
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:44 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:27 -0800
Message-ID: <c88d276f9e6b634753079578e0c2496fb5f589f6.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 16/27] gnome-desktop-testing: separate B and S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:48 -0000
Content-Type: text/plain

It works well now, and bump the PR to avoid:
configure: error: source directory already configured; run "make distclean" there first

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnome-desktop-testing_2014.1.bb                |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
index c688e9d..482de99 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 DEPENDS = "glib-2.0"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools pkgconfig
+
+PR = "r1"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[journald] = "--with-systemd-journal,--without-systemd-journal,systemd,systemd"
-- 
1.7.9.5


