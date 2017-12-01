Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id DC393786F8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 21:53:34 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id k15so5028377pgr.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 13:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=86H1ns8SteuIYS8KomTNu+6YBA5EY3I3agw6aw6Tyvs=;
	b=crGH5frb2zKAdZ+h08bYtl06EkP/vDvbu9PF0qzTlwfn9ysWT0W+ZIGziOMjfIi+eX
	WILuIMsED+1z5ztGr8AuIYgX3GY7H8YV8JLMcTC4z3jk/PhrBvYjgGr45oDJ2a9/9A8k
	/EYjdq3ED63LaIHQTyEPv7cFLI8y4NTjsFEtCLPr++H0ml0B2lirmOLNFM0Mu76hDVfB
	Y6oy4MOIfCDfpacdorRuQ4HtT+66lFs0rhHPt4GV01dlYi/ueiDnVTXq/v14UKEEqFBC
	9+8Aq57meE5vIBGz9c8GB/+i7CatcjVrjTVfPpDC7FsGbSu1warIAhlPT+l+XhF36XRx
	Qs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=86H1ns8SteuIYS8KomTNu+6YBA5EY3I3agw6aw6Tyvs=;
	b=L0Z7a2EL6JpL0CPURs1TTVD4Z0xWb7aLj4Gk94V+qJWynob4bQSbbnLtFVXZcSECo5
	2R8ayORrs4TddhsUih8VaQhu2b2jxgVVX5n6jQDFDJb0SKNBCvhrbSiadYVx5PDcYKvY
	oKSnnuneHcbBOdUTOpeBYPZP0lYm0zBCX9mXcU4HevcJ343F9EksJs9a4iL5Jv2aTB10
	SIosVTMratolBuCSr3Zozd/X6CzsLkDnvdsK3YZOGK4IkD62UQckt/Rc+D4XfVnsJhMp
	CfpEWgaL9UcilOoPTrld3sx/GareFy2TbdpY6Loyso9ICepziwSWPoPC7Isx6omhKQaP
	YVAQ==
X-Gm-Message-State: AJaThX5k5YVRwNIQkAKR/d4aQYYkvslvGC+rA2vObZ6kAvVlkZYrcxR5
	ahCLM7suu5PRSjjiaR0+xsEPnTAXlS4oBsbqG3w=
X-Google-Smtp-Source: AGs4zMZt72pjT5PxJdsQQA6sbloJPs2NO+vtwv1RarnmwhQlBnVFOIaEae+W/4lmmjnGEWWJ3u2W+vL/6MvMwe0F9Jw=
X-Received: by 10.98.104.194 with SMTP id d185mr11696930pfc.155.1512165215933; 
	Fri, 01 Dec 2017 13:53:35 -0800 (PST)
MIME-Version: 1.0
References: <1512073240-3830-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1soVy677jtDR5GNF-x7MdxVM7H=QhONKiZrgw9GgZp74=g@mail.gmail.com>
	<CAJ86T=VX0up-q-CSOafSno14+frTM3NxzwngffCkggMOTd6vCA@mail.gmail.com>
	<CAJTo0Lb4VsORo9110=Q8JSgQytcfoHpsRRSTWiJJ_BiPfYxvvA@mail.gmail.com>
	<CAJ86T=UsiK40aCLw-4KeY3LdOCHKXw_r-h2NTwAG7QjA5kQfJQ@mail.gmail.com>
	<CAMKF1sowNmwhq__dZdYmV8RCuBpyLJKKAenkacLjE7jTR1WAUw@mail.gmail.com>
	<CAEsOVNfMjeT=4zTcO-WcN0VyY_c1326U7qmEPXSuo4+=ukKJHw@mail.gmail.com>
In-Reply-To: <CAEsOVNfMjeT=4zTcO-WcN0VyY_c1326U7qmEPXSuo4+=ukKJHw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 01 Dec 2017 21:53:24 +0000
Message-ID: <CAMKF1spG5cEidsuRkMSDB_XAEvMPtu0Xt2HRP_-1fPRG-nwWjA@mail.gmail.com>
To: Matthew McClintock <msm-oss@mcclintock.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: prevent errors if do_install is run more than once
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
X-List-Received-Date: Fri, 01 Dec 2017 21:53:36 -0000
Content-Type: multipart/alternative; boundary="94eb2c11aff8899bf9055f4e665a"

--94eb2c11aff8899bf9055f4e665a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2017 at 1:22 PM Matthew McClintock <msm-oss@mcclintock.net>
wrote:

> On Fri, Dec 1, 2017 at 2:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Fri, Dec 1, 2017 at 11:30 AM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >> On Fri, Dec 1, 2017 at 3:07 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >>> Extend lnr to have a --force option?
> >>
> >> Is there ever a case where we want lnr to fail if the target already
> exists?
> >>
> >> There are plenty of existing examples in oe-core where rm is run
> >> before lnr (and in the cases where it's not, it's perhaps just a bug
> >> or an oversight).
> >>
> >> So I think either leave the v1 patch as-is and run rm before lnr in
> >> musl do_install as we already do elsewhere, or update lnr so that it
> >> unconditionally removes any pre-existing target?
> >
> > I like Ross'es suggestion to modify lnr implementation as an
> > independent patch and
> > rebase your patch on top. Maybe a cleanup later to remove all rm cmds
> > that are used
> > before lnr
>
> Do we keep the lnr filename? Change to ln-python and add -r and -f?
>
> The above question wasn't answered. Should we just always force it and
> emit a WARNING if it's being replaced?


It=E2=80=99s should force replace it yes a note about replacing an existing=
 file if
any is fine

>
>
> -M
>

--94eb2c11aff8899bf9055f4e665a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, Dec 1, 2017 a=
t 1:22 PM Matthew McClintock &lt;<a href=3D"mailto:msm-oss@mcclintock.net">=
msm-oss@mcclintock.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On Fri, Dec 1, 2017 at 2:13 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; On Fri, Dec 1, 2017 at 11:30 AM, Andre McCurdy &lt;<a href=3D"mailto:a=
rmccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt; On Fri, Dec 1, 2017 at 3:07 AM, Burton, Ross &lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wro=
te:<br>
&gt;&gt;&gt; Extend lnr to have a --force option?<br>
&gt;&gt;<br>
&gt;&gt; Is there ever a case where we want lnr to fail if the target alrea=
dy exists?<br>
&gt;&gt;<br>
&gt;&gt; There are plenty of existing examples in oe-core where rm is run<b=
r>
&gt;&gt; before lnr (and in the cases where it&#39;s not, it&#39;s perhaps =
just a bug<br>
&gt;&gt; or an oversight).<br>
&gt;&gt;<br>
&gt;&gt; So I think either leave the v1 patch as-is and run rm before lnr i=
n<br>
&gt;&gt; musl do_install as we already do elsewhere, or update lnr so that =
it<br>
&gt;&gt; unconditionally removes any pre-existing target?<br>
&gt;<br>
&gt; I like Ross&#39;es suggestion to modify lnr implementation as an<br>
&gt; independent patch and<br>
&gt; rebase your patch on top. Maybe a cleanup later to remove all rm cmds<=
br>
&gt; that are used<br>
&gt; before lnr<br>
<br>
Do we keep the lnr filename? Change to ln-python and add -r and -f?<br>
<br>
The above question wasn&#39;t answered. Should we just always force it and<=
br>
emit a WARNING if it&#39;s being replaced?</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">It=E2=80=99s should force replace it yes a note a=
bout replacing an existing file if any is fine=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
<br>
-M<br>
</blockquote></div></div>

--94eb2c11aff8899bf9055f4e665a--
