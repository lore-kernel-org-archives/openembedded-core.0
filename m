Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id BAA1676803
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:38:02 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id x5so2017718obg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gh3dTFCDdK+bmOol8QN4uBviyJajV77D2POkpdOCkC0=;
	b=l/h1ZiAgyAm+ja1RtIc2DlpOT46lsQfeX/GrRg4zPcOj5VOJXbKvQxqzubOaiLvmht
	wZEKnjrokrvt0ugXr5mKJPydbcxzOx+w7zkDdeMI71uALzlScIfwf3eL5mwTvnaUdqAN
	po1REFtRhUL48Yah9egliqpA0UML0Noi3Be1C+8ScSgy0IGpSK+xeCQ9TRaCOD9mZJmh
	QpPwKKrAdepukWVj8MMWYq4qyiqp5Qv5KO1I9bM9CC0CBbz7J6s70xkn7tZHuimcj4y+
	AE3ki/wGreXNWmgspEkmsdAhKiXZyz6ljhELTAllGY1GS9orIq51tV4aI94Dt1UMsYmO
	IsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gh3dTFCDdK+bmOol8QN4uBviyJajV77D2POkpdOCkC0=;
	b=cjEkNjQiM2yxSMISCN1za/6cXV/FJI6hDt5ekigc46hdq6alwzRF9H1J4DwbkQ/M79
	XD1m9ag2pe8aTbLUy2EFKXvCOcYkxmSTBok2nWk0h+MIfbWvIqTPU3hkho/v75Vxm9Nl
	EXjGXmygxHx9mouzdo+WzbVeoAUZEYgCSu4fc4PvgbiRFZadb8bt3Ggna97x2HVGCY5z
	IuUOvugn/ROO+jD30ZeGo3jpkDrcUlPJAXf9bFXZgKPlBqPKftPtTZEwsSZ73ncnBcty
	RTN1VJVnTYUnpI3dpUrSsi9ADUOrzaAKgY+Gfa6EKdDuoHSyCeKaVhaL4gWoHNLHZr0b
	kyfw==
X-Gm-Message-State: ALoCoQn+8NwbsqK/xkoXqZQkmvXEJGj98COnBy4HoOjmNm3dubu8Uhx6bvfWPSA6z49PW0vPW1meIhzSuF0uWXjvV7Q+Cpu5AA==
X-Received: by 10.60.76.201 with SMTP id m9mr30713072oew.33.1453354683677;
	Wed, 20 Jan 2016 21:38:03 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.38.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:38:02 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:47 -0800
Message-Id: <1453354610-19218-30-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 29/32] gstreamer1.0-plugins-good: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 05:38:03 -0000

The autogen.sh script takes care of cd'ing to the correct directory
before it does anything, so we don't need to cd on its behalf any more
in do_configure_prepend().

  http://cgit.freedesktop.org/gstreamer/gst-plugins-good/tree/autogen.sh?id=1.7.1

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


