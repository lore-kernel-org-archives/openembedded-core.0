Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id A942F783AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:22 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id n7so4162652iob.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UILp/DtFFSe9G4yDi0ApVjLFwMjLbFWxQ8Nx577vi1g=;
	b=KSJqTiuORUECMCRpDmoKysP+izZ1VWDogZmg3My8Wofog3tQaK+DV4cvWSCfusR6So
	AmpPoS0I5tLQhtTE81wWdkzdjp+ExkC71L23EcDHp3lxIv51Sni43MJnsAnpDeXLH+29
	f7fj0ZlTaUeRrMtSiPLL5qm+Axwvq2tHbBRM09VPU1p7AGHPWmxlX/wLR07g72C9eS09
	DVTh9x7Imf7qmqB/ud4YVQF/JqSiiPa8tdKNKDJIMx/yCdEbGnZ3bD5XQTGaFEya+itK
	9HAfjr/YbnO8WgivGbgVGjuwEMCym4kF5g/1KIdeWTowqx0SnBFzJ9Qg/r66xoWMg65I
	y3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UILp/DtFFSe9G4yDi0ApVjLFwMjLbFWxQ8Nx577vi1g=;
	b=lWZOZRYGS8oQ+2j7Ex9PSzaOicmtuVrY5VJhnZqqNU2qtHP2vJ7Yt88YvXO1qFj2gG
	RP7v5zXEKb2Fal/Ns6O+ySdjRO471/ifnQHqg0sdpl8luPP15SqD41vCq6TBd/FTZ4iI
	pmncFtq5yqjfH2OdSOMzNYQkPE8QnBBLAodRZxP8B0DswMWzxHELJr7XCH8TPPkFJeQ4
	EQOe8sscSs3e32rt7l9vH2SpsNYeYqWLpyfR4TKp5ovxPNeoLb2iyUllZULNvJZnJyn5
	iWABIYqtoRpNLHckm8d7LEH70wThLITwHr//NHPHxW+G2ldFpt17T2YwF0NJVT5Y3dbb
	wz0A==
X-Gm-Message-State: APf1xPAHtQppf9wRR5RATNw2PDfKyDW/uEgtwEbE4uZRDFS8XMCpvBXz
	UokDT+VdzOOwSv5mFN8l7qJT9Y3Y
X-Google-Smtp-Source: AH8x224xZs87XX3FNqgVVeB1+8qLmFVnxbDzRM6xRv2IwzRRZXUjdGsIkThqLrcCRSRwsMCaP4EMGw==
X-Received: by 10.107.198.86 with SMTP id w83mr4722233iof.75.1517954603537;
	Tue, 06 Feb 2018 14:03:23 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:29 -0600
Message-Id: <a7523ceb9a1a6153d3dbff31ee6a131175b879fc.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 10/14] icecc-create-env: Add support for nativesdk
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:22 -0000

icecc-create-env can now be built as a nativesdk recipe, allowing the
script to be included as part of an SDK

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../{icecc-create-env-native_0.1.bb => icecc-create-env_0.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/icecc-create-env/{icecc-create-env-native_0.1.bb => icecc-create-env_0.1.bb} (98%)

diff --git a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
similarity index 98%
rename from meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
rename to meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
index f8f4aef3923..053945ebbc6 100644
--- a/meta/recipes-devtools/icecc-create-env/icecc-create-env-native_0.1.bb
+++ b/meta/recipes-devtools/icecc-create-env/icecc-create-env_0.1.bb
@@ -12,8 +12,6 @@ PR = "r2"
 DEPENDS = ""
 INHIBIT_DEFAULT_DEPS = "1"
 
-inherit native
-
 # This is needed, because otherwise there is dependency loop from quilt-native
 # Dependency loop #1 found:
 #  Task 10907 (meta/recipes-devtools/quilt/quilt-native_0.60.bb, do_install) (dependent Tasks ['quilt-native, do_compile'])
@@ -34,3 +32,5 @@ do_install() {
     install -d ${D}/${bindir}
     install -m 0755 ${WORKDIR}/icecc-create-env ${D}/${bindir}
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.3


