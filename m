Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C3C48750D5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 21:47:00 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f20-v6so22711pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 14:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VM1/jxeyhbmjdOLcx7I1hcXvTh0urWEMSTeVd5NcQuI=;
	b=VGXvYG9VdoO4gJP9BQsTJiwaGYfx//eegYYJimfwi2MvvNW+ElDcUn1Ads4HrgDsNV
	6zyFw08PJUddo6XS4GJ8ZI+37a0c2SUtmyk0xretg32fQgkZJHR6PY0ri9yWsaKffOcA
	tSPw/iEnt0xaqIShz8bBhKR/j0K3+wpFYPCc1rF1p3qZY9PST7q0gX3GHTvqwdq/XU9d
	ufwMzeqPNxpPlqlz9ibsIc9e8lvKUfQjMzrmltO7LHO4JeUFaSZaX59yxGGWNd1115My
	z+pTl4qgYH29jGx+TbSjmrJ6O9QiiqF36NXYlbP9PdvMBeSRO5wkgp/kTkgobQlTIl22
	T+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VM1/jxeyhbmjdOLcx7I1hcXvTh0urWEMSTeVd5NcQuI=;
	b=VcM4El8fSSXE4sNPza+/mrpSGidFQyeSqE3fhHKcZeDdynpcwubsnUzXtJXa2mi6Ow
	tbbhHDXINr6g+W/YAnIBVglUhllsiN7NrjOxA6pcVganP6Rh9j9CIWxdL1rvaG9IwfTp
	Tu0+RBLmZn+WWpHFhBCLveey+81ScWR+WLkEuJbNCJttN5+6mlNEmPY2bBuJrq5Ge3J4
	1GzDAwp/kpHBuuYXmNbr25NNQtgWdvDgYsqhfTIS7OzYDlYBHcsqsgvL1NOEGKH81MKI
	NAT6lQpCiCrIuS6gmkyoE09GmBrDa7SYxQnKit9j9tLAeta6thmhIwUBs4XnZ4fEefui
	RBxg==
X-Gm-Message-State: ALQs6tCVMReWydVOj80xEmlryQp+M70BnvkxbaxZwnEx/mA2yexLHkh1
	dJIz6OE8k+CHixJINdodgl7kkw==
X-Google-Smtp-Source: AB8JxZovfNZ453PR08XzPyududWGv1X45tQVMmHowEjJ5N3mO9F/HzIWnKtijuB7QO/OEhv2IncX/w==
X-Received: by 10.98.87.84 with SMTP id l81mr45345096pfb.56.1525902421493;
	Wed, 09 May 2018 14:47:01 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	76-v6sm3699193pge.75.2018.05.09.14.47.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 14:47:01 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 14:46:45 -0700
Message-Id: <1525902408-6796-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
References: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 5/8] icu: move ASNEEDED over-ride into icu.inc
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
X-List-Received-Date: Wed, 09 May 2018 21:47:00 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc | 1 -
 meta/recipes-support/icu/icu.inc       | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 94f5b90..305e654 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -2,7 +2,6 @@
 ASNEEDED = "-Wl,--as-needed"
 
 ASNEEDED_pn-openobex = ""
-ASNEEDED_pn-icu = ""
 ASNEEDED_pn-pciutils = ""
 ASNEEDED_pn-puzzles = ""
 ASNEEDED_pn-rpm = ""
diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 983118c..f0786ba 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -31,6 +31,8 @@ EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
 TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
 
+ASNEEDED = ""
+
 # strtod_l() is not supported by musl; also xlocale.h is missing
 # It is not possible to disable its use via configure switches or env vars
 # so monkey patching is needed.
-- 
1.9.1


