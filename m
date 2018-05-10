Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 51DA775216
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 11:24:17 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id p4-v6so1652828wrh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 04:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=BKXS3xytCmGJtKuezec8fX1N6+KNMYxVeV08mDbNM+Q=;
	b=O7JTDg3viyvyaGEyT5Ykt77YxgZLxRxNhbm5/T5ZNTxnGXzZueFvruJ+BFo+QnSVkR
	zIbAnfuUV8kKttdNzWGDvMpNvQ4LiOgu7ddMjEitIyzLnhDQGcaOhvfhMMbXh12ozhk5
	ZOyLS/ilPX9yxgw707LAnUKrx8bHp0YlU2STQOrTareEmnWJL41guhRlNDGtJc6eLr/U
	zHE4FcwvllaXd3b/GqcQe040GkZMF8moVbFCSQA5EJikyagFzoBg5Hca/KLPjFN6Cumy
	RC4JvsPy3WdsnMXJrE/YtJRzzOWeLleHVy0gnnKHeEL8eNcvaiCr7nYf9c1nfCbSKayp
	8kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BKXS3xytCmGJtKuezec8fX1N6+KNMYxVeV08mDbNM+Q=;
	b=PxS0qtBOLVjyLC6jmgxNO2uKRxgGz6ftyk58ckKyWeT1EvWVmMIxSMG6y6pVZAUhQC
	n/ZD8f8BYBrWqN/vWUz6X9r4SflJuWi1uOCbg3oSb90OjsROKTnyNtbT9u5JrNFxSZlR
	Aja/Hn2AOwrp6OpG29eSbeqAGNV9yauRu/PGSNvw5RvK/J/mP0ekHEUUONOaUtwVXEFD
	vGzkbaV2SqpkFxv4tJhtU7AEF5IersH4x98HFB6cvDJnd2z4SlLe4nDYJ6vl/0OlQgct
	Ucl1JLlrvA13fxoccmPqnyS8e892AOd2q0OxvzVvBfU2r5ciWiDyQP8sHNupGsjAbTuP
	FR0g==
X-Gm-Message-State: ALKqPweKSHtvp5RFHgtbSJAxsOsZ92+3dpWZQOtQXJBRrlGBtI3l6bVG
	ZP5zwLzn32eRHnVHJ49BcvodRbAK
X-Google-Smtp-Source: AB8JxZrAaITtwOB/mgKL7fFvxRI8kOtCY7eWU4Tv8jM5VArWcZG8LNiUxuieCSpYFs8MiKNVLEQlKA==
X-Received: by 2002:adf:8861:: with SMTP id
	e30-v6mr972285wre.252.1525951458328; 
	Thu, 10 May 2018 04:24:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a13-v6sm756578wrc.19.2018.05.10.04.24.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 04:24:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2018 12:24:15 +0100
Message-Id: <20180510112415.24655-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pbzip2: fix upstream check URL
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
X-List-Received-Date: Thu, 10 May 2018 11:24:18 -0000

compression.ca is down, so use the Milestone page on Launchpad as that is also
where we download the tarball from.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index 4e96de2ed32..7b1b0a117e5 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -18,7 +18,8 @@ SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz \
 SRC_URI[md5sum] = "4cb87da2dba05540afce162f34b3a9a6"
 SRC_URI[sha256sum] = "8fd13eaaa266f7ee91f85c1ea97c86d9c9cc985969db9059cdebcb1e1b7bdbe6"
 
-UPSTREAM_CHECK_URI = "http://compression.ca/pbzip2/"
+UPSTREAM_CHECK_URI = "https://launchpad.net/pbzip2/+milestones"
+UPSTREAM_CHECK_REGEX = "pbzip2 (?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OEMAKE = "CXX='${CXX} ${CXXFLAGS}' LDFLAGS='${LDFLAGS}'"
 
-- 
2.11.0


