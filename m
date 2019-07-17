Return-Path: <prvs=09430007d=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3D37ED5F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 21:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1563397419; x=1594933419;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=0+ZwFDwV71rOrtQ9KbTV+d2lbc4s/QI5NecdmEeQKFg=;
	b=k3mSDyhoH06BIu9vo4AiE/ujfTeo0zUXJOonkEDa4Oqqoz4RvuIJbhSn
	L/gaPGGrZ/Q0kJrvKqYblMap9IyHZDxGmhZd/jo68RJzPC8zWve69iHWG
	LsLP8v7GX82aw5PsTpuX+lePjUkmnk9MRmHEy3Q13EWrOgM+LWZm2ygwa
	NyOSzAnGDKqP3xPEl3ZRiJVqdR0o7a9jY7mJuX6zao1KN1MEp6qTz2tcn
	obSv9N3KSCZTBocmu9omHXOtZmY3htQIzjHye9QIYTQYT1+/U4aIPr/XP
	kPyYE+J7IeI9QhxR7IOsGEYhmtRFyFPes202hsHGfhjhR67FZbj0+j025 g==;
IronPort-SDR: UJnJLgqmjElxrqBYxi5hMqiuDE/jSOqKObYzaJZxNoLXt/UJu9P4rtNfQt/ueBcvMOnHrXYFWM
	4u+umyTnolK12eLWvNxV3B3LnfhR3TB1DA6HUGZ8Qs8+7iNM4oa0SggzJXNg/MTVhOkrlbABbr
	wBAlEhtSi3pXV1oz2Gl1tblEPvMlXYyi+RYMdY6ogoPHJOmR4UKgG1R8Amxrz4BoEVfr4BwC5y
	m7XiNNMBz0+kHjBa863QU2mkrK1pmpgpN+L1s1bNLiYwTsWalYeI1ED2S0yg2tcX9dG13Q0+jN
	RyQ=
X-IronPort-AV: E=Sophos;i="5.64,275,1559491200"; d="scan'208";a="114440236"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 Jul 2019 04:56:35 +0800
IronPort-SDR: wAs7w2J1MHgZTaKlXPnr8t0erksk3zBej9HgnndVDYmeaCFtV82HszKRxYXq76K6L7UPeUF82j
	n/b8UHwTeLkgkzCEItbSU6KtTtscpZeoIyseuNHD+5MBqimCO28PDUSdQBj/S9IE3TMvc0k0cu
	Ljy7lEyiRxIaPcJ5LfENi9MnVNgiX1nrpihKs8Po8FAv+2lZODq8Lxti34EtcLt/PwNILuXxyf
	TjMuWUsaNpEQv1rVQDg9hu4u9nvyNc3B66Gr5xAQAMxfHJbMkA4L/chfnFu4IOH8p21E+5Xx0h
	wQRGqC6xnAC4EJwcxoKOelHR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP; 17 Jul 2019 13:55:02 -0700
IronPort-SDR: p8g+gs4KVGEa8BotsgXm0lCnvyPWbjcAuBL6pFvfYunQZpz1cWbusoFnDUOfw0uHgtvTNmUiUm
	HheBJTP+ROKI4WAuaem7JcxKyQlc2eZnHHJWQu+jHB/cp3rLvtLkz5K1wHlRSNDTt143I+KiX8
	OHYVULjG8KCVI5Xiy8MH/cEHHZAOuSJJfnkYhaJWhuKACGnb0yYYYY+dgy2qzREsP310PD9864
	Ki3NjcyMCH4bUhTuwOKDP+s/HhdQF7qiOiSmnxD5lmRLrXlKg2yCFgT9EqixFLeE6P+NlkxwED
	sS8=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Jul 2019 13:56:36 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 13:53:40 -0700
Message-Id: <20190717205340.918-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] package_manager: Ensure the base-feed directory exists
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
X-List-Received-Date: Wed, 17 Jul 2019 21:03:37 -0000
Content-Transfer-Encoding: 8bit

Ensure that the /etc/opkg directory exists before we try to create a
file there.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/lib/oe/package_manager.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 06feb4def7..7c373715ad 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1297,6 +1297,8 @@ class OpkgPM(OpkgDpkgPM):
         rootfs_config = os.path.join('%s/etc/opkg/base-feeds.conf'
                                   % self.target_rootfs)
 
+        os.makedirs('%s/etc/opkg' % self.target_rootfs, exist_ok=True)
+
         feed_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
         archs = self.pkg_archs.split() if feed_archs is None else feed_archs.split()
 
-- 
2.22.0


