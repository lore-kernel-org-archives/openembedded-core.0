Return-Path: <ruslan.bilovol@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 964947FC9D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 18:46:39 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a11so10526138wra.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 11:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ePE0VmjfalGBZvt+FslWQ9oJrtIxXVqg7kZdmTnEmRE=;
	b=F5qaIU54FsVZ95P6Kq78bUR5tzSZ202IcKNIJdmo+MtQlMmHdGmT30JzX2j9GaJEH3
	kCc0VCkbt04nptxo+2iIDGXnzy8/7amIt57H9X683WX4XlkU4fNzOzBkH6JpR4z8OKAS
	kJmKRGmey4f4nO3DVRh2EVkV6UzMAj/wzAT7m1VhJYmuuknVhMza1/CL3qnj5jEnvUG/
	/uAiGMH4fdGPLqBys135s6VtZG3LUpUP1Nm7pIRXBmwLcyVkE50oOeCS5pGuTFp+Vn8y
	DMBYY/1JTYtdV6eyOE0XSnmdsT9xV93OFEs5Vq6bOvn67DuJTtOdR8+JZMuPmhwlhGFr
	gP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ePE0VmjfalGBZvt+FslWQ9oJrtIxXVqg7kZdmTnEmRE=;
	b=lUTQ8EECAo5lna4vkfFVY6Q34rN/hXczGPUdMENxQcIjFsRSvRGRND0/NNG6baJaSr
	Rm5YwMjwSXs7NYGqzfX1XdhH3sZheRloUcxF59gr2VKrju2Nzhn6Agd6yaCcLeMq1WQs
	d3fVdFXfvvOrf1RYHsv+TrkZxApavEh68LZok6btajdYhnEb7F/opqqHHMM3kH87/8RD
	jjYsaxweB3QguRwZMhW6tu++lmVtAcBmXTZBV6uGwoLDSph1+gCPO6MeDavsPzWK7TxS
	slLYqUXUxuobJTML4VbAQ3w1q90ONQ6/r9ZSXtXU6rrrX7bXUwPapkxyTPR3Cbai6SR6
	rGqQ==
X-Gm-Message-State: APjAAAXHvsdJT+TlM2WQUFZ7ZckwWEFCxv0e14MAAPBayO6CAQHiJYA8
	sQ0FkwCWOHAhkx+GRDR33l3SWS4huUw=
X-Google-Smtp-Source: APXvYqwCtbPjOd4AGzMj4zxr13TqwRpPt0ZlUbTCchByJmNrLFnKSppqmwomfWnuUveQgUVJyafLkg==
X-Received: by 2002:a5d:4684:: with SMTP id u4mr8513113wrq.352.1572633999711; 
	Fri, 01 Nov 2019 11:46:39 -0700 (PDT)
Received: from localhost ([178.18.58.186]) by smtp.gmail.com with ESMTPSA id
	t185sm12359866wmf.45.2019.11.01.11.46.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Nov 2019 11:46:39 -0700 (PDT)
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2019 19:46:38 +0100
Message-Id: <20191101184638.31898-1-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [RFC] [PATCH] Provide users with project support status
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
X-List-Received-Date: Fri, 01 Nov 2019 18:46:40 -0000

When OE/Yocto project goes through its lifecycle, there
is no any way to identify where it is other than go
to a Yocto wiki and look at current status.

Moreover, change from maintained to community maintained
end EOLing happens silently so users not always know
about that.

This patch aims to remove this gap. The status should
be changed so users can clearly identify at which point
it is now:
 Development -> Stable -> Community supported -> End Of Life

It is now printed during the build.

It will be also captured in the git history and
may be discussed over mailing lists during such a patch
reviews.

In the future this can be extended also to LTS when
we will have it

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 meta/conf/bitbake.conf       | 5 ++++-
 meta/conf/documentation.conf | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 263d8aea4f..795dd3d5fb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -6,6 +6,9 @@
 # files may also need changes to keep in sync.
 #
 
+# Project support level
+SUPPORT_LEVEL = "Development"
+
 # Used by multilib code to change the library paths
 baselib = "${BASELIB}"
 baselib[vardepvalue] = "${baselib}"
@@ -701,7 +704,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 # Pre-build configuration output
 BUILDCFG_HEADER = "Build Configuration:"
-BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
+BUILDCFG_VARS = "SUPPORT_LEVEL BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
 BUILDCFG_VARS[type] = "list"
 BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
 BUILDCFG_NEEDEDVARS[type] = "list"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 550df20b0f..3efef4b18b 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -392,6 +392,7 @@ STAGING_KERNEL_DIR[doc] = "The directory with kernel headers that are required t
 STAMP[doc] = "Specifies the base path used to create recipe stamp files. The path to an actual stamp file is constructed by evaluating this string and then appending additional information."
 STAMPS_DIR[doc] = "Specifies the base directory in which the OpenEmbedded build system places stamps."
 SUMMARY[doc] = "The short (80 characters or less) summary of the binary package for packaging systems such as opkg, rpm or dpkg. By default, SUMMARY is used to define the DESCRIPTION variable if DESCRIPTION is not set in the recipe."
+SUPPORT_LEVEL[doc] = "Specifies the project support level which can be one of 'Development', 'Stable', 'Community supported' or 'End Of Life'."
 SVNDIR[doc] = "The directory where Subversion checkouts will be stored."
 SYSLINUX_DEFAULT_CONSOLE[doc] = "Specifies the kernel boot default console."
 SYSLINUX_OPTS[doc] = "Lists additional options to add to the syslinux file."
-- 
2.17.1


