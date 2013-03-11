Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7fW-000085-I3
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:41:56 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so379440dak.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=c2KzCrg46mgslxpncJ6V+QKuTwJBvLqKip9XqW/5vN4=;
	b=AkN3EpG+StvX1obumAvJpfJuPWQDpgGe6RbDJAX6/hIjMdsGVRC3r8PshApPA94khX
	KwjdFjU1dGTBHjjeH1jov9W013hA8f/trO3G2jlBo6AUgIPcnbtABdcMnUdh3ZqU7fhQ
	ze2lEMztHCp1ELpNBVUEB233AZkgxtBs8DS0tJPJIH9q5lqa5a4VevQbxfJYaUJ5njkL
	syP1KS65GptZhqetFLVuORhp9rMnItvd8sA2uZ4iBESrbPdoQhRCS2TnrsYZy/JYjyNM
	luhuc6QZ32Wq3vKE2cM5bPRzVVnGyDJQYANn705cz6cGIdUMYsK0RwNp7cdVrYKqh1Ig
	mhPg==
X-Received: by 10.68.63.194 with SMTP id i2mr31445161pbs.4.1363026313269;
	Mon, 11 Mar 2013 11:25:13 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.11
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:46 -0700
Message-Id: <20149696472a18338b03aa67e239c8ee6ae60980.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkm7h7ZACkpmUvJsVXfbOq29Ikl9KLAFrRCZk0U1AfYuDKx21NIx/AR3+9tlFkZItUWds2k
Subject: [PATCH 03/12] xf86-video-intel: add explicit dependency on udev
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

Otherwise configure will auto-detect, and not be reliable.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb |    2 +-
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb
index 157e0f3..32253f6 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 PR = "${INC_PR}.0"
 
 DEPENDS += "virtual/libx11 drm xf86driproto glproto \
-	    virtual/libgl xineramaproto xf86driproto libpciaccess"
+	    virtual/libgl xineramaproto xf86driproto libpciaccess udev"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 83a24ce..cb48fc2 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -8,7 +8,7 @@ the driver supports hardware accelerated 3D via the Direct Rendering \
 Infrastructure (DRI)."
 
 DEPENDS += "virtual/libx11 drm dri2proto glproto \
-	    virtual/libgl xineramaproto libpciaccess"
+	    virtual/libgl xineramaproto libpciaccess udev"
 
 SRCREV = "87ea531c5dc5b39809395b277c330854aaaaf019"
 PV = "2.10.0+git${SRCPV}"
-- 
1.7.10.4



