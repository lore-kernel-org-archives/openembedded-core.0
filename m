Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web12.22423.1629928789014075543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 14:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=tlOWjahW;
 spf=pass (domain: cold-front.org, ip: 66.111.4.29, mailfrom: jsbronder@cold-front.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 27D285C0210;
	Wed, 25 Aug 2021 17:59:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 25 Aug 2021 17:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=mesmtp; bh=aYNno9FgeZ/NfDDJ+w6e8Jp
	EddhSAl8YQR+ILYOagMg=; b=tlOWjahWo14n4GSio85ctINSnc1ZGxcqZJfyHvP
	8RB5FGgFRxSHMJkjsAiIOwbyeSX7TORkDvuuQHiw0aGXsYU5aAw9jS7NT9dgjasH
	UNGPoNF/O3ssDGQ05GpWMYem0r+q5WX55VKQvLp+baJRkv8pHqwLR3sFlanxFB8x
	/77c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aYNno9FgeZ/NfDDJ+
	w6e8JpEddhSAl8YQR+ILYOagMg=; b=Xjp1uW8zAl+poAGwS5cKx0er0ZDSlG9tg
	3xBqJJe7O11HFQtw7mYI3oeBT2bBEdlX2XpGUYpWTbrCLuBHZFp9a1PMLSAj7ejj
	LG6c4GrDcU3OGpqrAlTozVv/E8zUjfYVXVUIdSig4YEuhEXGTcIt7MBjYlDcr2HB
	fbzw6SrzRkm6Cjy65WvNlhH/igDpCBbMfa6nVu7gwbaKmuAqlO6qHHzo/3oufNc+
	2nk1ImqiqUo8dN9eadxaWbvkMHkWxVltA9Riye5gEp4m600hPWhu+W6eMx01BKc0
	lOnE/LQrVFz7WTdmPkVctZly3h/MtFlHXEkoLcOcRPI5k8dqfG9kQ==
X-ME-Sender: <xms:U70mYaZFWNhTjcyNYjKKUuZauSPz3e6kTLCRIItGfG9lWwOjpLhSbQ>
    <xme:U70mYdbnJt3rd2CihLRz8c-xTO33WAxKvcdYMb5yJXKIQCFCB6404TNyQBbLwtnmo
    c1U-LLi7CKMurgipw>
X-ME-Received: <xmr:U70mYU9Sg2JUeWZxMV0EBUmlSk4FSDro6aVdRn6ZH7PAMJF-pXBazWhaYd1Tl2MQsHwsk9A6kVYGM1SpfNZ0xsiEmqzylOPM7wZl7hBTYGjZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddutddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpedvhfdthfffieffve
    etveeifeeuvddthfeludeitedukeeggfevfffgffffffffhfenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlug
    dqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:U70mYcpxlJWuPMXWdgmW_efl_7_HqCntHsHF3-RT2qnI3E-dUYFKDw>
    <xmx:U70mYVqz61zWZUiI4lIROEoKPL-ZQy3STtfAGGfGzhzKNZL7LNGCvQ>
    <xmx:U70mYaTVXDdX1XBYAPfsPfwz1ERAVJEvwo_w7rdrTjmCiNqmPlcYag>
    <xmx:VL0mYUTKxGHc5YJM_tyiSw4hxOx1KMB4qPeZ_L3GfwM5HwN3Bc-5Pw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 17:59:47 -0400 (EDT)
From: "Justin Bronder" <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-oe][PATCH] hidapi: add rdep on glibc-gconv-utf-16
Date: Wed, 25 Aug 2021 17:59:38 -0400
Message-Id: <20210825215938.10941-1-jsbronder@cold-front.org>
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
index 76f5dc762..54b794774 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
@@ -7,6 +7,7 @@ LICENSE = "BSD-3-Clause | GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077"
 
 DEPENDS = "libusb udev"
+RDEPENDS_${PN} += "glibc-gconv-utf-16"
 
 inherit autotools pkgconfig
 
-- 
2.33.0

