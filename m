Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B8D946C4A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:36:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43qJCq14CVz4v
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548840999;
	bh=MDC/8A2kRF3t5yprHk3SfGGiMyB5uKvCNiTjVDrJJP0=;
	h=From:To:Subject:Date:From;
	b=ZNmWrjWmAs1L5UX1PjSoQXVN80Z6JlD5RynhaCwYQ3hFrVSCJbdKIDegl+J/XhbKV
	j3y73ks+nIOFXYcMGjk5MtmzS218a2Gy6U9AH5ZEWJXwrVH4bSvn1ICPL1qH7571Dx
	Rogz4b7aEm16gIbujqMpLFgZ2aONma4ojZkZ77e8m8qOr6TCACMWzcb0gFRE+w/m7b
	GhcaEPeyCmHmo0/i2dWA83wBcGeka4FaDOSQ7LI/4PWboSq/rdCOdZ4rqJQvU7K5oN
	sO8S94qCfumh39R8Nrk8CFaDUl2lt0KcBB/yoRaflhIF6qpKxCETmP7MieJDZfYdmG
	VA3MwB2BWPJL1IhTZc+iSxG0pqTxJ4ndV9+WUqL/guDbhinsL4YGYSWbewMkfpOS+H
	wTzDLf1HuFIGd4CLSw7Vcl6/4sC4CtxXQhCPDC57Tp24qZmOGJxJxiP/RNLb367aS5
	uQHZxM79+XAtCWnzjIBRpnWZR2Y3s8hsZj2PeMRZHPZNQGPTpMt6bAxADn5HBI5m6i
	UTFBQsjoGtLshzDnkW8S4D1MDBIMO1OdI8QeR2zFwczL1bDCfYy2sEydNXAcCRv5wu
	Xv9MuHOz8wPWiwsBSACOm9duAzQ2XmZACLb0NdHd86YaaXgGJVlmFDOGkitm6fhlcO
	EV52gKCUVwGpOK31Ey7Y4fdU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:36:37 +0200
Message-Id: <20190130093638.10612-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] Ubuntu 16.10 is not LTS
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
X-List-Received-Date: Wed, 30 Jan 2019 09:36:40 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 documentation/ref-manual/ref-system-requirements.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 69d4b4e726..500b2f8f39 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -97,7 +97,7 @@
                 <listitem><para>Ubuntu 15.04</para></listitem>
                 <listitem><para>Ubuntu 15.10</para></listitem> -->
                 <listitem><para>Ubuntu 16.04 (LTS)</para></listitem>
-                <listitem><para>Ubuntu 16.10 (LTS)</para></listitem>
+                <listitem><para>Ubuntu 16.10</para></listitem>
                 <listitem><para>Ubuntu 17.04</para></listitem>
 <!--            <listitem><para>Fedora 16 (Verne)</para></listitem>
                 <listitem><para>Fedora 17 (Spherical)</para></listitem>
-- 
2.11.0


