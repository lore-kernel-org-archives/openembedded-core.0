Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id DC2887E507
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 02:53:13 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m24so954467ljg.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 19:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KwE77xgdYpkklxrLrfZuakx+oXYy/eQ8Yndm1WEhazI=;
	b=kFONjju8c/fYQeeCVN/bsfbHQ5On5c2pGbaHYZSwgEZaOFsUe0ppH+7H7KpgVnE4nl
	V6fQzZS0KsuKaKYGlLkPdHYXLZDOpkA2VL6rOGfN+Jj2WAPvTk/VfNIVBF69B0bV63ia
	aqLI3JVjrfyAzSzaSl97HrhuDUeGGp9p/KHX6IDft42s6hTGYFmRSPUo2VoE7r+/JtIQ
	QN2jgQz2PQBQCyzeE6Z5cxwxjL8zFppK55lE1bqDUmBIWELrDtEWvh7T1RIxi1VEMKDM
	gjoKKh7VhsuJlGSg5K0rkk6j4Ngo1gXXMCCLVkS0hw1M08dB2GufltSwWsh2hYdjIRxd
	qKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KwE77xgdYpkklxrLrfZuakx+oXYy/eQ8Yndm1WEhazI=;
	b=OibipEq2XUDTCF/mPB/Zuhgq4Qm5bJKCq6tL+OP0idc+sp7cf3siC2YI40QUHzKoKa
	GK17NHgdhRUw8IQup4qpt1iY6i6FcofdljNC4jvJjEMyIxiRCDd4lTA8uZ8Vd/GBmPbC
	ALlHGSB0roz2vq/HZvzJfCf2Krbn6iUtJUI2GUJzDOTapbUEs4kBgVckR3Y566KPQFyw
	826UMiZLiIFhAso7nqLRYOEPLZBFYlFCFV5DsjRN4VARSNwLyPsIFCgvxEd8obJYq0D0
	mIV0h3PSVn9nheSzGw/OwCtFj8ja5dReyZt0Oy3ySjlFra+u0TJTvK5E1JlV3N8K0Uy2
	H2lQ==
X-Gm-Message-State: APjAAAV5pTlkahY2cN+sYK1FHntS7vOPCcK0uTa6gtXYnYj3XQ62CsBM
	wAbzgraJo8TaBGH2aTKvpHe6Pnx7Eq1YIqtgm1VTHj2B
X-Google-Smtp-Source: APXvYqyRXF6abWw2XaHmJEIsFHLHoMuPeHSzUQfqhAWQomXuEZJKeOEuR4MUQDu4k93tEJ/fwvi8zKgwtUr8hfoGNrw=
X-Received: by 2002:a2e:b048:: with SMTP id d8mr24283334ljl.118.1565751194138; 
	Tue, 13 Aug 2019 19:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <1565674414-112937-1-git-send-email-hongzhi.song@windriver.com>
	<CADkTA4PCeER9wP28NOaUtKEFBLKmqUfda7Cz+M0q2cgp5DiYew@mail.gmail.com>
	<abef39b8-e8b0-db67-70e7-da17666d1056@windriver.com>
In-Reply-To: <abef39b8-e8b0-db67-70e7-da17666d1056@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2019 22:53:02 -0400
Message-ID: <CADkTA4Nwi1sSu-W2asM0SXUEhHE94jAEQcSWoCsW7f9ThWP4Tw@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: cp Documentation/ to sdk kernel
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
X-List-Received-Date: Wed, 14 Aug 2019 02:53:14 -0000
Content-Type: multipart/alternative; boundary="000000000000bbbbab05900adb5a"

--000000000000bbbbab05900adb5a
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 9:59 PM Hongzhi, Song <hongzhi.song@windriver.com>
wrote:

>
> On 8/13/19 8:27 PM, Bruce Ashfield wrote:
> >
> >
> > On Tue, Aug 13, 2019 at 1:35 AM Hongzhi.Song
> > <hongzhi.song@windriver.com <mailto:hongzhi.song@windriver.com>> wrote:
> >
> >     A new patch let kernel source Documentation/Kconfig in top Kconfig
> >     So kernel-devsrc should include Documentation/ too.
> >     Otherwise "make scripts" will fails.
> >
> >     patch:
> >     commit b1663d7e3a7961fc45262fd68a89253f2803036c
> >     Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org
> >     <mailto:mchehab%2Bsamsung@kernel.org>>
> >     Date:   Tue Jun 4 09:26:27 2019 -0300
> >
> >         docs: Kbuild/Makefile: allow check for missing docs at build time
> >
> >         While this doesn't make sense for production Kernels, in order to
> >         avoid regressions when documents are touched, let's add a
> >         check target at the make file.
> >
> >         Signed-off-by: Mauro Carvalho Chehab
> >     <mchehab+samsung@kernel.org <mailto:mchehab%2Bsamsung@kernel.org>>
> >         Signed-off-by: Jonathan Corbet <corbet@lwn.net
> >     <mailto:corbet@lwn.net>>
> >
> >     Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com
> >     <mailto:hongzhi.song@windriver.com>>
> >     ---
> >      meta/recipes-kernel/linux/kernel-devsrc.bb
> >     <http://kernel-devsrc.bb> | 2 +-
> >      1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >     diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >     <http://kernel-devsrc.bb>
> >     b/meta/recipes-kernel/linux/kernel-devsrc.bb <
> http://kernel-devsrc.bb>
> >     index 5ec5929..a874e06 100644
> >     --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >     <http://kernel-devsrc.bb>
> >     +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >     <http://kernel-devsrc.bb>
> >     @@ -65,7 +65,7 @@ do_install() {
> >          )
> >
> >          # then drop all but the needed Makefiles/Kconfig files
> >     -    rm -rf $kerneldir/build/Documentation
> >     +    #rm -rf $kerneldir/build/Documentation
> >
> >
> > In the spirit of keeping kernel-devsrc as small as possible (I have
> > another patch pending if you really want the full kernel source), this
> > should only keep the Documentation/ files that are required to pass
> > the check, not keep all of Documentation.
>
>
> If you have a better patch, I am pleasure to accept it.
>

???

This is where you'd typically do a v2 of the patch after getting a review
of a change.

But if you are refusing the feedback, then yes, I'll do a version of the
patch myself rather than just blindly copying in all of the documentation.
I'll submit it myself.

RP/Ross, whoever is taking in patches, drop this version, and I'll do my
own.

Cheers,

Bruce



>
> Thanks,
>
> --Hongzhi
>
>
> > Bruce
> >
> >          rm -rf $kerneldir/build/scripts
> >          rm -rf $kerneldir/build/include
> >
> >     --
> >     2.8.1
> >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000bbbbab05900adb5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 13, 2019 at 9:59 PM Hongzhi, Song &lt;<=
a href=3D"mailto:hongzhi.song@windriver.com">hongzhi.song@windriver.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 8/13/19 8:27 PM, Bruce Ashfield wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Aug 13, 2019 at 1:35 AM Hongzhi.Song <br>
&gt; &lt;<a href=3D"mailto:hongzhi.song@windriver.com" target=3D"_blank">ho=
ngzhi.song@windriver.com</a> &lt;mailto:<a href=3D"mailto:hongzhi.song@wind=
river.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;&gt; wrote:<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0A new patch let kernel source Documentation/Kconfig=
 in top Kconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0So kernel-devsrc should include Documentation/ too.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Otherwise &quot;make scripts&quot; will fails.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0patch:<br>
&gt;=C2=A0 =C2=A0 =C2=A0commit b1663d7e3a7961fc45262fd68a89253f2803036c<br>
&gt;=C2=A0 =C2=A0 =C2=A0Author: Mauro Carvalho Chehab &lt;<a href=3D"mailto=
:mchehab%2Bsamsung@kernel.org" target=3D"_blank">mchehab+samsung@kernel.org=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mchehab%252Bsamsung@ke=
rnel.org" target=3D"_blank">mchehab%2Bsamsung@kernel.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Date:=C2=A0 =C2=A0Tue Jun 4 09:26:27 2019 -0300<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 docs: Kbuild/Makefile: allow check fo=
r missing docs at build time<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 While this doesn&#39;t make sense for=
 production Kernels, in order to<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 avoid regressions when documents are =
touched, let&#39;s add a<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 check target at the make file.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Signed-off-by: Mauro Carvalho Chehab<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:mchehab%2Bsamsung@kernel.org"=
 target=3D"_blank">mchehab+samsung@kernel.org</a> &lt;mailto:<a href=3D"mai=
lto:mchehab%252Bsamsung@kernel.org" target=3D"_blank">mchehab%2Bsamsung@ker=
nel.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Signed-off-by: Jonathan Corbet &lt;<a=
 href=3D"mailto:corbet@lwn.net" target=3D"_blank">corbet@lwn.net</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:corbet@lwn.net" target=
=3D"_blank">corbet@lwn.net</a>&gt;&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:h=
ongzhi.song@windriver.com" target=3D"_blank">hongzhi.song@windriver.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongzhi.song@windriver=
.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-kernel/linux/<a href=3D"http://k=
ernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kernel-devsrc.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt; | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 1 insertion(+), 1 deletion(-)=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-kernel/linux/<a href=3D"h=
ttp://kernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.=
bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kernel-devsrc.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-kernel/linux/<a href=3D"http://kerne=
l-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> &lt;=
<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">ht=
tp://kernel-devsrc.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 5ec5929..a874e06 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-kernel/linux/<a href=3D"http://k=
ernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kernel-devsrc.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-kernel/linux/<a href=3D"http://k=
ernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kernel-devsrc.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -65,7 +65,7 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0# then drop all but the needed =
Makefiles/Kconfig files<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 rm -rf $kerneldir/build/Documentatio=
n<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 #rm -rf $kerneldir/build/Documentati=
on<br>
&gt;<br>
&gt;<br>
&gt; In the spirit of keeping kernel-devsrc as small as possible (I have <b=
r>
&gt; another patch pending if you really want the full kernel source), this=
 <br>
&gt; should only keep the Documentation/ files that are required to pass <b=
r>
&gt; the check, not keep all of Documentation.<br>
<br>
<br>
If you have a better patch, I am pleasure to accept it.<br></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">???=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">This is where you&#39;d =
typically do a v2 of the patch after getting a review of a change.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">But if you are refusing the feedb=
ack, then yes, I&#39;ll do a version of the patch myself rather than just b=
lindly copying in all of the documentation. I&#39;ll submit it myself.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">RP/Ross, whoever is taking in=
 patches, drop this version, and I&#39;ll do my own.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
--Hongzhi<br>
<br>
<br>
&gt; Bruce<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0rm -rf $kerneldir/build/scripts=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0rm -rf $kerneldir/build/include=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.8.1<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-core@list=
s.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000bbbbab05900adb5a--
