Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1079C7E334
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:14 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u17so10782598pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7o8HhbvxIEagLTYIvDaz7kCvnCRjebdsJ86cg5oyhRY=;
	b=QdzI1j1bZJlrPLttlX/FPbbxIvwuqNA6lRy9iYxEZJWl+Pj3FO0oh1q90b3JyXcHly
	eAVI6r/9Zm/GAJNdjbRfX014BI1O32b0RRrt/IHqjAsxBwiVWwj51SvSH4IIveJ7MNR5
	+n8d5QinI6oZnoic/rd7WgPQW9crwDNKcAyOVrM5bh0+Be6Uuts/igCDh6WvQk6z7kx/
	azP8ZxIuGstDdOvFXVFTdyGjh622I2/X23kJ6jd+2mbStxM+yrQk207eLeIyNczwQ1qT
	DUZ1tyDTcja5BVbIGqXaacP8MWQmeLngKJKYAR2JCa2kmvPyyPvSuVRg9jJ1vb7Ia51t
	hDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7o8HhbvxIEagLTYIvDaz7kCvnCRjebdsJ86cg5oyhRY=;
	b=rQzTJGvPZe316ta7lw/9s8I5ufBeI/XbP0Ogu3ft/YQ8t3EOGIAFD2AABqQpFgrSoE
	oaaJwqnS0BvF40/NmUnuiUva57k3hDvX0NeEaUFCYde0mf4OI4yqiBF0244hVgVbDROM
	EwjiMS5X0ktNAGErH2alXLGF9zsnCZybUSKrTNdIyFLcl1adppxQnOk2DSXFVdfmR+fI
	QAB1AVBKEU0HLvi4CSMaT40p3INb+uH73vcGhLSWYWR+KOzSXJvKau7szuhUhujataFc
	dZDR8uEdN6lV5efmkbjunM3PnmjFpDFeIz+XaYfjedbOspvp6JibbtlFf1TlnCBUJoir
	wkjw==
X-Gm-Message-State: APjAAAULDpJI21LSKPtHiAi/90jxBhJIX2MQgookHnSBiqpyEVfEGQtu
	mCYI/sXc8hBE3PkvHxmCTGrNU0By
X-Google-Smtp-Source: APXvYqyKC5lzqIm0Ho/4NG6ChE1uLtRddTJWKGuWhIrzmRdggWdtASm4yFCJ82Mw/09Gv5JoTWlKiQ==
X-Received: by 2002:aa7:808d:: with SMTP id v13mr31617278pff.198.1559574435281;
	Mon, 03 Jun 2019 08:07:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:50 -0700
Message-Id: <1ad805984c8c9c9a505b6b0e8ad870b8233b13b2.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 07/21] ptest: Add RDEPENDS frpm PN-ptest to PN package
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:14 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Many different ptests are breaking as they assume that ${PN}-ptest
depends on ${PN}. It doesn't currently but should. If we fix this, many
different ptests start passing when they previously failed.

It does depend on fixing an issue in the dbus-test recipe which is done
in the preceeding patch (mentioned in case this gets backported).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/ptest.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 936bf82..fa4c36e 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -13,6 +13,7 @@ PTEST_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
 PTEST_ENABLED_class-native = ""
 PTEST_ENABLED_class-nativesdk = ""
 PTEST_ENABLED_class-cross-canadian = ""
+RDEPENDS_${PN}-ptest += "${PN}"
 RDEPENDS_${PN}-ptest_class-native = ""
 RDEPENDS_${PN}-ptest_class-nativesdk = ""
 RRECOMMENDS_${PN}-ptest += "ptest-runner"
-- 
2.7.4


