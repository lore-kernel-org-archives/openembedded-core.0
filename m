Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id A34C760234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 15:22:19 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u18so9169967lff.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rQDp6cyuAIJuWHPWfL+dD2aCUwuYOvhQAIJ+r2whjz8=;
	b=ZLA13Jz4hhtxIMAllYF6TibOu6T59Ab93409VQ+D7sbqfd3Av3zxmAckB8N7eQIygF
	GBfphq80wksb4hl1eI1rsjyIq4s8MXrNdz9/lzNWmKiZfSTVt3B007um23QJi3SJTBxm
	8bOhlaqJeekFKekv5luU8T2Yu+OmOfpOg7qiyUkIoHdLQkH6OMSQbWb4XLtSW+Q3cSpV
	j9oHDN3LTx3SEfpFjqDIEw5FSAtLUgoTKK+Lo/qP7k8mpfNu+pM5i8+0Pj0Ldio8Yyfi
	N5Nt1XlH/8NWO+f5Ou/3PrdLq38x3KYWXZFoNuwGQuMREPAvzNGIEr8ddYXURPyIuNkG
	Y7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rQDp6cyuAIJuWHPWfL+dD2aCUwuYOvhQAIJ+r2whjz8=;
	b=XYPoX0gxSBGAev/FaajvUFt+43GxItH8Hjw3J2+V6n2Z7Zc/klT2OLzsQ/XR5BMy0I
	Rh0bjkiHpoglbmWLAMrRwQeycZ5lMUx0v4++tV4LErRh25dyGWCAtpJk/Mk44sG9OVtA
	ZoTTsiagbHUPJTUCG8EZsWtTiCpqCyttvRfrgntENYRl8KuyKUGHq3HUBKLZn5C/VPGV
	F9PIFhxVxp12WCtA7nYGocsnLAmuNwjFsuSICsWnhSeHhnynMMgFD2b+Pp4fu4ygeVxp
	jvchW4VI5sHoVCX01SKNplqMSM/cmLCnFTL5HBxUBDppb/j8ahoA60E+P/ObtFLKWosC
	P6Sw==
X-Gm-Message-State: AGRZ1gK32F1qry1yV3iEJjVz83GspaZCwiXXCUe/BDVCGwvymz6axoGZ
	WSXhmiyfJTQ3N4CcC0f+ZAXaLGVag7Y=
X-Google-Smtp-Source: AJdET5cmp9GtQX1iJV6vpKG1LpwKvDBOgFWGLsJJA/DMC8jAfJRMsxk27N6GTMWNebgmecBQIFPZvg==
X-Received: by 2002:a19:9b50:: with SMTP id d77mr2245719lfe.137.1540912939620; 
	Tue, 30 Oct 2018 08:22:19 -0700 (PDT)
Received: from scout.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	u27-v6sm2587721lfc.36.2018.10.30.08.22.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 08:22:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Oct 2018 16:22:08 +0100
Message-Id: <20181030152208.119322-1-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH] mpfr: fix SRC_URI
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
X-List-Received-Date: Tue, 30 Oct 2018 15:22:21 -0000

mpfr.org is not accessible at the moment.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta/recipes-support/mpfr/mpfr_4.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/mpfr/mpfr_4.0.1.bb b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
index 2eee76a357..6c609589ed 100644
--- a/meta/recipes-support/mpfr/mpfr_4.0.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "gmp autoconf-archive"
 
-SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
+SRC_URI = "https://ftp.gnu.org/gnu/mpfr/mpfr-${PV}.tar.xz \
            file://0001-Fix-obsolete-ARC-asm-constraints.patch"
 SRC_URI[md5sum] = "b8dd19bd9bb1ec8831a6a582a7308073"
 SRC_URI[sha256sum] = "67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458a6e16e"
-- 
2.17.1


