Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 443AD7920E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 19:25:51 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id b90-v6so5193972plb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 12:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LdLbrpmH32q3qj8mCPCakUtrLk79dx+UxclS3WTAw3o=;
	b=B/qBjDAySMuXjFVgtMbW+vZvc4p2HYFPDPWz6KXfmbCNfLjjjkxRG6e43Si+mLFqYk
	BuyJ5Ai5QAdM9AJMaypQM+gTDciAT7AYE6i2HDTiFvL94J2Dd9tyNTejNH8ciKWfdwCf
	usNN8PJsWUk0ZJ/ACgoxYKCYptX/d9jOzbDS/WedVi8qKiqQVcMkpFJGI5Jlg8ajzoj6
	eBX4HTreK9Vszs6IBADQwe7Zl+U9oF4rIOZOWvZKZLEBPHBlgVzZD9BpJsU8YId5L9r3
	ovjoyGtD4whXmMvSbySfAJcFc9p77ZCc5OXPaDn3NC8Xej0o3E8QuMmsAq+Im2ktJR/o
	ZUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LdLbrpmH32q3qj8mCPCakUtrLk79dx+UxclS3WTAw3o=;
	b=OrGt0EP+SGJSVRz7nfmN2erOPPH9RBmGjmEC0IFQhLshaOUXHCyNeFRGLwgMoUSxu9
	Pphu/VZM4MgWQaSE54QRwCGkVr+LP8tGb9vVQQY6L8eq8wxxH/khrPAJL7z2hp7WRSlI
	+OYlkKxLjdmXf6icmghjdp1ZUYyaOIWk7iY1HzyOtghyPN/28k7/SMhLUN3JJbZx1BEh
	CV5VRV2ZbZYq7gSrRR4tp59qCIE+Sk00MxwupETss4sFxr/JsWIOsNq4UefXFa6QMLCb
	zHfnKtwO3p1r6A74ZN7wDChEf+t6+wp7S3tZ8jUSPgK/69CFUI9vgrhtaYhd/8PmstPw
	C2Hw==
X-Gm-Message-State: AOUpUlGI6a8AhI4a6xCMahIbAlQ/+nuqo6J2heCH2t8jo8D73g9/0Wb0
	JbPfoDdnuFJNPfxOKRh82rqsU8wu
X-Google-Smtp-Source: AA+uWPx/WtTYlm5nlHjp8Z2YYTN2nrzz9OgSrBbl0ihSGLnoSDviCyf6uVWhV8+zCY3hxaQVEVLM3w==
X-Received: by 2002:a17:902:e18e:: with SMTP id
	cd14-v6mr3078364plb.305.1534620352053; 
	Sat, 18 Aug 2018 12:25:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	k64-v6sm6723068pgd.47.2018.08.18.12.25.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 12:25:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2018 12:25:38 -0700
Message-Id: <e7040e978922b487de1eab2e4ba35fe5d04cea16.1534620189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534620189.git.raj.khem@gmail.com>
References: <cover.1534620189.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] mesa: Define YOCTO_ALTERNATE_MULTILIB_NAME to consider multilib names
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
X-List-Received-Date: Sat, 18 Aug 2018 19:25:51 -0000

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


