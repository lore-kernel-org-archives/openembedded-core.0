Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE06360596
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:19:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C2JVQM026947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:19:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 19:19:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Oct 2018 10:24:52 +0800
Message-ID: <25e88349acb3ca73e490ce70a0da375137a6bc0d.1539310768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1539310768.git.Qi.Chen@windriver.com>
References: <cover.1539310768.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] nativesdk-packagegroup-sdk-host: add nativesdk-flex
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
X-List-Received-Date: Fri, 12 Oct 2018 02:19:29 -0000
Content-Type: text/plain

nativesdk-flex is needed for kernel development inside traidtional
SDK environment, more particularly, `make scripts' under /usr/src/kernel.
So add it to nativesdk-packagegroup-sdk-host.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 3d08945..4bf0ac0 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -25,6 +25,7 @@ RDEPENDS_${PN} = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
     nativesdk-sdk-provides-dummy \
     nativesdk-bison \
+    nativesdk-flex \
     "
 
 RDEPENDS_${PN}_darwin = "\
-- 
1.9.1


