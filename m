Return-Path: <jpuhlman@mvista.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 041997869E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 03:41:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id z1-v6so2242483pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 20:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5sty7UPbRodznHbO/ocszskMLUAou5YLjr95TC8pQhs=;
	b=DfcWq+PIWCVxg3T4Ad+qgL8oTonHwRDkny8WTIFk6E3ufJ4ZhzdsvS6zxjxI1nDJNA
	z5FqSaEI685rGo+EcYwR5Qq8Wl4T39T/gTNKsbZha4tYaq0c9bBJxdQ/O3pI8HByI+OC
	G9DjqT8I9+CGAJpt4kCN0o2+ZQbmFEdmq8glNR/zNy3L8qXS7FzgSEh5NGOl61U6v+wS
	bRh7QZCsg0SLwDBDUbEuQ15FufvNdZuu+5R8P4nG/NV65f5ZF62SzPeMu3hT+oZVePTK
	fVn0z1R2Daynpc/3dRlRxa2wqkkh9ckfGlKaRpGNPVOe5j7ftMOBCeeUoVVbEOtx4SkT
	ej6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5sty7UPbRodznHbO/ocszskMLUAou5YLjr95TC8pQhs=;
	b=GCyUkysNzOj8ZnSz29wGB1yP7bILirsCTaEIjcVbhAxrS9kNKycN4ebN97q/6Smcb/
	+RqRQQVWDgOO2/rjJ6TcBrypMrqHho+UhIsk55qgxALzprNEWvsni+WVzsUIfsaFEQnS
	9yaPlEA8GcGikDMALQnsr4FwM79BCDlsyV8Yd/0pQwkYnOiaTQEniqJnfy+eijMn17F/
	guuRS188AOYj+mZ9wl57nlNSlB0gbEBY7h/gH0EZ97eQNuJOL1Z15HEz3H3mOkMHz4fv
	cSb5MXKJY4LVfiVQnldyvJkvsFa3Av0CIhKgoNM3XxL56VbDm2YJJcY4zbE0Wr4zlPdw
	pdGA==
X-Gm-Message-State: APt69E0rTPehhE8/WZxs7PAgfIoabq2zVTbdfXWr0BF5ymnKqa/QZ0tp
	x9OIbK8QYz95P3c7Oze3ePRX0KRGu/0=
X-Google-Smtp-Source: ADUXVKI2/Ry3pTgwsRqeqnDbNexclA14OGHHh7sIMiTEUZsD4eAGULNQdZLNshRXXKUHBKxpEuV/YQ==
X-Received: by 2002:a65:5944:: with SMTP id g4-v6mr764292pgu.317.1528947686968;
	Wed, 13 Jun 2018 20:41:26 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	k9-v6sm6918483pgs.49.2018.06.13.20.41.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 20:41:26 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2018 20:38:34 -0700
Message-Id: <20180614033834.21966-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.14.1.459.g238e487
Subject: [PATCH][rocko] Qemu CVE-2018-11806 slirp-heap-buffer-overflow
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
X-List-Received-Date: Thu, 14 Jun 2018 03:41:26 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 ...018-11806-QEMU-slirp-heap-buffer-overflow.patch | 69 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.10.0.bb          |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
new file mode 100644
index 0000000000..6a518b48dc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
@@ -0,0 +1,69 @@
+Upstream-status: Backport
+
+https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg01012.html
+
+From dc21a9d2951f0a2a7e63633e2b5c68c54e4edc4b Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Thu, 14 Jun 2018 01:28:49 +0000
+Subject: [PATCH] CVE-2018-11806 QEMU: slirp: heap buffer overflow
+
+Subject: [Qemu-devel] [PATCH 1/2] slirp: correct size computation while concatenating mbuf
+Date:	Tue, 5 Jun 2018 23:38:35 +0530
+From: Prasad J Pandit <address@hidden>
+
+While reassembling incoming fragmented datagrams, 'm_cat' routine
+extends the 'mbuf' buffer, if it has insufficient room. It computes
+a wrong buffer size, which leads to overwriting adjacent heap buffer
+area. Correct this size computation in m_cat.
+
+Reported-by: ZDI Disclosures <address@hidden>
+Signed-off-by: Prasad J Pandit <address@hidden>
+---
+ slirp/mbuf.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ slirp/mbuf.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/slirp/mbuf.c b/slirp/mbuf.c
+index 5ff2455..7fb4501 100644
+--- a/slirp/mbuf.c
++++ b/slirp/mbuf.c
+@@ -138,7 +138,7 @@ m_cat(struct mbuf *m, struct mbuf *n)
+ 	 * If there's no room, realloc
+ 	 */
+ 	if (M_FREEROOM(m) < n->m_len)
+-		m_inc(m,m->m_size+MINCSIZE);
++               m_inc(m, m->m_len + n->m_len);
+ 
+ 	memcpy(m->m_data+m->m_len, n->m_data, n->m_len);
+ 	m->m_len += n->m_len;
+@@ -158,12 +158,12 @@ m_inc(struct mbuf *m, int size)
+ 
+         if (m->m_flags & M_EXT) {
+ 	  datasize = m->m_data - m->m_ext;
+-          m->m_ext = g_realloc(m->m_ext, size);
++          m->m_ext = g_realloc(m->m_ext, size + datasize);
+ 	  m->m_data = m->m_ext + datasize;
+         } else {
+ 	  char *dat;
+ 	  datasize = m->m_data - m->m_dat;
+-          dat = g_malloc(size);
++          dat = g_malloc(size + datasize);
+ 	  memcpy(dat, m->m_dat, m->m_size);
+ 
+ 	  m->m_ext = dat;
+@@ -171,7 +171,7 @@ m_inc(struct mbuf *m, int size)
+ 	  m->m_flags |= M_EXT;
+         }
+ 
+-        m->m_size = size;
++        m->m_size = size + datasize;
+ 
+ }
+ 
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
index bdf6c21f87..89c68f272e 100644
--- a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://CVE-2017-14167.patch \
            file://ppc_locking.patch \
            file://memfd.patch \
+           file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.14.1.459.g238e487


