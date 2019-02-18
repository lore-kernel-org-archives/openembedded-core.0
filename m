Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7757E7C86F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 16:08:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id x10so17533824wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 08:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j7waxASjyUON33MF/CJqe8FWxnqDqEtYBCoE5AGpywY=;
	b=bAW/GR4V1uaLUjemhVu1Prn2NwSpPSSIRkn/rMTcTAgK5V4ncqwPHcu+w75hfUn2HD
	/A1kHqnlzCyfO+cpSDTVr+ImO3TKUh3MP2XtF0LhQeu1wakxGdjhenG2vhPRaAaBjQfA
	tHYb12dZo/eXzgSVikIYUrviLuhEDQWX2cZZuVNpP0NM4MFHTOG73c/q/Sv+6cIEudWx
	/nI5NKdiZ1sZsfsbh8592N5NwVLk8OTwOlsedGQkSDmNDzp/tffgcd9l6Xvo8uCdLO1e
	tF4HZJzldAzsQmSOM7ZZ7Udo1O4BmWyzC6GsI54C9iv5+WQ8CW5JoydqOGrY0v9x0OgK
	PuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j7waxASjyUON33MF/CJqe8FWxnqDqEtYBCoE5AGpywY=;
	b=YbQ10k5dgy0T+5r03HSb2JfxisMSUjBl0WK8MZiPihEGQ4q9Y5lIgouNkd8O1hrcKx
	ILQiTHqUM8LWCv0Dk4+n1aZ9ckpV/vLQkkmb7otzKbjf7ptZm68zVNtQVzQl7ipMBkaJ
	GZ2F+F4nZBQqcUsQgw9rLLMKa8VHRUt6fIzQJKLtU+UC1uMDGpkTijZ0RkjzM3EdSldD
	eIjR8Z/Qz4B7jEm/P/B2h/PKcuRf2GaP2YeyN9R6R0HrtZWWL2bTB9iMj7DxuOI4QXKH
	Kz1pszoQxJvS3HChCERmeph4cYxGR4FroWwbq4MU8AAaECxowqpHMF8rgleRG0E93y8w
	5PrQ==
X-Gm-Message-State: AHQUAubfdBHkM+zHsADIE/BeWs9vRLaDQlKVD6nvHeebKElRJlFQcyAe
	l+ZqQStnArlP8/zZQooJ1giDznKCOSasXro5pWY=
X-Google-Smtp-Source: AHgI3IZ52j3Nx61X24NUvZIczX/37bNSEaz1jaHA3TCLe2WuLFQo0VZk7ajlcCM1iOEm5b2IBoJP/HUEtiIi1Zlae94=
X-Received: by 2002:a1c:2e85:: with SMTP id u127mr13382266wmu.45.1550506105029;
	Mon, 18 Feb 2019 08:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20190131065016.21887-1-raj.khem@gmail.com>
	<20190131065016.21887-6-raj.khem@gmail.com>
	<CANNYZj8VWh4ZECFQdzqR7+eS6Lh5yt1oLOBqCx7rzKNTUUWj_w@mail.gmail.com>
	<CAMKF1sqwwWS40ihF952tKBnzGvb_pO=sCZBnuU1cNJ=330mCxA@mail.gmail.com>
	<CANNYZj9QOH06p6qQRKWAjw7sDE3oPRB5XNAefUrukf_+WxdmPw@mail.gmail.com>
	<CAMKF1sokQeVRQZQNiSQaPgjQyt6m9arryp8m1FmD1wQF6VHonA@mail.gmail.com>
In-Reply-To: <CAMKF1sokQeVRQZQNiSQaPgjQyt6m9arryp8m1FmD1wQF6VHonA@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 18 Feb 2019 17:08:12 +0100
Message-ID: <CAAfyv35R2XDg1sFomVzBwZ3zSb3hcin-ChU02q2KceL_xMw0SQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] llvm: Upgrade to upcoming 8.0.0 release
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
X-List-Received-Date: Mon, 18 Feb 2019 16:08:24 -0000
Content-Type: multipart/alternative; boundary="0000000000009cd86d05822d5592"

--0000000000009cd86d05822d5592
Content-Type: text/plain; charset="UTF-8"

Ja som tiez za. Marek

On Mon, Feb 18, 2019 at 4:42 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Feb 18, 2019 at 7:15 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Mon, 18 Feb 2019 at 16:04, Khem Raj <raj.khem@gmail.com> wrote:
> > > > There is now an official git repo for llvm, which also has version
> tags:
> > > >
> > > > https://github.com/llvm/llvm-project
> > >
> > > yes there is and its intentional to use this mirror, since the
> > > llvm-project is a super repo and
> > > contains all llvm projects sources which is going to clone tonne
> > > unnecessary code.
> >
> > More than half the commits are llvm's. (llvm-only mirror repo 175k,
> > llvm super-repo 310k)
> > So it adds to the clone, but not that much.
>
> I would have preferred to use mono repo and I have no problems  using
> it since thats what we
> use in meta-clang as wella and it would make it simpler to reuse. but
> it can be a pain for other people.
>
> 310k, I am not sure what is measured here. But here is the breakdown
> of sizes for information
>
> 1.5G    .
> 676M    ./.git
> 16M     ./lld
> 51M     ./libcxx
> 3.5M    ./libclc
> 31M     ./llgo
> 32M     ./polly
> 395M    ./llvm
> 43M     ./compiler-rt
> 988K    ./pstl
> 116K    ./debuginfo-tests
> 720K    ./libunwind
> 13M     ./clang-tools-extra
> 7.3M    ./openmp
> 6.3M    ./libcxxabi
> 105M    ./lldb
> 352K    ./parallel-libs
> 155M    ./clang
>
>
> >
> > The point is something else:
> > - llvm-mirror is not an official repo, and may become stale/unmaintained
> > - llvm-mirror does not have version tags, so we can't trace commit ids
> > to the releases, or track upstream development with automatic tools
> >
> > I think these two things outweigh the extra clone overhead.
> >
> > > > I'll make a patch to switch over to that.
> > > >
> > > > Also note that final 8.0 is not yet out, so the recipe shouldn't make
> > > > it look like it is.
> > >
> > > This is intentional too.
> > > Its in rc stages and there are no specific chages espcially in
> > > versioning schemes
> > > which will mark it rc etc.
> >
> > What I mean is there is no mention whatsoever that the recipe is
> > currently building a pre-release. It's not in PV, it's not anywhere in
> > the recipe. This can mislead people.
>
> Yes it can however, we know that when next release is cut out from
> master then we will be
> on a 8.x release.
>
> >
> > Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

--0000000000009cd86d05822d5592
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ja som tiez za. Marek</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 18, 2019 at 4:42 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Feb=
 18, 2019 at 7:15 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 18 Feb 2019 at 16:04, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; There is now an official git repo for llvm, which also has v=
ersion tags:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://github.com/llvm/llvm-project" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/llvm/llvm-project</a><br>
&gt; &gt;<br>
&gt; &gt; yes there is and its intentional to use this mirror, since the<br=
>
&gt; &gt; llvm-project is a super repo and<br>
&gt; &gt; contains all llvm projects sources which is going to clone tonne<=
br>
&gt; &gt; unnecessary code.<br>
&gt;<br>
&gt; More than half the commits are llvm&#39;s. (llvm-only mirror repo 175k=
,<br>
&gt; llvm super-repo 310k)<br>
&gt; So it adds to the clone, but not that much.<br>
<br>
I would have preferred to use mono repo and I have no problems=C2=A0 using<=
br>
it since thats what we<br>
use in meta-clang as wella and it would make it simpler to reuse. but<br>
it can be a pain for other people.<br>
<br>
310k, I am not sure what is measured here. But here is the breakdown<br>
of sizes for information<br>
<br>
1.5G=C2=A0 =C2=A0 .<br>
676M=C2=A0 =C2=A0 ./.git<br>
16M=C2=A0 =C2=A0 =C2=A0./lld<br>
51M=C2=A0 =C2=A0 =C2=A0./libcxx<br>
3.5M=C2=A0 =C2=A0 ./libclc<br>
31M=C2=A0 =C2=A0 =C2=A0./llgo<br>
32M=C2=A0 =C2=A0 =C2=A0./polly<br>
395M=C2=A0 =C2=A0 ./llvm<br>
43M=C2=A0 =C2=A0 =C2=A0./compiler-rt<br>
988K=C2=A0 =C2=A0 ./pstl<br>
116K=C2=A0 =C2=A0 ./debuginfo-tests<br>
720K=C2=A0 =C2=A0 ./libunwind<br>
13M=C2=A0 =C2=A0 =C2=A0./clang-tools-extra<br>
7.3M=C2=A0 =C2=A0 ./openmp<br>
6.3M=C2=A0 =C2=A0 ./libcxxabi<br>
105M=C2=A0 =C2=A0 ./lldb<br>
352K=C2=A0 =C2=A0 ./parallel-libs<br>
155M=C2=A0 =C2=A0 ./clang<br>
<br>
<br>
&gt;<br>
&gt; The point is something else:<br>
&gt; - llvm-mirror is not an official repo, and may become stale/unmaintain=
ed<br>
&gt; - llvm-mirror does not have version tags, so we can&#39;t trace commit=
 ids<br>
&gt; to the releases, or track upstream development with automatic tools<br=
>
&gt;<br>
&gt; I think these two things outweigh the extra clone overhead.<br>
&gt;<br>
&gt; &gt; &gt; I&#39;ll make a patch to switch over to that.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Also note that final 8.0 is not yet out, so the recipe shoul=
dn&#39;t make<br>
&gt; &gt; &gt; it look like it is.<br>
&gt; &gt;<br>
&gt; &gt; This is intentional too.<br>
&gt; &gt; Its in rc stages and there are no specific chages espcially in<br=
>
&gt; &gt; versioning schemes<br>
&gt; &gt; which will mark it rc etc.<br>
&gt;<br>
&gt; What I mean is there is no mention whatsoever that the recipe is<br>
&gt; currently building a pre-release. It&#39;s not in PV, it&#39;s not any=
where in<br>
&gt; the recipe. This can mislead people.<br>
<br>
Yes it can however, we know that when next release is cut out from<br>
master then we will be<br>
on a 8.x release.<br>
<br>
&gt;<br>
&gt; Alex<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">as simple and primitive as possible<br>---------=
----------------------------------------<br>Marek Belisko - OPEN-NANDRA<br>=
Freelance Developer<br><br>Ruska Nova Ves 219 | Presov, 08005 Slovak Republ=
ic<br>Tel: +421 915 052 184<br>skype: marekwhite<br>twitter: #opennandra<br=
>web: <a href=3D"http://open-nandra.com" target=3D"_blank">http://open-nand=
ra.com</a></div>

--0000000000009cd86d05822d5592--
