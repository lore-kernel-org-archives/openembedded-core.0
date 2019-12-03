Return-Path: <anibal.limon@linaro.org>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id EB1A97C5F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 22:06:26 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id b8so4903072oiy.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2019 14:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Sv+A4z9Gk/HJO4M+sP1fj+oblg8gQzgwEJHLVKYZ9y8=;
	b=cXGPeX+WidS+jvhBt2wGY2DEGzB6Y7RMD/ZSGDbqKLyK1W9d0WTenzSMXayc2o5nQ+
	8+0i6zf7XUBmLhvML6zeTFvl8u5Y5E65hnL5xznpw5MTtWdvJPtpJSERzVSZGQWeHA1+
	H+uExsiLcPTfM3Vrxf9eq6yNr1LwrtvfxtGRTtS7NIZajix5XlJ+cjEyKehhby4xqvp3
	6g37Bu5NCVIhKFRSwshja2qEZygnz22wYDFSQCbeOGra16tPYO9nfKCAMj9TnQC1UjKU
	jHnFoM3xCN/pCWYN4Uh2VoQowk6FrlEmEzM9ZnzErtRqssWQQbBCE8dC5FNNxU/UgbyW
	B+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Sv+A4z9Gk/HJO4M+sP1fj+oblg8gQzgwEJHLVKYZ9y8=;
	b=X/EMffZ8xa0IAs/lASrl+88MuKXU7D2pfXVnYg3BFTDDV6qYCCBiYlT3KT3uGnro5j
	ijmeDIKWxl4yugji4DeOPsoOqkHUklXjVP4DKs8FDgppjim6Fg67ch0VPr5M/xF1rXIa
	gKAUyNvNHeGxJeOabV8x2i0vqegM6XaHg1jqx8BsjSlq6ueiJShEsvt5NpwDELuqKiEx
	jMArZ9/UOd2XGlJFPZGGHj1qcFySF0dNldiT72TrY4Zi3VX/UDBuIw/9c1MB2nvvugN5
	rvOZ3p4q8WtJC4sbHQxSFLFos8InUMaOP/OfnAIhxPuLSXOIs/uE/4Q9uBpA/0kle3oN
	sT6Q==
X-Gm-Message-State: APjAAAVHuGAoTSOyIiTZx7zlh4ibzlBERuAkC0GopSnHPG1ICPrrfJq8
	BcgT9JZYWx7j0ei76rf/eeB1j/3zTdY=
X-Google-Smtp-Source: APXvYqzUC1sXLqcnPxyuHeYjESiB6UAP9nTrmBuXdwxQxoY+QsxdyKhPCiLiPR2YeccvKZYxzhZ0Aw==
X-Received: by 2002:aca:5cc4:: with SMTP id q187mr174535oib.45.1575410787654; 
	Tue, 03 Dec 2019 14:06:27 -0800 (PST)
Received: from blackbox.rga.ip ([2806:109f:4:db29:908a:c7ff:fe6a:e9f5])
	by smtp.gmail.com with ESMTPSA id
	g18sm1501342otg.50.2019.12.03.14.06.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Dec 2019 14:06:27 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Dec 2019 16:06:24 -0600
Message-Id: <20191203220624.26500-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] meta/classes/meson.bbclass: Add inherit setuptools3
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
X-List-Received-Date: Tue, 03 Dec 2019 22:06:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes,

...
| Program python3 found: YES (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3)
|
| meson.build:36:0: ERROR: <ExternalProgram 'python3' -> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3']> is not a valid python or it is missing setuptools
|
| A full log can be found at /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
| WARNING: exit code 1 from a shell command.
...

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/classes/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index efa6234078..90868963b7 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -1,4 +1,4 @@
-inherit siteinfo python3native
+inherit siteinfo python3native setuptools3
 
 DEPENDS_append = " meson-native ninja-native"
 
-- 
2.24.0


