Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4184160043
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 18:48:17 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id n10so9623723obb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 11:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=FAKtudj2fP5wtiXnQ2wzijLGkWMOtTlltk9PYRyiLEA=;
	b=wx0y8NS22GhWTnUSagZ8fCjCxwpnaTC4hhC2pJCYUB42EOn8texvfJ16hECz3R5108
	MGiD7IVGmF2yiSxpJlLnXvFUTaO+OVQiRzrm5cy59vUwgmFd88lQnpJBlkJhdWiRFc4t
	tHfpZ5aUdIS1E9fnnXL+Z1QlWvBv1NohJLo7Kga8gRfYNjIr+qA/3T7jP8xGOHIauocz
	Hq1FDqiomJbrIXIlBC91rGUAGbpT88aNYcO8paRzrrVleErSpluVZgGfM71s+vtleRGS
	XtfqoNhlTeeIkoqfbtan1qitYDB86Mm3WYT4r/Pfaf2S6aQwioyGSNPVTamYM1svPF7k
	6V+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=FAKtudj2fP5wtiXnQ2wzijLGkWMOtTlltk9PYRyiLEA=;
	b=RXNDHc2QfCMX15g6zYOHdxOdwnq/ggdjDHri6li3xOkOOlIAUZkLEMBkAS7NbyFRuC
	whW2EG9xfSVOQ4nGq1cAC1P26qkdbmX9xZMWW5A6WQxJFSQPrLZ8U3gyMDdxbsuZgKuM
	iRRYWIbIz371EZDlOwCLy/Br4cUcUBKCvRRryOg2E3sf1+2BXjhJ96myhg77RPFICDJr
	Stz3/7Z90Aa9+dn+fXC2jUhCpoMh2OrKBXTSnH1EeelbVh0vJsotPLzoGb4O3iPRO/d4
	WsB1jT6SI+4RVq+c0LJUVgQfVzkkaaWf7Z79qmq6aH2C9hMRRNjwTMnvPGGa+H4C5/X6
	pyuQ==
X-Gm-Message-State: AOPr4FVpL9lY6yt6/cTI1GyNjircDozoWpRVj9G4stCEO3tZU85lrorgSikyagvD07X5F9m5IHHLngAV8qnyQw==
MIME-Version: 1.0
X-Received: by 10.182.190.43 with SMTP id gn11mr2287226obc.15.1462301298191;
	Tue, 03 May 2016 11:48:18 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Tue, 3 May 2016 11:48:18 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1605031421460.12750@localhost.localdomain>
References: <alpine.LFD.2.20.1605031245360.6672@localhost.localdomain>
	<CADkTA4PPYfetBymZ1mii_sc7f71za-V0dBbcgApHyhDHwxKyVw@mail.gmail.com>
	<alpine.LFD.2.20.1605031421460.12750@localhost.localdomain>
Date: Tue, 3 May 2016 14:48:18 -0400
Message-ID: <CADkTA4Ocu2L9GoBM4YadkGZJq+2Pd8UFA2acSeX4MSibEo-ZtA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: clarifying details about "is not set" lines in kernel config fragment files
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
X-List-Received-Date: Tue, 03 May 2016 18:48:18 -0000
Content-Type: multipart/alternative; boundary=f46d0418273a6ef64f0531f48d28

--f46d0418273a6ef64f0531f48d28
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 2:27 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Tue, 3 May 2016, Bruce Ashfield wrote:
>
> > On Tue, May 3, 2016 at 1:04 PM, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
> >
> >         oddly, in the current YP kernel dev manual, i don't see the
> >       phrase "is not set" explained anywhere in the entire doc,
> >       which is weird since it seems like it would be important.
> >
> > The manuals don't cover the mechanics of how the mainline kernel is
> > configured. Just the same way the don't cover the configuration
> > language for any number of packages in the system.
>
>   assuming i'm understanding your position, that's where i'm going to
> *strongly* disagree. people who work with the mainline kernel in a
> non-OE environment don't use kernel config fragment files. period.
> AFAIK (and correct me if i'm wrong), .cfg kernel config fragment files
> are exclusively an OE/YP thing, so there is no reason for normal
> kernel developers to understand how they work.
>

Nothing about the options is unique configuration fragments.

We contributed the merge_config script to the mainline kernel ages ago, so
the
rudimentary support for fragments is carried along with all recent kernel
trees. At the most basic level, it is a concatenation of a bunch of
configs, the
extra processing around features, the audit, etc, are part of what we do in
Yocto,
but the slamming together of the options and feeding them to the kernel
configuration system .. is not unique.

kernel developers have their workflow, and they stick to it. There's no
attempt
to change that .. the reason I mention that, is that people working with
the
mainline kernel can use fragments if they like .. but also can happily
ignore
them as well :D


>
>   knowing how regular kernel configuration works, and how kernel
> config fragment files are processed to aid in that process, are two
> *entirely* different things, and how those files are processed is,
> IMHO, most assuredly the responsibility of the OE/YP docs to explain.
>

You referenced # is not set ... that has nothing to do with fragments, and
works
the same way if you are manually editing a .config and then re-running make
"old config".

Bruce


>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f46d0418273a6ef64f0531f48d28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 3, 2016 at 2:27 PM, Robert P. J. Day <span dir=3D"ltr">&lt;=
<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcour=
se.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Tue, 3 May 2016, Bruce Ashfield wrote:<br>
<br>
&gt; On Tue, May 3, 2016 at 1:04 PM, Robert P. J. Day &lt;<a href=3D"mailto=
:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 oddly, in the current YP kernel dev m=
anual, i don&#39;t see the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phrase &quot;is not set&quot; explained anyw=
here in the entire doc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0which is weird since it seems like it would =
be important.<br>
&gt;<br>
&gt; The manuals don&#39;t cover the mechanics of how the mainline kernel i=
s<br>
&gt; configured. Just the same way the don&#39;t cover the configuration<br=
>
&gt; language for any number of packages in the system.<br>
<br>
</span>=C2=A0 assuming i&#39;m understanding your position, that&#39;s wher=
e i&#39;m going to<br>
*strongly* disagree. people who work with the mainline kernel in a<br>
non-OE environment don&#39;t use kernel config fragment files. period.<br>
AFAIK (and correct me if i&#39;m wrong), .cfg kernel config fragment files<=
br>
are exclusively an OE/YP thing, so there is no reason for normal<br>
kernel developers to understand how they work.<br></blockquote><div><br></d=
iv><div>Nothing about the options is unique configuration fragments.=C2=A0<=
/div><div><br></div><div>We contributed the merge_config script to the main=
line kernel ages ago, so the</div><div>rudimentary support for fragments is=
 carried along with all recent kernel</div><div>trees. At the most basic le=
vel, it is a concatenation of a bunch of configs, the</div><div>extra proce=
ssing around features, the audit, etc, are part of what we do in Yocto,</di=
v><div>but the slamming together of the options and feeding them to the ker=
nel</div><div>configuration system .. is not unique.=C2=A0</div><div><br></=
div><div>kernel developers have their workflow, and they stick to it. There=
&#39;s no attempt</div><div>to change that .. the reason I mention that, is=
 that people working with the=C2=A0</div><div>mainline kernel can use fragm=
ents if they like .. but also can happily ignore</div><div>them as well :D<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 knowing how regular kernel configuration works, and how kernel<br>
config fragment files are processed to aid in that process, are two<br>
*entirely* different things, and how those files are processed is,<br>
IMHO, most assuredly the responsibility of the OE/YP docs to explain.<br></=
blockquote><div><br></div><div>You referenced # is not set ... that has not=
hing to do with fragments, and works</div><div>the same way if you are manu=
ally editing a .config and then re-running make &quot;old config&quot;.</di=
v><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--f46d0418273a6ef64f0531f48d28--
