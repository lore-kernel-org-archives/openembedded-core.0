Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD07EC65C15
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.17755.1650518073583440752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 22:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hy46me7U;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: rwmacleod@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id y14so3171593pfe.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 22:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RbJSP8dZco3/LwKWqvOKSJ+aklnL3sOEEiShFrlDTd8=;
        b=hy46me7U3vZ2TKbUAcFS++QI3uyvp2zHWCxbD1W0ENhBQeQKI2evFh/L8uhzLosddx
         orYeWW9yQdd8dydnWoFzanwcQLX0S35WCQoWiE1pJw/09rKZxEhgPpu3sbUmY7xiXmp/
         p0eir17ZEb/ixl1LMyeHJt0NyHhQp1oFF+vmAI1Kbm12Ioj3SDHeRY6AIJx2+DS/aBOI
         LN36Y4yXn0ASdSmlwAxnr9DgiRKK+RYkIF4R/+0SsjvAbEwwH06O0tAPNwd3YlnuYV/U
         TMxln1vBu4zB5jjZoH0C7uGV+Zt8zDDqFt6BS9rARw1mREzC7ChM6GFu2+2TY7OCeisD
         hHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RbJSP8dZco3/LwKWqvOKSJ+aklnL3sOEEiShFrlDTd8=;
        b=l8dBALv6GlLCktGUr4O1WDVtdL6PEQYsjO6HMxMKgzXo2PAd/9ks4sUe4XiQ979ZHM
         QvPF6TYLoIhr7d+ZjvnVoDGpgm/ySN1Oi4cKIOL0EyudXZrDfNt6y5j7DPCX4bzgxum5
         5KVm5dLD1GmR/UnvjO5dQGTep3O2UE1laU1vnHTtAu4pfZFqH9j2kHKzkuITY1a6dMst
         ShtIT7GuinqhuoTVGnNEkzb/uj4iAhe5Gnntjy2sHSc7bDCDP+4EE31dIYyl9BupDVtg
         lE+OKx/vgbRvBCpO5Y7XKKWLQ4COOOPgV5UQlVM+9vARc31zAAPkXGnEtfkSjCA1s6CA
         WRgA==
X-Gm-Message-State: AOAM531cEsgMkYca+zzPOk97E/F6n20FNg0Cyeyzf8OtgN/53XfiJzky
	GtbKyHVKgKV/DezvgcvK2ouZNexpKujrpO61MZDMv8Xp
X-Google-Smtp-Source: 
 ABdhPJzYlXoArRsea8ifOk7IfuiyUHB4cBKpsYAxtO9ncIzfWRm+NjHzqBPo39qMsCasskAVM3W8sB5gKJGeHjA393A=
X-Received: by 2002:a05:6a00:1584:b0:50a:b6a1:6579 with SMTP id
 u4-20020a056a00158400b0050ab6a16579mr9710603pfk.80.1650518072819; Wed, 20 Apr
 2022 22:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <16E7A00050A35F84.23874@lists.openembedded.org>
 <CAOSpxdbjagCMneqiUTotst++FJspGQXsd577H9TOfnVTm+xMpQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbjagCMneqiUTotst++FJspGQXsd577H9TOfnVTm+xMpQ@mail.gmail.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Thu, 21 Apr 2022 01:14:21 -0400
Message-ID: 
 <CAK6=ix5yd8nrnGYEsNLrqsAVmyzZmMh-q5O-kvv16CXEZDJRCQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/27] Patch review
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006d013605dd232fdc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164742

--0000000000006d013605dd232fdc
Content-Type: text/plain; charset="UTF-8"

On Wed., Apr. 20, 2022, 10:54 Steve Sakoman, <steve@sakoman.com> wrote:

> On Wed, Apr 20, 2022 at 4:08 AM Steve Sakoman via
> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> wrote:
> >
> > Please review this set of patches for kirkstone and have comments back by
> > end of day Friday.
>
> I'd particularly like feedback on the security/bug fix version updates
> at the end of this series.
>
> In the past I took these only on request.
>
> Would people like me to be more proactive on this type of upgrade
> (such as this series), or should I continue to take them only on
> request?
>

Proactive but reasonably cautious. ;-)
Some comments below.


> Steve
>
> >
> > Passed a-full on autobuilder:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3547
> >
> > The following changes since commit
> d2ba3b8850d461bc7b773240cdf15b22b31a3f9e:
> >
> >   lua: fix CVE-2022-28805 (2022-04-19 14:02:08 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib
> stable/kirkstone-nut
> >
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut
> >
> > Alexander Kanavin (1):
> >   webkitgtk: adjust patch status
> >
> > Davide Gardenal (1):
> >   create-spdx: fix error when symlink cannot be created
> >
> > Ferry Toth (2):
> >   apt: add apt selftest to test signed package feeds
> >   package_manager: fix missing dependency on gnupg when signing deb
> >     package feeds
> >
> > Jon Mason (1):
> >   qemuarm64: use virtio pci interfaces
> >
> > Kai Kang (1):
> >   update_udev_hwdb: fix multilib issue with systemd
> >
> > Khem Raj (5):
> >   babeltrace: Disable warnings as errors
> >   xserver-xorg: Fix build with gcc12
> >   systemtap: Fix build with gcc-12
> >   gnupg: Disable FORTIFY_SOURCES on mips
> >   mdadm: Drop clang specific cflags
> >
> > Konrad Weihmann (2):
> >   git: correct license
> >   ncurses: use COPYING file
> >
> > Martin Jansa (1):
> >   systemd-boot: remove outdated EFI_LD comment
> >
> > Paulo Neves (1):
> >   selftest/lic_checksum: Add test for filename containing space
> >
> > Peter Kjellerstedt (2):
> >   u-boot: Correct the SRC_URI
> >   u-boot: Inherit pkgconfig
> >
> > Richard Purdie (1):
> >   buildtools-tarball: Only add cert envvars if certs are included
> >
> > Ross Burton (1):
> >   zlib: upgrade to 1.2.12
> >
> > wangmy (5):
> >   linux-firmware: upgrade 20220310 -> 20220411
>


It's firmware so it should be fine but I don't know much about such things.
Have  firmware updates ever broken older kernels?
Certainly there could be performance degradation. I guess it's a release
note item for others to worry about.


>   libsoup: upgrade 3.0.5 -> 3.0.6
> >   apt: upgrade 2.4.3 -> 2.4.4
> >   libusb1: upgrade 1.0.25 -> 1.0.26
> >   libgit2: upgrade 1.4.2 -> 1.4.3
> >
> > zhengruoqin (3):
> >   wireless-regdb: upgrade 2022.02.18 -> 2022.04.08
> >   git: upgrade 2.35.2 -> 2.35.3
> >   ruby: upgrade 3.1.1 -> 3.1.2
>

These all seem like bug fix only updates.
Are you assuming that third number updates don't change API/ABI or looking
at commit summaries, git logs, or using a tool?


Thanks Steve.


Randy


>< snip ><

--0000000000006d013605dd232fdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed., Apr. 20, 2022, 10:54 Steve Sakoman, &lt;<a hr=
ef=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Wed, Apr 20, 2022 at 4:08 AM Steve Sakoman=
 via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sak=
oman.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">sakom=
an.com@lists.openembedded.org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Please review this set of patches for kirkstone and have comments back=
 by<br>
&gt; end of day Friday.<br>
<br>
I&#39;d particularly like feedback on the security/bug fix version updates<=
br>
at the end of this series.<br>
<br>
In the past I took these only on request.<br>
<br>
Would people like me to be more proactive on this type of upgrade<br>
(such as this series), or should I continue to take them only on<br>
request?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Proactive but reasonably cautious. ;-)</div><div dir=3D"auto">Som=
e comments below.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Steve<br>
<br>
&gt;<br>
&gt; Passed a-full on autobuilder:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/=
builds/3547" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobu=
ilder.yoctoproject.org/typhoon/#/builders/83/builds/3547</a><br>
&gt;<br>
&gt; The following changes since commit d2ba3b8850d461bc7b773240cdf15b22b31=
a3f9e:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0lua: fix CVE-2022-28805 (2022-04-19 14:02:08 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.openembedded.org/openembedded-=
core-contrib" rel=3D"noreferrer noreferrer" target=3D"_blank">git.openembed=
ded.org/openembedded-core-contrib</a> stable/kirkstone-nut<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/openembedded-core-=
contrib/log/?h=3Dstable/kirkstone-nut" rel=3D"noreferrer noreferrer" target=
=3D"_blank">http://cgit.openembedded.org/openembedded-core-contrib/log/?h=
=3Dstable/kirkstone-nut</a><br>
&gt;<br>
&gt; Alexander Kanavin (1):<br>
&gt;=C2=A0 =C2=A0webkitgtk: adjust patch status<br>
&gt;<br>
&gt; Davide Gardenal (1):<br>
&gt;=C2=A0 =C2=A0create-spdx: fix error when symlink cannot be created<br>
&gt;<br>
&gt; Ferry Toth (2):<br>
&gt;=C2=A0 =C2=A0apt: add apt selftest to test signed package feeds<br>
&gt;=C2=A0 =C2=A0package_manager: fix missing dependency on gnupg when sign=
ing deb<br>
&gt;=C2=A0 =C2=A0 =C2=A0package feeds<br>
&gt;<br>
&gt; Jon Mason (1):<br>
&gt;=C2=A0 =C2=A0qemuarm64: use virtio pci interfaces<br>
&gt;<br>
&gt; Kai Kang (1):<br>
&gt;=C2=A0 =C2=A0update_udev_hwdb: fix multilib issue with systemd<br>
&gt;<br>
&gt; Khem Raj (5):<br>
&gt;=C2=A0 =C2=A0babeltrace: Disable warnings as errors<br>
&gt;=C2=A0 =C2=A0xserver-xorg: Fix build with gcc12<br>
&gt;=C2=A0 =C2=A0systemtap: Fix build with gcc-12<br>
&gt;=C2=A0 =C2=A0gnupg: Disable FORTIFY_SOURCES on mips<br>
&gt;=C2=A0 =C2=A0mdadm: Drop clang specific cflags<br>
&gt;<br>
&gt; Konrad Weihmann (2):<br>
&gt;=C2=A0 =C2=A0git: correct license<br>
&gt;=C2=A0 =C2=A0ncurses: use COPYING file<br>
&gt;<br>
&gt; Martin Jansa (1):<br>
&gt;=C2=A0 =C2=A0systemd-boot: remove outdated EFI_LD comment<br>
&gt;<br>
&gt; Paulo Neves (1):<br>
&gt;=C2=A0 =C2=A0selftest/lic_checksum: Add test for filename containing sp=
ace<br>
&gt;<br>
&gt; Peter Kjellerstedt (2):<br>
&gt;=C2=A0 =C2=A0u-boot: Correct the SRC_URI<br>
&gt;=C2=A0 =C2=A0u-boot: Inherit pkgconfig<br>
&gt;<br>
&gt; Richard Purdie (1):<br>
&gt;=C2=A0 =C2=A0buildtools-tarball: Only add cert envvars if certs are inc=
luded<br>
&gt;<br>
&gt; Ross Burton (1):<br>
&gt;=C2=A0 =C2=A0zlib: upgrade to 1.2.12<br>
&gt;<br>
&gt; wangmy (5):<br>
&gt;=C2=A0 =C2=A0linux-firmware: upgrade 20220310 -&gt; 20220411<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">It&#39;s firmware so it should be fine but I don&#39;t kno=
w much about such things. Have=C2=A0 firmware updates ever broken older ker=
nels?=C2=A0</div><div dir=3D"auto">Certainly there could be performance deg=
radation. I guess it&#39;s a release note item for others to worry about.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt;=C2=A0 =C2=A0libsoup: upgrade 3.0.5 -&gt; 3.0.6<br>
&gt;=C2=A0 =C2=A0apt: upgrade 2.4.3 -&gt; 2.4.4<br>
&gt;=C2=A0 =C2=A0libusb1: upgrade 1.0.25 -&gt; 1.0.26<br>
&gt;=C2=A0 =C2=A0libgit2: upgrade 1.4.2 -&gt; 1.4.3<br>
&gt;<br>
&gt; zhengruoqin (3):<br>
&gt;=C2=A0 =C2=A0wireless-regdb: upgrade 2022.02.18 -&gt; 2022.04.08<br>
&gt;=C2=A0 =C2=A0git: upgrade 2.35.2 -&gt; 2.35.3<br>
&gt;=C2=A0 =C2=A0ruby: upgrade 3.1.1 -&gt; 3.1.2<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">These all seem like bug fix=
 only updates.</div><div dir=3D"auto">Are you assuming that third number up=
dates don&#39;t change API/ABI or looking at commit summaries, git logs, or=
 using a tool?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Thanks Steve.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Randy</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">&gt;&lt; snip &gt;&lt;=C2=A0</blockquote></d=
iv></div></div>

--0000000000006d013605dd232fdc--

