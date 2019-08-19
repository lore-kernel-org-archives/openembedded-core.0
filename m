Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 71C527EC56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 15:09:54 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id l9so2244643qtu.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=enYnctEXB9nD80SxC/WRg24MPatlb/dTEHDkQoFXNHU=;
	b=eT5N5DbHCBGQKjA+ehr22QIF14Ci65KCYofP8nCMtyysjNA5IJGkMFQUt7alJHLMPt
	OnapLwQ+H61kalPa1jV85HJFwGX92n/OaLwALdXKeIiRN9Yv//B5K+nvzJmyUHQ0Lqga
	FWkZ5daxNBn93kR51zS9wXLTdG2qzcwgoM+waDFdUuqCIjJpHa3AlSLV8rzSfkqbf8KZ
	kUj1U24pL6iV5buqWVgtK2QvFPB8UZzZTvC5WGGD+HOVCzMNBXTjtD+bz3CvxP0GKM0s
	OKdETManGmgWDvTW9XVUlPAb1VxL4Limf/jonr8H3ss8HGiWTtLkzzthkSTmdYTL8xWQ
	zuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=enYnctEXB9nD80SxC/WRg24MPatlb/dTEHDkQoFXNHU=;
	b=Sh/r942ajj7e0EG3gk6dEJddTR+DUVbwy9H76megGFdEqKZTQIvqzQveoL3X5rSDRk
	4qmYDgeck3DJnZvneZZ18QrnGQTAgJupkGMaINySiS0zkClJWHqpfjNF/9VjGgWUKtbf
	XpXUgKGfa73LG/MA32EFU6ydFLaUZYmyASB3k9p2IbeRv3OtOxkiBan6pKut7BoY9ctB
	HE+0iezrW4e/sf5zWhM3PHa9xd3hv4qKe7gGhB9fMzNYLgKqBKDvhk6pTORmU2q8r4Bl
	pnhqWDSiM05viROyN7sZlIe6W17MT8OXMwhx6ILlVSCU8Dl0NLplRvQD23nzVDApLQuX
	jNug==
X-Gm-Message-State: APjAAAXelogIYPqFMiP6cviaqqkrSFIPNz8HF1JgIE/wKrLnOM3UJ3YX
	MWLBRbv3nE/PE3RMP46apDj5Q2AM9M9PQggPk/Q=
X-Google-Smtp-Source: APXvYqyoji83UzZ4lRftj3+SWqi397WPiF2HO1IxK1j/qLs9Sg4CFCVqJIOTOcxfthwq3QhmOhOvSDBvqLMMjM7wO/w=
X-Received: by 2002:ac8:2cd6:: with SMTP id 22mr20793832qtx.80.1566227394913; 
	Mon, 19 Aug 2019 08:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190814222921.34551-1-raj.khem@gmail.com>
	<b3f880cd-422a-a0ef-db42-6e44364ab06e@gmail.com>
	<CAMKF1sqQLs_Rey6XCoH5AGMx5=-n-XrspEgrh=zrmF-eDtB2Eg@mail.gmail.com>
	<3bf454c4-0ab2-8020-76cf-74e77f4a0ab6@intel.com>
In-Reply-To: <3bf454c4-0ab2-8020-76cf-74e77f4a0ab6@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Aug 2019 08:09:44 -0700
Message-ID: <CAMKF1spqt7YX6o=C+shdQyyrkGx0WcwSCqG4F91X9_6mkgc4_g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libffi: Upgrade to 3.3-rc0
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
X-List-Received-Date: Mon, 19 Aug 2019 15:09:54 -0000
Content-Type: multipart/alternative; boundary="00000000000082ea26059079bbe7"

--00000000000082ea26059079bbe7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 7:31 AM Ross Burton <ross.burton@intel.com> wrote:

> On 14/08/2019 23:46, Khem Raj wrote:
> > On Wed, Aug 14, 2019 at 3:42 PM akuster808 <akuster808@gmail.com> wrote=
:
> >>
> >>
> >>
> >> On 8/14/19 3:29 PM, Khem Raj wrote:
> >>> libffi 3.1 release has been a bit aged and new architectures, compile=
rs
> >>> have since been come on stage to compile it, we have been carrying
> >>> patches, but its better to use the latest 3.3 rc0 which has lot of
> these
> >>> issues handled and is in good shape.
> >>
> >> Will the RC part cause the PE to be invoked when 3.3 comes out?  I did
> >> this on wireshark and shot myself in the foot.
> >>
> >
> > I am expecting the releases to be 3.3.0  but looking into the history
> > of releases it
> > could be 3.3 so yes you are right, Probably I will renable the recipe
> > to libffi_3.2+3.3-rc0.bb
> > and that should fix this
>
> Set the PV to 3.3~rc0 and 3.3 will sort after it.


I thinking using + terminology is familiar in OE world let=E2=80=99s stick =
to it

>
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000082ea26059079bbe7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto"><br></div></div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 19, 2019 at 7:31 AM Ross =
Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 14/08/2019 23:46, =
Khem Raj wrote:<br>
&gt; On Wed, Aug 14, 2019 at 3:42 PM akuster808 &lt;<a href=3D"mailto:akust=
er808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 8/14/19 3:29 PM, Khem Raj wrote:<br>
&gt;&gt;&gt; libffi 3.1 release has been a bit aged and new architectures, =
compilers<br>
&gt;&gt;&gt; have since been come on stage to compile it, we have been carr=
ying<br>
&gt;&gt;&gt; patches, but its better to use the latest 3.3 rc0 which has lo=
t of these<br>
&gt;&gt;&gt; issues handled and is in good shape.<br>
&gt;&gt;<br>
&gt;&gt; Will the RC part cause the PE to be invoked when 3.3 comes out?=C2=
=A0 I did<br>
&gt;&gt; this on wireshark and shot myself in the foot.<br>
&gt;&gt;<br>
&gt; <br>
&gt; I am expecting the releases to be 3.3.0=C2=A0 but looking into the his=
tory<br>
&gt; of releases it<br>
&gt; could be 3.3 so yes you are right, Probably I will renable the recipe<=
br>
&gt; to libffi_3.2+<a href=3D"http://3.3-rc0.bb" rel=3D"noreferrer" target=
=3D"_blank">3.3-rc0.bb</a><br>
&gt; and that should fix this<br>
<br>
Set the PV to 3.3~rc0 and 3.3 will sort after it.</blockquote><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I thinking using + terminology is familiar=
 in OE world let=E2=80=99s stick to it=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><br>
<br>
Ross<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000082ea26059079bbe7--
