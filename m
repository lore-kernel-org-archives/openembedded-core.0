Return-Path: <jpuhlman@mvista.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id DF65075541
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 15:09:45 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b74-v6so3388346pfl.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 08:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4vwwNknOwjXlVHPYx3+YnMg8q+YoZecoyXxepW4xGwY=;
	b=oeJdqokckN5gmKyK1jd2/oE58a0Q99rkm2oGAJuvVeTMjRyqKqfzd3Z1ovQNUregbV
	Kwn0q4JAUTwN4V13wcPtUTaUuSMeeg7A5gKN+EaMOqDRwGgA795nWvOSDC77UTklFFac
	HAfWh5l/Ezr87XrLhC/t8lIf6SFDp9+17094UlJhymjCrKWxMqh702AlVsdYDM/VKB/u
	ZVbduZA1rhVpodHEMmmzgZwECKeRbFp1xu6Me9ooz4KbLKwOc12vb4/RsPQr93eS9hDt
	QAsjiVi0wbwbjCAJhONpqgD8qB0prRrY56lticLjzh9TE5Jai9WdQLkR7RxhmbV7RsqH
	zJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4vwwNknOwjXlVHPYx3+YnMg8q+YoZecoyXxepW4xGwY=;
	b=MGYvKzllNPvl/83Hrrie3q46xkhUIP92BiZK4q3SZ/f9UfGXXzncctx87keIVn3mqv
	ug0S7DeAunrRW3G5DWQ5LBuPEyf1q+VM4RYfcQnq0pnSdBXzR+mXjLRjjopZk9yQY9ab
	Igk/CvAA/WSIcTjjFY+d/CUrsiYA9GpwmjCaKwgyf40w3qbPRPdi9q3E2Oat2ClJEHlf
	t5xTAqnOsp8JrablySUfFkzrG+h9FMlZPgy+fdwb/9Kn1neSKo1VxGDgpb92BLPVhRow
	KK0iMqTudVksOmoq3jGitT7dnrI//VN04+GHJluXGSTvBggS88eG7GLXaQ19rYhJvBza
	68Lw==
X-Gm-Message-State: APt69E3NQZRW8y8SA1kOvlC55i+FbZOpJCW+UZ+6QLkK9O6z7T/HXUOc
	UkWAwTKUySGBPlVE65nZdYKJsCeC0Q4=
X-Google-Smtp-Source: ADUXVKIfpUcnSzT2JBi7F+xbLrYiSdi88ZsyRx4AzlbGXLVS249C0dzHMOGNPtr/yyWnjirDJqNp3g==
X-Received: by 2002:aa7:8311:: with SMTP id
	t17-v6mr9920363pfm.45.1528988986906; 
	Thu, 14 Jun 2018 08:09:46 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	z74-v6sm10818402pff.54.2018.06.14.08.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 08:09:46 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2018 08:06:46 -0700
Message-Id: <20180614150646.17865-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.14.1.459.g238e487
Subject: [PATCH v2] Qemu: CVE-2018-11806 slirp heap buffer overflow
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
X-List-Received-Date: Thu, 14 Jun 2018 15:09:46 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 ...018-11806-QEMU-slirp-heap-buffer-overflow.patch | 69 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.12.0.bb          |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
new file mode 100644
index 0000000000..8622360114
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
@@ -0,0 +1,69 @@
+Upstream-Status: Backport
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.12.0.bb b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
index 21796df9d7..98db44a8ef 100644
--- a/meta/recipes-devtools/qemu/qemu_2.12.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://0009-apic-fixup-fallthrough-to-PIC.patch \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
+           file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
-- 
2.14.1.459.g238e487


