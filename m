Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjCxU-00081F-BR
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 18:52:32 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 13 Dec 2012 09:37:55 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so2063070wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 09:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ksIPDTHHWcitzhFzRNQzHHWBZog+sAcH1QFAOAdV0nU=;
	b=bYbo85x8TuU0nqGVIMmHJIjJvHdDCjw0qZx/mugp7HrmfTLpnKIufNhU16lm7c1Pt+
	SZ9kSeXVFDsWjEScfBJ3wkuqPXUJ6eJBgrOI+SZOmPtCcDFKfpUkmguI8flSLJENV/hm
	TVjVl50VjDw1Xrs9trz4xwYK6w8GMFtg9YX9k+Gs15H9RkkT2Nig9WJ+EMol/xNwa+2n
	3qd5GwhXc7hQIfEH5308h5u9nes831LlYmev6IgLh9tbO+HkAGkPCFMi1tidpl0RpPzr
	zl2blUo8t2AxBOYi/feiyUh4TtDQSwOHNrLGLHFf05nwKVDFOaQRcWxFAvfx8MJfAojo
	Eypw==
Received: by 10.180.75.208 with SMTP id e16mr30528047wiw.3.1355420270414;
	Thu, 13 Dec 2012 09:37:50 -0800 (PST)
Received: by 10.180.75.208 with SMTP id e16mr30528041wiw.3.1355420270245;
	Thu, 13 Dec 2012 09:37:50 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id d9sm8991002wiw.0.2012.12.13.09.37.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 09:37:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2012 17:36:08 +0000
Message-Id: <1355420169-10533-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQn4M2bdQP8awAGfcCtUA9BzTtO1SeMOWv39q0+h0L3OuQEJqc3U8r94NV6A5g+LML8Y8Gha1CeW5J4xaKNNGkpZlnmhG15LMHKbdl2WhE0q9SqRgbIbhRWXAV2IxybPJQAfXocqnVPpeKYFNop2bvWZyfudjGpSuGAIL5unFAsfz7jI05eJjFKwl/CLOeLmlb4yIIrp
Subject: [PATCH 1/2] mesa-dri-git: remove patch that doesn't apply to 9.x
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 17:52:32 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-git.inc |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
index d558d0b..25093af 100644
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ b/meta/recipes-graphics/mesa/mesa-git.inc
@@ -9,6 +9,4 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://0002-cross-compile.patch \
            "
 
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://0004-gross-hack-to-prevent-from-install-libgl.patch', d)}"
-
 S = "${WORKDIR}/git"
-- 
1.7.10



