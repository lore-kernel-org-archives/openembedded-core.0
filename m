Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id AF70A78ACA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:17 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id n7so18113102wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KE5aHX7m4/BPbe/U6fkYuDgPMZQ8nAIcM0W0JhmANes=;
	b=UKN+o7Lhe6zn1IuSadpO8zcXbeYkWqIDmsWgvoNSUB5Gb53cKQsmzHoIKuB5m2g2ek
	Z5nQLWdFF3lYonUSrGQibnQ8YsfzQ1n2O/VQqaeZh9cV45xQy2REQhswcHxr0zg+76Zw
	j531rPNUpx0hnDv3O+zMf2EGIV5I7eetxddn4vuV6z9yroPhdXiROY63rRfvMPxW94be
	McNvVqJfIhA+Ya+mrWZviMXOGYzd9STyok/3il2Vou6/1N1oAotGGI+3dVb0cED5tMAM
	6JbKyZSNuj4j76UjwKkH0cKF+JY1yKvxmxoMj+YpWAtxiMsjdTC/7B+GalEVVNehIyK7
	eiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KE5aHX7m4/BPbe/U6fkYuDgPMZQ8nAIcM0W0JhmANes=;
	b=H6O16GJSMWzCbEAf3JWKDAxdjx+BiGxjrsYdCkqqWLJyvFLHsoebY/1sz5pABrsdmp
	4tLsi5pFW+5BWdvcnuQe3bBD3y+ZAh3rWUwhmF4MeWAE19KbU7CB/I3aPhsJXXLfIhCP
	BIDcGSIxbVqYIcmYEbYboFVyO7OzcpExDrYVTrDXT1INfWfZ7sLN5gm/9ytBNyBrlwXS
	S6QzSHbk5mH0h32yK34oxICaQelZSoLN491MDeEoKHu26CBrStS0q/exdeY3H9PqWCpF
	tNBzbrLh6hsR071GJiun4/OlTrsay3L/3tOIy0QFjChWKgkk9C+vm/N4F0NNB76IamxM
	9BcA==
X-Gm-Message-State: APf1xPBxkXmwaiWfe3zW4s+jJCc4CBvirTvEGNJf8M+VF5eHP1HyNVyR
	QIhZhAFpk7FYduhGRukQlAcqzaNE
X-Google-Smtp-Source: AG47ELtv2+Y5h1WS8nUpXI3KflKaGBVcd9YH3DDiFoXQVr/Nir3f8eiet/aU11f3W3rKm7D0R12yMw==
X-Received: by 10.223.128.201 with SMTP id 67mr12951811wrl.131.1520270478648; 
	Mon, 05 Mar 2018 09:21:18 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:43 +0000
Message-Id: <20180305172046.21729-26-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 26/29] xproto: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-proto/xproto/xproto_fix_for_x32.patch                 | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch b/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
index 8a5ff58b91c..4f9ed99c9c9 100644
--- a/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
+++ b/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
@@ -10,13 +10,15 @@ This fixes compilation with x32 toolchain.
 Received this patch from H.J. Lu <hjl.tools@gmail.com>
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
 
---- xproto-7.0.22/Xmd.h.x32	2009-07-11 04:19:50.000000000 -0700
-+++ xproto-7.0.22/Xmd.h	2011-11-30 17:14:19.290395893 -0800
+Index: xproto-7.0.31/Xmd.h
+===================================================================
+--- xproto-7.0.31.orig/Xmd.h
++++ xproto-7.0.31/Xmd.h
 @@ -62,7 +62,6 @@ SOFTWARE.
       defined(__ia64__) || defined(ia64) || \
       defined(__sparc64__) || \
       defined(__s390x__) || \
 -     defined(__amd64__) || defined(amd64) || \
       defined(__powerpc64__)
- #  define LONG64				/* 32/64-bit architecture */
- # endif
+ #  if !defined(__ILP32__) /* amd64-x32 is 32bit */
+ #   define LONG64				/* 32/64-bit architecture */
-- 
2.11.0


