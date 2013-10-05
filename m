Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2536CD9A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:19 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so2303122eek.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=wGej04j9RrWxbo5OwZg/Kh47gJ/2LNdnKVrcqcwFgFY=;
	b=e3/bzMaSBfr2cvXAeBNOxoz2JCKzW+TO1ET1LWlQwmOS/d8OI6fxYFE5I6cSNn3iTR
	gvTAsIcHl9dSXOO7obQIhAfO80vHzQWfggaAD+OpSLlzTezj5c4OOnBnEbnrsXbUpAWl
	cbeklhf59PjBeDnqzE+mmX3QJ6ZyzwUi8CGm/QRAuFH3R3L4XAOr9FqSfknIL3dZW2p2
	F60htoCIsKmTZaFkUHDGOoPF1T5lfagOaX0Ib1aRrU7TPIyE8mL4WhT2TPFVccmDY3oe
	C5pkxI6sclIMkWzsZNnyKcIqZEKtrUxOTohINmvVKSoNKdgiT0R7JB8GHCKTNRcZfO8l
	sq0A==
X-Received: by 10.15.91.3 with SMTP id r3mr30691721eez.4.1380975800800;
	Sat, 05 Oct 2013 05:23:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm39214055eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:23:11 +0200
Message-Id: <cf398550378a2314eeba9ff4e0680bf85aba9207.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 14/14] systemd: Add PACKAGECONFIG for cryptsetup
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd_206.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index 02be793..a1a8bd7 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -53,6 +53,7 @@ DEPENDS += "libgcrypt"
 # Compress the journal
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
+PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 
 CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
 
-- 
1.8.3.2


