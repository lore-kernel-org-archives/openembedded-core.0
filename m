Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id 465FB7D2AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 06:36:25 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id p14so15744530ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 23:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=I6bmy3b1nih7Hm4tPHbVwplGtU48nwdL6jpk323Xx8w=;
	b=gsfNSoxZZ/OTvut6XTWM8aK8wDKfJhdwewSpTCmdbHAdlAHrM8H8x/a9uMAWbyeWTD
	8O3QUS8+rYUjjNEx7cTG9wUObSvgMsZvdbDkPnxqKWStRhZqET0XwAJbBqVZpZshC6Vs
	0gVuiSQC8b9loZ1bk11xF+86ZNlTQnjgn6m+01DlGFcKmNIZBxwD3pFsCFqwXknsHMGN
	/AI7uynebg9pebE/mOqExqvh3DTNqb/gvl9btnFzIakbXC0yWzwF7ymIrHTnFMfHZpge
	0VLHXmpxdYE08ekBeftdQL+fXU4z8x/WdtBUB+NFHwyMzcwDW06EPl65yseA9LdUa2nq
	XA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I6bmy3b1nih7Hm4tPHbVwplGtU48nwdL6jpk323Xx8w=;
	b=S4uyyIFaHjPNXztrHtQ2P2xfsyFbw0TDe6i1aGJGh76jcRgdKkbeV78bq9wBJxIh0R
	05K31iso0JXwHiKFz2Ql0WyWRjFu6e2DmN13FKvFVQELZaC1UfzN4C13B276xkimzh5k
	9OAgtUa0irhEYwtAzlS5wRi9oaivP9lbu9sBI9SrRO84EMbLAySnQarKkwsUPO5rHHI0
	ue2uEDLH8NwHHz3o51UJKWwphC/ph0YN24wYhQ/b4q7Bq8yspy+11cGVCUwoVIG07Eva
	YpzEjrZEVE1tblb9KCMHkmcpbgd9nfCi1kF7edX7E+r6mZ6+FzLMTr30W9EhK0i739g2
	rxwg==
X-Gm-Message-State: APjAAAXPlg9I48HXOs/xtzgIWlFk08hfXHht3VY29vQJPsdXroNdAa1j
	/N1+nNVHYrVPoeQ8wiN9yRiSzGH4fTM=
X-Google-Smtp-Source: APXvYqwifwLtqhagzOpMhS26+9XWJx214s/jk0M6m/odGBxG7RQlkzhYREEhhgsuOJXCrw22mkcD5A==
X-Received: by 2002:a2e:3c0a:: with SMTP id j10mr4754279lja.164.1556087786279; 
	Tue, 23 Apr 2019 23:36:26 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	r136sm4199193lff.65.2019.04.23.23.36.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 23:36:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 08:36:12 +0200
Message-Id: <20190424063612.30690-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] python-numpy: update to 1.16.3
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
X-List-Received-Date: Wed, 24 Apr 2019 06:36:26 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python-numpy/python-numpy.inc           | 4 ++--
 .../{python-numpy_1.16.2.bb => python-numpy_1.16.3.bb}        | 0
 .../{python3-numpy_1.16.2.bb => python3-numpy_1.16.3.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python-numpy_1.16.2.bb => python-numpy_1.16.3.bb} (100%)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.16.2.bb => python3-numpy_1.16.3.bb} (100%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 43c8960a18..43c3053cd8 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -10,8 +10,8 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-npy_cpu-Add-riscv-support.patch \
            ${CONFIGFILESURI} \
            "
-SRC_URI[md5sum] = "4fc754be7ec3e0f80b042d907e99f4ad"
-SRC_URI[sha256sum] = "8088221e6e27da8d5907729f0bfe798f526836f22cc59ae83a0f867e67416a3e"
+SRC_URI[md5sum] = "0886e5b5017f08f2b7a624c0b5931e61"
+SRC_URI[sha256sum] = "adf063a3f87ab89393f5eea0eb903293b112fa0a308e8c594a75ffa585d81d4f"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.16.2.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python-numpy_1.16.2.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.16.2.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.16.2.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb
-- 
2.17.1


