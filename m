Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C516E7197B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 10:17:28 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l81so25777824wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 03:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZMCm+fpCTrP1OBJN9EDIxz8iveIjbNA26q2Z/mXH70I=;
	b=aiPbphKdY9icCWukOTol4sGNzmiPqlnt1uzhzQ2zDpIFfD7HTecATaQFsb2GgBjepR
	Snlz+YnAHHtGdB2Pn0s6gSYVo2b7jaxBTR+XE+m8K8A2c5y5GikF3yY91cwB+GdBe9PC
	vwHNzijlvXo8iTn1WuQYa9DQ9jdo/41tr8qEdX39He1i3BfaNmDBmjV7HoJ8fyz3cPSX
	5S63+hR2cUiyO2q7nmSyAKGWyzkgNDUldCZTtde47UchIBKg0PODzzxF2F3MgiUU+pBx
	TjCLU6QqWx4nIwhh7IhDYuLDwEPQ/7Uv/DDJ8hqI1MEKEirZvtZVneuuVTYK427vdhqX
	q4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZMCm+fpCTrP1OBJN9EDIxz8iveIjbNA26q2Z/mXH70I=;
	b=IQTZaav8KN/qrh7b+dag5tVt6pqZfjH0Y77pZAmR5ujyPSeIQWnYjZ1t6mJFcdlx6h
	2jAzVsBwooF/qS1kTW8fh73bGPPhbE799f/2gSJdEWosZR+OUzP8XFKE/xgesqXvGl3S
	Rg4uSVp9bO58PwFoX2nEWfVuh/oaGS46RhobwEpmljoZx1pQrssar0jBRBkf6Qd/jknb
	y/yvTVY38EDC5iFMi6r6V8dGP1MtdlexYgJ5l6iMpM0vetCsN9UJPyCk3A9Ei6MKsn7t
	zJxcvSZjx+D4e4WND4HXcooqRUUhdnVp/A8ckE4lhhOtKQvDd6lffVofb2OizbFRrokT
	pmcg==
X-Gm-Message-State: AIVw111NSl0/6i+Lq9VXJxymY2ZtTGOAO3DiO1/t/xGYrrVMEK/JyqSa
	daw8VSxEuw1ScFIgiIE=
X-Received: by 10.28.154.85 with SMTP id c82mr7572501wme.151.1500977849010;
	Tue, 25 Jul 2017 03:17:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r199sm10645623wmd.11.2017.07.25.03.17.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 03:17:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 11:17:18 +0100
Message-Id: <20170725101719.2172-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170725101719.2172-1-ross.burton@intel.com>
References: <20170725101719.2172-1-ross.burton@intel.com>
Subject: [PATCH 2/3] libpng: use SourceForge mirror
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
X-List-Received-Date: Tue, 25 Jul 2017 10:17:29 -0000

The Gentoo mirror also deletes old versions when they're not used, so revert
back to the canonical SourceForge site, adding /older-releases/ to MIRRORS to
handle new releases moving the version we want.

Original idea by Maxin B. John <maxin.john@intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.29.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.29.bb b/meta/recipes-multimedia/libpng/libpng_1.6.29.bb
index 8a3056e1a39..be327caaffc 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.29.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.29.bb
@@ -6,11 +6,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9acafc1325f8f8da80aeee94dbc1bda \
                     file://png.h;endline=144;md5=0b2aa20c7ff55d9411108317df8ff0c9"
 DEPENDS = "zlib"
 
-SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
-          "
+LIBV = "16"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
 SRC_URI[md5sum] = "3245dbd76ea91e1437507357b858ec97"
 SRC_URI[sha256sum] = "4245b684e8fe829ebb76186327bb37ce5a639938b219882b53d64bd3cfc5f239"
 
+MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}"
+
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
 inherit autotools binconfig-disabled pkgconfig
-- 
2.11.0


