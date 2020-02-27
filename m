Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4D60761895
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:56:10 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id m15so286790pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 12:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C1jzNl1b0fybyzuThJwzxHSulZCgH6PimAtpklXS2Kg=;
	b=MeqPHinTCAAjWOpTGQsCZbS+ieZ//+sNUHTXcOmFP+udr+YZ3STTxmzMyGLcbHD8gv
	hZk/GJp1/CKVuXRfJSSLzLEMDQtaqk6R6oTcSEH8Z/SXAPyuPL5zTXE+vIPnEer9TcDi
	+gqngsvm4HNPxgS0kpEDwi/MxjmMLl7dbEhJ27ACkTqEqweht+ZkxBXWx+uB25noRTKD
	AH5P+vbOcifC4pwdgp+B6rxatQ1VTnGh/2Sf8hW6nH5pHM4hWUiYrWEm2hac0AAUG1il
	QJkho5tYvqP/6mfOqf86daFP5PTUg4b1z3ArQ/yJzSP7W+OZPabEwKErlFmsyVeflGiX
	XVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C1jzNl1b0fybyzuThJwzxHSulZCgH6PimAtpklXS2Kg=;
	b=FZDX8RMv3lUwjG+YVhXbp4YdNpaCSJd0MEdtd+9CnQa9XJKY8jWPBw328PK7c3eRpD
	7MO9vO0xK7ir0K/CStPoUqh3S32kpS7p4ylRluIKiCXkNR9NeF2pnfUm5xlzDmi5eh3n
	YVXVKSvqFjoikplTRxZPNe9muaIrOhdGcTmXRkTSaRKkZXnOduF2aXLeCHujaw1/ZjDz
	9/46LzXef8Nyjy/zM/8+hi/MXTY9p23YnQ/Q77nnYrrnzg2D5Z0uuOEodo7vUuG3/2rK
	UuuGh7W8InW4/X/4D+lCmU1CiAqkFYBMVAUSGu97di/OnMBmxPF4Rkc/PWhf7597deN2
	1z4g==
X-Gm-Message-State: APjAAAUl6YWAb60d7UIJ2AXLM54sBrWFuEKjlLNNZyE7nFJt3EegSLum
	/xqr2O5MP3L0qVqnmjOxdz0Dcp85
X-Google-Smtp-Source: APXvYqwaY18zR8iYJ0eNlnB3hfdoXO/sF8DgrNdkXkv7JP6XfBYD8FjJdA/AUd+dVfHJhcbKaXnPSw==
X-Received: by 2002:aa7:9808:: with SMTP id e8mr906636pfl.32.1582836971128;
	Thu, 27 Feb 2020 12:56:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:3d0b:bd00:40e0:2589])
	by smtp.gmail.com with ESMTPSA id
	f43sm7150784pje.23.2020.02.27.12.56.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 12:56:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 12:56:07 -0800
Message-Id: <20200227205608.26788-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227205608.26788-1-akuster808@gmail.com>
References: <20200227205608.26788-1-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 1/2] libuv: needed by bind 9.16
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
X-List-Received-Date: Thu, 27 Feb 2020 20:56:10 -0000

From: Armin Kuster <akuster@mvista.com>

move from meta-oe to core

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libuv/libuv_1.34.0.bb                     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-connectivity/libuv/libuv_1.34.0.bb

diff --git a/meta/recipes-connectivity/libuv/libuv_1.34.0.bb b/meta/recipes-connectivity/libuv/libuv_1.34.0.bb
new file mode 100644
index 0000000000..b842bbda7a
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv_1.34.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
+HOMEPAGE = "https://github.com/libuv/libuv"
+BUGTRACKER = "https://github.com/libuv/libuv/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
+
+SRCREV = "15ae750151ac9341e5945eb38f8982d59fb99201"
+SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+do_configure() {
+    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
+    oe_runconf
+}
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


