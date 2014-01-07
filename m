Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC296C733
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 21:26:41 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id k19so11331923igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2014 13:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vsyytrX/PFLRUpwOmICWjWPv06znM2iniTzsDXJckdQ=;
	b=a0DIfnIyzRc5YJ/kOq/pOsgN2il+rJ2+oYsCFzk+ZrTBxh5VpB186J3CLGhcWRUprT
	ZOJ+40eju+Cm7banUvS39pAFKLEPoaEOoz/fnBclWV8LZe06izwdvYFftPBm6pfnrshR
	GlHxcDAMbmYc0UbE6XlcmJSHXt6VSXAJa/iO2Osz+PCfS7nR1g8rcRkXMR1G9ys2fy0k
	h+/E24Whx7CayGVa7vhBRWxK9GA+osGAa9jamkB240dY06AycZmew81Aj9jd/cqs4MYE
	i3F+5SfwCXSkILn2XiBfZacI4mEeYe5rxnEyg6DaaeSUXpcZgjRxKiMFHCVCHXCmsRR9
	qi3g==
X-Gm-Message-State: ALoCoQkiFeBfcQ6Lbe1Y9EF+O7miPMti+rI55PCBoNQOOOx8v574CVaQ8u9CKqmifEwWcO5/89zC
X-Received: by 10.50.61.137 with SMTP id p9mr28423508igr.45.1389130001688;
	Tue, 07 Jan 2014 13:26:41 -0800 (PST)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id kb10sm5349802igb.6.2014.01.07.13.26.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jan 2014 13:26:40 -0800 (PST)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2014 16:26:22 -0500
Message-Id: <1389129983-11212-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.8.5.2.227.g53f3478
Cc: patches@linaro.org
Subject: [PATCH] libxfont: upgrade to 1.4.7
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
X-List-Received-Date: Tue, 07 Jan 2014 21:26:41 -0000

A security advisory, CVE-2013-6462, has been issued for libXfont so bump to
version 1.4.7 which fixes this issue.

    http://lists.x.org/archives/xorg/2014-January/056265.html
    "Stack buffer overflow in parsing of BDF font files in libXfont"

Trevor Woerner (1):
  libxfont: upgrade to 1.4.7

 .../xorg-lib/{libxfont_1.4.6.bb => libxfont_1.4.7.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.6.bb => libxfont_1.4.7.bb} (77%)

-- 
1.8.5.2.227.g53f3478


