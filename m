Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3B558731B1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 02:56:25 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id x3so9804751lfn.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2019 19:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=CXiulHw98wG1B2wqsjMi+ZoBM1ZGESQr6ovZVSpNVmw=;
	b=sNoYD/r5Iu2CWW6MLXlRjeEJN9Lv3KiwI8lSB7qcTPGMlRsE43XGBz8+hTdDLHBHJs
	o9X6J0BMcjY/yYSPvykhJaKGEeHMuaCvDToulv4Tm17fSTB6ngkQPUMIhEbOmQPWmX23
	G10kJs7EAaEmDJ+RA0svDxP/B+OUnYRRfv9KfQI/ZaJA60INpK7xUYOdTwnQUJN/1sqf
	BsF9MhSHqMwdNP6MtEncA7af9rWE/XoYZ/rB5aSr8Gb2yfzaWXUJGAvfseHIT9U7X9re
	swMPydNLrEkyB+xf7pPH2ITtNB8wkH4avOiAXdYBdbmTydD705PQgFHOIz8alS6HNxPm
	uUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CXiulHw98wG1B2wqsjMi+ZoBM1ZGESQr6ovZVSpNVmw=;
	b=P8Nrt9YekfcKaue+GuFZ7RZOreIBjbkRP3gf/B//S27xTsqFzdcrK0n/dq6cBbGC/n
	Nc9eBLgLpd1pActaeI7yAM8LezHjgsfkFWQdWKhnYL+czawh7eFjcqToGZjbVqjlSOy+
	Kv3Z7ZCxo1tVVYSi87fSGNZEpnJVHggVjs1g2gRTsVn+56r5B1XsJpPr2e3Jayvh0pxb
	+hQUu4ptF+agOnOXa53+kg51tat8toxNeMT1iA6nH4ReJzFX5opqbw/sWJ9iBi67gz1B
	LELxedcWbM41WVBMrY4UZspoxuaJwi7AuAPl8B6dY/vM1WjsJNcSWDujg86wiFvelh19
	I1Aw==
X-Gm-Message-State: APjAAAWZMp/huHNPR+y/d6zjknIpSMGmVMbWYqA6Erm1uZEmPhKeGDKs
	71dirtCnWtYteryjNVO/AjMJ+tnGffU=
X-Google-Smtp-Source: APXvYqyFd4zwy6U7xUVkItxJ1p2LecAu2/5AEOy1ek/8ey2FsORSuwNNLqtrpFzD9lpbhJkMbhJ50g==
X-Received: by 2002:a19:9111:: with SMTP id t17mr1931433lfd.113.1566701786117; 
	Sat, 24 Aug 2019 19:56:26 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id t8sm1395581ljg.70.2019.08.24.19.56.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 24 Aug 2019 19:56:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Aug 2019 04:56:22 +0200
Message-Id: <20190825025622.24465-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] nftables: update to 0.9.2
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
X-List-Received-Date: Sun, 25 Aug 2019 02:56:26 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nftables/{nftables_0.9.1.bb => nftables_0.9.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.1.bb => nftables_0.9.2.bb} (85%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.1.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
similarity index 85%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.1.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
index 9d0da33e3..98e8050b8 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.1.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
@@ -8,8 +8,8 @@ DEPENDS = "libmnl libnftnl readline gmp bison-native"
 UPSTREAM_CHECK_URI = "https://www.netfilter.org/projects/nftables/files/"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e2facbcad6c5d9bd87a0bf5081a31522"
-SRC_URI[sha256sum] = "ead3bb68ed540bfbb87a96f2b69c3d65ab0c2a0c3f6e739a395c09377d1b4fce"
+SRC_URI[md5sum] = "dfe130724d7c998eb26b56447e932899"
+SRC_URI[sha256sum] = "5cb66180143e6bfc774f4eb316206d40ac1cb6df269a90882404cbf7165513f5"
 
 inherit autotools manpages pkgconfig
 
-- 
2.17.1


