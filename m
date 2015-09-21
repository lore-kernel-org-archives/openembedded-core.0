Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B91C060053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 14:29:08 +0000 (UTC)
Received: by ioii196 with SMTP id i196so121770964ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=Nnu+FjM+FnpK8LphIaV9m1WGnI4OnWKaiM+JZmFG6mo=;
	b=ONi7NZZyVlk3U73lijvxoeOwla7JuRulZjiA2G/vVkQZV0Wu6lyvuMjzB2cdArRxAG
	zxSWE28Tzk+GmHTfAqQw/NBE7gCfx3tzmiia6Cf8F8S6DkeQvIDibgKHMDSjCbT/dMSZ
	K+qR8CLsdcoj33xPal+DuDpKjxzpxxvw+7itNx+yWNKC6RcPAq5/7NoyCsynrjQ+92BJ
	EdHayMMn26wtUiH3Ysc5cZJQGVh7+VdiQxrB3SZ7FmLrBU8bgfFplrSjMo5VesSWzbFx
	AN+uejfRCq+Xk5AbI3NIF4dKYVRGU/HPTKf17dFBTfhCdi8U2GMci69gRAifqnYrp1WG
	N11g==
X-Received: by 10.107.27.8 with SMTP id b8mr25224472iob.114.1442845747981;
	Mon, 21 Sep 2015 07:29:07 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	gy4sm5614937igb.6.2015.09.21.07.29.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 07:29:07 -0700 (PDT)
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56001431.6030001@gmail.com>
Date: Mon, 21 Sep 2015 10:29:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
Subject: packageconfig for non-autotooled project
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
X-List-Received-Date: Mon, 21 Sep 2015 14:29:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

libepoxy needs its EGL support to have a packageconfig (*.pc) file but
the EGL I want to use in my project
(meta-sunxi/recipes-graphics/libgles/sunxi-mali_git.bb, which points to
gitsm://github.com/linux-sunxi/sunxi-mali.git) isn't autotooled. There
are a couple ways around this problem, but if there is an example of
generating a .pc file for a non-autotooled project already, I'd be
grateful if someone could point me to it :-)

Best regards,
    Trevor

