Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5F83B77155
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:12:59 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id h201so270547qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9rtSpOkOOcFrdBJHwwujm8qFhMG2TlQFdnTLeu0Tf6c=;
	b=K7Yn0UWxRv8Y+imHOQCOC/gH6rBXohsfChDaNBG+w9nW8RSRGrstvY2jtcZU+Q/yGR
	p5mLjPNI8LlTiKxOkwsdPuaznKntIEomWVmG7u2uvgfyyvgR+wejjLub4QfGLeYZsEng
	g6JHpwICNe1gF0h0cMCOLZ/KaYlbDyQcEHRPJtCNJ4yhk2u46ODrgQJq6+z5PULc/emv
	cKRux4qctlzqRYTqOmur7ieuiVeN2oVnoM9MzwShSizUNt66pIi/AZdk67WVR8MwQe6b
	pkBh6Kygb4tp4ngQ0B8JZHZh5abzgzpqXim75K0JFi8F5wTUQUsO5OGxrGEAan6MZqJv
	LX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9rtSpOkOOcFrdBJHwwujm8qFhMG2TlQFdnTLeu0Tf6c=;
	b=l8DJFq0xsXTuKGyE2FOqrs1+AAg7/r1jBKQdkgtTzs5JqRxN3D+dI52GqMJH2nOo8u
	oQAgcZIBSOI7f/2muFzhPRGprpGWW0qytZidNYxfp4GlPdTiDB2+QyzuYeBY1oR1lzwo
	Fdv50QZjXrRnwcxl4HEkCadzwObvZox7Z9TRBX+w8f6LtmzKz1/u4aPncUjyzLruzHFr
	4KFA1Z+aIU4IAi32iWlRHgcmYj+gf0/fDOqhSU3t0eiqky6M/5gQ9i66Aj9rR79kgE3D
	ZqUhRNfj61mw70tSTFtfBbaP1ZOAJ0sx/vjivd7azVa5bChXRSqyI/ZF7eHaVSDKDMbz
	9o4Q==
X-Gm-Message-State: AIkVDXJMYKvZsGv4W2yF7AEodWD+RkVWKSYeaUALsa8V9Vc7tgK6M+HdBLxU318N/XTpSRCECI/tPKaz40rxLA==
X-Received: by 10.55.145.132 with SMTP id t126mr561107qkd.211.1482156781240;
	Mon, 19 Dec 2016 06:13:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Mon, 19 Dec 2016 06:13:00 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1612190624290.28360@localhost.localdomain>
References: <alpine.LFD.2.20.1612190624290.28360@localhost.localdomain>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Dec 2016 09:13:00 -0500
Message-ID: <CADkTA4MbQ+e8K07UeksjdjJmUO3GDTTX_8_Oy5k12_4wqZk0oA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: minimal contents of a kernel config fragment
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
X-List-Received-Date: Mon, 19 Dec 2016 14:13:00 -0000
Content-Type: multipart/alternative; boundary=94eb2c083d847289e305440384b6

--94eb2c083d847289e305440384b6
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 6:31 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   (ok, let's see if i can avoid embarrassing myself with an overly
> simple question ...)
>
>   reading YP kernel-dev manual, and there is an example of a kernel
> config fragment:
>
>   CONFIG_SERIAL_8250=y
>   CONFIG_SERIAL_8250_CONSOLE=y
>   CONFIG_SERIAL_8250_PCI=y
>   CONFIG_SERIAL_8250_NR_UARTS=4
>   CONFIG_SERIAL_8250_RUNTIME_UARTS=4
>   CONFIG_SERIAL_CORE=y
>   CONFIG_SERIAL_CORE_CONSOLE=y
>
> all well and good, but is it clear that one can cut that down based on
> the defaults in the Kconfig file? since the Kconfig file contains:
>
>   config SERIAL_8250_NR_UARTS
>         int "Maximum number of 8250/16550 serial ports"
>         depends on SERIAL_8250
>         default "4"
>         help
>           Set this to the number of serial ports you want the driver
>           to support.  This includes any ports discovered via ACPI or
>           PCI enumeration and any ports that may be added at run-time
>           via hot-plug, or any ISA multi-port serial cards.
>
>   config SERIAL_8250_RUNTIME_UARTS
>         int "Number of 8250/16550 serial ports to register at runtime"
>         depends on SERIAL_8250
>         range 0 SERIAL_8250_NR_UARTS
>         default "4"
>         help
>           Set this to the maximum number of serial ports you want
>           the kernel to register at boot time.  This can be overridden
>           with the module parameter "nr_uarts", or boot-time parameter
>           8250.nr_uarts
>
> is it accurate to say that the two fragment lines related to UARTs
> could be omitted? (yes, it's more informative to have them there, but
> technically, they're not required, correct?)
>


correct. In the end, it comes down to how much future proofing, readability
and segmentation you want in fragments. Some folks like to put everything
into a fragments .. others trust the kernel to not change a default and mess
with their functionality :)


>
>   similarly, another line could be omitted given the Kconfig lines:
>
>   config SERIAL_8250
>         tristate "8250/16550 and compatible serial support"
>         select SERIAL_CORE
>
> however, given the following in the same Kconfig file:
>
>   config SERIAL_8250_DEPRECATED_OPTIONS
>         bool "Support 8250_core.* kernel options (DEPRECATED)"
>         depends on SERIAL_8250
>         default y
>
> if you didn't want deprecated options, you *would* have to explicitly
> deselect that option with:
>
>   # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>
> yes?
>

Correct. As long as some other Kconfig doesn't "select <foo>", you can
turn the default off this way. There is another subtlety that if a Kconfig
option
doesn't have help text, you also can't change it from a default .. but
that's
not my fault, that's the fun of the kernel configuration subsystem :D

Bruce


>
>   just making sure i'm not overlooking any subtleties.
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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c083d847289e305440384b6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Dec 19, 2016 at 6:31 AM, Robert P. J. Day <span dir=3D"ltr">&lt=
;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcou=
rse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br>
=C2=A0 (ok, let&#39;s see if i can avoid embarrassing myself with an overly=
<br>
simple question ...)<br>
<br>
=C2=A0 reading YP kernel-dev manual, and there is an example of a kernel<br=
>
config fragment:<br>
<br>
=C2=A0 CONFIG_SERIAL_8250=3Dy<br>
=C2=A0 CONFIG_SERIAL_8250_CONSOLE=3Dy<br>
=C2=A0 CONFIG_SERIAL_8250_PCI=3Dy<br>
=C2=A0 CONFIG_SERIAL_8250_NR_UARTS=3D4<br>
=C2=A0 CONFIG_SERIAL_8250_RUNTIME_<wbr>UARTS=3D4<br>
=C2=A0 CONFIG_SERIAL_CORE=3Dy<br>
=C2=A0 CONFIG_SERIAL_CORE_CONSOLE=3Dy<br>
<br>
all well and good, but is it clear that one can cut that down based on<br>
the defaults in the Kconfig file? since the Kconfig file contains:<br>
<br>
=C2=A0 config SERIAL_8250_NR_UARTS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int &quot;Maximum number of 8250/16550 serial p=
orts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_8250<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default &quot;4&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Set this to the number of serial ports y=
ou want the driver<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to support.=C2=A0 This includes any port=
s discovered via ACPI or<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCI enumeration and any ports that may b=
e added at run-time<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 via hot-plug, or any ISA multi-port seri=
al cards.<br>
<br>
=C2=A0 config SERIAL_8250_RUNTIME_UARTS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int &quot;Number of 8250/16550 serial ports to =
register at runtime&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_8250<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 range 0 SERIAL_8250_NR_UARTS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default &quot;4&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Set this to the maximum number of serial=
 ports you want<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the kernel to register at boot time.=C2=
=A0 This can be overridden<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with the module parameter &quot;nr_uarts=
&quot;, or boot-time parameter<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8250.nr_uarts<br>
<br>
is it accurate to say that the two fragment lines related to UARTs<br>
could be omitted? (yes, it&#39;s more informative to have them there, but<b=
r>
technically, they&#39;re not required, correct?)<br></blockquote><div><br><=
br></div><div>correct. In the end, it comes down to how much future proofin=
g, readability<br></div><div>and segmentation you want in fragments. Some f=
olks like to put everything<br></div><div>into a fragments .. others trust =
the kernel to not change a default and mess<br></div><div>with their functi=
onality :)<br> </div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
=C2=A0 similarly, another line could be omitted given the Kconfig lines:<br=
>
<br>
=C2=A0 config SERIAL_8250<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;8250/16550 and compatible serial=
 support&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select SERIAL_CORE<br>
<br>
however, given the following in the same Kconfig file:<br>
<br>
=C2=A0 config SERIAL_8250_DEPRECATED_OPTIONS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Support 8250_core.* kernel options (=
DEPRECATED)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on SERIAL_8250<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default y<br>
<br>
if you didn&#39;t want deprecated options, you *would* have to explicitly<b=
r>
deselect that option with:<br>
<br>
=C2=A0 # CONFIG_SERIAL_8250_DEPRECATED_<wbr>OPTIONS is not set<br>
<br>
yes?<br></blockquote><div><br></div><div>Correct. As long as some other Kco=
nfig doesn&#39;t &quot;select &lt;foo&gt;&quot;, you can<br></div><div>turn=
 the default off this way. There is another subtlety that if a Kconfig opti=
on<br></div><div>doesn&#39;t have help text, you also can&#39;t change it f=
rom a default .. but that&#39;s<br></div><div>not my fault, that&#39;s the =
fun of the kernel configuration subsystem :D<br><br></div><div>Bruce<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 just making sure i&#39;m not overlooking any subtleties.<br>
<br>
rday<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
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
in/<wbr>rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div></div>

--94eb2c083d847289e305440384b6--
