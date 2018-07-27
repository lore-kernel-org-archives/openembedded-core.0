Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7A778D30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:32:56 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c13-v6so5459549wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HQEi36EIQuLlIhRO25KRyY0L6ha9fDFAvvN9Xi2YS/o=;
	b=FURyzmVF44Fb88ZuWu8qjV0zXihaPvI+7T9v2E1lrr1slE7WpiGU1aAR58lOAIZZNx
	Dp0dgwODgv+0s4k8x2LaD5pnwKCYT54a3cEFDDnu2hS66HynVQl6teCWgJIDcV4S59Rd
	oatyt8RDgXmKuB24tdoh6+aE9vdMaxjY/qVRVSUSpeWql1VqjDyECfKOK4QjitpQZQg2
	HX7c9NqmgsGRzVZ3qD3HpMULYS299sJ2rUO3zdI1MOZZSksn51opyxcfcQPosumZtsxx
	6PMWlGywq4hGc6VC93NFinRKd4WHn48EyHwvmAeaiugtjM+XirOTrKfpdN9FwcKPmMcP
	nNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HQEi36EIQuLlIhRO25KRyY0L6ha9fDFAvvN9Xi2YS/o=;
	b=DTjexj/YlXJM+6Xh3NYZFsYcw7FoFAo34rQ8TFiiyBR50GUy4z3Oo/0TuSr/fTRZTW
	aXZHerEnjV6ykw+HQWlZenMbQ5hj0xZ92XI7VZQRtdGOMcdCezMH3/Id4+P7eg/fMBE4
	Ul4GjwsVR0kc84dzbAN8W1D1UB1eIIrIeyICzCaw1LnezQ3X1nx+wmDAHTvkaJY6ALol
	aCuBt0Lr2DWPO7WxE9D253R1yF8eM9Qry5ncVcF8MCSMXHJRUhp+Je46Au7/e95zm193
	Jct7sFgX9t9/wvYV3s/z038faYiCCY3Q4lft40cN5JX0wxB7iIW6dnsw+JzaHpWOE1Ag
	THLw==
X-Gm-Message-State: AOUpUlEdsaaaY5+Mht85gAihWXSwch2PpUD6y/o5Y/wCt1+YWUCVGXg6
	4+dr41beoJuPeJTsxfb2g0RPCQwKdUc=
X-Google-Smtp-Source: AAOMgpfExHF3UKHWCKmyN0iu7uViiJussdhZXLYAb1eg8HRDUZAe3rsqB5Lwo6lfWmZsynP1iVjC+A==
X-Received: by 2002:adf:ab14:: with SMTP id
	q20-v6mr5050146wrc.239.1532705576838; 
	Fri, 27 Jul 2018 08:32:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.32.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:32:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:37 +0100
Message-Id: <20180727153248.22838-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 05/16] ovmf: remove ossp-util from DEPENDS
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
X-List-Received-Date: Fri, 27 Jul 2018 15:32:56 -0000

This was added back in the meta-luv days[1] presumably under the impression that
it needs ossp-uuid but in reality we rename ossp-uuid's library and uuid.h comes
from util-linux.

[1] https://github.com/intel/luv-yocto/commit/e08817342b9ea7381944e6c10c555d1c5c62aa6e

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index e57fa097274..d2ecb619d99 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -43,7 +43,7 @@ PARALLEL_MAKE = ""
 
 S = "${WORKDIR}/git"
 
-DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native qemu-native"
+DEPENDS_class-native="util-linux-native iasl-native qemu-native"
 
 DEPENDS_class-target="ovmf-native"
 
-- 
2.11.0


