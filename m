Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2010C73123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 23:56:58 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id p138so5174272itp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 16:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bxvU49xLAY6OZHb1MQNz2Ei++A3QqidUtXlS++LfxYE=;
	b=dCrPVoTfzOVBm5TaY3sHG9xADopawDlli55oTbeaYKjFLApZftslg3/4etKERBT0hZ
	UExu5J/Mvw4Z5D76b2jCy0nlT8vUeelrQOL9x8ApRDw6U9pyMI8zeL605/GNEMT2tPDW
	gjW7TGYfBnm5w3fwDrIB/stXXOM/RNQqJg2NyHx9n6U/m2CabeqPfnZ10PlhmnRq1v/M
	fbk91dOo4ZazGyRgM39/RHQkpWk0chmAbJnvoEXfwnXii8Td6mBjEZULYeQIvtLAJE7D
	FI8qJNax2Fcg5m0FXbvZdJLGUf30yhoTxP9G3UmRgYYWM7PXKokasGirGD7/hBBwetjm
	5FzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bxvU49xLAY6OZHb1MQNz2Ei++A3QqidUtXlS++LfxYE=;
	b=lsa7QQi+TfkrZeKvhyEfBUiCFj65lF627EYHqMpbt9KdzSmdJLPy+jWzKf987dy3Ks
	UY6Mrly5xfTe/9sSQ6eQvhxjHRMW/OA4aNGZI6RXJgecXxidkSFRK1nhfNqaY1pdh5qW
	6YmQdGE7DwmiNKILCX54W+ZHfNPoARvk+9S2VHMW1oySBn1KstkcfpqYi7JMSOUhc4cP
	qzluUULSquZHgXsCacmj489/YEuwOBHo/YYbhndbflj4d7mbTvpZvNZ9B3JJFBQFDS5P
	DZn25okEl3/46+V6YBqbsRqfUAO8A7t9Z5RcZxmVDxVoWCc0SY+YsctwRXkZcvjEsohr
	nOGA==
X-Gm-Message-State: AMCzsaV0dXqG9M2inTYa5ntOZJGSfJbDEZ62Na81fReSrTEIfqPITVf3
	QPXiUNCuFPewCefMh4wrjaGCcLwi
X-Google-Smtp-Source: AOwi7QDE+dWmfSkiqLvU85LXWRBb1hZnH1oBvXFk2TkwBFIQs+chdFZ0t4PVxsma+Cp24DvoP7i4NA==
X-Received: by 10.36.252.68 with SMTP id b65mr572536ith.151.1507766219667;
	Wed, 11 Oct 2017 16:56:59 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:acfe:1f2b:6abd:6d57])
	by smtp.gmail.com with ESMTPSA id 41sm6705500ios.52.2017.10.11.16.56.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Oct 2017 16:56:59 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:56:41 -0500
Message-Id: <1507766201-3160-1-git-send-email-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] nfs-utils: Add switch for NFSv4.1
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
X-List-Received-Date: Wed, 11 Oct 2017 23:56:59 -0000

NFS version 4.1 support can now be enabled via PACKAGECONFIG

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
index d917c4d..79453ad 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.1.1.bb
@@ -56,7 +56,6 @@ SYSTEMD_SERVICE_${PN}-client = "nfs-statd.service"
 EXTRA_OECONF = "--with-statduser=rpcuser \
                 --enable-mountconfig \
                 --enable-libmount-mount \
-                --disable-nfsv41 \
                 --enable-uuid \
                 --disable-gss \
                 --disable-nfsdcltrack \
@@ -70,6 +69,8 @@ PACKAGECONFIG_remove_libc-musl = "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
 PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+# libdevmapper is available in meta-oe
+PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper"
 
 PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
 
-- 
2.7.4


