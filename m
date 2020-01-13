Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA7EB6C10B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 21:10:11 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id x129so9945904qke.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HLIKubdoF+HI1yBsML/bDhF8hhGh79MW+BYNsJneAKk=;
	b=ikJV5cAGyxBqH8r5cQpo7RJT1CK7/mpm+mDqVFRrlmutM9uLCP0E5bxcMbXvduhtoa
	ccS8SlVPD0cQA2UL72OCMet77/B8ka9ux00zQzWYqjNHdt8Qv6tNbxu84fEUjJEQqvXe
	VJwiFBRQI3SJzLn+d/QTzCtM1hkiU9qFEy9Uiet0vC/jCASzro2cwWsdEdPspj8Xu1b4
	POvvPbX2Fbb6rwamRqjsxH2t217vZV5RSGthi14EsIkDuZr+NA13ATLKR7+RfVOV8DC/
	W4HxFw9vYY/lBCiF7jAItdvdxsnupikVxh8DOPmVXkVQ0/MrctQ206klt+lall1af5WN
	Ck6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HLIKubdoF+HI1yBsML/bDhF8hhGh79MW+BYNsJneAKk=;
	b=CV7AVYbpMQ7OrTYJIdERkC3ZGIK5MPQ/u7Fz2iyQypqNVHmhavs36x3FRQp/DIHptQ
	wxBieUiZbJEZJeaGjzlMzb509SPNLZYb+f1QpS5sk7/Ul4W2l4F/L/CMWT1I7pPDBrVC
	3d8IBtSDJu1oQsR0hCMIqFEksGdB7CpbI9o/NKHnj9fPEqs9AeuwYMBd4ovFRkkq8cp/
	5Jr9fjUPGwdtZ3hh17vc+jOP5qfAGLGVqfWIQZ7M3ueDNM4EkFUURaqOjBR7b4FTC0MQ
	Nf72VPoH5bfRLKf6AlYt65kaJk5BB3nMqG/MosRgEPUn6cHJ+F91G37rtROvPNrxio/D
	btKA==
X-Gm-Message-State: APjAAAVTKYgQz/ywI6fdVBuzQLz+YiJxEnK2RtwrToC3hNZ4s2/bQX40
	kUofEcMLMts08f4jIljkun3KtdQDJYQ=
X-Google-Smtp-Source: APXvYqxWKmUMKCt6Y8I2iWnWjqUDaUrQ04PydbL/hiy2HeVBPqwVWeFGNg0/eOQ8dhXB3cRKL6oWtw==
X-Received: by 2002:a37:ad17:: with SMTP id f23mr18015404qkm.24.1578949812253; 
	Mon, 13 Jan 2020 13:10:12 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	f26sm6277633qtv.77.2020.01.13.13.10.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 13:10:11 -0800 (PST)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 16:10:05 -0500
Message-Id: <20200113211005.14693-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meta: gdk-pixbuf: add man packageconfig
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
X-List-Received-Date: Mon, 13 Jan 2020 21:10:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current default for the meson configuration is to build
the man. It will only do it if it finds the xsltproc binary
and man option (default: on).

Adding the packageconfig make sure that xsltproc will be
found in the correct path (recipe-sysroot-native) and that
the docbook can be used.

The docbook is needed because xsltproc is used with the
--nonet option, which prevents the uses of the internet to
fetch DFD's.

This recipe has been working for probably everyone with the
current configuration, however if for some reason xsltproc
can be found inside PATH, meson will use it.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
index 699c4ecd0b..f6cc25cd8c 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
@@ -53,6 +53,7 @@ PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
 PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
 PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
 PACKAGECONFIG[jpeg2000] = "-Djasper=true,-Djasper=false,jasper"
+PACKAGECONFIG[man] = "-Dman=true,-Dman=false,libxslt-native docbook-xsl-stylesheets-native,"
 
 PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,virtual/libx11"
 
-- 
2.20.1


