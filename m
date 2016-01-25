Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4BD52770E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:32:43 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id b35so115307873qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bZ4ugBPAvoj7w97K+G8r+Vbrd8BpVRW6cpL7nT9bcZo=;
	b=HnFz49jPDVvN6SDb770Kx3KTnPXh+xjwSiugNv5sVQaNlXZAMtTmCAHFIcp4cW1p7n
	leFE8ii8eZAyleXEXVt/WsF+8S0z1fTmmPiGJxIKfBYeZKyCsuvr/nPrgiuu4BuV41XN
	6jbsuO/UwVHaiIi5Tyrkg5FCEZ+xYClVIOX/MpWupVbYsNAOsZ37hfAFq0V/Qe6vp7Cm
	j/U1lbNlcjq7w/evoI/q8bRwwgC2g3oW4Ofulen36Gm00sHU8SRy2wvKxZNHylk8FZmu
	pu7tLhY6gADrvFJz0aO3S0mvzqOy7lggYEJoVu0nJbnexFDDJN5ai1XKSO1GrkK20xA6
	Wa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bZ4ugBPAvoj7w97K+G8r+Vbrd8BpVRW6cpL7nT9bcZo=;
	b=SNljNRGLrqkA1lX4D9oFFB/BJFslan7J1VuRVu/12yjFf+tdmrf8xia/LdSu0IlLra
	GoNq6FCcgAVSvB1bEMGMJ9azQPNMD0op1gXCe4+8ZJw7S0K3QYojo2bHhWll0tV6cId7
	rkZLRTikL2CIO2k/b8wE5CvFy5O/dCkGUP77iiE20aCEMZHACY0YGj8DeGUqX5DDfQIs
	lriGQyaCAUNv8Pil3kSWDMOVsB9q6OnPiiVs/yzmAWHq2RZsp4NGqmQXW5ShOMuPm71b
	NLYLf0oZfIoI4vCl4V0xmTY4xfNbJSdC02qFEjahNyNRmgs8fymaDUeksaXYqgAKuXfM
	VZFA==
X-Gm-Message-State: AG10YOTXU6wTaY++Wv6A8fpl8Q+pj0ffGnG45UEzF6dLJJZOA8qzWlkYJP+Xc28h2HryAw==
X-Received: by 10.140.158.199 with SMTP id e190mr24322661qhe.74.1453746764761; 
	Mon, 25 Jan 2016 10:32:44 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm9201586qge.7.2016.01.25.10.32.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:32:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:32:21 +0000
Message-Id: <141bb75823160788015355f51ccd2eade78e57d1.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
References: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
Subject: [PATCH 05/11] argp-standalone: Fix build when S != B
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
X-List-Received-Date: Mon, 25 Jan 2016 18:32:44 -0000

accesses headers from source tree.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../argp-standalone/argp-standalone_1.3.bb            |  1 +
 .../argp-standalone/files/out_of_tree_build.patch     | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-support/argp-standalone/files/out_of_tree_build.patch

diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
index a5d20d3..d61c8be 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
@@ -10,6 +10,7 @@ SECTION = "libs"
 SRC_URI = "http://www.lysator.liu.se/~nisse/misc/argp-standalone-${PV}.tar.gz \
            file://0001-throw-in-funcdef.patch \
            file://0002-isprint.patch \
+           file://out_of_tree_build.patch \
           "
 SRC_URI[md5sum] = "720704bac078d067111b32444e24ba69"
 SRC_URI[sha256sum] = "dec79694da1319acd2238ce95df57f3680fea2482096e483323fddf3d818d8be"
diff --git a/meta/recipes-support/argp-standalone/files/out_of_tree_build.patch b/meta/recipes-support/argp-standalone/files/out_of_tree_build.patch
new file mode 100644
index 0000000..b7777cb
--- /dev/null
+++ b/meta/recipes-support/argp-standalone/files/out_of_tree_build.patch
@@ -0,0 +1,19 @@
+Fix the testsuite to built out of tree
+in OE S != B
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: argp-standalone-1.3/testsuite/Makefile.am
+===================================================================
+--- argp-standalone-1.3.orig/testsuite/Makefile.am
++++ argp-standalone-1.3/testsuite/Makefile.am
+@@ -5,7 +5,8 @@ TS_ALL = $(TS_PROGS) $(TS_SH)
+ 
+ noinst_PROGRAMS = $(TS_PROGS) ex1 ex3 ex4
+ 
+-LDADD = ../libargp.a
++AM_CPPFLAGS = -I$(top_srcdir)
++LDADD = $(top_builddir)/libargp.a
+ 
+ EXTRA_DIST = $(TS_SH) run-tests
+ CLEANFILES = test.out
-- 
2.7.0


