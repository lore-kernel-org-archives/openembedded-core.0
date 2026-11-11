Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5620.1794387844323256124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CpFIO55S;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20267265e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387842; x=1794992642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KiKSqOXprLhPi+pSOgpcE3FL1MS8ogHSKKvfw30OJls=;
        b=CpFIO55SvbB2kw5pvFRR1OuewWZi19iBjuOFtCMP/WcGzQSy5SctHCvOcnKAKse1+C
         KSI0FN5ePEK7jODYpoy2Dgzu4PG+hAuzutDbEFM30qummm1l/c4iEHzuuzRYa1KVC3tw
         tu4Ws5Jbq+WSfp8ReNE4YaqV9Umw2Um444HVSehB9PvsrRs2CzJx0CnKbkqNmwtuM/Ax
         PebOLwLyFZ7od0YJrAfGj8/lQwWf7ltmVEJDRdeYtudddfRzT78ShOF1ufGZkrHcZVb8
         +9QzJXJLdGCGhNoLhF6+eBH0lG8Juw2tWUPg5MHWjW6X1jNYH4SRRlGy2YQq/VewD+Ao
         cPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387842; x=1794992642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KiKSqOXprLhPi+pSOgpcE3FL1MS8ogHSKKvfw30OJls=;
        b=LyGp3TDTyRPOasLGDRpELcsjnYqG+DVo/ZHrHeLDwWB6rGP5uMgD5VPAzRg2rN25A0
         pAV2KAyRzWcaznslrxgZxUS40w0H2EBkzykecdjHsyBolI+JvaEWiE+yFx1+g3AihUu9
         SaX7VRj793nvzuB1DCPrteB8PrpiH1D0JXSiIncnC6isAENPj953Zx6cch3fXykDYHNa
         App061XmqU5SumlgcwH6LFmO/1MaWZS9FVaTZzBudUijn5tZwr187TlnmVaTZaA/cKFy
         fnq5mk/NUYdrZjiJdUqCxaWliI+s+QsgR2BfeHYbogvm7WwamePZ2BEaJ1wUCWyzgmDW
         PGqA==
X-Gm-Message-State: APuU4Z9DwId+VMWXfb0nIOZ9/RvCP/KA97bjJx+sTlqAiayAjny75bKs
	pSH5Eq/i1JT4DNihk1fihpS3zRxUVEsH1PmkUhrq2Gj0bB+wmnLqh3viRxExVfRrG3E1419Yn42
	4Xei+rww=
X-Gm-Gg: AYBFou1lRfOnD4znU2pNITbboI8ERXjiuZ8I+gErGcf6SGHHEVuhmP+7Nxw3Fayu5qL
	L4ukptq6PIloa4drC7WrP6OyqK+w+21CdlDa7PwpQOaHJNEWBqabJiZzwu9JxcS4PIjOFvmuBp+
	IgfkTNmkBN2I88EsHHtdk4kqdykpxcO0r57lufpj4BAJV2H138PDjkJDxd9lRsSOUqMTtfXKyRd
	qHZY2kBa8db/nO8DVtP2l5TCqXzcA9rQ8W4gPQ3jemCIL7G2t6eM/3SEy7RNEJctZ+Nj+5HBiWL
	rs/Wz3ap5layidb4O+Wiji1O2SY0m/Okizy22rMuBn/xNA2Sl/baN63fOJTelnA06xvXhAWub8L
	jUd4JCufr+ENtEBOGuaVwWk6BKVZqlQkqTqVQrqiOHpgnnmdrcDB53QuK10U9ZEIlDZo3W2N2Qc
	RDPkLY53j0mDLmias0PmK1o9sOTGJLTFCoMui7FdRefCaOQXugQ22J00rkINJ3oDjBf0kpm+ACJ
	oL5hPivVXaWUieE+59ss8C9lapPCZGR5GLfSr33j0Nu3MFdET2jnx6yQTD9BZZuxMkCkXT8Cwbs
	k0IaMHgX9fNFMb4dRQ7nYozlz3rWbi6xp/JU/qO1YWKIH9SWiTsA/CusMlE3WCRo2Ogb8vpF3l7
	MJQ+FQ7l0/KhlQNsQABO7mlPSrJ62
X-Received: by 2002:a05:600c:310e:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4ba09383147mr26993005e9.16.1794387840840;
        Wed, 11 Nov 2026 01:04:00 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.04.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:04:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 33/35] groff: build less in groff-native
Date: Wed, 11 Nov 2026 10:02:59 +0100
Message-ID: <aae9fb271ef20e24b21c9651906c078fb25d1cf4.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250007
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

When building groff-native we only really need enough of groff to build
manpages, and don't need documentation or extra tools.

Patch the Makefile to stop building the doc and contrib directories,
which both take time and have incomplete build dependencies that cause
intermittent failures[1][2].

This makes groff-native faster to build:

  groff-native    do_compile   -30.6s   -33.7%     90.9s -> 60.3s

And some tools are removed, which I don't believe are needed by anything
we build:

  /usr/bin/chem was removed
  /usr/bin/eqn2graph was removed
  /usr/bin/gdiffmk was removed
  /usr/bin/gperl was removed
  /usr/bin/gpinyin was removed
  /usr/bin/mmroff was removed
  /usr/bin/pic2graph was removed
  /usr/share/groff/1.24.1/tmac/chem.pic was removed
  /usr/share/groff/1.24.1/tmac/hdmisc.tmac was removed
  /usr/share/groff/1.24.1/tmac/hdtbl.tmac was removed
  /usr/share/groff/1.24.1/tmac/mm was removed
  /usr/share/groff/1.24.1/tmac/mm/0.MT was removed
  /usr/share/groff/1.24.1/tmac/mm/4.MT was removed
  /usr/share/groff/1.24.1/tmac/mm/5.MT was removed
  /usr/share/groff/1.24.1/tmac/mm/ms.cov was removed
  /usr/share/groff/1.24.1/tmac/mm/se_ms.cov was removed
  /usr/share/groff/1.24.1/tmac/mmse.tmac was removed
  /usr/share/groff/1.24.1/tmac/mm.tmac was removed
  /usr/share/groff/1.24.1/tmac/mom.tmac was removed
  /usr/share/groff/1.24.1/tmac/mse.tmac was removed
  /usr/share/groff/1.24.1/tmac/m.tmac was removed
  /usr/share/groff/1.24.1/tmac/om.tmac was removed
  /usr/share/groff/1.24.1/tmac/refer-mm.tmac was removed
  /usr/share/groff/1.24.1/tmac/rfc1345.tmac was removed
  /usr/share/groff/1.24.1/tmac/sboxes.tmac was removed

[1] oe-core d1a02bdd242 ("groff: Fix occasional build race failure")
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=16279

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9deeb7474b2586eb031e4f00a644aed9ccf8cb19)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: For [YOCTO #16279] ]
---
 .../groff/files/build-less.patch              | 24 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.24.1.bb   |  8 +++++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/groff/files/build-less.patch

diff --git a/meta/recipes-extended/groff/files/build-less.patch b/meta/recipes-extended/groff/files/build-less.patch
new file mode 100644
index 00000000000..dc560fbb309
--- /dev/null
+++ b/meta/recipes-extended/groff/files/build-less.patch
@@ -0,0 +1,24 @@
+Build less bits of groff to save time and reduce random build
+failures from missing dependencies in this logic.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+--- a/Makefile.am~	2026-05-15 13:23:08.000000000 +0100
++++ b/Makefile.am	2026-05-15 13:29:17.053867035 +0100
+@@ -556,15 +556,0 @@
+-include $(top_srcdir)/contrib/chem/chem.am
+-include $(top_srcdir)/contrib/eqn2graph/eqn2graph.am
+-include $(top_srcdir)/contrib/gdiffmk/gdiffmk.am
+-include $(top_srcdir)/contrib/glilypond/glilypond.am
+-include $(top_srcdir)/contrib/gperl/gperl.am
+-include $(top_srcdir)/contrib/gpinyin/gpinyin.am
+-include $(top_srcdir)/contrib/grap2graph/grap2graph.am
+-include $(top_srcdir)/contrib/hdtbl/hdtbl.am
+-include $(top_srcdir)/contrib/install-font/install-font.am
+-include $(top_srcdir)/contrib/mm/mm.am
+-include $(top_srcdir)/contrib/mom/mom.am
+-include $(top_srcdir)/contrib/pic2graph/pic2graph.am
+-include $(top_srcdir)/contrib/rfc1345/rfc1345.am
+-include $(top_srcdir)/contrib/sboxes/sboxes.am
+-include $(top_srcdir)/doc/doc.am
diff --git a/meta/recipes-extended/groff/groff_1.24.1.bb b/meta/recipes-extended/groff/groff_1.24.1.bb
index 24b8146a727..dd5ebee3df2 100644
--- a/meta/recipes-extended/groff/groff_1.24.1.bb
+++ b/meta/recipes-extended/groff/groff_1.24.1.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://builddep.patch \
            "
 
+SRC_URI:append:class-native = "file://build-less.patch"
+
 SRC_URI[sha256sum] = "74e2819795b6aff431aeac983d63a9c8968eeaba2a2eba7df8ba4c7b41e7cfd8"
 
 DEPENDS = "bison-native groff-native"
@@ -65,8 +67,10 @@ do_install:append() {
 	rm -rf ${D}${bindir}/grap2graph
 	rm -rf ${D}${mandir}/man1/grap2graph*
 
-        # strip hosttool path out of generated files
-        sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${docdir}/${BP}/examples/hdtbl/*.roff
+	# strip hosttool path out of generated files
+	if [ -d ${D}${docdir}/${BP}/examples/hdtbl/ ]; then
+		sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${docdir}/${BP}/examples/hdtbl/*.roff
+	fi
 }
 
 do_install:append:class-native() {
