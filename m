Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOwJ-00044V-6v
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:55:03 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3570867pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NXNc1wm4CHQf0ga6bhMkM6g/RE4xjllicU7EoXxteHs=;
	b=XeJcQ8uf9VHDp2EmDepoIe0EMyLBtfeGYT3SmHpmCN8dK1arL+mP79XgOTa/nKVpYT
	P6kRbJDzxO1zTkrUQG4BRK6oC9xdzshDYgoBZcMAJ8OQ7mPBcVZXzowfGn+XMnYoL9qq
	v3gIuIy1OYmLV82+wNghVTgPKDnbXOovy57Tiuf5oy20kcLXgRSr4YPd8oi7JRIWi1XE
	PTdxyh2NO5md60GfpJ27Q1E3CJK2lRqeMg2U8hzmjcZH+4VBuZSfP1WmN8jlKg/BPVNP
	vj+96fRk7js+ItSwwHH6pcN+eFAjX73w6D7Gza2rv2mvwP5I9gN+bkNE1VyhJ4TfOoC0
	3khw==
Received: by 10.68.213.7 with SMTP id no7mr8298823pbc.3.1339260274022;
	Sat, 09 Jun 2012 09:44:34 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:12 -0700
Message-Id: <251c5a038f0a2d1dd4c90f75bfbd69e10a90c298.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 14/16] npth: Add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Jun 2012 16:55:03 -0000

npth is modern version of pth
gnugp 2.1 will drop pth in favor of npth

npth works with uclibc too whereas pth does not

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/npth/npth_0.90.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/npth/npth_0.90.bb

diff --git a/meta/recipes-support/npth/npth_0.90.bb b/meta/recipes-support/npth/npth_0.90.bb
new file mode 100644
index 0000000..7d39ca8
--- /dev/null
+++ b/meta/recipes-support/npth/npth_0.90.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "New GNU Portable Threads"
+HOMEPAGE = "http://www.gnupg.org/software/pth/"
+SECTION = "libs"
+LICENSE = "LGPLv3+ & GPLv2+"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=751419260aa954499f7abaabaa882bbe\
+    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6\
+    "
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/npth/npth-${PV}.tar.bz2 \
+          "
+SRC_URI[md5sum] = "701665669b371385a92817ff1f9215ca"
+SRC_URI[sha256sum] = "e24e99c9e90e7c2c2272fed3a939647fdcd3a7ee0c9efb2983eed553ab2b4568"
+
+inherit autotools binconfig
+
+FILES_${PN} = "${libdir}/libnpth.so.*"
+FILES_${PN}-dev += "${bindir}/npth-config"
-- 
1.7.5.4



