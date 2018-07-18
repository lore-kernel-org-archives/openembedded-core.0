Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id A0376789A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 22:48:03 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id w8-v6so2674178ply.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 15:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=BZz9sSEpdNRlzisr/CMYmjm1K7HI6iul7Iz/70xJBCc=;
	b=HDlcxUCi6OmF1wj6KHO/7JP4p/8497TsVz8PJfoPApuE3zVv7a86rnKgyhGkacDy3f
	eP62V3L5XN9JkZ2XaYlj7HXzPM68lffoZi+x0hJELSnC6RnyPf/0GdapUscu0iq4xpJD
	y7OzdtYTRlbbj45CwK4tXYqEIbDfD7RzpZHyLFym1EojDzdlFk/S1bnPCN6Hn4qQzfuX
	jiZh+2szJGVqYgyavmmP6tybVLHawMPsFpSCrHUbhZapNg5omufTT+x0sjYeupHBVVyG
	Tbf4XEfO3/pzfl5RpDkXODujsCZb0/s9ouo5BqugN3hQ0M+ZfvOnS/j8alYqT2wS3QKU
	WqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BZz9sSEpdNRlzisr/CMYmjm1K7HI6iul7Iz/70xJBCc=;
	b=IqXimKey2JrEVgIqAkaC4qiLGxHo22V3Cay43bc1oKZMVcqRQg76HF7fETjBfRfp15
	yFnluH1OWMG+VKKrygojydJrmEBUDY7Fe5nJlCoKnsQq9V+J1kypqqbN6/3UopzJbBVE
	cunzAbkO6OLE4XjyTmg2qmBK5eRQ9sY6TZ/oOxGv/64RU34Ktzopia4S+gtOvZfMeMaE
	+igWakVZmacIAUZk5a6K+ED1mRsm9LehNZ+Xi+aSBouavpa62IvsTT+m9PlycITyuQMk
	oitpdRF8I3ZusexItB5+dk4U7llCPMRjHvMWnWTT684MdP3VC/ez4Cbi49Zin1m+GB2Q
	KNSQ==
X-Gm-Message-State: AOUpUlFOwB51jshfyTWAgym9TVWMydPkZDiRQq0FfdtQHFPglyhIDskB
	ogD55kXgNrRYRpozM6AqhEE=
X-Google-Smtp-Source: AAOMgpfi9xUaENxc8/kZ5n059y9ocVHutPg6gzKNiDrjIzrr/NMblJC2B9o+JfYDb9yv2jCXouRThg==
X-Received: by 2002:a17:902:1025:: with SMTP id
	b34-v6mr7517528pla.112.1531954084682; 
	Wed, 18 Jul 2018 15:48:04 -0700 (PDT)
Received: from localhost.localdomain
	(50-196-136-220-static.hfc.comcastbusiness.net. [50.196.136.220])
	by smtp.gmail.com with ESMTPSA id
	84-v6sm11964343pfj.33.2018.07.18.15.48.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jul 2018 15:48:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2018 15:48:03 -0700
Message-Id: <1531954083-7637-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bind: update to 9.11.4
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
X-List-Received-Date: Wed, 18 Jul 2018 22:48:03 -0000

include:
CVE-2018-5738

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/bind/{bind_9.11.3.bb => bind_9.11.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.3.bb => bind_9.11.4.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.3.bb b/meta/recipes-connectivity/bind/bind_9.11.4.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.11.3.bb
rename to meta/recipes-connectivity/bind/bind_9.11.4.bb
index 1cb1f3f..7522fdb 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.4.bb
@@ -19,8 +19,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
 "
 
-SRC_URI[md5sum] = "4ed2a3f235595eadbd763b7ecb687ca0"
-SRC_URI[sha256sum] = "0d9dde14b2ec7f9cdc3b69f19540c7a2e4eee7b6c727965dfae48810965876f5"
+SRC_URI[md5sum] = "9b4834d78f30cdb796ce437262272a36"
+SRC_URI[sha256sum] = "595070b031f869f8939656b5a5d11b121211967f15f6afeafa895df745279617"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
-- 
2.7.4


