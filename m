Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA447733D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 02:15:33 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id j125so1812723oih.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mG6RL5ltSrY8TMVzalwjNZhawc0zfM1wpumIvH0AD/I=;
	b=1G43ymQGuT9DARt/YEz/zaUYNhPYctG7lPMkh/C+fw84coKAjgzBntgnpm5L6WC06x
	jEDfBtjPeqwDpoWTD1p3t1+Ed4MAcp8qzWZSDlW0p/5NCltHN45fn/LezjHH34Wc16Xm
	3oFy3ZR0gagODaqaK00kMtRMgrm6E8oL82H/xcYb/Cj5QMDtx9mPxrcqWiCD8fnlLxzu
	kf26Lo26lrqKsigTwU5TksuQ0rRuBfBJlfD7rrwc9OivieZczMNXpHj3WSiJQ6q90Z0t
	reR2vg+ONAW6dfro02UiXL2xL9XHB95f4ZNVlmF9jEoueD/Rfv+8p4D+D+hi+uOeFDzc
	asfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mG6RL5ltSrY8TMVzalwjNZhawc0zfM1wpumIvH0AD/I=;
	b=WGHz9Lux4QJr6jHN3Zjs4/co4jr8VZmvF3QECzm9tmQYlgsuuNCiRNxE/76C+UdA94
	2Wz8x3p0wov3Nh/TVu3gUZYoWaRj85A3neje911YgRpya5zoRUT6VRIpyoPm8KS1zGNu
	7c+c/YBvq3E7/C0uZ/icth7j4BEib/RHF5tti1aeg/dkNmbFVKJIAoLu2NGRU432/jhP
	hZZqqLIBK7Iyc+5uz98Nffzkfxdp+NheG70fMsVHFolkpAuqtocO1/cEdneoPuF505JG
	C+iliQ/YJnh0zzTqu65RnTbu1QF21bV7FS0T6MlWkudKlXG2nSdrBEx5oY8UclfAXEFg
	mfUQ==
X-Gm-Message-State: AG10YOShcY1jAzQ/oBMFTskqdzNPuwBNpLGEiXtnYDjBVyYctiBVQI6Zan5mEhg6gMcsdQ==
X-Received: by 10.202.92.69 with SMTP id q66mr31744507oib.41.1456366534355;
	Wed, 24 Feb 2016 18:15:34 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id to9sm112844oec.9.2016.02.24.18.15.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 18:15:33 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:15:21 -0800
Message-Id: <1456366525-7522-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] minor gstreamer recipe cleanups
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
X-List-Received-Date: Thu, 25 Feb 2016 02:15:35 -0000

Andre McCurdy (4):
  gstreamer1.0-libav_git: add --ranlib option to LIBAV_EXTRA_CONFIGURE_COMMON_ARG
  gstreamer1.0-libav: move LIBAV_EXTRA_CONFIGURE_COMMON_ARG into .inc
  gstreamer1.0.inc: add explicit PACKAGECONFIG init
  gstreamer1.0-plugins-XXX: move inherit gettext into common .inc file

 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc        | 7 +++++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb   | 6 ------
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb     | 5 -----
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 2 --
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 --
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc | 2 --
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc      | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc              | 2 ++
 9 files changed, 11 insertions(+), 19 deletions(-)

-- 
1.9.1


