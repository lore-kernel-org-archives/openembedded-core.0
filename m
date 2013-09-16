Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 50A9461577
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 15:02:20 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w62so3729745wes.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=o1bxHdSAOz2ZaMDYmw6DnQkndgwmh45HVFSZXjU38F8=;
	b=NEVPG/HPq35CUO/XOtVPEz2I0/NUNLcwEIUXsr32CzWQDsiI4cEzx5KeDvDia+qFmA
	snd/dEPYFDvGYyBJ4fEvGbeXvLSCxU4Bsp2//hGdE7IDHW8NQOhvtoYrhJkJM7DNlMy6
	yOk0oXHv9DZ/zJpb8TZLZnKBWDcqymBb1pFXysw4A4AupkJwi/cB0kh6PgDfbvKBtYF2
	HMUQ2M+eZaUCmUxpi6AANaJY3T2s8bGj0iAUL3y+9z8NJBHLk0v4X9coxrlWqyH420YW
	yFXDiE4/AAocASuzZsV/2chtZjJ1ilMLEMIrrzVLSbSHe/943oFQ16lpUc6cCWL1/Y/q
	IdVg==
X-Gm-Message-State: ALoCoQksm9RgJq7mGBqoIW497L1BUvevf/TAXuNOSCDfsJzGEU6ZtD6nIuI4HSA2zHvkTNL2wBVe
X-Received: by 10.180.89.206 with SMTP id bq14mr13732882wib.56.1379343741520; 
	Mon, 16 Sep 2013 08:02:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	mz14sm24198374wic.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 08:02:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 16:02:09 +0100
Message-Id: <1379343731-7492-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379343731-7492-1-git-send-email-ross.burton@intel.com>
References: <1379343731-7492-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] mesa: add virtual/mesa provider
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
X-List-Received-Date: Mon, 16 Sep 2013 15:02:20 -0000

As there are two alternative mesa recipes (mesa and mesa-gl), there needs to be
a virtual provider that recipes that explicitly need Mesa (such as xserver-xorg)
can depend on.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    1 +
 meta/recipes-graphics/mesa/mesa.inc            |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index a804089..d4b9db0 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -9,6 +9,7 @@ PREFERRED_PROVIDER_virtual/egl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
+PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 79605fa..afc795c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,7 +17,7 @@ PE = "2"
 
 DEPENDS = "expat makedepend-native flex-native bison-native"
 
-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
+PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
 inherit autotools pkgconfig pythonnative gettext distro_features_check
 
-- 
1.7.10.4


