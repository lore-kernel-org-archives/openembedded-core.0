Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE02C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 08:18:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.7955.1747297135505610208
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 01:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FWz/fyRU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E2A0440CD;
	Thu, 15 May 2025 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747297133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4nEgYdlQZpOqQWPnKihr7Zyej6wD11At5Fnu92bzp/8=;
	b=FWz/fyRUJKUdFKATQpvuLs7MhpYYBL9meGxnt0bmcsASpuPj0gUMUo3w0GTyLsAj10jTO+
	HrrClrrGNkOe6fJYEMyEkasUMYK9VoFFdtpfTg17EXdQBNFL0cbdEqarXLRH6DhvZEJYYU
	JJsgZKQzv9O3ms009LiG8xOaEmNP5dsUiAiuzgP+lJ7n1CRkrAaGbOs4jQhNKnWVJ0belC
	Jrhiam3Ce0/6/PjV9hNAU5V0pnebH7/XA6RXhAEoQFnobU/IEvAZRFG+O4D2EXCGHA6XFP
	PyDSY5W8ZF3G2RFEiERt6gAIr5Sb6+vIfOwE9l7goOoAfUuAnykDJnuEQ5EEHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 May 2025 10:18:49 +0200
Message-Id: <D9WL4ZV1UWMN.1WDMBDWHEV4S8@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
 <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
 <denis@denix.org>, <reatmon@ti.com>
Subject: Re: [oe-core][PATCHv3 0/3] Display manager proposal for x11 and
 wayland
Cc: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250514220924.2644712-1-rs@ti.com>
In-Reply-To: <20250514220924.2644712-1-rs@ti.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvufevhffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleettefgfffhfedvvddvgefhleelgeffffevfeehueekvdevkeehkedtvdevkeejnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtdegmegtvggttdemfhdthegsmegtvdgsmeduvggvudemrgelfhekmeefiegrmeguheegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmehftdehsgemtgdvsgemudgvvgdumegrlehfkeemfeeirgemugehgeekpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehrshesthhirdgtohhmpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhor
 hhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehothgrvhhiohesohhsshihshhtvghmshdrtghomhdrsghrpdhrtghpthhtohepkhgvgihinhdrhhgrohesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopeguvghthhgvrhhiughgvgesthhirdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 08:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216570

On Thu May 15, 2025 at 12:09 AM CEST, rs wrote:
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

Thanks for the new version, but I believe we still have some issues:

AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USER   =
    VSZ STAT COMMAND

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1604
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1592
https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/1609
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1607
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/1593

AssertionError: 255 !=3D 0 : wayland-info error: failed to create display: =
No such file or directory

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/1621
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1534

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


