Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0944E61459
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:47:08 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x185so7743232pfc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wXcWQks2vQOPaw8bOOMNEokwwWL4MdZGcAEEg0VcSUY=;
	b=bIU4W7ensiCqqs9cwRgw+aAHDiwn/k5teTkhrkURY9ObNCqL9fe03y72xHVXmHaF/s
	J6f9KA+vjnUeydLOq2BCv5gUm60YJRpEFH/eIwe8EqklbFbo+FB5fdZuvBXVKh4X0Lqx
	KoqKS8755McT5TO7EnVycgRpcuhgFcYk3XlprJr/I84tpI0xWPdNXLomJlL46ucuELch
	YMp8hdqLIL5hbWlOAM9Wmu3/g/xchLCX+4fJVz7hXpkSwq4ez8K5xXrp+A6SPg88+zDQ
	1jeQJ0QWPZi8Ix6ty6zLzZUpgXEQZGIQkB86uAqih4CbMT5HhWvRYkCrECgoIYRtqLIX
	HLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wXcWQks2vQOPaw8bOOMNEokwwWL4MdZGcAEEg0VcSUY=;
	b=Vcx9+CAqf8XdCZ9XEI5+H0gCgciiy58U5uZP1DstuePytAnNkgYRoePgAogECQ0qsl
	1MU9QZslLGpPaFUzGPsHTqgNnIEdJlj5A3hHLNQROQTtAX32pI0DfwNI9swZCoFxoQWB
	zd3nDw3Ch6A6KhXRKQSEJL7x6bmR8MU6i4XnnGdU2lV0zgsJZrfkSQic1LEaqXtFZlPd
	4+FCPgb884W0s7ZdDPqeFzySt4o1vKgEg7TYz2lTVL1ZErPu4L/yfNPBkMrK9sy6ukq8
	svVV69l/1xWPyvPqUDFbo4GyRL9/zL8UETRwFv8SXWfnQEMaTTaIRSGMrfvHRyLTRVC+
	21RQ==
X-Gm-Message-State: APjAAAXQrm5R33WiCb66oGLv679VSF+newBDKYBpKfRSyHonZzQpaT33
	Bodix9QRmWmTeeNrGRQ8gXVBgulN3nc=
X-Google-Smtp-Source: APXvYqz60Ni/GAxL0NQWwtGMturmx7iLVBFlVRj9jc/Xe9fszatX44Ru9X8eFcI0C3nJkxoljJ+fqw==
X-Received: by 2002:a63:f501:: with SMTP id w1mr15345209pgh.61.1581886029489; 
	Sun, 16 Feb 2020 12:47:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	m12sm13877924pfh.37.2020.02.16.12.47.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 12:47:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 12:47:07 -0800
Message-Id: <20200216204708.7179-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216204708.7179-1-raj.khem@gmail.com>
References: <20200216204708.7179-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/7] gtkwave: Inherit mime and mime-xdg
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
X-List-Received-Date: Sun, 16 Feb 2020 20:47:09 -0000
Content-Transfer-Encoding: 8bit

Use += for depends to not override prior ones

Fixes
gtkwave-3.3.103: package contains desktop file with key 'MimeType' but does not inhert mime-xdg: gtkwave path '/work/aarch64-yoe-linux/gtkwave/3.3.103-r0/packages-split/gtkwave/usr/share/applications/gtkwave.desktop' [mime-xdg]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb
index 286d9aa6a1..fec3c7ce1a 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.103.bb
@@ -10,9 +10,9 @@ SRC_URI = "http://gtkwave.sourceforge.net/${BP}.tar.gz"
 SRC_URI[md5sum] = "5a9a5913f9a02a333b2b23626f153fd7"
 SRC_URI[sha256sum] = "c325abf7cf26c53309a67c0ecaaf196774fa982a717a102c599ac8a516eeeaf7"
 
-inherit pkgconfig autotools gettext texinfo
-DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
-RDEPENDS_${PN} = "tk-lib"
+inherit pkgconfig autotools gettext texinfo mime mime-xdg
+DEPENDS += "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
+RDEPENDS_${PN} += "tk-lib"
 
 # depends on gtk+ which has this restriction
 inherit features_check
-- 
2.25.0


