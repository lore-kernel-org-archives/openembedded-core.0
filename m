Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1495378062
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 12:17:06 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id f55so10159905qta.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M0bytIhRN9KiALMk8AKW0y0Pnz7Bu2JkScbAD6wV5fs=;
	b=omMUE0ELO17J+5HuluTxqhRj7aGiupu5ALDmVs/n4agbSe4kdQbhU9aWNss0epRORi
	/qmKpYVXaCjpqLdmWbkfAqpTzXPgFv3PVAE4MUL/R0MUOU4mJk/cm/PIQaurZ/UnBCSf
	Nn0zUM7NeatsV6eRF3Fuf5o0RcdFgtwHdp7jiVnanV7OnbvQPYCFlwOXuA1JVKlLgHsi
	DlXSekgDwtVMi6Z5k0C91YhmgFbhnZWWsiOdR1B6nuyoKNXcYu9A8yZ9TGCv/cIVMS8s
	VsA8/Km28bd/idlOT+BNHDy7bTe7WBbRQLFj1kv/z3x51cilYou0g5GKvbzcGb4re3p+
	MXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M0bytIhRN9KiALMk8AKW0y0Pnz7Bu2JkScbAD6wV5fs=;
	b=YOGyU9gD0UpoppcVMQZOn+T8IZp1ZNyTqaQc1Ygmx0HZvsociFzwgOAHPbpMbnaTww
	6Q9Fq01u+TFxdfQcwuTweIDgYuTNJppHhbt4qOV5o76WUQSBrYJzp932DsmaSuy3RnVc
	UOWdKq0RnCVFz3xJrYJY53wfshw5VC7NCor2P8KuaXXglY3XD9byi5gb/t7LUveAQ9Fm
	rvm/fBoXStkxhg5eLGou0kxPDJ5j+aUP3ncJavSeW34xpmUxLh+nBXR3dr/xgsXTvH9l
	+gAdEYDBKEmis0UNCpjspri+61AXhICMdF0qMFghO04/zXJJ7cOpCITLFyAnJFBjB2Ae
	A6vg==
X-Gm-Message-State: AODbwcB6PP6o3XpV31oL5IGqt0z6yYaAPXN7ziKh2r2Sgw1+XCDeM+JH
	qjy+3GplYhA634slrlEAKj2bywk5iQ==
X-Received: by 10.200.55.103 with SMTP id p36mr27838498qtb.64.1496233027819;
	Wed, 31 May 2017 05:17:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.109 with HTTP; Wed, 31 May 2017 05:17:07 -0700 (PDT)
In-Reply-To: <CAPoQQ-1uznmcUSkXs3iLYyK-Bm8gDaT5de_Bi-jF4Su6+KjKvw@mail.gmail.com>
References: <20170530211436.16397-1-dev@codyps.com>
	<CAPoQQ-1uznmcUSkXs3iLYyK-Bm8gDaT5de_Bi-jF4Su6+KjKvw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 May 2017 08:17:07 -0400
Message-ID: <CADkTA4MoY27QPks7oJVP-tfs1+Yr1yY9StmXToNT5Rrs9mYJAA@mail.gmail.com>
To: Cody P Schafer <dev@codyps.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu-export-rootfs: don't change RPC ports
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
X-List-Received-Date: Wed, 31 May 2017 12:17:07 -0000
Content-Type: multipart/alternative; boundary="001a1142662a1fdeef0550d0e627"

--001a1142662a1fdeef0550d0e627
Content-Type: text/plain; charset="UTF-8"

On Wed, May 31, 2017 at 1:04 AM, Cody P Schafer <dev@codyps.com> wrote:

> > The result of this is that trying to mount filesystems exported by
> > runqemu-export-rootfs in modern kernels (at least in 4.2 and later, and
> > probably more like 2.6.20 and later) doesn't actually work.
>
> To clarify, when using nfsroot with the current kernel & unfsd
> options, my boot stops, waits for the nfs root to appear, and then
> times out. When trying to mount normally (ie: via `mount -t nfs` of a
> very recent vintage in arch-linux), I get immediate "protocol family
> not supported" errors.
>
> With this change, both mount methods (nfsroot with new kernel options
> and normally mount) work without issue.
>
> > I'm honestly not sure how anyone was using this for nfsroot support.
> > Maybe an initramfs with a version of nfs-utils that could handle the
> > mountprog/nfsprog option was in use? Not sure.
>
> Or is there some yocto kernel patch to enable support for it? I'm
> running a custom kernel.
>


There's a patch that we've had for years to allow alternate RPC ports
to work with userspace NFS and co-exist with existing NFS servers.

This would have an impact on that functionality, so if we do need to
change those ports, the existing ones should be maintained with some
sort of option to change the nfsroot line.

Bruce


> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1142662a1fdeef0550d0e627
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, May 31, 2017 at 1:04 AM, Cody P Schafer <span dir=3D"ltr">&lt;<=
a href=3D"mailto:dev@codyps.com" target=3D"_blank">dev@codyps.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; The re=
sult of this is that trying to mount filesystems exported by<br>
&gt; runqemu-export-rootfs in modern kernels (at least in 4.2 and later, an=
d<br>
&gt; probably more like 2.6.20 and later) doesn&#39;t actually work.<br>
<br>
</span>To clarify, when using nfsroot with the current kernel &amp; unfsd<b=
r>
options, my boot stops, waits for the nfs root to appear, and then<br>
times out. When trying to mount normally (ie: via `mount -t nfs` of a<br>
very recent vintage in arch-linux), I get immediate &quot;protocol family<b=
r>
not supported&quot; errors.<br>
<br>
With this change, both mount methods (nfsroot with new kernel options<br>
and normally mount) work without issue.<br>
<span class=3D""><br>
&gt; I&#39;m honestly not sure how anyone was using this for nfsroot suppor=
t.<br>
&gt; Maybe an initramfs with a version of nfs-utils that could handle the<b=
r>
&gt; mountprog/nfsprog option was in use? Not sure.<br>
<br>
</span>Or is there some yocto kernel patch to enable support for it? I&#39;=
m<br>
running a custom kernel.<br></blockquote><div><br></div><div><br></div><div=
>There&#39;s a patch that we&#39;ve had for years to allow alternate RPC po=
rts</div><div>to work with userspace NFS and co-exist with existing NFS ser=
vers.</div><div><br></div><div>This would have an impact on that functional=
ity, so if we do need to</div><div>change those ports, the existing ones sh=
ould be maintained with some</div><div>sort of option to change the nfsroot=
 line.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a1142662a1fdeef0550d0e627--
