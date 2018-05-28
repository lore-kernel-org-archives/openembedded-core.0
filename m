Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id DC93D74814
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 15:58:34 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id q22-v6so6013730pff.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 08:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R97CogIa24/7UpdUKhE3ifhhLZfJLLa0BxqeWttH4xo=;
	b=NDDlmD8+HXK1lyqSf3xIw+WcgVxrzJYnLodrX/32weo4qFcE6w7hkVJDTdMQXtyQ6K
	REcGZEkJXe6Xr6z0VzXAX6MhaxjAngOD1nX48r0OG6IJlohdlnIX4l5EOTA57HW+y4IZ
	dGQJRm00DHpfBEQr/KmjY3JikjTgTkmmyhw5SiL9eel/7nswoFJteWJZ6DAEWlYF5ICA
	oZlqh4PnURyIwvan3BV/xaC5+UyQ9y76ZWPh5Pm/isBF5ONPGRgq17Tikqc8fok98NEU
	v9waKNNJWAD+NjtoENQdoMh2KxT9WMTbdpj13YBASFKRgZj2+8UV2JPeDqx0O72LPc3o
	Bp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=R97CogIa24/7UpdUKhE3ifhhLZfJLLa0BxqeWttH4xo=;
	b=D64L98WG8u1Ly3WcObLnGBl3mL6jkCqxhqQgYrqaJPVvccu+F65gX2TE3YXsyPsDQ/
	cAusZJH0OeBJlLXh5OeNv1TNJjTCiF3qwv2ZAWDTU9zmJcX/ODBBDZCn9WoFaAcS27YJ
	yfd/qTPAIsad0K6nGhTWET/StoizBQGlk3Uj4y1U3e1H2S1BeKzanmK2ybxJFKwWW/EI
	7H9recnQT+39hMJvyTSttpr3fhjk3r2+82ATiH/Vd8UV3TgBm8psa6fVMypVPk0BxS25
	UEBE37A+6Tst+lkLtGT7n/LslbaxAA8DB8EeK+4Jxzb6RQ/Sha+q7uUByI9vGkuslK20
	NAqg==
X-Gm-Message-State: ALKqPwdEclSYHlkCu7qTpCkM0Ymomylm2IzEbaLnkiMLcbFj6Em1Dl7e
	V77rMhj+xLCUhFmm9Zj1CQTFCA==
X-Google-Smtp-Source: ADUXVKJJ3KtFPahOQsi5RCgBF9FbSubjSpoVFuY/Mtv+i5/4YYisybqf2u67ih8/rrBXR0iLar2OOQ==
X-Received: by 2002:a63:ae43:: with SMTP id e3-v6mr616217pgp.181.1527523115286;
	Mon, 28 May 2018 08:58:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm63041892pfa.107.2018.05.28.08.58.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 08:58:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2018 08:58:33 -0700
Message-Id: <20180528155833.24224-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528155833.24224-1-raj.khem@gmail.com>
References: <20180528155833.24224-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] rpcsvc-proto: Update to 1.4
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
X-List-Received-Date: Mon, 28 May 2018 15:58:35 -0000

Bring in an important fix
https://bugzilla.redhat.com/show_bug.cgi?id=1559181

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb  |  4 ++--
 .../0001-Use-cross-compiled-rpcgen.patch            | 13 +++++--------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index fdeafe283a..cb5b288c48 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0daaf958d5531ab86169ec6e275e1517"
 SECTION = "libs"
 DEPENDS += "rpcsvc-proto-native"
 
-PV = "1.3.1+git${SRCPV}"
+PV = "1.4+git${SRCPV}"
 
-SRCREV = "abcf24a09665b3def0f54c87d2acd4796de5d83a"
+SRCREV = "9bc3b5b785723cfff459b0c01b39d87d4bed975c"
 
 SRC_URI = "git://github.com/thkukuk/${BPN} \
            file://0001-Use-cross-compiled-rpcgen.patch \
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
index 4ee4940295..208974004b 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
@@ -10,17 +10,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  rpcsvc/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/rpcsvc/Makefile.am b/rpcsvc/Makefile.am
-index 83867c0..4753242 100644
---- a/rpcsvc/Makefile.am
-+++ b/rpcsvc/Makefile.am
-@@ -12,5 +12,5 @@ nodist_rpcsvc_HEADERS = klm_prot.h nlm_prot.h rstat.h spray.h \
+Index: git/rpcsvc/Makefile.am
+===================================================================
+--- git.orig/rpcsvc/Makefile.am
++++ git/rpcsvc/Makefile.am
+@@ -12,5 +12,5 @@ nodist_rpcsvc_HEADERS = klm_prot.h nlm_p
  	nfs_prot.h rquota.h sm_inter.h
  
  %.h: %.x
 -	$(top_builddir)/rpcgen/rpcgen -h -o $@ $<
 +	rpcgen -h -o $@ $<
  
--- 
-2.17.0
-
-- 
2.17.0


