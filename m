Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu62-0005YU-ER
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:36:54 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=itp7GGgkVAHe2lTd34gesLJ/Wzbo78RNevgWQxkp734=;
	b=bFVLX1ctbPFwR8SGZalO6Occshk5HHy95Y+6tt3exCJKH/xNVb+h2owzFDdUhoHJhe
	gWAQW6U8oN0w0ihXh1udR6J7cit8eklrKz9wY/2ck3KXKIJXMdDpOokxp6osgGbCas29
	Jqq4ene5Zgrej3qGr6qO/QiMTa4FsqLzCoAuE=
Received: by 10.205.138.140 with SMTP id is12mr1179113bkc.139.1321029038783;
	Fri, 11 Nov 2011 08:30:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q6sm11731835bka.6.2011.11.11.08.30.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:30:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:48 +0100
Message-Id: <885ef53e3018510acfe8c3bf17a56ebd78984570.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 12/22] libsdl: rename files dir to libsdl-1.2.14 for faster lookup
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
X-List-Received-Date: Fri, 11 Nov 2011 16:37:04 -0000

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



