Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C503973232
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 16:04:53 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y7so1265237pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 09:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=v/ZDfoMNzIAE/oAGxnOC70HDLUqWtCxIc2G/UIy9j6c=;
	b=AL0TK39KJ0oF2VQTDZg8QR4PraGV6f1y8sUfKk97DEC1Z2TdWlx5shajbK+Y0SBx9Z
	l4wICC/QRf6SaKwq5R0pGseBZkhJSGYJatGjYkg1ZvX59NLv43VLsos8KqwHy2D31clP
	rNM6cZfWjixC6nm461qQwC/nF5FYvs8zM+7V5tXpGxXImAIibiBVXxGJx6TrZNjnOt0i
	vZoJOW/sljZJtfi2CootBhzyVW1dHyxrQwAf/4ZcNXkCE0bb0ZvoVXv5wxM8MLnKGLBS
	YJU5TSCXNyOmJwaTPme/FFRYBX+UoGrwTmT2yUITtXsoKkmWy0cyhj1mF9WkE1c41NIx
	WMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=v/ZDfoMNzIAE/oAGxnOC70HDLUqWtCxIc2G/UIy9j6c=;
	b=OMz1JDPDgiB6/Gpl8oES2jzLfP5muUhEXBeTLNnUU3Cytl+W0d4j1Rq0nwtj0p3gzK
	gSQF6IXtWdrwWwUd64IG08D0/DOSeZaIAkIDo6Yj3AgOKH8KLeEloaSxN3QoLBOK4qA3
	Rrug1OpzMpYxqgpZd9DMHXTbts7xZ1N0GUzUC3dlYLt+b/NYSHj1GfVRUgKrtIYt435a
	f/M8tp37uf859e6XHitIZ5EpRO6HIMAI+lFGyB72q66IFpstzkEQGcblEbJYx1aE3e6x
	Ks59Bro6HGGU6mgymtOwDxI+b4RRoaFJVtGrpobdzFtsdhm/lSltreU4mj6wqbiGlsfL
	Iknw==
X-Gm-Message-State: AOPr4FXdWkXMougW9mukPY3QgrbBUaKmXpTHGl1LbabYxK/GTvs219JUKPdMXHLLbx7agQ==
X-Received: by 10.98.79.213 with SMTP id f82mr59016348pfj.65.1462896294199;
	Tue, 10 May 2016 09:04:54 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	ez6sm5569097pab.12.2016.05.10.09.04.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 09:04:53 -0700 (PDT)
From: danismostlikely@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 10:04:49 -0600
Message-Id: <1462896289-15644-4-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462896289-15644-1-git-send-email-danismostlikely@gmail.com>
References: <1462896289-15644-1-git-send-email-danismostlikely@gmail.com>
Subject: [master][krogoth][PATCH 5/5] pkgconfig: fix build with host gcc 6
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
X-List-Received-Date: Tue, 10 May 2016 16:04:54 -0000

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

This simply disables the glib-2.0 warning identified by that recipe.
This package depends on host glib, so we can't patch it.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index d34f608..88c99cd 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -27,6 +27,7 @@ inherit autotools
 EXTRA_OECONF = "--without-internal-glib"
 EXTRA_OECONF_class-native = "--with-internal-glib"
 EXTRA_OECONF_class-nativesdk = "--with-internal-glib"
+CFLAGS_append_class-native = " -Wno-error=format-nonliteral"
 
 acpaths = "-I ."
 
-- 
2.8.2


