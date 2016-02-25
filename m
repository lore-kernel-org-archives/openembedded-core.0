Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7F84277197
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 02:15:38 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id j125so1812827oih.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=56RQMUMr+V+abqwQ/qPJNWF2iDKr5GAQ/4gl+eurvL0=;
	b=AmaLCuiEC5EiV0WfPmLVsodo6D85ZulAHvKWd0vdOQZqGKfO3dJlTWE9+hHcr66Uqx
	9bo7tqPPLkQ2W/J6oJmUf9IULVV3LlbqaG15HrKq6XndGEY/GZ1yvfVPzhzMA0PoRCSh
	v55xQxJYPBHM54U+CQzwdBsW/NGXIHE8tk2evy5GcIVHEY5JniO91ewaoTK32RimuSqI
	u/4P54nu/EapX7Vyci9IbmRE6LZi2wV1YucnsaO08qBMttfxC2mD6IvfC67pf9y9zb6X
	JBDAiQ6/IvS/nnRmsD05b2QBYhRheUY90PKiGuJI1B1m2S3kGec3Vwl0kq8zBo7RgZ4O
	1B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=56RQMUMr+V+abqwQ/qPJNWF2iDKr5GAQ/4gl+eurvL0=;
	b=eMwyIFt1f9w0urbooqDExrZzKlhwEXXcxd22oF/Z8MsywlHJUQlm/5pdQPdAUeQA10
	C3242JuqflaZmnu4UXvxO1wsuBS803JZkDr9XWHnDXcvdIrEUnukODM3Ro8H1xdJRX9L
	z7uTAltLQGgFTDRx5BueudEyhhW4SFfdCjHtOANFXF8oVnxS1gi+nkK9ABpVa6cxpQ1Y
	7tjVtNCM0K3XVbvIKWgbpM31if6CTjmig03WGZMl4I5Z1L6ENTYwW442a1D9xQttBFi6
	BWxx3iTLPNRNrBQG3imQCpmVuXLrzNn/G+sBNt/kXZD1vMrWY+Epe/5AjBTcR+BedUvj
	LwJw==
X-Gm-Message-State: AG10YOQ3heJO/8SO1mex06kpBuErNZPZovDDfImi3JUjuHkH6gY8nQA2lAlnmTEsotVYJw==
X-Received: by 10.202.85.140 with SMTP id j134mr8972025oib.37.1456366539429;
	Wed, 24 Feb 2016 18:15:39 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id to9sm112844oec.9.2016.02.24.18.15.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 18:15:38 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:15:23 -0800
Message-Id: <1456366525-7522-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456366525-7522-1-git-send-email-armccurdy@gmail.com>
References: <1456366525-7522-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/4] gstreamer1.0-libav: move LIBAV_EXTRA_CONFIGURE_COMMON_ARG into .inc
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
X-List-Received-Date: Thu, 25 Feb 2016 02:15:39 -0000

The LIBAV_EXTRA_CONFIGURE_COMMON_ARG definition is now common to both
the git and the versioned gstreamer1.0-libav recipes, so move it into
gstreamer1.0-libav.inc

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc      | 7 +++++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb | 6 ------
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb   | 6 ------
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index c90af66..598a349 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -22,6 +22,13 @@ PACKAGECONFIG[yasm] = "--enable-yasm,--disable-yasm,yasm-native"
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
 
 LIBAV_EXTRA_CONFIGURE = "--with-libav-extra-configure"
+
+LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
+  --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
+  --ranlib='${RANLIB}' \
+  ${GSTREAMER_1_0_DEBUG} \
+  --cross-prefix='${HOST_PREFIX}'"
+
 LIBAV_EXTRA_CONFIGURE_COMMON = \
 '${LIBAV_EXTRA_CONFIGURE}="${LIBAV_EXTRA_CONFIGURE_COMMON_ARG}"'
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
index ba7ac7f..687230a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
@@ -18,9 +18,3 @@ SRC_URI[md5sum] = "cfe9a06913d4fd4067e9e47f6e05fac2"
 SRC_URI[sha256sum] = "857b9c060a0337de38c6d26238c47352433c02eabf26c2f860c854dbc35bd4ab"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-
-LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
-  --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
-  --ranlib='${RANLIB}' \
-  ${GSTREAMER_1_0_DEBUG} \
-  --cross-prefix='${HOST_PREFIX}'"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index 428d401..ebc8a5e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -33,12 +33,6 @@ SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
-LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
-  --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
-  --ranlib='${RANLIB}' \
-  ${GSTREAMER_1_0_DEBUG} \
-  --cross-prefix='${HOST_PREFIX}'"
-
 do_configure_prepend() {
 	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


