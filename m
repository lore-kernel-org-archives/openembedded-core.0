Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC656A589
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:11:33 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id p57so1345053wes.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=dL8SvdxbzJtxGg9dGkhT0uJo8lr1JTWMmukRtij9b2U=;
	b=iREatPv2v5HSCellVmGu1wEAng7MQFf4CBFAH3mZlIFxIVul8NKCQzqoYYrLT0M2AW
	1G6Eg9MsIIzn7Ey4blxisvRT+xdSRTMKm97wKmsO37TGLN4G6Wiz/f5hhlE0rxu3Oo3P
	BJlOAotOIlS6Szaahp7+Vv4RcsZ+DI+mqe8kqeOSjX32HP6CEcAmplMMkU5aksu7/85Y
	1KCwkFsOIDrF2srR0du2L6fzt8Bm2NzvgUXj7qP9qvgUOZoj1LeQkz1CIp0bEdN6R9DP
	iAlXDsAgwczdqdrWypZnTfyFBITNgvQOjFK5n9EgeBNVFtsKqKOvgPpZwdyUXSM2N77s
	YIOw==
X-Received: by 10.194.134.73 with SMTP id pi9mr9939333wjb.38.1370013094827;
	Fri, 31 May 2013 08:11:34 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ca19sm4609942wib.3.2013.05.31.08.11.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:11:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:08:07 +0100
Message-Id: <5daa7f85f92b90a26bc0791463ba3edd90370f02.1370012830.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012830.git.ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnLKP3Iiys5olsN5vqPdmcOle8gvXOkX1kshAHAYhNcSmuU9DCzkBjYTFVgcuYgskMugtsH
Subject: [PATCH 4/7] weston: install the examples into weston-examples
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
X-List-Received-Date: Fri, 31 May 2013 15:11:34 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/weston/install-examples.patch            |   18 ++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.0.6.bb        |    6 +++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/install-examples.patch

diff --git a/meta/recipes-graphics/wayland/weston/install-examples.patch b/meta/recipes-graphics/wayland/weston/install-examples.patch
new file mode 100644
index 0000000..3e2852c
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/install-examples.patch
@@ -0,0 +1,18 @@
+Install the examples so we can package them.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/clients/Makefile.am b/clients/Makefile.am
+index 621c7c3..749ef20 100644
+--- a/clients/Makefile.am
++++ b/clients/Makefile.am
+@@ -2,7 +2,7 @@ bin_PROGRAMS =					\
+ 	weston-info				\
+ 	$(terminal)
+ 
+-noinst_PROGRAMS =				\
++bin_PROGRAMS +=				\
+ 	$(clients_programs)			\
+ 	$(poppler_programs)			\
+ 	$(simple_clients_programs)		\
diff --git a/meta/recipes-graphics/wayland/weston_1.0.6.bb b/meta/recipes-graphics/wayland/weston_1.0.6.bb
index cb41e05..dd17c03 100644
--- a/meta/recipes-graphics/wayland/weston_1.0.6.bb
+++ b/meta/recipes-graphics/wayland/weston_1.0.6.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
                     file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://install-examples.patch \
            file://weston.png \
            file://weston.desktop"
 SRC_URI[md5sum] = "63202129d66d5514e572814da5dfa1f7"
@@ -49,7 +50,10 @@ do_install_append() {
 	done
 }
 
-FILES_${PN} += "${datadir}/applications ${datadir}/icons"
+PACKAGES += "${PN}-examples"
+
+FILES_${PN} = "${bindir}/weston* ${bindir}/wcap-decode ${libexecdir} ${datadir}"
+FILES_${PN}-examples = "${bindir}/*"
 
 RDEPENDS_${PN} += "xkeyboard-config"
 RRECOMMENDS_${PN} = "liberation-fonts"
-- 
1.7.10.4


