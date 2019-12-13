Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id DF93D7F404
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 22:03:11 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id p8so648310iln.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 14:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jeOm6UAIZNEHcxafaUDzjtDztj/YJwP53BzhXBnGkXY=;
	b=ObG5BJJAAIote2CwMC2pzfWSnSdrrE2fhyyrAeRAcNYzsCCRosLM/OAgrzN4qqjbyI
	w9ywM68+HaT1CRQRycBG/kd2I5955W3yh2CxZSo6AcwVdYfuq3fxsKDcrulNaMAbadUf
	k2OMEIOTY9yZtOtNiPjpxrFiwMYooXW0is5SzOwH7Ru3a4ErVyCebddue5fcOAfyo746
	/D2OHSre9YjxJpDjTfi9y2JuO9n85M+r1b+p3ALg3/PBvBOrd66RJgOdMDizEvwl3sXI
	MoOwqKQ3ZhLBqcj+L7VUhre+HE7raYyHtkv86bYjgIlVudhZHKN9KktNWdniWsr6Tw+Q
	qqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jeOm6UAIZNEHcxafaUDzjtDztj/YJwP53BzhXBnGkXY=;
	b=kp5Un7c4Z/t6fzlU9Sriv2jd9WQilhbz6ZEg8+Mg6+Rih/CYSA1GvyHAesMwSrndlr
	HQx0tZa8qxOr7bfJeKc2+cecurjDlPJn9wKiUtUTTvX07LKcsZpCRxEXzt4ru2o34KUP
	5oxOlkmg82OVufgkAr314jBXWwXb8DSei68hnzxf9erFJPQQfkMfptQZjz98VXNrZwpJ
	mf7axboC2ecYc0f7+qyn1GVvBOkEp7C/Y55eWuynbMSGX0j1wGklLsBgXSiCMYvRW2TL
	t5UeD/FXaLxD1u+yi3eIX16gn5enp3uj/8O3zXcGXltPAdSjvuXqx6QTYuHVKxX04ANc
	2Png==
X-Gm-Message-State: APjAAAVUNbSlQn4XHo9RMIxdubiQGntTh822QOjU/Ya98QqmKgHNehuQ
	CYDW1MQvvFpjUp0Tz58tMZarSYPhvEA=
X-Google-Smtp-Source: APXvYqz6qtcTB98q0g5vCBS9sCt03LLyJIv6rCH5r6MhfMORwVl7/9ObB+jx266dcd+6j5ntvR1qrg==
X-Received: by 2002:a92:cd51:: with SMTP id v17mr1488677ilq.193.1576274592647; 
	Fri, 13 Dec 2019 14:03:12 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id k17sm682154ioh.64.2019.12.13.14.03.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Dec 2019 14:03:11 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2019 16:03:09 -0600
Message-Id: <20191213220309.3964324-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] tune-cortexa72-cortexa53: Add tune
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
X-List-Received-Date: Fri, 13 Dec 2019 22:03:12 -0000
Content-Transfer-Encoding: 8bit

Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE SoCs, e.g.  Rockchip
RK3399

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../include/tune-cortexa72-cortexa53.inc       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc

diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
new file mode 100644
index 00000000000..30e49d20769
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -0,0 +1,18 @@
+DEFAULTTUNE ?= "cortexa72-cortexa53"
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", " -march=armv8-a", "" ,d)}"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mtune=cortex-a72.cortex-a53", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa72-cortexa53"
+ARMPKGARCH_tune-cortexa72-cortexa53 = "cortexa72-cortexa53"
+TUNE_FEATURES_tune-cortexa72-cortexa53 = "${TUNE_FEATURES_tune-aarch64} cortexa72-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa72-cortexa53"
+BASE_LIB_tune-cortexa72-cortexa53 = "lib64"
-- 
2.23.0


