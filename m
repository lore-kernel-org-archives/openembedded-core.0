Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 374427E4FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 12:28:03 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id r9so101364766ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8YFLyxd0oit5O/fpd/Bo6FOYhhaubQWJdtcjhm6Dx5o=;
	b=mFoRX7HXKwDNEVKqcYFCMihQF6d3Ctw42yEv9u+NYoyeRz6Un9r4SfUvEzk+r4z8RN
	pF8oVxZzNEmMSP5v+eOxuTDQrW+hZ/q1ms1T5bxoicYHQu+zCxqYqS1r6dtxcKice61x
	8aa4Go6B5COb66UmMxWB+wvlSpuHsfFCFnm8tYfCELDyhLbq/jyuBpS1nI5MxsaKjsvM
	yvVDTrxOCaAatAA6gcWhCRS2B3QUHz2sDphBEaE7D8By2dfmIUux854Yw/C8u74vEklj
	S6IPk94BoifN/4ZgchJJtDFeWP/iVMmj6DocD+bGimcrsr9yiFEj22TXMB4CQpdas0mT
	NI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8YFLyxd0oit5O/fpd/Bo6FOYhhaubQWJdtcjhm6Dx5o=;
	b=HbFqerXZ3a3hl/mvAE9oZYSYyEWA3CbF/5EvblsdhVNKV1yCdfYIMPFjLcu0jsDdb1
	IsyH5jSv5tRyLlNIQS38ntT/idpezIMKJnG30mFVoAksFKOYGoRA1XAU2vUCbsqAUVTZ
	Xkfhglc7FL2/fBXDuVUtKmFODReb26bRB08HhHTOXwDGN6gDbW+LT9sLDcfB+oWap7X2
	RvNPj6ZvlrBZmGJFcc0EtQ6MyqtiFludBEzziJOGHe93zMPeKKbYij++aEIqb8jZycH0
	W6sDGj8VeS2/qw2KxzCnxjgwZnBJZHvJGRsaeJNslxzYGvRmSXOH6SPXVNviH01efKWd
	ys2Q==
X-Gm-Message-State: APjAAAVvbYQ6QF/eOdK7uMtb7gqllFPSgP1Nd1c7nz5uwarq9mQ1OFCL
	3om3w8tsm+CTGar4qVIZppQlQvow8vZxiq633Mg=
X-Google-Smtp-Source: APXvYqxZHxcfsYzvF93JKhA2cOqMdFQTTlMe+8XvP0ap8IwhPXS0yMWOCIRxrAeS80E4nBtAmy/Mmm2A82TMoMAQ128=
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr21276172ljh.79.1565699283470; 
	Tue, 13 Aug 2019 05:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <1565674414-112937-1-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1565674414-112937-1-git-send-email-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2019 08:27:52 -0400
Message-ID: <CADkTA4PCeER9wP28NOaUtKEFBLKmqUfda7Cz+M0q2cgp5DiYew@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
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
X-List-Received-Date: Tue, 13 Aug 2019 12:28:03 -0000
Content-Type: multipart/alternative; boundary="0000000000009dcf01058ffec5a3"

--0000000000009dcf01058ffec5a3
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 1:35 AM Hongzhi.Song <hongzhi.song@windriver.com>
wrote:

> A new patch let kernel source Documentation/Kconfig in top Kconfig
> So kernel-devsrc should include Documentation/ too.
> Otherwise "make scripts" will fails.
>
> patch:
> commit b1663d7e3a7961fc45262fd68a89253f2803036c
> Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Date:   Tue Jun 4 09:26:27 2019 -0300
>
>     docs: Kbuild/Makefile: allow check for missing docs at build time
>
>     While this doesn't make sense for production Kernels, in order to
>     avoid regressions when documents are touched, let's add a
>     check target at the make file.
>
>     Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
>     Signed-off-by: Jonathan Corbet <corbet@lwn.net>
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 5ec5929..a874e06 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -65,7 +65,7 @@ do_install() {
>      )
>
>      # then drop all but the needed Makefiles/Kconfig files
> -    rm -rf $kerneldir/build/Documentation
> +    #rm -rf $kerneldir/build/Documentation
>

In the spirit of keeping kernel-devsrc as small as possible (I have another
patch pending if you really want the full kernel source), this should only
keep the Documentation/ files that are required to pass the check, not keep
all of Documentation.

Bruce



>      rm -rf $kerneldir/build/scripts
>      rm -rf $kerneldir/build/include
>
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009dcf01058ffec5a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 13, 2019 at 1:35 AM Hongzhi.Song &lt;<a=
 href=3D"mailto:hongzhi.song@windriver.com">hongzhi.song@windriver.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A new=
 patch let kernel source Documentation/Kconfig in top Kconfig<br>
So kernel-devsrc should include Documentation/ too.<br>
Otherwise &quot;make scripts&quot; will fails.<br>
<br>
patch:<br>
commit b1663d7e3a7961fc45262fd68a89253f2803036c<br>
Author: Mauro Carvalho Chehab &lt;<a href=3D"mailto:mchehab%2Bsamsung@kerne=
l.org" target=3D"_blank">mchehab+samsung@kernel.org</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Jun 4 09:26:27 2019 -0300<br>
<br>
=C2=A0 =C2=A0 docs: Kbuild/Makefile: allow check for missing docs at build =
time<br>
<br>
=C2=A0 =C2=A0 While this doesn&#39;t make sense for production Kernels, in =
order to<br>
=C2=A0 =C2=A0 avoid regressions when documents are touched, let&#39;s add a=
<br>
=C2=A0 =C2=A0 check target at the make file.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Mauro Carvalho Chehab &lt;<a href=3D"mailto:mc=
hehab%2Bsamsung@kernel.org" target=3D"_blank">mchehab+samsung@kernel.org</a=
>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Jonathan Corbet &lt;<a href=3D"mailto:corbet@l=
wn.net" target=3D"_blank">corbet@lwn.net</a>&gt;<br>
<br>
Signed-off-by: Hongzhi.Song &lt;<a href=3D"mailto:hongzhi.song@windriver.co=
m" target=3D"_blank">hongzhi.song@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-ke=
rnel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D=
"_blank">kernel-devsrc.bb</a><br>
index 5ec5929..a874e06 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -65,7 +65,7 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# then drop all but the needed Makefiles/Kconfig files<=
br>
-=C2=A0 =C2=A0 rm -rf $kerneldir/build/Documentation<br>
+=C2=A0 =C2=A0 #rm -rf $kerneldir/build/Documentation<br></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">In th=
e spirit of keeping kernel-devsrc as small as possible (I have another patc=
h pending if you really want the full kernel source), this should only keep=
 the Documentation/ files that are required to pass the check, not keep all=
 of Documentation.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
=C2=A0 =C2=A0 =C2=A0rm -rf $kerneldir/build/scripts<br>
=C2=A0 =C2=A0 =C2=A0rm -rf $kerneldir/build/include<br>
<br>
-- <br>
2.8.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000009dcf01058ffec5a3--
