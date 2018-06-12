Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB1778CD2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 09:33:33 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id l41-v6so23298285wre.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 02:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=kB3AizOzKtWzi034DC0/oyTrY/kwmdazPTX1bGaq4k8=;
	b=Wz3cV3oSrgLT5vTYRZ6ijECyzQvtcPLVddCJXgyazrjQGMs8EUA2nV/zrK1H1DZYev
	6q4Hs/ym38DegCdKvo/Z496P1/LpGZTUdteD1/IZaO+GifAlr+WH9zQUBTi+0Lc0eJf0
	DazK1cvkynOD2giz2gOIgv8BEMWsOO3j8qWCseyX6We9nU7rSHqfrVL9fGb6jw0MwK34
	DDS2fuscwLoQSJUeZ0jPwmHsu41Bneh2LVh0H/gQGDxtqfkhVQVryTpOdQE0Ng2gnREZ
	tkdHnCPQcpqhGrLgWKFgUbCh70KNE15U3KVQzV4FZQOC7gPZm2Rk1siAsCmtJ3t7iN/P
	b0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kB3AizOzKtWzi034DC0/oyTrY/kwmdazPTX1bGaq4k8=;
	b=n/PLebY6jhAm2yvx2mY6vjP/OHD4NyjHMsMVVObzGxJNRX4iFmpgUl+BEQeFV2UFrh
	y6+6KoDb35UwTVHTMQmxQeX/EUGGr7RE5h5fMb/d43USDOvOXbMe57zNw2FK9xdhYri/
	rgqyR2foD0KE+/ocIZ6D1AC5ohcZCXjv2/5BusdagL+KtHoD3G7yOl1U5lmcE+pia+Ts
	FQq8mqGoXr9zcBsEyfbx9+rGHz0RjuI1g5CuNkqrbBBbjD9V/gkvBpLjOX0X8VHNu375
	rhWNq79KXsmZu0ag2KA93QF4/0HMWy9EU3ctgucb+v5KnEzTJi04zAMF0SK+hUFoNkYO
	UuIQ==
X-Gm-Message-State: APt69E0ddFiq/LIjyEO6DGD3RnidEEdZlXoWFopKns4f9OG+nv5B3x6A
	PZKBnYxqp3b52Gs60CW0vnHuA8vG
X-Google-Smtp-Source: ADUXVKIyVX78Jlv+K8BVMq1j5dSkogm0mcA6ZzfaSf7b/+6Rvu/+n1CNvw9Xi9BW9QquAs4bkjxN0g==
X-Received: by 2002:adf:88b2:: with SMTP id
	f47-v6mr1891158wrf.55.1528796013756; 
	Tue, 12 Jun 2018 02:33:33 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	w3-v6sm561040wrr.88.2018.06.12.02.33.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 02:33:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 10:33:31 +0100
Message-Id: <20180612093331.1398-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] maintainers: add Andrej Valek as busybox maintain
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
X-List-Received-Date: Tue, 12 Jun 2018 09:33:33 -0000

Andrej has kindly stepped up as the busybox maintainer.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4939c79c9eb..bacdc0b9a29 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -85,6 +85,7 @@ RECIPE_MAINTAINER_pn-build-compare = "Randy Witt <randy.e.witt@linux.intel.com>"
 RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
 RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
-- 
2.11.0


