Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id E40677866F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 10:28:26 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id i141so18674718qke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 02:28:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=l/BJsOA2f3GbWptKZNNBGjGKjzpffN8op6uLtAG8BLM=;
	b=FWtTKknGdUbCns7U0sYUQtCpKVylWLg4u9bcgRdso17HMuQpNPnWj7fNKodZhAowWp
	f9LQrzZDXpOmT99Aj9ziKwfhvvrZFSfh2pFcIYzW1ukrFVgeei6APMDzdhVAGYhlXqME
	tIZed3HZzIPorC9qr9KmsmeQ7J6hXnpVc/Pn0G7aOfJX0vdQthrn/hpYLHaIfNkqmhSL
	saATS6KBcrTolJO87aPwbnBk2bT+UbUJZxifZ9NvecK4NEI7hW+OAP3tZ757CQ7ppcIi
	BOGORJHvoKvsHZky2gnImXiChhaqMbMewq8uYn6uGQwgxP2XhVgzV4K2KemT8kJqo20b
	8GbQ==
X-Gm-Message-State: AKwxytem2GoFmwIS92fJ28Rr8GacFYNxJj7aUbWzHJbsD0URj2P0Go/I
	ZJYQqt4MZIWVf/6VBJ8wT8yPXg==
X-Google-Smtp-Source: AH8x227vKmBnew0KsFaXE4M8RKL5BNEY9r27sHfQCLDsq6CLVbI+XbjE7JUB50KiAntxiaHGhs1CUQ==
X-Received: by 10.55.60.67 with SMTP id j64mr8189392qka.58.1517480907590;
	Thu, 01 Feb 2018 02:28:27 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	y123sm12351117qka.42.2018.02.01.02.28.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Feb 2018 02:28:26 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 01 Feb 2018 08:28:20 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  1 Feb 2018 08:28:19 -0200
Message-Id: <20180201102819.14994-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v1] glide: Add 0.13.1 version
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
X-List-Received-Date: Thu, 01 Feb 2018 10:28:27 -0000

Glide is a widely used Vendor Package Management for Golang,
especially in private projects as it allows for internal repositories
clone and other fancy things.

This recipe has been originally done as part of updatehub development.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
 - Add bash runtime dependency on ${PN}-ptest

 meta/recipes-devtools/glide/glide_0.13.1.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-devtools/glide/glide_0.13.1.bb

diff --git a/meta/recipes-devtools/glide/glide_0.13.1.bb b/meta/recipes-devtools/glide/glide_0.13.1.bb
new file mode 100644
index 00000000000..1a5b145cf36
--- /dev/null
+++ b/meta/recipes-devtools/glide/glide_0.13.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Vendor Package Management for Golang"
+HOMEPAGE = "https://glide.sh"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=54905cf894f8cc416a92f4fc350c35b2"
+
+GO_IMPORT = "github.com/Masterminds/glide"
+SRC_URI = "git://${GO_IMPORT}"
+SRCREV = "67790b3dbede72cfdc54aa53be4706322c9499e0"
+
+inherit go
+
+RDEPENDS_${PN}-dev += "bash"
+RDEPENDS_${PN}-ptest += "bash"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.16.1


