Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id C3ED5760A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 15:37:02 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id y2so319627300oie.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ql5We8hmZ/59P5ioIJB3GwenXgE82Kd6OmS8TgsYX5I=;
	b=Zz0d56gvxy8Ygbse1d0u3WUnicXiLHNjFSl4SzaVfO6QEQDemOyVkT4JMrBlQc5kgH
	SwCarFOCMZxDO58AyOF4KQj6ke1rcVAAkFZcJs6oyKnQD08yVrJ4c77066KX3SPy3vvQ
	LroeX1rHdTHxV0v8dcBbkbJL6ntqby5kDFba1H7WBJcH58BOm2Hu8k6lAsCt2n25uSSQ
	BwY/YV5jAA1SgX06eRhPO+PEDnxPGjwTaCcR7ibm+YuI1OZrMiZH1wAUb+/sM1Kw2tPZ
	wZvj8DtiIzUtuIzF8wupAW1UwD3aOuAGwSwF5ci3ejvwx3WvC29CB2kAgNXGqn6g4ICB
	z3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ql5We8hmZ/59P5ioIJB3GwenXgE82Kd6OmS8TgsYX5I=;
	b=YlitctjIOC+tOHQ1Ue9vTCFB5xmKYWJlLG8g6GSrrM3GIwAXtQcHtCoP+qymc/KyRj
	hrmqrjVnnpspyhlOyz4pEN0nKFsQ11g4YLXtEmBBYE3SgR6GUwTCXJjBrIhbFaIOkm7s
	8BN1Jzs7D6v8h/Fo9xaX2bhg9I9esD5Qof1OjD54Ar+Cpf6wjzoDFQXxVW6aKFdyTc8X
	88ou+DHpFS6M6tjKp6kWAU03CkjQfETxOdjWpcj0UPn1iZpafyvDCm4rsaPffyT38BXL
	RQ5GXbuoJWiI26fDg/LZVQajTgfD15PgHfrmsePS+/jaFjki4QUkTMPyaOAVcGDfkey/
	d5hg==
X-Gm-Message-State: AE9vXwNhym+J817bIdvf8aoCXld2wJBckFzCrX+1VqhdgeoufOAnCA8stsPFnNz3pMwWePd0ZlZEgHvAPBk+03jQ
X-Received: by 10.157.1.40 with SMTP id 37mr25415106otu.63.1473694622830; Mon,
	12 Sep 2016 08:37:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 12 Sep 2016 08:36:42 -0700 (PDT)
In-Reply-To: <1473693988.22823.1.camel@andred.net>
References: <20160905083442.27787-1-git@andred.net>
	<1473693988.22823.1.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Sep 2016 16:36:42 +0100
Message-ID: <CAJTo0LYGsh5fwJhsf57OcSxnRWxC2nXEM=dUbO+SeQKvnwos7A@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: do not check size of the debugfs image
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
X-List-Received-Date: Mon, 12 Sep 2016 15:37:03 -0000
Content-Type: multipart/alternative; boundary=94eb2c03c32a80ad9a053c5144e0

--94eb2c03c32a80ad9a053c5144e0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Well there must have been some list/gmail snafu, as I definitely don't have
this patch locally but patchwork has it.  I wonder what else I'm missing...

Ross

On 12 September 2016 at 16:26, Andr=C3=A9 Draszik <git@andred.net> wrote:

> ping
>
> On Mo, 2016-09-05 at 09:34 +0100, Andr=C3=A9 Draszik wrote:
> > The debugfs is supposed to be used in addition to the
> > normal image for debugging purposes, it doesn't make
> > sense to artificially limit its maximum size.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> > ---
> >  meta/classes/image.bbclass | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 07bd2d6..cb7d06d 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -538,6 +538,12 @@ def get_rootfs_size(d):
> >      base_size +=3D rootfs_alignment - 1
> >      base_size -=3D base_size % rootfs_alignment
> >
> > +    # Do not check image size of the debugfs image. This is not suppos=
ed
> > +    # to be deployed, etc. so it doesn't make sense to limit the size
> > +    # of the debug.
> > +    if (d.getVar('IMAGE_BUILDING_DEBUGFS', True) or "") =3D=3D "true":
> > +        return base_size
> > +
> >      # Check the rootfs size against IMAGE_ROOTFS_MAXSIZE (if set)
> >      if rootfs_maxsize:
> >          rootfs_maxsize_int =3D int(rootfs_maxsize)
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c03c32a80ad9a053c5144e0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well there must have been some list/gmail snafu, as I defi=
nitely don&#39;t have this patch locally but patchwork has it.=C2=A0 I wond=
er what else I&#39;m missing...<div><br></div><div>Ross</div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On 12 September 2016 at 1=
6:26, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=3D"mailto:git@andred=
.net" target=3D"_blank">git@andred.net</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">ping<br>
<br>
On Mo, 2016-09-05 at 09:34 +0100, Andr=C3=A9 Draszik wrote:<br>
&gt; The debugfs is supposed to be used in addition to the<br>
&gt; normal image for debugging purposes, it doesn&#39;t make<br>
&gt; sense to artificially limit its maximum size.<br>
&gt;<br>
&gt; Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andred.net=
">git@andred.net</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/image.bbclass | 6 ++++++<br>
&gt; =C2=A01 file changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<b=
r>
&gt; index 07bd2d6..cb7d06d 100644<br>
&gt; --- a/meta/classes/image.bbclass<br>
&gt; +++ b/meta/classes/image.bbclass<br>
&gt; @@ -538,6 +538,12 @@ def get_rootfs_size(d):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0base_size +=3D rootfs_alignment - 1<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0base_size -=3D base_size % rootfs_alignm=
ent<br>
&gt; =C2=A0<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0# Do not check image size of the debugfs imag=
e. This is not supposed<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0# to be deployed, etc. so it doesn&#39;t make=
 sense to limit the size<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0# of the debug.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0if (d.getVar(&#39;IMAGE_BUILDING_<wbr>DEBUGFS=
&#39;, True) or &quot;&quot;) =3D=3D &quot;true&quot;:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return base_size<br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# Check the rootfs size against IMAGE_RO=
OTFS_MAXSIZE (if set)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if rootfs_maxsize:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rootfs_maxsize_i=
nt =3D int(rootfs_maxsize)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c03c32a80ad9a053c5144e0--
