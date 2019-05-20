Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 986D57D735
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:47 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b18so14743716wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8BETtvugiOtbAQV9qFZGMN2OEwpDaIAl4W1lmGnJvec=;
	b=gwwto5Lp6VCxU8WevGJtXgNJuZ5mAr2x4uTL6CZ+4aPqaGqz4a6IxQpvN+l+qvFphi
	zGl1M69lswFE+RE59gR8sOYXK38gEt/g/lBZj/7pTHC5TaId9A/2KkRqOTss5cwO3vXN
	KcCrDenBzPdoEixQqvZB9luTrZuK214fGjdwsjlYwgMDcy+YKlQZfEyNLH/LZp1Ufhht
	0iTcxgHjg7QqwkL3XPpjh5MjW5dCRAHaA7uHZYtyma2aNOOOu7Lu7l9XOnBIPLvsYgpq
	cCShPELuPnS3wBPQuhmizbTln215FvonfbL3d3zFr0bN/PRpAnj154JCT49Ldvvcn+uh
	wHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8BETtvugiOtbAQV9qFZGMN2OEwpDaIAl4W1lmGnJvec=;
	b=nlEmxyLYqdoU3Mis42zwbbqanJH+P9lXTeDC7l8mVS16I7s8PwX6TBzkDFiOmz9/KO
	RmV0GO5U1UCT5tc9isQtVXQcGNIU5ggVIXbTeauxEpMwk0casLv8d3hRJGf+Xk3Sa4Qz
	uEh7tk8kp1ZPUh4xHt/wc2KmYqFK+n+8VqCG19U3En6EpERuALJ7wh40pkT09XCzQl9s
	S6fj9HS/CShrMLxgg6tjAvCVgJAeh5I0WA8GL4/UnwdwHZT6+lcHilBwzy+JIobuSFO9
	cEOjH4X80cmsPLZvVWdrk8AvBflTYKuIX9w0ENPFg7FBQOrTLwAJhvCecjYByj5vhCM9
	T0Tg==
X-Gm-Message-State: APjAAAVqTz0SvxGskvEf8XMdNNmkdZr/RlL6E2gqoZj8F9YG8sFDfE3K
	Ia1jfh8qFYwer6dOn4uArzihcvUQ
X-Google-Smtp-Source: APXvYqzFTAwvaIqayT6NH6no7C+O4CNnXPck/YR7sG8LOG2D4G+MnFzUGr7B8IGozTs1JFfEoav3zQ==
X-Received: by 2002:adf:afcb:: with SMTP id y11mr41314170wrd.97.1558361508089; 
	Mon, 20 May 2019 07:11:48 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:58 +0200
Message-Id: <20190520141125.10805-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/42] alsa-plugins: upgrade 1.1.8 -> 1.1.9
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
X-List-Received-Date: Mon, 20 May 2019 14:11:47 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../alsa/{alsa-plugins_1.1.8.bb => alsa-plugins_1.1.9.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.8.bb => alsa-plugins_1.1.9.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.8.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.1.8.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb
index 2d9cc06f585..b94fc5cee32 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb
@@ -21,8 +21,8 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
-SRC_URI[md5sum] = "d0f87211d1560f2c07c8eae4297bc4f6"
-SRC_URI[sha256sum] = "7f77df171685ccec918268477623a39db4d9f32d5dc5e76874ef2467a2405994"
+SRC_URI[md5sum] = "e0caffbd849c51ed81751378f56cb563"
+SRC_URI[sha256sum] = "161772303da521abbbf1d91f63b470c4791392d5728f2192a42d71292078f907"
 
 DEPENDS += "alsa-lib"
 
-- 
2.17.1


