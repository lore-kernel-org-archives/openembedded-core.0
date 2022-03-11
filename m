Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7428EC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 04:17:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.2252.1646972268493574083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 20:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q1JQPTz4;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: ticotimo@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id k24so11106665wrd.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 20:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a5gJ6n7BaspDLSOfh7wW0DRVrSVdyCwGd/II2Q2iKaI=;
        b=q1JQPTz4BGiS5EK0SeNUqcK7ngZ9Og00R04r7yh8Be08rPYdhucditA6ezr4K3JRRY
         6nOLpYrA5QJvz/3tqvJhOl3DzX+10kx8+M7F54Gp/ph7ZJHOkpg0PIaIJp1H40ksL4p9
         g1NuUGX0q+KgjbGD4lnzRFbRO1kMWvPI1qv9SmOZtZ98Rhsw1Yox25ixCVTnOSA7YGlI
         ZhA57f6CfXU18hni+x6a8QNqVqpUdtBYUDCYxLa688ayqmLkskOzz7LxPRi0aaw5dUV/
         XG2YUbXsmgLJd0992kGAPyxw8GtxFkRt8fgvayclHYYLk2rrcohVA/oMTlhx3tEwPi5Z
         25LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a5gJ6n7BaspDLSOfh7wW0DRVrSVdyCwGd/II2Q2iKaI=;
        b=E9biFAuy5332FUhqVq24KKIjbhQegdlStr9JysHGI/KD9BJFsu2q4sT4kdOFjXhqAv
         liBAPcmqep7ljazYSzzwXK9Az8BjCADdt18n0TxupI/QD0LMtWuwWzXHT5mHp36PiCi8
         KZWW1hWAxkFKFbbREapUC3wsunAjuXwtdl/nPlaenqprXNYLBYDuS64QFvehsjJZjIlF
         wT+VHMTuBbC+SwD08hwfAGjtgC1kWqO69YBV8wcqZHjhbOvTL+6i0UxaQ48GzW0fgG20
         26Dp95CxsihReO++K2Lx5OoDqbd/u8ONv3dcxq00IwtLs0T/zJcnxWSUl+odkfpBPAig
         rYQw==
X-Gm-Message-State: AOAM531noGCd/2uJJG4QAOjH8kGUlTFRAX0Yx7ExuiqcvoHEsVt3imNX
	IrRVoJdV0p3i2NKtBLQoEBKj0gX1MCoCIWaqScs=
X-Google-Smtp-Source: 
 ABdhPJyzX3t5HNUuLymbOQeFnoEQkr8uUlSLUFUwDX79TuwRGFD3NsutNWqq/oJzFqLJ5E+eUxLrswxSrGXHYW4WK1M=
X-Received: by 2002:a5d:4387:0:b0:1ed:a13a:ef0c with SMTP id
 i7-20020a5d4387000000b001eda13aef0cmr5751436wrq.62.1646972266839; Thu, 10 Mar
 2022 20:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20220310171656.3106028-1-ross.burton@arm.com>
 <AM9PR09MB46423A3FDC636B28C16590C6A80B9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTujN-T=7kfEfrmcs3XXdsAB2XL3=p9gtCWCyn__dhT2Pg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTujN-T=7kfEfrmcs3XXdsAB2XL3=p9gtCWCyn__dhT2Pg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 10 Mar 2022 20:17:35 -0800
Message-ID: 
 <CANx9H-CxoHW1i-+qOAWMnz+vCK81+c3tWz6gJLZ1aapwOkE6Gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-installer: add installer module
To: Ross Burton <ross@burtonini.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000eb7f5805d9e99c1d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 04:17:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163046

--000000000000eb7f5805d9e99c1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 10:26 AM Ross Burton <ross@burtonini.com> wrote:

>
> On Thu, 10 Mar 2022 at 17:36, Konrad Weihmann <kweihmann@outlook.com>
> wrote:
>
>> Sorry to say that - but to me (even though it's more work) pip seems to
>> be the better option - the proposed tool is ~8 months old and not part
>> of pypa community as it seems - so in comparison to pip this could not
>> be labeled "battle proven".
>
>
> It=E2=80=99s not that unheard of, for example the flit_core bootstrap
> documentation says to use it:
>
> https://flit.readthedocs.io/en/latest/bootstrap.html
>
> It also does one job and just one job, which is A Very Good Thing.
>
>
And in fact, this was the first tool in my implementation. At the time it
was only a library and my awkward do_configure() cat << EOF scripts needed
to know the path to the wheel. It wasn=E2=80=99t gelled yet.

In the limited needs of oe-core, pip install =E2=80=9Cworked=E2=80=9D (or s=
eemed to) and so
that is what was submitted. To be clear, if we knew what we know now I
would never have used pip to install _our_ wheels. Never. It is a bloated
code base that wants to fetch your package, its dependencies, build them
all in a virtual environment and install them where it wants to install
things. It is entirely an end-user =E2=80=9Cdesktop=E2=80=9D tool.  This en=
tire time, shoe
horning pip to do what we want has been a PITA.

Whether we switch to python3-installer now or later=E2=80=A6 I have little =
doubt we
will wish we had switched.


> Especially as the second patch of the series removes the possibility to
>> use the tooling proposed by python upstream for installing stuff.
>
>
> Do you mean Pip here? That=E2=80=99s one option.  Installing a wheel is a
> glorified unzip, pip brings a lot of baggage that we don=E2=80=99t care a=
bout.
>
> I should make it clear that this class is not for installing arbitrary
> wheels, it installs a wheel we just built and in the future will build th=
e
> wheel too.
>
>
In fact, the pip_installer_wheel class opens the door to naive users
creating binary-only recipes to install random wheels from the internet.
There is ZERO chance we can support that workflow. Wheels will have
mismatched python ABI, glib, arch, etc. I have absolutely no intent to
answer any requests to do this. We build from source. You can write a
recipe on your own to use python3-pip-native to do this=E2=80=A6here=E2=80=
=99s your spool
of rope. Good luck with your technical debt. You were warned not to do this=
.


> If one would want to have that kind of tooling the switch from pure
>> setup.py to toml and friends could have been done already a year ago
>> (python-build was the originally proposed tool iirc) - so this feels to
>> me like a step in the wrong direction (esp. the part that this would
>> rely on a tool **not** supported by upstream)
>
>
> Adding support for build is next on the list.
>

And would have already been in this implementation (with python3-build) if
only we could build a time machine. It just wasn=E2=80=99t ready yet. I was=
 close=E2=80=A6
the calendar said not close enough.


>
> Ross
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163035):
> https://lists.openembedded.org/g/openembedded-core/message/163035
> Mute This Topic: https://lists.openembedded.org/mt/89691492/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000eb7f5805d9e99c1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 10, 2022 at 10:26 AM Ross=
 Burton &lt;<a href=3D"mailto:ross@burtonini.com" target=3D"_blank">ross@bu=
rtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 10 Mar 2022 at 17:36, Konrad Weihmann &lt;<a h=
ref=3D"mailto:kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Sorry to say that - but to me (even though it&#39;s more work) pip seems t=
o <br>
be the better option - the proposed tool is ~8 months old and not part <br>
of pypa community as it seems - so in comparison to pip this could not <br>
be labeled &quot;battle proven&quot;.</blockquote><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">It=E2=80=99s not that unheard of, for example the flit=
_core bootstrap documentation says to use it:</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div><a href=3D"https://flit.readthedocs.io/en/latest=
/bootstrap.html" target=3D"_blank">https://flit.readthedocs.io/en/latest/bo=
otstrap.html</a></div><br></div><div dir=3D"auto">It also does one job and =
just one job, which is A Very Good Thing.</div><div dir=3D"auto"><br></div>=
</div></div></blockquote><div><br></div><div dir=3D"auto">And in fact, this=
 was the first tool in my implementation. At the time it was only a library=
 and my awkward do_configure() cat &lt;&lt; EOF scripts needed to know the =
path to the wheel. It wasn=E2=80=99t gelled yet.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">In the limited needs of oe-core, pip install =E2=
=80=9Cworked=E2=80=9D (or seemed to) and so that is what was submitted. To =
be clear, if we knew what we know now I would never have used pip to instal=
l _our_ wheels. Never. It is a bloated code base that wants to fetch your p=
ackage, its dependencies, build them all in a virtual environment and insta=
ll them where it wants to install things. It is entirely an end-user =E2=80=
=9Cdesktop=E2=80=9D tool.=C2=A0 This entire time, shoe horning pip to do wh=
at we want has been a PITA.</div><div dir=3D"auto"><br></div><div>Whether w=
e switch to python3-installer now or later=E2=80=A6 I have little doubt we =
will wish we had switched.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto"><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex" dir=3D"auto">
Especially as the second patch of the series removes the possibility to <br=
>
use the tooling proposed by python upstream for installing stuff.</blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">Do you mean Pip here? That=
=E2=80=99s one option.=C2=A0 Installing a wheel is a glorified unzip, pip b=
rings a lot of baggage that we don=E2=80=99t care about.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I should make it clear that this class is =
not for installing arbitrary wheels, it installs a wheel we just built and =
in the future will build the wheel too.</div><div dir=3D"auto"><br></div></=
div></div></blockquote><div><br></div><div>In fact, the pip_installer_wheel=
 class opens the door to naive users creating binary-only recipes to instal=
l random wheels from the internet. There is ZERO chance we can support that=
 workflow. Wheels will have mismatched python ABI, glib, arch, etc. I have =
absolutely no intent to answer any requests to do this. We build from sourc=
e. You can write a recipe on your own to use python3-pip-native to do this=
=E2=80=A6here=E2=80=99s your spool of rope. Good luck with your technical d=
ebt. You were warned not to do this.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=
=3D"auto"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" dir=3D"au=
to">
If one would want to have that kind of tooling the switch from pure <br>
setup.py to toml and friends could have been done already a year ago <br>
(python-build was the originally proposed tool iirc) - so this feels to <br=
>
me like a step in the wrong direction (esp. the part that this would <br>
rely on a tool **not** supported by upstream)</blockquote><div dir=3D"auto"=
><br></div><div dir=3D"auto">Adding support for build is next on the list.<=
/div></div></div></blockquote><div><br></div><div>And would have already be=
en in this implementation (with python3-build) if only we could build a tim=
e machine. It just wasn=E2=80=99t ready yet. I was close=E2=80=A6 the calen=
dar said not close enough.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div><div class=3D"gmail_quote"><div dir=3D"auto"><=
br></div><div dir=3D"auto">Ross</div><div dir=3D"auto"><br></div></div></di=
v>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163035): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163035" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163035</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89691492/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89691492/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000eb7f5805d9e99c1d--

