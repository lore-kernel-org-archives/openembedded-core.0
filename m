Return-Path: <Hongbo.Zhong@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2CB6D843
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 10:08:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rADA8hv0009242
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 02:08:43 -0800 (PST)
Received: from hzhong.corp.ad.wrs.com (128.224.162.173) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 13 Nov 2013 02:08:44 -0800
From: Zhong Hongbo <hongbo.zhong@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 18:08:54 +0800
Message-ID: <1384337335-32231-2-git-send-email-hongbo.zhong@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
References: <1384337335-32231-1-git-send-email-hongbo.zhong@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bluez4: Install simple-agent utility for pairing bluetooth devices
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
X-List-Received-Date: Wed, 13 Nov 2013 10:08:42 -0000
Content-Type: text/plain

From: Zhong Hongbo <hongbo.zhong@windriver.com>

Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.101.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index d6c3e26..c3444ab 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -18,6 +18,8 @@ do_install_append() {
 	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
 	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
 	install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
+	install -m 0755 ${S}/test/simple-agent ${D}/${bindir}/simple-agent
+
 	# at_console doesn't really work with the current state of OE, so punch some more holes so people can actually use BT
 	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/system.d/
 }
-- 
1.7.9.5


