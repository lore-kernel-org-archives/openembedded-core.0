Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 31ABB79202
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 19:37:22 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id c56-v6so3311038qtd.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 12:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ykVI6k5fJsxX8qw/OFaBl4Te3fZlLr0kvfHyxe7R/Hg=;
	b=u0fTuijAXmlJpzE+2fbpNK9WKlDqeW9w+Jm7EbCg/s77fTcwFmBbzk+WJw5gJRJ+hl
	2/ZOh7n94Fmm9QwYbLjrq5ht9opHzl3JSIQQS5krPKc30PrdkUBJo9YmZDd95C4Cr5zU
	MTzIFJOw+LqmUzTasJZv2BrCQNMh/0gvZJMegRnrgTKl5zxvjxYKPJUdzWzpeLvgB/BX
	7NmK8dLOboTDLzGDjkIhtvwFf0H9lo6uBj/AKT1LY97k4UgoPAfzZVyF1g9bnV1gfq05
	BlhIsqNg2LdLind0PkluDWZBRZDolJVDmfBSfZ2UGV70KTtq3ufeM0z7BbzO60KeufHV
	RHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ykVI6k5fJsxX8qw/OFaBl4Te3fZlLr0kvfHyxe7R/Hg=;
	b=snlcvin8v5LmzhJ7IjaWgPx7E4+r8zHiIA9iOj1NFy391bBTBV9iSRm/4Q+fZX1ehi
	Daq686fF8eSwUfmUdix+aC4dac/U1SFwDorWVuQCaW0kSZ1c/uUT+u3P044dpQ7ib6k3
	a537SsW8Wi/sBjBjRSTAakC3i9FRRu5sm/nTwQoIiu4Tpp/jwuppRIEY/3+cpS76GTh5
	dfX3agjwqfQr77eGQT3mQm/HSO0k9SOb5ms18gYmau/l4d3KhqnsmtQncRTIUIAGXCUD
	WyeMxqlWtEHsSphPnhvybizZUVkitu//rnxuTzNfajG9ZjQ2Z4fQ4KgKuyXv7kxx1j3C
	GYQw==
X-Gm-Message-State: ABuFfogpuHlITpF5w5YzR/HuWULwngQkLMv+Qy+canProNv31UEzgsxd
	vVKwdxA78cnSeGOkw1ETEpcQfVgYGKCYECBeI/g=
X-Google-Smtp-Source: ACcGV60Ytvl9x0U0YFo9BEJ8lUgfcsS25O7U6fv0dslVo+J10OrOlGzWmryKJImpJX7IOI3DGHm0WHGoh3kYR2gSXf8=
X-Received: by 2002:ac8:4912:: with SMTP id
	e18-v6mr6830715qtq.34.1538509042552; 
	Tue, 02 Oct 2018 12:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20181002191136.8792-1-raj.khem@gmail.com>
	<CAJTo0LaN2cjd6o67epNgi0+8g1VE+1GnLCGdYDVsFLj01b_Oww@mail.gmail.com>
In-Reply-To: <CAJTo0LaN2cjd6o67epNgi0+8g1VE+1GnLCGdYDVsFLj01b_Oww@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Oct 2018 12:37:10 -0700
Message-ID: <CAMKF1sq4xUqHtSVOB_C8Gt6Op_6MNmjrxxEzGTtC5R1eoT4MPw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Disable asm on musl
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
X-List-Received-Date: Tue, 02 Oct 2018 19:37:22 -0000
Content-Type: multipart/alternative; boundary="000000000000f715970577440c6f"

--000000000000f715970577440c6f
Content-Type: text/plain; charset="UTF-8"

I think it is. The way th calls are set for performance reasons seems to be
causing this
Ideally we should ensure to use right dialect for  tls calls I think musl
is exposing a bug in Mesa
Which we covered by disabling tls in Glx once we disable that then this
problem pops up so we disable ASM

So this is a workaround until then

On Tue, Oct 2, 2018 at 12:28 PM Burton, Ross <ross.burton@intel.com> wrote:

> Isn't this a bit overkill?  Is the assembler actually broken?
>
> Ross
> On Tue, 2 Oct 2018 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > some unknown part of mesa's x86 assembly
> > code is broken by readonly text segments
> >
> > [ YOCTO #12918 ]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> > index 8d0e2cb67c..e6f3712706 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -107,7 +107,7 @@ PACKAGECONFIG[osmesa] =
> "--enable-${OSMESA},--disable-${OSMESA}"
> >  PACKAGECONFIG[unwind] =
> "--enable-libunwind,--disable-libunwind,libunwind"
> >
> >  EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
> > -EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
> > +EXTRA_OECONF_append_libc-musl = " --disable-asm --disable-glx-tls"
> >  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
> >  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
> >
> > --
> > 2.19.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f715970577440c6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I think it is. The way th calls are set for performa=
nce reasons seems to be causing this</div></div><div dir=3D"auto">Ideally w=
e should ensure to use right dialect for =C2=A0tls calls I think musl is ex=
posing a bug in Mesa=C2=A0</div><div dir=3D"auto">Which we covered by disab=
ling tls in Glx once we disable that then this problem pops up so we disabl=
e ASM=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">So this is a=
 workaround until then=C2=A0</div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr">On Tue, Oct 2, 2018 at 12:28 PM Burton, Ross &lt;<a href=3D"mai=
lto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Isn&#39;t this a bit overkill?=C2=A0 Is the as=
sembler actually broken?<br>
<br>
Ross<br>
On Tue, 2 Oct 2018 at 20:21, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; some unknown part of mesa&#39;s x86 assembly<br>
&gt; code is broken by readonly text segments<br>
&gt;<br>
&gt; [ YOCTO #12918 ]<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc<br>
&gt; index 8d0e2cb67c..e6f3712706 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; @@ -107,7 +107,7 @@ PACKAGECONFIG[osmesa] =3D &quot;--enable-${OSMESA}=
,--disable-${OSMESA}&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[unwind] =3D &quot;--enable-libunwind,--disable-lib=
unwind,libunwind&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF_remove_libc-musl =3D &quot;--enable-glx-tls&quot;<b=
r>
&gt; -EXTRA_OECONF_append_libc-musl =3D &quot; --disable-glx-tls&quot;<br>
&gt; +EXTRA_OECONF_append_libc-musl =3D &quot; --disable-asm --disable-glx-=
tls&quot;<br>
&gt;=C2=A0 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -=
O2)<br>
&gt;=C2=A0 FULL_OPTIMIZATION_append =3D &quot; -fno-omit-frame-pointer&quot=
;<br>
&gt;<br>
&gt; --<br>
&gt; 2.19.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000f715970577440c6f--
