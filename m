Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 94FE97E8FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 14:06:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45QMpK6PCTz1n
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 16:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560521162;
	bh=NU6ERAJUTAVM8/kGRLUDahJ3Sa4EfWbMtS2SoU7ezxA=;
	h=From:To:Subject:Date:From;
	b=gbA2o36eQzW4b8llK7vrw0OB2GbFd0YusmC/dllxuI/5muWb+9/YPCNUopcV5gnRM
	jDj309pvpXBYUUUmvhzN0wdK8wWlLdU9ZZOxe0eUdtzyOtjmiBRlo4ZzHLTYw+YVug
	SSETjgUR2ZOr7FNmr4bAv77auvhiXNm9Qxf7vq1qOc5cm72Lt+iNwJR1v9Fa4cM/Zp
	y3x4cxuBCMrUkbC00h6mtb3QU7vIeM7YaMwAbrKoRYBg5TGxQxREDnwZf8Zq1qHp4r
	QvzwX1+MxVuf5g8EMVfe57g24aIHi2pLBRHKPjXZ4wFermL/AxlXUxMRKKVQKg2Z7+
	XEtCqtoF1rZ2vbcDmdtfjQ08GwYubqG1vSobLDPVCc0l/9yB062oFiM1GmLLA+ljTP
	IzjmwVX/yIZel+m8laxINJJ/1nFzum+2btNBWg8r81brF8gwhsUd9fmoECi3B4qYQs
	qHLyXe3Oo7izaoPMWT5JSeehKy033rhDBdcgR5rSARaarZdPs1UrzoYuw2fPvryEUx
	03bAXD9xyPHPK8JGWbMJTjP788QkA6atfMbCsd8P/knHRt9xANKnp0OgzvOG7Ap5Ov
	zrP5IZT0j4TznO5katL4w3FDA3VwgalJlZjvvCNjEhDK1DCnqTvGdjJkBuWdIX5JOz
	3Pe45A7edIWo31UOM5xJGYi0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2019 17:06:01 +0300
Message-Id: <20190614140601.29041-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] lttng-modules: Upgrade 2.10.9 -> 2.10.10
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
X-List-Received-Date: Fri, 14 Jun 2019 14:06:01 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{lttng-modules_2.10.9.bb => lttng-modules_2.10.10.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.9.bb => lttng-modules_2.10.10.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb
index 70a6843263..c1cc339167 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.10.bb
@@ -17,8 +17,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 
-SRC_URI[md5sum] = "09df0ac2e8f245740a2f32411d10c0d1"
-SRC_URI[sha256sum] = "a1855bbd02d0f71ebd180e9872309862036624f012442ab9cc5852eb60340145"
+SRC_URI[md5sum] = "07c0b1ea4c1dd9d3edba8dc980fd93dd"
+SRC_URI[sha256sum] = "e0d031005eef337c62de530a3b5b3e8fb1c732846eefcb23b8978edd2091f6e4"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.17.1


