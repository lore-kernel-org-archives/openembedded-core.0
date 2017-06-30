Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id AAAEE78237
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 09:25:52 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id f28so9548882lfi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xNGzPlnE6ZOSnv3+9QMZdCraxIoLPYCE2gUGGHRyuqE=;
	b=UsmysaUjckNn32ngZdGcT+qTgjp/1JTalBZYo49/CURAmEBfbtLvbhEs11dHlc+gqF
	+zR9DsIGE53KuXNPGDeZtisaWkuP/tWL41JeT8z5relcOyaikmG9FNorrEmc3C+XFZ73
	9Wf3Qxvl03T1uzDQFFF0ZorJEhBfo5WJa2qqY+EGJfAEHZdVfADoKGOcbDPXaT1Za3m5
	QHPN8iY9Z5SZOsz19T6m/7qFSmhwOXcPMf8qUj1p7qrF/LGZB0OtbwfYse5nSrck6Qtc
	oiE7EmoOUPC3cpKtFK1XtV9lvgpmJRdE7xS7fb8lru7l/TVvaQELsmnZnizuSNEGxMJv
	oOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xNGzPlnE6ZOSnv3+9QMZdCraxIoLPYCE2gUGGHRyuqE=;
	b=BDCStQedKYXOzVkjeyeVFD4zJhSka9Cb1KhPRnddd7CKeq9KWNZrQtxFV5Bw3YOMxq
	eAaoF2YnBnQhmB4hd68Nv0R0bNv5gBncfSYcCeu+606cQo9PPyJEn439yquqYekRTIHz
	v+rEx9+D1NTSB2CGQubstRzgUZevI1RP4iIOrUMQJQMzsBlt2N4H799knuzRef7TI14f
	6/xvMT+mL8OH2vaONDgSSmq4lMp59Zeo5NC5fIVHNFCuKCWQ3ZSO2q2n1H30UaKd7Zs1
	oqFbA2yfTr/ags2BrSpvyFYn2/sk3uJUPaNWjp5JAvqBVmTQuUGbFnLZyyA4ueTmgq1Q
	ImEQ==
X-Gm-Message-State: AKS2vOxNvB5QZFoi7qIVinIslErtVrZSeHhcv5pyqapkeHTySqCYlrTw
	qZ3U/fMGjiyCcVK991M=
X-Received: by 10.25.201.3 with SMTP id z3mr6821424lff.72.1498814752954;
	Fri, 30 Jun 2017 02:25:52 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	g133sm1891377lfe.40.2017.06.30.02.25.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 02:25:51 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 11:25:42 +0200
Message-Id: <20170630092543.3151-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170630092543.3151-1-ricardo.ribalda@gmail.com>
References: <20170630092543.3151-1-ricardo.ribalda@gmail.com>
Subject: [PATCH v2 2/3] libgfortran: Add missing dependency gcc-cross
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
X-List-Received-Date: Fri, 30 Jun 2017 09:25:52 -0000

Due to the fact that the recipe uses INHIBIT_DEFAULT_DEPS, we need to
manually add the cross compiler as a dependency.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 4846decbb834..3b94c1b85b70 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -37,7 +37,7 @@ do_install () {
 }
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "gcc-runtime"
+DEPENDS = "gcc-runtime gcc-cross-${TARGET_ARCH}"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
2.11.0


