Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id 333EB7D012
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 09:43:33 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id k8so26222310eds.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bZYCNuzVGTfbU/pKCo8G7cb7eUJEgP99EGWMtNeVzug=;
	b=QfI1QJKdcI07lkj8Ys6L0yQoFe3DIL1IjSE/kYMWiUb0WHbLWcN7D83xd++zmKXFvr
	rbdGetfSMjFWDsjTZ3AKVA4oC/AWp8rUFH1fbbLGK2lVfp+6y/QjlvfxAPrz3sSfKIV9
	l6QSN8OyEZ13uUtBhK+IC80kZeTVTDigPDzddQ0qFwq1x3cTR60Rs2cKjZF/GrxDLBFi
	io6D3f6ibR1Kv9GT7lMSMVrMTtFBp7a9R1dGcG649V7K/MgGOIG5cGhKUj2Z+gXSfLLR
	kqJ9+xQmnO8/69NxyulBApd2UCIgbQpfq2PwYFdSFP3uGEsMpP9SoQ6RT4/LlOyHd5gv
	PZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=bZYCNuzVGTfbU/pKCo8G7cb7eUJEgP99EGWMtNeVzug=;
	b=RzhHNINqSRhHQ8edv7K9syAiOg75mdv/YxU56d2YPMi8GXqKHU/2U1k9w9Hd0GIWTD
	Gog7uIn0hSa3mn7bzR8xHVTO/O3IYUs+nk4MrzTyh7Gi8MmaJKSslPkDD2lwu1Ykjjcp
	fnyNyGBjiphGlsYjPx2Vjj5i5AL/tG7GZVPx4NP5Q1x5dDjb2GJlqOELHl2TIT6UAcFh
	XUhqWnIGRD2hstMZKIJzF56RanTyVCdhBr9Plf9RStKWnPksyAzP5xORa3fB5pU3Ly+z
	elAfWZ6cQ3XLnmCAyn1zMETBQbz/rmnlHAT7enkA++reSrhM1js1NuAJBdbpTYOdtEJI
	NiYQ==
X-Gm-Message-State: APjAAAX05X43/miCCFCWMPzY/E5I9PN/jsAeFFc+zvWOs2YCJ5N/q0Fo
	5DioXGIP+n//GBZBs0qy0frmUkuytM0=
X-Google-Smtp-Source: APXvYqyzXBMjs7eLhqfOLV5HXxIT0WsDTDpkXOkpE9am3ESiQJivPTY20IELLFUerpxZRCZbwcxnbg==
X-Received: by 2002:a17:906:cccd:: with SMTP id
	ot13mr55917659ejb.37.1560937413506; 
	Wed, 19 Jun 2019 02:43:33 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	u15sm5432309edi.10.2019.06.19.02.43.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 02:43:32 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 11:42:33 +0200
Message-Id: <20190619094233.7577-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] meson: Fix native patch to python3
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
X-List-Received-Date: Wed, 19 Jun 2019 09:43:33 -0000
Content-Transfer-Encoding: 8bit

Fixes:

  File "/workdir/build/tmp/work/dbfp4-poky-linux/qv4l2/1.17.0+gitAUTOINC+95f39aae48-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/mesonbuild/dependencies/base.py", line 574, in _call_pkgbin
    cache[(self.pkgbin, targs, fenv)] = self._call_pkgbin_real(args, env, use_native)
  File "/workdir/build/tmp/work/dbfp4-poky-linux/qv4l2/1.17.0+gitAUTOINC+95f39aae48-r0/recipe-sysroot-native/usr/lib/python3.7/site-packages/mesonbuild/dependencies/base.py", line 556, in _call_pkgbin_real
    cmd = self.pkgbin.get_command() + "-native" + args
TypeError: can only concatenate list (not "str") to list

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/recipes-devtools/meson/meson/0003-native_bindir.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson/0003-native_bindir.patch b/meta/recipes-devtools/meson/meson/0003-native_bindir.patch
index da477454cb..2b22531dd0 100644
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
2.20.1


