Return-Path: <paul@betafive.co.uk>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id CBE997DDB5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 11:54:57 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E43E7220E4;
	Fri,  3 May 2019 07:54:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Fri, 03 May 2019 07:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id; s=fm1; bh=Fvbpxc40yaAL/am
	KrXXYpnLTh1lIKKId6LgEPxu5VTY=; b=Nqb2SL7NeEiqsdgQ3UsR7OYnMU2/pHh
	hWOkQ5JyT64+Lq7YqG4uOXAOYLTDhOqvs+9yvSI83s6QB8+nn8sbwn/LXpR3gzRz
	XWy6anrN+m+Zwx2tuMc6dwGxnkVpvVvBqxHHzU++8IoISuqV7XO1XNlmFjrvCMWb
	5XFs3VnVd5FYbY/NV1U3TtrduNbndis4GDsUSDzt5x2fn9ItX36zLdV/Vt0v3SYp
	cjHjffnqLKShnqDribVj8Ndrv6gKfee/dAsf0c8/2GsRqghaGjYkDzQMEd1JHWF3
	KlSYDKDxgOeO5AQGCmOfICvZYMjoMT05bijxER8INK8nh78PFdAoHnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=Fvbpxc40yaAL/amKrXXYpnLTh1lIKKId6LgEPxu5VTY=; b=KRarN9pr
	056g66LAn1JF+GPYNzvLwO4WePUA68+KMD7wjwr7doQhu5vkubsrZsb/+K3Bk2AM
	wQ5KDgz9vHd9aS879E+FwkjiQExUvaNp9+WvEeIjj3HgY8SqBPEY2ftFpMWuUaha
	Mg2OBF+zuRfKRqizkOAaV9WaTM99nlZGQHjmrr8ksyNa1tMABSpJLu0vuRjzIGZz
	nmPE1e3wlbo38V4NbO6ZqLxfOQ5kyykQKJ2w0i0sVZgzH+NnSXGauwLvj8Fbf0qL
	rNl31dIP4px1S2N3Q9bhQ6ogyxO9s8Q/7ykfvGJJSDCXZSq56PlEBiL5EWbT2xEx
	KiESCqv5xstPYw==
X-ME-Sender: <xms:EizMXJrWI3cH5VCMYcdioAouQuiMEmvdLt087QzUfMEEECfgH0nujA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjedugdeglecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefhvffufffkofestddtredtredttdenucfhrhhomhepphgruhhlsegsvghtrghf
	ihhvvgdrtghordhukhenucfkphepkedurddukeejrdefvddrudefkeenucfrrghrrghmpe
	hmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhushht
	vghrufhiiigvpedt
X-ME-Proxy: <xmx:EizMXP6wLfDI3tG40GY3aKW81Yz2iFtLRMwWaoj0rqwxbWWFW4ynoQ>
	<xmx:EizMXBN9S4APdr_x0-iTGDfvUXmC2ISmpzHDXnxXvcQaaCFI7u_Bmw>
	<xmx:EizMXJNcBkntD0NYaesBurgowZBJHRNlqcpVkC0vW6Qc9mr9qOOXdQ>
	<xmx:EizMXK1tzylKU4OXtKqbuJdcVskL3NH3PfaOIUEvG9GD-VV1gjKJTA>
Received: from alpha.home.b5net.uk (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id E9F31103D1;
	Fri,  3 May 2019 07:54:57 -0400 (EDT)
From: paul@betafive.co.uk
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2019 11:54:46 +0000
Message-Id: <20190503115448.10130-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2 0/2] license_image: Fallback to copy if we can't hard link
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
X-List-Received-Date: Fri, 03 May 2019 11:54:58 -0000

From: Paul Barker <paul@betafive.co.uk>

This is a v2 of "license_image: Don't try to hard link license files", subject
changed slightly now that we do try hard links first.

Tested with TMPDIR and DEPLOY_DIR together and verified hard links are still
created. Tested with TMPDIR and DEPLOY_DIR on separate volumes and confirmed
copies were created.

Paul Barker (2):
  oe.path: Add copyhardlink() helper function
  license_image: Use new oe.path.copyhardlink() helper

 meta/classes/license_image.bbclass |  6 +++---
 meta/lib/oe/path.py                | 13 ++++++++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.17.1


