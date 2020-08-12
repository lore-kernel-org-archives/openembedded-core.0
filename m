Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.19516.1597252095081462414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iaBSt3EI;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id bs17so2104360edb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HLbZeVyLNhh8B1wWpYrhVeXJVHgG2Db9xgW05flZB5E=;
        b=iaBSt3EIlxyuLu2XPSR6n5wbUNdt9hBlMStJPZ3eH0ORk/Tu5IzqTScQuzqplQJGjB
         2Jd+l1lqYg4o9y4R5J6FCpww3E+v7YQYOHTY9pF7Y2iaAlA00VMRwrehHZ8kMbwZnwT2
         AQJs9VONQaiu4vFBIK08VlHRHTQBNLiviVwOKtNA2lbCORtCakJtCuDjOa8Dr8PjJ7Tl
         cGhi6R7ZDADcFxc/JbQnPgxuHi/Gc68a0b/wJNF1WB7+2p2FgtkCpD4b7Fjnx9bJAp+T
         F5T5wH1UmZd3RcKp6cH68xSQtsN5qFH6XzlujQetOkeSQBu+DGF6f8yB9bwLV7WZDLAt
         aDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HLbZeVyLNhh8B1wWpYrhVeXJVHgG2Db9xgW05flZB5E=;
        b=aT4UNqqVgfKQJgR/EpPy8HOz7JNuggZK/2BuBiiDvI0TTr16V5rf0ZUWCKWscs3xVO
         bWpGlIuh+Zmo42s7QHjnaZvf9jSDLtXYRpwzi6v9a9gNVZKbhOUGEI3AYt2edtK+TXg4
         4zVxaH/qxtFDD9eGMkYL6sw2odgGBRXRyLl5zh0t+eXMJ3f7inU6SVl1ed0H4wLJtPb4
         bS7n08mTyFY5c3Na1Ivj+oSDaAOZt7ZY3zyA0Zn8NwcPAh8fGPTjXLnlUFhKYmBCzsrS
         mZxwtYrNzn10lt+5aQd9aK/78T14tSOVn9sD5dkGJqQPGv5CXHdoTQN2YI6zUIybvHd4
         F4DA==
X-Gm-Message-State: AOAM530Eiz7mMLGb+DRTDB5+7YgmqiKoYIvXRu2UNfnX7tvEpWO34/mH
	AT/6L5JhszOAPjSOtMNi7LwZWeTYuvng5B//p/8=
X-Google-Smtp-Source: ABdhPJxaIY9PVuLqyVLaeTEXV6Ter18iEo+MEZfz+JuFguCT5HH8x+tPazSlSOXSwYcVi9Dj81kVeKgUvdhet7XaZfk=
X-Received: by 2002:a50:99cf:: with SMTP id n15mr846807edb.352.1597252093549;
 Wed, 12 Aug 2020 10:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <162A9410849FC6A4.13432@lists.openembedded.org>
In-Reply-To: <162A9410849FC6A4.13432@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 12 Aug 2020 13:08:02 -0400
Message-ID: <CADkTA4PN9XY_W2PZ38UhP7k_y_WCJ3UeK0sGxf9EQ0OJGd1JvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/10] kernel-yocto: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a722ec05acb13b09"

--000000000000a722ec05acb13b09
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 12, 2020 at 1:03 PM Bruce Ashfield via lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Richard,
>
> This is the part of my queue that is in preparation for the v5.8 kernel
> and libc-headers.
>
> I've been chasing issues that have (re)appeared (I fixed all these once
> before) with the recent gcc10 changes. I'm holding back the v5.8 core
> changes, until I can confirm that everything is indeed still working.
>

Also note that I am seeing some sort of test timeout on systemtap with
qemuarm. I'm debugging it now and will put something in bugzilla when I
know more, but from everything I can see, it isn't related to the kernel
updates, since I can build and run the same test locally without issue.

Bruce



>
> Along with the v5.8 prep changes, I have some tweaks to the recent
> symbol analysis update (to fix some issues reported on IRC).
>
> And finally, there are some routine v5.4 -stable kernel updates. I'll
> bump the reference BSPs as parts of some other series.
>
> Cheers,
>
> Bruce
>
> The following changes since commit
> f664ecb910fdcc20aa9d3db6f5402e9008a5dd13:
>
>   bitbake: data: emit filename/lineno information for shell functions
> (2020-08-08 09:19:34 +0100)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (9):
>   linux-yocto-rt/5.4: update to rt32
>   linux-yocto/5.4: update to v5.4.56
>   linux-yocto/5.4: update to v5.4.57
>   kernel-yocto: set cwd before querying the meta data dir
>   kernel-yocto: make # is not set matching more precise
>   kernel-yocto: split meta data gathering into patch and config phases
>   make-mod-scripts: add HOSTCXX definitions and gmp-native dependency
>   kernel-devsrc: fix on target modules prepare for ARM
>   kernel-devsrc: 5.8 + gcc10 require gcc-plugins + libmpc-dev
>
> Zhang Qiang (1):
>   kernel.bbclass: Configuration for environment with HOSTCXX
>
>  meta/classes/kernel-yocto.bbclass             | 74 +++++++++++--------
>  meta/classes/kernel.bbclass                   |  2 +
>  .../kern-tools/kern-tools-native_git.bb       |  2 +-
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |  6 +-
>  .../linux/linux-yocto-rt_5.4.bb               |  6 +-
>  .../linux/linux-yocto-tiny_5.4.bb             |  8 +-
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++---
>  .../make-mod-scripts/make-mod-scripts_1.0.bb  |  2 +
>  8 files changed, 71 insertions(+), 51 deletions(-)
>
> --
> 2.19.1
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a722ec05acb13b09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Aug 12, 2020 at 1:03 PM Bruce Ashfield via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;br=
uce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.as=
hfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
Richard,<br>
<br>
This is the part of my queue that is in preparation for the v5.8 kernel<br=
>
and libc-headers.<br>
<br>
I&#39;ve been chasing issues that have (re)appeared (I fixed all these onc=
e<br>
before) with the recent gcc10 changes. I&#39;m holding back the v5.8 core<=
br>
changes, until I can confirm that everything is indeed still working.<br><=
/blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">Also note that I am seeing some sort of test timeout on systemt=
ap with qemuarm. I&#39;m debugging it now and will put something in bugzill=
a when I know more, but from everything I can see, it isn&#39;t related to =
the kernel updates, since I can build and run the same test locally without=
 issue.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Along with the v5.8 prep changes, I have some tweaks to the recent<br>
symbol analysis update (to fix some issues reported on IRC).<br>
<br>
And finally, there are some routine v5.4 -stable kernel updates. I&#39;ll<=
br>
bump the reference BSPs as parts of some other series.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
The following changes since commit f664ecb910fdcc20aa9d3db6f5402e9008a5dd1=
3:<br>
<br>
=C2=A0 bitbake: data: emit filename/lineno information for shell functions=
 (2020-08-08 09:19:34 +0100)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"n=
oreferrer" target=3D"_blank">git.yoctoproject.org/poky-contrib</a> zedd/ker=
nel<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=
=3Dzedd/kernel" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproje=
ct.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel</a><br>
<br>
Bruce Ashfield (9):<br>
=C2=A0 linux-yocto-rt/5.4: update to rt32<br>
=C2=A0 linux-yocto/5.4: update to v5.4.56<br>
=C2=A0 linux-yocto/5.4: update to v5.4.57<br>
=C2=A0 kernel-yocto: set cwd before querying the meta data dir<br>
=C2=A0 kernel-yocto: make # is not set matching more precise<br>
=C2=A0 kernel-yocto: split meta data gathering into patch and config phase=
s<br>
=C2=A0 make-mod-scripts: add HOSTCXX definitions and gmp-native dependency=
<br>
=C2=A0 kernel-devsrc: fix on target modules prepare for ARM<br>
=C2=A0 kernel-devsrc: 5.8 + gcc10 require gcc-plugins + libmpc-dev<br>
<br>
Zhang Qiang (1):<br>
=C2=A0 kernel.bbclass: Configuration for environment with HOSTCXX<br>
<br>
=C2=A0meta/classes/kernel-yocto.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 74 +++++++++++--------<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0.../kern-tools/<a href=3D"http://kern-tools-native_git.bb" rel=3D"no=
referrer" target=3D"_blank">kern-tools-native_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D=
"noreferrer" target=3D"_blank">kernel-devsrc.bb</a>=C2=A0 =C2=A0 |=C2=A0 6 =
+-<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.4.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto-rt_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.4.bb" rel=3D"noreferr=
er" target=3D"_blank">linux-yocto-tiny_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a>=C2=A0 | 22 +++---=
<br>
=C2=A0.../make-mod-scripts/<a href=3D"http://make-mod-scripts_1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a>=C2=A0 |=C2=
=A0 2 +<br>
=C2=A08 files changed, 71 insertions(+), 51 deletions(-)<br>
<br>
-- <br>
2.19.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000a722ec05acb13b09--
