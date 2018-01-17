Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 199C2786E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:59:40 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a5so22990031qkg.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 07:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=OKU1HsHCrLLna9WiJQOKXd4/KMmBEC/+Zj87OuQOip4=;
	b=XM9v6IBLeD5yHncKjhkURcsG1evUxljTlKoSgHLIYXDWqG8wSdvz848Lw37nXyL6GV
	1Y09Tz3TD1ZTq/Jz5tjIFpgUvpJBjNNsd3V/2XksJ6dYmpkx9IyNehTpbqQm+nnbgajd
	znSnqM8JtdJWHrz7aWL/JTVjvc55tsVinUHuwh9dbTGdgH3G7nrs6Io2hpSf93nEeHWu
	8LAMsh+euo+nGC9Bzmy97aSLToAFfNxxj1WRfnM14srtY9gnBhTO785dm2OpWMNLTzKY
	/+WhPj8M3c/v4FjcIL+Cx2Fd9KNpfXzaMA1/5qxRKKNlXD7lTLTS8YTRvIV/xvRucg1m
	EyDg==
X-Gm-Message-State: AKwxytftnOjkE0ta4iYbBmwoKRRyfua9pmCUsiBhWj4r3/gk4rDixu1W
	W9Tu8DlzrTIv0Kb0PO5lxPpbqQ==
X-Google-Smtp-Source: ACJfBouy0rfI+fn5xdTpVsRkOtg463tO6lCrkEN2hL8ATO8wknyY6cCbT67/8az1I6qjuPqnrH+iEw==
X-Received: by 10.55.23.204 with SMTP id 73mr52483744qkx.156.1516204781572;
	Wed, 17 Jan 2018 07:59:41 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	r55sm3299963qta.64.2018.01.17.07.59.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 07:59:40 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 17 Jan 2018 13:59:34 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 13:59:31 -0200
Message-Id: <20180117155933.29634-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 1/3] libdrm: upgrade 2.4.88 -> 2.4.89
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
X-List-Received-Date: Wed, 17 Jan 2018 15:59:41 -0000

The 2.4.89 version has been released in Dec 18, 2017, and has a great
set of features and improvements, as seen in the announcement summary:

,----
| libdrm release with leasing and syncobj api updates,
| updated amdgpu marketing ids, amdgpu tests,
| updated uapi headers
| etnaviv updates.
`----

The full announcement can be seen at:

https://lists.freedesktop.org/archives/dri-devel/2017-December/160530.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/drm/{libdrm_2.4.88.bb => libdrm_2.4.89.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.88.bb => libdrm_2.4.89.bb} (93%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.88.bb b/meta/recipes-graphics/drm/libdrm_2.4.89.bb
similarity index 93%
rename from meta/recipes-graphics/drm/libdrm_2.4.88.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.89.bb
index 735f734295..6754a93242 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.88.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.89.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
           "
 
-SRC_URI[md5sum] = "fe4d5c77f1468ee73d0bbb30d76945d7"
-SRC_URI[sha256sum] = "b5e55dbac2124e742e639f5b8553e8b7395863bf73dab4f77e99fe2fc25572b5"
+SRC_URI[md5sum] = "5307a147dde67ac643f6753a42b5d32c"
+SRC_URI[sha256sum] = "629f9782aabbb4809166de5f24d26fe0766055255038f16935602d89f136a02e"
 
 inherit autotools pkgconfig manpages
 
-- 
2.15.1


