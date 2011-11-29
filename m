Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVNDK-00026n-7Q
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 13:55:10 +0100
Received: by faar15 with SMTP id r15so682091faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 04:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Fk4HQh0t18uZXkl0LI9g15wCZe4V7FSQS4kV6tD4NcI=;
	b=ZusFjtMJKR0dKpsF6cAN6UF8V3zJYJ6YE1Fb4PsQ1FRi0b4Zael2pN296x/zdkXfbR
	IWWDF6BF8HUySN5PaNG3+5OTtEx/PcWnzDAn3dmDZlHXNp/cj9T6k4Y9+CLHGo1Hgmf5
	IiA84LG3+CdCyyF43V8rzSIrOP5cIN9/Ssilg=
Received: by 10.204.132.78 with SMTP id a14mr47923227bkt.15.1322570911262;
	Tue, 29 Nov 2011 04:48:31 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f14sm36830178bkv.3.2011.11.29.04.48.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:48:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 13:48:11 +0100
Message-Id: <e16127fb070a9471785af330bc1799633d1a3e91.1322570605.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <9550d0f84844e9a22bcb999f9d706db50fa66058.1322570605.git.Martin.Jansa@gmail.com>
References: <9550d0f84844e9a22bcb999f9d706db50fa66058.1322570605.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322570605.git.Martin.Jansa@gmail.com>
References: <cover.1322570605.git.Martin.Jansa@gmail.com>
Subject: [oe-core 2/5] libsdl: rename files dir to libsdl-1.2.14 for faster lookup
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
X-List-Received-Date: Tue, 29 Nov 2011 12:55:10 -0000

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
1.7.8.rc4



