Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 468107C48B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p7so17948973wru.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=S+fD9dT8fA+MvYlgMKZfOrrCdbilB1L3S2b5hFNs1Xo=;
	b=lkW3VBucBXnfvYRXeqbeBDunvWVstv9JejELGWBEPUYTzBRk8xmEAjSn7EbCvtIeve
	lSLbgWS+P7tarOMrkDtu2xAzR3flPVTeo+vMa5NEE2ayJyzrNZ4VQ0mChdQzjxBCY+7l
	2aezz1AhVoO1nLD7Dnrx8D4BBJAmmBIeGv+fGyXcDGn+XsAl1QkZABaF6pU5vsOH5TSc
	DscmmOlIXRXzaj0xi16kDVuQ4TCi6lfxat1mOPKxi64bJf+jEoHGMXF+1i2K4foTRPm6
	XgetbIJ7xehwOB7D73wADSTwIA1NLZDW7CmV8cqJYqxsmzVCsHwrzFeBxsTt2p4pGt0L
	uFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=S+fD9dT8fA+MvYlgMKZfOrrCdbilB1L3S2b5hFNs1Xo=;
	b=Rfb9jIgnVicrZ3ijGTIV8AdIxoC2/xXA17co7pKas6h7imb4aJdAOSi6Ze8lVsisAE
	8Vxxt2YAu7mpyQVlP9SvQu6mQCFw9JJUwT1pGdNKXX3gR3p0vAEeJFSqifVPMp7Fynvy
	Rv5m/sCq7BirCQywoq/Wx5bFpCjMXWXo9KJ9OLmwMjq6BlI3A7ZDSmYzeGgKt/nutL2j
	ztD/XtMyKNn/DlTbY5miS/1mg/DlsYdf+Efi3xdgb0n/UuK0f4ebYFrsU1xVdi88qvK1
	+wZtMP2JN3dLWxmadoihsGkCYQeiewt0n51QHEmKh/B6HdRqJVfOE8qm1a0V2pvUj3Ud
	4fZw==
X-Gm-Message-State: AJcUukdAYL1jcrQOdf44QyQNopw2DVGc1LygllT7TZHErQ7Ec2rkfrHw
	f7KyUrGu7TXug4FtUcm5AabG/TwY
X-Google-Smtp-Source: ALg8bN6m81vA7E8FB0DefxIS9WIPbriktqkH7nIZARD1OkCozAMctqrwXB8iUb2e5+sJ5iX3A5pIsw==
X-Received: by 2002:adf:ce86:: with SMTP id r6mr22675873wrn.257.1548679633392; 
	Mon, 28 Jan 2019 04:47:13 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:37 +0100
Message-Id: <f9fcd5ddac3414ad5b5b9af6352f97af22e0b07c.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 06/24] libepoxy: enable native/nativesdk variants
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:13 -0000

libepoxy is a requirement of virglrenderer. Note that we strip
RPATH from the library, as this allows fall-through to the host
GL implementation, instead of attempting (and failing) to use
mesa-native.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
index 92f644c039d..dd706a96063 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
@@ -14,9 +14,25 @@ UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES_class-native = ""
+REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
 
 PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
 PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
 
 EXTRA_OEMESON += "-Dtests=false"
+
+PACKAGECONFIG_class-native = "egl"
+PACKAGECONFIG_class-nativesdk = "egl"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# This will ensure that dlopen will attempt only GL libraries provided by host
+do_install_append_class-native() {
+	chrpath --delete ${D}${libdir}/*.so
+}
+
+do_install_append_class-nativesdk() {
+	chrpath --delete ${D}${libdir}/*.so
+}
-- 
2.17.1


