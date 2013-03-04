Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCVBC-00078b-GI
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 14:11:48 +0100
Received: by mail-wg0-f52.google.com with SMTP id 12so4126069wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 04:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=ogz8nr5/qZqC14p61vlSrGrSic4oMlZKFd8MGgFpsfk=;
	b=TiqgwaeO28/5ywwzTvGsC8fHorG5CLVkuIo9c7GN79j1i4RLV+S3dPaZSicryRHz6W
	/k8YJn/8vMZURIregug3fMFK12vIK2Qu3pPP/TcFkcifSic0H4ownSJm9DXURJMX/C8f
	A/SAqRc0TVsvaYpCmuZIfVUKGf3EIMihKBf0BVnOWuTQAyGmfQ0aZKIAKCsds9/HGuai
	N4AKYEst4o0QdILVOi+yIJJySTHt4CYz9BMoTnDMIluEThdFO/YePH35a6fWS4JyHLZS
	LwLXXJh4T4o1n5Ls/0JSR1rdvP3dncGVQIclHzgkk3lInUYaSbYzbcKy8QeHclA2PsRI
	lPkQ==
X-Received: by 10.194.88.138 with SMTP id bg10mr31663094wjb.13.1362401716889; 
	Mon, 04 Mar 2013 04:55:16 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fx5sm15460507wib.11.2013.03.04.04.55.15
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 04:55:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2013 12:52:45 +0000
Message-Id: <e137d87f9aa1b572ca3a3d7b45b7e09dbd7bb4b1.1362401323.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362401323.git.ross.burton@intel.com>
References: <cover.1362401323.git.ross.burton@intel.com>
In-Reply-To: <cover.1362401323.git.ross.burton@intel.com>
References: <cover.1362401323.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmp0x2RuhTq/F05VIknTh3Ne1q4WmrFjhJ1+0j0ZztxpLwBk1sqa004CuaQzEAZvfYWLxcP
Subject: [PATCH 2/4] default-providers: add default virtual provider for gtk-update-icon-cache
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
X-List-Received-Date: Mon, 04 Mar 2013 13:11:52 -0000

Use a virtual provider instead of a hard dependency so that if gtk+-native is
required in some configuration, this provider can be changed and then
gtk+-native and gtk-update-icon-cache-native won't be both built and conflict in
the sysroot.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 444176c..ebf2a09 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -12,6 +12,7 @@ PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
+PREFERRED_PROVIDER_virtual/gtk-update-icon-cache-native ?= "gtk-update-icon-cache-native"
 
 #
 # Default virtual runtime providers
-- 
1.7.10.4



