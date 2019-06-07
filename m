Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 864827C86A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 17:53:52 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u8so2745608wmm.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 10:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=rbOBFHMBo1eW/VzNE8br1opikt7RQU0uuOi+Vp3C7lQ=;
	b=Qsd87OMOHJ3x/xvWiMA+miVfhLMeSRm9+pk+WyiPHJ/LlVvCXu8Bal8rnXgHfLbU3x
	E0+XQABDiyC/P+Sz5sfaE5MOjk24T/dPPhTA/WQ+8BkX8avBcAXr6g3hOIADtTlFabEd
	gC+BtghVdxDKHBu/gCWl8uGRonEBYNAuIdyT0h4/Wa6g3kxlVsUAkrKPBvfFq9oRC1IP
	wJdOo3IygiBjtFkJPI5X9LfMKPEWH/9C8mo0kzog0EbbYM9CJWQD8prIseYAwr1a/lg3
	7LZm+SaxurLF3FxeUwC/UVNfS8pjcExiVVhF+pTVFxLazQeuNvg9psL+hebpj9XUE5qD
	xyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rbOBFHMBo1eW/VzNE8br1opikt7RQU0uuOi+Vp3C7lQ=;
	b=Pc9o6e8ZKVbH7RCchA2rKBeDxu9MbWE2X4KvrFP6xa0G2Nah0a019pK0xUZWsKTyhs
	9dd8ZbgWqe8hjwS9JkVRs86+kn/6TtygHDeSEhzR3gidF1Lwe3AY9VuMdrEOD/PmXsQ9
	qOuMUebuHPq+AyiivxeV/DeyqD83/cRRTt7qQuSPBw8yW4g0/igtrwKG1ogsJ3ehVMeP
	GVxJiASUAww5Z1ArJ7sSH7lVKLwb1IZwgkSZj8B8MgvxcMGYoLM6UubqN1RkJggSbaT3
	NmpPoMRa6MRcfoJ4DllA70gxa4ZDI16KIQnaeRpH8IREaJFEoq+ZZuxUWADatHGP7YEj
	vMIg==
X-Gm-Message-State: APjAAAWAc49FtBpm8csqGUXgkfYYGPsIuyZ2/peqnw9fCwyA1oYr/Qt0
	yleB/+ZwPBMpjwqrs/71G/ZoZE2n++o=
X-Google-Smtp-Source: APXvYqzSga3WDhd3/PlYVId0seyfYirC+K3CllF0NYSYCFIZNqI6rrOm5ZeaMaq701uV6Bz6gasx5g==
X-Received: by 2002:a1c:188:: with SMTP id 130mr4437180wmb.18.1559930032839;
	Fri, 07 Jun 2019 10:53:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o13sm3495085wra.92.2019.06.07.10.53.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 10:53:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 18:53:46 +0100
Message-Id: <20190607175348.9666-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] libxslt: add comment saying when a workaround can be removed
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
X-List-Received-Date: Fri, 07 Jun 2019 17:53:52 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.33.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index 28d404ca779..462eccf52fa 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -21,8 +21,9 @@ BINCONFIG = "${bindir}/xslt-config"
 
 inherit autotools pkgconfig binconfig-disabled lib_package
 
-# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
+	# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header.
+	# This can be removed when upgrading to 1.1.34.
 	sed -i -e 's/ansidecl.h//' ${S}/configure.ac
 
 	# The timestamps in the 1.1.28 tarball are messed up causing this file to
-- 
2.11.0


