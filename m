Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web09.8040.1613483878042979561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 05:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm1 header.b=UJ78zUMs;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.25, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 5141C5C0047;
	Tue, 16 Feb 2021 08:57:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 16 Feb 2021 08:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=sg2sWUW2EVIhwz89eUHSMzGISG
	/qaFGooPPGdE657qg=; b=UJ78zUMsPar4Z4wQBtyLs9nO1I7zkEpj62jqu63KH3
	7l9mkS/nFQG/n2CZPjv7FZiLlMatF1oiECXIfkTLk18E5ZetDNeKPy4G27G3G5Gx
	KxMM8qWKstFWb20gLM0nvLGVUZb0TEGV9MoWBy7/fsZru/RwLKCj7zacenv6axtD
	rN6Jt5x4yOst4TeyE1XvoZBlIPTFx6Sd/VcYyRNXsZtJ/PsBZvJSU5Qs5OFrIM6b
	d2nbke5EOP+NNkzm3wPduX7GH5TYcPb+00NfG2RFZ9dmX6UgVyCaUlfx3VyldcAm
	+NEXWzlKetxn4e9ST6XIYSjbordPcm1QrARS258dWpXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sg2sWUW2EVIhwz89e
	UHSMzGISG/qaFGooPPGdE657qg=; b=pYPrCBf9nD54Qbd0ro38kJMNnzMixzkWG
	2jYwtENPAM4OjVdbHjcPAuc+ZvrQOCB21zW0gExikSUyhDJfrVrBO5ZKkaP/mNe9
	YL4T1uPp/BZMHvY7NeZhkZrNXI8c65I2gu+t+JYJdiH+cWfp2mTr81CG9G3bWfBV
	HfgVUVBeddetmaK3INqdPZYh8T3IFAzTkCeI3eMQGhzrXsoKmgVZgyEiHwWHLB1r
	cmp0fhkOsx9Uof7zLr5kxhC4wNuwuwmOWKZAB13H71Mq42DZwTED8j7lvT/1qF6F
	v4U9/vZduxJaIkkPm9HBA8SrtM7Bbe8rXW9yWHXCFRw+pOUJwv1Pg==
X-ME-Sender: <xms:ZM8rYGkvz1e4YR3POLNeYOQP7N6AxTFa-HCk0x63fbT1aa3nww8M4g>
    <xme:ZM8rYN2hkZL320TlQyq-DxQbjXm8cTI2GzPk4qwhtpGtcd5oNutCgIjbp_Hcd0stY
    HUC11XHqdDD2Lr1cXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedtgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnegovehorghsthgrlhdqhfeguddvqddtvdculdduhedtmden
    ucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkh
    cuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgr
    thhtvghrnheptdeggeefteejjeeltdefvedttdfhieffvedvteefvdeljedvheeufeeggf
    etleffnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudeiiedrudejiedr
    uddvuddrvdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:ZM8rYErRihQSJ66cf8-26D9XdWcBXHbFeB677Z5yozALrf3-VVSgdg>
    <xmx:ZM8rYKkEP9gu17-fep953UrvvD18SyUAk60rOCtOCnOD1gtaPCnvyw>
    <xmx:ZM8rYE2WFMd7i3khnuUNo2gc6ATXkowkKQNvw0RWzzMAv_96WIpqVg>
    <xmx:Zc8rYB-cyMJJeLf4CnQKB6NnA4HspkXObpEw5pJsGoxPoLsF-rhp2g>
Received: from localhost (mobile-166-176-121-237.mycingular.net [166.176.121.237])
	by mail.messagingengine.com (Postfix) with ESMTPA id E0AE8108005F;
	Tue, 16 Feb 2021 08:57:55 -0500 (EST)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	James Feist <james.feist@linux.intel.com>,
	Ed Tanous <edtanous@google.com>
Subject: [meta-oe][PATCH] boost-url: update to latest
Date: Tue, 16 Feb 2021 07:57:45 -0600
Message-Id: <20210216135745.2584034-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Cc: James Feist <james.feist@linux.intel.com>
Cc: Ed Tanous <edtanous@google.com>
---
 meta-oe/recipes-devtools/boost-url/boost-url_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
index 6d4635b666..107a4a8331 100644
--- a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
+++ b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
@@ -4,9 +4,9 @@ SECTION = "libs"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/CPPAlliance/url.git"
+SRC_URI = "git://github.com/CPPAlliance/url.git;branch=develop"
 
-SRCREV = "a56ae0df6d3078319755fbaa67822b4fa7fd352b"
+SRCREV = "2c867fbe284ae532f1329b87a86ad3f8cd382867"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

