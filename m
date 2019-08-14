Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id F15287DDCC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 03:04:17 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id a30so15166615lfk.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 20:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CT6x3FW3HmrbKhuM7Fc4meoXckgCvXuJXq5VkS/+jZE=;
	b=J9Ct4z1K/FxyQCZM9WRQv9vXZHFJT76KhuxppLNPwAJAFp0u71Q9ibkqqXMr6c/D1s
	5ycczCT9wfjgxRuMENmrL8yU8/DOudxulL4x0eXrZ/j0dUDmTLpEH5zQHSVeXFIUe3Uc
	Tn4zKWDbF3F6ncVRs1kT41Nel6FFuv//pQ2JTDRJpYREORwWqAAiALHgxFHHpEW4XG9z
	jhEV5pcg5ehUDO1wEP6t6bpPsMrcTq5vbtM1P/8SlxPVydx+FN+JbNiN14yZBPfD/mZ5
	oat3LI2VJLATeZejF4dH94OZ7sz7033hHg63wtPqnO6sQqT3EchWtbVfaqPv9czMW7F5
	VbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CT6x3FW3HmrbKhuM7Fc4meoXckgCvXuJXq5VkS/+jZE=;
	b=VkTSxnCi9eFL4RmuEWrEYjhlRfcduMIzvRAWG74FtfSjq1wjPy5Tva9CKQBVKHtQkY
	fYIASJQG5ZlIr3eob9D+eKyJ7zkDseSu1M0a0w3NxjOgdq4ZqMU8xQRnwVHDbTfTrXx6
	uLKkt1j2L30sFj7FJD00KkVXQRNko1GRJsFW7T/C9FVB9WaawSOG3GmB3Vxy/g51iNdD
	r9UO0gImKlTnagKYP8O5E+DJB7uNNW5QNPx5bVWHX3VpRU+pQc1wwRxOBM+mAJbi4bLR
	cn5cJ/EMoOnM702jib9O/ARwYt2B1BhQMK9PNX3GHprgfePZaWnBHoPjYcHkHYQsZlsq
	isfw==
X-Gm-Message-State: APjAAAXkMVHjf8BfpBEbY2pZkBlWabOGmX0IGkjQnItILe5uER2W/JsF
	7LbMGO2ggwA9Z8EnXbNH6bgu7uxBaz/9ScnoxfY=
X-Google-Smtp-Source: APXvYqyFQMriUWJFERArdYoKfkM0NxdZvktIFLwdM4eOUydvO2v5NvCZsl3IsgzlVOS2FCbK/SItYA+G0xzvmuyJFZg=
X-Received: by 2002:a19:110:: with SMTP id 16mr24791828lfb.63.1565751858398;
	Tue, 13 Aug 2019 20:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <1565674414-112937-1-git-send-email-hongzhi.song@windriver.com>
	<CADkTA4PCeER9wP28NOaUtKEFBLKmqUfda7Cz+M0q2cgp5DiYew@mail.gmail.com>
	<abef39b8-e8b0-db67-70e7-da17666d1056@windriver.com>
	<CADkTA4Nwi1sSu-W2asM0SXUEhHE94jAEQcSWoCsW7f9ThWP4Tw@mail.gmail.com>
	<35a10637-eac6-0142-fc53-2675fb700375@windriver.com>
In-Reply-To: <35a10637-eac6-0142-fc53-2675fb700375@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2019 23:04:07 -0400
Message-ID: <CADkTA4Pma8h6rk6nnRUAGi2gu8gXVCT0GiTYH7vrYT1OQzJoag@mail.gmail.com>
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
X-List-Received-Date: Wed, 14 Aug 2019 03:04:18 -0000
Content-Type: multipart/alternative; boundary="000000000000538ad205900b03d9"

--000000000000538ad205900b03d9
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 11:01 PM Hongzhi, Song <hongzhi.song@windriver.com>
wrote:

>
> On 8/14/19 10:53 AM, Bruce Ashfield wrote:
> >
> >
> > On Tue, Aug 13, 2019 at 9:59 PM Hongzhi, Song
> > <hongzhi.song@windriver.com <mailto:hongzhi.song@windriver.com>> wrote:
> >
> >
> >     On 8/13/19 8:27 PM, Bruce Ashfield wrote:
> >     >
> >     >
> >     > On Tue, Aug 13, 2019 at 1:35 AM Hongzhi.Song
> >     > <hongzhi.song@windriver.com <mailto:hongzhi.song@windriver.com>
> >     <mailto:hongzhi.song@windriver.com
> >     <mailto:hongzhi.song@windriver.com>>> wrote:
> >     >
> >     >     A new patch let kernel source Documentation/Kconfig in top
> >     Kconfig
> >     >     So kernel-devsrc should include Documentation/ too.
> >     >     Otherwise "make scripts" will fails.
> >     >
> >     >     patch:
> >     >     commit b1663d7e3a7961fc45262fd68a89253f2803036c
> >     >     Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org
> >     <mailto:mchehab%2Bsamsung@kernel.org>
> >     >     <mailto:mchehab%2Bsamsung@kernel.org
> >     <mailto:mchehab%252Bsamsung@kernel.org>>>
> >     >     Date:   Tue Jun 4 09:26:27 2019 -0300
> >     >
> >     >         docs: Kbuild/Makefile: allow check for missing docs at
> >     build time
> >     >
> >     >         While this doesn't make sense for production Kernels, in
> >     order to
> >     >         avoid regressions when documents are touched, let's add a
> >     >         check target at the make file.
> >     >
> >     >         Signed-off-by: Mauro Carvalho Chehab
> >     >     <mchehab+samsung@kernel.org
> >     <mailto:mchehab%2Bsamsung@kernel.org>
> >     <mailto:mchehab%2Bsamsung@kernel.org
> >     <mailto:mchehab%252Bsamsung@kernel.org>>>
> >     >         Signed-off-by: Jonathan Corbet <corbet@lwn.net
> >     <mailto:corbet@lwn.net>
> >     >     <mailto:corbet@lwn.net <mailto:corbet@lwn.net>>>
> >     >
> >     >     Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com
> >     <mailto:hongzhi.song@windriver.com>
> >     >     <mailto:hongzhi.song@windriver.com
> >     <mailto:hongzhi.song@windriver.com>>>
> >     >     ---
> >     >      meta/recipes-kernel/linux/kernel-devsrc.bb
> >     <http://kernel-devsrc.bb>
> >     >     <http://kernel-devsrc.bb> | 2 +-
> >     >      1 file changed, 1 insertion(+), 1 deletion(-)
> >     >
> >     >     diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >     <http://kernel-devsrc.bb>
> >     >     <http://kernel-devsrc.bb>
> >     >     b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >     <http://kernel-devsrc.bb> <http://kernel-devsrc.bb>
> >     >     index 5ec5929..a874e06 100644
> >     >     --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >     <http://kernel-devsrc.bb>
> >     >     <http://kernel-devsrc.bb>
> >     >     +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >     <http://kernel-devsrc.bb>
> >     >     <http://kernel-devsrc.bb>
> >     >     @@ -65,7 +65,7 @@ do_install() {
> >     >          )
> >     >
> >     >          # then drop all but the needed Makefiles/Kconfig files
> >     >     -    rm -rf $kerneldir/build/Documentation
> >     >     +    #rm -rf $kerneldir/build/Documentation
> >     >
> >     >
> >     > In the spirit of keeping kernel-devsrc as small as possible (I have
> >     > another patch pending if you really want the full kernel
> >     source), this
> >     > should only keep the Documentation/ files that are required to pass
> >     > the check, not keep all of Documentation.
> >
> >
> >     If you have a better patch, I am pleasure to accept it.
> >
> >
> > ???
> >
> > This is where you'd typically do a v2 of the patch after getting a
> > review of a change.
> >
> > But if you are refusing the feedback, then yes, I'll do a version of
> > the patch myself rather than just blindly copying in all of the
> > documentation. I'll submit it myself.
> >
> > RP/Ross, whoever is taking in patches, drop this version, and I'll do
> > my own.
>
>
> I am not very familiar with the kernel-devsrc.bb. I have no objection
> for your decision.
>

At a minimum, we shouldn't leave the commented out #rm -rf
$kerneldir/build/Documentation, so I can do that and tweak the commit
message a bit as well.

Leave it with me, and I'll send it to the list (hopefully tomorrow) to be
sure it still solves your problem.

Bruce


>
> Thanks,
>
> --Hongzhi
>
>
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >     Thanks,
> >
> >     --Hongzhi
> >
> >
> >     > Bruce
> >     >
> >     >          rm -rf $kerneldir/build/scripts
> >     >          rm -rf $kerneldir/build/include
> >     >
> >     >     --
> >     >     2.8.1
> >     >
> >     >     --
> >     >     _______________________________________________
> >     >     Openembedded-core mailing list
> >     > Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     >     <mailto:Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>>
> >     > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >     >
> >     >
> >     >
> >     > --
> >     > - Thou shalt not follow the NULL pointer, for chaos and madness
> >     await
> >     > thee at its end
> >     > - "Use the force Harry" - Gandalf, Star Trek II
> >     >
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

--000000000000538ad205900b03d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 13, 2019 at 11:01 PM Hongzhi, Song &lt;=
<a href=3D"mailto:hongzhi.song@windriver.com">hongzhi.song@windriver.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br=
>
On 8/14/19 10:53 AM, Bruce Ashfield wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Aug 13, 2019 at 9:59 PM Hongzhi, Song <br>
&gt; &lt;<a href=3D"mailto:hongzhi.song@windriver.com" target=3D"_blank">ho=
ngzhi.song@windriver.com</a> &lt;mailto:<a href=3D"mailto:hongzhi.song@wind=
river.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;&gt; wrote:<=
br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 8/13/19 8:27 PM, Bruce Ashfield wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Tue, Aug 13, 2019 at 1:35 AM Hongzhi.Song<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"mailto:hongzhi.song@windriver.c=
om" target=3D"_blank">hongzhi.song@windriver.com</a> &lt;mailto:<a href=3D"=
mailto:hongzhi.song@windriver.com" target=3D"_blank">hongzhi.song@windriver=
.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongzhi.song@windriver=
.com" target=3D"_blank">hongzhi.song@windriver.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongzhi.song@windriver=
.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;&gt;&gt; wrote:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0A new patch let kernel sour=
ce Documentation/Kconfig in top<br>
&gt;=C2=A0 =C2=A0 =C2=A0Kconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0So kernel-devsrc should inc=
lude Documentation/ too.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Otherwise &quot;make script=
s&quot; will fails.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0patch:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0commit b1663d7e3a7961fc4526=
2fd68a89253f2803036c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Author: Mauro Carvalho Cheh=
ab &lt;<a href=3D"mailto:mchehab%2Bsamsung@kernel.org" target=3D"_blank">mc=
hehab+samsung@kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mchehab%252Bsamsung@ke=
rnel.org" target=3D"_blank">mchehab%2Bsamsung@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:mchehab%252Bsamsung@kernel.org" target=3D"_blank">mchehab%2Bsamsung@kerne=
l.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mchehab%25252Bsamsung@=
kernel.org" target=3D"_blank">mchehab%252Bsamsung@kernel.org</a>&gt;&gt;&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Date:=C2=A0 =C2=A0Tue Jun 4=
 09:26:27 2019 -0300<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 docs: Kbuild/=
Makefile: allow check for missing docs at<br>
&gt;=C2=A0 =C2=A0 =C2=A0build time<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 While this do=
esn&#39;t make sense for production Kernels, in<br>
&gt;=C2=A0 =C2=A0 =C2=A0order to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 avoid regress=
ions when documents are touched, let&#39;s add a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 check target =
at the make file.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Signed-off-by=
: Mauro Carvalho Chehab<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:mcheh=
ab%2Bsamsung@kernel.org" target=3D"_blank">mchehab+samsung@kernel.org</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mchehab%252Bsamsung@ke=
rnel.org" target=3D"_blank">mchehab%2Bsamsung@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mchehab%252Bsamsung@ke=
rnel.org" target=3D"_blank">mchehab%2Bsamsung@kernel.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mchehab%25252Bsamsung@=
kernel.org" target=3D"_blank">mchehab%252Bsamsung@kernel.org</a>&gt;&gt;&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Signed-off-by=
: Jonathan Corbet &lt;<a href=3D"mailto:corbet@lwn.net" target=3D"_blank">c=
orbet@lwn.net</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:corbet@lwn.net" target=
=3D"_blank">corbet@lwn.net</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:corbet@lwn.net" target=3D"_blank">corbet@lwn.net</a> &lt;mailto:<a href=
=3D"mailto:corbet@lwn.net" target=3D"_blank">corbet@lwn.net</a>&gt;&gt;&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Hongzhi.Song=
 &lt;<a href=3D"mailto:hongzhi.song@windriver.com" target=3D"_blank">hongzh=
i.song@windriver.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongzhi.song@windriver=
.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:hongzhi.song@windriver.com" target=3D"_blank">hongzhi.song@windriver.com<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hongzhi.song@windriver=
.com" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta/recipes-kernel/l=
inux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blan=
k">kernel-devsrc.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kernel-devsrc.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kerne=
l-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">http://kernel-devsrc.bb</=
a>&gt; | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 1 ins=
ertion(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-k=
ernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=
=3D"_blank">kernel-devsrc.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kernel-devsrc.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kerne=
l-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">http://kernel-devsrc.bb</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-kernel/linux=
/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">k=
ernel-devsrc.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kernel-devsrc.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt; &lt;<a href=3D"ht=
tp://kernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">http://kernel-d=
evsrc.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0index 5ec5929..a874e06 1006=
44<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-kernel/l=
inux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blan=
k">kernel-devsrc.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kernel-devsrc.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kerne=
l-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">http://kernel-devsrc.bb</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-kernel/l=
inux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D"_blan=
k">kernel-devsrc.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kernel-devsrc.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://kernel-devsrc.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://kerne=
l-devsrc.bb" rel=3D"noreferrer" target=3D"_blank">http://kernel-devsrc.bb</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0@@ -65,7 +65,7 @@ do_instal=
l() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0# then =
drop all but the needed Makefiles/Kconfig files<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 rm -rf $kern=
eldir/build/Documentation<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 #rm -rf $ker=
neldir/build/Documentation<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; In the spirit of keeping kernel-devsrc as smal=
l as possible (I have<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; another patch pending if you really want the f=
ull kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0source), this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; should only keep the Documentation/ files that=
 are required to pass<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the check, not keep all of Documentation.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0If you have a better patch, I am pleasure to accept=
 it.<br>
&gt;<br>
&gt;<br>
&gt; ???<br>
&gt;<br>
&gt; This is where you&#39;d typically do a v2 of the patch after getting a=
 <br>
&gt; review of a change.<br>
&gt;<br>
&gt; But if you are refusing the feedback, then yes, I&#39;ll do a version =
of <br>
&gt; the patch myself rather than just blindly copying in all of the <br>
&gt; documentation. I&#39;ll submit it myself.<br>
&gt;<br>
&gt; RP/Ross, whoever is taking in patches, drop this version, and I&#39;ll=
 do <br>
&gt; my own.<br>
<br>
<br>
I am not very familiar with the <a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a>. I have no objection <br=
>
for your decision.<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">At a minimum, we shouldn&#39;t leave the=
 commented out #rm -rf $kerneldir/build/Documentation, so I can do that and=
 tweak the commit message a bit as well.=C2=A0</div></div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Leave it with me, and I&#39;ll send it to the l=
ist (hopefully tomorrow) to be sure it still solves your problem.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Bruce</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
--Hongzhi<br>
<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--Hongzhi<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Bruce<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0rm -rf =
$kerneldir/build/scripts<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0rm -rf =
$kerneldir/build/include<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A02.8.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0___________________________=
____________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing l=
ist<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"mailto:Openembedded-core@lists.open=
embedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-core@list=
s.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:Openembedded-core@lists.openembedded.org" target=3D"_blank">Openembedded-=
core@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-core@list=
s.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"http://lists.openembedded.org/mailm=
an/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://=
lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; - Thou shalt not follow the NULL pointer, for =
chaos and madness<br>
&gt;=C2=A0 =C2=A0 =C2=A0await<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; thee at its end<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; - &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
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

--000000000000538ad205900b03d9--
