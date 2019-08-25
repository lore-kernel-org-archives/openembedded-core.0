Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9246C7F648
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 17:21:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46GhkP4q8Sz29
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 19:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566753677;
	bh=R8UqMCtNjnTulPXKarhGap1iDbxlPCbkzLCtSFd/fv8=;
	h=From:To:Subject:Date:From;
	b=Lqo4b0p2G58KLDYFeoEsJId7ZvkWvxms8MDzbaJLpLe7hXoPjeIKQsGxjgEqdvdPu
	5cOW0QTx0lGM9thr+XcuJMxw2grDQPM9IJIzNLRR031o3tgqZkZcScDCzRhHO1IkJ0
	JQHnwd61fbVBcLwjkxy5WSS3IAfwE9g285QWQX4oj4gqK9uv44o04TRQB/ZJeIywLm
	4H7azMcLA/WQazl8oiGHG5grO6fDRtaWmTBmVZG3wKNKtogFvy05YLMGlCV5yzSQ0e
	m0hVPmyzHSJGVaEA0rnHcAwGovm8/ifDqpc8rx55zuR33/HxkV5tjDXHTMZtwBb4/5
	Ip13mzOFv0OsX69SWHOSRU5G2K96AyHZcrEIGICxPmtLYgYB35c4AOw3Y+eUO9Raor
	Gy7y2XELrNOnY8oouJlLzp/VURwDt94f1oX1wHVtt4fYAALPmxrRw5VDUUOyTNJTgC
	tW1OVCfuQ99ygZlLLi+7xSwzhgwh95WBnFugi5fYi2X5SgNjixsZfVdnqasawm8UHe
	4xMRKwTMUKGypMvK9GYUMwSy7QgbvGLKISRwmXzx4gcApQRwbtZ/GvNDYWUL76DG5v
	qMzSFJGK2nrl/gsC2pVm2o48oGF8w6y94abTwocMuNMglGjscL3LcgpCQvCWbD3Fye
	0qVCaAz2RaYffgEKpXupJOaU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Aug 2019 20:21:14 +0300
Message-Id: <20190825172116.23759-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python: Remove PYTHONLSBOPTS that hasn't been set for some time
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
X-List-Received-Date: Sun, 25 Aug 2019 17:21:17 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/python/python.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 70481002bb..1462b779e9 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -37,7 +37,6 @@ EXTRA_OECONF = "\
   --enable-shared \
   --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
   ac_cv_header_bluetooth_bluetooth_h=no ac_cv_header_bluetooth_h=no \
-  ${PYTHONLSBOPTS} \
 "
 
 do_configure_prepend() {
-- 
2.17.1


