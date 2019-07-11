Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0FE7CE22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 23:54:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id 31so8076842wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 16:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GgvypdlpdWQlqTfz63ffBe4EI81hGmuU2xmurOPA5VE=;
	b=izmpDHYbipcyN+MWeaWlyBPl6PhkIELga0zNyTjXIUxkl6zsmywtY5R17X75Mm3xjz
	NTIkWb/OjmOnX2mo6OGLIZUne3eXJdn6NdzHiYJJjoXIcT834U6T8qYKi+zS7cOHW/oO
	9OXStI6H2x9/fw80RoNT4AsFvE+2Qpf5TizQTHY3K2KHPmrBP4Oe44dAIj0nTz2vfkDf
	tQXMDJK2rRqNsYU0pQRR0SQcy5+1Ml4eDhgOqhcCaoXj/GXoU/g7F+eEY+lsBGkHm5t3
	1Z/urDiYRoDCfkus56SI+PgIu7cK41Xx/IoT6lXk6BgkTL8IOHKCIVMF8dfwHAj8Q7ic
	LC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GgvypdlpdWQlqTfz63ffBe4EI81hGmuU2xmurOPA5VE=;
	b=hwLCPEsubcQmRtT5ifZiukzKSRqG5Xj+CpjKgzFCtslYVf6YCWGrJmuh2K1PmcSvIs
	E6QsnJRQWzmz3VDdgUGS7VflDbr0vLETCe4Pb5gMkE055OdlqCe7pKJ6+YfUXWwtcDNY
	b0DdSqJtPnIjfbaDd3pxaXogK8JLpSkm4QEvrpUxjmfHklJFT5BbDlLiAITQ9jEgET0X
	NNuyD1BrlsK91xB7wHBKq+Wnhe8BGBNhJ6N1lgC8d7LcVX2pwXKR38u68ZPXaUeym0Wy
	WWgpF2ef6n7M0eUX4OYBhg5pL+skKbYycUJJWPt94YCqW4jBVWdSngbMkmeDc+N2CRdL
	rZnw==
X-Gm-Message-State: APjAAAWhLRKcwVxkan+ZQXk2ifsOQhqOg8QbpgP386evDFedWvfWwThv
	MMBicwGtEGciVU9ornFY4apm9BVowUc=
X-Google-Smtp-Source: APXvYqzceTtfXITzSbVVkKGpFVm4g40doJwEnXIdNsUJ6WHpIE7fpOtgfmXfR2cMxEKsG3DwWiWg4A==
X-Received: by 2002:a05:6000:1186:: with SMTP id
	g6mr7607601wrx.17.1562889257990; 
	Thu, 11 Jul 2019 16:54:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o24sm11739614wmh.2.2019.07.11.16.54.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Jul 2019 16:54:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 00:54:15 +0100
Message-Id: <20190711235415.22946-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libpsl: update Upstream-Status
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
X-List-Received-Date: Thu, 11 Jul 2019 23:54:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch b/meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch
index 2331a766a16..c78d6fd981e 100644
--- a/meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch
+++ b/meta/recipes-support/libpsl/libpsl/0001-gtk-doc-do-not-include-tree_index.sgml.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] gtk-doc: do not include tree_index.sgml
 
 gtk-doc 1.30 no longer generates the file if the object tree is empty
 
-Upstream-Status: Submitted [https://github.com/rockdaboot/libpsl/pull/137]
+Upstream-Status: Backport [87d1add318b5e5d09977f7f374e923577b6ff3be]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  docs/libpsl/libpsl-docs.sgml | 4 ----
-- 
2.20.1


