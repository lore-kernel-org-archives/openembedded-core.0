Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4222E77F6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:07 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n23so17287722pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DMubrUO8VGUQlsqpJzGJS1j8gegNbogpVDjm8gTi2o0=;
	b=SEbpW1O++zdsGDFJVPym3+COtBfDH1iVh/iHA1gG3CslYgnweYz84xYDgSmenRN+Mc
	/cwc2GqtxKKfgMd98iCTh9bRsbHlneh+Sd2PXVi0yt+5zdEzKabTUBsimIJkm0ju9ifs
	V8Mttbu4EjOUFwCKyugKSASQdX3MYB4wBxHCKV8g+WNTbvlZmBln25cedMV+m8EUX9J2
	gGis+uMA5dUYRIOJ0amQ6bqH3B+YE4CTIdI11u77Ghfo2ORChrFy/WG792IoLnU7PwvJ
	tTdMYYwxDeEB3sZtwxfgb56fvxbrg7rPxRTwEQhmqkz7aJMeGIFCBQGUrHCDlhhFxbsp
	tdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DMubrUO8VGUQlsqpJzGJS1j8gegNbogpVDjm8gTi2o0=;
	b=kuPJLJfpMDIlSfkndV7d7AXDECQgh1xhApHhmcaRCwMQA2+24/66X1mzKBLMVl7ca6
	S67wQEbNgpMkF0CbQNPKw6COjDVax7uSCXTioBaU21H7ClTKHxIbpeAxYnzQBgoR15Vv
	Az65oZpCnbEYSP7RTFwhSFxCkLBBEczyf0ai0+eUZoqD0yyutRsWxSlf5oI379f+iqO5
	0VhZh1J2R5CML8e71PS28qfcK8hlsuAxfoStbS8iCd2TUcl9o/86hjabY2dbAyHrz2sT
	MeoElqZxhLb7Loox7h5zaOqvqfx7w8+6JHK5HjgiRsGVdkhHgnWBeYDuEaIOQlhA4T+5
	w3iw==
X-Gm-Message-State: AODbwcALcOH/rMr3rQ3O6e6F/Sameco9dgj3FeVq52psmmljcTuOb/vf
	UhXHhku9ZXhoHw==
X-Received: by 10.98.105.132 with SMTP id e126mr23033750pfc.201.1495429268730; 
	Sun, 21 May 2017 22:01:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:35 -0700
Message-Id: <20170522050042.42403-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 08/15] xkeyboard-config: Enable nls support explicitly
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
X-List-Received-Date: Mon, 22 May 2017 05:01:07 -0000

Helps compile when distros disable NLS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
index d00904df21..d308e9b07b 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
@@ -19,6 +19,8 @@ SRC_URI[sha256sum] = "d1bfc72553c4e3ef1cd6f13eec0488cf940498b612ab8a0b362e7090c9
 SECTION = "x11/libs"
 DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
 
+USE_NLS = "yes"
+
 EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
 
 FILES_${PN} += "${datadir}/X11/xkb"
-- 
2.13.0


