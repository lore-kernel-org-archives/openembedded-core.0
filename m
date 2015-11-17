Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 367066057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 21:40:50 +0000 (UTC)
Received: by igvi2 with SMTP id i2so106217770igv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 13:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dmQ5FJpmdLhnlfbokyIGf/pAbaeFs4/ZuiYo95igg5c=;
	b=r2tbjFsUsDLSDie1u9tXpZIUKT/PapZAWde7oRc7ftOyqF+FNlMygXFydr6zJ8aNRf
	0KTXRayO7OAxodWr4ODaozz3G4O+QOGTNTFt0weNyEuoC/5uXpAFn7yW94rtRdAXfkCc
	VcYPEhOQi7HR0AfaQQ0oWyj6DBp7rla9jyiLAN8PJ2+MJ2cxO42Hc1b35tHlKo1xH38J
	VSsKKIvzLM8kol5VuRqGtNFq3nIhJbikFfM7v96Q3zCzZrz7my6pBfCT8m4RsDxQWfgM
	KjxJrXcZpdz6xd5M9ZOmnsleWBZtY/0m6w4wBiWcZRQlLAtHmUNMoRqVxwBqWNriwBaD
	PiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dmQ5FJpmdLhnlfbokyIGf/pAbaeFs4/ZuiYo95igg5c=;
	b=c8yRpLq4kajFI6sZFFDggqte60XQINcKqF2977ReQQAH+JXZh0LsDvWQdScZA2v58w
	AGq6zRptewc/14vBPe7zmf7GGz6RmB8kl1r64cVQgSK1SsFtT3ta1XhUKryb7cmJ1wok
	b1ID3oP5+3+SVasBqJVPbwLDgsGxNoRLQp78AhWiPySYbLXVgbMRr1MIERXSCfqkmsk4
	jzT3k5FoW3k8/trfN0PiyG5w/q/VuaB3+cBvVAZEZWxRPkHwIPAzuxL+rznEjulCBOu6
	X0fW2U1nt38nxqeFhB5VnC/jIvgazR8G2KXvzisjQ7AntynsTh/318o9310e7oqJm1De
	lcSw==
X-Gm-Message-State: ALoCoQnnmKKKnXzQG2xFfbOXRGkE2TB1QbAdQiQ7soncCbhjgS/rAYpGKlcDsijRYnAgm5wTiRdh
X-Received: by 10.50.155.33 with SMTP id vt1mr4064106igb.64.1447796451026;
	Tue, 17 Nov 2015 13:40:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 17 Nov 2015 13:40:31 -0800 (PST)
In-Reply-To: <00917aad2947602c12356694a6ca3a0c9b8d8756.1447256967.git.cristian.iorga@intel.com>
References: <cover.1447256967.git.cristian.iorga@intel.com>
	<00917aad2947602c12356694a6ca3a0c9b8d8756.1447256967.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Nov 2015 21:40:31 +0000
Message-ID: <CAJTo0LYv=+9ris7M7krGUvcu582MGQtH4fVKoT5_uibxZU2A5g@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bluez5: upgrade to 5.36
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
X-List-Received-Date: Tue, 17 Nov 2015 21:40:51 -0000
Content-Type: multipart/alternative; boundary=001a11343daa2bf4740524c361b5

--001a11343daa2bf4740524c361b5
Content-Type: text/plain; charset=UTF-8

On 11 November 2015 at 15:51, Cristian Iorga <cristian.iorga@intel.com>
wrote:

>  meta/recipes-connectivity/bluez5/{bluez5_5.33.bb => bluez5_5.36.bb} | 4
> ++--
>

This is reliably segfaulting on startup under both sysvinit and systemd on
the autobuilder, sorry.

Ross

--001a11343daa2bf4740524c361b5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2015 at 15:51, Cristian Iorga <span dir=3D"ltr">&lt;<a href=
=3D"mailto:cristian.iorga@intel.com" target=3D"_blank">cristian.iorga@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7n=
o" class=3D"a3s" style=3D"overflow:hidden">=C2=A0meta/recipes-connectivity/=
<span class=3D"il">bluez5</span>/{<a href=3D"http://bluez5_5.33.bb" rel=3D"=
noreferrer" target=3D"_blank">bluez5_5.33.bb</a> =3D&gt; <a href=3D"http://=
bluez5_5.36.bb" rel=3D"noreferrer" target=3D"_blank">bluez5_5.36.bb</a>} | =
4 ++--<br></div></blockquote></div><br>This is reliably segfaulting on star=
tup under both sysvinit and systemd on the autobuilder, sorry.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11343daa2bf4740524c361b5--
