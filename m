Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A3671775DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:46 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e199so20438492pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wu88WV9IrzUiSshi7RI6V17GvK5x9pqwacP8Eoo6Gtw=;
	b=bm5h2dmOYX9By2DwdFKaGDTQ/sHfgjpK+6G81fFnm6PtZzQy8KAOQtB77FXteGl/9/
	ETEUsvuI3L9Gwka7E972h7EfeCvo+qNUI75KuPtQ8HLqEyL5VhxoBScZYNacZTvtDDA1
	fawI7N6D+Hf+kuh32URG36ZkuHgBBl3mfQZs/AT+XJA9egdoHdx8v6fY3N/hUTi1GfcS
	YB5g/WXcSq4fa6VsAX+SOJd2QzBiqM3PDsLweQmN+aQf++Pb4of/EyfYoJwMXWPhBUY4
	viygFChIC9xhFrwpBBn78DWUHFW6radkiHfEQ5L6GFOuDUOn4kDA8+9b73fiTEaAMUk7
	LU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wu88WV9IrzUiSshi7RI6V17GvK5x9pqwacP8Eoo6Gtw=;
	b=Wzwu5qRV92CPanRdKbgc+TW4KSDGp0MEkjHmVMxRBsz3YacWYzTeBizpKX+Zp/iR0y
	OKqiSSWdfLyw9rEh/HU373oAJukdadSbIehzWkzxLmhsDqIPih/GYa34wNG+tc2pR8Zi
	IlwXm0lb2mXKjn/M0QrCQn7bBk0oY/JkN9VOdxDdvVeX8bW5zBaKv3VK+TKSOADkdfPu
	pI0D7IEaR20BREWe2kR+Kik88U4WEs9ACmzbz1XEVoRHNQ+6AYrs+AiP45t3ig4MKmUG
	lZ+c3brD4Mkpa+AjaHtkF+t2H+t+AxOGryy4Y97WVujcKtGTtq09RehK4YFI8YZ+urF2
	SqBg==
X-Gm-Message-State: AIVw110OPFzH4mCUOK4bu362gYsQNDUuspc1X+xhEaeCnJT8qSQloeZv
	51OeKmYOt6UtzYXX
X-Received: by 10.84.194.228 with SMTP id h91mr964336pld.46.1498919027516;
	Sat, 01 Jul 2017 07:23:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:09 -0700
Message-Id: <d5f3d041c597264bb5374370e8db1855c20d380b.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 06/19] distutils, setuptools: Delete use of SECURITY_NO_PIE_CFLAGS
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:46 -0000

gcc can handle PIE in gcc driver

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils-common-base.bbclass | 2 --
 meta/classes/setuptools.bbclass            | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index fa733c672c..824a1b68b1 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -11,5 +11,3 @@ FILES_${PN}-dev += "\
   ${libdir}/pkgconfig \
   ${PYTHON_SITEPACKAGES_DIR}/*.la \
 "
-
-SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index 7d0c5267d7..56343b1c73 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -6,5 +6,3 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
-
-SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.13.2


