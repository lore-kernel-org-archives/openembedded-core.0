Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E0C60607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 14:56:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 141so15351155wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 06:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kHNjzeTePFum2x88Z2OJr/me28tzr6Ye9a3glP5fN5g=;
	b=EMuvw3lQaMBsKZ16pl0ZICq/o2aT+fuRxNH5TE+7rTk6CgHk1mF4ph+Ckn9p92jJT1
	AIGe391jGNOJr2utP8/0KmMkdp2BpmxoHayP2k9zNRN2aItNM/x2c7GkDGU3k8gIw2Ea
	CU15LMgYK9aSdQT1sZR85KfCOD/sBKCBlUm7FI+J+yvcqFe6hbcwamR2RWWc+alwjohV
	+Sm4fupLlDRbdnhujcvf99MymOdgfJBwdEuGl8HbOUCTI0tPicsLPY5ga7ZXM5hHWIUq
	dVh03Vv2+8HGJuzNqOd4xG7AVMTGeFgFo8/3rf9szz6aPGeO4H3sw4pCgvrJXrmlamxl
	QfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kHNjzeTePFum2x88Z2OJr/me28tzr6Ye9a3glP5fN5g=;
	b=VrUU54pjsxvS1l5ck5SOEXmCxgf30S0GAx3b3SBw12k0xbGk2dvyNbL55xosPB/P0u
	kld600Yw2R6rKXBVJYqKvKITiAl0kAdHj8e47oV8gl35/DNFQ04lqt6Yq/Z4n9TKb423
	PA7JD/m0b1cU7uIjG0/TL/N7eo5RUVquoU8VAO8vvNZ8hS0jqHQhJVY1IqWMuBHjE2aj
	FSZV86BEOFi15wD07JoaZQHkGmwLzQhoYzBcH9LnnvRVWGH/V+n5MPG0SzMtJjw++137
	Rd8kdP65V6JqFU6mLWhNh8B5aqHMa3aaQ4Kn2asjU4qOj1i/UUb1p6P9nKWg/MIlNpLf
	Tabw==
X-Gm-Message-State: AKwxytdLJ4X8Dasi1GNS9TAUtRHLByE4jLzpNZ2A32fw3voXKG2tdr+N
	9IizUHsHSo98TYY7ESbWHzx30w==
X-Google-Smtp-Source: AH8x224krci9tFdQSIxE2M1DUqcMecGx2JGnUmHwtCm3OwkVYd39bVlSV7ged0+tc0mJJfAvGi230w==
X-Received: by 10.80.231.6 with SMTP id a6mr19936273edn.240.1516892172343;
	Thu, 25 Jan 2018 06:56:12 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	a38sm1414500edf.97.2018.01.25.06.56.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jan 2018 06:56:11 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 15:53:31 +0100
Message-Id: <1516892011-5420-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] net-tools: change a '=' to '+='
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
X-List-Received-Date: Thu, 25 Jan 2018 14:56:12 -0000

From: Ming Liu <liu.ming50@gmail.com>

This avoids other do_patch dependencies being overridden.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 69c9af3..5657fd8 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -37,7 +37,7 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
 
 inherit gettext
 
-do_patch[depends] = "quilt-native:do_populate_sysroot"
+do_patch[depends] += "quilt-native:do_populate_sysroot"
 
 # The Makefile is lame, no parallel build
 PARALLEL_MAKE = ""
-- 
2.7.4


