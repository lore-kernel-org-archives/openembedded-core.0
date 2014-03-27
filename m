Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7276E27B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:11:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2R8BT3W006713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 01:11:29 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 01:11:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Mar 2014 04:11:22 -0400
Message-ID: <9bd12f5fca3736b2975ce0249b3428b5b0af194e.1395906475.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1395906475.git.liezhi.yang@windriver.com>
References: <cover.1395906475.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] gummiboot: add COMPATIBLE_HOST
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
X-List-Received-Date: Thu, 27 Mar 2014 08:11:28 -0000
Content-Type: text/plain

The gummiboot depends on gnu-efi which had set:

COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"

We also need set this for gummiboot, otherwise there would be build
failures for other non-x86 archs.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/gummiboot/gummiboot_git.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
index 5868a23..61de58c 100644
--- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
+++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
@@ -13,6 +13,8 @@ PV = "43+git${SRCPV}"
 SRCREV = "4062c51075ba054d4949c714fe06123f9ad3097d"
 SRC_URI = "git://anongit.freedesktop.org/gummiboot"
 
+COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--disable-manpages --with-efi-includedir=${STAGING_INCDIR} \
-- 
1.7.10.4


