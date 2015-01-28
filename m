Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEEF72608
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0S6qSq9008450
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 22:52:28 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 27 Jan 2015 22:52:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 22:52:17 -0800
Message-ID: <784ca279d1bed8844641f698c7a2d8718ff518f0.1422427700.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422427700.git.liezhi.yang@windriver.com>
References: <cover.1422427700.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] screen: add PACKAGECONFIG for libutempter
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
X-List-Received-Date: Wed, 28 Jan 2015 06:52:28 -0000
Content-Type: text/plain

Fixed:
WARNING: QA Issue: screen rdepends on libutempter, but it isn't a build dependency? [build-deps]

The libutempter is in meta-oe.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/screen/screen_4.0.3.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index c5218ec..962a499 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -34,6 +34,9 @@ SRC_URI[patch.sha256sum] = "10acb274b2fb0bb7137a0d66e52fa0f18125bc5198c7a8d5af38
 
 inherit autotools texinfo
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[utempter] = "ac_cv_header_utempter_h=yes,ac_cv_header_utempter_h=no,libutempter,"
+
 EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 \
                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
-- 
1.7.9.5


