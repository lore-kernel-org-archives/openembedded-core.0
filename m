Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 21C287856A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 20:01:55 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id l196so15051176itl.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q6dH5uBc0ahuBjWjdJ6CiRs5Lh7C3q8DKrk0qZOkeTo=;
	b=ojEyY5esPGCyNlmcgFDwdlhDHRPpYRTKWQ0YD58RC2rhJJDVV2niyvynCUuJmM3wsi
	Rdm9U8tjL1PD3dKB9T+C5VlIft/6+YT/+EeQXmbXFNjbDaIXbTqQZ4JeHNbMtVZY0zL9
	dk8hPQfaMk+PA/eG+VG2+K58uS+bH6oBbgyorethIGvOR4o07D+YmJc9+jbQPqHfUYJy
	r8a5AYEOKl+I80bbSRyvRzBQ6yBta9eu945+UF1mrENuc/vf1uawQhodwotXpX849Asl
	gPuBkmEjPbOwVaYrebeKUBGYlv1++SUxKkzGoNsvnZ9ynnNs7BcFf2+7Vq3AYwsKpC1q
	2fDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q6dH5uBc0ahuBjWjdJ6CiRs5Lh7C3q8DKrk0qZOkeTo=;
	b=gzWz1hgRehLJHdcHX8bnHE05uTa5KF+UOUAjanlfEofCEvEpOtHcGKDseMKL5Bf2cV
	wPh3L7ZAaZjttKFzD73MatWtKE7u1xrkiHfAMT5J7PLWDplzmMotzmdrETAfFx1ndMe4
	ud70JBAWmzVxz6C+9/KtcIqEH1lSqjMND5s3N1lYqjkk1DEoNEv60UoG5aXd5JNmn/27
	X6LNxzyrRmNYYtspAYYqXHm5mFC25wnqc9idQtQCB6vXlg4YHwui/iwNwBs2QzDRn43O
	1dEl7zz3u6KGKCu2ONMLsHK1ZKsWRSis7E1zYYb5mIwllfg0lO1PrPtBEhA4OYjINitk
	rD4Q==
X-Gm-Message-State: AJaThX4yyILtClI5zUHW4pIkXcz8d9VDPlEtDbmZ+sf1PkuLDTMFDImX
	g+wgIXpBZ2UoM85fAhKs+Fy2
X-Google-Smtp-Source: AGs4zMadEhUzXHWLPj7xDG2p/JTOwKeoaLDBnDIF+l71/yGRWHw2JlYastLtC00c/j6lPDlR7IFXQg==
X-Received: by 10.36.89.69 with SMTP id p66mr15814275itb.109.1510689716565;
	Tue, 14 Nov 2017 12:01:56 -0800 (PST)
Received: from localhost.localdomain ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id x2sm3054754ite.24.2017.11.14.12.01.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 12:01:56 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 14:01:05 -0600
Message-Id: <20171114200106.18227-3-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114200106.18227-1-george.mccollister@gmail.com>
References: <20171114200106.18227-1-george.mccollister@gmail.com>
Subject: [morty][PATCH 3/4] zlib: Fix CVE-2016-9842
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
X-List-Received-Date: Tue, 14 Nov 2017 20:01:56 -0000

Add backported patch to fix CVE-2016-9842 which was fixed in zlib 1.2.9

https://nvd.nist.gov/vuln/detail/CVE-2016-9842

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../zlib/zlib-1.2.8/CVE-2016-9842.patch            | 35 ++++++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.8.bb               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9842.patch

diff --git a/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9842.patch b/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9842.patch
new file mode 100644
index 0000000000..41b8d2a30a
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.8/CVE-2016-9842.patch
@@ -0,0 +1,35 @@
+commit e54e1299404101a5a9d0cf5e45512b543967f958
+Author: Mark Adler <madler@alumni.caltech.edu>
+Date:   Sat Sep 5 17:45:55 2015 -0700
+
+    Avoid shifts of negative values inflateMark().
+    
+    The C standard says that bit shifts of negative integers is
+    undefined.  This casts to unsigned values to assure a known
+    result.
+
+Upstream-Status: Backport
+http://http.debian.net/debian/pool/main/z/zlib/zlib_1.2.8.dfsg-5.debian.tar.xz
+https://github.com/madler/zlib/commit/e54e1299404101a5a9d0cf5e45512b543967f958
+
+CVE: CVE-2016-9842
+
+Signed-off-by: George McCollister <george.mccollister@gmail.com>
+
+diff --git a/inflate.c b/inflate.c
+index 2889e3a..a718416 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -1506,9 +1506,10 @@ z_streamp strm;
+ {
+     struct inflate_state FAR *state;
+ 
+-    if (strm == Z_NULL || strm->state == Z_NULL) return -1L << 16;
++    if (strm == Z_NULL || strm->state == Z_NULL)
++        return (long)(((unsigned long)0 - 1) << 16);
+     state = (struct inflate_state FAR *)strm->state;
+-    return ((long)(state->back) << 16) +
++    return (long)(((unsigned long)((long)state->back)) << 16) +
+         (state->mode == COPY ? state->length :
+             (state->mode == MATCH ? state->was - state->length : 0));
+ }
diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index 88f60611d9..eb38589b6a 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://ldflags-tests.patch \
            file://CVE-2016-9840.patch \
            file://CVE-2016-9841.patch \
+           file://CVE-2016-9842.patch \
            file://run-ptest \
            "
 
-- 
2.15.0


