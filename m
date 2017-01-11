Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 51F8871AE6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 16:29:21 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id l7so151193577qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 08:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vfwYZiH/Ieg91n6+Hqf3z5nKcslpqDV8sd+04++5a1g=;
	b=LAlkHZbDhDSqinEquj9fOOycRGN28sAsPI/u3Gy88NDmBnv8p/U2HRJwTkzy/H/5zu
	sdyi8EMR1HrC+KDfr96rcLmVNFkCjRC+A0Ikf+bI+mT6MAF34SyFR7eKbr1qYuYKgmFl
	hbweyPekjVtEjCMoN97XgB/YJXSj0YOud19YdC+up3hEPvEGr7qdPv+OSuRReokLSBTN
	do+qcYGB8EcO77iOT9lvu8mEeRK6lvsKyRB2Z6B3Tu6lPbSL6tLgE9fDJn0cP+dXgVpF
	8XBGvLneNuF3pGC8xdHel1spWtIZiJU61yfkKi6rSCgPJ3iNW4fm3lruJWiGnMfjBfok
	7weQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vfwYZiH/Ieg91n6+Hqf3z5nKcslpqDV8sd+04++5a1g=;
	b=seAj0XPTogPvByCgxD6CMB5Dl3f651vIkf86D/UlMCuK2NJ62XYHUf4nnADI4Vi4g4
	HV4unySIgNqQLwxgdENV+TdbbfD5+OXX3/r2Hv239g7RnsYG05o5mdjZHxCQcg+S5XxY
	5ortZOtUkF4++7KlZ81ZKZ0G2DpdACexlRAdgBhd/YHw9GYOpblBFlfNs3SU9TDPFhK1
	g3nph6ezWpcZVntGCI6wg45COmqpSBcmjO5m8tVDdgFIUmrY0tmguC/bFPJKxbpuqcLF
	0krpHFC8G4NP0ZpkqE2NDEtxG4IQJuOHdbUETli7TzloAdM4OiQ76v8/6sqh0GVRucqC
	om5A==
X-Gm-Message-State: AIkVDXJOwlDgKfgWNzi3Uj/YEwRQv01MzYXDZr6cyXm+K1MBJ6MiaAFF+LHKJMi8WCdBdd28wQ8pKDIU7yLQrNQE
X-Received: by 10.200.53.247 with SMTP id l52mr3259289qtb.144.1484152162207;
	Wed, 11 Jan 2017 08:29:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 11 Jan 2017 08:29:01 -0800 (PST)
In-Reply-To: <CAMKF1sp3bgSVF0+1YLMGtOeQNOVs7XxcM=etkckgbN6-kBvNJA@mail.gmail.com>
References: <20170103015528.29635-1-raj.khem@gmail.com>
	<CAJTo0LYyvqUP+gE=mcbkgF9u7ZEqDPEQL15=M6gtr=AtKL33tw@mail.gmail.com>
	<CAMKF1sotQbOB9TMCDqa8cNhiD3QsKdgrQmVzHcw=yCbywzeROQ@mail.gmail.com>
	<CAJTo0LYXVGGnC5XtTA-LDE9oRLK0693xvBnE=11ab+KczbE1hw@mail.gmail.com>
	<CAMKF1sp3bgSVF0+1YLMGtOeQNOVs7XxcM=etkckgbN6-kBvNJA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jan 2017 16:29:01 +0000
Message-ID: <CAJTo0LbXmAGizX72qZ9LqLUeugoUmb_bM-B8zg-SvLvdwqUaLQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to 1.1.16+ on master
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
X-List-Received-Date: Wed, 11 Jan 2017 16:29:22 -0000
Content-Type: multipart/alternative; boundary=001a1142ba206be02c0545d41a8d

--001a1142ba206be02c0545d41a8d
Content-Type: text/plain; charset=UTF-8

On 6 January 2017 at 16:54, Khem Raj <raj.khem@gmail.com> wrote:

> regardless, I posted a patch for ppp for fixing same issue, seee
>
> https://patchwork.openembedded.org/patch/135536/
>
> may be the same or similar patch can be applied to connman as well.
>

Similar but not the same.

connman/src/iptables.c includes <xtables.h> and nothing else relevant as
far as I can tell.  However the fragment of code that is throwing an error
(pulled in via xtables.h) is only enabled because the kernel headers don't
think that the libc is defining IFF_LOWER_UP, but musl is.
https://git.busybox.net/buildroot/commit/?id=4470dd9b1bdbb9b39e9fb13f27bcaa044719de6d
is
how buildroot work around this, by defining a _UAPI symbol that the kernel
header listens to.

Ross

--001a1142ba206be02c0545d41a8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2017 at 16:54, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex"><div id=3D"gmail-:1ey" class=3D"gmail-a3s gmail-a=
XjCH gmail-m15974b4b56d36740">regardless, I posted a patch for ppp for fixi=
ng same issue, seee<br>
<br>
<a href=3D"https://patchwork.openembedded.org/patch/135536/" rel=3D"norefer=
rer" target=3D"_blank">https://patchwork.<wbr>openembedded.org/patch/135536=
/</a><br>
<br>
may be the same or similar patch can be applied to connman as well.<br></di=
v></blockquote></div><br>Similar but not the same.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">connman/src/iptables.c include=
s &lt;xtables.h&gt; and nothing else relevant as far as I can tell.=C2=A0 H=
owever the fragment of code that is throwing an error (pulled in via xtable=
s.h) is only enabled because the kernel headers don&#39;t think that the li=
bc is defining IFF_LOWER_UP, but musl is. =C2=A0<a href=3D"https://git.busy=
box.net/buildroot/commit/?id=3D4470dd9b1bdbb9b39e9fb13f27bcaa044719de6d">ht=
tps://git.busybox.net/buildroot/commit/?id=3D4470dd9b1bdbb9b39e9fb13f27bcaa=
044719de6d</a>=C2=A0is how buildroot work around this, by defining a _UAPI =
symbol that the kernel header listens to.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1142ba206be02c0545d41a8d--
