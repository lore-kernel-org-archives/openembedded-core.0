Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id A68EA605BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 03:21:40 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id t8so43854307vke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 19:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BQt6YT8Y+2e8aAmVDSt6DYA+/Xa5q00rCEdYc7R2XRE=;
	b=tQYwT+bGsIn5g4S5X+d2BlmC0FLfp5t01U9x/BipklxYxp2DGwvSJk7Bw+oo4Ejaci
	BP0m5vDxlM5U9Nw72+sMWy2bweuR1ip7UjbUdI0JWUnnGWXIxGmYLEvK5vDKwgcuBlbR
	SuZjpwVyyyhcFTtblrBPsKBjWkCgfVGxv2agjI5NuIMkONW7hl8IAtsqDn/mHarUhsBm
	ow0i89LCn+K6pyNxEIBuO6hpZRm8yaKoENRr7agq/5KZfFYH9cwxotMplhUczXOnyGL8
	dCCWc1NhzuprxvHspZt6AOYTkmRtcR/9ZZsFJN9iJk5hKSHWATUmbYdehX+FBUKF+sKK
	qbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BQt6YT8Y+2e8aAmVDSt6DYA+/Xa5q00rCEdYc7R2XRE=;
	b=EyR4tyjjn35yRVvlIqAK62v08D0fWwwjrBVoZ0OnAKuTeAfhVPhqQdSvvEwAXBoo6k
	km+yaGJBNvkqoDq+ttXRXoncRHKFp1312bLqgXtOr2p3tR+sM371AbeRMZ6q2GKE35oe
	WZE2O1PcU6Pj6yQaziS5QjvjglpOHjSq71Wx8O9K7Zdprfe40iQ+VtNJPHgafj+3TwPZ
	B89idOlO5YK0kufuVEvWEICRAYv33PK35AO8FlQCosEwroBLNg9DLc/qsLhD0w1flmcw
	TsAF/rWXt0ZKR9hFQBYyosa10wa89Up8SCrmeqV5sZzPjnDyKSsFJdXk/7SP9HTK4n5m
	meTw==
X-Gm-Message-State: AIkVDXKGvjqV8JC8182/xvvvqyLMq/1uj3wR4I+dBPIvNitsAdO197vhoqk77+iSF52h02v4Y4dnrmYc/N0iRQ==
X-Received: by 10.31.80.197 with SMTP id e188mr6219560vkb.109.1484882500193;
	Thu, 19 Jan 2017 19:21:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.159.149 with HTTP; Thu, 19 Jan 2017 19:21:39 -0800 (PST)
In-Reply-To: <CAJTo0LZyLf=U99wpLC9ROCYVSm0rQwb3qX0E7J1MxGH+PqA6Kg@mail.gmail.com>
References: <alpine.LFD.2.20.1701191542230.6131@localhost.localdomain>
	<CAJTo0LZyLf=U99wpLC9ROCYVSm0rQwb3qX0E7J1MxGH+PqA6Kg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 19 Jan 2017 19:21:39 -0800
Message-ID: <CANx9H-DGGPJ3=cskxB6N6ZMiUKJ0OdpCXhr3rqXmjabGds-2pg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: still fighting to get an OE recipe for "libfilesys-smbclient-perl"
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
X-List-Received-Date: Fri, 20 Jan 2017 03:21:42 -0000
Content-Type: multipart/alternative; boundary=001a114e2948f513d305467e255b

--001a114e2948f513d305467e255b
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 19, 2017 at 3:45 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 19 January 2017 at 20:58, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
>
>>   beyond this, i'm not sure how to use an OE patch to adjust this
>> source the right way, given that dozens and dozens of other modules
>> cross-compiled just fine.
>>
>>   thoughts? i am in now way a perl expert so i really have no idea
>> where to go from here
>>
>
> Is this the module you asked about earlier that I had a quick look at?
> I'd say that basically it can't be cross-compiled easily - or with moderate
> effort - because of various pieces of crazy in the way it builds.
>
> My recommendation is to either find or become a Perl build system expert
> and entirely rewrite the build to use something modern and sane, instead of
> something archaic, hand-coded and crazy.
>
>
I have to agree with Ross here.

The original Perl module is in sorry shape. I would start with getting
somebody in the Perl world to rewrite it first (at least the build
mechanism). It has native code that is just not going to be easy to
cross-compile the way it is without serious effort and hacking. If it was
ANY kind of sane, modern, perl build system I would have it done already
and collected the bounty. The bounty is an order of magnitude too low for
the effort it would take me to get it to work (and that might still be an
underbid by a factor of 2 or more). You might be better off contracting
someone to meet the API in a new perl module. Perhaps the maintainer of
meta-cpan?

--Tim

Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a114e2948f513d305467e255b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jan 19, 2017 at 3:45 PM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D""=
>On 19 January 2017 at 20:58, Robert P. J. Day <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_-32526=
1872819574357:3f9" class=3D"m_-325261872819574357a3s m_-325261872819574357a=
XjCH m_-325261872819574357m159b886ddd73285c">=C2=A0 beyond this, i&#39;m no=
t sure how to use an OE patch to adjust this<br>
source the right way, given that dozens and dozens of other modules<br>
cross-compiled just fine.<br>
<br>
=C2=A0 thoughts? i am in now way a perl expert so i really have no idea<br>
where to go from here<br></div></blockquote><div><br></div></span><div>Is t=
his the module you asked about earlier that I had a quick look at?=C2=A0 I&=
#39;d say that basically it can&#39;t be cross-compiled easily - or with mo=
derate effort - because of various pieces of crazy in the way it builds.</d=
iv><div><br></div><div>My recommendation is to either find or become a Perl=
 build system expert and entirely rewrite the build to use something modern=
 and sane, instead of something archaic, hand-coded and crazy.</div><span c=
lass=3D"HOEnZb"><font color=3D"#888888"><div><br></div></font></span></div>=
</div></div></blockquote><div><br></div><div>I have to agree with Ross here=
.</div><div><br></div><div>The original Perl module is in sorry shape. I wo=
uld start with getting somebody in the Perl world to rewrite it first (at l=
east the build mechanism). It has native code that is just not going to be =
easy to cross-compile the way it is without serious effort and hacking. If =
it was ANY kind of sane, modern, perl build system I would have it done alr=
eady and collected the bounty. The bounty is an order of magnitude too low =
for the effort it would take me to get it to work (and that might still be =
an underbid by a factor of 2 or more). You might be better off contracting =
someone to meet the API in a new perl module. Perhaps the maintainer of met=
a-cpan?</div><div><br></div><div>--Tim</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><span class=3D"HOEnZb"><font color=3D"#888888"><div></div><div>R=
oss=C2=A0</div></font></span></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div>

--001a114e2948f513d305467e255b--
