Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1909C6FF01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 07:10:19 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id u110so7001001qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 00:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YCcoYXI7rMkc8BJmabwyrFzuFsnl+Y0f/aabDPbykec=;
	b=Hx943rNRRI17nDg98MwTqLoYu1AadfWDhp2RMD6ijj34RjZuT/8sJktVEV+QrKQxU4
	jD9uOfPXCX8TuyWZjZM4tYNKKwYxR3OG5rOswyiQT+ZXXQlqMtI1UDP601OmKx4A0L1b
	N1yIxiGNKR+N8nOO/8v8HdtGT1Q0I4EQWWfFxdSBhAhy+wgucfvqq584x743IitgYXnR
	cUw9cUtoqQ9y/FmF1KonlHesqtqOqXUWpEvicRVUMMAxxRxYx4dcaVI3/S15yTXJjPhu
	vmruiuocfug9R82B8piXvrWQoeTgxEK0mX6+CtyvDYl7LskXjHq5TC7fhP85ChMPtHzd
	13Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YCcoYXI7rMkc8BJmabwyrFzuFsnl+Y0f/aabDPbykec=;
	b=ZdaOaMw3sg7XDeFWrey2+KUyfRlO2D4trAwjGlQYAaYiEMl+YBpq+CeH+6vPcGScki
	I3LFwtD0E4kVPZFWhosb2lEt8GtDIhQvFHxmZ7K5FOvtNxP18A9sjyxgzrl4xE7rbaj9
	+y0MX6tJ3zqM4ZZXNEmH0Z/fchL1yL7qPR8/vtjbYWON35rgOYWvCeb7uiTjzsCcavpf
	zGLpVV2Mlf1eSXvUYfiRkWqRhFRth/k861osfBc7X9zEemTo2dhBjzRF7Hv0Z11j+iGU
	ij3fMTkPCk/2j1roNZsb+q40w0YFaDMN92j0UtcM1v/VLBQ7SsdCrU/SKhV+v/Oz6AWz
	8x5g==
X-Gm-Message-State: AD7BkJJa599NlyJkhJq75ltQdWxWVkBw40zmKfUO09MUGxZwGCMgdYIb4Y379i/csMzgFg==
X-Received: by 10.140.224.18 with SMTP id u18mr38250972qhb.10.1458025820226;
	Tue, 15 Mar 2016 00:10:20 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	r6sm12039452qhb.49.2016.03.15.00.10.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Mar 2016 00:10:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 07:10:11 +0000
Message-Id: <1458025812-19302-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] musl: Update to get mips64 port
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
X-List-Received-Date: Tue, 15 Mar 2016 07:10:20 -0000

mips64 port is now available on top of 1.1.14
this updates brings it to OE

Copyright file changed due to mips64 attribution being added

http://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=589aefa5b061647e8b9ad9bca3aaa8dc6222460a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl.inc    | 2 +-
 meta/recipes-core/musl/musl_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index 3ad31b5..f2390e6 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -9,7 +9,7 @@ standards-conformance and safety."
 HOMEPAGE = "http://www.musl-libc.org/"
 LICENSE = "MIT"
 SECTION = "libs"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=617ba6560e800d47ec31dc88deb63101"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c9c8cfb4e5e4b9ee6ff570f078950120"
 
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 3b7c9a5..507e793 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "074e6b3fe3f2ad89b991f3d8ab0932035b312a62"
+SRCREV = "de400b6609becbc6a5ae87fa8b155f02a860e257"
 
 PV = "1.1.14+git${SRCPV}"
 
-- 
1.9.1


