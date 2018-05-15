Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id CA1D575076
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 00:18:30 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id v7-v6so3388300pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 17:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3HHBUztJszn4ORtouJtxt+T9N1byjX037/KC0v5jnAo=;
	b=NOUzNJy4ECdLZH0km0oV3COfACZ1aatd3Q6xnOWrlGsThayqF8MMAIp4dKnj55KtJu
	/tGqI7N/ElI6kXc+Nx31NfqBAE+SwPf4v1bFFcQr88AYuqMAkYH7Ks1QqPBnEPNZJz5m
	n1CgFYQNkpDEn2q47dykyXsyjayq1hs65dIsdoPcwG7dBYTXmGzSqYNKR3/0A3b+xVCa
	pRLcg1YrkiXYfrwbk5yzobNtJXZRdGPuzfo2sAYXrlr2qPhgOdSgIo0dTNoItLT7ZLc0
	ZArxjapGBBxCcwLe2690gestcl3l8VZDRr4+dZzi1sCuosKPtnjTyiyXTVuhl8oVK9hh
	N6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3HHBUztJszn4ORtouJtxt+T9N1byjX037/KC0v5jnAo=;
	b=OZ0aapJlfr7yo3FRQk2spcR4au4+ldHsPQm2A4/sn5Z1Y3Lvs4CLmeYOeENpIl6afK
	JZRu20Dva0eH29o5067bRtPVaFkaecm9RB2XT+Y6j/QdVqYSwup+yzKx38+UiRdK/jWi
	h8LpT0XU+zvcR8pSscOhKc7MGeqQA9Zs6d0tarn9N0n350I1exbJhv2rS/BSzRIGLZjp
	ymqarRxy00SJv8tUFXrY0dAd8FTujEg+3mX24xRaPcRrOtkigBojqpP9Evmw2KSla0QG
	mUsimHCJMmPGCBKfuYt2j6ajdbSrtx4zRONY0r1GuJQB6p8l0W7jcIFSOX/lCz6U5aGi
	YOSA==
X-Gm-Message-State: ALKqPwclv234Oh9/DRlnIdpq1RR1x+TVkFmkaYvLLr6Q03V+VmeYx4CO
	WkHnacm9sUNsEZjpTnztAeVaRA==
X-Google-Smtp-Source: AB8JxZrO3eIUdn4wqbqp2bKO9dmviHGpFjuxJJUmELFU5CwmRrgNLySNffPBPoemv8xqqG2q+patjg==
X-Received: by 2002:a65:650a:: with SMTP id
	x10-v6mr10006469pgv.169.1526343511353; 
	Mon, 14 May 2018 17:18:31 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h1-v6sm19260236pfg.135.2018.05.14.17.18.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 17:18:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2018 17:18:22 -0700
Message-Id: <1526343502-28278-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v3] bitbake.conf: drop obsolete comment referring to the fail-fast over-ride
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
X-List-Received-Date: Tue, 15 May 2018 00:18:30 -0000

The comment appears to have been accidentally left behind when the
fail-fast over-ride was removed by:

  http://git.openembedded.org/openembedded-core/commit/?id=83ce96f44516c8a4a44c8c0140949256f8422014

Also update comments to refer to bitbake variables as just variables,
rather than environment variables.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 v2: drop references to environment variables
 v3: fix typo in subject (refering -> referring)

 meta/conf/bitbake.conf | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a21b728..b85be1e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -722,19 +722,16 @@ export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 # is a bad idea. Setting a dummy value is better than a ton of anonymous python.
 DISTRO ??= "nodistro"
 DISTRO_NAME ??= "OpenEmbedded"
+
 # Overrides are processed left to right, so the ones that are named later take precedence.
-# You generally want them to go from least to most specific.
-#
-# This means that an envionment variable named '<foo>_arm' overrides an
-# environment variable '<foo>' (when ${TARGET_ARCH} is arm).
-# An environment variable '<foo>_qemuarm' overrides '<foo>' and overrides
-# '<foo>_arm' when ${MACHINE} is 'qemuarm'.
+# You generally want them to go from least to most specific. This means that:
+# A variable '<foo>_arm' overrides a variable '<foo>' when ${TARGET_ARCH} is arm.
+# A variable '<foo>_qemuarm' overrides '<foo>' and overrides '<foo>_arm' when ${MACHINE} is 'qemuarm'.
 # If you use combination ie '<foo>_qemuarm_arm', then '<foo>_qemuarm_arm' will override
 # '<foo>_qemuarm' and then '<foo>' will be overriden with that value from '<foo>_qemuarm'.
 # And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
+# This works for functions as well, they are really just variables.
 #
-# This works for  functions as well, they are really just environment variables.
-# Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
 OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
-- 
1.9.1


