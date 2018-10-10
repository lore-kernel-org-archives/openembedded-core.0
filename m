Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3125779AC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 15:45:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9AFi3IK031365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Oct 2018 08:45:14 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 08:44:24 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Oct 2018 23:02:59 +0800
Message-ID: <5738e481e2638087e03770997fce2c4e6c313061.1539182705.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1539182705.git.kai.kang@windriver.com>
References: <cover.1539182705.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] gobject-introspection: add required python modules to rdepends
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
X-List-Received-Date: Wed, 10 Oct 2018 15:45:34 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run g-ir-scanner from package gobject-introspection that
missing python modules 'xml' and 'pickle'. Add them to rdepends.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gobject-introspection/gobject-introspection_1.58.0.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
index de898a788b..a08ccf2970 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
@@ -194,4 +194,6 @@ FILES_${PN}-dev_append = " ${datadir}/gobject-introspection-1.0/tests/*.c \
 FILES_${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
 FILES_${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
 
+RDEPENDS_${PN}_class-target = "python3-pickle python3-xml"
+
 BBCLASSEXTEND = "native"
-- 
2.18.0


