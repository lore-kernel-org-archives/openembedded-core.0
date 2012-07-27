Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SujIa-0003k8-SH
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:05:41 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 27 Jul 2012 04:54:09 -0700
Received: by wgbdr13 with SMTP id dr13so1834368wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=YSZhGpodoGtHatfKyqniUG6RCWYZGumBKfcCOUOKEPU=;
	b=OH2bAJZOD4KaYkqk20dFbKZJZ7xIZs+aEu4m/HVRUe5oQw1P6FdXeE/477TyR/NyvZ
	IMe4KSfUryYUaSUls0h7I/Lk+AxWprUUSGpHGt8RjnDI4mfZXl2o1grziBTJACG3Gtni
	Qv/x0OiLi4yDem67BnOV1v0Jw2N7dPXsEAOW1/+sbxhwou2cL73imw29+Dn03uhqfOpB
	yS+VkXLx+iDkUp3V69QuvktSH6etNVjCxvnE/FhVIim0V+GLzdAg1ag/U6E44c3/yQFb
	bVbvCDGu/J6tq67wA18wvtzG5/zyQRjCAw++6g5DZfk8IOyaIMIe0OWEM8kMugSHNch/
	ty7g==
Received: by 10.180.79.69 with SMTP id h5mr5614196wix.6.1343390047781;
	Fri, 27 Jul 2012 04:54:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm13523563wiw.9.2012.07.27.04.54.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:54:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 12:53:38 +0100
Message-Id: <cae0f7ba7693529116ae5e21cdddc35bf96aa8fe.1343389943.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343389943.git.ross.burton@intel.com>
References: <cover.1343389943.git.ross.burton@intel.com>
In-Reply-To: <cover.1343389943.git.ross.burton@intel.com>
References: <cover.1343389943.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlzUSlQF11+XYpCWnbz/4n/dFh1xBpjhfN2cRkDVg9aUrt0DXYezqPjrWc40ttCDhLOYJPj
Subject: [PATCH 4/4] libdrm: Bump libdrm_git to 2.4.37
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
X-List-Received-Date: Fri, 27 Jul 2012 12:05:41 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/drm/libdrm_git.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graphics/drm/libdrm_git.bb
index d71b7f7..2b3ef47 100644
--- a/meta/recipes-graphics/drm/libdrm_git.bb
+++ b/meta/recipes-graphics/drm/libdrm_git.bb
@@ -4,6 +4,7 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/drm;protocol=git"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "3f3c5be6f908272199ccf53f108b1124bfe0a00e"
-PV = "2.4.15+git${SRCPV}"
+SRCREV = "1b1a4f0a779f7ab2ba5673b9c9fe2a37047fe765"
+PV = "2.4.37+git${SRCPV}"
 PR = "${INC_PR}.0"
+
-- 
1.7.10



