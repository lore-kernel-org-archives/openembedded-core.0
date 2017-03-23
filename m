Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id C15A972F7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 07:51:16 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n11so53705098wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 00:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HXExOjeqf4c58kvZBt8oUGs9niGT+unB5jx+Cwddxr8=;
	b=lQyP9DMmpG7e4J2jIvS76Ni6RGYX53t1XfoFYaRXRfpH4x+rXRKZzN9qLEY/cf0kHm
	uBXGvADvMXuMr6rjHQVLYgPrywRG654wJoE1MytDiGGeGFEURhaCaB5Hc03O8X4YWULU
	kRh0Zf7hjeSlY8Hb0Ubjcy6bh6Z8y4tv8XxY3whoCbzlq02EfX9wVzotx3QBVnWdIyfV
	q+gbi1GQNLMrdcOeQXicQ9JRUra861ijjbwi6siOgUHXjGoGhNdmF4XzaSXIlugDDOlW
	NESxvZZj1bmGOmj9MskHcbIfqDsfIk+/qbDb+kMBGitaSp/IDx98rr1o2E9ncJJZ0Tqg
	7y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HXExOjeqf4c58kvZBt8oUGs9niGT+unB5jx+Cwddxr8=;
	b=Jc6rRQha8lpgz5yucw7uM6DFlwl6oBIUj4cG1rz1wQBNZQCHRh1UZaXgYXZ2tzG3PB
	lNoGbbTaVLuxC+dUuoFh4wImjr5hXGqEtnLubrAEPheQkpeYLUmd2fmEtcIu+it+xbpd
	H8ckvGNAsoxfdjqBk4Dt7xSX3Ih7YacwOlIiwulh0EqgMS1aWs2ypMpVE/TEEE8LNqn9
	IyaJa2qVDWIfHNolzg3F3pBglGjAtMWpWDoieX32R1iCSBKwvGyYYYKE/WmswQw7ln1m
	G5V+4xXCr5MJ6yNR2UycbPCMmEUTQKKwleXzhvbq9e4vmOe57RRzLOst9+RgDB9fWzF/
	TcBw==
X-Gm-Message-State: AFeK/H3hqsXfzsdg260iYIRz4di2OztyyjpuSrcHtfJZPdshoXLEwb9Tx0zmeYJHBycHxKVjb1ov210TBbS5hQ==
X-Received: by 10.28.4.10 with SMTP id 10mr1324741wme.124.1490255478061; Thu,
	23 Mar 2017 00:51:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 23 Mar 2017 00:51:17 -0700 (PDT)
In-Reply-To: <5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
References: <cover.1489267743.git.raj.khem@gmail.com>
	<5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Mar 2017 08:51:17 +0100
Message-ID: <CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] mesa: Contain configure search for llvm
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
X-List-Received-Date: Thu, 23 Mar 2017 07:51:18 -0000
Content-Type: multipart/alternative; boundary=001a1141e41665014c054b612493

--001a1141e41665014c054b612493
Content-Type: text/plain; charset=UTF-8

I'm not sure if this is the root cause, but last qemux86 build shows:


| configure: error: --enable-gallium-llvm selected but llvm-config is not found
| ERROR: Function failed: do_configure (log file is located at
/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mesa/2_17.0.1-r0/temp/log.do_configure.11359)


I've noticed some llvm changes for meta-clang, do we need similar
changes for meta-oe version of llvm?


On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 3/11/17 1:30 PM, Khem Raj wrote:
> > The following changes since commit a47e64d985a610535449730806651f
> 5bfd75d9ec:
> >
> >   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
> >
> > are available in the git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib kraj/pu
> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu
> >
> > Khem Raj (1):
> >   mesa: Contain configure search for llvm
> >
>
> I added another fix for mesa-gl to remove one of obsolete packageconfigs
> and its on the same pull branch now.
>
> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141e41665014c054b612493
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre style=3D"box-sizing:border-box;white-space:pre-wrap;w=
ord-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fo=
nt-size:14px">I&#39;m not sure if this is the root cause, but last qemux86 =
build shows:</pre><pre style=3D"box-sizing:border-box;white-space:pre-wrap;=
word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);f=
ont-size:14px"><br></pre><pre style=3D"box-sizing:border-box;white-space:pr=
e-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,5=
1,51);font-size:14px">| configure: error: --enable-gallium-llvm selected bu=
t llvm-config is not found
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mesa/2_17.0.1-r0/temp/log.=
do_configure.11359)</pre><pre style=3D"box-sizing:border-box;white-space:pr=
e-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,5=
1,51);font-size:14px"><br></pre><pre style=3D"box-sizing:border-box;white-s=
pace:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:r=
gb(51,51,51);font-size:14px">I&#39;ve noticed some llvm changes for meta-cl=
ang, do we need similar changes for meta-oe version of llvm?</pre></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Mar 12, 2017=
 at 12:16 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><span class=3D""><br>
<br>
On 3/11/17 1:30 PM, Khem Raj wrote:<br>
&gt; The following changes since commit a47e64d985a610535449730806651f<wbr>=
5bfd75d9ec:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0libcomps: add a recipe (2017-03-11 16:08:50 +0000)<br>
&gt;<br>
&gt; are available in the git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.openembedded.org/openembedded-=
core-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/<wb=
r>openembedded-core-contrib</a> kraj/pu<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/openembedded-core-=
contrib/log/?h=3Dkraj/pu" rel=3D"noreferrer" target=3D"_blank">http://cgit.=
openembedded.org/<wbr>openembedded-core-contrib/log/<wbr>?h=3Dkraj/pu</a><b=
r>
&gt;<br>
&gt; Khem Raj (1):<br>
&gt;=C2=A0 =C2=A0mesa: Contain configure search for llvm<br>
&gt;<br>
<br>
</span>I added another fix for mesa-gl to remove one of obsolete packagecon=
figs<br>
and its on the same pull branch now.<br>
<span class=3D"im HOEnZb"><br>
&gt;=C2=A0 meta/recipes-graphics/mesa/<wbr>mesa.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
--<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">____________________________=
__<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1141e41665014c054b612493--
