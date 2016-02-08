Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 42EBD758DB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 16:11:19 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id g62so139423406wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=E2U7/SnDwmNoo+pwWl5NYSjU5Ia47/eKGetKeVqjgJc=;
	b=GCV4t9j9lL1obRXV9+XLFqBLrW3djdUJRmGiRvLPaWRzEsx1+hyYsfWz5HXwIOIcaR
	8+GxeXP8Sco0n1Zt7bK5rqtcs5JE7C+AiaeVBcwlDU0TYu4CSwz96XJ4tx7upLSl8iuG
	vLx/ubIJmgXgJd11EzRirMjy4EkMJnmrNI+XZa83X2WrF8x9wlii47Gn0nXToKecreRn
	KPIUASjgsbUhhHG5D0PNewgXx0jD+8OkXB66ukTxPS4xLi8Zyteg6EFqbp/hQcURgXny
	WDSvKOymhQnFJ+ihWH0nf+9Ff/pEGUDWuZk056F2Kxm86HBpPWH53/qU/oWkkazjlqnp
	Nx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=E2U7/SnDwmNoo+pwWl5NYSjU5Ia47/eKGetKeVqjgJc=;
	b=iKYfJyGLbhnmkNt7AeXP/fcw/rnxtfZo+qK5wIw0UEVl8tIBCRMbRH8hiNyEijRIWW
	t65ItaLBMvKyEINUmhZqdOMVnaQKUMsFTP5VRjKW8LQ19Lp8ViiCDhwGA80fT0o1UaH+
	jumqGEHnXJGrrhNQMe+iyz072HDJgvmfmgar77KIXxhDWm97TLSRLGYHg8nmwUzE2pXk
	sdC2mi/IRRYoDaq5ZuUpAH9pFQjmYVTCJVL1N5j8jhY4eCjsdO7IPy4+lyM8YHX0A9OF
	x97//dQj+AmOGtmlOY5+yi5yYDalGC3jHIvjONnEKZR0I662lg3sT6m6pcLLdnGc99Fv
	pTDw==
X-Gm-Message-State: AG10YOQOcG8fFHoDnM89pcnWoxGEfiZWsgftbGENWeEhbRX5wlqBp/vjR8ltYY4oEvXuuc/w
X-Received: by 10.194.104.6 with SMTP id ga6mr28612594wjb.17.1454947880009;
	Mon, 08 Feb 2016 08:11:20 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	uo9sm30391992wjc.49.2016.02.08.08.11.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 08:11:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 16:11:17 +0000
Message-Id: <1454947877-32598-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] uclibc: fetch from master branch not 1.0
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
X-List-Received-Date: Mon, 08 Feb 2016 16:11:22 -0000

The SRC_URI was fetching from the "1.0" branch but the uclibc maintainers appear
to have removed this, presumably because it's synonymous with master as all of
the releases are also on the master branch.

[ YOCTO #9074 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 490dfcb..9f154f2 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -4,7 +4,7 @@ PV = "1.0.11+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
-SRC_URI = "git://uclibc-ng.org/git/uclibc-ng;branch=1.0 \
+SRC_URI = "git://uclibc-ng.org/git/uclibc-ng \
         file://0001-Disable-lrount_tes-function.patch \
         file://uClibc.machine \
         file://uClibc.distro \
-- 
2.7.0


