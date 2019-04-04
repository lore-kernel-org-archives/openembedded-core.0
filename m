Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 077BA7D45D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 22:16:57 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id r186so8300527wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 15:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=C5h7jbzjD8KnQSu5qJjp0eSR2A0q7BDf+j6g7062WL8=;
	b=TDqXPh3Iovou2+GkPtG9uT7rWWJ6ihv8Owbrt7CpWPqhr6kg4Y9fNl83+L2rbwjht8
	7qkeYqptuLMuVXhur44XvdM2hStjFlzhtQazT3XjwZuS2veS6qBL9huE1TxiMELX8dZR
	f9dVLEqkX1qWxBu66gnjTFBS9E84HEwIMn/94kPNQUHPo+RQoKQ8tuuP5zMXqdUcIKfQ
	nw5/vJxtiWPl0662Cb//IKoC+0XDNRdxvn9ADiAr5b7SXqgTjxdsOHsatr8EFv4DNG+e
	4cE2E/rtyFT7hAs9xSmXcjRs55TcVieMUSKPHKGvHS0fREip41k1wX0Jrb3nfGzuWugU
	z6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=C5h7jbzjD8KnQSu5qJjp0eSR2A0q7BDf+j6g7062WL8=;
	b=Q+tYgWdHjLWv1qDThD2sPD9snqu9sGp8poo32dVB6JpOBSsdvI2VR1wQPAyIm/64d4
	hasvuF9AU1gewV9xKblN1QHApfkkX1OYZ8K55SUafPF7s/JfMQ4GzX/OmSTDsu8dRjkf
	VSm9E9ZBehUqc5bo4C/VTX7S1Tyl317EctLJbcXW/ME1zlkfKh+zIagOv3yoUeVLgd5S
	8z6GvzUZ2CoSsgUTcWM9jqJTyPr07EUbk3/YxfBr4b0Wn16sc51X6BR9v1s3kjz/z/E0
	JWzU4orOn9mqRRWeGhuDle9RCqrO3i5/+RxGwCPnz2c5fFPVGCIcylbtNwA6821M8DwT
	W+Ew==
X-Gm-Message-State: APjAAAVdMwYIxNLyTtgBlvpHhn2msufZ6dZ4xV2KhL4d+p3rTr216Gud
	vne0orfW2WGOWPlmIW08opji1vK9VTg=
X-Google-Smtp-Source: APXvYqygjgPQftKqxRU+M/5oCHVu98simQxw+s82oAGXmcCSis2IPnqd//W1ZmhiM/h1ZqUYq820uw==
X-Received: by 2002:a1c:2d91:: with SMTP id t139mr5601035wmt.102.1554416218517;
	Thu, 04 Apr 2019 15:16:58 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d3sm305565wmf.46.2019.04.04.15.16.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 15:16:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 23:16:41 +0100
Message-Id: <20190404221644.20496-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190404221644.20496-1-ross.burton@intel.com>
References: <20190404221644.20496-1-ross.burton@intel.com>
Subject: [PATCH v2 6/9] asciidoc: use correct XML catalog path
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
X-List-Received-Date: Thu, 04 Apr 2019 22:16:58 -0000

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


