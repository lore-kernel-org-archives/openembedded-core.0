Return-Path: <danismostlikely@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 54B8D78332
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 18:35:54 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g130so29203747wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 10:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NFpg7ptVBFqrwLaHcO5sAd/CqGZpb6JXnd8KyftOm4w=;
	b=RCyHgIJumcgJGRv0KC+NTxdlaTB8jbIBgJ8vO0+mHWJ2zCzhXM/li+XE+FSRd9pcgO
	xLS2xRg69nUryLKKfD2hM8q8x1allyrxLxXR/dxuK3epumrfVzt+cijW6k0u57Y37Mnu
	YshcT0QiMUud9AEOuyrJWs1ODYkjxrBcq4+Tw2JQv/FJcdTGHGWO86eeBOkLQjF/fzIY
	ObkGXxXrQ8ka18tbF+0J88A1sKLjgGCjtaQCRxAbpedTQdoPxk+89X9wP155vnS4JjS1
	JOKgnYcN75xzZSfx3yPg2LhmLUFK1x+xnkSg85gdslYUHD654/Db9//ITO1EdMuC3GmQ
	JOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NFpg7ptVBFqrwLaHcO5sAd/CqGZpb6JXnd8KyftOm4w=;
	b=nuiVmoECcvMCwK+ipyx9sGtOW6KIaqf+N4pF7z4heW01uqWAPOeWXWhQ7vnG7pJA05
	het7hMuaPyUaATzfsjX9ZRkGxWoMHUGsvHBWGd4TJJr4j2hgnwsOAWRSy07TTC2TdxsK
	2gUJmSivlVn/xQb6L0jFYCAqiBkoKMr0SNiMLIGxN8LmPz2AuKg92DRPPu8JMMcv4GE9
	POXCOFxsUAy+tzWPK5Qy+lHvyPavtnnW926c6QKNslugwAGRv17WVE+kLM1MoodRppwm
	98I4T2jhc04wYKCyQmOASZT5HDo6bSTUVchnzOmLOkX+yVmrkpbsPO8TafFckV7OmWa+
	Fj/w==
X-Gm-Message-State: AJaThX4F+3Om09aP3NXecNAWlBWRfdU9YxZIi8k+eiFsfNWefBxNSAaU
	ajz1fXHac6cJZAHr9PmYr/aCjPmk
X-Google-Smtp-Source: AGs4zMaK5QwzkfyTu8jGFhx/4dkmcxf86tZklOJtzXJLVloODQquUffnaH2qpkUCrqzIPavusUEa8g==
X-Received: by 10.28.236.6 with SMTP id k6mr2269660wmh.95.1511807755605;
	Mon, 27 Nov 2017 10:35:55 -0800 (PST)
Received: from shadrach.local (204-83-204-148.prna.hsdb.sasknet.sk.ca.
	[204.83.204.148]) by smtp.gmail.com with ESMTPSA id
	o135sm11400593wmg.1.2017.11.27.10.35.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 10:35:54 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 12:35:38 -0600
Message-Id: <20171127183538.68275-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.15.0.106.g7bc77766e
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH] bind: fix python3 dependencies
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
X-List-Received-Date: Mon, 27 Nov 2017 18:35:55 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Add missing python3 dependency, and use python3 from the build
system.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-connectivity/bind/bind_9.10.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.6.bb
index 8b8835ba80..0cf572af26 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 LICENSE = "ISC & BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
 
-DEPENDS = "openssl libcap"
+DEPENDS = "openssl libcap python3"
 
 SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://conf.patch \
@@ -38,7 +38,7 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --with-openssl=${STAGING_LIBDIR}/.. \
                "
 
-inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
+inherit autotools update-rc.d systemd useradd pkgconfig python3-dir python3native
 
 export PYTHON_SITEPACKAGES_DIR
 
-- 
2.15.0.106.g7bc77766e


