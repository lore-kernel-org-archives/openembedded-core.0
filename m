Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id A1F1077364
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:11:40 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id d9so204697863ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 05:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TU0GvMW+nlaaQ2Yj++OWf3Gq7IVFea0zWQEwQ7xl7j8=;
	b=enrzU0kGyCjoaXDePw9OPTKu7hgWr8Fx28W1yDNOenynSdQjQ63qQ67p3W+G/tn4QM
	LebKsxBwsfpeGzaRPwJk6SwOYWVUjmJm9sQdx5ZmLMXkJS9q6W1M954/vedgUnUAvu0K
	sBW8Aq0lHMSko8NPdpXF32Dl1bTjjggzRjKNbBPgBTb3QVAcWXVxhcCSMP4+JgVgeHss
	iM7mZl9SKILPSNcmT0YNoYq9Brcy+vYgZUHjrEmgzDkP3KnmMayR42VvviQt7hEM9/fb
	H9iDl1wT9JPf1At4Yr3jFOaXGfmBT9VCc4u3r2xZJ9yq8UYcZcpvskyO89z1zEmbGRuY
	oTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TU0GvMW+nlaaQ2Yj++OWf3Gq7IVFea0zWQEwQ7xl7j8=;
	b=LMpRbYl53HirgocAQbHDZx1bzG406vKG6sY9FVcUdKImqvTRBtMrWp2K1R7zc1w5kp
	ckyVdWU8tVwQKkHs+j/7LSkDtDrP2ChScskW+Nw/m0OEBLVw8FcN5tkA6SA4gYoe3ebk
	K0gTod1YCMMSMHnA82S84DARQzDKHY/fcYmBlVsqV0fiodxCcBeLQZ+iCUh8AYzwm8By
	DFkaPJ2uishL6VFZBoF4GoOEUOcKr6jSKuqr3iHXsoO9R7h0W9R8HY4v01pkby9Tq6pc
	F4I+yTbh3zgvApd41l6QV5aMf4WtijtA09uLznq89WUWgHBK3r9CGXHZcJnWjMpjK33f
	dSVg==
X-Gm-Message-State: AIkVDXJnG8tAEtKlFMvPtuHl5PtTfLeXbB3uVixiuKMEG6zFaScWAHUwexm7XvjanAe56K9q
X-Received: by 10.107.138.10 with SMTP id m10mr5022771iod.188.1482325901807;
	Wed, 21 Dec 2016 05:11:41 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8F3CB.dip0.t-ipconnect.de.
	[93.232.243.203]) by smtp.gmail.com with ESMTPSA id
	o65sm12103726ioe.15.2016.12.21.05.11.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 05:11:40 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	ricardo.neri@intel.com
Date: Wed, 21 Dec 2016 14:11:24 +0100
Message-Id: <aec6b06a02be5aeb0cc6a7ae4d960189cbf8a91b.1482324587.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482324587.git.patrick.ohly@intel.com>
References: <cover.1482324587.git.patrick.ohly@intel.com>
Subject: [PATCH 3/9] ovmf: explicitly depend on nasm-native
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
X-List-Received-Date: Wed, 21 Dec 2016 13:11:40 -0000

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


