Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2791757C7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 09:06:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5296KG4004726
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jun 2015 02:06:20 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 02:06:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jun 2015 02:06:19 -0700
Message-ID: <47b67620bc14f8d8be1d8d3396ce45c8b6c68da9.1433235955.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433235955.git.liezhi.yang@windriver.com>
References: <cover.1433235955.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] packagegroup-core-full-cmdline: remove lighttpd
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
X-List-Received-Date: Tue, 02 Jun 2015 09:06:19 -0000
Content-Type: text/plain

The packagegroup-core-full-cmdline-sys-services should not pull in
lighttpd, move it to packagegroup-core-lsb since lsb needs it.

[YOCTO #7086]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../packagegroup-core-full-cmdline.bb              |    1 -
 .../packagegroups/packagegroup-core-lsb.bb         |    1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index ad3f240..1d7e608 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -150,7 +150,6 @@ RDEPENDS_packagegroup-core-full-cmdline-sys-services = "\
     less \
     libcap \
     libevent \
-    lighttpd \
     logrotate \
     nfs-utils \
     pciutils \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 3d5075e..31b71e2 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -57,6 +57,7 @@ RDEPENDS_packagegroup-core-sys-extended = "\
     dhcp-client \
     gamin \
     hdparm \
+    lighttpd \
     libaio \
     lrzsz \
     lzo \
-- 
1.7.9.5


