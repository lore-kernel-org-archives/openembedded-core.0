Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7B13B7450C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:26 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id z129-v6so747433pgz.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9lX3AlVtWL3IZdO6m4lA+pA5fvtc11Vxgp2DniA4pB8=;
	b=JZiSqziuVF6YQQuGE9HCNLNtgXgxpuwBUqnFqLZe15rPfoFrvI2ynzB8LmbdFd9PDd
	YKvoB0IudMGItinzyKcgzbuXMPJ9Sc9U7v3R8cPbEJpqSH6tp8MkD4x7ZUT5txHiZAF0
	zLx5KVLZ4QHSMImAjifBwFya7JoO2PxfCQ3Pxh6POzohcoK909b+BI9UcMoB/CmRBF+x
	2L4yGr0fSTc6QSBwJYiypcqBk09TNF9Wbmlo63k0UAwcQjySa8Vd6t5/SwrOkNZwOOTv
	jtAWntADLTY1eCCMRj9+Q0duynI/74myJNGXSLJRQqRmBJWSBdDvJl7rfXz5d+Plls1c
	OEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9lX3AlVtWL3IZdO6m4lA+pA5fvtc11Vxgp2DniA4pB8=;
	b=LghPqCEhaqs2vW5NlbZTyddUuJ7LKJBsa5MX8zasFxWdXZbYY8Xlrn1IKk/LsgwHlQ
	PVWnUO/7v63VEDwLvWDlDyRNgoauWLTky7KvZUkN02tH1WVm3Z22fymiHvT7dna+ZmQw
	18/n3vv/b8DsZtowzwnIE1/IMozQwBl8wyPmn3TwF3yAatP2h8LiHV/fBMbAAdlQHdk3
	GIVwc3P7rl3GzvTPYTQudEVGJgDbQJXywwdKmsppTyw/QdBQ45QCyfnyEvaOrwDvyttp
	gOP7tDb7F4WPMexZuFD8WfSnerfNhlXMJiNWRjqur0rZBKXulW3Q/UD7yGWI9fR5bLqg
	2tMA==
X-Gm-Message-State: ALQs6tBLmqigTnSCU1D3V/P/+DXBSOQfiizIjKav+7Ch7/izVRvuclYK
	Tr6ykI0IuUl8bAK5GAXjFdkRdg==
X-Google-Smtp-Source: AB8JxZo+Gf3tVHagUjgZePAsre2IRpAAx3qM7Y5kL4QHrgZ0o9oJsIHrGs6wG4lXTWv71toX+8+6+w==
X-Received: by 2002:a17:902:7209:: with SMTP id
	ba9-v6mr8274281plb.119.1525030587358; 
	Sun, 29 Apr 2018 12:36:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:56 -0700
Message-Id: <91e475bce7e9945c80ba682af09bf25aad4a1eed.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 09/24] alsa-lib: Upgrade to 1.1.6
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:27 -0000

License-Update: FSF address updated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../alsa/{alsa-lib_1.1.5.bb => alsa-lib_1.1.6.bb}        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.5.bb => alsa-lib_1.1.6.bb} (75%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
similarity index 75%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
index c5bf107e5e..db77a01cf6 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
@@ -3,14 +3,15 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://src/socket.c;beginline=1;endline=26;md5=11ff89a8a7a4a690a5c78effe8159545"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
+                    file://src/socket.c;md5=dd1bc7f44872690224d89c1a9806e495;beginline=1;endline=26 \
+                    "
 
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2"
-SRC_URI[md5sum] = "a2b465c3a5265d8a57f3ff39c6c4fc29"
-SRC_URI[sha256sum] = "f4f68ad3c6da36b0b5241ac3c798a7a71e0e97d51f972e9f723b3f20a9650ae6"
+SRC_URI[md5sum] = "2f981a8f7897c59ec2ddc44916d33788"
+SRC_URI[sha256sum] = "5f2cd274b272cae0d0d111e8a9e363f08783329157e8dd68b3de0c096de6d724"
 
 inherit autotools pkgconfig
 
-- 
2.17.0


