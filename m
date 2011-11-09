Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROCIN-0007uS-8T
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 18:50:43 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2005273faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 09:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=itp7GGgkVAHe2lTd34gesLJ/Wzbo78RNevgWQxkp734=;
	b=HSc+pLKi39AyuFJWtjr8GuirtqepOC6X9JqQfGcjgaRAABlVx0gU3sp9o0mGgfx1yQ
	U2WqKZryyJTy8UVrL8P23lcK4JGBrViSyATAQipVnR3LaniI6PY5x1MT4AZpdRAytHIf
	Jm55jfJHde/wZFNPkNObGNgCVxPfAfy+qZh7A=
Received: by 10.223.58.8 with SMTP id e8mr6162962fah.27.1320860669935;
	Wed, 09 Nov 2011 09:44:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm7439748fad.7.2011.11.09.09.44.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 09:44:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 18:43:28 +0100
Message-Id: <70ccce0b0ac822a3fb6ab68d89cd22c5334db950.1320860288.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
References: <9eb3a8573af150cb4bf27b0b4404e527c9cfe931.1320860288.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320860288.git.Martin.Jansa@gmail.com>
References: <cover.1320860288.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2][oe-core 07/10] libsdl: rename files dir to libsdl-1.2.14 for faster lookup
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
X-List-Received-Date: Wed, 09 Nov 2011 17:50:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{files => libsdl-1.2.14}/configure_tweak.patch |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/libsdl/{files => libsdl-1.2.14}/configure_tweak.patch (100%)

diff --git a/meta/recipes-graphics/libsdl/files/configure_tweak.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.14/configure_tweak.patch
similarity index 100%
rename from meta/recipes-graphics/libsdl/files/configure_tweak.patch
rename to meta/recipes-graphics/libsdl/libsdl-1.2.14/configure_tweak.patch
-- 
1.7.8.rc1



