Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id EDA3E65CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 13:52:08 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id g13so92665438ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 06:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QeJfeQ48ikdX5l4RIKoJXfGzErocfNc7S/chtRycWnI=;
	b=YuarTnT0dscDgKczI4yc4OmOO/6rwBo6wp80pnHAN6W4AbP62dFa4/96zxCwdgVl8f
	ecD6sLaYEPwYIIQPfBvUl+H4olf/Sir3UX0xmeQrRMkoUAWjPdrLQFxb2ZyIiQRraufr
	Q7qMRXoeOdIoekCqVhLxEOgIXECjuMLk1DlSA6EiOSklNVLOggtgGDO+bOxaFKngbZjW
	lV3CQ80yZB/gYuP4rNKZgWUppv4kyf0CrkMLXmJjmDv0ke4A+rBgnh1EHcJMbtskkfZq
	HH3gtRpDYss172EnxRYPoGq6U/OSyqt+QKSxsWqbssNcs5rP4g3jDpjYRfTDjlxXAop2
	s+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QeJfeQ48ikdX5l4RIKoJXfGzErocfNc7S/chtRycWnI=;
	b=gTVdEiFbxC1T5Ss0+4TqqVyKsQ7MyvzRH4FxFVBuUhIhVtkxA6jdNn+cpiYFUF/8Zb
	PE/zrEDvGPYh3GeK1Pd2BujI881iOEc9uuROdgIC+mLRFpaTfYoJ6kfPCTgubUgBqcHe
	lSteIzM96gTYYy1eE9Ff8rSWH9Zfvg2lkWUvfYgU/VQH2omUt9ItXbRM+oLLgge0r3ih
	59tJqOCkE68P82o1RMFaa8+DgQuuovF5EwXt2lF/gNFiJ5ez++m+rIC6Yh2P/ZnbYEDD
	uCs7pvuNCpW+XtjuYTfcGDrDUZPRiEm+M83D06Df2hbLUmHuwZGby6zgp/Et7OkfhqpT
	oamQ==
X-Gm-Message-State: ALyK8tInQWPdkBqkOznz+nMu9jIg0cKPOd+z4HblCA9Ti3VsaXhiPlXDA7xVQjCVHE687/6K2+p/klIAp42SKgpD
X-Received: by 10.107.138.201 with SMTP id c70mr5526601ioj.148.1466776329207; 
	Fri, 24 Jun 2016 06:52:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 24 Jun 2016 06:51:49 -0700 (PDT)
In-Reply-To: <CAMKF1soqpKFDgoeKcAjiqbptR4xDFQ+VYRSt9kT67Uy=Bj8v7g@mail.gmail.com>
References: <1466765671-22371-1-git-send-email-git@andred.net>
	<1466765671-22371-4-git-send-email-git@andred.net>
	<CAMKF1soqpKFDgoeKcAjiqbptR4xDFQ+VYRSt9kT67Uy=Bj8v7g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Jun 2016 14:51:49 +0100
Message-ID: <CAJTo0LbTunHyH_iss4dLTzcOwADNnVp2gdmGoMrWtgyt0Myx_w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] uclibc: really enable verbose compilation
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
X-List-Received-Date: Fri, 24 Jun 2016 13:52:09 -0000
Content-Type: multipart/alternative; boundary=001a113e8e6a1154400536067a79

--001a113e8e6a1154400536067a79
Content-Type: text/plain; charset=UTF-8

On 24 June 2016 at 14:46, Khem Raj <raj.khem@gmail.com> wrote:

> keep V=2
>

That's very concise Khem.  If V=2 doesn't produce verbose output but V=1 in
EXTRA_OEMAKE does, why keep the export V=2?

Ross

--001a113e8e6a1154400536067a79
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 June 2016 at 14:46, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":3ac" class=3D"a3s aXjCH m=
15582aa8d344420e">keep V=3D2<div class=3D"yj6qo ajU"><div id=3D":532" class=
=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br>That&#39;s=
 very concise Khem.=C2=A0 If V=3D2 doesn&#39;t produce verbose output but V=
=3D1 in EXTRA_OEMAKE does, why keep the export V=3D2?</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113e8e6a1154400536067a79--
