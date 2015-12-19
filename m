Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5368E731CE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:41 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id k90so81435705qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DA4huVGAnZJeH0nst035yC4CUo5l9sKKUYoL1cJf9Sg=;
	b=hzE8SkrWtMNl4XpRfCD1u3tU0foPlTh5ZBo2pLJ4DDdCvQ+oqn+r+e/Ssou12PM8HG
	6zIc4c850ezEcp6YqDm0Xu0qowQb5VJTjSKQfdyX+w20BBhAJQB/9DucfizzixmMlVwj
	wZVigoD6U/CeAYm7rBEk9tntuF2+gyOUqNjDhIEzMwYsWAh95clx3h6ZQya6DOHEYxcO
	UZpC+LXEQg8Q3x4FZtOfKnDSiywgdEvYh5yq3FKQDFgHkan+ljw4zmfTUG42kkxCyPx5
	PKgnp22QjFvZdb9L1V+68wG+k584ZiakhHtppAizwZUbwhN/mB56GXlVPs6/MHVAJq9Y
	mzYQ==
X-Received: by 10.140.251.215 with SMTP id w206mr15488867qhc.73.1450569162110; 
	Sat, 19 Dec 2015 15:52:42 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:25 +0000
Message-Id: <c3347b876ae936e85fa8a67afccf39b382036776.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 16/17] gnutls: Link with libargp on musl and depend on argp-standalone
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index c1ec120..5bcfc9c 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -2,6 +2,7 @@ SUMMARY = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "nettle libidn"
+DEPENDS_append_libc-musl = " argp-standalone "
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -28,6 +29,7 @@ EXTRA_OECONF="--disable-rpath \
               --without-p11-kit \
               --enable-openssl-compatibility \
               "
+LDFLAGS_append_libc-musl = " -largp "
 
 do_configure_prepend() {
 	for dir in . lib; do
-- 
2.6.4


