Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7fo-00008k-IC
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:42:33 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so4006680pbc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=UbAuzzDKTqcAvowueNn1BGEKnuvYzBO9UyelWA4Vy5Q=;
	b=aZpGpS9vFzCXboY07RMUxPulzAgyDPkkzGbSyoMT6C7ZcLCmVOWnMabAm3PBshaknq
	c/z2uJj0Q/nunxq7hrrod6JLMaba9I3buBas2swymI1xKA0wgrqdcLc1Ux94cqUa1nKd
	gPF11xN8Xgvy6m73Dh0jJkr3lkrVt87kp/K9w7J25NsfST7Pr6vtRkZXe+qCOMRHJMUJ
	PmcGyig6jruD5iMomOxJgLiwBTL57GvJxj2sgssXwypwmKYlYovtGvXRh9wAC4uVNKqK
	VLwvorufrsWhYyMlVyMj/2xigy3zNGC1SH1yqRNrMUC/KNb9mvHtNQijv1yTIn6mVRQv
	MK4w==
X-Received: by 10.68.197.133 with SMTP id iu5mr29970443pbc.195.1363026333276; 
	Mon, 11 Mar 2013 11:25:33 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.30
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:52 -0700
Message-Id: <07e5c2e8a53104772e037ed1e10fcc34eaaaf496.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkvWulZHEh3XxAkTffxb2dFN2C5vML+AroBH9jxtItyLNd3gtsTr4LDVdoE6p+AG8h79lKs
Subject: [PATCH 09/12] systemd: remove util-linux-mount dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 18:42:43 -0000
X-List-Received-Date: Mon, 11 Mar 2013 18:42:43 -0000

There's been a lot of action in busybox to fix mount's behaviour for systemd, so
remove the dependency on util-linux.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 2e637e0..5473666 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -171,13 +171,9 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "dbus udev-systemd"
 
-# kbd -> loadkeys,setfont
-# And pull in the kernel modules mentioned in INSTALL
-# busybox mount is broken
 RRECOMMENDS_${PN} += "systemd-serialgetty \
                       util-linux-agetty \
                       util-linux-fsck e2fsprogs-e2fsck \
-                      util-linux-mount util-linux-umount \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
-- 
1.7.10.4



