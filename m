Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id C67B478645
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 13:57:10 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id c17so16899105iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 05:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PkzA4f2vrq6sG9Jmb6GvA2HCh5ALB20v/Lsvvz8eXhQ=;
	b=hrTVmdfpxywrTA3CUFTASxkO0+YjXXwpKpPR+yAlLaDV9KCYBurBxTiZPgraBhtnj6
	VRW0sDgPaus4hByklZCrgJgy0NCzmAjFAm0DuT+4wAshXK0WUY/6to3ixfAjwRkeCREj
	3te2brvAebILCWTxsrjiqR9ahhT+2ml7RHSZPJENpuxiLacWPN/2b7z1FeYQn10+M6Iv
	SaCDV54S4icNcLFIdHruOkdxeL6f0CXVDTHygB7Rg6dX/neHj+TCaS5N7f8yBepBvqB3
	PlECPrBSNA6m3+BpHjUQI7Ne4Ajl1c18fGwJSrTaItpC+OWWELxCXApYGGDNy9XAfrM7
	6V8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PkzA4f2vrq6sG9Jmb6GvA2HCh5ALB20v/Lsvvz8eXhQ=;
	b=H0z17CFhLCHZYFnnH/CeegACr5m2fqDG1OSJXE3oxM5NCgAI9nSkzhiNQiBrX5lNnm
	EMpADfc6xpb9sSEhNOZRCIW6q4Je3u/doUUwH7/h/HD9oN6dtHPWSbBdZZWN2QQLiBeC
	4K3pjxM+9eX6xjQobaSjAvGkn+yaet4FV320aaJNLbtyk0R2mZ6MAcVnGYwtrn+7rx6Z
	2PhdQOu31pt6nfjaHoHiYXLwzjeRCkMlWSNP80G2JSLFLCqBUMW8zxOvW36uWMunnyh6
	M61w1ablqmlKDJUQa5a4/UH03U4Y3v0lmmUjKiFC6pgKnvA019eAQg5kenLZfscM9idQ
	yRMw==
X-Gm-Message-State: AKGB3mLpg5EexRstjWS2daP7SlEfa1Ss2t5ps6sYAyoobGfKbUHGDQ3W
	rPfKDU3QNxwoKWokwhBErnLy/NgbsmSqJWdpSlu2Cg==
X-Google-Smtp-Source: ACJfBoslo4Ai1YEbY91t1tA4kzsq564ma5qiqHVsNYHMx5aIZLAffK1gmBfqW9tXMyzclm2hXbmo4Q67cygKqIp8EQU=
X-Received: by 10.107.102.25 with SMTP id a25mr37525543ioc.217.1516111031935; 
	Tue, 16 Jan 2018 05:57:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Tue, 16 Jan 2018 05:56:51 -0800 (PST)
In-Reply-To: <20180116115516.bs5g4ngea3gz4sgr@mcrowe.com>
References: <20180115175321.r7sfuxibr743icio@mcrowe.com>
	<CAJTo0LbcZxArSP-TRYXfNVXY9FS8hK=okbHT2p8RU+nx1Sya+g@mail.gmail.com>
	<20180116115516.bs5g4ngea3gz4sgr@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jan 2018 13:56:51 +0000
Message-ID: <CAJTo0LYFZqkc_KMXKjNmX4M3z0UjAjGpRLNingKsmXf7yBUmHQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: glib-2.0 fails to configure with USE_NLS="no"
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
X-List-Received-Date: Tue, 16 Jan 2018 13:57:11 -0000
Content-Type: multipart/alternative; boundary="089e082d07807fbe4f0562e51bcb"

--089e082d07807fbe4f0562e51bcb
Content-Type: text/plain; charset="UTF-8"

GLib doesn't really support disable-nls, no.  I guess we need to force it
on for target builds, as I now hack it to work without gettext for native.

Ross

On 16 January 2018 at 11:55, Mike Crowe <mac@mcrowe.com> wrote:

> On 15 January 2018 at 17:53, Mike Crowe <mac@mcrowe.com> wrote:
> >> If I add USE_NLS = "no" to local.conf, then glib-2.0 fails to configure:
> >>
> >> | checking for ngettext in libc... yes
> >> | checking for dgettext in libc... yes
> >> | checking for bind_textdomain_codeset... (cached) yes
> >> | checking for msgfmt... no
> >> | configure: error:
> >> | *** You must have either have gettext support in your C library, or
> use
> >> | the
> >> | *** GNU gettext library.
> >> | (http://www.gnu.org/software/gettext/gettext.html)
> >>
> >> It seems that glib-2.0 does not support --disable-nls and always
> requires
> >> gettext.
> >>
> >> I can avoid this error by adding gettext-native to glib-2.0's DEPENDS,
> but
> >> I'm not sure whether this is solution would be acceptable.
> >>
> >> Is there a better way?
>
> On Monday 15 January 2018 at 19:34:35 +0000, Burton, Ross wrote:
> > Have a look at what just landed in master...
>
> Perhaps I'm being stupid, but it looks like nothing has landed on master
> since Sunday.
>
> Looking at the history, I see 1ef45d377519983df827650cd0913e0d2c8a785b ,
> but I already had that change. Reverting it does appear to fix the problem
> though. Is that what you meant? If not, please can you point me at the
> commit you are referring to?
>
> Thanks.
>
> Mike.
>

--089e082d07807fbe4f0562e51bcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">GLib doesn&#39;t really support disable-nls, no.=C2=A0 I g=
uess we need to force it on for target builds, as I now hack it to work wit=
hout gettext for native.<div><br></div><div>Ross</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 16 January 2018 at 11:55, Mik=
e Crowe <span dir=3D"ltr">&lt;<a href=3D"mailto:mac@mcrowe.com" target=3D"_=
blank">mac@mcrowe.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On 15 January 2018 at 17:53, Mike Crowe &lt;<a href=3D"=
mailto:mac@mcrowe.com">mac@mcrowe.com</a>&gt; wrote:<br>
&gt;&gt; If I add USE_NLS =3D &quot;no&quot; to local.conf, then glib-2.0 f=
ails to configure:<br>
&gt;&gt;<br>
&gt;&gt; | checking for ngettext in libc... yes<br>
&gt;&gt; | checking for dgettext in libc... yes<br>
&gt;&gt; | checking for bind_textdomain_codeset... (cached) yes<br>
&gt;&gt; | checking for msgfmt... no<br>
&gt;&gt; | configure: error:<br>
&gt;&gt; | *** You must have either have gettext support in your C library,=
 or use<br>
&gt;&gt; | the<br>
&gt;&gt; | *** GNU gettext library.<br>
&gt;&gt; | (<a href=3D"http://www.gnu.org/software/gettext/gettext.html" re=
l=3D"noreferrer" target=3D"_blank">http://www.gnu.org/software/<wbr>gettext=
/gettext.html</a>)<br>
&gt;&gt;<br>
&gt;&gt; It seems that glib-2.0 does not support --disable-nls and always r=
equires<br>
&gt;&gt; gettext.<br>
&gt;&gt;<br>
&gt;&gt; I can avoid this error by adding gettext-native to glib-2.0&#39;s =
DEPENDS, but<br>
&gt;&gt; I&#39;m not sure whether this is solution would be acceptable.<br>
&gt;&gt;<br>
&gt;&gt; Is there a better way?<br>
<br>
</span><span class=3D"">On Monday 15 January 2018 at 19:34:35 +0000, Burton=
, Ross wrote:<br>
&gt; Have a look at what just landed in master...<br>
<br>
</span>Perhaps I&#39;m being stupid, but it looks like nothing has landed o=
n master<br>
since Sunday.<br>
<br>
Looking at the history, I see 1ef45d377519983df827650cd0913e<wbr>0d2c8a785b=
 ,<br>
but I already had that change. Reverting it does appear to fix the problem<=
br>
though. Is that what you meant? If not, please can you point me at the<br>
commit you are referring to?<br>
<br>
Thanks.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mike.<br>
</font></span></blockquote></div><br></div>

--089e082d07807fbe4f0562e51bcb--
