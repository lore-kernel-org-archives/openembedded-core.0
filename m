Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id A9A067C9D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id j125so3710235wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s0kj8PLft4l6Xz8uo5Uc9Zy6UCse7pwfH3ldaTuNP5I=;
	b=KNN4NA6xAJlpJJZs8d2jHFkGljrQ+TzjNTtqc3UCc0x3QPS/s6IpdnFytlC5W34xR3
	qXgdlsog3ajAuPEmqMYrzWBBnR8DmJ5LOiL7kyqFd/zJn4OP6lrNF+mP3p/x4jwyhAKc
	Voe+WGtKPdCbmJxxNjWnkO9QKFxYBBhtlo6MjHZALly6fsJPH8bXX3D2UnX4j1EvcZsT
	rqIg4UpasjBcSriAdTKNfHFbvVwQcaQlR7lYSkYW6lSRVS6xN84jBetX1Vxh5DoDCPId
	9gHK/S2qKGVROIudJrfztrrOX2XZCKTIJYExD2JabGPESm4SI1rs89k15yQupzshNsS2
	Efkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s0kj8PLft4l6Xz8uo5Uc9Zy6UCse7pwfH3ldaTuNP5I=;
	b=I9mchlZipN5eMDjCW07iCFil4czo8i2uDOdonv03Gsgcexjlv+N8FV7lKx5xWwmreU
	PnGAw5+RqrfA+avuAifrGe+jEVrxxzJcId/E28w1f1TfhGxBHCJQ+MwWSFhpsYz77noW
	kkjVUuSE5nTTvShF6vOt/fwFp9wyW4Z7qdbC2nKJ5REYTTkIDKehUDy5wyqaBSwcPrXU
	j/Q5CuCDNIIMo4FYCbvjRJDD+XHOVAZhPbbOE8q/VQUZ14D9bXuMDI6tsf19tGtfHDRJ
	OAxr706gqzrda1fgv2qmRPN8IaM6L87VE0KXkWupDn5guHQm7vh5oHg7LP0OWLQEWuRa
	21YQ==
X-Gm-Message-State: AHQUAuYtdEh/v85MQBMkhdw1LbZvj8TyJnfaflxtvRPuDoO1qfHHLA/V
	lIhCei19+3C/KGxcgvBpxo6qOLFH
X-Google-Smtp-Source: AHgI3Ib4lrRPL1DwKzeyNFDzAT3jYxY0zCn616jbcuH/jp2sAMK2SgalZyC/GJC51qQURFdNd++ghw==
X-Received: by 2002:a1c:b1d5:: with SMTP id a204mr3871341wmf.32.1550598454040; 
	Tue, 19 Feb 2019 09:47:34 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:05 +0100
Message-Id: <20190219174712.60694-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/20] webkitgtk: upgrade 2.22.5 -> 2.22.6
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:34 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkit/{webkitgtk_2.22.5.bb => webkitgtk_2.22.6.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.22.5.bb => webkitgtk_2.22.6.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.6.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.22.6.bb
index 3d8c0338c7d..35c70e0d026 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.6.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://bad_optional_access.patch \
            "
 
-SRC_URI[md5sum] = "96a731522b800f38e70f85c22f8de477"
-SRC_URI[sha256sum] = "99d3863f418a7c3a3e37e5062950dbf2d91fb106ec1633459b0ef6f2d5f6cb13"
+SRC_URI[md5sum] = "7c21a30f7f078f0b712caf0c7ee966a4"
+SRC_URI[sha256sum] = "df90db9c0db0a2072b945fa3e1d45865922bd686c4659cce6cb5897ce357c85b"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.17.1


