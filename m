Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 82D9C74D81
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:24 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g20-v6so9771205pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YTxpdLn2vQ9esdiZmnedYD8r5iDWL4RZaBQBahT/vIo=;
	b=ZIXSfQuqr/p6V6LVnp1ty4prSpO1fyNEGBzbzAM/n17DUjI/zfoTzLvo490AqYGkJB
	GUrAmAq2PiSKC6gOVSn/RrFAYWGR6EFAgg2sKsTeRXZ3bk9SRVEe8hHXHkmSt7lBa0Tp
	ZxLeU9W6czH3imVlJd7zDhgE3q52eV3tIrJL2Vw0vs3RG7dqpV+j1fdpamDtW+iOq2MT
	XYU7CNmlUrWJelbejywBl0i89g6H/yvbsdih3HusOUeD7keMTol7dV3CNxGz5L1RM/VP
	tQ0GMo0/uFVolESM6Kf+76TAgauIJp3Z7ugiSt8d4wUvD5hPrjaVTMygtpxqCqhR7+Gg
	MlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YTxpdLn2vQ9esdiZmnedYD8r5iDWL4RZaBQBahT/vIo=;
	b=WqFQLVMO3WSjcPIqS9c33tqcVCZj2BAmgLsZRUzsIFfIXgwtwVgwWctFtWIurG5O93
	5NDHtTwH68KNrJ8VXV8g0NcNcyDq4nhHabr56aNbMo1Lvat2lvp58++H1YhtdGiFE4OB
	sQ0OgKpVktyE5cPg2scoCsm/4AJ9ypAE3qqi9jjV5JxjzKCzMpOBb/7ISw4jA6+wCfJf
	qdlpCZieee31BzkiDku84UUle5AYUBnrwYJ1pIZ8o7WzQgAGNQWVJaGN8L45YEPpNXEq
	Q7BHiD7f9pJt8Ut0taOMsNzadP/AAlseEqGtm2wgki9sYVM9WT898IWTqi2YALpCZuFg
	svcw==
X-Gm-Message-State: ALQs6tDUCWGXubN25tOuDKEJinsmoNiZY2kId3Me2KLgtgXEJYS/wlVF
	fvQXcnrN3KegMoxnfTMI7Ye+6g==
X-Google-Smtp-Source: AB8JxZqaWbR3jxje2b6c1d9AwAx6Y0OXt0s6QndYk+RP8bgV8eCKjKzaXOYxHbRRUrML/G3o70Vs/g==
X-Received: by 10.98.224.76 with SMTP id f73mr28808373pfh.88.1525479265444;
	Fri, 04 May 2018 17:14:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:13:56 -0700
Message-Id: <cb414f94c03065d9eeaecc357681acc47323fb8f.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 02/27] musl: Depend on libssp-nonshared
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
X-List-Received-Date: Sat, 05 May 2018 00:14:25 -0000

libssp-nonshared is required on musl since
it does not implement the gcc runtime piece of
libssp, which actually it a gcc optimization to
reach to __stack_chk_fail

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 34190e530e..01fec69aeb 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -22,6 +22,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            libgcc-initial \
            linux-libc-headers \
            bsd-headers \
+           libssp-nonshared \
           "
 
 export CROSS_COMPILE="${TARGET_PREFIX}"
@@ -65,7 +66,7 @@ do_install() {
 	done
 }
 
-RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev"
+RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
 
-- 
2.17.0


