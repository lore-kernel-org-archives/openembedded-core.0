Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5106A7D963
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:07 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id o25so20038408wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NvvyHZs9m8vaQ8PZbpm2gkiyzlijnKcFFI4CEOiPGNs=;
	b=lrkp46syN5skwjg3qQXhJfCkUG3fvQaWrM1sqyjKvSN9YbZzUnyrsafJhPtK8jEk11
	tGHSVg1UprXdVuWA4r1sAN1cYtuplpsvnjiFY0Hwsh8ugZsWhQ1y9HbXARJOgWL8lKcF
	agMQn9wwQZKQCSvRcu5sAqBERUCXfCiG+MoCV2p5HrpM/gfHGAiSVlIQt4TdeHh1aX47
	Wd+Vp6pAXwzJqTK8E/zm7t4duLnvoKbuQFASs/ox7Kg/jYm1n12kRrEftARiQnKoyfvC
	LdeGDmpIZVfrDvwZVlQ9yWWD/TiTxIVjnQF+f/pWEkbG+r3hBR/+kFhGRj1NIHEhiOLA
	oxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NvvyHZs9m8vaQ8PZbpm2gkiyzlijnKcFFI4CEOiPGNs=;
	b=UwefuZMAinBr/78/GgM+QyrgiVlmzcuVU87RLkyJj6eJ7HPrSsEj1oEO/S/c/IawQ2
	2pznFeTtcTx/BVjxAftceELU4W/rA0/0rKX1MLcQMs72H2kHH9BMoz07s3opbjWzWDw6
	Ak4fjL9p7vJn3b+xgsLrqyk6AStWUoX2oVLl/Bz4v2xwmOQnOlIwn71rfQbP6kkE7vpf
	lCAtETeSpTMzku53abVgJm4YUYUnSabCJvZ/UBFBikBpVOLHYG1OoOTbg4Z02krJ83yA
	cV9fbcd/F9Twams6zLWsw07twjH4e6MguqzmXOLm981Jf6n4g9NlgZYLoACxhNaq5jEK
	k9dA==
X-Gm-Message-State: APjAAAWoRd5hqpCia8BWT5iuOq7Z7e/nK//ENsEysEiW4HGSGocOvsip
	T1hA2YQWySp9RSqyrY8EyGgmojwruaU=
X-Google-Smtp-Source: APXvYqyfwRvv0DFeLCr9+VyMuswI+mpS2/6AZa+KpqwcQrybflHCFzdZxkHNkSk1BmOFn8T2AXHOUw==
X-Received: by 2002:a1c:f909:: with SMTP id x9mr22712243wmh.18.1555325707687; 
	Mon, 15 Apr 2019 03:55:07 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:43 +0200
Message-Id: <20190415105457.57067-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/19] epiphany: update to 3.32.1.2
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.30.3.bb => epiphany_3.32.1.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.30.3.bb => epiphany_3.32.1.2.bb} (85%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
similarity index 85%
rename from meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
index a64c82f48bf..9641619e3f2 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
@@ -13,8 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "fd05702b1c9bcb6a0633de54c4a6ccd2"
-SRC_URI[archive.sha256sum] = "76cdb8db6af2da8c3371a73e2dfd5ba64867b5f1e65fa9621f35348a42ff0d17"
+SRC_URI[archive.md5sum] = "93faec353e9f62519859e6164350fd5d"
+SRC_URI[archive.sha256sum] = "a8284fb9bbc8b7914a154a8eac1598c8b59ae421e0d685146fb48198427926be"
 
 EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
 
-- 
2.17.1


