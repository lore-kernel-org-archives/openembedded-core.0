Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 52B8B7833A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 20:10:19 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id e89so3606651ioi.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 13:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ovEUSqbrWTePBKU9cEu6L09Uo/S8KWqIseC8Nkq+4VE=;
	b=G69iM1WpBj/pB5kQbOpDGJf6+hff5cABwxBVeK8ucj7ZG+PIULBZg8t4DvOcNnOqFg
	0Uhj2bG5ng3RuoJQMa6DZXScxBMNzoJwuJVdeBeMDr8o2yskvaxgAFE2WLCyiXtV4qob
	sI5J3J/0opUSbF5Ovhr9Yteek3deHNojbcVMtBkb86AlH4trL/1JTNcRgF9oFVW2psti
	9E53on4zAsFFjUwMvJSZoigAVsxQjxpnhTyY1YkfKJo7kGOMEDtczQo4rHU92r2M2vg4
	64T0cQMwm9Mi0Ce7WX02oixy225zJTtoMWgJUhT4je0AembNb8sXrskhZnrdzM29WkFS
	y9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ovEUSqbrWTePBKU9cEu6L09Uo/S8KWqIseC8Nkq+4VE=;
	b=OiYywyc3MYWvKW5ywLT3hzSrYxMB4GvbvlWKyIhh0zEO8ld89ERMz9I+hA1XQphdRj
	76QCnbcCRzY0f6xlE381vbxhaOrnuYX6Nl299CHsi+2iRgl3x48bxygXNlC47m1rJ6rJ
	fAMg+t4dGiIzkZBqIieOPMY01i6Dn0I6sQwHpznH1LFVzXkaIG3aYi+9Aw3hTt/X9uZL
	C3N3uO/2EEqJTZCbABZ08OsC4a1scw1yD9zGEj5+Q6vuN2KF4NaHBKpva/DWXdmuXsl4
	SFEZjw4p7G0Fq/KE34J2mskd0oRrMFzdus4XcBM8Af7uGGRzzXCM0Zz/G/orSqO9TMW/
	ZRgQ==
X-Gm-Message-State: AMCzsaWwZiCgPefVxPtpzyipTkJNF5eI4k82qws385u/Pqd3f0M8U4xU
	fHJtpkq0xRSJbNdlv0kYl+Q7GWcTETE4bmfDcshLpg==
X-Google-Smtp-Source: AOwi7QDLB9vVfNNU97aoH5TO6aCbFoj8ts+/WTm7/25AynrU5Np4iO6FZMwu+/8aOJGf7ih5xpgBnbEYrsmRt1Tu14M=
X-Received: by 10.107.36.80 with SMTP id k77mr17150380iok.176.1508271021279;
	Tue, 17 Oct 2017 13:10:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 17 Oct 2017 13:10:00 -0700 (PDT)
In-Reply-To: <CAMKF1spgYS0YcfVrHZ8aUHtFsv90AUQRpT75vvnRvt56K3rkuA@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-5-raj.khem@gmail.com>
	<CAJTo0LZYB+FTUBLWaFEeyAz3wYMCnr+gSbySYvz0K4d3RwsvpA@mail.gmail.com>
	<CAMKF1spgYS0YcfVrHZ8aUHtFsv90AUQRpT75vvnRvt56K3rkuA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 21:10:00 +0100
Message-ID: <CAJTo0LarSyL9OGCX8SM-7mRE7qmNjq9dROiGAb86mG0vnjyEiA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] libcheck: Upgrade to 0.11.0+
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
X-List-Received-Date: Tue, 17 Oct 2017 20:10:20 -0000
Content-Type: multipart/alternative; boundary="001a1141909e72f353055bc3b652"

--001a1141909e72f353055bc3b652
Content-Type: text/plain; charset="UTF-8"

On 17 October 2017 at 20:25, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Oct 17, 2017 at 5:33 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 14 October 2017 at 16:48, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  .../libcheck/{libcheck_0.10.0.bb => libcheck_git.bb}          | 11
> >> ++++++-----
> >
> >
> > Why not 0.11.0?
> >
>
> I was getting printf format related security warnings. Latest built
> with clang/gcc and musl
>

Not a massive fan of "random SHA", can we cherry-pick the patches?

Ross

--001a1141909e72f353055bc3b652
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 October 2017 at 20:25, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Oct 17, 2017 =
at 5:33 AM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.=
burton@intel.com</a>&gt; wrote:<br>
&gt; On 14 October 2017 at 16:48, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../libcheck/{<a href=3D"http://libcheck_0.10.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libcheck_0.10.0.<wbr>bb</a> =3D&gt; <a href=3D=
"http://libcheck_git.bb" rel=3D"noreferrer" target=3D"_blank">libcheck_git.=
bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11<br>
&gt;&gt; ++++++-----<br>
&gt;<br>
&gt;<br>
&gt; Why not 0.11.0?<br>
&gt;<br>
<br>
</span>I was getting printf format related security warnings. Latest built<=
br>
with clang/gcc and musl<br></blockquote><div><br></div><div>Not a massive f=
an of &quot;random SHA&quot;, can we cherry-pick the patches?</div><div><br=
></div><div>Ross=C2=A0</div></div></div></div>

--001a1141909e72f353055bc3b652--
