Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0924C7837B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 20:15:58 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id d10so4504777qtb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=JjJMyWSYpgVEroiF67NgAeuhAZYG67ghpCcqmEs0dJ4=;
	b=0QTlhlvK0Jtx9zj9T5EmxnHnvvWAOX5Ek/fZK+HMvFz6/nI5N5gBquqadtui3LUQuk
	L40TBXdiMToNIwlRyCTJxqplXZ5KS0xt8zdCIzEzAPnKGV4w8qjj1Y+hjwou2BzCe7S7
	g/VGOu62xiFRUU8vrhc9wu+cnPxgJBNTXb0i3ocNWxYxm60QXobLtFQE3RPThuJ+hrYl
	iZkN/XLMcntbuJOrmrMFtJutpbZg8jdEfh6Ob0HKfqQYlBRPb1npBrhTzgytSpWkxJEU
	RJ2B8meNS8u1NLSwQ+JJ+sxKw2D35uXhwtV79YB3JwXTBrjUuEyKyOzmTRBY1pK5b2ft
	0N0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=JjJMyWSYpgVEroiF67NgAeuhAZYG67ghpCcqmEs0dJ4=;
	b=aFXCTAqmUBtJgUHh2ZkEdkPmUBa6T33w2qnj9BiOJr/nH1FiDCzEeZZBISLrhBVjmU
	gAeuf0O4y0aB+GZ6eyhsb3LCvSd4ZAw/6LZ8z5fctn0g4HloAL18s+MGs/8h44fQy5mN
	GpV7edZTTM3EsIlPl4Lje8uLgAS1Sx7lSBsz3v7KsomJVWYH13h5oiKuIW5hjZP7q2Bd
	YstKUn5nsMYkK/hM8svhswi01lG1WSEDba1GTX2FdBS4QBWvKbVK/74pGgdHnTTOZl4H
	2U6zZMNMtT+D1VB9MG/9mGdkpQgRTnDAlNI6+45S+DJlDUNdux5iIgiF6cP+0l3TDcf2
	p8nA==
X-Gm-Message-State: AHYfb5hLynZUDLn/3sjVqA0h6DenH6hYs/OmdCqypn03dIpZzee/avTL
	y83KpqhcrQmOHtXqkDQ=
X-Received: by 10.200.52.100 with SMTP id v33mr4323101qtb.67.1502914559991;
	Wed, 16 Aug 2017 13:15:59 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.72.143])
	by smtp.gmail.com with ESMTPSA id c5sm1046954qkd.27.2017.08.16.13.15.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Aug 2017 13:15:59 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 17:15:44 -0300
Message-Id: <20170816201544.15975-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] python3-native: Add python3-misc-native to RPROVIDES
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
X-List-Received-Date: Wed, 16 Aug 2017 20:15:59 -0000

OE-core commit 800753069f667cd1664d70b3779150c467e3b3fe remove
RPROVIDES list to get runtime dependences from manifest file.
python3-misc is added in python3 recipe, we need to add
native runtime to use python3-misc with native recipes.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-devtools/python/python3-native_3.5.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.3.bb b/meta/recipes-devtools/python/python3-native_3.5.3.bb
index db0e7b9bd8..8cd9c88a82 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.3.bb
@@ -80,3 +80,5 @@ do_install() {
 	# Tests are large and we don't need them in the native sysroot
 	rm ${D}${libdir}/python${PYTHON_MAJMIN}/test -rf
 }
+
+RPROVIDES += "python3-misc-native"
-- 
2.11.0


