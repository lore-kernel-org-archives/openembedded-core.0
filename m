Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id F3BAF7D28D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 16:19:23 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 10so853077wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IFCJ6Dz6+TvPEtooxpHXftGNFn4BgavR/1HuCYnj9ls=;
	b=k7fhTa9pJ43B+br0QvQbQLB49xyG5bMWKkWCHJOPKzNVScZ0fM1Os7qCt5+gR3Ois6
	nAkdsbixfCeDIke5z3Fs2YHlfE1me33RC9WPXcqruUCoIe0U/H71vBPFfFCjBcCkohKo
	QmnSVUlpjvQMUH0fJsqhfX4jd8DGp0hOtKS1MEp14E8n6+Yfsr4Z8+Ft2MJkwYZVkWBC
	T2Btt555olM3mxz63gYhGkBt6Cn/qVrYwfsj5cDyfwpNCUyyZWX/90SrWxUMd0jXin5/
	LQxfH+upc6Dg2W2LxNXSI3UezX9SgxW+T6UDpnC2/2jwNZ98kQl2gu9Fq3N+z76LH4Kp
	jjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IFCJ6Dz6+TvPEtooxpHXftGNFn4BgavR/1HuCYnj9ls=;
	b=h5FAWFIVb1rxNcb/u5NdXYUqnl+3U8y96/XJbp6kpGyTG6D5FrZAOPBQUPc82G1VJ7
	xwvhYHaLv05czYkaK778WFhRp7To0yiSVCKCN5zPG3dMR7M5F6Sd+rXeQmtRqZLxU5UR
	SVkOjBYWu0tkqNpjmi6H7fKaK8qLqNfxzjgbD2eO7urA2r7Sm5vhmbvRYBxeVII4qIro
	xNGvqh4rmjR3WvgfBN1qF6qOaMQmM8S9Y3LJpxE8YCKkMo5uvRs3b41IBMkiPPxmbWT9
	DAoxqedgjKAuS3jyifls/7Amk02zRfjXD6qnnvFmIAd03p94Xg1bYTtqF+UZBKG2xnjO
	HTLg==
X-Gm-Message-State: APjAAAVBuboPq/UsyqKRsQfMO5DlJNIrjUFsWTJHowjgCB5y4i94kxEz
	4DsAWANoJ2w50ZSBzN+J3QN8NZaVIrY=
X-Google-Smtp-Source: APXvYqz/z8ATaBZoc3GFrMiraecLb1OSCqgoNNqjyLn5hzKCzZDd3rjGSJlMukK+kzt05Qe0G4cy/A==
X-Received: by 2002:a1c:55c3:: with SMTP id j186mr2781546wmb.127.1556036364183;
	Tue, 23 Apr 2019 09:19:24 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t76sm22599142wmt.8.2019.04.23.09.19.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 09:19:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 18:19:08 +0200
Message-Id: <20190423161916.25572-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/9] msmtp: fix upstream version check
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
X-List-Received-Date: Tue, 23 Apr 2019 16:19:24 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/msmtp/msmtp_1.8.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.3.bb b/meta/recipes-extended/msmtp/msmtp_1.8.3.bb
index d2b75ae5dce..9f28d6ac252 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.3.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.3.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
 
+UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
+
 SRC_URI[md5sum] = "0c0be51e6872e818f78bd6924636327b"
 SRC_URI[sha256sum] = "3cb2eefd33d048f0f82de100ef39a494e44fd1485e376ead31f733d2f36b92b4"
 
-- 
2.17.1


