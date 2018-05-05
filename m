Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 357E374D80
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:44 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id a13-v6so16458797pgu.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FVSh+HMUfB53l3u2iev7PAPk2oMLReQtBeKA0bW8sEI=;
	b=E2H4gc4LBXeSAZWnRoDhd//WRO09BmtOzv2HDyR8KXn5USbcwaTUikOE6GTkqFUUGa
	xVFZw2AF5jwryWdOB+0kyoO+JM4/LoWPX8bMCwywEHr61VOQyB2vVxMKvKQQfzHjVntA
	FwdLvctjzrN4t8FZjqZw5o/+f6mVe+32ysz7U94Xns2A6PEC5bIx69JByD/caPESIflh
	zmr/P0NmuXxNhzrLz3ePFkGtWRASH/OCgVhgRZnB1VdrkA8vOacSEHmwZrWp3wigdrNV
	fTsAjq7/bob3GdnKg2je4dukn+vsFIZupKT10WYmu+bAW5nXQga2+4iq7O0iDIytBdd5
	Do8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FVSh+HMUfB53l3u2iev7PAPk2oMLReQtBeKA0bW8sEI=;
	b=thYE1uqQms71V2PkyXiHYKNYv6T13OWJ3agbh2BH9IUKnj/IaDOK0QWG9bIAbU2tNS
	ByD9WSpzM8u+JOxovFGl9/t8SBPBJO8VywPtsCjm/Q/YCzSn99UqfJWrkNl1NS7pthat
	tCNQkMM3FqfepAPJmN1hfTH5wX6uAbOxjQsFvhZHzFwp9tyGq6jkg/BHo9vgWmhBYG5k
	a5Dh7lMaD1ou2Ow3Utw0MX4LVW5YiFWyIgEVLHrW2UlSc+NH+XHmYGZw6BcejU0nfEoq
	CRgYLU4cUVQpM5TmmCJ58BIrdVYftCXgQ2lHl787wrRvhfFIfrCAGrLJKAtZGAacCqFt
	Kjag==
X-Gm-Message-State: ALQs6tDfiDMbWMR+DyDKD7kDjyIyqXwW2VDk9KYUc3piNX5h55Ot7zva
	Sg3ApjqjnuA3Ci2Chjbaoiha2A==
X-Google-Smtp-Source: AB8JxZqtfzxyxlzAkGs0HlQ2Z0Ijw8Kvk4EtLFh/+BD/mT2IU4TtcE/gPFwjzVAFaHmfJHnlSxo7wA==
X-Received: by 2002:a17:902:8c91:: with SMTP id
	t17-v6mr30172426plo.182.1525479286035; 
	Fri, 04 May 2018 17:14:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:14 -0700
Message-Id: <16b82cbd23979b59491d1289e1d5d762c2ebc17a.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 20/27] libnsl2: Install into /usr/include and /usr/lib
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
X-List-Received-Date: Sat, 05 May 2018 00:14:45 -0000

Extend to native and nativesdk variants

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index c6ba80c943..c3a24face1 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -21,13 +21,4 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig gettext
 
-EXTRA_OECONF += "--libdir=${libdir}/nsl --includedir=${includedir}/nsl"
-
-do_install_append() {
-	install -d ${D}${libdir}
-	mv ${D}${libdir}/nsl/pkgconfig ${D}${libdir}
-}
-
-FILES_${PN} += "${libdir}/nsl/*.so.*"
-FILES_${PN}-dev += "${includedir}/nsl ${libdir}/nsl/*.so"
-FILES_${PN}-staticdev += "${libdir}/nsl/*.a"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0


