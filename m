Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7888671AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:03 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id e4so15561238pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=61aEQxtlaXloQ65BxbIJ8njR8YjMI6i+oDK8Ah7odAE=;
	b=Kr+13J+pWylAc8cpSkQCTjs1ZxqcG0C56AhSku7cfiLVFwymCW0lrDiOWtolecaoqw
	Z97aTs3+HebvnbgkdM9VI2td1/40A5VsaGj+h4jLJ6uRzAG+OnziRiybtVAlNteQ3pgX
	wNx443f5iC+jcJcUZpxxoL+ENA4OAqgo6FArztAuynZUCunQ9JkTdy0U9SEBzC6eja3o
	7pV/yxoLglhbIV0And+tcWc0SzjIOogG3psg4mfMtll6VErZ91/F64O8TtnX8o/5VfVM
	g5C5FKKBgfdb1KQRdaE7APUjSeZChhiY4V/MAjorRsn1m/eM0dIp/1TSlxR+IDBs0cpX
	WTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=61aEQxtlaXloQ65BxbIJ8njR8YjMI6i+oDK8Ah7odAE=;
	b=qDrzJDA/0azCd1u/pOkptNIZH0YbbK1yZCfigo8kgxVz0UhhsNAYW/cYb4Vn2GNFBp
	8q2d4rYbUMHYAadaaC8GlS6sXRKVzRUUQirQUguQS4GvrJlwGcpw0DFgPhc332jIjz40
	+0sFIVjw9QkzlgE+dnGHXO2gQLSg6sgS67NZJHyyHj8RwpCHRFrwUY0/c8/Iq1ef+nRj
	7dxr3TwxEEbYrCK/pVAj5wGdnutz2gZ/suIoTYeYISntoVUOeWxvS3yqHUOu/U3SgS8d
	KzDXosHLydKnf05euKNOU7wt8fvLhnI+J6LTnWn/rO86+xosGjVpiOsxokVWAAX6PVk5
	kL6Q==
X-Gm-Message-State: AIkVDXJjaA2R1ABwsLFpTLY5phyOHnAe5QWorKm4MF+ZMyU4eSo3NkoMjf7PyofPiNAlog==
X-Received: by 10.98.137.73 with SMTP id v70mr37755671pfd.125.1484576223657;
	Mon, 16 Jan 2017 06:17:03 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	p5sm48560726pgk.23.2017.01.16.06.17.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:03 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-17-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 17/30] libgpg-error_1.25.bb: Enable nativesdk
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
X-List-Received-Date: Mon, 16 Jan 2017 14:17:03 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Enable nativesdk on this recipe.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
index 9d402ffbb6..d4ce224948 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
@@ -51,4 +51,4 @@ do_install_append() {
 
 FILES_${PN}-dev += "${bindir}/gpg-error"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


