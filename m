Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 03D296022F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 10:11:36 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id u13-v6so1561687wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 02:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=mbZqvVbhaTtMmPrUGR4luEf2EdMQMsU01DN3Vyocv5Q=;
	b=SPdgOOea6beoF2jIl5unHASRhIZ98mJmfqTnCz6YT9d3mTiwz48lqHWjHTyaSO0FiP
	LzOktZ4zh5PRor7fzmrEeA3d3/NA0TFjvTdAokAk4FIku2uzGz6otnlgFofNJIBh/oUB
	/fJu793waFFUaq5vI6Ml/5SJPuH8b0YL65yao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mbZqvVbhaTtMmPrUGR4luEf2EdMQMsU01DN3Vyocv5Q=;
	b=L7JiBrPZgfm4ia+PTr0zIDZUap8kgXVbNGchcQwzgqO2VRY/eu8lupKPk4wkapfx6F
	ivuPeVsVD83Lrs+atvjA96utUdoDo/MVciNcsFH2nwyfe1Rr9fc4Eg+6UJkFsvPJUKVO
	ZxVNJ5UUoZ141xoGHlRthI3lqbETrkEZJv0lb119YeqUSVBOKFMo+Gs09fcrANPDpS/P
	j2tN6Re1ltWGFiWglyVDeIu4aGGIgelWzw9tAAsq2PR98XGxsedl/lERSHU0exZhXyoC
	r751Soj1MsL330JRbjLQWCg0UnxCCGMl7Y1f6GlW+gYd6cIB5E7QtaJDW4ry/pLTNfzf
	Ronw==
X-Gm-Message-State: AGRZ1gJ6AaICL8iVTtEdtVpyE+SjAZVOhotjmV1gH26rBAqMz9bzi1cr
	2SRHs3q3/PWZqX20kCmMPYrUPmkNEXo=
X-Google-Smtp-Source: AJdET5ews65drPVoBhikNWbQL26HMMQcYsl+s2w6Jql4R2wpHuCxC610vZCOxMR1zShhn+kGpZxJ1w==
X-Received: by 2002:a1c:4406:: with SMTP id r6mr1594130wma.151.1542708697154; 
	Tue, 20 Nov 2018 02:11:37 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a4-v6sm35724121wrr.71.2018.11.20.02.11.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 02:11:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 10:11:35 +0000
Message-Id: <20181120101135.12591-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] apt: Improve SRC_URI
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
X-List-Received-Date: Tue, 20 Nov 2018 10:11:37 -0000

Use PV and BPN in SRC_URI as a minor improvement.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/apt/apt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 50f22c89923..bff59e521ad 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -2,7 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/apt/1.2.24/${BPN}_${PV}.tar.xz \
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${BPN}/${PV}/${BPN}_${PV}.tar.xz \
            file://use-host.patch \
            file://makerace.patch \
            file://no-nls-dpkg.patch \
-- 
2.17.1


