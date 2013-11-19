Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 915686D87D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 02:15:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAJ2FPCG026784
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Nov 2013 18:15:26 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 18 Nov 2013 18:15:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Nov 2013 10:15:16 +0800
Message-ID: <4e295b4e41dca18db1acab845627396eddb39633.1384827264.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384827264.git.hongxu.jia@windriver.com>
References: <cover.1384827264.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] libpthread-stubs: add ALLOW_EMPTY_${PN} = "1"
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
X-List-Received-Date: Tue, 19 Nov 2013 02:15:26 -0000
Content-Type: text/plain

There was an image build failure while installing libpthread-stubs to rootfs.
...
Failed to buld rootfs image for fsl-b4xxx-standard-glibc-std after adding
multilib package lib64-libpthread-stubs.
...

The libpthread-stubs was empty and the package didn't exist by default. Add
ALLOW_EMPTY_${PN} = "1" to create the empty libpthread-stubs fixed this issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
index ad046d1..f4264b4 100644
--- a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
+++ b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
@@ -22,3 +22,4 @@ RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
+ALLOW_EMPTY_${PN} = "1"
-- 
1.8.1.2


