Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4267FCDB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:11:29 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d199so515023pfd.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Kb+2LU1oXfJu6zN0r2hlXimn653vvdxEWU7J7NVW3N8=;
	b=r7TuwL9bJlto/WvkAI/B6dno+frFVxjwf9iKXZpgsBR8D/Veqa3YMkMmcLYAOthBAd
	2K2zVHn465/ch82FA6/R/Q2vidf0bIkQhL3xmYtJWZlR3K8aGkneimvWwvD/je/qdFVQ
	5b0kTaB0xPv36ZX15/ntIa/Yqlh8mamqv1GAH0prtx6zd9kIn/ABPKJ4yVc9/QJyTj4b
	EYzIMZjCKOZjFqyzvk45Z+s6j4boRau7I6zCh97VWAkkkOKanG1FWw0jVhhIfbY5wEi/
	0hjtEz/lgT0q0uwa/2/IXYIDkLisAVG0tTFD0rw5wsUov+r0yUgdj+Alu0QuCwb6e0+Q
	h5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Kb+2LU1oXfJu6zN0r2hlXimn653vvdxEWU7J7NVW3N8=;
	b=RLQ7O56Jlv1ktI7z681K8+MtxcB8KLDbLE4uOLktHaUXCl6pKaOJDWjz/LpNpg1qHp
	3wHX+IV/1dkGyNMwpCXCThNVfEOja2sH8T4PRelXIVEzmMz5q1PBMg9j8pE4v8Mc4ckL
	QeE0UIeRD/MUsWHyXj47O5dGxFpAgRy15GlXKBc6nQFrPkok8EfTYU+pe1inTaQGY1gp
	hAIhCcaoRifB0THdUcFUfxx7UyTxtDo18QWXzCXz5xlBmFLuoYeOsa2GkJCIztT5lZuA
	oAzAEHOPHGBwoDKsaXml0AGt5DLKkcPQ69BfqHAL3oqU9H1ZoRhTklGa9UaG6fjEFwYk
	NuAw==
X-Gm-Message-State: APjAAAWXmIFURm6hJ3pocMI3VR312yg6glTYgZIgXlNWfy6wf3STyd48
	7fL5E2GFnH25rCitiLouIUjAP+AV
X-Google-Smtp-Source: APXvYqzdUvb4w8/Xs3XSTcYrF6Ld4wqWLapQsyMYdOXAgFnhM369lE3m305CmYsFXwL/HecsMAaQPA==
X-Received: by 2002:a63:5164:: with SMTP id r36mr22338321pgl.143.1574525490161;
	Sat, 23 Nov 2019 08:11:30 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	199sm2091943pfz.186.2019.11.23.08.11.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:11:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:11:18 -0800
Message-Id: <1574525485-20450-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
References: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 04/11] gstreamer1.0-plugins-ugly: upgrade to version 1.16.1
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
X-List-Received-Date: Sat, 23 Nov 2019 16:11:29 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1.0-plugins-ugly_1.16.0.bb => gstreamer1.0-plugins-ugly_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.0.bb => gstreamer1.0-plugins-ugly_1.16.1.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
index 11a0e79..de677c0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.1.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
             http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
-SRC_URI[md5sum] = "1ec343c58d4b17d682f7befa8453c11c"
-SRC_URI[sha256sum] = "e30964c5f031c32289e0b25e176c3c95a5737f2052dfc81d0f7427ef0233a4c2"
+SRC_URI[md5sum] = "668795903cb4971fba9aa89abdea8369"
+SRC_URI[sha256sum] = "4bf913b2ca5195ac3b53b5e3ade2dc7c45d2258507552ddc850c5fa425968a1d"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.7.4


