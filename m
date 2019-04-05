Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id B2FE67D509
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:47 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r4so6548254wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=tdccyjSN6B3+Udkmeng8Q2ni9t1Bgp1qkh6mvWK17U0=;
	b=hlHVZmW0Q8jeT7jO6l9N7VMUcmCDA1JCoxFBh70uzQCdfWaxFoL2mB2LcjmByIvaiA
	Oa+Vv98w8tseLmgUz51X4DV6G+ZXexlf1ACfMZhnFemYsaeyuSmZ2nrArVw39jj2/igL
	Ow/V0ykkKSw7jqV9EupOatY+capyDOOch6t+jrZCTVZk8RfJ/JY6DRCSdc82y+diwuSa
	AXCVsUo6ltaSHoE6VBbUXAK04Yt38W7kw+RrrU8Fe/HMxPZIMTTx7WTQjPmB5qv4CUfL
	NORcrfhWyFCvkqqT4ljdLymwPcIyzY4PKyWvdwnMVRAl1AIWjEkOOJOu+x4nn0w5mO7m
	qZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tdccyjSN6B3+Udkmeng8Q2ni9t1Bgp1qkh6mvWK17U0=;
	b=oIvO93DAAzyaLYdrEJZbcT6+2leoh2CHmVdcJxn4oPw0///hWX+Vq26MELclW21q2t
	88E+jes8Wmb5qXMFcIX7cwM/MfnbKvvwGxcXGAFqotjdSmb0kiUZGBqmg5nTQyM43XpR
	bm9hZwncI2GSU7X0cpHLCqFOiyjL+cj1DkLypOS/ANzAqI6LVyXZ0me2n8aOiRQ3cC62
	+ac7Swh9HIwkgPluVvlN/8J7Z6MsDLQT50zs7uoqzBbx21Za2rFkkOuhQGg2pW4n4tQp
	ceQbxZQ3T5b64l34vBXop674Pzy53uoad/8vcI+MOv/8YIZscGw4S4rzSl8dyfUs+tFa
	jaqQ==
X-Gm-Message-State: APjAAAV1ah88xqFVVWZiuOKh5271jvdQOo0kk0t8BGQnrZnUh6LFm5RF
	DrBF3VZu2rNQQzU0cUkEhRo46LYw
X-Google-Smtp-Source: APXvYqx7kNOv6jN8k/1yyNp1wfc84spMfM67XA8JmGR3bhR26qbEHh8zSM+wGmDQUaVVRXVU14SPtA==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr7293691wrj.16.1554446268427; 
	Thu, 04 Apr 2019 23:37:48 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:25 +0200
Message-Id: <20190405063736.29750-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/13] gobject-introspection: auto-enable/-disable gobject-introspection for meson
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* the class sets defaults used most common which can be overriden by recipes
* UNKNOWN_CONFIGURE_WHITELIST was removed for autotools (and not added for meson)
  as suggested by Alexander Kanavin [1]

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/280716.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1 -> V2: Introduce GIR_MESON_OPTION as suggested by Alexander Kanavin
V2 -> V3: * Add GIR_MESON_ENABLE_FLAG / GIR_MESON_DISABLE_FLAG
          * remove UNKNOWN_CONFIGURE_WHITELIST_append

 meta/classes/gobject-introspection.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 4ceb0c68b1..504f75e28d 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -6,14 +6,24 @@
 # This also sets up autoconf-based recipes to build introspection data (or not),
 # depending on distro and machine features (see gobject-introspection-data class).
 inherit python3native gobject-introspection-data
+
+# meson: default option name to enable/disable introspection. This matches most
+# project's configuration. In doubts - check meson_options.txt in project's
+# source path.
+GIR_MESON_OPTION ?= 'introspection'
+GIR_MESON_ENABLE_FLAG ?= 'true'
+GIR_MESON_DISABLE_FLAG ?= 'false'
+
+# Auto enable/disable based on GI_DATA_ENABLED
 EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
+EXTRA_OEMESON_prepend_class-target = "-D${GIR_MESON_OPTION}=${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GIR_MESON_ENABLE_FLAG}', '${GIR_MESON_DISABLE_FLAG}', d)} "
 
 # When building native recipes, disable introspection, as it is not necessary,
 # pulls in additional dependencies, and makes build times longer
 EXTRA_OECONF_prepend_class-native = "--disable-introspection "
 EXTRA_OECONF_prepend_class-nativesdk = "--disable-introspection "
-
-UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+EXTRA_OEMESON_prepend_class-native = "-D${GIR_MESON_OPTION}=${GIR_MESON_DISABLE_FLAG} "
+EXTRA_OEMESON_prepend_class-nativesdk = "-D${GIR_MESON_OPTION}=${GIR_MESON_DISABLE_FLAG} "
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-- 
2.20.1


