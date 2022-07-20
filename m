Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E84CCA480
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 12:14:36 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.53177.1658319267873838667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 05:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kUilANEw;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id bz13so6786614qtb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 05:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5PonE3FiRk7hXgbHsCzM5d141UarknlGXWNv14qR/mM=;
        b=kUilANEw0sCJmPUPE/CD180zI0pju31qGjpmRTWFZpr3w+Vb/PFClT5y2kU8JcgQ0B
         x8NeLwfiI34rArcvIilO/WvOeEIbPXDL6Name3HXX/5CixvkGqhbV35EkQFFp6240P5b
         ienzy/wG+EAxGfMGZ06F9VKbPKx0OrMaSu1BSCREgvj9K+ACKmDAyGh0h8eN+BzWvwhX
         urfk1YPer6Yann2lkY8vLgpE7fgogGTYJ0L88EFW3foxplYAOvLd4vqRQz5cOV+HfPrW
         HMojLMTwXO/QXsYJRIdvzjUGr0c3K9K0Qp770eOwx0nFUNV8aicUpZsy6/2wfJ188pbS
         AD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5PonE3FiRk7hXgbHsCzM5d141UarknlGXWNv14qR/mM=;
        b=Kq0/prumOh4YKYyvA+W46Vbe+demTP1F+uwHlTOkpLCEErDyPhOV6Jq1qlueHM5V9l
         4eY9VyCTAowqPoIPbS+wOH7EC8nxXJHAPvn9Gp1cUFwB6+eURxhUamgcDbZMYsd2xswy
         tYoBnRuBA2n/W2eD8ptrHHjRQs5yfDUtnalGu/s/ZaEywrhn5ajX1PcHFU7lTVUs2HqN
         W2xNJofGAejLy+EZxCtpLQGZNs+GAWIqKYNCs16hU55s6hhWu9DDTRwIOTm1NhDnxZqe
         dWpzJ0TQhUJwPe+op/lCIDcD0RVs2VC0HjCNQ0qCojGcJJMBiAvULrSQqZ9onfzNQyV0
         LozQ==
X-Gm-Message-State: AJIora+l1E8rOY8+4JYe00y4pzSAynyCX+Ef7WqzxgnPkB5B4B53f43X
	nkdn6xvramAZ9LGZhza6WG7xvWhvySqhWp4RsujpTHgCTzI=
X-Google-Smtp-Source: 
 AGRyM1vEyq6SfIMq9c9JLWHjLTynF+zcW2oZWDQW+Bl6VYZYGuSnBUt2I0n+gpga7yb7u5+m3egD732EcieQW++fSAM=
X-Received: by 2002:a05:622a:386:b0:31f:b1c:5017 with SMTP id
 j6-20020a05622a038600b0031f0b1c5017mr865250qtx.532.1658319266721; Wed, 20 Jul
 2022 05:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220705070318.737747-1-mingli.yu@windriver.com>
 <7af70882-4835-2316-5c54-52318b5e7d4b@gmail.com>
 <fd32991d-822a-b452-5c5e-b367b8542961@windriver.com>
In-Reply-To: <fd32991d-822a-b452-5c5e-b367b8542961@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jul 2022 08:14:15 -0400
Message-ID: 
 <CAMKF1sqXMhjrhBpNDPiBruZFY03hNb3zPUATQ2Xy=xmDj3O-1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace: set COMPATIBLE_HOST for riscv32
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d136ab05e43b8a50"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 12:14:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168362

--000000000000d136ab05e43b8a50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2022 at 5:35 AM Yu, Mingli <mingli.yu@windriver.com> wrote:

> Hi Khem,
>
> On 7/5/22 21:39, Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On 7/5/22 3:03 AM, Yu, Mingli wrote:
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> Disable the build on riscv32 as it's not supported on riscv32 [1].
> >>
> >> [1]
> >>
> https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096=
db215da
> >>
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   meta/recipes-devtools/strace/strace_5.18.bb | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta/recipes-devtools/strace/strace_5.18.bb
> >> b/meta/recipes-devtools/strace/strace_5.18.bb
> >> index 08f0f1d27e..75ff58bd50 100644
> >> --- a/meta/recipes-devtools/strace/strace_5.18.bb
> >> +++ b/meta/recipes-devtools/strace/strace_5.18.bb
> >> @@ -18,6 +18,9 @@ SRC_URI[sha256sum] =3D
> >> "60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db
> >>
> >>   inherit autotools ptest
> >>
> >> +# Not yet ported to rv32
> >> +COMPATIBLE_HOST:riscv32 =3D "null"
> >> +
> >
> > there might be more changes needed especially in package groups perhaps=
.
>
> What do you mean when you mentioned package groups here?
>
> There comes do_configure error as below:
> | checking for supported architecture... NO!
> | configure: error: architecture riscv32 is not supported by strace
> | NOTE: The following config.log files may provide further information.
> | NOTE:
>
> /buildarea/build/tmp-glibc/work/riscv32-wrs-linux/strace/5.18-r0/build/co=
nfig.log
> | ERROR: configure failed
> | WARNING: exit code 1 from a shell command.
>
> Considering no support for riscv32 until now as
>
> https://github.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096=
db215da,
>
> so we set COMPATIBLE_HOST for riscv32.


That=E2=80=99s fine. I think strace is added in some other places to images=
 and
package groups you might have to remove it for rv32 from them

>
>
> Thanks,
>
> >
> >>   PACKAGECONFIG:class-target ??=3D "\
> >>       ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez',
> >> '', d)} \
> >>   "
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#167640):
> >> https://lists.openembedded.org/g/openembedded-core/message/167640
> >> Mute This Topic: https://lists.openembedded.org/mt/92180245/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> >> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000d136ab05e43b8a50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 20, 2022 at 5:35 AM Yu, Mingli &lt;<a href=3D"m=
ailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Hi Khem,<br>
<br>
On 7/5/22 21:39, Khem Raj wrote:<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt; <br>
&gt; On 7/5/22 3:03 AM, Yu, Mingli wrote:<br>
&gt;&gt; From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Disable the build on riscv32 as it&#39;s not supported on riscv32 =
[1].<br>
&gt;&gt;<br>
&gt;&gt; [1] <br>
&gt;&gt; <a href=3D"https://github.com/strace/strace/commit/69ff62ea5087506=
ad36a27599db088096db215da" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/strace/strace/commit/69ff62ea5087506ad36a27599db088096db215da</a> <=
br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver=
.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 meta/recipes-devtools/strace/<a href=3D"http://strace_5.18.=
bb" rel=3D"noreferrer" target=3D"_blank">strace_5.18.bb</a> | 3 +++<br>
&gt;&gt; =C2=A0 1 file changed, 3 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/strace/<a href=3D"http://strace=
_5.18.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.18.bb</a> <br>
&gt;&gt; b/meta/recipes-devtools/strace/<a href=3D"http://strace_5.18.bb" r=
el=3D"noreferrer" target=3D"_blank">strace_5.18.bb</a><br>
&gt;&gt; index 08f0f1d27e..75ff58bd50 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.18.b=
b" rel=3D"noreferrer" target=3D"_blank">strace_5.18.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/strace/<a href=3D"http://strace_5.18.b=
b" rel=3D"noreferrer" target=3D"_blank">strace_5.18.bb</a><br>
&gt;&gt; @@ -18,6 +18,9 @@ SRC_URI[sha256sum] =3D <br>
&gt;&gt; &quot;60293ea79ac9253d600cdc9be077ad2988ca22284a439c9e66be5150db<b=
r>
&gt;&gt;<br>
&gt;&gt; =C2=A0 inherit autotools ptest<br>
&gt;&gt;<br>
&gt;&gt; +# Not yet ported to rv32<br>
&gt;&gt; +COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
&gt;&gt; +<br>
&gt; <br>
&gt; there might be more changes needed especially in package groups perhap=
s.<br>
<br>
What do you mean when you mentioned package groups here?<br>
<br>
There comes do_configure error as below:<br>
| checking for supported architecture... NO!<br>
| configure: error: architecture riscv32 is not supported by strace<br>
| NOTE: The following config.log files may provide further information.<br>
| NOTE: <br>
/buildarea/build/tmp-glibc/work/riscv32-wrs-linux/strace/5.18-r0/build/conf=
ig.log<br>
| ERROR: configure failed<br>
| WARNING: exit code 1 from a shell command.<br>
<br>
Considering no support for riscv32 until now as <br>
<a href=3D"https://github.com/strace/strace/commit/69ff62ea5087506ad36a2759=
9db088096db215da" rel=3D"noreferrer" target=3D"_blank">https://github.com/s=
trace/strace/commit/69ff62ea5087506ad36a27599db088096db215da</a>, <br>
so we set COMPATIBLE_HOST for riscv32.</blockquote><div dir=3D"auto"><br></=
div><div dir=3D"auto">That=E2=80=99s fine. I think strace is added in some =
other places to images and package groups you might have to remove it for r=
v32 from them=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Thanks,<br>
<br>
&gt; <br>
&gt;&gt; =C2=A0 PACKAGECONFIG:class-target ??=3D &quot;\<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;, &#39;bluetooth&#39;, &#39;bluez&#39;, <br>
&gt;&gt; &#39;&#39;, d)} \<br>
&gt;&gt; =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#167640): <br>
&gt;&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/167640" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/message/167640</a><br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9218=
0245/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/92180245/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> <br>
&gt;&gt; [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000d136ab05e43b8a50--

