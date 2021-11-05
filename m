Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254C3C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 01:39:28 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.76.1636076366796344453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 18:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dBnx+gnf;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id f8so27928684edy.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 18:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ivxn8SwUtzla5/mfjARP0KPeE2DqQhADtjMtfIPOXi0=;
        b=dBnx+gnfls7OIDUlfIU/8sF9fJsvW/ttYq4oc2KIK2i8W6d5OQTE1TXe/Ac3ePx7sO
         GT+ouM8A3ilmM5k9JBMGImkOwHoMv66/aviBWNyAbfXkO6usnQXpRnQvYCLr2TNr2L2l
         U/UFad4jZPWpePxyhQQdDmv/pEGJzRWs0J2do2bgYJot9AhGvjpy3pOMzwr9/OnUSg1g
         AhBWy7HTOHeo35oZwDmW0rpRHIdwFPmNohr+70C3lGYcUbQFF/Aeo3TRhd7ybBHdTS7V
         TO0Vv07UKI0q+rewQuZNDThvHOA6PtQVqn74WpH9GfQoPVbaIpzJD8GkxOHVyle1gsj0
         48hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ivxn8SwUtzla5/mfjARP0KPeE2DqQhADtjMtfIPOXi0=;
        b=bCvjKrgSQ5Kwiw05DmdlrYI+PUyl9H0jCInJpz6LUkgyO3zYmZJ5JbYM1RuHDitkKN
         DUBz6MGYXT8WGOI9dQn7g3nUGlR4kq4a/BK5cQveebfGztyJDMPo/BnwBkGD+1lG0VCN
         Cg80QRNONEQ2QKXJ4tQHvELZPTsrCDUcik/ZDgU8OO2cMmfrejNAjfcE1V8q74dt8c2D
         KDSoz+7C/KW4GVX7NTfJbi7iB602s5taIvK513Mr2aR3clfSoBoCz6wu/iF0OdjeYF7m
         0YqVg5+diJVuVtoxZrng+IghW+pIkoBxi5eLNUwkea6KTmmw6mRaKA2UfJWMW1O5yYq+
         Z6Dg==
X-Gm-Message-State: AOAM532tRgLYKl4lQMMZTb+yd2CQavtNtu6cpK10wiFARFmwv816kzN8
	wDI2o7AQf7PZAIdbEwCnPhy7LUJGRg/AnXHj7as=
X-Google-Smtp-Source: 
 ABdhPJxrCZ/+vcjeUEd0CQT4hwNa5YcLhQ4WZJTtdR4y2njbgrIb+n3KKHcd6fxaTDfY8bgHRnGOxh2HqXpwCsrRNLk=
X-Received: by 2002:aa7:cd99:: with SMTP id
 x25mr29053819edv.249.1636076365261;
 Thu, 04 Nov 2021 18:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
 <12549bda-6366-a38d-e5fb-7261788f362b@gmail.com>
In-Reply-To: <12549bda-6366-a38d-e5fb-7261788f362b@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Nov 2021 21:39:14 -0400
Message-ID: 
 <CADkTA4NMiH4Ntx-Y6LZetjyiSXLogyS+bYf+vMBhkOiVELQE5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] kernel: consolidated pull request
To: Khem Raj <raj.khem@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000093afcd05d000b628"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 01:39:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157880

--00000000000093afcd05d000b628
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 4, 2021 at 4:57 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 11/4/21 12:48 PM, Bruce Ashfield wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's a broad set of kernel updates:
> >
> >   - stable for 5.14
> >   - stable for 5.10
> >
> > And then the bigger, a way earlier than normal:
> >
> >   - libc-headers bump to 5.15
> >   - 5.15 reference kernel recipes
> >
> > As everyone has probably heard, 5.15 is the next kernel LTS, so I
> > wanted to establish it for the next release earlier than normal. Due
> > to the -dev testing, things like lttng, perf and devsrc are already
> > ready to go, so this is a smaller pull request than normal.
> >
> > I had to fixup strace, and the vboxguest drivers (patch sent to
> > meta-oe)
> >
> > I've run it through the AB and everything came back green, as well
> > as my local testing.
> >
> > This isn't the default for any of the machines yet (but I have
> > local patches for that as well). The h/w reference boards
> > stil use 5.14 and need to be updated, but the plan is to remove 5.14,
> > and eventually 5.10 from master, and we'll go with 5.15, and 5.16+
> > in the spring 2022 release.
>
> also 5.10 ? I think there perhaps will be enough folks needing 5.10
> Since next YP release is also LTS, I wonder if we should keep kernel
> UAPIs as a LTS kernel too.
>

While we have to wait a bit longer to hear, it is very likely that 5.15
will outlast 5.10 in terms of support .. since almost every other LTS has
picked up extended support. As for 5.10 (I state the obvious), that's what
the release branches are for :)

We've never kept more than 2 released + 1 dev kernels active at once (in
master) .. one can always find a consumer of any particular version or
subversion, and they are convinced they need it.  5.15 is a definite, as is
something newer than it (because we absolutely need newer for
feature/platform/bleeding edge), which leaves 5.10 on the bubble.

Just because the recipe isn't in master, doesn't mean I'm not updating and
maintaining it .. it just means that we aren't doing a matrix of tests on
it, since that would be 4x (if you count -dev) active kernels in master and
that's a significant overhead.

That all being said, I'm not removing anything yet, and we'll see where the
chips fall on that front!

I've taken note, it can all be mixed into the consideration. The fact that
you read my yammering closely enough to comment, gives weight to
the request :)

Bruce



>
> >
> > Cheers,
> >
> > Bruce
> >
> > The following changes since commit
> 3e9c4801216111496acffdfdccf1deae3b3d6b96:
> >
> >    insane.bbclass: Add a check for directories that are expected to be
> empty (2021-11-03 11:12:26 +0000)
> >
> > are available in the Git repository at:
> >
> >    git://git.yoctoproject.org/poky-contrib zedd/kernel
> >    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> >
> > Bruce Ashfield (6):
> >    linux-yocto/5.14: update to v5.14.15
> >    linux-yocto/5.10: update to v5.10.76
> >    linux-libc-headers: update to v5.15
> >    linux-yocto-rt/5.10: update to -rt54
> >    linux-yocto/5.15: introduce recipes
> >    strace: fix build against 5.15 kernel/kernel-headers
> >
> >   meta/conf/distro/include/tcmode-default.inc   |   2 +-
> >   ...1-Avoid-relying-on-presence-of-ipx.h.patch | 151 ++++++++++++++++++
> >   meta/recipes-devtools/strace/strace_5.14.bb   |   1 +
> >   ...ers_5.14.bb => linux-libc-headers_5.15.bb} |   4 +-
> >   .../linux/linux-yocto-rt_5.10.bb              |   6 +-
> >   .../linux/linux-yocto-rt_5.14.bb              |   6 +-
> >   .../linux/linux-yocto-rt_5.15.bb              |  45 ++++++
> >   .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
> >   .../linux/linux-yocto-tiny_5.14.bb            |   8 +-
> >   .../linux/linux-yocto-tiny_5.15.bb            |  32 ++++
> >   meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
> >   meta/recipes-kernel/linux/linux-yocto_5.14.bb |  26 +--
> >   meta/recipes-kernel/linux/linux-yocto_5.15.bb |  68 ++++++++
> >   13 files changed, 339 insertions(+), 42 deletions(-)
> >   create mode 100644
> meta/recipes-devtools/strace/strace/0001-Avoid-relying-on-presence-of-ipx.h.patch
> >   rename meta/recipes-kernel/linux-libc-headers/{
> linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} (81%)
> >   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> >   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> >   create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.15.bb
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157862):
> https://lists.openembedded.org/g/openembedded-core/message/157862
> > Mute This Topic: https://lists.openembedded.org/mt/86824892/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000093afcd05d000b628
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 4, 2021 at 4:57 PM Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 11/4/21 12:48 PM, Bruce Ashfield wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Richard,<br>
&gt; <br>
&gt; Here&#39;s a broad set of kernel updates:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- stable for 5.14<br>
&gt;=C2=A0 =C2=A0- stable for 5.10<br>
&gt; <br>
&gt; And then the bigger, a way earlier than normal:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- libc-headers bump to 5.15<br>
&gt;=C2=A0 =C2=A0- 5.15 reference kernel recipes<br>
&gt; <br>
&gt; As everyone has probably heard, 5.15 is the next kernel LTS, so I<br>
&gt; wanted to establish it for the next release earlier than normal. Due<b=
r>
&gt; to the -dev testing, things like lttng, perf and devsrc are already<br=
>
&gt; ready to go, so this is a smaller pull request than normal.<br>
&gt; <br>
&gt; I had to fixup strace, and the vboxguest drivers (patch sent to<br>
&gt; meta-oe)<br>
&gt; <br>
&gt; I&#39;ve run it through the AB and everything came back green, as well=
<br>
&gt; as my local testing.<br>
&gt; <br>
&gt; This isn&#39;t the default for any of the machines yet (but I have<br>
&gt; local patches for that as well). The h/w reference boards<br>
&gt; stil use 5.14 and need to be updated, but the plan is to remove 5.14,<=
br>
&gt; and eventually 5.10 from master, and we&#39;ll go with 5.15, and 5.16+=
<br>
&gt; in the spring 2022 release.<br>
<br>
also 5.10 ? I think there perhaps will be enough folks needing 5.10 <br>
Since next YP release is also LTS, I wonder if we should keep kernel <br>
UAPIs as a LTS kernel too.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">While we have to wait a bit lo=
nger to hear, it is very likely that 5.15 will outlast 5.10 in terms of sup=
port .. since almost every other LTS has picked up extended support. As for=
 5.10 (I state the obvious), that&#39;s what the release branches are for :=
)=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">We&#39;ve never k=
ept more than 2 released + 1 dev kernels active at once (in master) .. one =
can always find a consumer of any particular version or subversion, and the=
y are convinced they need it.=C2=A0 5.15 is a definite, as is something new=
er than it (because we absolutely need newer for feature/platform/bleeding =
edge), which leaves 5.10 on the bubble.</div></div><div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">Just because the recipe isn&#39;t in master, does=
n&#39;t mean I&#39;m not updating and maintaining it .. it just means that =
we aren&#39;t doing a matrix of tests on it, since that would be 4x (if you=
 count -dev) active kernels in master and that&#39;s a significant overhead=
.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">That all being said, I&=
#39;m not removing anything yet, and we&#39;ll see where the chips fall on =
that front!=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;v=
e taken note,=C2=A0it can all be mixed into the consideration. The fact tha=
t you read my yammering closely enough to comment, gives weight to the=C2=
=A0request :)</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; The following changes since commit 3e9c4801216111496acffdfdccf1deae3b3=
d6b96:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 insane.bbclass: Add a check for directories that are expe=
cted to be empty (2021-11-03 11:12:26 +0000)<br>
&gt; <br>
&gt; are available in the Git repository at:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib=
" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/poky-contrib</a=
> zedd/kernel<br>
&gt;=C2=A0 =C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-cont=
rib/log/?h=3Dzedd/kernel" rel=3D"noreferrer" target=3D"_blank">http://git.y=
octoproject.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel</a><br>
&gt; <br>
&gt; Bruce Ashfield (6):<br>
&gt;=C2=A0 =C2=A0 linux-yocto/5.14: update to v5.14.15<br>
&gt;=C2=A0 =C2=A0 linux-yocto/5.10: update to v5.10.76<br>
&gt;=C2=A0 =C2=A0 linux-libc-headers: update to v5.15<br>
&gt;=C2=A0 =C2=A0 linux-yocto-rt/5.10: update to -rt54<br>
&gt;=C2=A0 =C2=A0 linux-yocto/5.15: introduce recipes<br>
&gt;=C2=A0 =C2=A0 strace: fix build against 5.15 kernel/kernel-headers<br>
&gt; <br>
&gt;=C2=A0 =C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0...1-Avoid-relying-on-presence-of-ipx.h.patch | 151 ++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/strace/<a href=3D"http://strace_5.14=
.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.14.bb</a>=C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0...<a href=3D"http://ers_5.14.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ers_5.14.bb</a> =3D&gt; <a href=3D"http://linux-libc-headers_5=
.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_5.15.bb</a>=
} |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 =C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.10.bb" rel=3D=
"noreferrer" target=3D"_blank">linux-yocto-rt_5.10.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.14.bb" rel=3D=
"noreferrer" target=3D"_blank">linux-yocto-rt_5.14.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.15.bb" rel=3D=
"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 45 ++++++<br>
&gt;=C2=A0 =C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.10.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.10.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.14.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.14.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 32 ++++<br>
&gt;=C2=A0 =C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.=
10.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.10.bb</a> |=C2=A0=
 24 +--<br>
&gt;=C2=A0 =C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.=
14.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.14.bb</a> |=C2=A0=
 26 +--<br>
&gt;=C2=A0 =C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.=
15.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a> |=C2=A0=
 68 ++++++++<br>
&gt;=C2=A0 =C2=A013 files changed, 339 insertions(+), 42 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/strace/strace/000=
1-Avoid-relying-on-presence-of-ipx.h.patch<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-kernel/linux-libc-headers/{<a href=3D"=
http://linux-libc-headers_5.14.bb" rel=3D"noreferrer" target=3D"_blank">lin=
ux-libc-headers_5.14.bb</a> =3D&gt; <a href=3D"http://linux-libc-headers_5.=
15.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_5.15.bb</a>}=
 (81%)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"ht=
tp://linux-yocto-rt_5.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-yoc=
to-rt_5.15.bb</a><br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"ht=
tp://linux-yocto-tiny_5.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-y=
octo-tiny_5.15.bb</a><br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"ht=
tp://linux-yocto_5.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_=
5.15.bb</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#157862): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/157862" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/157862</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86824892=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86824892/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>- Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
><br></div></div>

--00000000000093afcd05d000b628--

