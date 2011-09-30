Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9Xb9-0005dU-33
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:33:31 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1506817bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ynRXmemFe5eV1czMZLLCTDOdevMRG9p3nzObxFU3Un8=;
	b=MZg9853i5jSJvVEo2RbXeWDpwRpPo9VHc+YIDAlgQXZhTRSemi57mgq4QSFwEyHMK4
	Lmi478cDsVfmUMkfE5OPXQOFrHzI/oh5I2WBrCF/N+nAWX1b/hzomRs3zHgIj5WEwrf6
	69nkM4K2XjTnEo9TVZ3bueFlr9Wky3YtayZ5s=
Received: by 10.204.152.141 with SMTP id g13mr287416bkw.18.1317367684819;
	Fri, 30 Sep 2011 00:28:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j16sm3940559bks.3.2011.09.30.00.28.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:28:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:16 +0200
Message-Id: <5dce142f3cf11663cd9cbac9165daa571107cc0c.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 05/13] default-providers: define PREFERRED_PROVIDER_virtual/libx11-native
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
X-List-Received-Date: Fri, 30 Sep 2011 07:33:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/default-providers.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index d51ac64..7ff7891 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -9,6 +9,7 @@ PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
+PREFERRED_PROVIDER_virtual/libx11-native ?= "libx11-native"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
 
 #
-- 
1.7.6.1



