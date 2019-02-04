Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id AFECF7C2CC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 15:18:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a62so237592wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 07:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hwrKp+opxh5hSo/nbBwzHmdvTXhXbNSs1zcCLGU8+PU=;
	b=m/rFUpGKYDQ+bgAT/G4SjAQzKJy9I0buoys+DwU0TUwP0F0u+QjT8AjpJrv8MBu8PC
	LL90mCijGlNdQQR1hMSSuIvzKUGCtYIMWdGoOf4JI6ylGx6e3FoOYqVHMmLgIHOQFHsH
	8o/D0uGgaK8o1N/EwKTIti2jHHKJlmrx4aL7gZait0z/NR2HQF2YBhHmsJhR71KsWVFi
	aY4ymqiVxg69RXqe5xyp71JQMFMpo1rWlXD4XN+aaR7/9rFIgcknnQwXgUhk6ZrsFA3D
	3j/CXOqexqL+hGlBm9S47SBkUIfi6Kn71xZVlD5Cu57AB/Cul7g+0G1elVSYMqpg8ltI
	948w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hwrKp+opxh5hSo/nbBwzHmdvTXhXbNSs1zcCLGU8+PU=;
	b=CA2Lt2CCwo7j6bY7yADQ8ohL9ahOu3o/2P1qsXsI+ugbfVVqNDkcsczx0SSH+kdhaP
	xnjc4I6Zh2Z4ewplXeTf8hjNNE+eiuapqRJkXePhWlAQ1RI/CDj2H51eOfzPlWqY+Yo6
	MA/Eybd+EaIsgr33zjgNCU1nmnvmvlBj6XjgsioIgY6owTOqKUqbWHlkxOTBVMBeALsR
	Wgdbi7OzGtQUw+GDKgwqHN0Li/6UMokQBvfQf7K1buC6EQQ6cC6wqxjJLZQh9PiVuLyK
	4BL1IlSdxVi4YOhLoBhwei2vIdsOyaZgw24yAKYcrDEnqTrb5gjqv3Lq8T3vJkXsjMGN
	8bvw==
X-Gm-Message-State: AHQUAubkDKJ+m/1bCfoF7dSbzRYx2ZfoQCYsq5VcgxJRNSqZjBdr6VF6
	mQStLye3jwpufX5n1neXIjYdhRhg
X-Google-Smtp-Source: AHgI3Iac1Ooc6R78j8wJETRYJz130ugLJ1Bo/H5EgFqYFmCwhEdbZ3oOhLWpvwvNq72ccKlnE7QyAg==
X-Received: by 2002:a1c:6e06:: with SMTP id j6mr14353218wmc.3.1549293499015;
	Mon, 04 Feb 2019 07:18:19 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	s16sm15417746wrt.77.2019.02.04.07.18.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 07:18:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 16:18:10 +0100
Message-Id: <20190204151810.12755-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190204151810.12755-1-alex.kanavin@gmail.com>
References: <20190204151810.12755-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] python: make the python 3.x version of 2to3 utility the default one
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
X-List-Received-Date: Mon, 04 Feb 2019 15:18:19 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python/python2-manifest.json | 2 +-
 meta/recipes-devtools/python/python_2.7.15.bb             | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 81f1c24f97a..eb52e862ab3 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -109,7 +109,7 @@
             "core"
         ], 
         "files": [
-            "${bindir}/2to3", 
+            "${bindir}/2to3*",
             "${libdir}/python2.7/lib2to3"
         ]
     }, 
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index f462d087251..8df1dfd1ba6 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -131,6 +131,9 @@ do_install() {
     if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'bdb', d)}" ]; then
         rm -rf ${D}/${libdir}/python${PYTHON_MAJMIN}/bsddb
     fi
+
+    # Python 3.x version of 2to3 is now the default
+    mv ${D}/${bindir}/2to3 ${D}/${bindir}/2to3-${PYTHON_MAJMIN}
 }
 
 do_install_append_class-nativesdk () {
-- 
2.17.1


