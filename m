Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKUok-0001ja-Sd
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 15:21:06 +0200
Received: by wera1 with SMTP id a1so4749220wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 06:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6WiMPPolDkQWqfHvgJh0mcOCOyxEWT9IFYTr9r4NjZU=;
	b=S5HkZR5DNseVvdaI7Qnz8ZpYdzzzwIxwqqV/0SAMvhiM4Tyed9pxjHOKUCyo19jzYI
	NOu82AFXufwXxAICuqs2eRiKO1gimw0O7hjR7z0c+4AQn/RHMH5t8SbrguJ87St4MA2d
	ivZ7JEgM+hPhB43JyffYWtmr6XuOKjFnn1+pfFft2ReoaCQV1arw0yL0+BK5J8jaqOeX
	ysoxufjlr+G7jA71HKI9Hf8af2I3m2Ry3OARG4D4aXvEXQqoFDCTMXOj6zsE/Q6hnni+
	0fYj3gOduV4SZYkXGkDAT5cAVRVWtYw1T4w44/iRVL3gGCiqSahXXJZfwv34FXoZ9QEJ
	3Big==
Received: by 10.180.94.161 with SMTP id dd1mr6184670wib.16.1334754699617;
	Wed, 18 Apr 2012 06:11:39 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w10sm55270451wiy.3.2012.04.18.06.11.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 06:11:38 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <484d14f90205202e85346dfc53fcc4a273b3087c.1334751924.git.dongxiao.xu@intel.com>
Date: Wed, 18 Apr 2012 15:11:36 +0200
Message-Id: <9F52A267-E108-405D-BD39-ADA0209B3620@dominion.thruhere.net>
References: <cover.1334751924.git.dongxiao.xu@intel.com>
	<484d14f90205202e85346dfc53fcc4a273b3087c.1334751924.git.dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlRlnlpYSQEzM/lqka/W6sdV5Ggfca0pAi0ckZaIzpMmXlWSzLQWrHjPyGatMJd2kPMbKiD
Subject: Re: [PATCH 1/1] packageinfo.bbclass: A workaround for RPM architecture renaming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 13:21:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 18 apr. 2012, om 14:48 heeft Dongxiao Xu het volgende geschreven:

> For beagleboard platform, the PACKAGE_ARCH for certain recipes is
> "armv7a-vfp-neon", however, the architecture label in RPM file name is
> "arm" due to a potential bug in RPM backend.

'arm' or 'armv7a'? Your commit message doesn't match the comment in the code.

regards,

Koen


