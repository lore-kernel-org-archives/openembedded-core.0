Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 083347E584
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:49:10 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 10so12243023wmp.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VIhe/XpcZxhj5pZINKmS/+/bUksyGdQ5gYzxG54xFmA=;
	b=KKo9Fa3kG/vBfEFOPkUsw22p6eFYj6ghEj4YGkePRcWH3u6/hhUvd4AJKLd/z9JkVi
	glyV+f7A7g1PtvwK3s3hdQlBB6sLI/btaAhmyprw0dZj15s6IensL+yQQY3vF9/KBCw6
	20tg4ZrMfK6nLzd6Vbl4bFtiAyFjiBnqqWHge/n2wcrAnZb1u71JQu9ekvPjpPl7eSJr
	fJ1IwJH8Ha0bNYLzJUZNv7CvzaZS4/xBkU0TSNYzB6YiNEJu1vGDSvc2yrm3RcHWPi5w
	6bKwjaBoTXP0WyJMNXgUc1AEOWOwViGpGrbypSL82A1Q9+a0xeW+/cJr649WMcPrHt3M
	XgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VIhe/XpcZxhj5pZINKmS/+/bUksyGdQ5gYzxG54xFmA=;
	b=fr03LQLeG3dKe+dYIq3/B9zpixegMIJokjejs/geuy1qyNmjr9cjsgukB5Ehh4wY5w
	AH03gI9AkvUcSxPudCRyfSFteKec0aKC6abyVHGerGkX/0miDP9MUHz+NUM2MCmxkDx7
	38ASAo9VahY56Bt33ZOzS4Kyg2dasmvas5Q5clk1QKbwqey3pZtxlydKyJzLIKkFjhVi
	f8V9JOAN4T8rm9S3m3OD2IEBDz4l+q6QnbXPWScNDBNeXZsTodBuMLMycbq+Ktv+N9v3
	/HMyQKX3n9dwnnAxUABxBDNtsMo/q4TZykLSfaO/u8ivCituhZ45ATHQujKpwlt3aVd3
	SocQ==
X-Gm-Message-State: APjAAAUmkenieeO9+O8HCcM2Fc1XnsV9kCgc37OCWFPxD+WlkKV3TTco
	XTsYM3311FtDrpDS5mFAN4Um2PB1duE=
X-Google-Smtp-Source: APXvYqxBBoNxGQQtKSFmcyuM76b8ZZwQ/vhCJinvVvdwb15wES/6SnYa9SaSGnJCucTIujBk+EGvlA==
X-Received: by 2002:a1c:a503:: with SMTP id o3mr26657118wme.37.1565617751477; 
	Mon, 12 Aug 2019 06:49:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t14sm11932646wrv.12.2019.08.12.06.49.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 06:49:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2019 15:49:03 +0200
Message-Id: <20190812134903.55045-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190812134903.55045-1-alex.kanavin@gmail.com>
References: <20190812134903.55045-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/4] python-nose: remove the python 2.x version of the recipe
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
X-List-Received-Date: Mon, 12 Aug 2019 13:49:11 -0000

With removal of python 2.x numpy, nothing needs it anymore.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc          | 1 -
 meta/recipes-devtools/python/python-nose_1.3.7.bb | 6 ------
 2 files changed, 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-nose_1.3.7.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 08fd83d3c4e..a595507948b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -587,7 +587,6 @@ RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>
 RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-python = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python-nose_1.3.7.bb b/meta/recipes-devtools/python/python-nose_1.3.7.bb
deleted file mode 100644
index fab609df901..00000000000
--- a/meta/recipes-devtools/python/python-nose_1.3.7.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit setuptools
-require python-nose.inc
-
-do_install_append() {
-    rm ${D}${bindir}/nosetests
-}
-- 
2.17.1


