Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 488A76E2D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 15:10:22 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id y1so427606lam.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2014 07:10:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6q/vFUxCg8XQd6X5GWq8HpN1rSifQsDEHovTx/JLN28=;
	b=lZ47+9hzE49+1OU1KIsS+Ll+oij1znLFmtSmrwI6JMKIWuUHG0JdkuxUcytAbrik3x
	Pdwg3p2Ge+HoLyDRUC7VQ96faCzmI/QeXMAC5UOYgb4sNnIc6n/RXhlK/dNs3MGNtaky
	ET0G6S0/ocoIpqJ4jSCYa+iibDRPuEK6d+bwwJEwUi8NTVqEko1v6goiUE7/siz4+iig
	8F8ciTdp5zhhbXHYdN5fnb8jIFoI4e0tkzal/WkdhRDqdSCJmiVRpbxAlYpF6bj2eczg
	OGydukmccWqR3pc50HHNHc6H0G9hnJXZbwi4+I0EXClvz3LhAibxKjej830lhgO0/m3M
	3GLQ==
X-Gm-Message-State: ALoCoQlBM6MHihPBKh5yXIaWPB1zTBE+vwwIl2KJ0Y3Ljbvv1TFesjbFoekziJZng5tl6WiB0bKx
X-Received: by 10.152.229.225 with SMTP id st1mr1557090lac.2.1391613022444;
	Wed, 05 Feb 2014 07:10:22 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id t5sm41121663lat.6.2014.02.05.07.10.21
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 05 Feb 2014 07:10:21 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2014 17:10:14 +0200
Message-Id: <1391613014-5792-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 1/1] systemtap: add aarch64 support
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
X-List-Received-Date: Wed, 05 Feb 2014 15:10:22 -0000

bump SRCREV to include the relevant commits for aarch64 support
update COMPATIBLE_HOST to include aarch64
cleanup md5sum/sha256sum since we use git

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 9da5588..b87aa1a 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,6 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRCREV = "aa7b1e00e6cb7058071ead0180de0541b1c6eccf"
+SRCREV = "9190b3acfe706d3bfd66dec18133d28f98443321"
 PV = "2.4+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
@@ -11,11 +10,8 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
 
 FILESPATH = "${FILE_DIRNAME}/systemtap"
 
-SRC_URI[md5sum]    = "cb202866ed704c44a876d041f788bdee"
-SRC_URI[sha256sum] = "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
-
 # systemtap doesn't support mips
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*|arm.*)-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm|aarch64).*-linux'
 
 S = "${WORKDIR}/git"
 
@@ -29,4 +25,3 @@ def get_optimization(d):
     return selected_optimization
 
 SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
-
-- 
1.8.1.2


