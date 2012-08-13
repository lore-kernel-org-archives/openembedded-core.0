Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T102q-0001XI-VA
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:11:21 +0200
Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 11:59:26 -0700
Received: by wgbfm10 with SMTP id fm10so3244146wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 11:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=NFSRK51dGxv8ygZvJf8TA2+WjSCgm6UjRU5IRWTOcys=;
	b=eHg2UZSH3bdm0n9bvdDwiOvOYfInQ9BqCdwpkIDSWtuU3wlvTCPfI9nzhrYj7I7kOd
	ss7CZ9MzG8p+YHzFfhEn9fLMRmHtSOzVcp2vGPmS/8D04YFJz+BUF4f1L0YPGHNIohvA
	pzP1qN8gsBNUoqN5YxqaZ/hBC8cBXBkVwCqcHgIZOPBP2CVxL/HguYPOafQzuh4s6x5g
	jZ/Bv3elkbIoxq3R+YZgtVRbpx/tKfxjlE+kSIZ8nEu3rEa3ryMsRoANjfsKiVn1BVr2
	ojNP9ae3UZQ4CVta7PQupwPiU9IMcAkKFLi+XQw5iC+VP4bFZys0EDGPtedAUiFdBoeh
	Jubg==
Received: by 10.180.74.33 with SMTP id q1mr20770355wiv.4.1344884365154;
	Mon, 13 Aug 2012 11:59:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm17936447wiz.1.2012.08.13.11.59.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 11:59:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 19:58:44 +0100
Message-Id: <efc957bc66d13b5fbb8848289da886f14a3d6815.1344884283.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
In-Reply-To: <cover.1344884283.git.ross.burton@intel.com>
References: <cover.1344884283.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlQYcwjx8SzFndnoOgDWS1MRdj2ZZ6YRFgmouyUaCgLRDsU9sV0A5q7rXDLDMuh3UynpXda
Subject: [PATCH 5/8] core: Prefer mesa-dri as virtual/libopengles1/2 provider
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2012 19:11:21 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

Wihtout it, you have both mesa-dri and mesa-xlib as providers. Let's
prefer the accelerated version.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc                       |    2 ++
 meta/conf/machine/qemux86-64.conf                                    |    2 ++
 meta/conf/machine/qemux86.conf                                       |    2 ++
 .../bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf    |    2 ++
 4 files changed, 8 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 54c90d3..28d2f8e 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -6,6 +6,8 @@ PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 998ef60..285054a 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -4,6 +4,8 @@
 
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
 
 require conf/machine/include/tune-x86_64.inc
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 57e480c..c81afe5 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -4,6 +4,8 @@
 
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
 
 require conf/machine/include/tune-i586.inc
 
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
index 1ab6e58..d1f50c1 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/conf/machine/{{=machine}}.conf
@@ -11,6 +11,8 @@ PREFERRED_VERSION_{{=preferred_kernel}} ?= "{{=preferred_kernel_version}}%"
 {{ if qemuarch == "i386" or qemuarch == "x86_64": }}
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
 
 {{ input type:"choicelist" name:"qemuarch" prio:"5" msg:"Which qemu architecture would you like to use?" default:"i386" }}
 {{ input type:"choice" val:"i386" msg:"i386    (32-bit)" }}
-- 
1.7.10



