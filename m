Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0AD8F60796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 16:53:25 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id su19so42917445igc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 08:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WtnOSDysV4tGSX3tgGIDoHj+gsHoNLoEu0POaVtMIIA=;
	b=sPo0Z4oSE/c7UvtX0AoSLGy3/OWXeLab3n46KZB8f68AZXT/nxGPZ4gnT694rMPBaX
	1dlGCggCYGOirhNJMQZxPrFlMZZwkl+7+/QmFKF+WaLnJYyMh5sMcs2c+iGgnyTiUUXh
	lnCgikijhTalyuffVgVR83h7f/Hev5bE1YUp+ivC9Lv6iwmv4XM7NADcD/RSsNzmQQxK
	vxA8zWAbzuibNWxrg/kFnlTdK1RQoXqaDOB6z6S+kIFJjtHalcEDUfzIoXjymT2frApn
	5kc6irmzxkq0ev0Nh6Lsk9qIAgiAg7vx5pb3sH53Lrma/+8hKfH5M82BwU1A5NXzjhR3
	/7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WtnOSDysV4tGSX3tgGIDoHj+gsHoNLoEu0POaVtMIIA=;
	b=P2K1Uh2N4Rpm9tlL7oinBi9BpdpJfpApIUT+Hb+7AMV5AdVzv7lrxgsRrMjzh4gi4y
	yucOcu5WahUOz3wAURfT+89keEbtYdgB4YMsOJTQtg77bbEDGnrQk0zi0kmGXW2ugqR+
	RSTcCiAekLr3YuFmXm073ZlVKxXJlo3SrM970zKZH9IVJOgopDOaWCGwHI4qW1cS4/KR
	J0KFMiSRAn9wfD4qXMjS7+o18oByKeF6Evkr+ga6FBvDMGENMz60rKi1mbXKXnj3bD/4
	ojGSU95kUV82wVlkXD46vnTcg25PxKu60165IilOm/GNCNhFn5lCUdtxku8ixKehr6ru
	Qx6A==
X-Gm-Message-State: ALoCoQml+GjkwSFdHg5xAxwK3s2w8LNn5YuI7jBZeIXt0wlQAbylFPSlcrF42kT8gk/QAYlJ5BJv7bnAgFWHVSskP/Cfpy9vFAYJGe9Zmr3Luyx6Vo8RoSc=
X-Received: by 10.50.152.98 with SMTP id ux2mr5194161igb.64.1449852806211;
	Fri, 11 Dec 2015 08:53:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 11 Dec 2015 08:53:06 -0800 (PST)
In-Reply-To: <CAP9ODKrkXa9xfTYafiPNXGa4UKGqsyVWpfywge85vgY=xnuOog@mail.gmail.com>
References: <cover.1449850996.git.ross.burton@intel.com>
	<CAP9ODKrkXa9xfTYafiPNXGa4UKGqsyVWpfywge85vgY=xnuOog@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Dec 2015 16:53:06 +0000
Message-ID: <CAJTo0LafRigufU1PjrRuE=DU1y=MrKS1pNUHM-t8jRwg-5wLRw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/57] Consolidated pull for master
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
X-List-Received-Date: Fri, 11 Dec 2015 16:53:27 -0000
Content-Type: multipart/alternative; boundary=089e0149baaa7dd9e70526a229d8

--089e0149baaa7dd9e70526a229d8
Content-Type: text/plain; charset=UTF-8

On 11 December 2015 at 16:31, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> > Armin Kuster (1):
> >       linux-firmware: update to latest
>
> Nack! please adjust the commit log to include the revision.
>
> ...
> > Otavio Salvador (1):
> >       lttng-tools: Revert wrong enforcement of Python 3.0 use
> ...
>
> The runtime test utilities, found on lttng-tools, require python 3.0
> so the commit log needs adjustment. Should I send a new patch
> revision?


Ah, yes please.

Ross

--089e0149baaa7dd9e70526a229d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 December 2015 at 16:31, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><span class=3D"">&gt; Armin Kuster (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-firmware: update to latest<br>
<br>
</span>Nack! please adjust the commit log to include the revision.<br>
<br>
...<br>
<span class=3D"">&gt; Otavio Salvador (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lttng-tools: Revert wrong enforcement of Pyt=
hon 3.0 use<br>
</span>...<br>
<br>
The runtime test utilities, found on lttng-tools, require python 3.0<br>
so the commit log needs adjustment. Should I send a new patch<br>
revision?</blockquote></div><br>Ah, yes please.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0149baaa7dd9e70526a229d8--
