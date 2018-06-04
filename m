Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5A31B747B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 12:32:10 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id 36-v6so22989161lfr.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jcHJXsQOF1hpZZ9wwJoIhNhc1s+XvgyWlkJF+tJf/cA=;
	b=nuQN3G8CRlbOGXkxkDro/mWp7h/pzHbDEww1bUaJ0MafDy2yicE0lpFXjg0nhDXiyG
	r8/3JjIbFf4wC9bN4XFOGjDhAyvYQ7WktaUkpsFhOjwAPooXLKyqcbnOvfMsGCEocUk1
	wLqkDQvb16PEfMR5z4FS6SpVVwOWWENdeMtZbmdDcz2fMgzTHcMzagZ9Bj0rh6kQPZwD
	6VpWDDYE+AbiBJ9C+/+kFwBbXS9hPi2tGce+uSQt94uNQM5YDXrG/f4zWTX8HJ6AsZOb
	P6xuJDPGALFxp4f7BtIFMV9cN7FhjKH7iwaHLVAQaCUw7QpoVSHnDu8WMBOh6m4oUxza
	Kaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jcHJXsQOF1hpZZ9wwJoIhNhc1s+XvgyWlkJF+tJf/cA=;
	b=E0K3Gt66AwboirP9G6r0w5zKr7INOAkWTNyVOvJ1pP0TQoV9c2Dm9199PhcVAG84UN
	7S/sFYIh0ycstCZJFdu0wcOrKm3jEyDRBVhrwBcEsBCd+b9ybeLY4aeVkMJ0CZhRhMus
	v+EtcFbVZf3jo3CC2Qaey5xLATjcy6TN9Tt8ztTWs6dmv4XR/eDbuTDQ+DZUWHuUdycw
	mG7HIQitxpa7VCAtiHp18rhpqsHbe4fgjVyiCE/Vg6lFK9Ilu0ibXvlN01LZUyySLHvE
	ZZhKx7Zin4kXpD30jDXKSeaG6YN73sVowpdeBtFeQYPSinP7BhCkkwXjwvNxDd+vrY9z
	6Mew==
X-Gm-Message-State: ALKqPwdlnAfsUvTHXhM71j3Up9veUszjB2mxZAk07RiW3Gx5OadJxA/a
	VYM0DtcZ/GyaYE35VekpLsB+lhDwA28A+S6fy68=
X-Google-Smtp-Source: ADUXVKIkz9CY+3vC63kuP8hJOdvdSxVWzTAz/l2GiQrKaWCakuZWz0FFCAa9cdzKuWVE4AfcyjrO4DItOkbY/o2LOsc=
X-Received: by 2002:a2e:2bcb:: with SMTP id
	r72-v6mr15824945ljr.133.1528115530793; 
	Mon, 04 Jun 2018 05:32:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 05:32:10 -0700 (PDT)
In-Reply-To: <be75fca2a4a635993bfaf89073fc0bd3@basmevissen.nl>
References: <be75fca2a4a635993bfaf89073fc0bd3@basmevissen.nl>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 4 Jun 2018 08:32:10 -0400
Message-ID: <CADkTA4NSLvgp8-YQom+5fcq-_ML_bPOFyCT39673ZKRdVFCHTA@mail.gmail.com>
To: Bas Mevissen <abuse@basmevissen.nl>
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: Summary of kernel-devsrc package issues (Sumo)
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
X-List-Received-Date: Mon, 04 Jun 2018 12:32:10 -0000
Content-Type: multipart/alternative; boundary="000000000000638699056dd01f6f"

--000000000000638699056dd01f6f
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 4, 2018 at 5:04 AM, Bas Mevissen <abuse@basmevissen.nl> wrote:

>
>
> Hi all,
>
> I ran into several issues with kernel-devsrc when building Poky Sumu with
> the meta-freescale layer for an Freescale i.mx6sx ARM board. In this
> mail(thread) I would like to collect them all and discuss the possible
> options to resolve them.
>
> * Install dependency issues (both during image creation and manual install
> on the board):
>
> The kernel-devsrc spec file defines a number of auto-generated run-time
> dependencies. These include
> (1) /bin/awk
> (2) /usr/bin/python
>
> (1) is due to scripts/ver_linux being an awk script using /bin/awk in its
> shebang in various (vendor) kernels, even recent ones. Instead of fixing
> all those kernel sources, I would suggest:
> 1a) adding a link to /bin/awk in the awk or the kernel-devsrc package
> 1b) automatically fix the kernel source included in the kernel-devsrc
> package
> 1c) having a more helpful error message?
>
> (2) is normally fine, but on my build, there is only /usr/bin/python3. A
> manually created symlink fixed the issue. I'm wondering what a more
> permanent solution would be:
> 2a) Fix all Python script in the installed kernel source like 1b)? (the
> python3-native package does create such a symlink, but not the target one!)
> 2b) See whether there is a package that already creates that symlink and
> make kernel-devsrc depend on it?
>
> * External module build issue:
>
> When building an external module (rtl8812au driver) on the board using
> kernel-devsrc, I ran into the following issues:
>
> (3) No symlink from /lib/modules/`uname -r`/build to the kernel source.
> Solution:
> 3a) Add this symlink (and optionally "source") to kernel-devsrc,
> comparable to Fedora kernel-headers package
>
> (4) The scripts where not build, resulting in build error. Solution:
> 4b) Pre-build scripts ("make scripts") in kernel-devsrc. Should be ok, as
> the package is already arch dependent.
>
> (remarkably, there is mention of both in the kernel-devsrc.bb file, but I
> think the current solutions are wrong as the package is not ready-to-use
> currently)
>
> * Multiple kernel support:
>
> When developing, multiple kernel versions might be installed. Current
> version of the package installs in /usr/src/kernel without the kver in the
> patch.
>
> (5) So you can have only 1 set of kernel sources installed. Proposal:
> (5a) Install in /usr/src/kernels/`uname r` following the way Fedora does
> it.
>
> * Huge size of package
>
> (6) The package contains an awful lot of files and is huge. Not all of
> them are needed to compile external kernel modules
> 6a) Remove the sources and only provide what is needed to build external
> kernel modules (like fedora)
> 6b) Create the package suggested at 6a) (or add it to kernel-dev) and keep
> the devsrc as the full-source alternative.
>
>
> Your thoughts? I'm more than happy to fix the issues and provide patches.
> However, I need input on what direction to go on the issues I ran into
> until now.
>

There's already a completely re-written kernel-devsrc that I posted in the
last
dev cycle, which will be re-sent in the next few days. The only reason it
didn't
merge was due to a multlib issue, which should be sorted out now.

So please, don't do any patches on top of the existing devsrc structure,
since
it is essentially obsolete.

Cheers,

Bruce


>
> Thanks,
>
> Bas.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000638699056dd01f6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jun 4, 2018 at 5:04 AM, Bas Mevissen <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:abuse@basmevissen.nl" target=3D"_blank">abuse@basmevissen.nl<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Hi all,<br>
<br>
I ran into several issues with kernel-devsrc when building Poky Sumu with t=
he meta-freescale layer for an Freescale i.mx6sx ARM board. In this mail(th=
read) I would like to collect them all and discuss the possible options to =
resolve them.<br>
<br>
* Install dependency issues (both during image creation and manual install =
on the board):<br>
<br>
The kernel-devsrc spec file defines a number of auto-generated run-time dep=
endencies. These include<br>
(1) /bin/awk<br>
(2) /usr/bin/python<br>
<br>
(1) is due to scripts/ver_linux being an awk script using /bin/awk in its s=
hebang in various (vendor) kernels, even recent ones. Instead of fixing all=
 those kernel sources, I would suggest:<br>
1a) adding a link to /bin/awk in the awk or the kernel-devsrc package<br>
1b) automatically fix the kernel source included in the kernel-devsrc packa=
ge<br>
1c) having a more helpful error message?<br>
<br>
(2) is normally fine, but on my build, there is only /usr/bin/python3. A ma=
nually created symlink fixed the issue. I&#39;m wondering what a more perma=
nent solution would be:<br>
2a) Fix all Python script in the installed kernel source like 1b)? (the pyt=
hon3-native package does create such a symlink, but not the target one!)<br=
>
2b) See whether there is a package that already creates that symlink and ma=
ke kernel-devsrc depend on it?<br>
<br>
* External module build issue:<br>
<br>
When building an external module (rtl8812au driver) on the board using kern=
el-devsrc, I ran into the following issues:<br>
<br>
(3) No symlink from /lib/modules/`uname -r`/build to the kernel source. Sol=
ution:<br>
3a) Add this symlink (and optionally &quot;source&quot;) to kernel-devsrc, =
comparable to Fedora kernel-headers package<br>
<br>
(4) The scripts where not build, resulting in build error. Solution:<br>
4b) Pre-build scripts (&quot;make scripts&quot;) in kernel-devsrc. Should b=
e ok, as the package is already arch dependent.<br>
<br>
(remarkably, there is mention of both in the <a href=3D"http://kernel-devsr=
c.bb" rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> file, but I=
 think the current solutions are wrong as the package is not ready-to-use c=
urrently)<br>
<br>
* Multiple kernel support:<br>
<br>
When developing, multiple kernel versions might be installed. Current versi=
on of the package installs in /usr/src/kernel without the kver in the patch=
.<br>
<br>
(5) So you can have only 1 set of kernel sources installed. Proposal:<br>
(5a) Install in /usr/src/kernels/`uname r` following the way Fedora does it=
.<br>
<br>
* Huge size of package<br>
<br>
(6) The package contains an awful lot of files and is huge. Not all of them=
 are needed to compile external kernel modules<br>
6a) Remove the sources and only provide what is needed to build external ke=
rnel modules (like fedora)<br>
6b) Create the package suggested at 6a) (or add it to kernel-dev) and keep =
the devsrc as the full-source alternative.<br>
<br>
<br>
Your thoughts? I&#39;m more than happy to fix the issues and provide patche=
s. However, I need input on what direction to go on the issues I ran into u=
ntil now.<br></blockquote><div><br></div><div>There&#39;s already a complet=
ely re-written kernel-devsrc that I posted in the last</div><div>dev cycle,=
 which will be re-sent in the next few days. The only reason it didn&#39;t<=
/div><div>merge was due to a multlib issue, which should be sorted out now.=
</div><div><br></div><div>So please, don&#39;t do any patches on top of the=
 existing devsrc structure, since</div><div>it is essentially obsolete.</di=
v><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
<br>
Bas.<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--000000000000638699056dd01f6f--
