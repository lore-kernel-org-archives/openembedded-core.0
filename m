Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id A837060F33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 18:49:15 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id t3so8402311plz.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 11:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SKhz+OdbuApjC5ho8C913JiyjwAEPWjZDfUQHFRNP6A=;
	b=T+Pmsf863ess+O/A4VWMX8FnumQ/Nslgvow8G3Wee7+7F4XnO8hLXbynecaHoyG1gq
	15ARdRhsntcfn5y35anVgkMoJR8r+JBvwARJ66hQKBBtipAGGANwPECzD/2hC5TOTkQO
	h5g8sAEwvbzmfdHFWvUEEfK82prPBwah/K+/xWuU8qvA3TFfTS++fgLxdPnq2O8s64ew
	ogn2RjlwEuGTnyYDpfRfDf9a+nVp/QoZqB6uPCxgbcvxA9F9k0AgswiYTjlqp8nuu7OX
	yZHEA4XOVCbymD86DggMsSc84Jeg0B+UO/VV2sc1elZci66kWzgmVHTwouGSwBI1zgS4
	vAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SKhz+OdbuApjC5ho8C913JiyjwAEPWjZDfUQHFRNP6A=;
	b=RwxA3dsnlxOtnhu3wt5VUgDAwydN9/dJhnJcetgMq4RgBN+iDGQ1bjzaJ2bYVm0lOW
	prRpeLQqnofrCBhzUXEmnUERQNgFsgu/pouAFCI5ldFYj67rg0E25z4qwFQ9k1pgXStn
	TASQea3/O/RoFiq51/fgmcLxSUNeaF8mlcXfkZzq2iBtxoRCQUja42lNhI6h2B73WGXX
	rDnJwu7rImKaWzBL8wTsYbD82DOXQI8bbHmCFqZ5PhKtlkauqJdRq24lhzKIMcTKKtRf
	Keudd1SmDclK+ib8zt1sj/Re37x8WgGQLKEunqVB+FmdNHm+lANdXVX5Jjn6tEtWxW3p
	rPsA==
X-Gm-Message-State: ANhLgQ0AQgyFq2gdq+3QgOEAxajEb26W0kL51xOYgvo/I+3ktN0xdnO9
	g1eajJAvgqw6IR+w1DKQUkgUJvnv
X-Google-Smtp-Source: ADFU+vvju3gdruXivxxxvJWnQy4sTXMhDIHQOnDi6Ge5+qSkb32dwBTCKo0c/INl92uBZGp7zk7gEQ==
X-Received: by 2002:a17:90b:3793:: with SMTP id
	mz19mr968094pjb.194.1584384556245; 
	Mon, 16 Mar 2020 11:49:16 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	c201sm632455pfc.73.2020.03.16.11.49.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Mar 2020 11:49:15 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 11:48:58 -0700
Message-Id: <20200316184859.11635-4-armccurdy@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200316184859.11635-1-armccurdy@gmail.com>
References: <20200316184859.11635-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] tune-arm1176jz-s.inc: fix typo in PACKAGE_EXTRA_ARCHS_tune-arm1176jzs
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
X-List-Received-Date: Mon, 16 Mar 2020 18:49:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-arm1176jz-s.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-arm1176jz-s.inc b/meta/conf/machine/include/tune-arm1176jz-s.inc
index c741e80521..a63d585698 100644
--- a/meta/conf/machine/include/tune-arm1176jz-s.inc
+++ b/meta/conf/machine/include/tune-arm1176jz-s.inc
@@ -9,7 +9,7 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', 'armv6:
 AVAILTUNES += "arm1176jzs"
 ARMPKGARCH_tune-arm1176jzs = "arm1176jzs"
 TUNE_FEATURES_tune-arm1176jzs = "arm thumb arm1176jzs"
-PACKAGE_EXTRA_ARCHS_tune-arm1176jzs = "${PACKAGE_EXTRA_ARCHS_tune-armv6tb-novfp} arm1176jzs arm1176jzst"
+PACKAGE_EXTRA_ARCHS_tune-arm1176jzs = "${PACKAGE_EXTRA_ARCHS_tune-armv6t-novfp} arm1176jzs arm1176jzst"
 
 AVAILTUNES += "arm1176jzs-be"
 ARMPKGARCH_tune-arm1176jzs-be = "${ARMPKGARCH_tune-arm1176jzs}"
-- 
2.24.0


