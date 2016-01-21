Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7F16E731E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:14 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id tr5so1826360obc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UxOxoB5ohYDFlkNCqe01GJdDIlnFN51W6UoWNcmp94g=;
	b=EEde08KyaRLasee58P5UjxJP8mraC+ITxQyZYIUFNGtMjEiyNy5/e0sCmmiUr0P5bu
	OJIzfTLYr1BKd1c1jBOzOj5YT6uaGY7l5P4RameQ84UTwEQNey9b+KXfZDU5RPfmMn8y
	FQhO5/h+Wuwd5KyhWthqH4gh5CKAdExgyivAPiIB3wSq72vQhbSkPQgyl1UIm2+0Rrmk
	MR1VIpKqycV2zJY/fZaZ1UmqHB0I/t7fAtbbzDE4dFFq2igV9Y5XgVSQ5w4HBQ17CRVg
	6YaSoB0BSZqzLaFiJzvCsf/jzuo6xAO6JRw4FKLDJHVSRKpa1nPi53RlQoNZvlkNPRJp
	IUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UxOxoB5ohYDFlkNCqe01GJdDIlnFN51W6UoWNcmp94g=;
	b=Rv5F7LhkfsC02vmt42oF/r8mTnl1Zte7+m/Nxm91k0spTvGUzrJXn08JRTVtQs7KXG
	/UN2dFAiAvAd2ArpPZrEnUpUv63pJK7Z0LmDG+jtJ7dH0fYIbKtnRIuQDYpK+yN9rFC0
	FDaEruG+LZ8gNDnbPHkCVKZ3IK3JvDmkKM1sA/oQmrsqonLfQOjxfZSLuBAcXlZKGUdh
	PmkQQW1GeoQ84TLFlZVWxaLl0yuVzwQnZ5+X64liXAkL/flhl34LOdAhPecFzS2iHNUf
	GkEootggS92WQXwpSacMd6gukGYbDH7nK/+9SH/1bLjkYS5rGKAUKPxP6rRe7eo2NmgT
	JUhA==
X-Gm-Message-State: ALoCoQkayy/ip0FZjNC7bXpajrZTSig+YiXfWFK9fYiJw/PmU7DJe10IYr/Z7hhWRcWVEOy3M3sym7YS5OXD9+Innu5n2DE6qg==
X-Received: by 10.182.103.167 with SMTP id fx7mr30498908obb.36.1453344255402; 
	Wed, 20 Jan 2016 18:44:15 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:14 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:20 -0800
Message-Id: <1453344203-7118-23-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 22/25] gstreamer1.0-plugins-good: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 02:44:14 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_git.bb            | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index fe1a4eb..88137ee 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -6,14 +6,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-good"
+SRC_URI = " \
+    git://anongit.freedesktop.org/gstreamer/gst-plugins-good;name=base \
+    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+"
 
-SRCREV = "fd0123800c8c1cf1468c0fa5d592ad0d0d8b4140"
+PV = "1.7.1+git${SRCPV}"
+
+SRCREV_base = "e016a70a7c97fc61c6cb5cd3821d38bc5ae5c9a4"
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


