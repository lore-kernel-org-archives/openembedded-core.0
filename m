Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 768597FC57
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:58 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id gc1so5596332pjb.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gOvTRHJcXckE1XPqLCl6QS404qba4D1om+nW7KF6ER4=;
	b=EWjg6LyPtbrXXVLj1TPDzijjEAsfKN0cPLZS1kjAsyOFzRd6MAVCUcpwJAtqMFYomQ
	w3AeN5EdtHVok4G0aSsUtZP6i0XyXo7mU/3zKLCw8aMdPB/uvtpGax+wEYc6Lu9p+8Vb
	VIbRQLc947ul4y5Bk9w05NKb0io2JaUEpJQIHdmsIMhzVJI1b4k80Z3LUm+XOdnbt8hZ
	mwlHmjEU3oN66sYtB6RwsETkb49TLAlQtyxqAr2hJLq/IH+ER3hSoJXGiUvDrwcEw7q1
	hcnNO1Ci6C6HGg517J6HboTw8sfJ3G+p2A1FQTYrQs83+voXP12p6KWJ6G2dA1l9ZnOD
	Zt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gOvTRHJcXckE1XPqLCl6QS404qba4D1om+nW7KF6ER4=;
	b=q5EXwDHqez0bZNhh46CvN1Rb1hzMg4ZEEVVGskx+QtiN+ad341a0DfTle96yG4nU8e
	PuoHAagSMAcu3PeWLnuO48tEu36soJZqxcxqP3on93x/D34d1bu2i3ClzAXX26aaeMb/
	RhqNGGbvsZrkMLrM64YnBeiNEYbcibMuudC30aIjbZeobV1lwJGBHp9JsjFaFlw0xdag
	Z4QkugIRRK4bh9dhP0E1B2KxCC5FLxbXMUUpKW2VmLrnRTWA1Ke7c3ZK2ReqGoW+q9Mx
	s3IdtBh1ifOkM38GWj9pWdtyrCF5tMAMOTHJo8h1ttopcT3ZB6bhJKPXhUK2VeMqi/PZ
	SOTw==
X-Gm-Message-State: APjAAAWierJjgogY0+mCydPkyHqmc5JGPDDbNw8uGU08+ERQUs4COwVE
	QGcv706283NoRJ2adKRdHSeGc4dL
X-Google-Smtp-Source: APXvYqwwXs2+E8E4XBTrGeNEseIgGQGZ4oD0LSyW/2PY1DyR3rwxL0MI6MVMmZFzQScWkE1ggL3g2A==
X-Received: by 2002:a17:90a:b292:: with SMTP id
	c18mr35489335pjr.107.1574639459411; 
	Sun, 24 Nov 2019 15:50:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:21 -0800
Message-Id: <360059908719b27e570b790de65a1809fb6edf3d.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 16/35] gstreamer1.0: upgrade to version 1.16.1
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:58 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
[ Bug fix only update per release notes:
https://gstreamer.freedesktop.org/releases/1.16/#1.16.1]
1.16.1
The first 1.16 bug-fix release (1.16.1) was released on 23 September 2019
This release only contains bugfixes and it should be safe to update from 1.16.0.
]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gstreamer/{gstreamer1.0_1.16.0.bb => gstreamer1.0_1.16.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.0.bb => gstreamer1.0_1.16.1.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
index da2d14c..d77c8aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.1.bb
@@ -27,8 +27,8 @@ SRC_URI = " \
     file://add-a-target-to-compile-tests.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "862b7e4263d946bc2ef31b3c582e5587"
-SRC_URI[sha256sum] = "0e8e2f7118be437cba879353970cf83c2acced825ecb9275ba05d9186ef07c00"
+SRC_URI[md5sum] = "c505fb818b36988daaa846e9e63eabe8"
+SRC_URI[sha256sum] = "02211c3447c4daa55919c5c0f43a82a6fbb51740d57fc3af0639d46f1cf4377d"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    "
-- 
2.7.4


