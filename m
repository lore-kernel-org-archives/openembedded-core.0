Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id F17B47289F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 15:47:02 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so4146410wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 07:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Ix7DnR8Puo3/sTo52A3Z8m4I5wsL/kzmAl/VMdNXzFo=;
	b=I0rAM8IhjXklgzRYm7525Lct/CCxKVhpJJPTZCBrVOx+5EGfSZ3dGmUOiRvYdgggvR
	Flno+abDD0US3dfF8iw9MCQI/WPU0JolbBXEuXUn2uJhlwo/frpCivQm975cl0SHbzIj
	kCRu0Mysk/watq2uz1gBiOL3Vau1UV/X05E/H1m8QbhIBY5hFHEwyC2QzyogcNmrilro
	alGb+jCmUDHqN2AQ9MLHh52wevtJqlqsMmyLzqx8PWe/cfKepyECd+ADJi6GSLOf2Pt4
	Tz/xa8TbCIctyNHG8uAqm2je6XIaAASEDMhG4eXkndQsVISHP2pRId8ejvKV3iUtiz1M
	1rRQ==
X-Gm-Message-State: ALoCoQnHiuel/78wZI9D7svcWuIejJWNPB+WRqVSURsS/AIxiEl6KeRE+Gdl0cVs3M+4r9H5bNgm
X-Received: by 10.194.188.39 with SMTP id fx7mr19803228wjc.113.1420732022741; 
	Thu, 08 Jan 2015 07:47:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id gf6sm6627465wjc.11.2015.01.08.07.47.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 07:47:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jan 2015 15:45:48 +0000
Message-Id: <1420731948-8603-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] oprofile: disable documentation
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
X-List-Received-Date: Thu, 08 Jan 2015 15:47:05 -0000

Seed the xsltproc detection with "not found" to avoid determinism races with the
documentation which doesn't build correctly with our xsltproc.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 509640c..198df30 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -27,7 +27,7 @@ SRC_URI = "file://filemode-fix.patch \
 
 inherit autotools-brokensep pkgconfig ptest
 
-EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x"
+EXTRA_OECONF = "--with-kernel=${STAGING_KERNEL_DIR}  --without-x ac_cv_prog_XSLTPROC="
 do_configure () {
 	cp ${WORKDIR}/acinclude.m4 ${S}/
 	autotools_do_configure
-- 
1.7.10.4


