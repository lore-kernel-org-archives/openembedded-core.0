Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB127FBEB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 04:03:22 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id l17so13299126ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Dec 2019 20:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+oaIQA1eh8PKuCXFbjwd7Umqrk6F2EKhouGBvrCt8zc=;
	b=P8anEzA9qW5t7mdLoCjcr2EIoYne4unHVMRf8ljRJzMrWiw2DB0wjuPa4Yp6FMIZP7
	GIMpnO52R8V43AAhhHx2BP3zrrQc1dky8LfRgw/ApAEGFpe+UB242Zd4uY0MOLDogoDD
	IS+HPK98/AM0ZER8EXVKMiXavqc81zwB2Sr2JV49cOGra9W5Z6pFzrmNOPRbmSs2P0cV
	NcHDSIJ9nVS+9cUDwuxPbiCJRjgkXnEUCIQM0viHaJYPc5M3ZP4qcJFyQYD/DTPJH3JR
	OF4cinHE0Z5fnQqA5aGNc+3izc8hR7cniTf9Xo8HfkF2DlfVGcpf+jiSWH8KG4M1cR36
	xQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+oaIQA1eh8PKuCXFbjwd7Umqrk6F2EKhouGBvrCt8zc=;
	b=VfIYX7ShZ5jsbira8nVJ7gOi767azGQLAYc2kAtuzXb/epsFIDi0KXNxG9GPj1V/nj
	Zk7Qc6jEsrhhmyKazG861+v2kZLuH4rh59cMl7WlDZDX1aRWucmeES9ZgiYM9mX480oL
	caV2mDZSNDM3rDfIeqFZQlCzajMZFLb7xNAfqElvfHUmL5WbD39tr+YhOGZ3CNGjUkgC
	mCQ6rYU6551H6RsiBXBYDpYosL+mwSRJGF9l5Y2PYhlSR8QqzxMAZS2K7EEeeMYb1pl6
	76eD4lrGFSV83xvqFOkM9qHLRMbRRJjiZGGT7vuZIaVm5UHKowS7FGls6dJ0mBSFXL1s
	Euwg==
X-Gm-Message-State: APjAAAUiIpsWi3Ub9lC76u0MraIloGtNJ4HSj54SnMCzVi3J0BXln7od
	Y6qyfLZPd2HEMuJNll/b5/Jx5NVMues=
X-Google-Smtp-Source: APXvYqzGn2OctQ6BS9fObEKJ3hANT2BjChgIw6ZjGTLNQJfjl5XHR39r2CjZ6Cp9Hif6Q6UqD4RpcQ==
X-Received: by 2002:a05:6638:10a:: with SMTP id
	x10mr24461624jao.25.1575864202914; 
	Sun, 08 Dec 2019 20:03:22 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v21sm3465649ios.69.2019.12.08.20.03.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 20:03:22 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 22:03:12 -0600
Message-Id: <20191209040312.3475750-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209040312.3475750-1-JPEWhacker@gmail.com>
References: <20191209040312.3475750-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libjpeg-turbo: Build reproducibly
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
X-List-Received-Date: Mon, 09 Dec 2019 04:03:22 -0000
Content-Transfer-Encoding: 8bit

Configures the options passed to nasm to remove build paths in the
generated object files.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
index 1cf854de625..32d3bd93b18 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
@@ -29,6 +29,8 @@ RCONFLICTS_${PN} += "jpeg"
 
 inherit cmake pkgconfig
 
+export NASMENV = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_SIMD=False"
-- 
2.23.0


