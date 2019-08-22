Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id B83FD7F25D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 16:44:26 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id v38so8525871qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 09:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C7Su28z+0si1SCPAXVHopJOjq4EVc0BmMapicgKvTqk=;
	b=sUnRUBamzG/TLA7FYUOsE++iF3rjaivwYzPZ0cX+We4ulPiynoa+sfzlYAI7bXGLxl
	hoz7cUG/+hieYSmR/UhS82bJidtWQsMssDvIDniOkBYaesLIXMWL12nO7PrQfKtx35TK
	pDQrhb9UWiXONuUjqaZfd99klaJiJNNPJaMycaLZhORlaMUMC9oarQRfPjPoPnydYDD1
	8J+3pTfBEyHE72aMj/DpIKjjgJqWNp2ivJAIYl3GXDYRN4G0FzSXxPRs4Qpn6WhLieGA
	LykYidarX3IpTHprAhOjsfhiiYe2I5ABIAn454X46Pz8TCjuqQWDxKAffzzqBmRRqn55
	UVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C7Su28z+0si1SCPAXVHopJOjq4EVc0BmMapicgKvTqk=;
	b=beNcYgOklDJNEcADdXLYhgL218ARMMnDJU3jNzu+FwTfCqjrncxga6p7xCaE84e4Zo
	PNMOyZrguLcm4L3EPG3yvvWlfK03oA4hVxgY8JcJqZYnVKHAJHs1Vy1SPBBBRZWcsMvg
	PwZy1oQ+AKdCSTpDquJA31fiOrjbb3IpjkFRWshNG0sutSEJh9HiLDYkD9g6Mq/UWfiN
	7cjEFUA48mXfDlWMSuDXbs+GXMowLtPpFQxR5D5pk9TSLWBrUTfcdUFyHYI3u/zS5HZi
	pYlPub+kzwZu1R0M7CjLg7dcnzE2nyH0Gpi/jCZM/xbaImzeHLIyvyhO47qesRsNQlRb
	rErg==
X-Gm-Message-State: APjAAAUT2QlfkAW42ehjlI/rBGl1ZmST8qJpz4zq5QautDbzGEFTgZcA
	8ZaHNjK3yOY6VF2pxiOcp1BT+AT7u1oCbA==
X-Google-Smtp-Source: APXvYqwkilXWrfKC8hGjtWLb54ECWM8AWR3G1FFRP96jT6SALxPlW93Ag5gQyj18UkijIe2/T69OxA==
X-Received: by 2002:ac8:74d2:: with SMTP id j18mr547780qtr.378.1566492267290; 
	Thu, 22 Aug 2019 09:44:27 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236])
	by smtp.gmail.com with ESMTPSA id h12sm111320qkl.63.2019.08.22.09.44.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Aug 2019 09:44:26 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2019 12:44:14 -0400
Message-Id: <20190822164414.1488-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [thud][PATCH] libedit: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Thu, 22 Aug 2019 16:44:26 -0000
Content-Transfer-Encoding: 8bit

To keep support of meta-clang support on thud branch.
It depends on libedit native
---
 meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
index 8cc0e959e0..60f4f5a22b 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
@@ -19,3 +19,5 @@ SRC_URI[md5sum] = "97679319742f45d6cdcd6075511b14ac"
 SRC_URI[sha256sum] = "c41bea8fd140fb57ba67a98ec1d8ae0b8ffa82f4aba9c35a87e5a9499e653116"
 
 S = "${WORKDIR}/${BPN}-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


