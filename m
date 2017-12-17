Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C011780B5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 16:34:42 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id o2so3354237plk.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 08:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6pzN1qLSiNjq+ybMdYQ9D9XbwH6nQnK4aJMVWpjzR54=;
	b=twz8vCCI/h9UXDQn+2T0wIlpzOGROK46p/FHilrOZUCxC2BSW+iwYUlVRM32KGut9Y
	G88a4ukMtaszH/9k+dpGvIMiyBCStbKn/8Lt6AxSnOMH+xOIhzPd8s3qy2FLHnTiNDkl
	D8aITvdaruOej/1TuUPWzKKH2KmTvw9Gd7QjxN0sjwFfW8gUSxCtR5gvEI63+zWR+la+
	jdld/fDjwffyZ8r7SSpTlrRfv7jOcHWfK+PninT+yOg4KDJfWV2rB5vb3SHY+6NCh6Pw
	xyJy5F5CyPeJgcQtJNm75czrilUMBtn4Z6XyerIv1sobZyXrdJrO4zDUVc0OVX2tC8Yi
	vgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6pzN1qLSiNjq+ybMdYQ9D9XbwH6nQnK4aJMVWpjzR54=;
	b=VJXNXw2OPstGqWBRRG/6NMtkfQRn4CkZA6PrXDkCKbfLBPK1J8LYsDfBaopPxk2NTd
	vL98O1wLs8jeTfeh3NKXzn6WZBSwfIX7kpSpM0c2rdShyGnvNtwS1V8+pGGJTdXna5rS
	vmQlMDhPCgena+w1mA0taa7wELeqv+H9e99CWdQYxXk0jlxOSrTDovD0ThQa72Mh/02B
	USxnVgUNKljWWdU6UiLQ7SesPqVPvJOj6kTux1nFC4wjrd6WO26YVb1Vb7haNOuiNDn1
	PukM8E2OG5UffSu2JZcdaai5oY47vUePgBtWbxYJnqqrTv7n6WrQVRrcSMqZ1ul/jFaT
	J0MA==
X-Gm-Message-State: AKGB3mKJV4rSPl8+N/VWKg4ev0zCE9whIPf0fYNs5feki4PU9JhUK+9M
	P7xeGQ1VBFT2D7mKmx5Cck4=
X-Google-Smtp-Source: ACJfBosEZThbS1VmLjAYCJkxKR1nd1RBbIGQ5NmtqEEespXk8XFZeryyWs0AGxnKIFBIsIWDqI/RGg==
X-Received: by 10.84.168.37 with SMTP id e34mr20030361plb.10.1513528483783;
	Sun, 17 Dec 2017 08:34:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:35e6:5321:54f2:87e6])
	by smtp.gmail.com with ESMTPSA id
	t202sm18393035pgb.75.2017.12.17.08.34.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Dec 2017 08:34:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Dec 2017 08:34:31 -0800
Message-Id: <bf3f95b5d254a69239c3d05420cac7966ab44fd8.1513527416.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513527416.git.akuster@mvista.com>
References: <cover.1513527416.git.akuster@mvista.com>
Subject: [PATCH 2/8] pinentry: update to 1.1.0
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
X-List-Received-Date: Sun, 17 Dec 2017 16:34:42 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../{pinentry-1.0.0 => pinentry-1.1.0}/gpg-error_pkconf.patch         | 0
 .../{pinentry-1.0.0 => pinentry-1.1.0}/libassuan_pkgconf.patch        | 0
 .../recipes-support/pinentry/{pinentry_1.0.0.bb => pinentry_1.1.0.bb} | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry-1.0.0 => pinentry-1.1.0}/gpg-error_pkconf.patch (100%)
 rename meta/recipes-support/pinentry/{pinentry-1.0.0 => pinentry-1.1.0}/libassuan_pkgconf.patch (100%)
 rename meta/recipes-support/pinentry/{pinentry_1.0.0.bb => pinentry_1.1.0.bb} (90%)

diff --git a/meta/recipes-support/pinentry/pinentry-1.0.0/gpg-error_pkconf.patch b/meta/recipes-support/pinentry/pinentry-1.1.0/gpg-error_pkconf.patch
similarity index 100%
rename from meta/recipes-support/pinentry/pinentry-1.0.0/gpg-error_pkconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.1.0/gpg-error_pkconf.patch
diff --git a/meta/recipes-support/pinentry/pinentry-1.0.0/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry-1.1.0/libassuan_pkgconf.patch
similarity index 100%
rename from meta/recipes-support/pinentry/pinentry-1.0.0/libassuan_pkgconf.patch
rename to meta/recipes-support/pinentry/pinentry-1.1.0/libassuan_pkgconf.patch
diff --git a/meta/recipes-support/pinentry/pinentry_1.0.0.bb b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
similarity index 90%
rename from meta/recipes-support/pinentry/pinentry_1.0.0.bb
rename to meta/recipes-support/pinentry/pinentry_1.1.0.bb
index 319acd3..3b77709 100644
--- a/meta/recipes-support/pinentry/pinentry_1.0.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
@@ -18,8 +18,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://gpg-error_pkconf.patch \
 "
 
-SRC_URI[md5sum] = "4a3fad8b31f9b4c5526c8837495015dc"
-SRC_URI[sha256sum] = "1672c2edc1feb036075b187c0773787b2afd0544f55025c645a71b4c2f79275a"
+SRC_URI[md5sum] = "3829315cb0a1e9cedc05ffe6def7a2c6"
+SRC_URI[sha256sum] = "68076686fa724a290ea49cdf0d1c0c1500907d1b759a3bcbfbec0293e8f56570"
 
 EXTRA_OECONF = "--disable-rpath --disable-dependency-tracking \
                 --disable-pinentry-qt5  \
-- 
2.7.4


