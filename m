Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 460866B50B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 14:13:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t27so2169382wra.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 06:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4tLzUO4J0nVdDsPWnFjYcLR5hv+RP1Rj3LnQ6t+BpIc=;
	b=TgMlRKRANK3/M7u9M9NRe6pfUWak+ntUwi1pjs24ozwU7Xk1sSWWgxZzSE68IWCjG+
	LQr7Ibva0GUtVavam+1wObAfL632Uy04WqG07InpmP3JKAC+R1lYyxUMjXLAdq281aAO
	veAPN7+NN5UGWCPUB0Jj7iOQ39RKoOc7CJ/5Ty9f1jhoyG9ffQWVBtd2/wUiE1UkfDlV
	b5pDgAQ1O5UcEkV9m7AOXeYDDjri3dKJ21MjGQl9RaRDVsvFy/qUkIqPHFHrM7pjecLy
	tQttOfC95swzGEVyziTNDjicMlcGOhY5UN6nHqDBfXYt+w7x5jBBcUJX3rHMxQLcUif9
	+c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4tLzUO4J0nVdDsPWnFjYcLR5hv+RP1Rj3LnQ6t+BpIc=;
	b=aBRuA6cCDE0rYv6zFhrDhxCRszG/cUJpOWxa9lOCA25dSqKbH3kSirC0siqe4w511p
	LZn0Vj9RzXJPpy/T23pi9gpFEE7FjibNP6bUVFMXApIVgcneR4xRNINgIZCj0tp81ztM
	VCGvMRyfkC5Ij+dKoFh+3BqgeV4HN8TP/ZvcmpmkBMAsIVHzMtTAeETEGpd+7/wY8IH9
	hpdYptlC9ealC9+WJZpQnlyZAbdVDjLP9dO4XK0+kSO5NnsfbhHlcuTg98krjCyG64mJ
	f4HVcQKwWgnbFd7yxMOtbXczVpBYn+/eqiUMeLB1tK0H/seSv4OIkHo2zmwm1BlYHS3p
	wmOw==
X-Gm-Message-State: AA+aEWZGbR7lnT3/KAoK9AM6s5Bzz311UoKPXWgd1jzKjWH88n90AKzm
	TrEmEz7La9rOLOIK1fBt/2BNxh/T
X-Google-Smtp-Source: AFSGD/UBY4jruAU7p7iqFhRCmyy9SphP0M+rBXufjAdygYQLM0K1ArY/LTL57sGCcz0j/5MwEk0HVw==
X-Received: by 2002:adf:82a4:: with SMTP id 33mr1229477wrc.252.1544710398485; 
	Thu, 13 Dec 2018 06:13:18 -0800 (PST)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host184-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.184])
	by smtp.gmail.com with ESMTPSA id
	a18sm3400690wrp.13.2018.12.13.06.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 06:13:17 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2018 15:13:12 +0100
Message-Id: <20181213141312.14587-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python3: fix build for powerpc-linux.musl and powerpc64-linux-musl
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
X-List-Received-Date: Thu, 13 Dec 2018 14:13:18 -0000

Add the missing triplets (not considering uclibc) for do_configure.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../python3/powerpc-musl-triplets.patch       | 43 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.6.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch

diff --git a/meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch b/meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch
new file mode 100644
index 0000000000..477d049858
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/powerpc-musl-triplets.patch
@@ -0,0 +1,43 @@
+Using musl libc the task do_configure fails on powerpc*.
+
+  checking build system type... x86_64-pc-linux-gnu
+  checking host system type... powerpc-oe-linux-musl
+  checking for python3.5... python3.5
+ ...
+  checking for the platform triplet based on compiler characteristics... 
+  powerpc-linux-gnu
+  configure: error: internal configure error for the platform triplet
+
+Fix this by adding the musl triplets.
+Note: uclibc is purposedly not considered (unsupported in oe-core).
+
+Upstream-Status: Pending
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+
+--- a/configure.ac	2018-12-13 14:44:55.414309610 +0100
++++ b/configure.ac	2018-12-13 13:22:37.546497547 +0100
+@@ -831,14 +831,22 @@
+         or1k-linux-gnu
+ # elif defined(__powerpc__) && defined(__SPE__)
+         powerpc-linux-gnuspe
++# elif defined(__powerpc__) && !defined(__GLIBC__)
++        powerpc-linux-musl
++# elif defined(__powerpc__)
++        powerpc-linux-gnu
++# elif defined(__powerpc64__) && !defined(__GLIBC__)
++#  if defined(__LITTLE_ENDIAN__)
++        powerpc64le-linux-musl
++#  else
++        powerpc64-linux-musl
++#  endif
+ # elif defined(__powerpc64__)
+ #  if defined(__LITTLE_ENDIAN__)
+         powerpc64le-linux-gnu
+ #  else
+         powerpc64-linux-gnu
+ #  endif
+-# elif defined(__powerpc__)
+-        powerpc-linux-gnu
+ # elif defined(__s390x__)
+         s390x-linux-gnu
+ # elif defined(__s390__)
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index cd7991e7f8..2e8ae711d5 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -44,6 +44,7 @@ SRC_URI += "\
             file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
             file://run-ptest \
            "
+SRC_URI_append_libc-musl = " file://powerpc-musl-triplets.patch"
 
 inherit multilib_header python3native update-alternatives qemu ptest
 
-- 
2.17.1


