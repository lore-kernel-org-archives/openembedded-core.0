Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXj-00066e-Bu
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:20 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so507847lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=24fuzzgCmety6Cn4E89P6OC7Cjlsru3Nr58uabJRMwo=;
	b=PSBS/vNsGEBMr6gVQhEeMzqmcOM+4YJNuygyStxfZLLH6jGDN7nTHEdN+fXdbPNF8I
	7Sa35BOFq7JVtxlQjXmJoV6LImPDpsksb8nrs2szqX2C4j29jVixxwD5f/dZn53/CtQk
	GiqIYM8H1BhxNyTNpI5GgpEZ/LQCdxYjC93FgCt9l7n+pO4yq3z7tgTSQC5OHhrry354
	ZjuD4Go/miTQF8DC7Cx/ZRuJWs7vEgOe5IhI4sILVqOU7MlI+l0n4qe1oafi9xFAwOWB
	69Mv3wwnMQw83BpVSh5fpB8FFoDfkjRvLbQEat7/rvd1yphMX88OhgAfV5EWYw+ABPdV
	jjwg==
Received: by 10.112.10.71 with SMTP id g7mr961924lbb.70.1354288562240;
	Fri, 30 Nov 2012 07:16:02 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id oz12sm2104756lab.17.2012.11.30.07.16.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:16:01 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeSJq-0002xy-Qc; Fri, 30 Nov 2012 17:15:58 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:36 +0200
Message-Id: <1354288544-10778-3-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354288544-10778-2-git-send-email-cazfi74@gmail.com>
References: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-2-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 02/10] glib-2.0: fix license segment md5sum boundary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 15:30:20 -0000
X-List-Received-Date: Fri, 30 Nov 2012 15:30:20 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. Old md5sum was calculated from
the beginning of the file, not from beginning of the license segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ed9bed9..bc831e6 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -4,11 +4,11 @@ DESCRIPTION = "GLib is a general-purpose utility library, which provides many us
 # docs/reference/COPYING is with a 'public domai'-like license!
 LICENSE = "LGPLv2+ & BSD & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://glib/glib.h;startline=4;endline=17;md5=a4332fe58b076f29d07c9c066d2967b6 \
+                    file://glib/glib.h;beginline=4;endline=17;md5=62b7bd0d17b98573dfb87495ac1c5b4c \
                     file://gmodule/COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://gmodule/gmodule.h;startline=4;endline=17;md5=76ab161b37202cd004073c42fac276ed \
+                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=62b7bd0d17b98573dfb87495ac1c5b4c \
                     file://glib/pcre/COPYING;md5=266ebc3ff74ee9ce6fad65577667c0f4 \
-                    file://glib/pcre/pcre.h;startline=11;endline=35;md5=2ffb79f0a0933f282f4f36cda635683d \
+                    file://glib/pcre/pcre.h;beginline=11;endline=35;md5=de27f2bf633d20a2b7af0b1983423283 \
                     file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
-- 
1.7.10.4



