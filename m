Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
 by mx.groups.io with SMTP id smtpd.web11.7831.1613483027132714115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 05:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm1 header.b=vrQ71OWg;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.229, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 6ACA75802CB;
	Tue, 16 Feb 2021 08:43:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 16 Feb 2021 08:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=3ErKxdCE9MsaOJKAikBi3oRArI
	cwMeZY0RDxq+kVDxM=; b=vrQ71OWgwihstPaUSqSG/FDXXqAyrkcktnuGuskr6R
	fgzA3XSO0xJHrUi4FOLunmGdgd2mGc3XOxwDGMtHqXQZXjMqetkhB/rp/1RMlAxb
	id7aP+z3MFrslOBr6AdlYaMWPY4Z0/BHnTv5fFkR7xFBz31tXXHixnSkW53nV6kM
	yk+VJzExQia3IQQlaiHthlUGwSod5Vc+0TzyAjVxayV07eDpzGprjZi+NhjxhsnK
	FBw6A3X37Asrc98cGg9jFAiWy0b4vEtOditFjSoupOsT7DhfF3lsSy+aPrqZD1dH
	Gj0JanSzozFqk5aepEaqV0U2V8jD1Rav2MbFeQOdFkBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3ErKxdCE9MsaOJKAi
	kBi3oRArIcwMeZY0RDxq+kVDxM=; b=Jo/cXjE0A7bvpFUfq6GR+RVzyYt77+SRm
	G/RmW0T4jkozNO74B9712QGvtdAHjLR0wU3JtWw3zBLaQHaEJTOG03uq2vlAz1tS
	wcYtK9w4K9BJrY1k5cVLnawvvg/1eZWl8TuxE880qGYM9W6oFXj5PQ7D7dw25Y73
	F2605ao8U55J0mbagcO2mR/OqZZwGlgv2Y3FoPQSHFbzDSCporWJaevEklsEQela
	+mibodT7hi7xacqV03H+jZJIDFXmYb2hIIxwfWvcs0j9u2k3NAwko61UXSr15yJj
	oO6ZhMVJxhrtr/dQ6oEqrKUeXDoIUwwk8ApVUHVbYyF88e325dBTw==
X-ME-Sender: <xms:EswrYGPdp3-RqI94XDB8FI1TxfrmzSlUfqQJjnqmBMAcH0y-6DYN4w>
    <xme:EswrYE9RmmTipnTyKFn6Qv9T82h0cTf4b-C8T_7hWv94vUvC6_N72-qhP8ZTonU5n
    Q_5DQD0Gd9jAtwgZ1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedtgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnegovehorghsthgrlh
    dqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgggfestdekredtredt
    tdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdeggeefteejjeeltdefvedttdfh
    ieffvedvteefvdeljedvheeufeeggfetleffnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhenucfkphepudeiiedrudejiedruddvuddrvdefjeenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighi
    ii
X-ME-Proxy: <xmx:EswrYNTw9ejlycwOmYgkJkAxubH7rENFc6oLTisyZhT5q9ykmMldqg>
    <xmx:EswrYGtuaUev64cnO2ANDfeuE41kuL2JT2YccVIfCcVoRSEln51sVA>
    <xmx:EswrYOfp__G2SsiV_YfM9iSer8gNhX_Sgdjhe19LulBfXoJiXNdhVg>
    <xmx:EswrYAq_kxHvB3-iAPDPEsfkQKyrocYIKgumceQ17pz1i6jMvItPdQ>
Received: from localhost (mobile-166-176-121-237.mycingular.net [166.176.121.237])
	by mail.messagingengine.com (Postfix) with ESMTPA id CE61C108005F;
	Tue, 16 Feb 2021 08:43:45 -0500 (EST)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-oe][PATCH] catch2: upgrade to 2.13.4
Date: Tue, 16 Feb 2021 07:43:31 -0600
Message-Id: <20210216134331.2473571-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 .../recipes-test/catch2/{catch2_2.9.2.bb => catch2_2.13.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.9.2.bb => catch2_2.13.4.bb} (84%)

diff --git a/meta-oe/recipes-test/catch2/catch2_2.9.2.bb b/meta-oe/recipes-test/catch2/catch2_2.13.4.bb
similarity index 84%
rename from meta-oe/recipes-test/catch2/catch2_2.9.2.bb
rename to meta-oe/recipes-test/catch2/catch2_2.13.4.bb
index 57fc935f77..512c00681f 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.9.2.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.13.4.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/catchorg/Catch2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/catchorg/Catch2.git"
-SRCREV = "2c869e17e4803d30b3d5ca5b0d76387b9db97fa5"
+SRC_URI = "git://github.com/catchorg/Catch2.git;nobranch=1"
+SRCREV = "de6fe184a9ac1a06895cdd1c9b437f0a0bdf14ad"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

