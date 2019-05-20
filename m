Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 130557DECF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:50 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c77so12003472wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ntnH6HRrI58R33shnjIOAvsxT2Aq6OWPuRZ6iT0MLNQ=;
	b=nSMe60bLxza84PyG+MGqorC+mzrRV9aobOej1WymY4PSU8To41wMxJ91WeaQK1qR6Z
	4hkVwqFHIVf1x7zEIYJYSlx54WMMle4c6/C85GhH2DQtDPyQjuGdx2hJqGpJx7QjQNis
	NpAGd/WPGFksLTObdLpr8f6kcwDq/U7y0O4PqFHAVyjcHabjSVJ8V8mON5sA2Mag1IeT
	oi7Qujf54CQBwMp54Ivnc/0nMaj4tQgdvILBW6WTTxoAup5KcIo892Qwnhts8NAB91yS
	jSpGvt40xZuWEPREmWMH8BctoLUmh9O9WpaoieOnm4ml0WGQH6IvYB3AbltMzP4uYokz
	0Gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ntnH6HRrI58R33shnjIOAvsxT2Aq6OWPuRZ6iT0MLNQ=;
	b=EdPyxKvIfyayKtgH6vLfK7qDWcinWNZ+t74bMKfxIKh1LVff7/tlRwXqBM2c6Q+auz
	Nbq0Kdbm/CtP/YJBJ9s7TdI6mwh5jd/4w+rJBELTecKA35hrXb7Yx2C1PTwGJJP/TvCh
	w6NQIoJVJ5YO43XbwrSc2TX6o0isT16omraBK3CET1ebkX/yt3oK8X9z2Hrtdk4kp/Zc
	iPTBSUM+h5d7uZ8nnTW6hWxEk8Bvd45/NmnBcDlwA79sSt4dwQtkmEk9jZPYxBaHMhVt
	c1WCUG7IUOqM/PnxskJplAh3HcxpXDWzLzUX17sy2QHUcbRTeZPtRQA0e3KtpQGUoQOq
	DSYQ==
X-Gm-Message-State: APjAAAW2fO/3S5qzMTahVyGZdDod/VOC5W1QmItZFD0p7YvNpD0UUrhh
	CP4QtVU878vOLVhjXvwd9TAkNF1R
X-Google-Smtp-Source: APXvYqx0nWOd7RtGMWqXwnGgMoClWzLXInHz8OGxh0muGA8xjIlUkTPpe71PwuiUzPOKiz2xg+5E9Q==
X-Received: by 2002:a1c:254:: with SMTP id 81mr11899651wmc.151.1558361510772; 
	Mon, 20 May 2019 07:11:50 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:01 +0200
Message-Id: <20190520141125.10805-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/42] libpcre2: upgrade 10.32 -> 10.33
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
X-List-Received-Date: Mon, 20 May 2019 14:11:50 -0000

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libpcre/{libpcre2_10.32.bb => libpcre2_10.33.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.32.bb => libpcre2_10.33.bb} (90%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.32.bb b/meta/recipes-support/libpcre/libpcre2_10.33.bb
similarity index 90%
rename from meta/recipes-support/libpcre/libpcre2_10.32.bb
rename to meta/recipes-support/libpcre/libpcre2_10.33.bb
index 3a0aa53029f..50b26753b4f 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.32.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.33.bb
@@ -8,14 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=cf66d307bf03bae65d413eb7a8e603a0"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
 "
 
-SRC_URI[md5sum] = "8a096287153fb994970df3570e90fcb5"
-SRC_URI[sha256sum] = "f29e89cc5de813f45786580101aaee3984a65818631d4ddbda7b32f699b87c2e"
+SRC_URI[md5sum] = "80b355f2dce909a2e2424f5c79eddb44"
+SRC_URI[sha256sum] = "35514dff0ccdf02b55bd2e9fa586a1b9d01f62332c3356e379eabb75f789d8aa"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.17.1


