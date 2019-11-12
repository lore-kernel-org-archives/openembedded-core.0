Return-Path: <paul@betafive.co.uk>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id 136DC7F684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 22:31:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 0EEE177D;
	Tue, 12 Nov 2019 17:31:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Tue, 12 Nov 2019 17:31:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=lHzR+JdAN3WAnztvr5+AKENbzw
	LvLpn+G8fCPhjMBWU=; b=w+mBLGyiOEzG2tjTPeVU8LZRxbikdPWpuVcY9f38IJ
	PXvy86CqUkufRsJTjyokcag9fyaP3tqiGVxF1SPVfsBAFFn49sVunO2+IHHpCDNQ
	gW8u27YOSSCUNWvbFhwmQ8QVON8FiTBrhxqVeTAvFYLuiLyLx5Lc2bn9m+R+OxA+
	7xaGXUkxLYvFS9th14KDS7/cIlR+E01s3J+grsaftNi6TSb+QKXtoAoLODjlHE1X
	HeNJKchAMrJ1yYsW8/7eYon/PPtVWZ5RI4h8HcuJlb2hgFovO+ORzhm21aDzWoZA
	1W949Llsyq/GGPJrlRDbeJvsOt22lg+z57KmQP+7R91A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lHzR+JdAN3WAnztvr
	5+AKENbzwLvLpn+G8fCPhjMBWU=; b=bIIXTmdZ5BcsjdvjguIGdSCJp3aOOM31A
	YdAZ9A1MkZM3ag85kPMeIp+vTvkPXiy8BMHEEZDL4QY1kJDvhMZNbA21gbyXfilJ
	dnHonAuMrG1Bkt59msj3I64QFrvuJ8kqZNQXcstcw79mI4HERFM3tA8cN/gB8yri
	nYLa3v7mQzZYSKpgLJkDmd3s+adUGvTWJ1qJpPoVRJuhjdeYGKRJJ3cmpmUyGmmZ
	P29i7XyLiWlDZy1FzewrjHVa22diWKDr5XeZXoUjkXYrwCzPKFXkAItz2k5paKjX
	h0OkC0qH7eb61vbqNorDgvsJEX0EbzrdMCROiY0Kt6GcbuvYDkWjQ==
X-ME-Sender: <xms:vjLLXdiwJU46AZ2Nd1XsAI3mCQVi4Yp5Zp_in85lgwFRYDdwOgHNVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvledgudeigecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
	ertddtnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsegsvghtrghfihhv
	vgdrtghordhukheqnecukfhppedvudefrdegkedruddurddugeelnecurfgrrhgrmhepmh
	grihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgv
	rhfuihiivgeptd
X-ME-Proxy: <xmx:vjLLXWRRMxu8V_Xg7_t-Oa5EeG25MhXNXGsuKCay9Iu2JxBuDkkgqw>
	<xmx:vjLLXYFs1DEC3ZHAO5ZijAXQ5Z7Z08-pvugvPOuOUEHQ7GpI11jb5w>
	<xmx:vjLLXWki2QQB8Xh7Pwi899wNmoPx1gLyg5BuSVWeJ1oqMBJE4SoHcw>
	<xmx:vzLLXasRjxQxt8-Nh1QbEQHCIi_YOaGKtyG02NPdR99-DBk0LuIyhQ>
Received: from arch0.home.b5net.uk (unknown [213.48.11.149])
	by mail.messagingengine.com (Postfix) with ESMTPA id 458B980063;
	Tue, 12 Nov 2019 17:31:26 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2019 22:31:18 +0000
Message-Id: <20191112223119.47941-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH 0/1] cdrtools-native: Don't set uid/gid during install
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
X-List-Received-Date: Tue, 12 Nov 2019 22:31:27 -0000
Content-Transfer-Encoding: 8bit

This could be seen as a belt-and-braces approach since I've just sent a patch
to add a native intercept script for chgrp but I think it's also worth fixing
the offending recipe itself.

Paul Barker (1):
  cdrtools-native: Don't set uid/gid during install

 ...001-Don-t-set-uid-gid-during-install.patch | 27 +++++++++++++++++++
 .../cdrtools/cdrtools-native_3.01.bb          |  5 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native/0001-Don-t-set-uid-gid-during-install.patch

-- 
2.24.0


