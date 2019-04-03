Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4A87D367
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:04:21 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id g3so22402803wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=C5h7jbzjD8KnQSu5qJjp0eSR2A0q7BDf+j6g7062WL8=;
	b=zMIB/QEu3p8g1ypQDuKttM326wlv5gBW8hTZjBPrrGzbUls81m4jS4lTgRiMM/tjxG
	YyytWpjZMZniKTwOmqA+LuNOdaGoFVT029LobIFO9VmxcG+IfRi0xghEy5iYNFz+XzqR
	r5gWFR7G0GCBxohDd/MlgwMR80JK/G/C/TOoiuoEPFYPWhYeWBE+Iz+t1G/O7xvGbvKX
	OSYPYz+0Qtp5wu/wacZQura7NHcP3TErFFMGAubdae1fUxPVe5Ll0095xFIO3qpyKuHS
	daKl63q7ANcuF6kMA4CkiPduL1CamjdlYG/d288BtbTfmYPRPFGNKqgPuOgAew22TFy3
	gz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=C5h7jbzjD8KnQSu5qJjp0eSR2A0q7BDf+j6g7062WL8=;
	b=puhRmSWkyD70BwJ6oVupkS7n2Jn9MYCNR+yK/iUKv08EA/egoArvLeoPeRgJEzrAsv
	goAs2Zx/PyhS626yH2je9LWLVOM4sa2LInM/Ip/a4NTMRVbY5lOglbIfJxvHno242RON
	hH3fXnofzwusS7D/56eZMVPFzc0Kl2Vwre8I2zBMCTMiyWnebme7IdwLqs6uzLpiKa0s
	1rL6apo32+hT1vnCbDKxpzOQ/hwBXCMFE9vfxRFUuXFkPiGtBnSK921uS/WMrlrFtqYg
	qmLb7WdndxQtxl3NFoa555KN+y1GR4QFqkPSoDIEXkutb9wN1ktEi19hu6TvI5nuB/Te
	Loog==
X-Gm-Message-State: APjAAAXIqy+MNj7QwUJxZcP+6c0OYKKttO0KG7i7U8cCFlNUpeBhcw+h
	HNyhQDjfaWKtzLxxaYDs2jpvuY4xIwc=
X-Google-Smtp-Source: APXvYqzhwCAswbYzbEnBYcEqBIO8mhzkF+wjPn0efldNIfn3/SC8+Ah1Cq1gLPneGUDawmBEaYtnPg==
X-Received: by 2002:adf:9427:: with SMTP id 36mr501765wrq.128.1554311061973;
	Wed, 03 Apr 2019 10:04:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o17sm17362170wrw.73.2019.04.03.10.04.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 10:04:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 18:04:09 +0100
Message-Id: <20190403170412.23568-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190403170412.23568-1-ross.burton@intel.com>
References: <20190403170412.23568-1-ross.burton@intel.com>
Subject: [PATCH 6/9] asciidoc: use correct XML catalog path
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
X-List-Received-Date: Wed, 03 Apr 2019 17:04:21 -0000

Now that docbook-xml and docbook-xsl are writing catalog files, tell
xmllint/xsltproc where the catalog is.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
index f684f12dc72..751bf0f19f7 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 
 # Tell xmllint where to find the DocBook XML catalogue, because right now it
 # opens /etc/xml/catalog on the host. Depends on auto-catalogs.patch
-export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/docbook-xml.xml file://${STAGING_ETCDIR_NATIVE}/xml/docbook-xsl.xml"
+export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
 
 # Not using automake
 inherit autotools-brokensep
-- 
2.11.0


