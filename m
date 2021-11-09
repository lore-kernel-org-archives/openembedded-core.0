Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879F8C433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 09:44:59 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web08.10058.1636451098188918878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 01:44:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PIGU7oSt;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id t13so22002838uad.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+mu5PWbd6iswyIaIPsaf+onBNmcTLHHL8OG8Fjli7Ps=;
        b=PIGU7oStz4347dyUVddM21nVrOyYBrEVOcGvYmmMFdkndMrVMXQG4kUvyaoasO+N5M
         j+bHXqZFyNCH8GSW0T8KcqU1fxp5JsPQxxlVP9F4hgc2e/ERIOHXH6uJRq5rssfm4tDz
         u9ACK6/u1lnUi6XZQj1w8GeLlYar9WCAssTMrZ6D0hhDt7bqTk4S9kvaXXR0W9rKAVFU
         wq1pCFtaNKkAeDXPuFoGfBfCfG9mXIb7FIhBSlW8Fg2KdiyftN2MBqckI9jRj6K3ekSQ
         VWc47osRHNHwwawyWRk23WPNVx8T/vcCVgJfUW3FJFs484570r0ZnVU5/xjgLLLruHZ8
         tbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+mu5PWbd6iswyIaIPsaf+onBNmcTLHHL8OG8Fjli7Ps=;
        b=7c+fJdypDA3e/d36HFq6U2J7orV0MOPK04L4nWTnTojTv1rwyv9ssYn3uZ0kORLFWl
         BzpanNM3us13LLcn+K+0d15Xk9Y/rGr1sr2Dx3lBNJiu7kkmZp8YQVWxB33aDqhtYGrw
         PQV/v29WEnoBs9L5I373VLXxqUcuFKCwRYTnktJpdWHnzVQVF8hCduMYqLFwWznvzrjc
         lnGvBsyu3JA0PqXj+JYdO9AXDCSmIISN3vSCBkamlA8MZeObVzd9uWylvPP2Ml6alpA9
         LBKUBSfsxth4rSRGLabpNclvdIJgbZl5vn1ciuu2s9Ks+aKpe1rLLblbes0gGbCDutkV
         9mZA==
X-Gm-Message-State: AOAM532m3f1bZI7Hzbu0l56+uZo2uMtweyIhxwA5uhkR2mQ/izF9dalq
	JPQ2Y1pBMFUP/DRjtUJ49OgCapHeFe08o9YrOvc=
X-Google-Smtp-Source: 
 ABdhPJySolVBURDDA74BAhRtskkxpu1edF9dmArxJajrTYx2hZKjpirKost9NjzuOqwTQptjO7pzAjswofCd1EklXdo=
X-Received: by 2002:a05:6102:c92:: with SMTP id
 f18mr9742353vst.13.1636451097194;
 Tue, 09 Nov 2021 01:44:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636447679.git.liezhi.yang@windriver.com>
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
 <AM9PR09MB46429C45C98E52EAF652EBF0A8929@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <f4b8c857-395d-2091-00c5-5c96a2ce536a@windriver.com>
In-Reply-To: <f4b8c857-395d-2091-00c5-5c96a2ce536a@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Nov 2021 10:44:45 +0100
Message-ID: 
 <CANNYZj9HcjwtHKqLwY2icgTrvK_SJzD5ue-4Gf38hrwPH8Yo3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of
 cpu number
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000057344305d057f66a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 09:44:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158005

--00000000000057344305d057f66a
Content-Type: text/plain; charset="UTF-8"

Maybe, but once we start doing tweaks like this, where do they stop? Hey,
I'd like to limit llvm and webkit threads too, they eat disproportionally
large amounts of RAM compared to everything else! I'd rather err on the
side of simple, striaghtforward, universal defaults, and having better
documentation for tweaking system resource consumption. Each build system
is different.

Alex

On Tue, 9 Nov 2021 at 10:40, Robert Yang <liezhi.yang@windriver.com> wrote:

>
>
> On 11/9/21 4:41 PM, Konrad Weihmann wrote:
> >
> >
> > On 09.11.21 09:48, Robert Yang wrote:
> >> The original value is very easy to cause do_packge error when cpu
> number is
> >> larger, for example, 128 cores and 512G mem:
> >>
> >> error: create archive failed: cpio: write failed - Cannot allocate
> memory"
> >>
> >> Set the ZSTD_THREADS to half of the CPU number can avoid the error in my
> >> testing.
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   meta/conf/bitbake.conf | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index 71c1e52ad6..46ebf5113f 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -833,7 +833,7 @@ XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT}
> >> --threads=${XZ_THREADS}"
> >>   XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
> >>   # Default parallelism for zstd
> >> -ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
> >> +ZSTD_THREADS ?= "${@int(oe.utils.cpu_count(at_least=4)/2)}"
> >
> > Then why not just limit it for the large setups you are referring to in
> the
> > example, for instance like
> >
> > ZSTD_THREADS ?= "${@min(int(oe.utils.cpu_count(at_least=4)), <insert a
> sane
> > value of your choice>)}"
>
> This sounds like a good choice.
>
> >
> > BTW this can be also done in your local.conf - as Alex already said,
> there is
>
> Set it in my local.conf can make it work, but it isn't good for oe-core's
> OOBE
> since the issue still exists.
>
> > simply no reason to make it slower for everyone, while also half the
> threads of
>
> The whole build contains a lot of tasks, for lower cpu cores, the total
> resources are fixed, so when zstd uses less mem, other tasks can use more.
>
> Limit zstd's thread doesn't make the build slower, but faster in my
> testing,
> it would be great if you can help test it. The simple testing commands are:
>
> # Make everything ready:
> $ bitbake linux-yocto
>
> # Before the patch, set ZSTD_THREADS to 128 and run 6 times:
> $ for i in `seq 0 5`; do time bitbake linux-yocto -cpackage_write_rpm -f >
> before_$i.log; done
>
> Note, the time will be printed on the screen, not the before.log, the
> before.log
> is for strip the logs and then we can read the time easier.
>
> What I get is:
> real    2m12.079s
> real    2m0.177s
> real    1m52.426s
> real    2m3.396s
> real    2m16.018s
> real    1m58.595s
>
> Drop the first build time since it *may* contain parsing time, and for the
> last
> five builds:
>
> Total: 609 seconds
> Average: 609 / 5.0 = 121.8
>
>
> # After the patch, set ZSTD_THREADS to 64, and run 6 times:
> $ for i in `seq 0 5`; do time bitbake linux-yocto -cpackage_write_rpm -f >
> after_$i.log; done
>
> What I get is:
> real    1m50.017s
> real    1m50.400s
> real    1m53.174s
> real    2m4.817s
> real    1m53.476s
> real    1m56.794s
>
> Drop the first build time since it *may* contain parsing time, and for the
> last
> five builds:
>
> Total: 576 seconds
> Average: 576 / 5.0 = 115.2
>
> So the smaller number is faster than the larger one.
>
> // Robert
>
> > a 128 core machine could be a trouble some setup.
> >
> > Last time I had this issue (with XZ back then) I used
> > "${@min(int(oe.utils.cpu_count(at_least=4)), 20}"
> >
> >>   ZSTD_THREADS[vardepvalue] = "1"
> >>   # Limit the number of threads that OpenMP libraries will use.
> Otherwise they
> >>
> >>
> >>
> >>
> >>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158004):
> https://lists.openembedded.org/g/openembedded-core/message/158004
> Mute This Topic: https://lists.openembedded.org/mt/86926962/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000057344305d057f66a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Maybe, but once we start doing tweaks like this, wher=
e do they stop? Hey, I&#39;d like to limit llvm and webkit threads too, the=
y eat disproportionally large amounts of RAM compared to everything else! I=
&#39;d rather err on the side of simple, striaghtforward, universal default=
s, and having better documentation for tweaking system resource consumption=
. Each build system is different.<br></div><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, 9 Nov 2021 at 10:40, Robert Yang &lt;<a href=3D"mailto:liezhi.yan=
g@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 11/9/21 4:41 PM, Konrad Weihmann wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 09.11.21 09:48, Robert Yang wrote:<br>
&gt;&gt; The original value is very easy to cause do_packge error when cpu =
number is<br>
&gt;&gt; larger, for example, 128 cores and 512G mem:<br>
&gt;&gt;<br>
&gt;&gt; error: create archive failed: cpio: write failed - Cannot allocate=
 memory&quot;<br>
&gt;&gt;<br>
&gt;&gt; Set the ZSTD_THREADS to half of the CPU number can avoid the error=
 in my<br>
&gt;&gt; testing.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windr=
iver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 meta/conf/bitbake.conf | 2 +-<br>
&gt;&gt; =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt;&gt; index 71c1e52ad6..46ebf5113f 100644<br>
&gt;&gt; --- a/meta/conf/bitbake.conf<br>
&gt;&gt; +++ b/meta/conf/bitbake.conf<br>
&gt;&gt; @@ -833,7 +833,7 @@ XZ_DEFAULTS ?=3D &quot;--memlimit=3D${XZ_MEMLI=
MIT} <br>
&gt;&gt; --threads=3D${XZ_THREADS}&quot;<br>
&gt;&gt; =C2=A0 XZ_DEFAULTS[vardepsexclude] +=3D &quot;XZ_MEMLIMIT XZ_THREA=
DS&quot;<br>
&gt;&gt; =C2=A0 # Default parallelism for zstd<br>
&gt;&gt; -ZSTD_THREADS ?=3D &quot;${@oe.utils.cpu_count(at_least=3D2)}&quot=
;<br>
&gt;&gt; +ZSTD_THREADS ?=3D &quot;${@int(oe.utils.cpu_count(at_least=3D4)/2=
)}&quot;<br>
&gt; <br>
&gt; Then why not just limit it for the large setups you are referring to i=
n the <br>
&gt; example, for instance like<br>
&gt; <br>
&gt; ZSTD_THREADS ?=3D &quot;${@min(int(oe.utils.cpu_count(at_least=3D4)), =
&lt;insert a sane <br>
&gt; value of your choice&gt;)}&quot;<br>
<br>
This sounds like a good choice.<br>
<br>
&gt; <br>
&gt; BTW this can be also done in your local.conf - as Alex already said, t=
here is <br>
<br>
Set it in my local.conf can make it work, but it isn&#39;t good for oe-core=
&#39;s OOBE<br>
since the issue still exists.<br>
<br>
&gt; simply no reason to make it slower for everyone, while also half the t=
hreads of <br>
<br>
The whole build contains a lot of tasks, for lower cpu cores, the total<br>
resources are fixed, so when zstd uses less mem, other tasks can use more.<=
br>
<br>
Limit zstd&#39;s thread doesn&#39;t make the build slower, but faster in my=
 testing,<br>
it would be great if you can help test it. The simple testing commands are:=
<br>
<br>
# Make everything ready:<br>
$ bitbake linux-yocto<br>
<br>
# Before the patch, set ZSTD_THREADS to 128 and run 6 times:<br>
$ for i in `seq 0 5`; do time bitbake linux-yocto -cpackage_write_rpm -f &g=
t; <br>
before_$i.log; done<br>
<br>
Note, the time will be printed on the screen, not the before.log, the befor=
e.log<br>
is for strip the logs and then we can read the time easier.<br>
<br>
What I get is:<br>
real=C2=A0 =C2=A0 2m12.079s<br>
real=C2=A0 =C2=A0 2m0.177s<br>
real=C2=A0 =C2=A0 1m52.426s<br>
real=C2=A0 =C2=A0 2m3.396s<br>
real=C2=A0 =C2=A0 2m16.018s<br>
real=C2=A0 =C2=A0 1m58.595s<br>
<br>
Drop the first build time since it *may* contain parsing time, and for the =
last<br>
five builds:<br>
<br>
Total: 609 seconds<br>
Average: 609 / 5.0 =3D 121.8<br>
<br>
<br>
# After the patch, set ZSTD_THREADS to 64, and run 6 times:<br>
$ for i in `seq 0 5`; do time bitbake linux-yocto -cpackage_write_rpm -f &g=
t; <br>
after_$i.log; done<br>
<br>
What I get is:<br>
real=C2=A0 =C2=A0 1m50.017s<br>
real=C2=A0 =C2=A0 1m50.400s<br>
real=C2=A0 =C2=A0 1m53.174s<br>
real=C2=A0 =C2=A0 2m4.817s<br>
real=C2=A0 =C2=A0 1m53.476s<br>
real=C2=A0 =C2=A0 1m56.794s<br>
<br>
Drop the first build time since it *may* contain parsing time, and for the =
last<br>
five builds:<br>
<br>
Total: 576 seconds<br>
Average: 576 / 5.0 =3D 115.2<br>
<br>
So the smaller number is faster than the larger one.<br>
<br>
// Robert<br>
<br>
&gt; a 128 core machine could be a trouble some setup.<br>
&gt; <br>
&gt; Last time I had this issue (with XZ back then) I used <br>
&gt; &quot;${@min(int(oe.utils.cpu_count(at_least=3D4)), 20}&quot;<br>
&gt; <br>
&gt;&gt; =C2=A0 ZSTD_THREADS[vardepvalue] =3D &quot;1&quot;<br>
&gt;&gt; =C2=A0 # Limit the number of threads that OpenMP libraries will us=
e. Otherwise they<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158004): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158004" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158004</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86926962/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86926962/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000057344305d057f66a--

