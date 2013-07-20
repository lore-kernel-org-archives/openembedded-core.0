Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4931D6ABB0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 14:57:11 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so2899052eaf.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qFVkItsWOy2jwIXmoWq6AKedwjg5o6h3VPfmp4Tu5Rc=;
	b=oFgJ85bwJ0t3u8PKmyT+wj3OdLTAwMdDhhA5HzyfNW+fHkO6Rk6rRkaZwbJentSNaS
	+QlJHhOX1SqDWsokiDF9UwyjnGA+Liy39PreLHX5zR1ASMN+gFXqkFwkci/s+kmsnubh
	FKVdx4ZdsrF3hrlEU5ApFWv9JQQNAkqKBP/fQHGzq5g3hltn+H6VpLN7U4HCMhofJa61
	vjVQi4EjKjzxS8bA1xKG4gsZkm+42zmyodi0rGJMNC85GNa4mmD0e9myAKNUcalwvTO5
	Tu2UXD6p+El7BLcvWo9SQEplLKSs1OyoJctJ5++9kFBhqv9Ue+QOJ8iv/83TUzym/7k2
	iJPg==
X-Received: by 10.15.31.198 with SMTP id y46mr20553307eeu.135.1374332231325;
	Sat, 20 Jul 2013 07:57:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm35848469eed.9.2013.07.20.07.57.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 07:57:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2013 16:57:20 +0200
Message-Id: <f7a1fd6fe5a970a8047a13e980651bb058092bc8.1374332196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
References: <f9f54ff35b3525909ee1986053c8d6a687858a21.1374332196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332196.git.Martin.Jansa@gmail.com>
References: <cover.1374332196.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/8] gst-plugins-ugly: add PACKAGECONFIG for x264, cdio, dvdread
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
X-List-Received-Date: Sat, 20 Jul 2013 14:57:11 -0000

* they are autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
index 9fd71fc..2fdf03f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
@@ -15,6 +15,11 @@ inherit gettext
 EXTRA_OECONF += "--with-plugins=a52dec,lame,id3tag,mad,mpeg2dec,mpegstream,mpegaudioparse,asfdemux,realmedia \
                  --disable-orc"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[x264] = "--enable-x264,--disable-x264,x264"
+PACKAGECONFIG[cdio] = "--enable-cdio,--disable-cdio,libcdio"
+PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread,libdvdread"
+
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
 	rm ${S}/m4/lib-link.m4 || true
-- 
1.8.3.2


