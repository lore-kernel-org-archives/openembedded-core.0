Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id D0C44785EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:12:04 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id s39so5296619qth.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 05:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=53Q3FdzCciD92c4/tkaY9UifjWWXi664dj/6vnitU1s=;
	b=Q8uvlCuuLs8cYZUZHk/s9Sb66dODKsvviJwjiSn2HdAMWGDqazHJxjlILgxBVKQ/Pk
	p4uO+7Q9DDcdAk1HVpubfSmxDdUKoQ7GbhprmH2YA/wtff0OMwzFQoFKxK1xJJONf/lQ
	wnn/D8Wo3PYUj575Za6Y63iql9K7/SuecaqiyAsbLl2iNA7wQWCpm5qjS7pRN/hcptAR
	LktDHFCLzYrje7suIbVovoNWhWqC0/ube2PdZXWfVIzgOLDnorn5CrJWkcf4iEXkgIWs
	kHXnjhJPAk3CqinTYaClxUcWQU+HjL29RCTbRa6GhnsKKUWgCfj27TvKzs4IpoUstVAp
	bWew==
X-Gm-Message-State: AKwxytfzE1dcfARpM0Bki4GCKc4E0tA3TngvRr7umsZINhgq1phSiAXV
	zGphzLG3ugb93i4MhUmD9NjRNg==
X-Google-Smtp-Source: ACJfBotfpLoQUR/Ni2TAHxzo8+4dupn7zL9d3FJAK+nVy9wLFoPl0rDsHXRLLpEaVFHrX4FpiJEnmw==
X-Received: by 10.200.22.91 with SMTP id x27mr11619970qtk.326.1516194725467;
	Wed, 17 Jan 2018 05:12:05 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	z17sm2762518qti.59.2018.01.17.05.12.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 05:12:02 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 17 Jan 2018 11:11:56 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 11:11:53 -0200
Message-Id: <20180117131155.2297-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/3] libdrm: upgrade 2.4.88 -> 2.4.89
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
X-List-Received-Date: Wed, 17 Jan 2018 13:12:05 -0000

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


