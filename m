Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id A553E71957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 19:27:45 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id c11so215423uad.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KjSRHYbliErmvLlrzk9UY7288983uy31/XptiSPokQ0=;
	b=eOeBbGJmYvOPZtO5x66S4ThJhQD3kxjf/Uu0kKQb5fRM1jRDtEZE2MP3kt24dAA8dM
	WaBoyz3WJbfAaJTZK1kM511k8hE92K7c78amfP3oiq70Frkbu5YmsceV1+DieVfFr7Wu
	Uem41ObFWO6rsuIUHDSdo47wr5sNbs6bv27PcJcKVyGail//E8UfjyMue/NGsJX3QVOk
	WZf9MFqPq5rTb1nx0DtYaFCl+pFa2Kbrpq28ebJwbQ6XJc74YZWuYNZeZKfTRvWnnifp
	ag/4NY1kuPN8v+e15cQM+vo7IUfJEUtDXBW4+cam/1dy/jD9n0YvHnjee2+OzWr/ykYc
	CuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KjSRHYbliErmvLlrzk9UY7288983uy31/XptiSPokQ0=;
	b=f7+aUjwcJam8T/Zh17Eoe+GJOiw3UQZKkEcez+KVKNvORuw9Q+MgJ0pQn34wkpOKOf
	RFSft8KtN93wLxvxtkGy24B4jqWUeNuRHbI8tHkXmQanpfHmqJoQ1Stm5EzeSWzeF5xo
	N1994fz1x/DIOiGQJO6ClmVPLptv0jmby2ToYZhvpLVyXyMw88xsmlX+0VNumstP0bY9
	rb0D7sn4jC+T9fSp/NHantGd76w5iQhauzEL3R4xcrWLYGhwIJ+xXQDpgNSFg/azMF5+
	Yglixq9D9EzfDIA7yfckxtohbqJzcZwoiO9lktQJyfL062L7m6K4LFAvE77dwokWsSzk
	eIRw==
X-Gm-Message-State: AHYfb5hdZkLExvXDzHrQ3YIMX9RWKo4yb+x4CbUFh4kROmIQBX3CrQis
	pZ1CPpEjMMsIk9WQ7xZPPQP5CK44Aw==
X-Received: by 10.176.23.77 with SMTP id k13mr2322466uaf.128.1503514505716;
	Wed, 23 Aug 2017 11:55:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Wed, 23 Aug 2017 11:55:04 -0700 (PDT)
In-Reply-To: <cover.1503284343.git.bruce.ashfield@windriver.com>
References: <cover.1503284343.git.bruce.ashfield@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Aug 2017 14:55:04 -0400
Message-ID: <CADkTA4MReLT9ZefD10So9QV+bAYZeBB_Qb1XNH5-6Wy=5ZcJ4g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] poky: update default kernel to 4.12 and lsb to 4.9
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
X-List-Received-Date: Wed, 23 Aug 2017 19:27:46 -0000
Content-Type: multipart/alternative; boundary="f4030436207e0729fb05577040ee"

--f4030436207e0729fb05577040ee
Content-Type: text/plain; charset="UTF-8"

ignore this!

misfire of my script to send the updated BSP test.

Bruce

On Wed, Aug 23, 2017 at 2:54 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> Hi all,
>
> To match the pull request to oe-core that adds the 4.12 kernel and removes
> the 4.1 kernel these two patches bump the default kernel to 4.12 and also
> update LSB to use the 4.9 kernel.
>
> Build and boot testing was performed on all qemu architectures.
>
> Cheers,
>
> Bruce
>
> The following changes since commit 847d9000180cafedb23c60a6673adc
> ec62ca67a1:
>
>   linux-yocto/4.10: CVE & misc fixes (2017-08-20 22:38:46 -0400)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel-yocto
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-yocto
>
> Bruce Ashfield (2):
>   poky: bump preferred version of linux-yocto to 4.12
>   poky: bump poky lsb to linux 4.9
>
>  meta-poky/conf/distro/poky-lsb.conf | 2 +-
>  meta-poky/conf/distro/poky.conf     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.5.0
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

--f4030436207e0729fb05577040ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ignore this!=C2=A0<div><br></div><div>misfire of my script=
 to send the updated BSP test.</div><div><br></div><div>Bruce</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Aug 23, 201=
7 at 2:54 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.=
ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">Hi all=
,<br>
<br>
To match the pull request to oe-core that adds the 4.12 kernel and removes<=
br>
the 4.1 kernel these two patches bump the default kernel to 4.12 and also<b=
r>
update LSB to use the 4.9 kernel.<br>
<br>
Build and boot testing was performed on all qemu architectures.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
The following changes since commit 847d9000180cafedb23c60a6673adc<wbr>ec62c=
a67a1:<br>
<br>
=C2=A0 linux-yocto/4.10: CVE &amp; misc fixes (2017-08-20 22:38:46 -0400)<b=
r>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.pokylinux.org/poky-contrib" rel=3D"noref=
errer" target=3D"_blank">git.pokylinux.org/poky-<wbr>contrib</a> zedd/kerne=
l-yocto<br>
=C2=A0 <a href=3D"http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dz=
edd/kernel-yocto" rel=3D"noreferrer" target=3D"_blank">http://git.pokylinux=
.org/cgit.<wbr>cgi/poky-contrib/log/?h=3Dzedd/<wbr>kernel-yocto</a><br>
<br>
Bruce Ashfield (2):<br>
=C2=A0 poky: bump preferred version of linux-yocto to 4.12<br>
=C2=A0 poky: bump poky lsb to linux 4.9<br>
<br>
=C2=A0meta-poky/conf/distro/poky-<wbr>lsb.conf | 2 +-<br>
=C2=A0meta-poky/conf/distro/poky.<wbr>conf=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
--<br>
2.5.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
</span>Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div>

--f4030436207e0729fb05577040ee--
