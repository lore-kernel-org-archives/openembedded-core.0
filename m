Return-Path: <jan.kiszka@web.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Jul 2017 19:42:41 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
	by mail.openembedded.org (Postfix) with ESMTP id C5C0B77D30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:42:40 +0000 (UTC)
Received: from md1f2u6c.home ([95.157.57.47]) by smtp.web.de (mrweb103
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0Lr2VT-1e7GZm3kjD-00eZ8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:37:37 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jul 2017 21:37:26 +0200
Message-Id: <cover.1499715449.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.12.3
X-Provags-ID: V03:K0:CTK0QglmvIB6u2tTNf4wwUXxuTIjnXYpUVI/wDeR/PkfLbLKeVF
	DxIFw5flW6xAGR4M562261oJC8giiAhsqK9TUEPUUuKSrAia0I5BblaCKGdx0k+It4ywU8q
	bBdUNPhaOHCUnLPAxNuFCK9GmKRnpPnKalKyDYuRu5KWVRLOx+u2Rqlgjd0i7AY11OOM7aF
	5IohkbqXnOSaGkLR+j+Zw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:sfu4t2rClIc=:1QIDs3YdzDykU029RZ+LaA
	f1u679wH/IbVsx/zBtJATOkmHfhE8CXjsDoImEpXXjS7itQuyhmEh2vUNxYsaV/Wt6pkvcN23
	S7sCK+lt9hcGUUAlTxMbqJuAiBTKXIlLc2KclcuvWme09X2rJK3rNBWWaPsPYt8KL3LYoIyEw
	EsBX7cBp3citoIe7NzAmfkGVvTMA4bQSlNIvJZNGxtTqnhtcMRFSlkAWPc1rNOF15RdRF/0RX
	Edg9Yf+0I6cfmpvedCGfBPXMXAKZECdYMjOFxOX25i35MHL54VF9u8GjsjCtuqNElGjkxUwmL
	m4Jyltw64mQNO9jzNhlimqhcBsjPSMrQBtRT4OeVc131obukscCDGstDw/8W3YUXWueO2AuHk
	kMKD90K3DXx1+o2928NYx1stD55cY2qOljhHnGS4CUbaCpvmufMxmCmGm6xxkR+F3sFIUzIAF
	+ml/kY2/a5nmRuZR6CP2BIp53ApG0ED7CtqLQ4pAXs6haM+MXom4KIcbjAzvFYMdndygrNwFB
	ulopRcN3nxIJlJk5XUefTlGwwc0pWboGV5Wu9S7ysaUBpg1nQ20Emv+//uUahoMQpHh9YDZof
	cBWZWAgCh0iIIPF6zcqUt53Kp6eTGNAismZucDTOAEKtvG3ytJqBTVzx6vQRieycLQrf0C6yN
	hK1Zn36maklNDU0cT4CdbeDmiGTj0zX+iLCH0jwmM4e+iDqjLmQRPLHYEQaZpu3Vi5DUD/6Wk
	IZdnNyFYcw2jEmB1wJZORkFxuQIZsZPKxdAqLYrIatzsVAnUINpYYARoZBU=
Subject: [PATCH 0/3] rng-tools fixes and enhancements
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
X-List-Received-Date: Mon, 10 Jul 2017 19:42:42 -0000

See patches for details.

Jan Kiszka (3):
  rng-tools: Start as early as possible
  rng-tools: Don't use /dev/urandom as rngd default source
  rng-tools: Add support for Atheros 9170 hwrng

 meta/recipes-support/rng-tools/rng-tools/default | 11 +++++++++--
 meta/recipes-support/rng-tools/rng-tools/init    |  3 +++
 meta/recipes-support/rng-tools/rng-tools_5.bb    |  2 +-
 3 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.12.3


