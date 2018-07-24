Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 52E1371A0C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:39:05 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id b17-v6so484882pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NuPxWwKYKTUUBvEZz3QnreRQbuA8pfpePDcrQ9yQ2/c=;
	b=AwwFe7uvdxjrRNMh25qYlHMQ/0Z06cY1dMW42D2XpLJpcmdFWq/288SKgVN0o5OaE6
	g1BQt6KfBsBNICHR8/iHr9f/uPVO6wETaZaRF9wsivRYvDPfmdbARCF0rapfbqkZe3Lg
	SowBmfwMYuGl2AiQGM00w37FlIPOO52PNEgexnAt+QGb7aDVij33OAZLzspw3WF7B++N
	Siqysvi/vWaXQKN0NAzotaiPoOh/t/50CutPBZ72AGedcLt9dHu29LLzeqzBAcupXcPS
	J9UXx1C3GukZEZnp5t41KYHJgMu6N4BXlk9W22rbid3ebDTFNeJTumdrtnOqcJI9sad0
	8VsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NuPxWwKYKTUUBvEZz3QnreRQbuA8pfpePDcrQ9yQ2/c=;
	b=ljt4nteJZa4XB3SigJPn8uc6lTcbe3Ezlu9bDVr6E9yaf5YTCIol9TrjOG1QP/Y8PW
	okkN+zdaYvc41KQ+LnRyk7rFDOcd+PDIL8bHB9oyBMa3GXJTOBsef/AXJIGiPxrstou4
	d5UH3fgIGuMDmaCiRZjobLXuyzRsviHp7vdZ34yDdIi42aN7PzOhLNQBnlnT0h1krTvU
	/t0Tk3Ls/Ez42Pl93cFkCxrdsAphwLkLMiDp90+yJplXBPV4NyJk3EEnwObmO85nrgHC
	vsENiJ4qbGZghJv4VPZqw55QJ0l3WkAs3HPNXuHTlWmpz1yzoHcLfy4LqsXD19l323vx
	GWLA==
X-Gm-Message-State: AOUpUlGgiJf6B1UF7A8Ruo2iF3yCopuXAs6Biu/LzWLxFMzur8+WMgQw
	J3BCkMkUv7AvJ5QwmDSQ1JgMk9Tr
X-Google-Smtp-Source: AAOMgpeFMDE+qHJi2jya+ZxqYczBsXIJcffHLiXJHYeSnI1uolLg1RMoQfu6xxDwfGBtW4qevFYdFg==
X-Received: by 2002:a62:25c5:: with SMTP id
	l188-v6mr15691706pfl.179.1532399946379; 
	Mon, 23 Jul 2018 19:39:06 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y132-v6sm14746314pfb.91.2018.07.23.19.39.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jul 2018 19:39:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 19:38:49 -0700
Message-Id: <1532399935-32296-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
References: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/9] openssl_1.0: drop curly brackets from shell local variables
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
X-List-Received-Date: Tue, 24 Jul 2018 02:39:05 -0000

Make clear distinction between local variables and bitbake variables.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 7f32d09..9bc9e64 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -208,14 +208,14 @@ do_configure () {
 		useprefix=/
 	fi
 	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
-	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=${libdirleaf} $target
+	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=$libdirleaf $target
 }
 
 do_compile_prepend_class-target () {
 	sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
 	oe_runmake depend
 	cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
-	oe_runmake CC_INFO="${cc_sanitized}"
+	oe_runmake CC_INFO="$cc_sanitized"
 }
 
 do_compile () {
-- 
1.9.1


