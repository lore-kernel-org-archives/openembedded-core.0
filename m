Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1109277E7D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 05:34:39 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u187so4568013pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 22:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DMubrUO8VGUQlsqpJzGJS1j8gegNbogpVDjm8gTi2o0=;
	b=CdeCIxHhVI9zvB+XJ6B5KWyWXgx4gRRIVD7cS2gshqYpUvPcU0H6saRVq2+BMCLYZI
	YBq1VujVw1lIoLKoWf4zX05JMBv9K6mc//Hdf9wGWnumSgiTySXfqO652jLd/0DAv/nM
	XxfMmWjmUB3tHbgJLOLx1sxEMYFj1ZhpPG0lKjf0Dm70M34eMgan45+T0t4wU8NYTYKR
	RFmJBpd1q4x3ex0e9WYlKaiOMTnoKWdm3PwNNxVVDwrSaThrJrlGEMKdcha16yOvnlaJ
	2LC/yMbLgi0xzgr/iMT27HnwZaMj6q33TfrXUCBUsdbeQ3ARmGP7Jc9vUfnDiLJ+D0Ia
	8Zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DMubrUO8VGUQlsqpJzGJS1j8gegNbogpVDjm8gTi2o0=;
	b=B0JH/fr5/wGdv4D8kCraIHpPr1+WJztIrO741mOL8O5mft3e+7df46J048YdhlX89C
	Qd3AqVnf0RQuA0tqxUmSQPpEWDr3+GnJcPu012GVCDRqnPs/x1rxPFyj/W871STFJymE
	eSLlDwC6PH90vsP6nAXpJBVNkPM5+ApCbdBbDniyO4y0CRHW+o+enZjwlSlkGasv+eNU
	nApI+uYc6ItZKHGiN+740bcANs1uwlqsp2h66dAqzRCv7E073E8y40rkBnczKfH1CLVm
	V4W0bmHmgzUDxRLA9MQb2XMbYx3MxV/Gj4XU57Yub9dNHVNeqrLuudL/QPprHskiBwX8
	Mm5Q==
X-Gm-Message-State: AODbwcBf91523bCqxPM3zTc67zzmYihpjK8Ht1hdQyc8IEN8R0ei16te
	J7HmCd03+faruTXn
X-Received: by 10.99.95.88 with SMTP id t85mr2580956pgb.50.1495085680505;
	Wed, 17 May 2017 22:34:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	d83sm6802286pfe.40.2017.05.17.22.34.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 May 2017 22:34:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 22:34:25 -0700
Message-Id: <20170518053425.37319-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170518053425.37319-1-raj.khem@gmail.com>
References: <20170518053425.37319-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] xkeyboard-config: Enable nls support explicitly
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
X-List-Received-Date: Thu, 18 May 2017 05:34:40 -0000

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


