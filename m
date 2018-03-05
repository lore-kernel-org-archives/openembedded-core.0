Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB74078A73
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:20:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z81so17420785wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=X6QBuSwKjrompwzXprgweq9alXAIj+KhlZSUUgtOOVE=;
	b=G1+2IIc7IEGGl/0hjqggEQ+CHqcA95CxJteaHyJc/oHC6z3p9G88pZhXtaCocWSB8f
	w8cbwUoRoCa3XH6Vs1OJIn9YldpBeBwuzxHGCBOxNPfE+blFi0SA53E70CDYkGkRvL4E
	X0Yt+ET0pxYjjU4wu22EOqKOZWkQW38G5Ncv3qtvjM+XG/qVqHkOKuudR7HsJQScvtCN
	f2zJkq6CxONTsBKsu6T49PIabSPxzgS/mqLgS7EJMATz1rH/BvEW/Khp5aItKWTPTHTJ
	paHKTp2jRdUEBCf5TApqiMQ71Yhc5KllK3+hFxx9ezcSGXqVcQ2MVji8lgY5TX4zswZK
	K9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=X6QBuSwKjrompwzXprgweq9alXAIj+KhlZSUUgtOOVE=;
	b=uNH8lwIh6SQdKPR6LEUvgwUoOZU70co9ficoA0+k0crBRXsD1IzYMKMZo4iA52NFA1
	67c2ODNRrNlwtwCGZBMlMr44MiishFp98eVb8f5u4AK6U9GC3Pavd/nQFB8ockK2+NYJ
	j+svh4A4BIE68NhltvWreE/eobkHs4oWQs5elA40uDTiNE3BybkZ8aeVWO9gt82W8B36
	CTc4sSPqAPe0mauJdY6BEvqMM/jPc1k+O74Kgr6O91Bg7x+ZKOkrKeL6X5h+E6ah+8b0
	flpoH0nsDaF3sfQz/BjdvdRIr0xmmfcSWdB9jTGXLnB8rXlDjDxBz9VHj4HEa425rRkh
	ug3Q==
X-Gm-Message-State: AElRT7E0sKgJTQAyB54DtqKQ7nn6HRb3BMcCZakQ7PYqogUIt7iafmq6
	YXttBBciJG/1/J7S7mipstp5jsOH
X-Google-Smtp-Source: AG47ELtOuNizkT2NmObAifRBW0tJrL8xWaC3BZnRIvnxgnm7bUN4MrEoyQO+K+UkuM3c6VfAK+Kv0g==
X-Received: by 10.28.65.84 with SMTP id o81mr8731193wma.19.1520270452724;
	Mon, 05 Mar 2018 09:20:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.20.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:20:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:19 +0000
Message-Id: <20180305172046.21729-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 02/29] dbus-glib: refresh patch
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
X-List-Received-Date: Mon, 05 Mar 2018 17:20:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/dbus/dbus-glib/no-examples.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib/no-examples.patch b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
index fbb49678282..32e76117188 100644
--- a/meta/recipes-core/dbus/dbus-glib/no-examples.patch
+++ b/meta/recipes-core/dbus/dbus-glib/no-examples.patch
@@ -5,11 +5,13 @@ Upstream-Status: Inappropriate [disable feature]
 Signed-off-by: Kevin Tian <kevin.tian@intel.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
---- dbus-glib-0.70/dbus/Makefile.am.orig	2006-07-23 16:04:43.000000000 +0200
-+++ dbus-glib-0.70/dbus/Makefile.am	2006-07-23 16:04:52.000000000 +0200
+Index: dbus-glib-0.108/dbus/Makefile.am
+===================================================================
+--- dbus-glib-0.108.orig/dbus/Makefile.am
++++ dbus-glib-0.108/dbus/Makefile.am
 @@ -1,4 +1,4 @@
 -SUBDIRS = . examples
 +SUBDIRS = .
  
- INCLUDES=-I$(top_srcdir) $(DBUS_CFLAGS) $(DBUS_GLIB_CFLAGS) $(DBUS_GLIB_TOOL_CFLAGS) -DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"$(prefix)/@DATADIRNAME@/locale\" 
- 
+ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)						\
-- 
2.11.0


