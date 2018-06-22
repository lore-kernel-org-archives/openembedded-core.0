Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 69C9C75569
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 21:12:46 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id k16-v6so7932102wro.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 14:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3S63vcfDuo6lvWAqnB4HjmkQu6yvS5zZ2cPpELnUaf0=;
	b=aCe6AIm2SyXWwtR9mPwYI6oAL6wFq4bMXIiqv2csgqog6HAl99hetBjJiNNXhcO83n
	LLqHMJTZS3h/9YtuErFe2Gv3yr47jAYLX3z/lJ9Kj1fNaMkE0zKb/vSbafti5Hi5Qylx
	V6IgEUN6iMVs6m2V+wabZy8zGyzYmjcLDoj1AskJkOpS1BdR+E6SwuGbjepln8t/qbkM
	voO0p8yIH/Kim21/Ll59MzelojB9CwW822F80xHcb0/Yk8a3NyRZLFKCeaqiW6vSVK1t
	P+MqU1z2rQRLy3rDWoViM7fAqMJP4D7K+UjbwgeFlkNiFaJHqgD1MQCBx7wZouSVpGQg
	wRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3S63vcfDuo6lvWAqnB4HjmkQu6yvS5zZ2cPpELnUaf0=;
	b=KHUTv0K8GXSS2G0dpzG7lEqszhl+RcQTRAt9J9FsA2KS5grstwlmbCi/+VTOm+t6Cg
	dpbmV7oeZtSTgRroEu0/ViiSv11WWUaR2O3n8z4tisrmhAff3toqiMP/X09xqaDWd+v8
	/CgRoiV+dlTbGHIg2YVxI+G4ZVg4eJKmssfJ3/cg5dyCASx/Cl4YscTnOYWalQqtsUyW
	wVJgsQVJ5tkpyL7snQv7eZTzeKmp+Lk13yQ4UuIxmjzYGWgVT1RJc1+uoPSuAqWsrMFy
	Vrarnc0CzFBZgMPcr9V/DrS1dhtwEKX3Z5fbvmaw50tCRnppkAqrYN2e0gVsik3ZXPHP
	AOog==
X-Gm-Message-State: APt69E0uEg9uGw1WyeTU6ysF+cuzDgvSWTgV7fPNA2PtOVXnVKG0oakK
	CkB6omvrygPr6ZDsHp7f7+tHPmd30ZSBmUv6wKU=
X-Google-Smtp-Source: AAOMgpcAp2jSW6fpVuGqnbb6/k4dgQOhbTHl15bsKFMW/C/sR715/3EdL1SlTohOSokUIfEu1Js+iksHqWdU1GTV7nI=
X-Received: by 2002:a5d:4141:: with SMTP id
	c1-v6mr2646984wrq.129.1529701967190; 
	Fri, 22 Jun 2018 14:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180622192316.235356-1-joe.slater@windriver.com>
	<CA+chaQdiOW9FqcaBnk95MNba=w_LSH0LP3nNATyK5c4nwf6WkQ@mail.gmail.com>
	<CAMKF1sqS=gezXr5ibD+A3Zq-dEaZOjWcTHyyOmxKQO8r+iE8jQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqS=gezXr5ibD+A3Zq-dEaZOjWcTHyyOmxKQO8r+iE8jQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Jun 2018 23:12:35 +0200
Message-ID: <CA+chaQeoHMmaHCDZO5kzqz8r-njvg6t1dbv6GuYrMVQ84vX3dA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] mdadm: fix format-overflow
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
X-List-Received-Date: Fri, 22 Jun 2018 21:12:46 -0000
Content-Type: multipart/alternative; boundary="0000000000005de35f056f417e4e"

--0000000000005de35f056f417e4e
Content-Type: text/plain; charset="UTF-8"

Too late I've noticed that it's the same size, but in different file,
surprisingly I haven't seen the failure in  Detail.c only in the super0.c.
Maybe it's different issue, but I don't know how to reproduce this one.

But of course, 4 bytes is terrible waste :).

On Fri, Jun 22, 2018 at 11:07 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Jun 22, 2018 at 12:56 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > See https://patchwork.openembedded.org/patch/151888/
> >
>
> yeah Martin is frugal with the extra space :)  using 16 probably provides
> some benefits of data being aligned hard to say
>
> > On Fri, Jun 22, 2018 at 9:24 PM Joe Slater <joe.slater@windriver.com>
> wrote:
> >>
> >> nb[] is not quite big enough.
> >>
> >> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> >> ---
> >>  .../0002-mdadm-Specify-enough-length-when-write-to-buffer.patch     |
> 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git
> a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
> b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
> >> index cbce053..6bbe8f4 100644
> >> ---
> a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
> >> +++
> b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch
> >> @@ -24,6 +24,10 @@ Change the length to 47.
> >>
> >>  Signed-off-by: Xiao Ni <xni@redhat.com>
> >>  Signed-off-by: Jes Sorensen <Jes.Sorensen@gmail.com>
> >> +
> >> +nb[] actually needs to be at least 12, but we will make it 16.
> >> +
> >> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> >>  ---
> >>  Upstream-Status: Backport
> >>   Detail.c | 2 +-
> >> @@ -53,7 +57,7 @@ index 938cfd9..f5b4507 100644
> >>                 mdp_disk_t *dp;
> >>                 char *dv;
> >>  -              char nb[5];
> >> -+              char nb[11];
> >> ++              char nb[16];
> >>                 int wonly, failfast;
> >>                 if (d>=0) dp = &sb->disks[d];
> >>                 else dp = &sb->this_disk;
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005de35f056f417e4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Too late I&#39;ve noticed that it&#39;s the same size, but=
 in different file, surprisingly I haven&#39;t seen the failure in=C2=A0<sp=
an style=3D"text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline"><span>=C2=A0</span>Detail.c only in the super0.c. M=
aybe it&#39;s different issue, but I don&#39;t know how to reproduce this o=
ne.</span><div><span style=3D"text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline"><br></span></div><div><span style=
=3D"text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">But of course, 4 bytes is terrible waste :).</span></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jun 22, 2018 at=
 11:07 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Jun 22,=
 2018 at 12:56 PM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com=
" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; See <a href=3D"https://patchwork.openembedded.org/patch/151888/" rel=
=3D"noreferrer" target=3D"_blank">https://patchwork.openembedded.org/patch/=
151888/</a><br>
&gt;<br>
<br>
yeah Martin is frugal with the extra space :)=C2=A0 using 16 probably provi=
des<br>
some benefits of data being aligned hard to say<br>
<br>
&gt; On Fri, Jun 22, 2018 at 9:24 PM Joe Slater &lt;<a href=3D"mailto:joe.s=
later@windriver.com" target=3D"_blank">joe.slater@windriver.com</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt; nb[] is not quite big enough.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriv=
er.com" target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../0002-mdadm-Specify-enough-length-when-write-to-buffer.pa=
tch=C2=A0 =C2=A0 =C2=A0| 6 +++++-<br>
&gt;&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-=
enough-length-when-write-to-buffer.patch b/meta/recipes-extended/mdadm/file=
s/0002-mdadm-Specify-enough-length-when-write-to-buffer.patch<br>
&gt;&gt; index cbce053..6bbe8f4 100644<br>
&gt;&gt; --- a/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-=
length-when-write-to-buffer.patch<br>
&gt;&gt; +++ b/meta/recipes-extended/mdadm/files/0002-mdadm-Specify-enough-=
length-when-write-to-buffer.patch<br>
&gt;&gt; @@ -24,6 +24,10 @@ Change the length to 47.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 Signed-off-by: Xiao Ni &lt;<a href=3D"mailto:xni@redhat.com"=
 target=3D"_blank">xni@redhat.com</a>&gt;<br>
&gt;&gt;=C2=A0 Signed-off-by: Jes Sorensen &lt;<a href=3D"mailto:Jes.Sorens=
en@gmail.com" target=3D"_blank">Jes.Sorensen@gmail.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +nb[] actually needs to be at least 12, but we will make it 16.<br=
>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windri=
ver.com" target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
&gt;&gt;=C2=A0 ---<br>
&gt;&gt;=C2=A0 Upstream-Status: Backport<br>
&gt;&gt;=C2=A0 =C2=A0Detail.c | 2 +-<br>
&gt;&gt; @@ -53,7 +57,7 @@ index 938cfd9..f5b4507 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mdp_d=
isk_t *dp;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char =
*dv;<br>
&gt;&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char nb[5]=
;<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char nb[11];<br=
>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char nb[16];<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int w=
only, failfast;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (d=
&gt;=3D0) dp =3D &amp;sb-&gt;disks[d];<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else =
dp =3D &amp;sb-&gt;this_disk;<br>
&gt;&gt; --<br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000005de35f056f417e4e--
