Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id E790A7918C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 00:43:38 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id h17-v6so125379pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 17:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1BIGnmHS56G/XCIrZdQJUFLT/jRNPk6WOD2xQGOqtq4=;
	b=URwYqhrOqJG/Dy3WKA7KAd6pdWZbbnlcWAIWtYNWY57+JFmd9ycJRLCoGb/I+JxPY/
	E40QRtR0DppK20L6M0gPUMrV3vfwRk6NYbg4Jjg3cFtHiGAa8DAwwx/Xbg7UvHoI5qyM
	ekxTP4hymrJ8k5+/8damu9WGBYHwAOb7vzx+OLUVR8VoBLVmyZMLfxUqBxjIl5kRKaOj
	vXSu2iWDNRl5jCHgNLr2OHpKfAZsSbqG8ue+2WW8/iUN91ZhrLq8WFvyPq1U2iXNsX8o
	DXxgyzhBHKN1V+4C2kTUXXyk14ZB7aVreYS2sD9dIzpWJhtQ5dtJ2rutl7Ifd3dThypO
	zmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1BIGnmHS56G/XCIrZdQJUFLT/jRNPk6WOD2xQGOqtq4=;
	b=Kxpy2J5wiA6o0hxOC378A3hGnPPBhRxL0acLiW7sUeXA9Cttr1TNXpO0XoiTBpJrL6
	u3LrOALt14cXuwdu1aGghzP5aH9Di5JvH52fSepmCgHfDMZmDxPhH2Ac69BP2ymgh0h8
	tI21iG1KpqKl0EOKs1Buk3rlv6sqqvA/tyvzhJnRs+twUd9YFoerusFS8cNRIvmB55et
	L1GzgqKzPNeucg7QQPqFaG0NCK9sWUmaGRh54uQLPtJd6PJPxcUHCuU2kDQy3B7SusOq
	whCSZVBTeXVCwBc39Whm9TtBEn/MUXAymITd0pXEUfmIVj/pC7yF3FTpDNI+3heCDFmw
	TaGw==
X-Gm-Message-State: AOUpUlEZYZkf+V1GPeatnLcG3grZ7RUVbYxVhKPhw+m0ot2R/qDAnorE
	kNkmhWSfKkcQMuXLQvZU/hMp/7wu
X-Google-Smtp-Source: AA+uWPzuoo/N8Nb+H77DuQNdmDVCPSfyCvX3PP56laW7Lu1Gb7tkS3u8Ma9VWzoVjThIGxWy1hk6tA==
X-Received: by 2002:a63:3cc:: with SMTP id
	195-v6mr22114689pgd.229.1534898619885; 
	Tue, 21 Aug 2018 17:43:39 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h24-v6sm176217pgj.10.2018.08.21.17.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Aug 2018 17:43:39 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 17:43:29 -0700
Message-Id: <1534898610-15319-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534898610-15319-1-git-send-email-armccurdy@gmail.com>
References: <1534898610-15319-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] gnutls: drop obsolete configure.ac patch
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
X-List-Received-Date: Wed, 22 Aug 2018 00:43:39 -0000

From gnutls 3.5.8 onwards, the code in configure.ac has been passing
"basename $i" to sed, rather than "echo $i". Since the full ${srcdir}
path is not being processed, there's no risk of unexpected matches.

  https://gitlab.com/armcc/gnutls/commit/478179316bc815e1ad518ae318f46e94a13b0e1f

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gnutls/0001-configure.ac-fix-sed-command.patch | 29 ----------------------
 meta/recipes-support/gnutls/gnutls_3.6.3.bb        |  1 -
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch b/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
deleted file mode 100644
index b6e7bc9..0000000
--- a/meta/recipes-support/gnutls/gnutls/0001-configure.ac-fix-sed-command.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From eaab55bb6d48643163eebbc9ca575a9ca2a8e03f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 21 Feb 2017 17:10:07 +0200
-Subject: [PATCH] configure.ac: fix sed command
-
-The "sed 's/.bak//g'" matchs "bitbake", which would cause strange errors
-when the S contains "bitbake", fix to "sed 's/\.bak$//'`"
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: gnutls-3.5.16/configure.ac
-===================================================================
---- gnutls-3.5.16.orig/configure.ac
-+++ gnutls-3.5.16/configure.ac
-@@ -955,7 +955,7 @@ YEAR=`date +%Y`
- AC_SUBST([YEAR], $YEAR)
- 
- for i in ${srcdir}/src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do
--	nam=$(basename $i|sed 's/.bak//g')
-+	nam=$(basename $i|sed 's/\.bak$//')
- 	if test "$create_libopts_links" = "yes";then
- 		rm -f "src/$nam.stamp"
- 		rm -f "src/$nam"
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.3.bb b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
index dcb211e..629fcd8 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
@@ -18,7 +18,6 @@ DEPENDS_append_libc-musl = " argp-standalone"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
-           file://0001-configure.ac-fix-sed-command.patch \
            file://arm_eabi.patch \
 "
 
-- 
1.9.1


