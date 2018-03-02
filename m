Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id BFDB87855C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 17:53:05 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id s13-v6so6101479plq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 09:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/Tq0r0640An00lNkH/qf9HRBU/QBp9knE+P6Fixbk6o=;
	b=mKMnjxj6MBoKh78ZGJeRedkpS6Cs1tz4scv2b3fDdupCWIkxxg9AuMmzykFxNIsyw6
	TI79ob6S3nKXs4RTp+ZMLbWWTtQuSiaS/9WuoISXTLV5EruHW3N25zZQpmgm+3LXsL6f
	7LdOEs6tsKRGCeVJwIB6WfpCz41dv2Di3etQjW3cCfPBKL6bHpbl+9bIzIccpP9rpU7O
	cu/bNQKKYguTVUInjtn03bo2ZPPkFp4cYtq3+Abas7Fn037oZQnWiSwTnzDw9zF3pROX
	huQMgWP0PS+YpH9ifWeod0ZFQ9Zd3nEnakBnME3LvSBqMxWsAO3Zhm2e2CKHYNpje1Og
	cAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/Tq0r0640An00lNkH/qf9HRBU/QBp9knE+P6Fixbk6o=;
	b=En9bSqqRfP1UBtl4nnAod1cL7S62nzoeCqYYm/dgGf2MG43q5SSLb2vn1N2ABCwIb/
	tKZfufn2uF4+TUPz88QzuFkZFFIbDPF6TG854vBh+F1p1bF+0Bpy/DU5LAO5VjmP99uw
	BUnlh5hHKvL5q7otoTXbvJOqyu6zJwZ+StVoINzCLrOT0uIMvx53RkwB25T1OUfjtath
	Pqvo9xjJ2S/HpmcfGtbr+UxX9e2Kjqo0iMIJVhy0dw7tCMVZ/opfqolhXchrkfF3aeRd
	W8YTxU6mt60a6gtHesB7cbcvkNQiN5dk+s7fdTymziCLH+izgtZDg1l+vd8SqTXHOp56
	ZULQ==
X-Gm-Message-State: APf1xPAr27lmHoLaMoOA7q5wR2eAeXdEKaS+ciIERoOyAXNMc+gQDb+9
	nolAPRi+Ml/cU7gVyORAYZnVFg==
X-Google-Smtp-Source: AG47ELuzEIirzI2b00RohYIuu2j1svQPr5ed6KcVtrJg6UIFOyMqkttElda0zpPha/KQK8E61oec4g==
X-Received: by 2002:a17:902:3103:: with SMTP id
	w3-v6mr5664591plb.99.1520013187132; 
	Fri, 02 Mar 2018 09:53:07 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a28sm13329196pfe.70.2018.03.02.09.53.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 09:53:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 09:52:56 -0800
Message-Id: <20180302175256.29044-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180302175256.29044-1-raj.khem@gmail.com>
References: <20180302175256.29044-1-raj.khem@gmail.com>
Subject: [PATCH 4/4] maintainers: Add myself for musl-utils
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
X-List-Received-Date: Fri, 02 Mar 2018 17:53:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5039248790..027fb18d5e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -525,6 +525,7 @@ RECIPE_MAINTAINER_pn-mtd-utils = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-mtdev = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-mtools = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-musl = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-mx-1.0 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.16.2


