Return-Path: <gizero@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 67C8D77E7D
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 12:30:31 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id l18so51639867oig.2
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CmwrhOWkft/0O0VDZ1cBeZeVepB1XPkTBqmykiNHLrM=;
	b=WSs5W1Kzh8Mm/g2Q4EY8ldemKgFR49K9nR/IkLVxJTHk3j6fi/aNQH7IGJNtEcc7v2
	MxK/xHFM1phEGYQw5qHI4tQ5rSvlQhEyD41jB8oQsDX6AsCCWsqmkGEcJChYzQ+gRGC0
	4FRKSqh9zpfkSr1aRMhut2OTpV2BgOT6AA7uCebTAMfqwCNEsXE6K5d07PvP3+pJbfJV
	+DjR9S8SyguJyafQ7De3J8fDOGLUOsM/qwS96I1URG0rMw2G/uaRpwgZwYomBMaaSaPl
	rh/24xiuxfsz4JmoJXmDMESYNDDVaTldOqWObGxzg8HgcszK+v/QD/A1PWRNhv07oBuQ
	+a/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CmwrhOWkft/0O0VDZ1cBeZeVepB1XPkTBqmykiNHLrM=;
	b=i5J2Df0AvGUl8730cCaxsv2QFCtwYmml2ItfCdo/UUVPSimzF8GDI3OnwxPH9I4Upy
	xkYmXAW3823LqHkzUDP4nyVUG7iIAu8Nn3SxIyTp7CKMk4yt1SjklikJdElbvZ4hffOl
	UKtSVEK7C2aIwOyzsCx3pN6Un+BwPtLR9FI+oS4hTC2+bY7vBeoNAIKImJOBG4TKEou3
	nHN/u3znMNMY7gnydIct+XfNJ/haYyYroTybTnSOWPG1ZMJEyTsgp5gypXmN79YP8tcB
	dnku6n3i0QQGBG/4BRgHaNXJZu4R6PsWcAuwyVirWpUG3Ao8epZ2VPzP85dPUGDJzq2a
	iXvQ==
X-Gm-Message-State: AODbwcAfqubSKbWftRY3P/EiaqlrO/a9FikQEst2sDL+bdAo6I+ilQvQ
	6JHSIsZRe+tm710fpW/joPq5n1Bo2A==
X-Received: by 10.202.74.194 with SMTP id x185mr2132671oia.96.1495110632975;
	Thu, 18 May 2017 05:30:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.24.107 with HTTP; Thu, 18 May 2017 05:30:32 -0700 (PDT)
In-Reply-To: <d84852f6-9ce4-3f9a-cb7f-fa92c6a74462@mender.io>
References: <d84852f6-9ce4-3f9a-cb7f-fa92c6a74462@mender.io>
From: Andrea Galbusera <gizero@gmail.com>
Date: Thu, 18 May 2017 14:30:32 +0200
Message-ID: <CAC+thW08cG3Mt+E3O5fRmf=wyv4vrdp_ZphbRcNWEmq8VRhMnA@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: Joe Slater <jslater@windriver.com>,
	OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: volatile-binds and DNS
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
X-List-Received-Date: Thu, 18 May 2017 12:30:34 -0000
Content-Type: multipart/alternative; boundary="001a113dbb122db25d054fcb92af"

--001a113dbb122db25d054fcb92af
Content-Type: text/plain; charset="UTF-8"

On Thu, May 18, 2017 at 9:16 AM, Kristian Amlie <kristian.amlie@mender.io>
wrote:

> We've discovered that one of the recent commits to poky has broken DNS
> resolution in our image. The commit in questions is this one:
>
> -------------------
> commit fcd48092d7bcab0cad2606e65332da62420935ad
> Author: Joe Slater <jslater@windriver.com>
> Date:   Fri Mar 31 03:06:33 2017
>
>     volatile-binds: correct some errors reported by systemd
>
>     systemd-tmpfiles-setup will fail at boot, so we suppress
>     the default versions of etc.conf and home.conf.
>
>     We also make sure that /var/{cache,spool} and /srv are writeable
>     if they exist.
> ...
> -------------------
>
> The problem is that this suppresses the creation of a /etc/resolv.conf
> file, and without that DNS does not work.
>
> The file is a symlink to the resolv.conf that systemd provides in
> /run/systemd/resolve/resolv.conf, so it could potentially be
> prepopulated, but I admit I don't fully understand how this fits together.
>
> Any advice?
>

There's a bug open on this [1]. My workaround as for now is to apply [2],
but I'm not completely aware of the issue that suggested the original
commit you mention, hence there might be a better approach to fix this...

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11331
[2]
http://lists.openembedded.org/pipermail/openembedded-core/2017-April/136074.html



>
> --
> Kristian
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113dbb122db25d054fcb92af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, May 18, 2017 at 9:16 AM, Kristian Amlie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kristian.amlie@mender.io" target=3D"_blank">kristian.amlie@mende=
r.io</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">We&#39;ve discovered that one of the recent commits to poky has broken=
 DNS<br>
resolution in our image. The commit in questions is this one:<br>
<br>
-------------------<br>
commit fcd48092d7bcab0cad2606e65332da<wbr>62420935ad<br>
Author: Joe Slater &lt;<a href=3D"mailto:jslater@windriver.com">jslater@win=
driver.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Fri Mar 31 03:06:33 2017<br>
<br>
=C2=A0 =C2=A0 volatile-binds: correct some errors reported by systemd<br>
<br>
=C2=A0 =C2=A0 systemd-tmpfiles-setup will fail at boot, so we suppress<br>
=C2=A0 =C2=A0 the default versions of etc.conf and home.conf.<br>
<br>
=C2=A0 =C2=A0 We also make sure that /var/{cache,spool} and /srv are writea=
ble<br>
=C2=A0 =C2=A0 if they exist.<br>
...<br>
-------------------<br>
<br>
The problem is that this suppresses the creation of a /etc/resolv.conf<br>
file, and without that DNS does not work.<br>
<br>
The file is a symlink to the resolv.conf that systemd provides in<br>
/run/systemd/resolve/resolv.<wbr>conf, so it could potentially be<br>
prepopulated, but I admit I don&#39;t fully understand how this fits togeth=
er.<br>
<br>
Any advice?<br></blockquote><div><br></div><div>There&#39;s a bug open on t=
his [1]. My workaround as for now is to apply [2], but I&#39;m not complete=
ly aware of the issue that suggested the original commit you mention, hence=
 there might be a better approach to fix this...</div><div><br></div><div>[=
1]=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1133=
1">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11331</a></div><div>=
[2]=C2=A0<a href=3D"http://lists.openembedded.org/pipermail/openembedded-co=
re/2017-April/136074.html">http://lists.openembedded.org/pipermail/openembe=
dded-core/2017-April/136074.html</a></div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
Kristian<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a113dbb122db25d054fcb92af--
