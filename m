Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 159DE76E4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:15:06 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so280265wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q9rtUNqdJeN4v6+H4OWoeIRJkM2OUInL72bnfhS6d5Q=;
	b=Jslj7DWGCUbzB70Fxuhn5xVm5cXT2ll70JXZccgZaT7CzF5rwUuArwU6dtebG8Sw1c
	7uBmEDwmMazoGDZz1OyPnAeuA7vrDPR0+z6radEW1egUorSBorjOdRZ970YoAIJmakEo
	+d6qxy0PFwSJo2P/fThlzWr+7bFHR2TxJ/gluuvzgwb8Kzw5LfOhNnrRucUBpYKiiqiR
	9JwY4cxTgOT+ikLLdQ8nwntWSS3D/Ds9C0A7KyTJnFwCwTt4R1d+vGT6AZgSsZqF/lCa
	azmzA0DX12PmK/C/F7cRQEmjwCM2/cSwOAUT/tqxT8Fd5JOpm/gEXLLeCZtvWo30jXtD
	0R6g==
X-Gm-Message-State: AEkoouvPRsVUbfK7wPDfyRK55/5GYs/RV9SKTCCJDundHfOQEPHfEw1KMVepHwuja1VFGw==
X-Received: by 10.194.47.7 with SMTP id z7mr2844531wjm.63.1471536906417;
	Thu, 18 Aug 2016 09:15:06 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	al10sm2921327wjc.12.2016.08.18.09.15.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 09:15:05 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 17:15:01 +0100
Message-Id: <20160818161503.20738-2-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160818161503.20738-1-git@andred.net>
References: <20160818161503.20738-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/4] gettext_0.16.1: fix lispdir configure option
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
X-List-Received-Date: Thu, 18 Aug 2016 16:15:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The option is called --with(out)-lispdir, not --with(out)-lisp

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 5a58578..6710c8d 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -30,7 +30,11 @@ PARALLEL_MAKE = ""
 
 inherit autotools texinfo
 
-EXTRA_OECONF += "--without-lisp --disable-csharp --disable-openmp --without-emacs"
+EXTRA_OECONF += "--without-lispdir \
+                 --disable-csharp \
+                 --disable-openmp \
+                 --without-emacs \
+                "
 EXTRA_OECONF_append_libc-musl = "\
                                  gt_cv_func_gnugettext1_libc=yes \
                                  gt_cv_func_gnugettext2_libc=yes \
-- 
2.9.3


