Return-Path: <alex.kanavin@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB6776094D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:39:52 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r67so1500097pjb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8IoLDv3WzbEFmd0QY++RO5gF3vaErTpp+d2LZLjDTRA=;
	b=bBkrDOuaKvk+Cftj8dFrRsa/3GDuNAxvV2lS50TaWcfrJRKQJj03qpZjNSZhgy5FvB
	WlO29J04MPUNtf6vZZQD0wnKx3NiQrcYk0kE0DpY591acriabEvz/liOa34JrM1EDWys
	bIIsPA9wpu1/uHsSvLe2vI09qqpnS7+INa4pNjFbeLEFXXVMULp34o+7R21NEjPch1lN
	46hK7kbJrj4aSDPfTn3+p/c8YCwT9+YV3CpbBGQn9V5r3Dfx40rT4d74khyTXr2mspDs
	2TOSZf9KWxQa61GPFG2EGzG+DQKoodBRtHbR455z7xfBPVRFSO0UUBFmOOhYcLOpYidr
	Yo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8IoLDv3WzbEFmd0QY++RO5gF3vaErTpp+d2LZLjDTRA=;
	b=J0KXZKT5zyWEW3kU7TsaYCGKQIDi/t2OzhMhYBzFFh+FaBtAsLaNySpzV7+li2zf7S
	CyfQv3NiS3AoNcoZV4OjHJicX/XRsiPxFaCe5ZC07Kv4n1MxFvQNS8QqoL/Id8bya9F6
	hIVhe5MbUwaTKRwDZ8DC8K6LdawwsIyTp7L6/0Q8VVdCWTUx5nqdw/betZClgBgYoVJs
	wmbLEg4STZ6khq1FxESQSHpeu9WfRBtmE4WDZgZZC71oIlvbw6O7Tok3OR0WZ0Rz2B9F
	0CHlOIf3MAnkCRBuiq0jS5zQ1gFEtCM6HDPeWb7eYtBJxdBTQoIU8y3DiaKPs+nBuFB4
	xdXQ==
X-Gm-Message-State: APjAAAX+iNvh23UcXLgcw7MhH9xy978K5bFcX5nrHCF/Rk1Z55eJSGsQ
	xuB/eAcVbtXwr+zE2bb0adJkP+BmR2oZber02uO0Yw==
X-Google-Smtp-Source: APXvYqz+F/l1xsoh2BYdOS75Z4Rq1rU1oiLRhZPhx2Xq/PoCPQaj4LrD4wcfQINy5cR/rlU1EI78AIvKa3EO3BzBJXo=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr16388264vkc.29.1580283089165;
	Tue, 28 Jan 2020 23:31:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1580248809.git.bruce.ashfield@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2020 08:31:17 +0100
Message-ID: <CANNYZj_O7cMwJs_ND_MOwADb7PCc2XKJq3b1gQ0xaO7SbBr58g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3][RFT]: kernel-yocto: v5.4 LTS kernel
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
X-List-Received-Date: Thu, 30 Jan 2020 15:39:52 -0000
Content-Type: multipart/alternative; boundary="0000000000002ca09a059d4254aa"

--0000000000002ca09a059d4254aa
Content-Type: text/plain; charset="UTF-8"

Can these issues be bisected? That's how the two kernel regressions (both
found last year via ptests) were tracked down to specific commits.

Alex

On Tue, 28 Jan 2020 at 23:14, <bruce.ashfield@gmail.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Hi all,
>
> I just wanted to send these to the list, so everyone could see the
> reference kernel that we are planning for the upcoming release.
>
> I have other patches to drop 4.19, 5.2 and make this the default
> kernel for the various reference platforms as well, but I'm not
> sending them, since we still have two outstanding issues:
>
> 1) mips64 init is segfaulting after / during some self tests.
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/steps/8/logs/step6c
>
> 2) x86 musl is getting a gpf on many commands:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1501/steps/8/logs/step1c
>
> I've looked into both, and don't have any great ideas on how to debug
> or fix them.
>
> So if anyone has ideas, or wants to poke at these, feel free to follow up.
> But as of now, we still can't merge the v5.4 kernel as the reference due
> to these remaining problems.
>
> Bruce
>
>
> The following changes since commit
> ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:
>
>   bitbake: tests/fetch: Allow wget upgrade tests to run against a local
> server (2020-01-22 15:56:39 +0000)
>
> are available in the Git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
>
> Bruce Ashfield (3):
>   linux-yocto: introduce 5.4 recipes
>   kern-tools: update Kconfiglib to latest (for 5.4+ kernel)
>   kernel-devsrc: update to v5.4+
>
>  .../kern-tools/kern-tools-native_git.bb       |  2 +-
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |  8 +--
>  .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
>  .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++++++
>  5 files changed, 136 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
>
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002ca09a059d4254aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can these issues be bisected? That&#39;s how the two =
kernel regressions (both found last year via ptests) were tracked down to s=
pecific commits.<br></div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 28 Jan =
2020 at 23:14, &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfie=
ld@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail=
.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
Hi all,<br>
<br>
I just wanted to send these to the list, so everyone could see the<br>
reference kernel that we are planning for the upcoming release.<br>
<br>
I have other patches to drop 4.19, 5.2 and make this the default<br>
kernel for the various reference platforms as well, but I&#39;m not<br>
sending them, since we still have two outstanding issues:<br>
<br>
1) mips64 init is segfaulting after / during some self tests.<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/buil=
ders/44/builds/1520/steps/8/logs/step6c" rel=3D"noreferrer" target=3D"_blan=
k">https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/s=
teps/8/logs/step6c</a><br>
<br>
2) x86 musl is getting a gpf on many commands:<br>
<br>
=C2=A0 =C2=A0<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/buil=
ders/64/builds/1501/steps/8/logs/step1c" rel=3D"noreferrer" target=3D"_blan=
k">https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1501/s=
teps/8/logs/step1c</a><br>
<br>
I&#39;ve looked into both, and don&#39;t have any great ideas on how to deb=
ug<br>
or fix them.<br>
<br>
So if anyone has ideas, or wants to poke at these, feel free to follow up.<=
br>
But as of now, we still can&#39;t merge the v5.4 kernel as the reference du=
e<br>
to these remaining problems.<br>
<br>
Bruce<br>
<br>
<br>
The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba=
:<br>
<br>
=C2=A0 bitbake: tests/fetch: Allow wget upgrade tests to run against a loca=
l server (2020-01-22 15:56:39 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.pokylinux.org/poky-contrib" rel=3D"noref=
errer" target=3D"_blank">git.pokylinux.org/poky-contrib</a> zedd/kernel-oe<=
br>
=C2=A0 <a href=3D"http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dz=
edd/kernel-oe" rel=3D"noreferrer" target=3D"_blank">http://git.pokylinux.or=
g/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel-oe</a><br>
<br>
Bruce Ashfield (3):<br>
=C2=A0 linux-yocto: introduce 5.4 recipes<br>
=C2=A0 kern-tools: update Kconfiglib to latest (for 5.4+ kernel)<br>
=C2=A0 kernel-devsrc: update to v5.4+<br>
<br>
=C2=A0.../kern-tools/<a href=3D"http://kern-tools-native_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">kern-tools-native_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a>=C2=A0 =C2=A0 |=C2=A0 8 +=
--<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.4.bb" rel=3D"noreferrer"=
 target=3D"_blank">linux-yocto-rt_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 44 +++++++++++++++<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.4.bb" rel=3D"noreferre=
r" target=3D"_blank">linux-yocto-tiny_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 32 +++++++++++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a>=C2=A0 | 54 +++++++=
++++++++++++<br>
=C2=A05 files changed, 136 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto-rt_5.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.4.bb=
</a><br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto-tiny_5.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.=
4.bb</a><br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto_5.4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a><b=
r>
<br>
-- <br>
2.19.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000002ca09a059d4254aa--
