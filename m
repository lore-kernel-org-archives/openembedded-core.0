Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymE-0006Ix-S4
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:35 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:49:53 -0700
Received: by wibhr14 with SMTP id hr14so4182462wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=rMvl4gpyTpDdoFzoSSolbLwfT3/bBsOeNOXhKuq9NDE=;
	b=VCBWN2o00jS1xMHA89o2MxZTAqgAPwgPskGUFu8enkKMbVlFW6pD7Q/ylsWTv16xph
	8RpvctuS7C00h4pySAEsbyWxdM/vGlECytHcDR1SUj7CbqLlJ6FHyc8Py7NktnQ++gLx
	hyii3pgsa4IEMMpHHvfN4uOUG1THiaF8q082sLRxpokV2aI6g/NTSaVncWi6ZetHAGhK
	zWxh5zkh6Aitdazfo0E9XgyqKy5Z8YDfcNSGfDyvokjU5s0gybba2QoaB+DlVRT1USah
	rCCUx1Kjw9462Y5PMhmJe01Qf2SojtEr/bc8zzqx+jBO0i3woCFClOgzNgBoDDFNzdBx
	eiyg==
Received: by 10.180.82.164 with SMTP id j4mr6137217wiy.18.1343926191366;
	Thu, 02 Aug 2012 09:49:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.49.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:49:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:48:55 +0100
Message-Id: <afed6c564daac5a92525c369416fbc163d6952be.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkfmndJuOy1v6zlKk490h1N3JbRZNcTBHH5zC5zLcDu80EXkBWITWSsibNF15gCPdxI6yDn
Subject: [PATCH V3 01/11] mesa: no need to depend on python-native, the class does that
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:35 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 120a256..403a961 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,14 +12,14 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
-INC_PR = "r15"
+INC_PR = "r16"
 PE = "2"
 
 
 PROTO_DEPS = "xf86driproto glproto"
 LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
 
-DEPENDS = "makedepend-native python-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
+DEPENDS = "makedepend-native flex-native bison-native ${PROTO_DEPS} ${LIB_DEPS}"
 
 PROVIDES = "virtual/libgl"
 
-- 
1.7.10



