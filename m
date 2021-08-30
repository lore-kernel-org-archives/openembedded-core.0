Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.18074.1630335608502664818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 08:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=HU+APCf/;
 spf=pass (domain: cold-front.org, ip: 66.111.4.25, mailfrom: jsbronder@cold-front.org)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 8130F5C0156;
	Mon, 30 Aug 2021 11:00:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 30 Aug 2021 11:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=mesmtp; bh=Dn75ihXSBVqTEAHe8MBX52O
	ueVcf69IKCTm1/UDNxnk=; b=HU+APCf/gkl4+tLkcneHf9mB9TbSVnFjnW3AADM
	ZS1KXxQBf/vIyBC5QBJza3++aUt4jZsN4cYL7WqMtMzrJSqgni81dA6QcEjyqzw6
	IslgmuTScd4qE99M46camN3hc06P5tJ5OSCMdsBUpQisl+QpZgzduftenTSmV+C7
	+1zs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Dn75ihXSBVqTEAHe8
	MBX52OueVcf69IKCTm1/UDNxnk=; b=MqSGbY2rb/8AEyiI3+eX6SPqPKXcIQMiK
	OCHQjUcw+5cB/Nj2pG5SVgmFHLaN3I2yUbFzGbt8vpwrT+qil89Fa+qQO9oJZzgE
	k8pf3qf6w0TO3KuQdIN/Sq9g7W2O4knAXjRTJhOiFWEeMoxk8OOS4jwMl3NnzcpE
	xw0PUpaKkX28FNXzomPwiPjVMbottueuagfm9aJh5FQnljorXTD4Xkll9mb+7lzm
	7O215vMagyU2JF+vDNBcj4EhT0HbZqBBjnXEIhPhGorr37g811D4wI0XgrO9F7Vo
	u/lIjdrQfqFYMev2M/LeJDdO/ujJ0AS0GosbgBPh0oL2HEsH13WOw==
X-ME-Sender: <xms:dvIsYYVzus46EWA6UJ8ld6-7VhnttFdUz2L6o0y-GzgKonmKDFYGnA>
    <xme:dvIsYcnJvqVtHDQ33yUIcjZakkKWxIMokEegBj3a6_8Crf5S_FueFyPuoPRMD4_z0
    HS7FI1qLy_gGWW1lA>
X-ME-Received: <xmr:dvIsYcbYMkZQa5a8lvc4hG1qCMwh-KJwdGPpL_vDLemjmFBf-DF91CCrtMls0DLikJBy9Nm8L5E9PNz9En24XOSB0CnZygPjbDqYWyXlwruo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduledgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpedvhfdthfffieffve
    etveeifeeuvddthfeludeitedukeeggfevfffgffffffffhfenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlug
    dqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:dvIsYXWc02H2tw0qF4TITruyTF6vOjlcx-NBEBWxZgxVj0RPg5M-CQ>
    <xmx:dvIsYSmAyrNzyud2tmvOpMnsw7g_i_xA88eDPu6L5-mcMn9n5kvEPg>
    <xmx:dvIsYccDELG1W8d-JzPmHQckKEihDInyvAPoPI4EwzIlbg2vyPEFTA>
    <xmx:d_IsYZsIHBgCSOQkKQsAZrQn0AjoL2TwTeVn4ytemASOLeRpSNdmVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Aug 2021 11:00:06 -0400 (EDT)
From: "Justin Bronder" <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-oe][PATCH v2] hidapi: add rdep on glibc-gconv-utf-16
Date: Mon, 30 Aug 2021 10:59:43 -0400
Message-Id: <20210830145942.7005-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libhidapi-libusb needs to convert from UTF-16LE to WCHAR_T in order to
read various libusb string descriptors.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-oe/recipes-support/hidapi/hidapi_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
index 76f5dc762..e45445073 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
@@ -7,6 +7,7 @@ LICENSE = "BSD-3-Clause | GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077"
 
 DEPENDS = "libusb udev"
+RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
 
 inherit autotools pkgconfig
 
-- 
2.33.0

