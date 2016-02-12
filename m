Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 658A3731A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 16:06:07 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id k196so4676895vka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 08:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PTjxOWNCBMPjWfFezRfTQtf3IgvT5evboX/3+dFhdJg=;
	b=0qH9rE8p4PyQIooCbDBssrW42ugMqWBFTPm8pTkQZYDeResdVsvwBqOw71m7dAbH+l
	Yu//CAWLFRLadYm/NYRft2/GGtgjsfK7bjkFHoG35RCJu1b1cr9j+5NCH9HWNwWXGCAU
	89mp6eI67uINXjkX0SPUVz3yw9kBnHYHT6/+bs6HVuiS0dEuEeI04S1qs6CIhd14nZNK
	WHmmBMpQMrfxfr/6mCgy1XTVAFue1IS+scSBotjEZtNCNYEzW3PptonbCCB9Elf6DmpM
	S+EKiF43M96YtllNXbFgBzadl1Ixnz52SGpkSM1I626o0S7jSVkc6vTPDdIiUs2lk89V
	4nKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=PTjxOWNCBMPjWfFezRfTQtf3IgvT5evboX/3+dFhdJg=;
	b=NgzIq1teTafOgdzTQ4CkNSMogsWxScGijTiNka7IKzZUBfLZVgWrM3ZZQW/mt2ZJB5
	piYVqkiOYtlikWqY6dO1C9yxdO7zOf0C3mIFhMbV1+pmOn3t6PJR35+E5rjAIHhWpRm9
	AXi24H/pVQ+ZemfMG9QUkTI6+yDHycyuTEOBkK+q8Vx6Wid7pRYVeGx1MydJ9Kxgpf7j
	qiMilzsGse/AV/d66tileyRU9UfCXSylidp3d+Q+zbIHpgpiVxOX60kH4N+Gr7fHUwzB
	y5Fk3pNVj3XSVp/8w3P285RKtavz12/cvaz6WOQpLKpzIx1YILhGmaSN39R8CzT5OIT1
	NlQA==
X-Gm-Message-State: AG10YOQIQjs9aPf0kXqbasf/OWia8acRsojSqEz/OKuaiY7P3Sg/AnqL32FN3q+dbpOssGP93v33hUnl5Vgpgw==
MIME-Version: 1.0
X-Received: by 10.31.6.17 with SMTP id 17mr1882618vkg.75.1455293167600; Fri,
	12 Feb 2016 08:06:07 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Fri, 12 Feb 2016 08:06:07 -0800 (PST)
In-Reply-To: <1455276502.16142.272.camel@linuxfoundation.org>
References: <cover.1455203165.git.bruce.ashfield@windriver.com>
	<61992.10.252.9.169.1455277045.squirrel@linux.intel.com>
	<1455276502.16142.272.camel@linuxfoundation.org>
Date: Fri, 12 Feb 2016 11:06:07 -0500
Message-ID: <CADkTA4N0UG+OR_7nBkq1_1U05j=OxYtrLvo9eCum2CxnXD12Vg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 0/3] linux-yocto: -stable and BSP updates
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
X-List-Received-Date: Fri, 12 Feb 2016 16:06:10 -0000
Content-Type: multipart/alternative; boundary=001a1143f24a4c8cb7052b94d84d

--001a1143f24a4c8cb7052b94d84d
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 12, 2016 at 6:28 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2016-02-12 at 13:37 +0200, alexander.kanavin@linux.intel.com
> wrote:
> > > Here are the pending updates to the 4.1 and 4.4 kerne to integrate
> > > -stable
> > > updates
> > > and to backport the mainline galileo support patches.
> > > Bruce Ashfield (3):
> > >   linux-yocto/4.4: update to v4.4.1
> > >   linux-yocto/4.1: update to v4.1.17
> > >   linux-yocto/4.1: galileo backports and support
> >
> > Shouldn't linux-libc-headers be updated to 4.4.1 at the same time?
>
> We tend to only change linux-libc-headers if there is a need to outside
> major version bumps. We have had cases where there have been fixes in
> point releases we've needed but they should be rare.
>

Absolutely, and in this case, I didn't see anything compelling in 4.4.1
that
would warrant an update. So I've left things as-is. I look at each point
upgrade
with that in mind.

Cheers,

Bruce


>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143f24a4c8cb7052b94d84d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Feb 12, 2016 at 6:28 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Fri, 2016-02-12 at 13:37 +0200, <a href=3D"mailto:alexande=
r.kanavin@linux.intel.com">alexander.kanavin@linux.intel.com</a><br>
wrote:<br>
<span class=3D"">&gt; &gt; Here are the pending updates to the 4.1 and 4.4 =
kerne to integrate<br>
&gt; &gt; -stable<br>
&gt; &gt; updates<br>
&gt; &gt; and to backport the mainline galileo support patches.<br>
&gt; &gt; Bruce Ashfield (3):<br>
&gt; &gt;=C2=A0 =C2=A0linux-yocto/4.4: update to v4.4.1<br>
&gt; &gt;=C2=A0 =C2=A0linux-yocto/4.1: update to v4.1.17<br>
&gt; &gt;=C2=A0 =C2=A0linux-yocto/4.1: galileo backports and support<br>
&gt;<br>
&gt; Shouldn&#39;t linux-libc-headers be updated to 4.4.1 at the same time?=
<br>
<br>
</span>We tend to only change linux-libc-headers if there is a need to outs=
ide<br>
major version bumps. We have had cases where there have been fixes in<br>
point releases we&#39;ve needed but they should be rare.<br></blockquote><d=
iv><br></div><div>Absolutely, and in this case, I didn&#39;t see anything c=
ompelling in 4.4.1 that=C2=A0</div><div>would warrant an update. So I&#39;v=
e left things as-is. I look at each point upgrade</div><div>with that in mi=
nd.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a1143f24a4c8cb7052b94d84d--
