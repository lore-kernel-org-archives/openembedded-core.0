Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAigh-0005Ww-Nt
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:36:07 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LzLDu12kCF6pStcrwmCNdWalWRuK1AbSWbP0ISnJ2/Q=;
	b=hJV92CRC8oaGej0cG94i4dEr9HFzMIxVTyA0VjsAQ5siOuq05Mxz6dmyT4PFFQ/5+K
	2zG8vWEhQlTHhqvU+eblSp1MgnywC8kCSDZYv4k0lprMv5XoTkKhw1A28RIp+kvrREW8
	DsYHA49CwmHZVt09dOKd2sBV0ywQ1InWZ73Qc=
Received: by 10.204.8.24 with SMTP id f24mr7688845bkf.324.1317648637644;
	Mon, 03 Oct 2011 06:30:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l15sm13225197bkw.9.2011.10.03.06.30.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:43 +0200
Message-Id: <8842b80f467db1ab01020623dc0bde2839607631.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 12/30] xserver-xf86-dri-lite: remove COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 03 Oct 2011 13:36:07 -0000

* ie om-gta02 has mesa-dri module too

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xf86-dri-lite.inc         |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
index 740c59d..0d956b5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
@@ -11,6 +11,3 @@ EXTRA_OECONF += "\
                  --with-pic \
                  --with-int10=x86emu \
 "
-
-# Due to mesa-dri
-COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-- 
1.7.7



