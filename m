Return-Path: <srifenbark@gmail.com>
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC1674D31
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 13:30:13 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id j27-v6so24458970ota.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jToHcx/DpL5YHGdS04735Rsfk6asLm4YM6015sBYNOs=;
	b=SdBiSmrNxjcnQBdj6xiBZNQZB6hrdnZH7wGVv5ZqJGsHaJ8xfHqU7PyO8lEeklZSCN
	++/lh+q2Ln73G+jS3os/Fsh608mjiWFv/CkbDIXfay7SU2hSLgApv+3pOwfF+HHBxjNr
	uGGAhbDwxE6xXYo732J9rbuh4k7dj1H3TYBkC3NTsx5Qmq0gzo0jfzA06rofeY35kDWC
	RIz7WYtlvB5cP9qYQUALBc77z8VcIYJZfy3e5W1hW3T4kH5gCQkF12Pt9/Va4Oeof29X
	pztLlplgyNaV5YXn+y9aNy9Ip+0ZMWciq5FP189bwY0WsCgMLCD4T08Rr+AOau13PQeC
	1XTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jToHcx/DpL5YHGdS04735Rsfk6asLm4YM6015sBYNOs=;
	b=Lre5QVMZ1SNNb35qjQPzNQayTb84+46bSDS7wfiGPwdoNOK9Sxbg9QugOTWtWi/JuZ
	GGHLasfPxUIFcYRMOPTt/AMLwq+8zeZ1DVIblSSR3OWKsRIKhHxYbWZHUFUMyr1GZBJp
	Hgg/i2ueF15Pvh1t5GW7Q9Yv5S/W8HgddBlSEWkRaRDVBhyK6ibVrC9ydBag0meCAG/q
	gdtqwNArkFmmOUdMr7APfYBSGnImJtPlE3Yr63MLq0d/EEqUwvOflLqfAntS4RiT4fm5
	rzw7MUfLo4Sipzk4gXQgJZtnIwZLbmq72MCA3cwLzzcChvKMuQPacfFz9qtCD0uI0b13
	6EWQ==
X-Gm-Message-State: ALQs6tCjVrCNrD5goZV/1t/Es4xHMCswJ1naQRnY/a35uZc3iBcaOYTv
	1SkRXO19YIxR71VfqfWi8JcNRbGBCVNrWXKvgiE=
X-Google-Smtp-Source: AB8JxZqZbNDOfeF9aLIMIkLemm9hV20UHf6pZ+jlaZdvc/vtaNX4HrIuJ3+UAt9xAeaSW1L/PtOn2yqQbG0QhBzOe/I=
X-Received: by 2002:a9d:1f70:: with SMTP id
	x45-v6mr20023888otx.144.1525440614909; 
	Fri, 04 May 2018 06:30:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7009:0:0:0:0:0 with HTTP;
	Fri, 4 May 2018 06:30:14 -0700 (PDT)
In-Reply-To: <CAJO0J4gTTHfnYRqr0BU14A6hgE_GHWrvM0UzbrLe0GwMu7n6WA@mail.gmail.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-14-alexander.kanavin@linux.intel.com>
	<CAJO0J4hyjRyj+Zzz2Y7BTg0aB-dfEQXX4pJSi11n4Vc2iYkrJw@mail.gmail.com>
	<CAJTo0LZSDUfpXvE9VA59wZVyTJFDW4sixh++DrdWdORrLKz4NA@mail.gmail.com>
	<CAJO0J4gTTHfnYRqr0BU14A6hgE_GHWrvM0UzbrLe0GwMu7n6WA@mail.gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Fri, 4 May 2018 06:30:14 -0700
Message-ID: <CAFNP8OsJ=_u_f8zkWAaz-sqjvLhVCSNnDv0-HWHMYSR=LWvp7Q@mail.gmail.com>
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/14] babeltrace: switch over to git
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
X-List-Received-Date: Fri, 04 May 2018 13:30:14 -0000
Content-Type: multipart/alternative; boundary="000000000000fa49b8056b6151ea"

--000000000000fa49b8056b6151ea
Content-Type: text/plain; charset="UTF-8"

Obviously that class (devupstream.bbclass) is not in the YP reference
manual.  I will open a bug to document it.

Scott

On Fri, May 4, 2018 at 6:12 AM, Paulo Neves <ptsneves@gmail.com> wrote:

> On Fri, May 4, 2018 at 2:55 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 4 May 2018 at 13:46, Paulo Neves <ptsneves@gmail.com> wrote:
> >>
> >> I always wondered, what is the rationale for not always using the git
> >> repositories? If there is one why did we change for this specific
> >> recipe?
> >
> >
> > Tarballs are easier to mirror, smaller, have checksums to verify the
> > download at both fetch and unpack time, and often contain generated files
> > which otherwise require yet more tools to regenerate (for example, man
> pages
> > may require a documentation toolchain to build from git but will be
> included
> > in a tarball).
> In my case we have a requirement of using the git repositories because
> of the easiness with which we can make code bissections, as well as
> back porting.
>
> >>
> >> I ask this because I am in the process of creating a massive layer,
> >> whose only purpose is to have the software come from the git
> >> repository and not from the tarballs of the original poky recipes.
> >
> >
> > I certainly hope this is using devupstream.bbclass or similar and isn't a
> > giant copy/paste!
> Wow never heard/saw of this bbclass even, and looking at the mega
> manual there is not any reference to this class. Also from the look of
> the classcode I am not seeing how this can help us accomplish the
> goal. Can you point me to some docs or examples?
>
> > Ross
>
> The way we are doing the layer is, by bbappend, so there is not much
> copy paste, but tarbal/git replacement.
> There would be no problem if there would not be differences between
> released tarballs and git repositories, but specially in autotools
> projects, the bbappend requires much more trickery as you mentioned
>
> Paulo Neves
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000fa49b8056b6151ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Obviously that class (devupstream.bbclass) is not in =
the YP reference manual.=C2=A0 I will open a bug to document it.<br><br></d=
iv>Scott<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Fri, May 4, 2018 at 6:12 AM, Paulo Neves <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ptsneves@gmail.com" target=3D"_blank">ptsneves@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, May 4, 2018 at 2:5=
5 PM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton=
@intel.com</a>&gt; wrote:<br>
&gt; On 4 May 2018 at 13:46, Paulo Neves &lt;<a href=3D"mailto:ptsneves@gma=
il.com">ptsneves@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I always wondered, what is the rationale for not always using the =
git<br>
&gt;&gt; repositories? If there is one why did we change for this specific<=
br>
&gt;&gt; recipe?<br>
&gt;<br>
&gt;<br>
&gt; Tarballs are easier to mirror, smaller, have checksums to verify the<b=
r>
&gt; download at both fetch and unpack time, and often contain generated fi=
les<br>
&gt; which otherwise require yet more tools to regenerate (for example, man=
 pages<br>
&gt; may require a documentation toolchain to build from git but will be in=
cluded<br>
&gt; in a tarball).<br>
In my case we have a requirement of using the git repositories because<br>
of the easiness with which we can make code bissections, as well as<br>
back porting.<br>
<br>
&gt;&gt;<br>
&gt;&gt; I ask this because I am in the process of creating a massive layer=
,<br>
&gt;&gt; whose only purpose is to have the software come from the git<br>
&gt;&gt; repository and not from the tarballs of the original poky recipes.=
<br>
&gt;<br>
&gt;<br>
&gt; I certainly hope this is using devupstream.bbclass or similar and isn&=
#39;t a<br>
&gt; giant copy/paste!<br>
Wow never heard/saw of this bbclass even, and looking at the mega<br>
manual there is not any reference to this class. Also from the look of<br>
the classcode I am not seeing how this can help us accomplish the<br>
goal. Can you point me to some docs or examples?<br>
<br>
&gt; Ross<br>
<br>
The way we are doing the layer is, by bbappend, so there is not much<br>
copy paste, but tarbal/git replacement.<br>
There would be no problem if there would not be differences between<br>
released tarballs and git repositories, but specially in autotools<br>
projects, the bbappend requires much more trickery as you mentioned<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Paulo Neves<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--000000000000fa49b8056b6151ea--
