Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5397824F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 12:12:24 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id k6so186725ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 04:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s3LmWyMDXBc90Oj98/VEDWQ1XLZ3FpHROob0m9OnNcM=;
	b=rCXGjgNxuuyV6cclZyUXX0qbOMtRcHFpMzpY2RRKegiM30QqrTWFWtvvTEjFcqCMsr
	2M4TNVa5283wghX+kiu02t4Jlj6aqoM5Aw0SsRa0Cg048HEWud3aVcV3K5xpM4ibUb80
	Uhz4hJ3gBGZhFVOM77x+2H3ZlkXYAQ5GdZpioZ+DWMELKFB80fCSLq1p4raIU4JYaAgk
	hwXK0laSqNJYFT6ZWEZaO3BgXTXvKMA06csf0VAr2EmSsMbL6uVyVBiQzl4m0dFa2DN8
	UxQX34UFhkt8rvs/yx8M1bxRS/ZmED7udUCTx/sHWiP8lGj4z/7ZtNY6RR78Hn6k7lXX
	Aevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s3LmWyMDXBc90Oj98/VEDWQ1XLZ3FpHROob0m9OnNcM=;
	b=el4LqXYCnjz5UBxUxMQISyUsbH05pyuk/Cmkevnk+H8FlCFLXpL9PVbMwqxRa6GIRC
	/ojKmHHZphOmNhwoUp5fEFI2tmpXduJpOu/GbhIbxF4A0Bh4cy5n8b6heF6LvY8LwouO
	rHN5bO4R22lgJeiDrbUjx7bERc76NKC5AUOAKbU+zqCwOuX+QEo2A7/w1usKMrV5wxLX
	toIYrEUmnEmJjjJQcF6Dbd8YKpAthJ7eaJgSmK1CVsxni1qk35WdxjL/krkELWU7Lal9
	Q9VOR2164MhqNFSw0dNE3RFOeRZ1hCcjLUQb91Ktye78efcSK/IJ9RSQoElxAr6tDKAz
	SlxA==
X-Gm-Message-State: APf1xPBnqjYmmZ19PDVtmh9XS5u0wsen3l3Ug6CkbCI2MyL7YOvvMr4s
	hn512VVJ2ZGfvOOgo7Uy/SsuE3PvY6nMKp5HERmdsg==
X-Google-Smtp-Source: AH8x227H5s8570dhfSLLuCJZKLNAesM6own+c5VI2tSt/3PdctVE5Q4MUCADiHYOUlUfORa8I5RexMnzEniM6NbRWwk=
X-Received: by 10.36.182.14 with SMTP id g14mr3037401itf.124.1518696745865;
	Thu, 15 Feb 2018 04:12:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 15 Feb 2018 04:12:05 -0800 (PST)
In-Reply-To: <CAMKF1sp8riyhF=6N_ak-TyZ6_w=aj+az=qx+mjepXPQagV7vqw@mail.gmail.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
	<aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
	<CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
	<CAMKF1sp8riyhF=6N_ak-TyZ6_w=aj+az=qx+mjepXPQagV7vqw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Feb 2018 12:12:05 +0000
Message-ID: <CAJTo0LYEO1e2i_dnXDT7sNRyScH_KT3Ge38yWundnr2hk3de9g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Thu, 15 Feb 2018 12:12:25 -0000
Content-Type: multipart/alternative; boundary="089e0820475c0f6bcc05653f24fc"

--089e0820475c0f6bcc05653f24fc
Content-Type: text/plain; charset="UTF-8"

Yes, that's it.

Ross

On 12 February 2018 at 07:32, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > Getting there: https://autobuilder.yocto.io/tgrid
> >
> > Just two actual problems:
> > - The non-gplv3 build failed as the make fix needs to be backported to
> > meta-gplv2
> > - The eSDK selftests all failed with en_US.UTF-8 problems, the new glibc
> > shouldn't be causing a problem with uninative so this is interesting,
> maybe
> > the new one is behaving slightly differently.  Should be easy to
> replicate.
> > The same problem caused selftest to fail.
> >
>
> is the UTF error like this one
> https://gist.github.com/25a84d23618824f0e5e6857a960eaca4
>
> > Ross
>

--089e0820475c0f6bcc05653f24fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, that&#39;s it.<div><br></div><div>Ross</div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 12 February 2018 =
at 07:32, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><span class=3D"">On Sat, Feb 3, 2018 at 2:21 AM, Burt=
on, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com=
</a>&gt; wrote:<br>
&gt; Getting there: <a href=3D"https://autobuilder.yocto.io/tgrid" rel=3D"n=
oreferrer" target=3D"_blank">https://autobuilder.yocto.io/<wbr>tgrid</a><br=
>
&gt;<br>
&gt; Just two actual problems:<br>
&gt; - The non-gplv3 build failed as the make fix needs to be backported to=
<br>
&gt; meta-gplv2<br>
&gt; - The eSDK selftests all failed with en_US.UTF-8 problems, the new gli=
bc<br>
&gt; shouldn&#39;t be causing a problem with uninative so this is interesti=
ng, maybe<br>
&gt; the new one is behaving slightly differently.=C2=A0 Should be easy to =
replicate.<br>
&gt; The same problem caused selftest to fail.<br>
&gt;<br>
<br>
</span>is the UTF error like this one<br>
<a href=3D"https://gist.github.com/25a84d23618824f0e5e6857a960eaca4" rel=3D=
"noreferrer" target=3D"_blank">https://gist.github.com/<wbr>25a84d23618824f=
0e5e6857a960eac<wbr>a4</a><br>
<br>
&gt; Ross<br>
</blockquote></div><br></div>

--089e0820475c0f6bcc05653f24fc--
