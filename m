Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 674357F7D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:38 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id z24so1603567pgu.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xE2RL7vUkd3zcu93Yyii0G4R/7OQuVWpt1Kwvc0D4oM=;
	b=AqTmvpl51U8PSwuWeALiAsbgAftdQG+uc2iTE9224Ade7LdM6qb9fz5axoQRujvDCN
	sjoB8IQCS1qBTBAZFbJYWSUCW3IfwPxnUaIvCJlLsEPLXSRFd0VEhJPhzYzeymjKk09D
	NIJlJ28J7AOiLS77YzBaR5bDhdqN6kg0fYTgkqixAwNL8E45DnnWI/nIvWEFYLuAYMKG
	VNP5w6SOZroC1UUPWER/ZqmkNM465TK1S8ElVpQiL5RWnM/FPMn6/6OzJpPpZsoT06w+
	vUmBJ371B1sw8mPFzVCicy8iL4B6RG3S5BoWzUtPWDbJSLNPzIJYXi5LrSVDdelSQiu0
	bdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xE2RL7vUkd3zcu93Yyii0G4R/7OQuVWpt1Kwvc0D4oM=;
	b=gIUC4MUYzsFajB3tJyQ0O/GpGI7L94OrOK5LhfTQL/r3uTMMoBX3Yy71qe3qg99+4P
	9HrAM/rZlQ2HF6fpCrg/mK3Oi5bibkMOZSQrSnz/G1vq9RWKTLvhTBVIFJzUSAcrZUM7
	bUz8sGHCBAdt2O5BU5pc476Gn3W+ISsB4b4X57h4pdkoqoj1kvNQd0olOejzWNoexZBR
	7OJ05ai/PFhrFIyvEDXYqbCAEiAaQR7UKWpIQNE5JVC9g9AkRGHRP4V/701u7MmDElfU
	y2lqKzP6mFdxiIhIv9iJleA5oheZP7c3AhX0HyqLdaioIp/Z3Hbh5jazyuQr0VhyrbqN
	X0gQ==
X-Gm-Message-State: APjAAAVM6hC7Wyw+EoOuIRgAb95leoBd3Uztpbr0LNv08ykpv9UpW2EQ
	hCRXlGLAiNizIIH8joj0uS1ac0bI
X-Google-Smtp-Source: APXvYqwM1NUOmyEoHPnvnWqsq4BdCy9dLemi+jnZ42LktSte4vzhgJIJeexHiUiRGD3gi2ykuOT1NA==
X-Received: by 2002:a62:18d8:: with SMTP id 207mr4999357pfy.15.1573659159461; 
	Wed, 13 Nov 2019 07:32:39 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:56 -0800
Message-Id: <f02e9f46ce54fed3c7ddfad7d1003a2fb7ba3a67.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 14/31] sudo: Fix fetching sources
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:38 -0000

From: Ferry Toth <ftoth@exalondelft.nl>

It looks like https://www.sudo.ws/download.html changed certificate
and directory structure. This breaks fetching sources.

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/sudo/sudo_1.8.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index 8b3be55..0a11a1b 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -1,6 +1,6 @@
 require sudo.inc
 
-SRC_URI = "http://www.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
+SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            file://CVE-2019-14287-1.patch \
-- 
2.7.4


