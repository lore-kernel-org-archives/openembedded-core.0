Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id C5E7679224
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 17:23:53 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id g1-v6so5958323plo.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 10:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LdLbrpmH32q3qj8mCPCakUtrLk79dx+UxclS3WTAw3o=;
	b=WBU6VzHjk9umbIPHr6YajnIZMQumzUaWTg3Rw/vVfsGe+hAVlKXTkxQ7JQ+ZXLzKVj
	7DXmyikKYQ8WrnmutTX8ovRMX0T2h34EJ1AlE3OJEOO5KSScWPcF/Wd6btOT/v0uDPCW
	CKtOSGeQStbAF/UqwCoKyJ5xksvZN+QO8mvWLxXJ+pwF58bGP/oTxx+HxRKzqbdpFCmB
	XG6/yIaJqa2uAlZhaIBlTCGjrYymHkIg6LFApBW/qkeniWrJOkPjS8AZ/E1ZyBjjAvj6
	lm/dCVaq3/XxDdCfKdppYU/b2YV/cbKxTbxC6oxgTs4b/OGG6PoYZReP9qOHTyRKaaNe
	X8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LdLbrpmH32q3qj8mCPCakUtrLk79dx+UxclS3WTAw3o=;
	b=cgs2ndAO2OIqOaciBr3RJBG38XY77+whknQKZeMX6paSp/u670cGGRDmXD6P/kI4vp
	3PxYW946lGr1MZIlenXnPabwpvHqPso2tR0W9nX09Riouto2OG/Dss8EE04o/MYavKS0
	EWujuXudMi1pVEjOfYBqttAEDHKAAT0gszFoIDBINiOG40AwfDjyB4vyR4RHAeVlU1C0
	SHMD2GxXkEe5TekhHn9u6S3dpmEc2pAzw9/blXbj2VFCkk2sFazOinXPLqN2Nt2TAJF3
	+BQUUCqSpKPLnUXybD7kpt24WjyHyUjhRy9R+9T0IHZE5o8dwmA4J+jXDghu+RTV2zk2
	NfqA==
X-Gm-Message-State: AOUpUlGkMQCWwcvBh+XT8xS2JaaPNp2wIejaoxPv61Fot01Dk7lnECyb
	Pc+zrooRq5BxWsFelLqgUjhKWhmE
X-Google-Smtp-Source: AA+uWPz3EYehqHoN8uLztwgrqRUkX6ktH9biZYdtA7lNbwaKS59rW9l0qHG1FQUOR9sjuZ/jXZPFjg==
X-Received: by 2002:a17:902:b205:: with SMTP id
	t5-v6mr41432174plr.220.1534699434645; 
	Sun, 19 Aug 2018 10:23:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm8293466pgr.59.2018.08.19.10.23.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 10:23:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 10:23:38 -0700
Message-Id: <e8269d2ff135b857b9fdcd045854ea7282ba95ba.1534699224.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534699224.git.raj.khem@gmail.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
Subject: [PATCH 6/9] mesa: Define YOCTO_ALTERNATE_MULTILIB_NAME to consider multilib names
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
X-List-Received-Date: Sun, 19 Aug 2018 17:23:53 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2671d4de4d..dd626d9f00 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -34,6 +34,7 @@ PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
 
 export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
 export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
+export YOCTO_ALTERNATE_MULTILIB_NAME = "${base_libdir}"
 EXTRA_OECONF = "--enable-shared-glapi \
                 --disable-opencl \
                 --enable-glx-read-only-text \
-- 
2.18.0


