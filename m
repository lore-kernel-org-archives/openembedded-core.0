Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 07D747F575
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:11 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j11so11598441wrp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NWmVUeTAoGx00Ya3zumu12Q164eWPEUkhpQhW/D1NV0=;
	b=DzpevvZ41WfLzz3gpBEds7icomwy0aYPM4uysRhurpPKElcN7zinxRJdeKJX3WZ3Lz
	lA7IG3ZIhvUX4/lx+r1zvP2OgvedeBPT+tSvPomlaIAZ27JzO62Oq5X/kssOGzTMFaoA
	peHcwL8n+OaspzxI7JkVOBdaA+ITGWaVAT6B0L9EsaqcrJ47v08WX+/wMvQboBYR4NFE
	sk6wEDL1IKm0rnzzk/6tfogTf6XmgGbHl++/QPogx5jqOPj4sOMjLU40Ritx6s/7L8Aw
	tNktIFQhC4CzASAUz/de2yhv+TO4fQdG2ygVXe5R1SfIzAiL+vhWFUhgLNQlM9tQl8rv
	67kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NWmVUeTAoGx00Ya3zumu12Q164eWPEUkhpQhW/D1NV0=;
	b=MCfxyHMwfAoJnNDfu4nKuB8LrzwpyGo7yM1Eiw9AFTHc63zYNxxzASupBifLoXnBQ0
	xFvp+3fjUklPdMVwuSsS/Lc6lgFbeJnibJj+Gwj0uM3ryqDm3LXOSoM0ymn5qXEt/5mx
	IHYATQmPTRh+oXfjA2HGI39VwLdZCT1yMyJmP5NEWwpRfbUzy8YfPvX5p6OZS/JhBByr
	FQnzhnFQGS5dAJnbxLQFxhT1e0W1j8xgJDJe+HqcKK4tvJychi/aYlZBekI+RIrVfQa0
	38+aSDOIOCTiS+3qcAXt+azmHcgW25xSO5JsUZ01sSHsTYoT86Op+P0rFzEpGbMhoxuc
	bdmQ==
X-Gm-Message-State: APjAAAXv8jZHy28e0uhw3lF06c3cX2ry98JQAj+c4YqEuAiEQBGEz+ay
	WeMXNjC6vIpnGkPfNBfvVU+G43GB
X-Google-Smtp-Source: APXvYqxB0YnoqsHCy3MwVmclFB1SJNke5RJhwwjllmifQFauVYN7osWnWeE50R5EsImdnm68w8i3Qw==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr12656566wro.229.1570794492606; 
	Fri, 11 Oct 2019 04:48:12 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:49 +0200
Message-Id: <20191011114754.91740-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/19] p11-kit: upgrade 0.23.16.1 -> 0.23.18.1
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:12 -0000

Drop the patch that has been merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-languages-for-which-upstream-does-n.patch | 29 -------------------
 ...-kit_0.23.16.1.bb => p11-kit_0.23.18.1.bb} |  6 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.16.1.bb => p11-kit_0.23.18.1.bb} (89%)

diff --git a/meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch b/meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch
deleted file mode 100644
index e902b0b522f..00000000000
--- a/meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c6bb4b99af39daa3221c3bdc0686987ae0f31693 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 31 Jan 2018 16:47:44 +0200
-Subject: [PATCH] LINGUAS: drop the languages for which upstream does not
- supply .po files
-
-Regenerating them proved to be too painful.
-Upstream has been notified: https://github.com/p11-glue/p11-kit/issues/127
-
-Upstream-Status: Inappropriate [missing upstream distribution files]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- po/LINGUAS | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/po/LINGUAS b/po/LINGUAS
-index 767a806c2e20..6ab48001c409 100644
---- a/po/LINGUAS
-+++ b/po/LINGUAS
-@@ -12,8 +12,6 @@ cy
- da
- de
- el
--en@boldquot
--en@quot
- en_GB
- eo
- es
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
similarity index 89%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
index 54455da1bb7..119d8365a18 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
@@ -6,10 +6,8 @@ inherit autotools gettext pkgconfig gtk-doc
 
 DEPENDS = "libtasn1 libffi"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit \
-           file://0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch \
-           "
-SRCREV = "c689917b393379d288b868f70b2f7b7f6aafe430"
+SRC_URI = "git://github.com/p11-glue/p11-kit"
+SRCREV = "b0ebe7555c291808db29377ba79cb8326301f0a6"
 S = "${WORKDIR}/git"
 
 AUTOTOOLS_AUXDIR = "${S}/build/litter"
-- 
2.17.1


