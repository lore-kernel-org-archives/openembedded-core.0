Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6139374D59
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:30 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p12so18591174pff.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9lX3AlVtWL3IZdO6m4lA+pA5fvtc11Vxgp2DniA4pB8=;
	b=Vl++Dk9cA36E7GKkz/2EYDDbTZb9OI/LJkzGZPdfXIq14oQENEhuLvNCxH88IMK5WG
	GaTo/tkVcJHnhn80zVVafKiKWFM4urs7/FMi4KMCXwTtpZ2YGgVXXfX0UQpH6C0/P039
	sVWvgPJQMs0sxU6bGyKaZS335dlr9n/mGBQci72zSrWdJxsqVfFQmewxKquLTpywEYQl
	mpiGVlfCfLHUILahYefs1WRKMJGLrogpSmBuDnizJ0I++QD1D6tTVFxlGBpcIfysu0RH
	DqkIzsbi6osHwZ/K4CLnWMxFOTHQcwcYjVGi11zxLLy9eqJROW0+IEk1HZ/N4dHyXzKe
	eoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9lX3AlVtWL3IZdO6m4lA+pA5fvtc11Vxgp2DniA4pB8=;
	b=r9Wbbt5uhu5ciGNYB+St0pjWYOq56Zl5we9Tgdr2ErXeN1AOZlPhTzid9CarAKNUyn
	N225NIUJTuV6OjyZ4pbg+WkauKe4055MRUzSzREcpBbFpruDo5ZuLNvFfcqAIsgLfiPP
	9L9E3ypN8BKRe310Wv1AU1NXLLX9o3gob0qgWTOrOz4rrwoIMAqcTDOXeKjE3aRCsPow
	OlR6sc5n6WMJ58NOUF/FVN3S1LE6aCp3B6xbvuR9lkPYuxK8UlbKwsTlMzgMMVi3l6QF
	Aj2l/BJB9L1rv4dokYieoW1qTZJ1QQOe4J+FtT+Wwbb0QOc+bPRZHSqmQ1JAzPeMtWsW
	EyKg==
X-Gm-Message-State: ALQs6tDBYhFWLk9yWjTQmCinRdq3VKZXA2Bhv/RX7D4ju9MbWtdvRlhA
	xTmNg3vd619i6kEvklYAgc3m0w==
X-Google-Smtp-Source: AB8JxZqK36p1BatVpHrfHBLS0OMsMCt/dhpNkQQ8LZPVlhHSNg5sbsLiqUeqS5SM9qBbMO+YX05oMA==
X-Received: by 10.98.89.89 with SMTP id n86mr27413179pfb.217.1525479271999;
	Fri, 04 May 2018 17:14:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:02 -0700
Message-Id: <1250b11a55062f6d2253a9eba3d33deeb7139245.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 08/27] alsa-lib: Upgrade to 1.1.6
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
X-List-Received-Date: Sat, 05 May 2018 00:14:31 -0000

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


