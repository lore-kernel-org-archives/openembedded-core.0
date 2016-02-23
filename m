Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id D52AA7727F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 12:22:28 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id b67so134436473qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4NFX5IsNGBSsOnNnK5GhX5TAzzvW99Hmu8VJEObIVcs=;
	b=iXm5JCtlzvPqlYgQbapfhbiDPXkwAg9pLSaEKes9O44c/uONfR9KTdAQWyGj7hBpaf
	BYrGvSXiTAtbaijd8sUitpkSygiMfQBRfoADHueUm5GG7wpvUAPr47aJbtCb1bcRwTrM
	UC3Zr2+J7CL1NOk4G2a3wRDbGGSb7xuZhhg+mbHAEk8jl9gNJbcPDuS+nGz4TmHw2qnY
	VqBlG/4T0eLm4kfVFV3RI6EFzi9Se1gfIpWvDBMfc+CVaefs2mh/mfvkn/OSZwVXCTKp
	nxFWrOwejfyXF/7Zp1fWUgmCHX6FozPly4AwHEFFwMR3mHIUVSEfDL6a+qY5ETKoljLj
	vXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4NFX5IsNGBSsOnNnK5GhX5TAzzvW99Hmu8VJEObIVcs=;
	b=A/jBsP2+vNnRUwnCBOhdA5cIB7jMWo74MTv6PQgvu89LFx/3Hyw1B0gO3XdBG+sFdn
	1vJwGik+dfKSrSOMf+CPOaDFb4cVckVZTHMpUbq/Pi8A7t21lPFN5Hvnv3HJ97hxiR/C
	h2LKgdcqfjzOMgetud3iMaEMtaoS+Wl7xgscaQvLM2N3xsG2LU26utnq+fQeAVQg6ccJ
	5ZPYgEY9OtjXVjeefgVrDek4hZdXqiP0Be2SZn5FqPLnDxC1VrAryhdIPz9nNe6AYQGG
	c0zC1z5wXVnH0nXn8SO2VDRUz2J3Ovxfaxrl/M00YF9Ti1b49mv5D4mMGWahJhjFC1iX
	Vp/Q==
X-Gm-Message-State: AG10YOQtvrqRCX+zIzAQHMCWgADhjOLUxlMe6bKfjrxS+utSmeNUR1ZX2hDAWqZb3H0L8w==
X-Received: by 10.140.102.14 with SMTP id v14mr40389527qge.48.1456230149250;
	Tue, 23 Feb 2016 04:22:29 -0800 (PST)
Received: from nyx.sys.comcast.net (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	b34sm8299354qgb.31.2016.02.23.04.22.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 04:22:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org 
Date: Tue, 23 Feb 2016 12:22:22 +0000
Message-Id: <1456230142-18061-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH V2] musl: Upgrade to 1.1.14
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
X-List-Received-Date: Tue, 23 Feb 2016 12:22:30 -0000

There has been regressions seen in 1.1.13 hence
a quick 1.1.14 release is made

license checksum changed due to updates to authors/contributors list

here is the list of all changes between 1.1.13 and 1.1.14

http://git.musl-libc.org/cgit/musl/log/?qt=range&q=v1.1.13..v1.1.14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changed sincd v1:
- Update LIC_FILES_CHKSUM due to change in authors list

 meta/recipes-core/musl/musl.inc    | 2 +-
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index c3fd5c8..3ad31b5 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -9,7 +9,7 @@ standards-conformance and safety."
 HOMEPAGE = "http://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bccdfe36b123d1b0757d8025278d86ba"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=617ba6560e800d47ec31dc88deb63101"
 
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 4151308..250f837 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "cf115059ba0ecd611008c89c78c37b62f8e6d6af"
+SRCREV = "074e6b3fe3f2ad89b991f3d8ab0932035b312a62"
 
-PV = "1.1.13+git${SRCPV}"
+PV = "1.1.14+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
1.8.3.1


