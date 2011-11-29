Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVNCP-00021a-Hv
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 13:54:13 +0100
Received: by bkbzs2 with SMTP id zs2so9308336bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 04:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bYw+f97vkz7kql2bqQlaYW6uhH+LaHo/SvNqi87KJlk=;
	b=eLdDCUaUnUzvh9p/l2Xplm7i74kHuPWIHFEUTAX/cFXUUubVxESZfEf6mAvmGQNxZK
	rkm/1sAuVv3JYi3+DnjsoRoCQq8By30KcQ7R0fS3a7jEUKBiaaZ0LAugkOgd/BLQZdTy
	pvNDXjMMrc9tyIIgoSqdyTXQdh+Ot3/KAFWFU=
Received: by 10.204.149.215 with SMTP id u23mr51293766bkv.105.1322570854545;
	Tue, 29 Nov 2011 04:47:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f14sm36824999bkv.3.2011.11.29.04.47.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:47:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 13:47:26 +0100
Message-Id: <cover.1322570605.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
Subject: [oe-core 0/5] libsdl changes v2
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
X-List-Received-Date: Tue, 29 Nov 2011 12:54:13 -0000

V2: PACKAGECONFIG is used only for alsa not for opengl, because there is no virtual/libgl-nativesdk
and with only alsa in PACKAGECONFIG_virtclass-nativesdk it would pass --disable-opengl 
to OECONF while now it passes --enable-opengl so it would change nativesdk package without
option to enable it again.

The following changes since commit ad0baa7d2f33a865011e0c6afe29f22aa1beea32:

  eglibc-initial: Ensure symlinks point to the correct location when built from sstate cache (2011-11-29 12:36:37 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Martin Jansa (5):
  libsdl: drop unused files
  libsdl: rename files dir to libsdl-1.2.14 for faster lookup
  libsdl: enable cdrom, alsa and tslib, disable rpath and add few fixes
    from meta-oe
  libsdl: enable alsa based on PACKAGECONFIG and respect
    DISTRO_FEATURES
  libsdl: replace tabs with spaces

 .../libsdl/files/directfb_obsolete_calls.patch     |   35 ------------
 .../recipes-graphics/libsdl/files/extra-keys.patch |   55 --------------------
 .../{files => libsdl-1.2.14}/configure_tweak.patch |    0
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb      |   27 ++++++---
 4 files changed, 18 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl/files/directfb_obsolete_calls.patch
 delete mode 100644 meta/recipes-graphics/libsdl/files/extra-keys.patch
 rename meta/recipes-graphics/libsdl/{files => libsdl-1.2.14}/configure_tweak.patch (100%)

-- 
1.7.8.rc4



