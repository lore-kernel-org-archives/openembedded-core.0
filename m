Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9957962E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:53 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id f4-v6so8498381edq.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lwZJg30wG8+up8pAdAKqnGs5NPeU+nsyF4woiHwpjeo=;
	b=FNca74dWcEyHCtI7v3Ou/6/ZfUEYoM8OrkW70o7CPKVFGZS8KsHoJqulmKsNdxjvOP
	v9wiu8STQYMuq8fpsl98cfn8lrslxykcO4cZy9irqARlZpSvJsMHhqgxFWswblS8/bQC
	bwJNyeQkbz//PxWiC9Hpfx+i0OXOAUZ9ngdjSE51K+SRlfbmSd6ZvhNEqKtlfSmK9/6W
	dQBfVTq3s7kfIFQrNNiYVSmxIjYvLNZECQBiwnWFHg4vumIh+bLn44O2H0cPkuRR3hvE
	XAlhOcmiCxIHzEqHfCRnde2eO6RGL3CQGs2YFeuLGhWz0FpHtd9bDn0Vy+bBlUvzu0tC
	oiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lwZJg30wG8+up8pAdAKqnGs5NPeU+nsyF4woiHwpjeo=;
	b=GDdfuC2pu2qzRbLfLYjuwF6+6MeXKIbNYebG7LtpPiWBooaIB0K6TPF/FaAjcp99YT
	PY72AzKRkq+ssXKyLI3kpYHT2+FGTskJkg2WdNdcZ5LOLdTqLVnci8uwUVww7mz2iy3k
	F2kDbSIJjNdr6/BXPYmR3qcpfDagbIxBCDXXUUSEIdqulughRVEvcb2Gu2paHYv/YZFw
	EuUGF9iQvtpyKGf7ySpf7onN/d+v1VzF2u2KNnpuE9blcafJ7I6TC6ri9qviwyqG85oQ
	lSyQyqCecKa/iKumHgd0Im6LiCQT0PCtbSJABbNqh8Tr/FtQAOgwG4FOHxylIBW19wfG
	secA==
X-Gm-Message-State: APzg51A9bsXH5eH1vbtc6OetM/Id6HoWhnVcAmio2q0oPfDRIQWWWP+x
	P7PFUBEL74+NhC6eKXgaMOC9PC2iwqs=
X-Google-Smtp-Source: ANB0VdYRZNRKOkVJgpr4oLs698n+Fjvk/HoOzKkM5eATIrF2cH1T7DsZRgowRHWGLdbW4OA49tWUCA==
X-Received: by 2002:a50:86b5:: with SMTP id
	r50-v6mr2839198eda.201.1536230454042; 
	Thu, 06 Sep 2018 03:40:54 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:31 +0200
Message-Id: <1536230436-30342-16-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 16/21] dtc: update to 1.4.7
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:54 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/dtc/dtc/make_install.patch     | 23 +++++++++++++++-------
 .../dtc/{dtc_1.4.6.bb => dtc_1.4.7.bb}             |  2 +-
 2 files changed, 17 insertions(+), 8 deletions(-)
 rename meta/recipes-kernel/dtc/{dtc_1.4.6.bb => dtc_1.4.7.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc/make_install.patch b/meta/recipes-kernel/dtc/dtc/make_install.patch
index ccf17b3..ea9359e 100644
--- a/meta/recipes-kernel/dtc/dtc/make_install.patch
+++ b/meta/recipes-kernel/dtc/dtc/make_install.patch
@@ -1,17 +1,26 @@
+From e9852b9d206df1e42aa4c8afec55a0f5e099b533 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Thu, 3 Nov 2011 08:35:47 -0700
+Subject: [PATCH] dtc: Add patch to correctly install shared libraries and
+
 Upstream-Status: Inappropriate [configuration]
 
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
-@@ -168,8 +168,8 @@ install-bin: all $(SCRIPTS)
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d8ebc4f..f5e01be 100644
+--- a/Makefile
++++ b/Makefile
+@@ -205,8 +205,8 @@ install-bin: all $(SCRIPTS)
  install-lib: all
  	@$(VECHO) INSTALL-LIB
  	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
--	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
+-	$(INSTALL_LIB) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
 -	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
 +	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
 +	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/$(notdir $(LIBFDT_lib))
  	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/libfdt.$(SHAREDLIB_EXT)
- 	$(INSTALL) -m 644 $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
+ 	$(INSTALL_DATA) $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
  
diff --git a/meta/recipes-kernel/dtc/dtc_1.4.6.bb b/meta/recipes-kernel/dtc/dtc_1.4.7.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.4.6.bb
rename to meta/recipes-kernel/dtc/dtc_1.4.7.bb
index 78c5736..6ce462a 100644
--- a/meta/recipes-kernel/dtc/dtc_1.4.6.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.4.7.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "e54388015af1fb4bf04d0bca99caba1074d9cc42"
+SRCREV = "88f18909db731a627456f26d779445f84e449536"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


