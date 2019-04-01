Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 401FD7D0C1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 13:52:31 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y13so12185638wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 06:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=duuinqy6ZVhF+4ASDby2dronEnRuKK1QkGgw6mv5+Wo=;
	b=C8vItBtZI8nPAFjSFbIksFKuY4FeuY1QFN3kQ8oundd9kMLcW7Vi6DdBEGqS3YKQpu
	tVIQ33wNrhsEdU24xPYh0bBwUBLEcfbiIvj+0qKdgL4KUvnIbUKs05BO0IpdzACbRCR6
	T4CSEsresHpAN2O6wQZqaxt+NVtsGI/xbCwU1g2bTvATQ/v8ex2AVSw8pD0qzRgdWgCe
	KWMqZjJZeaJ4NLPGcRdpKAWT5s4hueUMCFGlj4uISvTSexwVYyguCn31TXLm9HJscgY8
	z/KOFFBfCGy9oHcsLB+0oBzZbT1VCmkjZIB1csTkW8TtWfOZqOK7KApIdpyrdUIy1tZ/
	24Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=duuinqy6ZVhF+4ASDby2dronEnRuKK1QkGgw6mv5+Wo=;
	b=WLprb6YSxSSCirlwD+XR27hiW8TaLzZeHm3ACiVV+bSMZ15VQfVq+wZ4B/nqNMRDSn
	wyntua9U1EgPonDAXKYjgjuT6CSFzpDJmMjoG8ylVURU159cJMip1NoVvm0BCXmyato0
	XAuWAjmGjIpj7UtEsTNIUEyNY2pj2rlFrpKc9aEbGlH5GyrhtFxd/h9XyHWhfe62H59n
	oPmfv4xpYGG9oTxM05XVY9gmM7yfu/eyg1nplyAUBVdU9KI+szi/JXTlhGTTCu5Lk3CE
	/sIHvP8lz2XfXsrOUMlxtX9OqQnNegjVPoXjK3YsdXscW+k4bEt2Ly/p3+w+ti1asIL4
	SXyw==
X-Gm-Message-State: APjAAAUYvhKZw3QNBRNmyCGW92/Z13WG99eV3R+Rcd5MqpKRJBhUKnqn
	zDX5fUu++0Kq+l7f6NPMVwNNjgd+
X-Google-Smtp-Source: APXvYqxO9KYd5gVDUj1DJ2uWg7hN7M7jk9+gQjRY2OCR5cABqIAAexTg2GdIcT7t5ZlR24TeGQtACA==
X-Received: by 2002:adf:f10c:: with SMTP id r12mr40225822wro.216.1554126751829;
	Mon, 01 Apr 2019 06:52:31 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	r196sm10421385wmf.22.2019.04.01.06.52.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 06:52:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 15:52:17 +0200
Message-Id: <20190401135217.17431-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190401135217.17431-1-schnitzeltony@gmail.com>
References: <20190401135217.17431-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gobject-introspection: auto-enable/-disable gobject-introspection for meson
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
X-List-Received-Date: Mon, 01 Apr 2019 13:52:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/gobject-introspection.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 4ceb0c68b1..968792c0b3 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -6,14 +6,21 @@
 # This also sets up autoconf-based recipes to build introspection data (or not),
 # depending on distro and machine features (see gobject-introspection-data class).
 inherit python3native gobject-introspection-data
+
+# Auto enable/disable based on GI_DATA_ENABLED
 EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
+EXTRA_OEMESON_prepend_class-target = "-Dintrospection=${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'true', 'false', d)} "
 
 # When building native recipes, disable introspection, as it is not necessary,
 # pulls in additional dependencies, and makes build times longer
 EXTRA_OECONF_prepend_class-native = "--disable-introspection "
 EXTRA_OECONF_prepend_class-nativesdk = "--disable-introspection "
+EXTRA_OEMESON_prepend_class-native = "-Dintrospection=False "
+EXTRA_OEMESON_prepend_class-nativesdk = "-Dintrospection=False "
 
-UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+# Avoid triggering configure QA
+UNKNOWN_CONFIGURE_WHITELIST_append = " ${@["", "--enable-introspection --disable-introspection"][(bb.data.inherits_class('autotools', d))]}"
+UNKNOWN_CONFIGURE_WHITELIST_append = " ${@["", "introspection"][(bb.data.inherits_class('meson', d))]}"
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-- 
2.20.1


