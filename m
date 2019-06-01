Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 68B9C7E636
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 10:25:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id m3so8104212wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QM2De1dYkYGu7mpYbnX7zTepXiSOG7cvxfnsXSP/VLI=;
	b=eLaoV54eYURwiKo46oSySaE0j/EyzFko3e8GkTmrLJ5rkvp9ohJESyIUu083/qWjEV
	9h2GiW9FwJ51orX1CAm3kHrS6pTojnVI9oI53LjFQxL/w3PS/Lh/pY47WHisH6cUlGF6
	R6mNDYeXW39efAtONzyrX1tgWPyVbobKp38QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QM2De1dYkYGu7mpYbnX7zTepXiSOG7cvxfnsXSP/VLI=;
	b=YhA0Xl2SGX9Qqlm176rly619NGWNYdKMJ3QHpMfw/vHgTdlhucVv7/akUDUotPZ5B1
	uCDhoQDbmQxF/S9hGc2EVXgaS5xMtSaVDfAUPt4P05Zk082pINBaYsVq0pPUMEVtY8p7
	1ftLubUHW9TKy5D2+aobmooGv8bJKrzjYBPFbvaCeMAhft3vbZYKXGF1xOBaqrzMulDq
	hilHIcHZSJBqgWVMs3MHB/fwqdBKjUQiuKVJfBmE1G1EAlvkWr5+UmW2qm97vegydOrl
	K7pbqrUqxIvvaMJJb/xIlzRUNkrpE97QU8UjHrbCHfkplDcyU76ue2qOQSGfo5kqCGFP
	mPuA==
X-Gm-Message-State: APjAAAU0lvxzefe8tJsfTV8msz8OKFY4/oRseTQIYJgYA6EPZXgPNlJM
	65ZzX730SIONCSwjIrotAFEvAnJq3cw=
X-Google-Smtp-Source: APXvYqyYmn2t7aBRUogtndjD7vW/qgvka9EBlkGB/vV4k8vCLDKuJKsVgCtBgZ8V+M41GY1/0Kknrw==
X-Received: by 2002:adf:ed44:: with SMTP id u4mr9919911wro.242.1559384732998; 
	Sat, 01 Jun 2019 03:25:32 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a124sm11912234wmh.3.2019.06.01.03.25.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 03:25:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 11:25:24 +0100
Message-Id: <20190601102530.5995-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
References: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/8] libtest-needs-perl: Fix ptest dependencies
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
X-List-Received-Date: Sat, 01 Jun 2019 10:25:32 -0000
Content-Transfer-Encoding: 8bit

This fixes runtime errors when running the ptest in a minimal image.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb b/meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb
index 3abb9aa8e4d..c44ee6340c4 100644
--- a/meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb
+++ b/meta/recipes-devtools/perl/libtest-needs-perl_0.002006.bb
@@ -24,6 +24,6 @@ S = "${WORKDIR}/${CPAN_NAME}-${PV}"
 
 inherit cpan ptest-perl
 
-RDEPENDS_${PN}-ptest += "perl-module-test-more"
+RDEPENDS_${PN}-ptest += "perl-module-test-more perl-module-ipc-open3 perl-module-lib perl-module-version"
 
 BBCLASSEXTEND = "native"
-- 
2.20.1


