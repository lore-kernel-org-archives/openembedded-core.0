Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9706FF5D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 02:53:34 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id xk3so126724104obc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 18:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P2zGCZsiCbOi1pUOVSZKs2ws2DPFXf3djJ8UqLf6h4Q=;
	b=saWU90G8upE0kzjMJAEiTuUSIOyNudRHXW55znEa3Gi+ebyaUUZyHOPVX+tO7KkLS+
	eQdjayryfOJFgI1LNbEPhIDB+PamStdhiMeg0dGjYix4ueDO+j1ZCOjqymTFDp4L3v1n
	YRKT7Aufsao5VXdV2kG4QWDkzw26oyLGrMcbsqmCD728JKaMScVQtcINYeqiB2/oEk5g
	JYtJjf3JQZZG2e8KLyte33mMMNqtTd65Qc8CSG0vj8MHU576JHbbVIdwjgFczCiUl7I4
	G6aGdI6GYmjCDzvux5Qk1U18pu1ybzdWdrJECg/fpcd+VuKgCFf2pEM6dNsDI8aUJj3Y
	gGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P2zGCZsiCbOi1pUOVSZKs2ws2DPFXf3djJ8UqLf6h4Q=;
	b=eN2M+jEyg/WzqLuuYhMJXemDH39w/B+S5MnGSn9O513HY8EkmIQEHs2qNapVSBwK9I
	bjmcmXzGX9finF3+e1monxZqRx/FDrjRQRqVMKAWMFnyoLef0AcZq0mjDsaOWHnMU4qH
	JH8kaCJTWQW/uyl9uFI1DefxpNVdKDjNbyyaC+l1H7Mx0ekM1Lp5XF4bY9pQ2HCC2UJT
	GZCR3Mnyhz7IpT4nSI/XJi93foC0EK3vJ4trxWx9lhvCVGIiG8qNE0IJu56+7Zs/9s+5
	i1i2VjX7ZaezIeVm+MAFzx9QcksLzo++DzPtUYBsIaDRSf7Kt6fzMsD34waXLQsg9CgJ
	lQPQ==
X-Gm-Message-State: AG10YOQgPaqzxADimuUeWMAqsM33lIUpzes7q8NFKlmN3aZd6MwBfCxrIWEWs12YXfrZiw==
X-Received: by 10.60.44.236 with SMTP id h12mr3762512oem.14.1455936815523;
	Fri, 19 Feb 2016 18:53:35 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wh4sm9192764obc.10.2016.02.19.18.53.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Feb 2016 18:53:34 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 18:53:16 -0800
Message-Id: <1455936797-13430-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
References: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/6] gstreamer1.0-plugins-ugly_git: update 1.7.1 -> 1.7.2
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
X-List-Received-Date: Sat, 20 Feb 2016 02:53:35 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index ccf6ece..69afe4c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -10,15 +10,32 @@ SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
 "
 
-PV = "1.7.1+git${SRCPV}"
+PV = "1.7.2+git${SRCPV}"
+
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "c9c37983babad909d01c1c4c417d42a0cf252c1d"
-SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_base = "8bdb68edbc605e21314b608e7a39bdbaab7302b8"
+SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
+# The mpg123 plugin was added prior to the 1.7.2 release
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-ugly/commit/?id=43bd45ba991ef3247957ca37cdcb52f4b8c0acb1
+PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
+
 do_configure_prepend() {
 	${S}/autogen.sh --noconfigure
 }
+
+# In 1.7.2, the mpg123 plugin was moved from -bad to -ugly
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=08d8aefcdaaf89ecb6dd53ec1e4f95cd42d01664
+# https://cgit.freedesktop.org/gstreamer/gst-plugins-ugly/commit/?id=43bd45ba991ef3247957ca37cdcb52f4b8c0acb1
+
+PACKAGESPLITFUNCS_append = " handle_mpg123_rename "
+
+python handle_mpg123_rename () {
+    d.setVar('RPROVIDES_gstreamer1.0-plugins-ugly-mpg123', 'gstreamer1.0-plugins-bad-mpg123')
+    d.setVar('RREPLACES_gstreamer1.0-plugins-ugly-mpg123', 'gstreamer1.0-plugins-bad-mpg123')
+    d.setVar('RCONFLICTS_gstreamer1.0-plugins-ugly-mpg123', 'gstreamer1.0-plugins-bad-mpg123')
+}
-- 
1.9.1


