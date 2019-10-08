Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 716257F38A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:04:51 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id u12so8565113pls.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=I2VGnt+ccP5TXF77jhqDdVFG4H6eAjJxO5DG7P/PX8Y=;
	b=W0jUx3YCQd+NKKnrzhitd13Ri8R4+UQUIXgOYuyhTm942zqvclUidmvLBFQB+DI3wq
	ZBOTNF2aBIfW2bOLfwxYYESF8lvan+z2erW/r65KBNFP1zMhQJYlYwF9GtsC41fyDI5T
	j+F8uiQd2D0/KIAXtjFfcSm+RH5tbSBaGoOny0SdXHD4Zimmgt2BP0xofWNSZqL8IxD/
	zAxdmlRcpszmyCI1MCQIBc7f7CRM5rC9ZTQ3ce1dF4JxhYrdzj3uL39BkLn8OCGxn/Pp
	MC9n07a/Roqd8Eqs3gh2sxDB9u0EEjeglBe58R6GbxKqOW24Yx1Bkm8xH8Btn22alCw+
	n5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=I2VGnt+ccP5TXF77jhqDdVFG4H6eAjJxO5DG7P/PX8Y=;
	b=RnzLZzVCF0cPMzhaydzMaB/xwORtfMmxzzXBV3B6OngUCOqy+Ext80dCz+UfYetNC0
	8RXJySt0vaxfbZggEMi7M/nfYHs++0EA7E+P8QL/tgdlMKdUkjtypB8IbQq4uhJpJiLf
	Mb5c+XsvTboGN4pll+oXrFmZzkAs3RU7sLWHZth/F3+eJgifPelOf92h05gveOGVB4HK
	xURTBh65M+W1vu4Dr5o4NqFTssnk8viVdjy4zcY/Z9BGJ0KR+CAzjUUV0bkSDAeHsW84
	DxleZmdU70lBCNQNTPUrf0jRn2guKZTn/tMgTJQpKCYfqAobs1HdZh1Yn/wcR+QA702f
	0ftA==
X-Gm-Message-State: APjAAAX12TzqGrios3MAbyZt6KkVj7au22EOGiCvkifm1B8XrYM873Du
	YRu/9htkH9BRaFQcZmd3klfPoMjkr8w=
X-Google-Smtp-Source: APXvYqw68XY6tssnJIjjvy9sf3YrXCaK0VFydpEuCQtCfGek0FZu9FwEeymCkXwZOpafhFnjHa07Fw==
X-Received: by 2002:a17:902:7045:: with SMTP id
	h5mr34968865plt.161.1570547092328; 
	Tue, 08 Oct 2019 08:04:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	a8sm17675579pfo.118.2019.10.08.08.04.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:04:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:04:36 -0700
Message-Id: <9051c10e46960a357f0339e347618f5d83923fe4.1570546808.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570546808.git.akuster808@gmail.com>
References: <cover.1570546808.git.akuster808@gmail.com>
Subject: [warrior 09/10] meson: Fix native patch to python3
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
X-List-Received-Date: Tue, 08 Oct 2019 15:04:51 -0000

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

Fixes:

  File "/workdir/build/tmp/work/dbfp4-poky-linux/qv4l2/1.17.0+gitAUTOINC+95f39aae48-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/mesonbuild/dependencies/base.py", line 574, in _call_pkgbin
    cache[(self.pkgbin, targs, fenv)] = self._call_pkgbin_real(args, env, use_native)
  File "/workdir/build/tmp/work/dbfp4-poky-linux/qv4l2/1.17.0+gitAUTOINC+95f39aae48-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/mesonbuild/dependencies/base.py", line 556, in _call_pkgbin_real
    cmd = self.pkgbin.get_command() + "-native" + args
TypeError: can only concatenate list (not "str") to list

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/meson/meson/0003-native_bindir.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index da47745..2b22531 100644
--- a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
+++ b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
@@ -51,7 +51,7 @@ index 6d3678f..90fdb80 100644
 -        cmd = self.pkgbin.get_command() + args
 +    def _call_pkgbin_real(self, args, env, use_native=False):
 +        if use_native:
-+            cmd = self.pkgbin.get_command() + "-native" + args
++            cmd = [self.pkgbin.get_command()[0] + "-native"] + args
 +        else:
 +            cmd = self.pkgbin.get_command() + args
          p, out = Popen_safe(cmd, env=env)[0:2]
-- 
2.7.4


