Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 31C7071ABC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 16:44:28 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id x190so2477362qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 08:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yk3me6jfqRHSiMGZmNqShAIt4RGG1qujnvegXgXID9Y=;
	b=JynqOuPaFawE87U9uWqdkP30MngMKcDSeUKC28E0NbijqvOdufBnvWxHDri1dFCrwW
	walA6kTesticYJYkeMBFSheZyCu7Sj8yf+1D3mZ/wiqs1CMHVoF1hdZjZTS/ubVgl9s1
	LkrLELMKP/vaNkql1LbNvlmebQZtPGe6rKSz/zm+QjQ9zZJI8g7snzV4V4oVr8k+QcRg
	keidUdziGeBmVi9cy2wST8iBRcF7dL4Hawj95qxwsw14Qf74lMLB8GD8Zsp7Hz1Xdrf9
	D2g8X2W1MpkoUFMaJpPpHsAvoixBm86vgUVElu0Uk7DKyMHqzLwVPVmQ/ksBfYlAOp1i
	sXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yk3me6jfqRHSiMGZmNqShAIt4RGG1qujnvegXgXID9Y=;
	b=PCco6Ka85II49UdZpMQEfLoM7q+jdQc1/vz18fGCjT9nFFxQa2iXF18lvIm9OzkkfR
	tDoe7vD32S+r98Zf0M69e6G3cCNBxEnlbjZqGcbbB0Uc2ehNbRxvqbKzSSmXI9hkdDIP
	0uFkjZT0chY2492SH/syD9tyHL3dI4uhXsGdtVqHupFmxoQHVHAY0L46qHG6OUK37+lD
	WIPc2s+ENlkj5dbl9mlfsEM1VSslKwK8VsJUtYactmnDsnErN5Uu7TlGLGWuqA06iVKs
	/zVEkSfSS3qInncrjnAB1Ys2A8ArBIJ5rqDaFlYbjZOvzaYnMUoR6nCAkZKbE67bBjuw
	ZQ/g==
X-Gm-Message-State: ABUngvdj6f4rqBys801qASJCtDi6WOaqFYSRsyL9VRGpTzkjR03S2vaKc+6TFXodG5a/ykETWSlTps0OKJ/8eg==
X-Received: by 10.55.197.6 with SMTP id p6mr4639913qki.239.1478882669667; Fri,
	11 Nov 2016 08:44:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Fri, 11 Nov 2016 08:44:28 -0800 (PST)
In-Reply-To: <CAMKF1sou_spk+SLREA6v8TBynki-2Au+x+sNXM0cMniJYpOA9w@mail.gmail.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
	<CAMKF1sou_spk+SLREA6v8TBynki-2Au+x+sNXM0cMniJYpOA9w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Nov 2016 11:44:28 -0500
Message-ID: <CADkTA4MBthH3UObu69LnhF5y0S6GHq0=gBRxgXy69TR7A_e5_Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Fri, 11 Nov 2016 16:44:30 -0000
Content-Type: multipart/alternative; boundary=001a1149a18c30aeda0541093411

--001a1149a18c30aeda0541093411
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 11, 2016 at 11:02 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Nov 11, 2016 at 5:10 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> > On 11/10/2016 02:39 AM, Khem Raj wrote:
> >>
> >> This is converging the recipes for go from
> >> meta-virtualization and oe-meta-go
> >
> >
> > Wait a moment, why this should go to oe-core and not to meta-go? Is there
> > something in oe-core itself that requires presence of go compiler?
>
> Nothing thats enabled in OE-Core depends on go yet, however, thats not
> always the reason
> for something to be in OE-Core, if you look out, you will see there is
> no single layer for golang ( I see atleast 5 )
> support, each one of them is done differently, some are better than
> others depending upon what you need,
> This causes a lot of confusion for users who have golang needs.
>  golang is a fast growing language being adopted in verticals where OE is
> used,
> This would offer a consolidated place for golang in OE ecosystem.
>

Agreed.

There's a reason why meta-virt has such extensive go support .. we never
could
get consistent behaviour from the other layers, and changes took a while to
coordinate.

Getting a good baseline in oe-core would simplify a lot of layers, and it
is only
a matter of time before there's a direct user in oe-core.

Bruce


> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1149a18c30aeda0541093411
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Nov 11, 2016 at 11:02 AM, Khem Raj <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fri, =
Nov 11, 2016 at 5:10 AM, Alexander Kanavin<br>
&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@=
linux.<wbr>intel.com</a>&gt; wrote:<br>
&gt; On 11/10/2016 02:39 AM, Khem Raj wrote:<br>
&gt;&gt;<br>
&gt;&gt; This is converging the recipes for go from<br>
&gt;&gt; meta-virtualization and oe-meta-go<br>
&gt;<br>
&gt;<br>
&gt; Wait a moment, why this should go to oe-core and not to meta-go? Is th=
ere<br>
&gt; something in oe-core itself that requires presence of go compiler?<br>
<br>
</span>Nothing thats enabled in OE-Core depends on go yet, however, thats n=
ot<br>
always the reason<br>
for something to be in OE-Core, if you look out, you will see there is<br>
no single layer for golang ( I see atleast 5 )<br>
support, each one of them is done differently, some are better than<br>
others depending upon what you need,<br>
This causes a lot of confusion for users who have golang needs.<br>
=C2=A0golang is a fast growing language being adopted in verticals where OE=
 is used,<br>
This would offer a consolidated place for golang in OE ecosystem.<br></bloc=
kquote><div><br></div><div>Agreed.</div><div><br></div><div>There&#39;s a r=
eason why meta-virt has such extensive go support .. we never could</div><d=
iv>get consistent behaviour from the other layers, and changes took a while=
 to=C2=A0</div><div>coordinate.</div><div><br></div><div>Getting a good bas=
eline in oe-core would simplify a lot of layers, and it is only</div><div>a=
 matter of time before there&#39;s a direct user in oe-core.</div><div><br>=
</div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a1149a18c30aeda0541093411--
