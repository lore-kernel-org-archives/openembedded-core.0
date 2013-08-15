Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id B8E8D6B8C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:16 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so186378eaj.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=UhPAxLz+5iOJCvIf4CBpy+bkz0m+yis91lITa5VljDc=;
	b=OTNgj7t2E0n4gj/5fpiZRHbN3XLxApqqBiPuvhvcSw8LQgm4YxUMC/roDmOOm607go
	hu+6qgjBuQJC/3+hUvLPTKb5Dwv6AaZstk1zrwY7f9JgYYHdzMhMVaaPJTeCGPrgcILt
	olGPhu4tgFBgWbO89fuOxTJ5W++SZ1a1P+z/C+/xtn76uoezqi1FMtCCiHq9xrl/awMB
	LSrexFFftXdEz1Ss9uRNxGu89ENA41PMyedcQBDsvnhy2WYgyrBWI4Uqxpe36+QvWQp1
	UUHuQGxxlRNZ9FYVuIdVQ6GfMisya5I2ZrNlOeLeEgy0rjUtSH4SgRRhT6vGrLVvpc6p
	HBUA==
X-Received: by 10.15.109.135 with SMTP id cf7mr20814418eeb.0.1376551397189;
	Thu, 15 Aug 2013 00:23:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bp43sm81954554eeb.4.2013.08.15.00.23.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:30 +0200
Message-Id: <816a4e26323136af745311ddd6c6b80be4a30e58.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 19/33] directfb: add PACKAGECONFIG for jpeg2000
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:17 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/directfb/directfb.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 97a4c55..7295c35 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -23,6 +23,9 @@ LDFLAGS_append =" -lts -lm"
 
 inherit autotools binconfig pkgconfig
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
+
 EXTRA_OECONF = "\
   --with-gfxdrivers=none \
   --enable-libmpeg3=no \
-- 
1.8.3.2


