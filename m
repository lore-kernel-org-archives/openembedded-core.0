Return-Path: <anders.roxell@linaro.org>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id A1B8F765DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:17:03 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id u5-v6so3291955lff.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 00:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=yZKYQT7WMpwSTtVZT25xci5bHCwyOTot6RL5r5SuR/Q=;
	b=ajmicgScjA8CGqiU1z3oqtxsc8VASLChSAoS5vTIhdeOgMt0U6KJJGYTKQJ+xB5XQY
	6u4Py21vUaw9Nog3FQ/yCu202P5PIT2rMauj5RNH8x2cdUu3oxKgq/pVf59E9kInXuD0
	Od1P9urYhA/tkY7nqH110WUm2ksiCX39lhHF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yZKYQT7WMpwSTtVZT25xci5bHCwyOTot6RL5r5SuR/Q=;
	b=R/yWwA51JV/tA3YnYq4JRmMgz6hzS516Gvhq5gmnQRsqYgRup/ZeoN69uSIVhaZhx1
	D0sv+fk6ztbO3flyqH0o3lOjrDffXBqpe8cnoAJK2iBvrpo4tDbx85HnxAgFHpe5xccu
	qAmimkiKNVnVJm71DnhgA4i8LOoJw0GzSW3hEH+EAFlVwZ55EohwEoiyr2oAYKiEZTUI
	dDbbxANXs2bf+mJ+zVm9NuHP7jtgJhrFXjN8aF2QNR8K+TsRMyIDbkXlsoTIHE9kWgJL
	FCKjrmH9dRVmwCRAgDxkaw2fk74qkJOVMAHh687nNU1qB2FC6eHza9kB7K1NeJ2NCMiQ
	8oPw==
X-Gm-Message-State: APt69E3p8T7v2Wt8DPJyXMVIaoS/6zKZkUr/t7SifcRSf7uoN1yplgDv
	vPeUM3Ltpk7BR8sW7ybfGWWQ1+5Tdl8=
X-Google-Smtp-Source: ADUXVKIhAlo1I9po0BXd0aiV99oZ7nlyKJbezrUYxESm0NLAPqezkQmjBdXlxkw0VrgWqT8AEsiTWg==
X-Received: by 2002:a2e:2d11:: with SMTP id
	t17-v6mr1451924ljt.145.1529479023834; 
	Wed, 20 Jun 2018 00:17:03 -0700 (PDT)
Received: from localhost (c-2c3d70d5.07-21-73746f28.bbcust.telenor.se.
	[213.112.61.44]) by smtp.gmail.com with ESMTPSA id
	i68-v6sm281051lfl.3.2018.06.20.00.17.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Jun 2018 00:17:02 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 09:16:57 +0200
Message-Id: <20180620071657.8258-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] iproute2: upgrade to release 4.17
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
X-List-Received-Date: Wed, 20 Jun 2018 07:17:04 -0000

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 meta/recipes-connectivity/iproute2/iproute2.inc               | 2 +-
 .../iproute2/{iproute2_4.16.0.bb => iproute2_4.17.0.bb}       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.16.0.bb => iproute2_4.17.0.bb} (72%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 4fbfec6f08a9..b283589063f9 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
 
-DEPENDS = "flex-native bison-native iptables elfutils"
+DEPENDS = "flex-native bison-native iptables elfutils libcap"
 
 inherit update-alternatives bash-completion pkgconfig
 
diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.16.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.17.0.bb
similarity index 72%
rename from meta/recipes-connectivity/iproute2/iproute2_4.16.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.17.0.bb
index 4b0e893744b1..12812b036bb1 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.16.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.17.0.bb
@@ -6,8 +6,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-ip-Remove-unneed-header.patch \
           "
 
-SRC_URI[md5sum] = "1f12a70d767ef77ffa2d1a0c4ce48f1a"
-SRC_URI[sha256sum] = "0c5c24020fd7349fe25728c5edee9fb6a1bc8a38f08e23be5c57a6301e55ee0a"
+SRC_URI[md5sum] = "6f3a87fe2d97c28214fc2faab2c257d6"
+SRC_URI[sha256sum] = "6fa991b092315887775b9e47dc6a89af7ae09dd3ad4ccff754d055c566b4be6e"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.17.1


