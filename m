Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4333961424
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:47:04 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id q39so6279215pjc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xXC0CnefiujDY6iQri+6lGsDLlp6m0hxWSp25nDSqJo=;
	b=axRcIoV0IKahI1QNE+cNpdKTx1pYKO4XbsKoFRR1jyr4mxqBnWb3HtislPrFOqjS0X
	RQqnv+jy5/EoAakbnoC17ftsULrTtmWnlR5vxqu0LAulFREGWpvywJIJ0gUwkYFC1OIv
	iikQ12UD67UJTTFosBw4HFHjwuDHUqafsw6OvsYTOW3u8wsmEfHghluVIswecAOXug1K
	2k6BJUS6Zzz1vvJfbRlU/LTtUju18Xa4Me0WKWT355etsSyivvw7M6u2Q4SSoVa6nEDs
	BBgBOoGBiUYQe17r/ipoSTerGbZ5vJBFLzceBI9O+qsohDWZxT5Kmgc0TxjeUn5xq3hR
	8pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xXC0CnefiujDY6iQri+6lGsDLlp6m0hxWSp25nDSqJo=;
	b=EpSfDdOqOWEvlDEMdyQCuErULRBSgW7+0JMSRDkPBzLk58EuVMq0fxrnr+QxnnIn07
	pd+gny1/pVgyLSbJ9F7J40NVyvY7itR8L+2tMa5CNZTMeyTZSa7ddYYG6S7FY1LFuVMI
	YR5gf4Z8QyIHyEVaYM5GYc0/aLlHW0d7rPYHoRFVZFP2gMm9xY8zO/SZHPuZa6XyPEOh
	fQ64i3rK+RHpR/LfIdXpWx5g5hXqusZYVZPicoSMWLnMTxa7MN2Qyd2LxZuFkwzujEMu
	863GVBYb8v4SthLAwFCnXhQADw93hmoH8AN8HlogS6O4ILFbaCM8VfFzvKQ4iqltOwLW
	oRIw==
X-Gm-Message-State: APjAAAWoug0luQJke8LmiptHA4QD0zWHa/Jpa/yMEkSvwoiq+nWI2BH2
	tlRP+up2XHum6KK2F9AoPOxiEAqDn8k=
X-Google-Smtp-Source: APXvYqxOIXb3GWkxwircIvjAjr0PaYXPoQSEkljUWDsHmO/RHhoL8rj58m8Bt/EcDOP7S2OvLUDveA==
X-Received: by 2002:a17:90a:804a:: with SMTP id
	e10mr16425109pjw.41.1581886024938; 
	Sun, 16 Feb 2020 12:47:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	m12sm13877924pfh.37.2020.02.16.12.47.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 12:47:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 12:47:02 -0800
Message-Id: <20200216204708.7179-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/7] sigrok-cli: Inherit mime-xdg
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
X-List-Received-Date: Sun, 16 Feb 2020 20:47:05 -0000
Content-Transfer-Encoding: 8bit

Fixes
WARNING: sigrok-cli-0.7.1-r0 do_package_qa: QA Issue: package contains desktop file with key 'MimeType' but does not inhert mime-xdg

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
index 2293f142b3..369e2f6f4a 100644
--- a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
+++ b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.1.bb
@@ -10,7 +10,7 @@ PACKAGECONFIG[decode] = "--with-libsigrokdecode,--without-libsigrokdecode,libsig
 
 PACKAGECONFIG ??= "decode"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig mime-xdg
 
 SRC_URI = "http://sigrok.org/download/source/sigrok-cli/sigrok-cli-${PV}.tar.gz"
 SRC_URI[md5sum] = "3f45ce664bad529d8b3f78a61b017d75"
-- 
2.25.0


