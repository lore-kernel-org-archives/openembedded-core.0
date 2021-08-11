Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.2749.1628649587521629631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 19:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=hY8Z4ZWt;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.24, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 2C2A9320028E;
	Tue, 10 Aug 2021 22:39:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 10 Aug 2021 22:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=KFJv8on3olMTRmcZrsQn+yME2i
	MD5mf+LoBxK7lBmiY=; b=hY8Z4ZWt7l0JR2fRkj5QtPJSORdWBH0JSOcJRpC9Rs
	NUSS10NE6xrW2bJvLwSzBnDfBficniRE9Cvzcqol44qOKq2kNAnzXCKE6N3mvDD3
	en7Ydik5O/pvTQcGpFkPWeDGGmOq2nQMWkfumE/DWC1C4dEjm+MzJduLCWpYu5si
	CBrtLPCe9JrJhIohriCzhMiMTByrDg9S7dyXtCoY0isKxCYFi2VoyWwhHv9c8zy5
	fiala2Y7eAI8zYYznUeH0gn4SVqKYvzG9Q/hSWttgZZI5L4lX/WKXvuWIK/rKFPu
	EXYBTQv7IAeJqRME0UlfScXqea8p9hDLHjCGftuV3omQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KFJv8on3olMTRmcZr
	sQn+yME2iMD5mf+LoBxK7lBmiY=; b=IKz7mz/PLNYx5zyUrQwRRQiIKZPN4OhDS
	JyQSv3Hz5+C8W8z0dBHz/qL7Nr6vJh5TGvI0NAP7fGzJ03Ew8MGUtKPwypYLwWhv
	oCNMCpY1VAq6jCQo+xRDEduWGv+oht+CvehDI3qUKJVVpM0SJGZTFCMqO9kJUgGi
	13zR5xvxHNAOOAMSGvDRhnrmZnA3NQdsGMDC7USZicdh0yY60FfAWlEqNy/22K36
	lnbHlAMSulhGbAAAdzZq9tFs6wwVXMz6wNK342QVFZknw7/c1ctN7QQfY8nOYsBX
	clHlt8gIRDM3QHLbk2dp4kPza5FAmnUuulhGzkycnO+uqG7Z8kQvQ==
X-ME-Sender: <xms:cTgTYQ9NEIlRyWxwkl6gww5jUq9xMux9ceM7-khSjN0XIvFnqagT-g>
    <xme:cTgTYYtl9lQmBu2tXerB4LiQmgRlhnvJ6Y09pp2ujltWeuvpcIsrFtAqKZvEnwl1j
    pKz9yykJEia2YB4DvY>
X-ME-Received: <xmr:cTgTYWB2qKluxmqIFGU8yj4PzytPnrrCybn_fMWcoXq_1HEu1xbE7EXrj8sh0EaQQKzQ1yTGAjX4dlGL5beG5UfR-SUs_PWAmG8WkUCQnJmMyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkedtgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhephffvuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghm
    shcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtle
    dugeehjeetleehuddugeekheelteefkeeitdefgfelieefleehgfevjefhffenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghkse
    hsthiftgigrdighiii
X-ME-Proxy: <xmx:cTgTYQcTeDwmj7ybMFCb_HTXDLoANRj2sT9PbNIi9vYZPjVFNdThJQ>
    <xmx:cTgTYVMo8Hi8-kv3oAvCDKFRtRwk2rNrG9kMp4-J5hzvGAj6FBPX2w>
    <xmx:cTgTYalZ5unegj0IGTQy0d5Nn_NDXi5FqkPFWFQpI27RA7ii0ZF0LQ>
    <xmx:cTgTYXX_aWRTgFrHI0EQeaqvviirUD9vxsQiJxQ99_fz136pIj7UCg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Aug 2021 22:39:45 -0400 (EDT)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH 1/2] systemd: add zstd PACKAGECONFIG
Date: Tue, 10 Aug 2021 21:39:37 -0500
Message-Id: <20210811023938.2800001-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

systemd supports using zstd compression for journald and core files.
Add the necessary PACKAGECONFIG to enable zstd.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/recipes-core/systemd/systemd_249.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_249.1.bb b/meta/recipes-core/systemd/systemd_249.1.bb
index 5d472027c9..b305092935 100644
--- a/meta/recipes-core/systemd/systemd_249.1.bb
+++ b/meta/recipes-core/systemd/systemd_249.1.bb
@@ -199,6 +199,7 @@ PACKAGECONFIG[xdg-autostart] = "-Dxdg-autostart=true,-Dxdg-autostart=false"
 PACKAGECONFIG[xkbcommon] = "-Dxkbcommon=true,-Dxkbcommon=false,libxkbcommon"
 PACKAGECONFIG[xz] = "-Dxz=true,-Dxz=false,xz"
 PACKAGECONFIG[zlib] = "-Dzlib=true,-Dzlib=false,zlib"
+PACKAGECONFIG[zstd] = "-Dzstd=true,-Dzstd=false,zstd"
 
 # Helper variables to clarify locations.  This mirrors the logic in systemd's
 # build system.
-- 
2.31.1

