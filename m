Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 97A7F78815
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 22:17:51 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id z14so16909438qti.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 15:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+JBzZB1Dn+4OOUpSYK/z7dyAP/edmaR9CzBU+RBmd9E=;
	b=s74H1jYZ2/a2wRwDCSMZlIF6mlYhw84I7Wve0dK5YpgjABNdBpF5KfMax+zU5QP6ct
	5Jin1TKtaOVBVdZetdpdoYG0URoPLFxHKGPXdcU4LVUhUJYL7zI6RVXvO4aLcAbY6vbp
	9bTX3STaegGhlifuMZUNbv3B5kXWW2go97pA7RKIAsYfKd87vyaGCkCRaqz8Ew2Hbp7H
	hKF8uBjjpIbVbnGDSErXwutWAeha9SesB7QdgSVmgFp3GONxBW6cT2yiqXav6tb69u1j
	j2mutp+yWPR48bbNul8OKDmOmq5Kv53EVNiPj1kGDdToJVdsGUyRlORxDyl28+ORULGS
	Kxfw==
X-Gm-Message-State: AElRT7HwB3OhvmAy9f5aFAZ41PDo8aDb02tb5i/4rD0sVbyEYyqpD9IE
	8zeYaMtNFLL3UmVxPoFInZQdbbEm
X-Google-Smtp-Source: AG47ELvsPOvja1xY7egNc0m42QKxQCLznPnnqFXLp8hoD+QYau4soZmfwdOcgJfoE22mi3RkvUKm1Q==
X-Received: by 10.200.63.187 with SMTP id d56mr1993428qtk.169.1520806672242;
	Sun, 11 Mar 2018 15:17:52 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 92sm4116611qta.5.2018.03.11.15.17.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 15:17:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 18:17:37 -0400
Message-Id: <1520806657-4740-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3: update to version 3.5.5 to fix security issues
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
X-List-Received-Date: Sun, 11 Mar 2018 22:17:51 -0000

License-Update: checksum change is due to bump in copyright year

Resolves CVE-2017-1000158 and other potential securty issues

See https://docs.python.org/3.5/whatsnew/changelog.html#python-3-5-5-final

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/{python3_3.5.4.bb => python3_3.5.5.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.5.4.bb => python3_3.5.5.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.5.4.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.5.4.bb
rename to meta/recipes-devtools/python/python3_3.5.5.bb
index a94d009..8150dd6 100644
--- a/meta/recipes-devtools/python/python3_3.5.4.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -38,10 +38,10 @@ SRC_URI += "\
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
             file://pass-missing-libraries-to-Extension-for-mul.patch \
            "
-SRC_URI[md5sum] = "fb2780baa260b4e51cbea814f111f303"
-SRC_URI[sha256sum] = "94d93bfabb3b109f8a10365a325f920f9ec98c6e2380bf228f9700a14054c84c"
+SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
+SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f741e51de91d4eeea5930b9c3c7fa69d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.7.4


