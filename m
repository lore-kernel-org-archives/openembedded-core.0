Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id AF97E755F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:35 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n135so198826182qka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=b0PW1yl2CbfVlh3GMtPo90feGZ2FwMt881+Vx/Ff3VM=;
	b=dba5ub9d9hYgUyQIlAJLAheADQIHSBg/EC8IWMlgflPFg27NI9CUYSBKgEihjAS6uj
	6VNOsKNupVdXLFSLJDa4H2wzqQWSXC0813zK8DFqyJOqC8LGMw/6BtdFOu7znATDqMUU
	1u1Nw9oO0YozlEUDw07WjyPkgJYDv9Uld3zt2OnTNpD3fmKvfCyGDxhqBTe3Yzp68zPe
	Uu2oAC56B8wzoXOumx2tKzSefCperncMsi0ijklabw7pdrwjfrtBu6PJ3PnBamGg250V
	vRmhbKKOyioIRVzaOZZm0QFPhJojtsLqWKkPexhbqCbUaK9C6uy2VRSwSll4UQbBsa5V
	1BOw==
X-Received: by 10.55.22.9 with SMTP id g9mr5395879qkh.12.1452248376246;
	Fri, 08 Jan 2016 02:19:36 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:41 +0000
Message-Id: <7b414e92959374542d95c9217cf9a47bb374c122.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 13/53] gnutls: Link with libargp on musl and depend on argp-standalone
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:37 -0000

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
2.7.0


