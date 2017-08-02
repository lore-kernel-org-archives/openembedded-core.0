Return-Path: <oliver.staebler@bytesatwork.ch>
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC7B78216
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 09:36:58 +0000 (UTC)
Received: from stanley.bytesatwork.ch (162.40.150.83.ftth.as8758.net
	[83.150.40.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: oliver)
	by bytesatwork.ch (Postfix) with ESMTPSA id EC7D3101C0355;
	Wed,  2 Aug 2017 11:36:57 +0200 (CEST)
From: =?UTF-8?q?Oliver=20St=C3=A4bler?= <oliver.staebler@bytesatwork.ch>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Aug 2017 11:37:09 +0200
Message-Id: <20170802093710.26565-1-oliver.staebler@bytesatwork.ch>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Oliver=20St=C3=A4bler?= <oliver.staebler@bytesatwork.ch>
Subject: [RFC][PATCH v2] eudev: Remove udev-cache
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
X-List-Received-Date: Wed, 02 Aug 2017 09:36:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As udev depends on devtmpfs, I think it is not necessary to maintain a cache
anymore as device nodes are created automatically by the kernel.
It could even lead to problems, when the cache overwrites existing device nodes
or populates device nodes when no device exists.
But I'm not sure if this change could have some consequences I don't see,
therefore a RFC.

Changes in v2:
Added missing signed-off-by

Oliver Stäbler (1):
  eudev: Remove udev-cache

 meta/recipes-core/udev/eudev/init               | 49 ----------------
 meta/recipes-core/udev/eudev/udev-cache         | 75 -------------------------
 meta/recipes-core/udev/eudev/udev-cache.default |  5 --
 meta/recipes-core/udev/eudev_3.2.2.bb           | 20 +------
 4 files changed, 2 insertions(+), 147 deletions(-)
 delete mode 100644 meta/recipes-core/udev/eudev/udev-cache
 delete mode 100644 meta/recipes-core/udev/eudev/udev-cache.default

-- 
2.13.0


