Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2C80878685
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 13:38:39 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id c17so19189606iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 05:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ic+jdeMBEnfsYTW4gY2cgqNm/qf9bqDqDVfpgzow1UI=;
	b=hLi3IOp8vKJk0F514SFfRCjcEleWG8QoUPe+2KcBpdcqHP1uHLxpVlm9TOqc/rIP/8
	/PsgGvtzIpoAg/EaqJwZt2D1d7Ywo7qKfHaRnQ9sjU0LlVYon9yyxgaLis1x/lx28Qkk
	54ZkOqdKO0DQ7oBJje7N/VeIdETTCNUBCWO6Uv7BnCg7G/zpvZgukhryWBxQEbUMvJvT
	B2W4Am+cgGkuFqqmfqX6RU399MbsWyzzvZYR1kLlWsK5Swh1EGlgwe+vKBW51i5LzK75
	RTvwWgTSjoAx5U8/FuLuKTgjKun96hctq8sapNzkv071hYguInjjHX8TTthmsA4tBdig
	3Q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ic+jdeMBEnfsYTW4gY2cgqNm/qf9bqDqDVfpgzow1UI=;
	b=EOgOiuFtChLFbA7mfj5LnN2ZsOlsYAkkOAewff9EDr8eN0f+3sSPI7SVuzvSMs5Bhp
	mPaNClk4qqXCrzAmRFfN+U2yY5XbzJSL4fUPKyThhIHvxbqByMf74pJQpZSYjDgRxwo2
	eBoh4728mQouqNZRoSlSMoXOPBS4jYbiBdejEh82SeMZ+rTaoU61Jzw4HVMtJkVt4POT
	GxcJIGtFO8ue2sR8cjmYMyMD2DPX9+MVgwhVka2tVKpPAlQo+HCGti2ycwmnK+GI+THB
	54Y9vGNqR9Vt/uhMDuNao6N/CP0hDjQMfATRgcZDWHsK2uTRdhyhEVpvuhCbDsc8Y7RB
	74jA==
X-Gm-Message-State: AKwxytcPOHLd9CuN+vzmJDTHL9Po+h/Hi6cRvxHp4SXZK4V8x8yT3ory
	5hspUxn3qA9RteCI2bQFiWQQgQf0IzoBS2FZAyH7ZQ==
X-Google-Smtp-Source: AH8x2246FvSGj1+77NGCsscjUZYlS8JS2BcmY10znf0ezfSFNXNj1Cm3dlcHSGKD1zcTOHdvitzO1M+QeitmIZMzZJI=
X-Received: by 10.107.175.8 with SMTP id y8mr38562847ioe.37.1517492321134;
	Thu, 01 Feb 2018 05:38:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Thu, 1 Feb 2018 05:38:20 -0800 (PST)
In-Reply-To: <90ac077a-5126-fb99-0512-9a12851be994@thecshore.com>
References: <90ac077a-5126-fb99-0512-9a12851be994@thecshore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Feb 2018 13:38:20 +0000
Message-ID: <CAJTo0LY2whxu8P8u4-U9s7pn6KJZLX53x4ZJ8xH+dN2c6gciyA@mail.gmail.com>
To: "Daniel F. Dickinson" <cshored@thecshore.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding a "tiny" DISTRO_FEATURE and having packages build smaller
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
X-List-Received-Date: Thu, 01 Feb 2018 13:38:40 -0000
Content-Type: multipart/alternative; boundary="001a1144a268c05598056426b65e"

--001a1144a268c05598056426b65e
Content-Type: text/plain; charset="UTF-8"

On 1 February 2018 at 12:55, Daniel F. Dickinson <cshored@thecshore.com>
wrote:

> I'm wondering if is doable and would be accepted to add a "tiny"
> DISTRO_FEATURE that automatically does PACKAGECONFIG += "tiny", and
> packages which honour this make choices that build smaller editions and/or
> create smaller binary sub-packages than default (i.e. things that can be
> split out of build packages are, so that a -core or -base package has only
> the minimum, and a one uses metapackages to install expected packaging (so
> ${PN} would by default RDEPEND on ${PN}-base and other sub-packages (or
> other recipes packages/sub-packages) that give the 'usual' use case for the
> package, but can be managed in parts for systems that are quite small.
>
> Or is the splitting into sub-parts preferred anyway and patches to make
> smaller splits would accepted relatively easily, but usually just don't get
> done because it's more work to have more sub-packages and so it just
> doesn't get done to the level a project like OpenWrt pieces things up, and
> OpenEmbedded usually has more space available than a typical OpenWrt device?
>
> I think PACKAGECONFIG[tiny] would really translate into different things
> in different packages (hence the idea of having a top-level flag that
> makes it easier to do across the board rather than having to specify
> specific flags for each recipe, except in exceptional circumstances),
> although something like nossl should perhaps be a separate top-level flag
> since even if you want small you probably want some kind of ssl, but there
> may be relevant use cases where nossl would be wanted but isn't just about
> size.  With -tiny one could perhaps emphasize the choice of smaller SSL
> libraries like mbedtls and wolfssl (cyassl) when they are an option and
> warn (or refuse to build) if a big library like openssl can't be avoided.
>

I feel that DISTRO_FEATURES=tiny is too coarse: you may want a tiny busybox
but a fully-featured wget, or whatever.

Also PACKAGECONFIG[tiny] doesn't really explain *what* it's doing, and may
end up doing many things at once.  Does a tiny systemd disable networkd?
What if you want as tiny as possible, but with networkd?

Fine grained PACKAGECONFIGs and/or subpackages as appropriate are
definitely the way forwards in my opinion.

Ross

--001a1144a268c05598056426b65e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 February 2018 at 12:55, Daniel F. Dickinson <span dir=
=3D"ltr">&lt;<a href=3D"mailto:cshored@thecshore.com" target=3D"_blank">csh=
ored@thecshore.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;m wondering if =
is doable and would be accepted to add a &quot;tiny&quot; DISTRO_FEATURE th=
at automatically does PACKAGECONFIG +=3D &quot;tiny&quot;, and<br>
packages which honour this make choices that build smaller editions and/or =
create smaller binary sub-packages than default (i.e. things that can be sp=
lit out of build packages are, so that a -core or -base package has only th=
e minimum, and a one uses metapackages to install expected packaging (so ${=
PN} would by default RDEPEND on ${PN}-base and other sub-packages (or other=
 recipes packages/sub-packages) that give the &#39;usual&#39; use case for =
the package, but can be managed in parts for systems that are quite small.<=
br>
<br>
Or is the splitting into sub-parts preferred anyway and patches to make sma=
ller splits would accepted relatively easily, but usually just don&#39;t ge=
t done because it&#39;s more work to have more sub-packages and so it just =
doesn&#39;t get done to the level a project like OpenWrt pieces things up, =
and OpenEmbedded usually has more space available than a typical OpenWrt de=
vice?<br>
<br>
I think PACKAGECONFIG[tiny] would really translate into different things in=
 different packages (hence the idea of having a top-level flag that<br>
makes it easier to do across the board rather than having to specify specif=
ic flags for each recipe, except in exceptional circumstances), although so=
mething like nossl should perhaps be a separate top-level flag since even i=
f you want small you probably want some kind of ssl, but there may be relev=
ant use cases where nossl would be wanted but isn&#39;t just about size.=C2=
=A0 With -tiny one could perhaps emphasize the choice of smaller SSL librar=
ies like mbedtls and wolfssl (cyassl) when they are an option and warn (or =
refuse to build) if a big library like openssl can&#39;t be avoided.<br></b=
lockquote><div><br></div><div>I feel that DISTRO_FEATURES=3Dtiny is too coa=
rse: you may want a tiny busybox but a fully-featured wget, or whatever.</d=
iv><div><br></div><div>Also PACKAGECONFIG[tiny] doesn&#39;t really explain =
*what* it&#39;s doing, and may end up doing many things at once.=C2=A0 Does=
 a tiny systemd disable networkd? What if you want as tiny as possible, but=
 with networkd?</div><div><br></div><div>Fine grained PACKAGECONFIGs and/or=
 subpackages as appropriate are definitely the way forwards in my opinion.<=
/div><div><br></div><div>Ross</div></div></div></div>

--001a1144a268c05598056426b65e--
