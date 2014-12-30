Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id BF387601D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 18:05:09 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so24434069wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 10:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UNkt6VGiDur0LZg2W1k9SgR7cTtEjbhggAEqDJUCvsE=;
	b=RMd2gjCcwYps/U/9cuSdSf2HmJMkhgMadGhJ05SYE1i3E/LWFzoAZ2X6jTn8ZObf1H
	XTd12PVp+aGJlpjtaYgDK1MDc9DpYKqOnpXxPoOela9zjOZ7wxXiuUsnxYRMf54sUpLY
	W64e1M2gucOfRMUVpndw6CQ2EbgBMB0dd6daKuZeils+J3qyx9r0TAUfsO1if5yj/J8I
	ziATpTj23+PZJLZ9SARdy4jyMSecAtJsr9YQoT5TPYlpgtAPn0o6bfXthpeCKQjxg2BA
	kF0fvpXcTc+NcpE5SI/K2ic1TYGFtnIR+fzGj1L+kjgPsZt5oq8CY/NJYQWwps814Cfj
	VAiQ==
X-Gm-Message-State: ALoCoQnENUHwCr/EIXDq4bRTtOcGXV6JE+o8IP3VzebMtovdnIwmB9wVnI26+kWWTNUay2unnkko
X-Received: by 10.194.62.163 with SMTP id z3mr123611414wjr.74.1419962710427;
	Tue, 30 Dec 2014 10:05:10 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	hl1sm28854285wjc.18.2014.12.30.10.05.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 10:05:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 18:03:59 +0000
Message-Id: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/7] gstreamer1.0: upgrade to 1.4.5
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
X-List-Received-Date: Tue, 30 Dec 2014 18:05:18 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/{gstreamer1.0_1.4.1.bb => gstreamer1.0_1.4.5.bb}    |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.4.1.bb => gstreamer1.0_1.4.5.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
index 56fc4f2..94be846 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
@@ -7,7 +7,8 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
 "
-SRC_URI[md5sum] = "bd0938d680d657249b885162f310702d"
-SRC_URI[sha256sum] = "5638f75003282135815c0077d491da11e9a884ad91d4ba6ab3cc78bae0fb452e"
+SRC_URI[md5sum] = "88a9289c64a4950ebb4f544980234289"
+SRC_URI[sha256sum] = "40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae"
+
 S = "${WORKDIR}/gstreamer-${PV}"
 
-- 
1.7.10.4


