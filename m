Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 134427F8C1
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:51 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id n59so1738593pjb.1
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=n/ocAy4Q5CruOTDxlyX6dXjujCS1UDn1YTjqYwkSXBU=;
	b=I01Q9SabAoF7StG5noYLTOyYvmoduefDRbdWI5rQvh1wXiA/15fV5H0Nt+1T/uSEcb
	CoEm1M6iEeGabcLAmOoZuIdQMiITCA7h7mLrkUtGUUTcdfU5Dch/hRh0Hgm2QEns/MGu
	jL8JcPS4AWdFmvA2fH+635mu38zllVIsUdFylCEvBAfqeRCD4Liwwq05GAzUnxAe2+4o
	R2lV9pXjNyKED6PwQlq/IARQT2ml3MddgpoVlVevlSDHrfH2bEw31+MbD2HLIpcVF1uy
	u1T+quuwDx+CVKGCRyoDkyGNofe/eK27k/OpI/w39Q82ecDy8r8v+zCA9lZQr47NMBqI
	Z3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=n/ocAy4Q5CruOTDxlyX6dXjujCS1UDn1YTjqYwkSXBU=;
	b=YVTbOQPo+/o+DPzwn74DfhKFtaQ5/XSsC+YzWRRGcycjCgysTpveHks6cjiTETV3nI
	O3z39fR0/yoFrQDeNQ0BtGS1pEhYXA+mB7lD+GusTZx0hj6zrKL2D3uTlugzGUwFXge1
	O9hTFaKltBIdMPSP1ehpwx+p3kEeH3c9ziHfBiENZFtF2HLW7V6O0FIoMDWbrZdE/o4g
	aB/xGfKVI0bxLQSanPzaSAMDBe5QgFtPTCyHkEqdnILhV3Kv0ok898XPNZfX52KPFJHp
	1kIkdTMOlebZw+taghlchDj5FDDDPM3kLQYj7eUKyIczSt50APpVfvZH/dAFAKCTdLM0
	Yi5A==
X-Gm-Message-State: APjAAAXDuNkl1QkJwPKXL/OgAW2rBqACHnRcxwJduCv7NNwrgwZsdiul
	BHwAylzNeqrWPjjXc1hhq8kjPBsv
X-Google-Smtp-Source: APXvYqxGaKA1hEFlHWyrtQqY2OVdShxqlheBwXBkng2oT8ikhQToRczCuSYQSmdPmnHbz3mjitJPOg==
X-Received: by 2002:a17:90a:fc82:: with SMTP id
	ci2mr7269124pjb.13.1579188053125; 
	Thu, 16 Jan 2020 07:20:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.52
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:17 -0800
Message-Id: <9b5437f9afb4dd1366d5e21ea861f683d8cd2a09.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 08/32] subversion: set CVE vendor to Apache
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:52 -0000

From: Ross Burton <ross.burton@intel.com>

There's a Jenkins plugin for Subversion.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/subversion/subversion_1.11.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.11.1.bb b/meta/recipes-devtools/subversion/subversion_1.11.1.bb
index 8abac7408e..9909461bf7 100644
--- a/meta/recipes-devtools/subversion/subversion_1.11.1.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.11.1.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "9efd2750ca4d72ec903431a24b9c732b6cbb84aad9b7563f59dd96dea5
 
 inherit autotools pkgconfig gettext
 
+CVE_PRODUCT = "apache:subversion"
+
 PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
-- 
2.17.1


