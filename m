Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 77F2A71CA2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:57:37 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id i34so17819553qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 05:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zkrDvM/PCNmq6k3ejI/uvBERmhiKNE1F0jztDrBZSnw=;
	b=tCc7qAhd3fSqvuD0mYP/mKfhcGjdueYIAk8gRifN0I/WLxMJiCgl879Ifom95K8N4U
	L1yLJ5JhCWdy2/E5JwO7lf8BVYWLZEvl3GyLa7kxJ9V2Enq0AP6zbsItzjHpWap0zKZx
	HhPu7qNrYxmIvZ7DDTGZ+WSkmksniR32BZFf8IPQO4wIdgNq9iHfDPUTHG21ncflLmCx
	APhef/TMcMUG06ZMVXjIWnMpd0XF5y2M8braaKaUiJTn4uI/FljM36/CKe+hfqSZjYFm
	LHeOX6g0zvHppGvb4S/afEdSmTaETt3pnak4lm2h8EkcIIqMMGusWpOzlXHlymr/WYRs
	bqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zkrDvM/PCNmq6k3ejI/uvBERmhiKNE1F0jztDrBZSnw=;
	b=A0gU9SB9Ux0WgEeRSIcc7n3CSLUpIqJBmMepMfXQ6DdZuiPqRz6nfRCitvQMTcet1D
	arcjq34MmOJV5ZZO3r/JhV31rf9q+leaFcltMTxCbmrTDQSRozSu07fVm9GgC8FhderO
	N9tPLE54p1dSwyUsMw1/lTW7ILSZwhwxHU9iQODXKDtG/Fi054nSXPp9/SXxxdDxukcn
	cH8zsqeMeP4wcGCgTtnIDE8MMgy4HixBUEZ6OXcUQFxDBc5Qtsso5UBmJbJ4Ci9qH0sR
	IIqcAdZ8ArEuv+ftUIwW/QkduiRqJvjoezmxRPBZvMQKgNrkNONljXuEMijCM8VRah7q
	FUpw==
X-Gm-Message-State: AMke39kIwqQ4plmdscbph3lG9fOZUYaZDrWMYPeJ2CmELLbd3MiZXtWqTP+f3BEDjA7O2g+otNo/I55QkqPqRg==
X-Received: by 10.55.121.194 with SMTP id u185mr19581572qkc.56.1486562257347; 
	Wed, 08 Feb 2017 05:57:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Wed, 8 Feb 2017 05:57:36 -0800 (PST)
In-Reply-To: <1486561983.3754.4.camel@linux.intel.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
	<1486561983.3754.4.camel@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 8 Feb 2017 08:57:36 -0500
Message-ID: <CADkTA4OQ0fAMcw2eDye-9CL0dKoWgau5mw0uw0xuV-ZdGhWUfA@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Wed, 08 Feb 2017 13:57:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c05a196492f5f0548053fe7

--94eb2c05a196492f5f0548053fe7
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2017 at 8:53 AM, Joshua Lock <joshua.g.lock@linux.intel.com>
wrote:

> On Tue, 2017-02-07 at 17:35 +0000, Burton, Ross wrote:
>
>
> On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com> wrote:
>
> This is converging the recipes for go from
> meta-virtualization and oe-meta-go
>
>
> I'm still of the opinion that this should be in meta-go, not oe-core...
>
>
> FWIW I disagree. Go is a popular systems language and we're increasingly
> supporting a wide-array of systems with OE (from iot to ivi and beyond).
>
> Go is already in wide enough use and duplicated in enough layers that we
> would be doing folks a favour by including it in OE-Core and our build/test
> cycle.
>

I said as much during the oe developer meeting in Berlin last year as well.

I've done work in meta-virt out of necessity, as the cadence of the various
layers
was easily getting out of sync. The problem with 'language layers', is that
they
update based on the tools/packages/libs and not a system level use case.

Having something in oe-core forces that cadence of updates + QA that makes
it much easier to use as part of the eco system.

My Canadian 2 cents worth,

Bruce


>
> Joshua
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05a196492f5f0548053fe7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Feb 8, 2017 at 8:53 AM, Joshua Lock <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:joshua.g.lock@linux.intel.com" target=3D"_blank">joshua.g.lock=
@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv><span class=3D""><div>On Tue, 2017-02-07 at 17:35 +0000, Burton, Ross wr=
ote:</div><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 7 February 2017 at 04:24, Khem Raj <=
span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote type=3D"cite"><di=
v id=3D"m_8307290543861382148:3zt" class=3D"m_8307290543861382148a3s m_8307=
290543861382148aXjCH m_8307290543861382148m15a16d210a62cc87">This is conver=
ging the recipes for go from<br>
meta-virtualization and oe-meta-go<br></div><br></blockquote></div><br>I&#3=
9;m still of the opinion that this should be in meta-go, not oe-core...</di=
v></div>
</blockquote><div><br></div></span><div>FWIW I disagree. Go is a popular sy=
stems language and we&#39;re increasingly supporting a wide-array of system=
s with OE (from iot to ivi and beyond).=C2=A0</div><div><br></div><div>Go i=
s already in wide enough use and duplicated in enough layers that we would =
be doing folks a favour by including it in OE-Core and our build/test cycle=
.</div></div></blockquote><div><br></div><div>I said as much during the oe =
developer meeting in Berlin last year as well.<br><br></div><div>I&#39;ve d=
one work in meta-virt out of necessity, as the cadence of the various layer=
s<br></div><div>was easily getting out of sync. The problem with &#39;langu=
age layers&#39;, is that they<br></div><div>update based on the tools/packa=
ges/libs and not a system level use case.<br><br></div><div>Having somethin=
g in oe-core forces that cadence of updates + QA that makes<br></div><div>i=
t much easier to use as part of the eco system.<br><br></div><div>My Canadi=
an 2 cents worth,<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div><span class=3D"HOEnZb"><font color=3D"#888888"=
><div><br></div><div>Joshua</div></font></span></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow =
the NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--94eb2c05a196492f5f0548053fe7--
