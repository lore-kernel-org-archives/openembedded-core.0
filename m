Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id C99F67C113
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 16:39:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id s12so3726220wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 08:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=S+fD9dT8fA+MvYlgMKZfOrrCdbilB1L3S2b5hFNs1Xo=;
	b=sgp3NjxwGcv730udUWuZQGetleBlz5CFGKWJJT2ggRuAeJYQ4J8L7Aa2QO4RPL/9ed
	ubuTJcEoKLiZPkVmsMYCRa4lCIhwuci4/K0zjwngMLPo9TXbrvGX3GOtZvvRNxTC5b74
	+44qinGn59JosH8lIWxV45NYVoF9h5aKMwoavOgMmujnEZz3Jlu6LkMdxntkZzOhZ4m7
	pXJTUnK86Ykt7Cx2Zf+6cjPMztJF3CIPvCJfJehG6CxCp3+MzUSA8NmI7grOlndQMHXF
	CFRsIamGU9qEXCwk63Abxr5A42yn7awdAC7y4OIKlp1kSOkyTEjXAML/BsllGLZCaSzB
	cO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=S+fD9dT8fA+MvYlgMKZfOrrCdbilB1L3S2b5hFNs1Xo=;
	b=OrNb6x/XgBUzQkptI7bwSBE6/IEcQNVjJnqIHY3dJ4T87GUt+z7d71uoUCKb8hatKq
	POCzylatj1wBdubk3pZq5dQJ74mlcbgjvgl0y4AUNcAjSM0ICsSAwcQmhzKrGDdMI1p/
	/nVa79VV3aXfkalEheOaLd3kD0SUsnr4AAwqMyzH1wWSpR0xHlBadcW5AU0nDOV1yHz/
	/sg3k1A20EhpbSCnyNCeQ3ZZ+3brSw/cUn2rbV2i/itT5x8K4RaJfJHQvyerRMkDhK5R
	wqSKlJMSuQNkg4VnfTj8JVpYJFp1QbgYaUp38/sgt1i91jhHB3/pOFUe9OapNTOvZEBI
	Nx7A==
X-Gm-Message-State: AJcUukdATaDxbp8whx0V9AIWFLvZq4tPCJ5btETFBJdQMhBl7Dn4vhck
	OKCSfPeU4hx0L1EcmuJEuXWL4cP2qtw=
X-Google-Smtp-Source: ALg8bN6Kx5XEBK3W61cEQXASEEU0Ef/EkmV/2Myj+pnJlPg7gRkl1jTO7Fq7b5+Ry7VB2sDjk4Pqcg==
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr3835084wrs.318.1547570350299; 
	Tue, 15 Jan 2019 08:39:10 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f15sm77594927wrt.10.2019.01.15.08.39.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 08:39:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 17:38:41 +0100
Message-Id: <88a87f9f6a6461cd6429d7b9209e9ca184d42a80.1547570285.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547570285.git.alex.kanavin@gmail.com>
References: <cover.1547570285.git.alex.kanavin@gmail.com>
Subject: [PATCHv2 06/22] libepoxy: enable native/nativesdk variants
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
X-List-Received-Date: Tue, 15 Jan 2019 16:39:10 -0000

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


