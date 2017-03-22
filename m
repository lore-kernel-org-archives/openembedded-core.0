Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id EC7C171E06
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 22:47:59 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 79so24084060pgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 15:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=56qwqUABSt/fvHPUhT71jRV7kNwM8spvRJKj6qT1yt0=;
	b=Ca05IOH1/BvIOOptnFoxLt91ZkzVLNCKTNpYw1gccpAKpjpqjjO+l7Wvk/+BJZpfsF
	IXAwWLk/s1j/I3WkrOpX5SZH4/Ll7bSA7Dc1+ayaJCdnH3EY1iKXVn+WgtvVsO+O+FYK
	Ms818xdx/d5t7Ncagihnfo2PCHtwFsWu/JU+5tLaESlwCNuxwK/QxG+6RIBK8yGkb+/7
	AbIDFuffT6y518lKfcSNF9xVjDTQLi3QD1iR7JLLmXSJd4k35YYtP/+2yD0a8gQwEM5M
	dFJRPTiL79UaV5kBp0gaPrcF3n1aWp93C/1PCbHAJJ1ibXwIbcA244NEnvVfj+WPwM34
	uNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=56qwqUABSt/fvHPUhT71jRV7kNwM8spvRJKj6qT1yt0=;
	b=b70eJVnVKmA27Fe7ETE2DRRuS0IBpbg7GXKgXS9jSu7/VrrBnIokdvdWR4ExPeWwWI
	whLZoiLd4Jobwxfr5bF3UnpnGlRRQ18/QYkwioyDUC6uxRIC4cDJHmw1doaQ5H+mIu2V
	hjeMG+3mVoYV9i9AdSHh1yq5V5d+NoqemF9zuAEJjHWBITotywa5ZRC4fgbqlSwTGsFV
	vmCX+VfaOtf28LPvXVLU8gBO/HE7OrsyC699DjHJTLdmhZwpBO4u4ua4UF2pYwGDYNCU
	inv49Q+F98pfzxuMBlSYbNFTcrnyA98tuTAp3+0jCDGkHYA+QI3qjaJ+WCl2B1cBcDTI
	WkfA==
X-Gm-Message-State: AFeK/H3ResuPs8Cx7gRKmRx1AlpAE776iUofWjKZsXH4aa1NoWZJcMg7a/H6lWMzk4KlqA==
X-Received: by 10.99.130.193 with SMTP id w184mr38863208pgd.157.1490222880906; 
	Wed, 22 Mar 2017 15:48:00 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id s4sm5858926pfi.74.2017.03.22.15.47.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Mar 2017 15:47:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:47:55 -0700
Message-Id: <1490222875-16219-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] native.bbclass: clear MACHINE_FEATURES
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
X-List-Received-Date: Wed, 22 Mar 2017 22:48:00 -0000

Try to avoid native recipes accidentally being dependent on
MACHINE_FEATURES. This simple change doesn't prevent MACHINE_FEATURES
set via MACHINE_FEATURES_BACKFILL sneaking through, but it's better
than nothing.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/native.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 6becf82..1919fbc 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -112,6 +112,7 @@ PKG_CONFIG_SYSTEM_INCLUDE_PATH[unexport] = "1"
 LIBCOVERRIDE = ""
 CLASSOVERRIDE = "class-native"
 MACHINEOVERRIDES = ""
+MACHINE_FEATURES = ""
 
 PATH_prepend = "${COREBASE}/scripts/native-intercept:"
 
-- 
1.9.1


