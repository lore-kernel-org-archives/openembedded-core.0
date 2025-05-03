Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92305C3ABAA
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 13:16:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.10802.1746278197019968414
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 May 2025 06:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ozYvIDyI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C143042D83;
	Sat,  3 May 2025 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746278195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbIIK725TlFluRGt0rVvh0MGD+SEYGOOa/VnRlTitqI=;
	b=ozYvIDyI9wa+Jq1NX7jjgicP5OJ17cUipHh7rovJ9vn4Gj3HPy5CmmdQflzpkWHBjA9XjY
	fz1k6jWHoG3oH3CKoHiv3CZh9n6L6tpTIEs0z3X1g8TxkYifgbJ3K419iiyJNFsmux7tg2
	Kk0hcDp5aEE9l4UzNUd6hT3Mb4eBu7n/eNA3QM+fAETJv5a6O6PVZQaJ+Lg+nhN9Y6CrIz
	PvMQ7YQw3zoIFNmNTLRgC+IpOxhkaMHqhZHdPt5IV/GJvn975MH9h0452bRchZvayWO3FW
	+KaVfXkIPWlzX6lZJWuKoM3B4OBJcI8iUVbiCR80fx0rBZW2UvF0Tdu4zAucng==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 May 2025 15:16:32 +0200
Message-Id: <D9MJYEKOABDN.1PK6500RIL9MY@bootlin.com>
Subject: Re: [oe-core][PATCH 0/3] Display manager proposal for x11 and
 wayland
Cc: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
 <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
 <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250502202840.3148565-2-rs@ti.com>
In-Reply-To: <20250502202840.3148565-2-rs@ti.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeehgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeeghfektedtfeegjeffvdfhudetledvfeffhfetkeffleefjefgieffudetjeevnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemfeeilegumeehieeffeemkeeltggumegsjegtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmeefieelugemheeifeefmeeklegtugemsgejtgekpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehrshesthhirdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhor
 hhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehothgrvhhiohesohhsshihshhtvghmshdrtghomhdrsghrpdhrtghpthhtohepkhgvgihinhdrhhgrohesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopeguvghthhgvrhhiughgvgesthhirdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 May 2025 13:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215932

Sorry, but we probably have two more issues on the autobuilder related
to this series.

First, it looks like we have a dependency issue:

ERROR: Nothing PROVIDES 'libxcrypt' (but /srv/pokybuild/yocto-worker/musl-q=
emux86/build/meta/recipes-graphics/emptty/emptty_0.14.0.bb DEPENDS on or ot=
herwise requires it)
libxcrypt was skipped: PREFERRED_PROVIDER_virtual/crypt set to musl, not li=
bxcrypt
ERROR: Nothing RPROVIDES 'emptty' (but /srv/pokybuild/yocto-worker/musl-qem=
ux86/build/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb, /srv/=
pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-graphics/wayland/wes=
ton-init.bb, /srv/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-gr=
aphics/emptty/emptty_0.14.0.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'emptty'
NOTE: Runtime target 'emptty' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['emptty']
ERROR: Nothing RPROVIDES 'xserver-nodm-init-dev' (but /srv/pokybuild/yocto-=
worker/musl-qemux86/build/meta/recipes-graphics/x11-common/xserver-nodm-ini=
t_3.0.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'xserver-nodm-init-dev'
NOTE: Runtime target 'xserver-nodm-init-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xserver-nodm-init-dev']
ERROR: Nothing RPROVIDES 'xserver-nodm-init' (but /srv/pokybuild/yocto-work=
er/musl-qemux86/build/meta/recipes-graphics/x11-common/xserver-nodm-init_3.=
0.bb, /srv/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-graphics/=
packagegroups/packagegroup-core-x11.bb RDEPENDS on or otherwise requires it=
)
No eligible RPROVIDERs exist for 'xserver-nodm-init'
NOTE: Runtime target 'xserver-nodm-init' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xserver-nodm-init']
ERROR: Nothing RPROVIDES 'weston-init-dev' (but /srv/pokybuild/yocto-worker=
/musl-qemux86/build/meta/recipes-graphics/wayland/weston-init.bb RDEPENDS o=
n or otherwise requires it)
No eligible RPROVIDERs exist for 'weston-init-dev'
NOTE: Runtime target 'weston-init-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['weston-init-dev']
ERROR: Nothing RPROVIDES 'weston-init' (but /srv/pokybuild/yocto-worker/mus=
l-qemux86/build/meta/recipes-graphics/wayland/weston-init.bb, /srv/pokybuil=
d/yocto-worker/musl-qemux86/build/meta/recipes-graphics/packagegroups/packa=
gegroup-core-weston.bb, /srv/pokybuild/yocto-worker/musl-qemux86/build/meta=
/recipes-graphics/wayland/weston_14.0.1.bb RDEPENDS on or otherwise require=
s it)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1541
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1571
https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/1494
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/1565
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/259

Then we have a test error on some other builds:

RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.05s)
...
AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USER   =
    VSZ STAT COMMAND

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1491
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/1502
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1471
...

Can you have a look at these failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


