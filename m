Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3B1731EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:38:06 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id e195so1566972oig.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k4j9PCbCsYb5uIowU4EQmbycq5s61hVkOavS1iytRws=;
	b=DVuEIIDy8XY9XDyY7Ha7p3n64hb7gUnJOS/LnxVd/GpevvYSTu79KMxbzGgyBXJt6g
	nP6csPu2I8HbgCUjE+BzPX9dwTBrf3K/9M2XxiKnOSbgh/Tcy73BQSk/JIXWkl355XU2
	J2vCdjPLiABQsk8rNTXnBnGTaQKlhu1B8gAdaXzWmTBtwO/g8WMLsAZaxmE7RuelUX8G
	h8to2mETvQpkhAVX5KH6N9PD23SK4zW0nvr1dT8XSZoaIb5RRwxwPkwFPqmYbrFV2pxh
	nF6HLnVUMdLdfZ9gwGh9vHcU0z7Mav9XaWFx3E62O4CocafhAlsjrNUKTv00AGtwajc0
	d9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k4j9PCbCsYb5uIowU4EQmbycq5s61hVkOavS1iytRws=;
	b=VT/nJFsIfxhPJ/Eo/fj2jSqET7z4Azh3My83S40jSKfuqeJaXxeb18lPn5lxEK7SD9
	V8xJHFXh4uKxf2yw1C2Wry3yOAJWPWo2qQMHQn1wmvMxUeOcWQ4NOSmapSODgp4Ffv4C
	EwcLTcc6IIJWnYQZvEdKl4VLwtpyaFFm+Z34dJPkGLkVJtGkLIyBbrk9YExF+IFZUVSC
	x54CJGY/du7bYVei0wbWRI3ueU9dZbWDb6FcCDlo6wMZ4yqgu1hq2FnHg2KB/ROQfXRg
	EbVrrn20Bl06vVwCf5ZzEuUt2abflK4nw0m4cST1nqc4pRK1QkLEUWhHK4POIFb7nyZJ
	RS9A==
X-Gm-Message-State: ALoCoQkerth4GF2Dp3EbzP/rO/IPo6hB0GnuCCMox6XgZhCObAgnGRvBr4E4TuKLZO4pXe1rnZ0I3fhidImZBKqyQqJqIZXn7Q==
X-Received: by 10.202.184.69 with SMTP id i66mr30328861oif.62.1453354687850;
	Wed, 20 Jan 2016 21:38:07 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.38.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:38:06 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:49 -0800
Message-Id: <1453354610-19218-32-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 31/32] gstreamer1.0-plugins-ugly: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 05:38:07 -0000

The autogen.sh script takes care of cd'ing to the correct directory
before it does anything, so we don't need to cd on its behalf any more
in do_configure_prepend().

  http://cgit.freedesktop.org/gstreamer/gst-plugins-ugly/tree/autogen.sh?id=1.7.1

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb            | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index 5d710f0..f99b300 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -5,14 +5,19 @@ include gstreamer1.0-plugins-ugly.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly"
+SRC_URI = " \
+    git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly;name=base \
+    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+"
 
-SRCREV = "06b8ac10cee85c5c304ca320997aa8f44295a66f"
+PV = "1.7.1+git${SRCPV}"
+
+SRCREV_base = "c9c37983babad909d01c1c4c417d42a0cf252c1d"
+SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
-	cd ${S}
-	./autogen.sh --noconfigure
-	cd ${B}
+	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


