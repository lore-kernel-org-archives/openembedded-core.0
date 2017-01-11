Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id DB42771AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 16:42:48 +0000 (UTC)
Received: by mail-yb0-f177.google.com with SMTP id v132so118489473yba.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 08:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r9bvpC86FGlxqCf+31Oo0xCQ+pdA+GG8mllbSQxX4No=;
	b=H/y+axpMfKFTEVpIF9K5ps4Usy3PqCcuWsSTP9QsZdcudRCHCVtHJQoHa2t9Mx0FUX
	Z2ON02fLhum8gRpRVP9Ok4y/Xa8yFDAdzDFMxT7EAaOvH37YAngspAR4OiN0HzqhU4sZ
	Mbqd9h+Hxy37OMAZvOzORwJvRV8Xd7gH3zeAtpwHaBVfB+41M3bpwlfclTGOn5vnIKkS
	iRTwP9xirVCO/VgrFFCajJS9p70yiohrr7uTR8daJqcBMV8bSwi5cE78z5Jo8uS/oEnF
	dFiN6o6EY6Ores0sHG0INXn7oZw/9xTEj4Xk7bNIYeQujhUw9ItDx71fgW+G7i0VC/ch
	YKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r9bvpC86FGlxqCf+31Oo0xCQ+pdA+GG8mllbSQxX4No=;
	b=lENU4wWM8AodMKU2FjbQ7+5eETZyWIlBnbDOger7bppd6/FE4s4ipfLNm8joBdHEic
	y6xEokjhEGgro7esPiqYVtR3qImlyyJ+fNaDdN8frZjL5ZJ56GuqvlFC4j9PnwW6HFes
	j4dtoAaoQ2xguGHIw5zoznccD3owoX3qZ+AK+oE62aGeVoVPs2aIvlaWqwvZoviJUt1M
	CnNzN36cdcm0c5o+2VxfyDZRAgmMJ6hO0Lx+fBYlET/ElOIp3D5E1WzyB3mGdDkAjvSO
	Lzd/Wejct09hy/mCKlVSh6zghvSYB6/2hskY9bUJwUbD9e2MGg6kNbV630D9NsFwp7o0
	JNIg==
X-Gm-Message-State: AIkVDXIIiDT8N7zZhRtvbORmBnh+N8AydEfZQOOZzDGN2PjS2Bag5knwoJrIigtg+ThU7jyMKHRlQtMTrbEJZMgq
X-Received: by 10.37.10.196 with SMTP id 187mr5059640ybk.3.1484152968539; Wed,
	11 Jan 2017 08:42:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Wed, 11 Jan 2017 08:42:18 -0800 (PST)
In-Reply-To: <CAJTo0LbXmAGizX72qZ9LqLUeugoUmb_bM-B8zg-SvLvdwqUaLQ@mail.gmail.com>
References: <20170103015528.29635-1-raj.khem@gmail.com>
	<CAJTo0LYyvqUP+gE=mcbkgF9u7ZEqDPEQL15=M6gtr=AtKL33tw@mail.gmail.com>
	<CAMKF1sotQbOB9TMCDqa8cNhiD3QsKdgrQmVzHcw=yCbywzeROQ@mail.gmail.com>
	<CAJTo0LYXVGGnC5XtTA-LDE9oRLK0693xvBnE=11ab+KczbE1hw@mail.gmail.com>
	<CAMKF1sp3bgSVF0+1YLMGtOeQNOVs7XxcM=etkckgbN6-kBvNJA@mail.gmail.com>
	<CAJTo0LbXmAGizX72qZ9LqLUeugoUmb_bM-B8zg-SvLvdwqUaLQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 11 Jan 2017 18:42:18 +0200
Message-ID: <CAHiDW_FbM2goeKn8ZKY+LZO86tdpgESg8mfR1SiHAsBQRJRbCg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 11 Jan 2017 16:42:49 -0000
Content-Type: multipart/alternative; boundary=001a113dd7f87ba00d0545d44aab

--001a113dd7f87ba00d0545d44aab
Content-Type: text/plain; charset=UTF-8

On 11 January 2017 at 18:29, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 6 January 2017 at 16:54, Khem Raj <raj.khem@gmail.com> wrote:
>
>> regardless, I posted a patch for ppp for fixing same issue, seee
>>
>> https://patchwork.openembedded.org/patch/135536/
>>
>> may be the same or similar patch can be applied to connman as well.
>>
>
> Similar but not the same.
>

Several core connman files do include linux/if.h (and xtables includes
net/if.h) but I don't think these can be avoided.

connman/src/iptables.c includes <xtables.h> and nothing else relevant as
> far as I can tell.  However the fragment of code that is throwing an error
> (pulled in via xtables.h) is only enabled because the kernel headers don't
> think that the libc is defining IFF_LOWER_UP, but musl is.
> https://git.busybox.net/buildroot/commit/?id=
> 4470dd9b1bdbb9b39e9fb13f27bcaa044719de6d is how buildroot work around
> this, by defining a _UAPI symbol that the kernel header listens to.
>

I did pretty much the same "fix" inside connman (defined
__UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0 everywhere the
problem shows up) and it works... but should the hack be done somewhere in
the toolchain instead?

 - Jussi


> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113dd7f87ba00d0545d44aab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
1 January 2017 at 18:29, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><span class=3D"gmail-"><br><div class=
=3D"gmail_quote">On 6 January 2017 at 16:54, Khem Raj <span dir=3D"ltr">&lt=
;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div id=3D"gmail-m_5182118854856288804gmail-:1ey" class=3D"gmail-m_5182118=
854856288804gmail-a3s gmail-m_5182118854856288804gmail-aXjCH gmail-m_518211=
8854856288804gmail-m15974b4b56d36740">regardless, I posted a patch for ppp =
for fixing same issue, seee<br>
<br>
<a href=3D"https://patchwork.openembedded.org/patch/135536/" rel=3D"norefer=
rer" target=3D"_blank">https://patchwork.openembedded<wbr>.org/patch/135536=
/</a><br>
<br>
may be the same or similar patch can be applied to connman as well.<br></di=
v></blockquote></div><br></span>Similar but not the same.</div></div></bloc=
kquote><div><br></div><div>Several core connman files do include linux/if.h=
 (and xtables includes net/if.h) but I don&#39;t think these can be avoided=
.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_extra">connman/src/iptables.c includes &l=
t;xtables.h&gt; and nothing else relevant as far as I can tell.=C2=A0 Howev=
er the fragment of code that is throwing an error (pulled in via xtables.h)=
 is only enabled because the kernel headers don&#39;t think that the libc i=
s defining IFF_LOWER_UP, but musl is. =C2=A0<a href=3D"https://git.busybox.=
net/buildroot/commit/?id=3D4470dd9b1bdbb9b39e9fb13f27bcaa044719de6d" target=
=3D"_blank">https://git.busybox.net/<wbr>buildroot/commit/?id=3D<wbr>4470dd=
9b1bdbb9b39e9fb13f27bcaa<wbr>044719de6d</a>=C2=A0is how buildroot work arou=
nd this, by defining a _UAPI symbol that the kernel header listens to.</div=
></div></blockquote><div><br></div><div>I did pretty much the same &quot;fi=
x&quot; inside connman (defined __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DOR=
MANT_ECHO 0 everywhere the problem shows up) and it works... but should the=
 hack be done somewhere in the toolchain instead?</div><div><br></div><div>=
=C2=A0- Jussi</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><span class=3D"gmail-HOEnZb"><font color=3D"#88=
8888"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></font></span></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div>

--001a113dd7f87ba00d0545d44aab--
