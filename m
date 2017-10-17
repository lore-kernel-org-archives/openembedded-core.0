Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 64688782FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:33:06 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id n137so2932464iod.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NuCXtdLbFzOv23ncf2DAsHeatuhoOj137xDDCu7jmlo=;
	b=sK1FRqopla1SVUG2+kt7aK9liZNxytx4wJeQyALQK1bj//NOWeA8xBjFD9aDltPoRK
	xOlgnjsVxSnvWrlu/A3yoh+FPZw3+QGPLljgjZAqqf2DRoFGg3d96D4kNV7UcprZq8Jc
	2sixsEx7WJUloUex/9gec0OJpnpQ+LXyxWhR5xoHJwxCeB+f69DffXkdsseOVymbOGNk
	959G5GJZzHSYLEEWp27y3vKBIPlgAJfTkUAElOgJl8jpqENKpJ2IUvfZa33NnIX5Vvbq
	Cg8gxwLwH2kWrJk9uTHHerjP/qREtBqFFL7yWMDi6SYPDauBoYbifwPvEpkfO038YzAE
	thuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NuCXtdLbFzOv23ncf2DAsHeatuhoOj137xDDCu7jmlo=;
	b=iv4iPbEOrvSFcSalBU9VWnrwZeKxrlrPEg5T1MdaAgp2MRJAgZHu+dNCsgCcP5eBit
	SkMF/tlcKkj1HhI1/22yo2oC/AADtZYMG8HqzlThO+0THO9uR70cSpff5h//om+VBn0l
	wqBDsnxxj8hUy6N2E3qaGYJzxVyCbW+DIMGSFWHBOjDd7Izpjdt/EQViF9oV0GmHouRO
	2dtP6ettu1AEwfLLCGJPX+yyUXdozQegq1MJ/Y8vTRMdygPtBsgzxFW37gC9CdZTjGaa
	mw239F0WZm6RPHRI9SRvRNxXeSlHtJM/CJfjy08Mkzr/7PJ6F0aKqjZ41H0qmdes97wO
	G0Kg==
X-Gm-Message-State: AMCzsaWbL5J6+kYvHykjeq/Du2ar08ta4toq4gMIdKvXOtkmMqbrLq1g
	R4RfvVRWuwi1CALLv0YqzhLCYPPcbU9mqLMjOvk04Q==
X-Google-Smtp-Source: AOwi7QCMxhi4gVDrVyZkwqn8hi7ahuSaGEz6ejTkEnlU3td1Sf7HzJhxs/airqaqUgEzMA8qPAfIZR67S7+tigrJwjs=
X-Received: by 10.107.36.80 with SMTP id k77mr16344182iok.176.1508257987671;
	Tue, 17 Oct 2017 09:33:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 17 Oct 2017 09:32:47 -0700 (PDT)
In-Reply-To: <CAMKF1soaVRfyvgYcZy2TSfjgOT+Er4eB0kCKtWd0_wqbZwH17w@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-4-raj.khem@gmail.com>
	<CAJTo0LZC2At7Jnni1eLBTXyAdWsNVf-ynAVX8thc1EOujnsRuA@mail.gmail.com>
	<CAMKF1sov3p8viw9h1SjNF9Hyz0X5LuMqbJ4JnyFw-7HHxnKTLA@mail.gmail.com>
	<CAJTo0Lb81WDPU5mFKi+5SJkuqXDgxFEwnD2LLCMk+T24_M7nWg@mail.gmail.com>
	<CAMKF1soaVRfyvgYcZy2TSfjgOT+Er4eB0kCKtWd0_wqbZwH17w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 17:32:47 +0100
Message-ID: <CAJTo0La7zp9_dPd86X87QVuq7cS0SVZz05E==ryzJTXdPWfd=Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] libevdev: Add dependency on libcheck
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
X-List-Received-Date: Tue, 17 Oct 2017 16:33:06 -0000
Content-Type: multipart/alternative; boundary="001a1141909e95ce6d055bc0ad6b"

--001a1141909e95ce6d055bc0ad6b
Content-Type: text/plain; charset="UTF-8"

On 17 October 2017 at 17:29, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Oct 17, 2017 at 9:25 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 17 October 2017 at 17:24, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Tue, Oct 17, 2017 at 5:41 AM, Burton, Ross <ross.burton@intel.com>
> >> wrote:
> >> > Curious how you hit this with master.  For me:
> >> >
> >> > checking for check >= 0.9.9... no
> >> > configure: WARNING: check not found - skipping building unit tests
> >> >
> >> > The configure script uses pkg-config so shouldn't be picking up host
> >> > binaries.  Can you dig a little?
> >>
> >> do you have ptests on
> >
> >
> > Yes but libevdev doesn't have any.
>
> and I am using new pkgconf
>

Ah, let's see if that breaks it.  Do you have libcheck installed on your
host?

Ross

--001a1141909e95ce6d055bc0ad6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 October 2017 at 17:29, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Oct 17, 2017 =
at 9:25 AM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.=
burton@intel.com</a>&gt; wrote:<br>
&gt; On 17 October 2017 at 17:24, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Oct 17, 2017 at 5:41 AM, Burton, Ross &lt;<a href=3D"mailt=
o:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; Curious how you hit this with master.=C2=A0 For me:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; checking for check &gt;=3D 0.9.9... no<br>
&gt;&gt; &gt; configure: WARNING: check not found - skipping building unit =
tests<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The configure script uses pkg-config so shouldn&#39;t be pick=
ing up host<br>
&gt;&gt; &gt; binaries.=C2=A0 Can you dig a little?<br>
&gt;&gt;<br>
&gt;&gt; do you have ptests on<br>
&gt;<br>
&gt;<br>
&gt; Yes but libevdev doesn&#39;t have any.<br>
<br>
</span>and I am using new pkgconf<br></blockquote><div><br></div><div>Ah, l=
et&#39;s see if that breaks it.=C2=A0 Do you have libcheck installed on you=
r host?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1141909e95ce6d055bc0ad6b--
