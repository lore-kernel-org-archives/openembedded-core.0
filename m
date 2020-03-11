Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 60A0B61BBE
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:21 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a23so339538plm.1
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UnBgeDBEDrR9BS9GEGujqBXZgX1BOYsIE3zkcGMmGvQ=;
	b=bbd9C+o65S/xGgDnVJjK7yjrdX096P5QzYcQwJ1LoxSosziw/VWDanAAe74sSeCB+B
	Maxlac2QOaW7eC3yGK+TmWBfE2DU94JabAwq+NK/k5mwHya1opfJejubequdPt0yLS53
	9fbixo/5Ll9hefGA0Wbn5vkMAgOeMdadbM0TCsbV9mYJ1cXsAq6L7bKgkRXvsfWy8nUU
	JKSk2yvGm+TJDkUTVwt7WactH2h+r83liil7s+bK9oKVKQRWp3Spr0F0nyxThLz66YFm
	QAGwFO7nwFT8AWOX706CJso+TUvHqUVcW/QsG8K5Pnjd6j1zSKQ9bBmssC1IxaomUHoP
	Cr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UnBgeDBEDrR9BS9GEGujqBXZgX1BOYsIE3zkcGMmGvQ=;
	b=oyMRZqUWRxI0ZBGXhV6vLDmzClrrNYDxhrU+tfIFOwldFRt5mwguKeo9NVvfKTmhh7
	ChVAaUDzfX+bXtzpHWeZvrcJBTbWlSzIM4NSESu0hEvdWa/IwLqVOYnX5P9DQJH6Dhr2
	IuXzGT93Sf3hHoDRjM0jgpYSA+AOP1EWJULntGIejhixpcKf3XB91EYqFvjx122ccabG
	787oFHP/vmJEYJ8lsgPw+vo2dsuNkeeuYh5urXkIyDpPR4nl6uK8Lws56blg/p8vDAXU
	8T3wH2Cw0FwDupynMAoJ7gSBuu1o6iGzAjklxtWjWGllqzBogaf00giMwcRB20wE8ySC
	JOKQ==
X-Gm-Message-State: ANhLgQ1vyShAw7Ny4zMetMFpFZR9ic0tBsFFtq3JuFHclyxBf+i26fhS
	slXhLP+02+qgNvYEa9UmSiV3OZgP
X-Google-Smtp-Source: ADFU+vvcfOOWTWfZuv7j53On48c97vbYTB9EjyY2kdblHSJ6hUbVSIzdbjGi18ciNIzVAL8/CcJVRg==
X-Received: by 2002:a17:902:7796:: with SMTP id
	o22mr883553pll.250.1583893582002; 
	Tue, 10 Mar 2020 19:26:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.21
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:02 -0700
Message-Id: <2da4ee30335d0b127b79a6eedad68c8559606c57.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
Subject: [zeus 01/16] yocto-uninative.inc: version 2.8 updates glibc to 2.31
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:21 -0000

From: Michael Halstead <mhalstead@linuxfoundation.org>

Allow sstate use in Tumbleweed and other distros as they update glibc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ccb374c279b260b1fd3460f6bfd1567240816055)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index ad75d3e2a3..889695eae3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.30"
+UNINATIVE_MAXGLIBCVERSION = "2.31"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.7/"
-UNINATIVE_CHECKSUM[aarch64] ?= "e76a45886ee8a0b3904b761c17ac8ff91edf9811ee455f1832d10763ba794dfc"
-UNINATIVE_CHECKSUM[i686] ?= "810d027dfb1c7675226afbcec07808770516c969ee7378f6d8240281083f8924"
-UNINATIVE_CHECKSUM[x86_64] ?= "9498d8bba047499999a7310ac2576d0796461184965351a56f6d32c888a1f216"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.8/"
+UNINATIVE_CHECKSUM[aarch64] ?= "989187344bf9539b464fb7ed9c223e51f4bdb4c7a677d2c314e6fed393176efe"
+UNINATIVE_CHECKSUM[i686] ?= "cc3e45bc8594488b407363e3fa9af5a099279dab2703c64342098719bd674990"
+UNINATIVE_CHECKSUM[x86_64] ?= "a09922172c3a439105e0ae6b943daad2d83505b17da0aba97961ff433b8c21ab"
-- 
2.17.1


