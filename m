Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0666E7FCA8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:06:09 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id a10so4498593pju.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gOvTRHJcXckE1XPqLCl6QS404qba4D1om+nW7KF6ER4=;
	b=YcmFWCFBTs1W/9OUCtDEET0P/OT83PuCHLAg/f8jzUjkqbLoIAPF/4j7E7cu3N0aNu
	VydXvud03AQ7Uzt3Vb3IYCCKp0grbby/I1GhB9++ir3CUdv5DgkQzT+c2RPVDLZm82EE
	6D1FpwqB5dUvnkgw3cRdgBaiU9ZmkbmDzUU/7M0QiZ1bi6wpikUoJlVRjlNpfKU78pzP
	fenvjGcj0ULs2gOfKeModXcmtdt91wsI9vRDxeiunrmglclNRdwewNriIiNlu/SBHOmF
	8rOa0F0ieSSDUFb8gejqsjywWWnaYRNa+HXOohuK/mWw8ti8rD/MwlsQLSiMNVDg/cXi
	e04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gOvTRHJcXckE1XPqLCl6QS404qba4D1om+nW7KF6ER4=;
	b=dwpvuCSAbbwTzvkBiLAT61vM4iv47MNU0CiDrR0tzUK943AbF+Ih3/88nHh42TDX8I
	lA9iu7FR3SQn42L1jjVBn5kyqfue+9YzILSe8JZH5+GBQ18bC4ZjXZpMYlmBb2fagkKZ
	H7bPmXYlvc1Am/3glqliPq6oKjIHSNNu+hvI+CqHeQ7h0CLu6JzVDuFGx1P6usoz7Rz0
	TFn3hd3yy095oJSJEDeWIfWea12w3PAMfo5yeNZNa7e101ScYeb4SrtALVeRIL0dKAPf
	WZmwRVTlry/emwf3VRzNWtyAeTgmbHgYxbFzCQqgJd1a4p/CVt6c6+T70Ca1U5ZqmzYQ
	1g2A==
X-Gm-Message-State: APjAAAU23bPhVmYiCuZ4toP6NbAQxvVjiz0KhdzWInlnqEd1jalVh0a5
	zjIL1XZDIpAMgAUysRHcwDd20hsK
X-Google-Smtp-Source: APXvYqzzLVxUem3iG7msiV+HI5wQ2XeRCix+xvlgOufsnuoVuo4xeomBBUuqLKqjIvTrA4L80PjjIA==
X-Received: by 2002:a17:902:70cc:: with SMTP id
	l12mr20126796plt.198.1574525170538; 
	Sat, 23 Nov 2019 08:06:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	y81sm2158127pfb.178.2019.11.23.08.06.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:06:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:06:08 -0800
Message-Id: <1574525168-20243-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus][PATCH] gstreamer1.0: upgrade to version 1.16.1
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
X-List-Received-Date: Sat, 23 Nov 2019 16:06:10 -0000

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


