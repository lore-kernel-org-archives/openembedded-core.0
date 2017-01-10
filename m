Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A218C71AEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 16:07:39 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id j18so61599832ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 08:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TU0GvMW+nlaaQ2Yj++OWf3Gq7IVFea0zWQEwQ7xl7j8=;
	b=GgeeDZGraEFCMBSvEEDHFxLcM8L7aXKiBoDeY2xive6GwbdbgCMvg/iPszygW1jz/Y
	snJNdeQs/kHvJVd+fZnSYa/tKROJqEmR95z7wQJpdu2Aj5SFPmOsEvx2bpRKBDdIViSx
	vwFqcugn3xoteLJBlTFxDX12xQf0p8Q63HdcIGfhW4MBu2koC8UtVkIqPxQNjHJCBVCE
	8wYKS887pYGBoAHs0Fup9Q2mVWXzSMSz7uwb+IgK3POAoaV93O6U+Oc7I8ev5ywKvC/B
	J7JIs9/Jw+9OOxTkayE8D/BuUB4YIn9/ep/vXBfP4gx6bvLinQ73VcpmTaKwv3lMCUL2
	nwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TU0GvMW+nlaaQ2Yj++OWf3Gq7IVFea0zWQEwQ7xl7j8=;
	b=ADsq9/cQL4sc8Xs0gu6ifjewgsXZV7bfybSVu1/xSPqKb6yLhuPE1VJ51jrzMsfnBL
	g2j4mkPlApZVxiL8hBMz0TpmWQ9+TPH805TqzeoWXliMqkUPUGEzpk4eyJ6ywTPD8una
	vVBV2FqgSnguivQzU5j8fqIn84zZMrhzazrE+vcEt1i8f4J7BOEhWg08PAq/3hQq9DAk
	P9I8teKn4D+S6q5OBuTga9IRn+v23bVzcfKBe3qwtmWy1QDMzlVHhJvIIRML/e+237X+
	kgV/pV5Fe2PED+UVPafaf+JbiY4+DJZ4/KR2xRx6q+k/woBbKCVsUXij3i6P7926J5IW
	V39Q==
X-Gm-Message-State: AIkVDXKrl9cqNktSsByjWsIsoSUjzmWVOUmIMCpQTVvnFStbErvWNqatWpuamkYFZFHQ7Ytt
X-Received: by 10.107.138.148 with SMTP id c20mr3750157ioj.190.1484064459608; 
	Tue, 10 Jan 2017 08:07:39 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56084.dip0.t-ipconnect.de.
	[87.165.96.132]) by smtp.gmail.com with ESMTPSA id
	m196sm1391971iom.14.2017.01.10.08.07.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 08:07:38 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 17:07:19 +0100
Message-Id: <bb6b7c56fe1991c0da48d56b5a3c7f96f6fde053.1484063948.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484063948.git.patrick.ohly@intel.com>
References: <cover.1484063948.git.patrick.ohly@intel.com>
Subject: [PATCH v2 03/11] ovmf: explicitly depend on nasm-native
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
X-List-Received-Date: Tue, 10 Jan 2017 16:07:39 -0000

Fixes a build issue when nasm was not build already because of
something else.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index e722db5..13b583b 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -20,6 +20,8 @@ DEPENDS_class-native="util-linux-native iasl-native ossp-uuid-native"
 
 DEPENDS_class-target="ovmf-native"
 
+DEPENDS_append = " nasm-native"
+
 EDK_TOOLS_DIR="edk2_basetools"
 
 # OVMF has trouble building with the default optimization of -O2.
-- 
2.1.4


