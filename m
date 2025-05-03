Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8334DC369D9
	for <webhook@archiver.kernel.org>; Sat,  3 May 2025 13:05:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.10532.1746277507694440366
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 May 2025 06:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gKy677fB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AFBC43991;
	Sat,  3 May 2025 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746277505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kj3MVA4aRJZxh7lDwKxVjphnTruXSQwKrnpalneFIAg=;
	b=gKy677fBGtvJeu2QQD/RVE/XVVqg7cq1oT6PD0bONzczZJa08SqsAroGm3iMq0T4AkytOg
	YFs0o41n/9X+hdg3f1CZHLXAk/N9AMz/1yuZ8qwU7tbijqjVRqWex5ZV3QzKO9tDVPdldh
	BkO01Mz51Gvd0D7MKLXsV4mXgTeIrIbcobt/MVKb841p/ykOLGp1cFER6QuK6kFNc1Bv4n
	X24hVKhDblptLLlLkutsHbjmEl9RoVtIUvlpU3x19xMUB/C77r3nC2kcdNItaEdJM7Glyx
	+xkVClmXJSjoy1jTiyPBclvjpXWx2QTAXTdHbH6rA87JRu9qwzVer/GZYaEspA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 May 2025 15:05:02 +0200
Message-Id: <D9MJPLXHV9Z0.ON6PF6AL5IW@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeehgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudehgefgteegheegjeehhffhgeelkeehgfelfeeukeetvdekiedttdevgeefudeunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmeefieelugemheeifeefmeeklegtugemsgejtgeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemfeeilegumeehieeffeemkeeltggumegsjegtkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprhhssehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgesl
 hhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtoheprghlvgigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepohhtrghvihhosehoshhshihsthgvmhhsrdgtohhmrdgsrhdprhgtphhtthhopehkvgigihhnrdhhrghoseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepuggvthhhvghrihgughgvsehtihdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 May 2025 13:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215931

On Fri May 2, 2025 at 10:28 PM CEST, Randolph Sapp via lists.openembedded.o=
rg wrote:
> From: Randolph Sapp <rs@ti.com>
>
> We've recently run into some issues with weston-init attempting to start
> Weston prior to all drm devices being registered. There's not really a
> good, scriptable mechanism to listen in to device registration events
> that works with the existing weston-init package. Well, at least one
> that doesn't involve polling files or introducing more dependency on the
> init system being used.
>
> I also see there is also a lot of scripting around starting X11,
> xserver-nodm-init, that (from my limited review) should experience the
> same issue.
>
> I'd like to introduce the following display manager for oe-core, emptty
> [1]. This display manager is, as described upstream, a "Dead simple CLI
> Display Manager on TTY". It supports both x11 and wayland sessions, with
> togglable build parameters to completely remove x11 and pam
> dependencies. It's licensed MIT, which shouldn't be an issue for any
> users. (It is written in Go, if you have opinions about that.)
>
> With this, both weston-init and the xserver-nodm-init packages can be
> re-tuned to leverage this display manager and simply add a user and
> emptty config for an autologin session. This can resolve the current
> behavior across init systems without additional scripting, and move some
> development out of this layer.
>
> This lists myself as a maintainer of emptty as well as xserver-nodm-init =
and
> xuser-account since these are currently unassigned and I've reworked them
> significantly here.
>
> Sorry for the delay on this series. I found a few bugs in emptty that I w=
anted
> to address before submitting this officially.
>

Hi Randolph,

Thanks for your patches.

We got some warnings on the autobuilder, as no maintainer is assigned to
the emptty-conf recipe:

WARNING: emptty-conf-1.0-r0 do_recipe_qa: QA Issue: Recipe emptty-conf in /=
srv/pokybuild/yocto-worker/a-full/build/meta/recipes-graphics/emptty/emptty=
-conf.bb does not have an assigned maintainer. Please add an entry into met=
a/conf/distro/include/maintainers.inc. [missing-maintainer]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1515/ste=
ps/13/logs/stdio

Can you fix this on the next iteration please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


