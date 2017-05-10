Return-Path: <marek.belisko@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 53E7D6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 06:44:37 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 67so2539831itx.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 23:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Qx2/mblX3hHwoWBcpdOr79dIXioDO41ZKy4hHqzDnjY=;
	b=DXhjgma/EeB8xOHHV3drVl5raxtnBhpvsMe016MIh7vRWPFMVr+3phEo5Mx0QtiHuc
	DAUQLobb8ShM9RhKCD0CrHqsqk1f6y13BSB4/ScVH4UaE6ggOOQIf7C6r08kG4SgjIx8
	Vkmrqz2RFYIaLO+xhVWSVnN1sL4cZH7L5KTXQ7DRy/QvAlqtLCK1UUx5OIUksp12c2uS
	DbPMYYa6r4ZBpEaApXpqs0eSZAUU+p7I3LtvO3gegZQ43CwT8j8QR89p8CsKmaMsIc/m
	OZyAej3JtkQckgfbrFQmv3ZGCkPxD13oML6J9eCifkgnXguXcuCzGjjbWnh+kaT+1Wr+
	Vsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Qx2/mblX3hHwoWBcpdOr79dIXioDO41ZKy4hHqzDnjY=;
	b=rPRod5vLoSSIYnV/7EWMkGU3qSIVKLH9zveQ9GGOLK9i/TCIhZPhb6/Vqh9Sam6EtB
	XH6aYo3AtNAt52P5wb3BDzsZvNeWPKN5oAH+qWxmUS0HJiQlhMiHFbg5ehYi7Po3SCTx
	/FWEN1i/ymDJoB0ds/AqHwUVXIgx/nzAehU9pY1D97698aWp/g8NtGZ+Yd57Ai6grLPy
	ta4Bm2qW0tVTLStB4KwTx6rc0j2QmOsSltbONsfeSIQm+Jh+2Juovq9ENh9XRWx52QgA
	CcNeqwKZ/tFG3YUmHp50t6qN4JPcxctLQRedKjg7qk4IXzT8dekE6U1HO3O70jzByBPL
	FFgg==
X-Gm-Message-State: AODbwcB0BUOl3WzBU0D9KAYYCfEgbqPxIvej3YjzdJ0ymQPgR06P6ARx
	lKLj6lMWEeM3qV4A7K3VAQL4GhA5xg==
X-Received: by 10.36.139.67 with SMTP id g64mr4755011ite.18.1494398678775;
	Tue, 09 May 2017 23:44:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.41.19 with HTTP; Tue, 9 May 2017 23:44:38 -0700 (PDT)
In-Reply-To: <1494364209-17742-1-git-send-email-marek.belisko@open-nandra.com>
References: <1494364209-17742-1-git-send-email-marek.belisko@open-nandra.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 10 May 2017 08:44:38 +0200
Message-ID: <CAAfyv37AdHt4w3+owQX0NLK8b9yOBh5siq8UGEf2D7U6rHNQrA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipes-support: Add recipe for libgpiod
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
X-List-Received-Date: Wed, 10 May 2017 06:44:38 -0000
Content-Type: text/plain; charset="UTF-8"

libgpiod - C library and tools for interacting with the linux GPIO
character device

Since linux 4.8 the GPIO sysfs interface is deprecated.
User space should use the character device instead.
This library encapsulates the ioctl calls and data structures behind a
straightforward API.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 meta/recipes-support/libgpiod/libgpiod_0.2.bb | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-support/libgpiod/libgpiod_0.2.bb

diff --git a/meta/recipes-support/libgpiod/libgpiod_0.2.bb
b/meta/recipes-support/libgpiod/libgpiod_0.2.bb
new file mode 100644
index 0000000..fe2cd80
--- /dev/null
+++ b/meta/recipes-support/libgpiod/libgpiod_0.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "C library and tools for interacting with the linux GPIO
character device"
+HOMEPAGE = "https://github.com/brgl/libgpiod"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
+
+UPSTREAM_CHECK_URI = "https://github.com/brgl/libgpiod/releases"
+
+SRC_URI = "https://github.com/brgl/libgpiod/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "e3430f35b6efa842693d659c0bfb7ad5"
+SRC_URI[sha256sum] =
"de1947f3cb2cc4174364af430309fe6238976658575655bdbd76c60cffa7df92"
+
+inherit autotools pkgconfig
+
+# enable tools
+PACKAGECONFIG ?= "tools"
+
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
+PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
+
+PACKAGES += " ${PN}-tools"
+
+FILES_${PN} = "${libdir}/*"
+FILES_${PN}-tools = "${bindir}/*"
--
2.7.4

