Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D2EC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 04:42:50 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.13179.1682570561536488252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 21:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RhmBV5id;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2a8aea2a654so78160331fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 21:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682570559; x=1685162559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oo0k0qNpHjFv5hLeIrHcg6djrgLysuza+NznQ2mtUGg=;
        b=RhmBV5idaas7vTIIPy1hkEU5dI3EWEdFaLh3ozSF/nAR9raHQu4hy6Rkq50JwIkeCK
         WQiGJA5UkGCHS+ixKq3+P0iEctAR8OQ3m1GmNM9y2FuTAIl671khxDDEyMLUsC/OoYlv
         uMjh+gbRNASDMrJnWvGadgCnApTmZQ4+l9heUk4ZwsMFEsRhA9+N41CzNUE1QH9TJMOE
         7uX2Tb0E0TCHYxqrHIcQAtmP7dZv417rdbtnBI2ADJBVapta6BrQQWLxJTCFD1X0Ka9M
         patH1ed6PChE/rNFp8j7myxpMsXoxrlbswnvxhVI+Bhl4S0l7cND7kRWYJ+2WG2++Mbo
         9rVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682570559; x=1685162559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oo0k0qNpHjFv5hLeIrHcg6djrgLysuza+NznQ2mtUGg=;
        b=eEapbB9z7OS6nPbhpvDl2NdW7MIToPMWUbMSOYGOi7pucCACalp4LG1Z2vS/rxt6tD
         mVA6YmIzyYuJzV0o9ZQYV0RSeSHCrIqzSl2InyumnQ3W2EIrNilkPKPGMw1paIPxgPrs
         Iw97PZaBHfgttLTYCDvqtyaj4rgh0sLNdndb2PYgsCpR2QbOxjYonOYW2ZJ8P3mJACeX
         /lUk8V+G/kZgdbSEv9XnfVJfUT93iokRRH8fKs8V0taQni1X1HDeiXQ2DXZdVecg5Jgs
         RGfySbBHtXk+yUdk0+MYz0fFzt4gHjvnejxzrxWR0+TjuIUfuxn16C8fo8OfE5CuDbgF
         MZFw==
X-Gm-Message-State: AC+VfDxUJIoJBDVeIiwWeoafMEkgxHfWrtzyh8eMivGcdOadcTFzjs0o
	64Cjl3osyDk3PB13Vw2D6M79aj9Uk/FA+CkT7oE=
X-Google-Smtp-Source: ACHHUZ4BHeu3UtZMJNkLQNCl/d2ylUzxPTCJJOnmheO2ugZYSjuNn+tBSXm6JBsq93SynJTq6XH8TfaoRtbyETQG16g=
X-Received: by 2002:ac2:5612:0:b0:4ec:844e:7b85 with SMTP id
 v18-20020ac25612000000b004ec844e7b85mr138664lfd.25.1682570558811; Wed, 26 Apr
 2023 21:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682341336.git.frederic.martinsons@gmail.com> <20230426231029.6ae3c6af@booty>
In-Reply-To: <20230426231029.6ae3c6af@booty>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 27 Apr 2023 06:42:27 +0200
Message-ID: <CA+cAkerGJEp0d9sQXbquxZ0Yt==4M04qMNJpejZAhTwO8-_9pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCHV2 0/3] Create class for building and installing
 rust tests
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000077b32e05fa49fc22"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 04:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180465

--00000000000077b32e05fa49fc22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 26 avr. 2023, 23:10, Luca Ceresoli <luca.ceresoli@bootlin.com> a
=C3=A9crit :

> Hello Frederic,
>
> On Mon, 24 Apr 2023 15:04:10 +0200
> "Frederic Martinsons" <frederic.martinsons@gmail.com> wrote:
>
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > This brings the possibility to use this class to build and ship
> > unit tests of rust projects, the class also create (or modified)
> > standard run-ptest script to run the generated rust test suite.
> >
> > It has been tested successfully with core-image-sato under qemu
> > for zvariant-ptest and python3-bcrypt-ptest (though the last one
> > didn't define any unit tests).
> >
> > Note that I tried to do the same with python3-cryptography but fail
> > to build the test suite and I don't know how to do it with the rust
> > extension module build by python setuptools. There must be some kind
> > of way for doing that so maybe someone will put some work in it (
> > because python3-cryptography rust extension do have unit tests).
> >
> > Moreover, in the class, I didn't manage to share data between
> > do_compile_ptest_base and do_install_ptest_base cleanly (I tried
> > to d.setVar in compile and d.getVar in install but it seems that
> > the data store doens't recognize my new variable) so I used a file
> > for that. I'm sure there is a clever way for doing that, so feel
> > free to tell me.
>
> A build error appeared on the autobuilders with these patches applied:
>
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/sel=
ftest/cases/devtool.py",
> line 879, in test_devtool_modify_git_crates_subpath
>     self._test_recipe_contents(recipefile, {}, ['cargo'])
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa/sel=
ftest/cases/devtool.py",
> line 169, in _test_recipe_contents
>     self.assertIn(inherit, inherits, 'Missing inherit of %s' % inherit)
>   File "/usr/lib/python3.8/unittest/case.py", line 1179, in assertIn
>     self.fail(self._formatMessage(msg, standardMsg))
>   File "/usr/lib/python3.8/unittest/case.py", line 753, in fail
>     raise self.failureException(msg)
> AssertionError: 'cargo' not found in {'pkgconfig',
> 'cargo-update-recipe-crates', 'ptest-cargo'} : Missing inherit of cargo
>
> Log:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1321/s=
teps/14/logs/stdio
>
> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Ndnd


Hello Luca, thanks for the report.

I should have ran selftests before submitting, I plead guilty considering
that I also created this test case in a first place.

Anyway, I'll push a v3 soon to correct this.

--00000000000077b32e05fa49fc22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le mer. 26 avr. 2023, 23:10, Luca Ceresoli &lt;<a href=
=3D"mailto:luca.ceresoli@bootlin.com">luca.ceresoli@bootlin.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello Frederic,<b=
r>
<br>
On Mon, 24 Apr 2023 15:04:10 +0200<br>
&quot;Frederic Martinsons&quot; &lt;<a href=3D"mailto:frederic.martinsons@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.co=
m</a>&gt; wrote:<br>
<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com=
</a>&gt;<br>
&gt; <br>
&gt; This brings the possibility to use this class to build and ship<br>
&gt; unit tests of rust projects, the class also create (or modified)<br>
&gt; standard run-ptest script to run the generated rust test suite.<br>
&gt; <br>
&gt; It has been tested successfully with core-image-sato under qemu<br>
&gt; for zvariant-ptest and python3-bcrypt-ptest (though the last one<br>
&gt; didn&#39;t define any unit tests).<br>
&gt; <br>
&gt; Note that I tried to do the same with python3-cryptography but fail<br=
>
&gt; to build the test suite and I don&#39;t know how to do it with the rus=
t<br>
&gt; extension module build by python setuptools. There must be some kind<b=
r>
&gt; of way for doing that so maybe someone will put some work in it (<br>
&gt; because python3-cryptography rust extension do have unit tests).<br>
&gt; <br>
&gt; Moreover, in the class, I didn&#39;t manage to share data between<br>
&gt; do_compile_ptest_base and do_install_ptest_base cleanly (I tried<br>
&gt; to d.setVar in compile and d.getVar in install but it seems that<br>
&gt; the data store doens&#39;t recognize my new variable) so I used a file=
<br>
&gt; for that. I&#39;m sure there is a clever way for doing that, so feel<b=
r>
&gt; free to tell me.<br>
<br>
A build error appeared on the autobuilders with these patches applied:<br>
<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-armhost/build/me=
ta/lib/oeqa/selftest/cases/devtool.py&quot;, line 879, in test_devtool_modi=
fy_git_crates_subpath<br>
=C2=A0 =C2=A0 self._test_recipe_contents(recipefile, {}, [&#39;cargo&#39;])=
<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-armhost/build/me=
ta/lib/oeqa/selftest/cases/devtool.py&quot;, line 169, in _test_recipe_cont=
ents<br>
=C2=A0 =C2=A0 self.assertIn(inherit, inherits, &#39;Missing inherit of %s&#=
39; % inherit)<br>
=C2=A0 File &quot;/usr/lib/python3.8/unittest/case.py&quot;, line 1179, in =
assertIn<br>
=C2=A0 =C2=A0 self.fail(self._formatMessage(msg, standardMsg))<br>
=C2=A0 File &quot;/usr/lib/python3.8/unittest/case.py&quot;, line 753, in f=
ail<br>
=C2=A0 =C2=A0 raise self.failureException(msg)<br>
AssertionError: &#39;cargo&#39; not found in {&#39;pkgconfig&#39;, &#39;car=
go-update-recipe-crates&#39;, &#39;ptest-cargo&#39;} : Missing inherit of c=
argo<br>
<br>
Log:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/127/buil=
ds/1321/steps/14/logs/stdio" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1321/s=
teps/14/logs/stdio</a><br>
<br>
Best regards,<br>
Luca<br>
<br>
-- <br>
Luca Ceresoli, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a></blockquote></div></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ndnd</blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Hello Luca, thanks fo=
r the report.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I sh=
ould have ran selftests before submitting, I plead guilty considering that =
I also created this test case in a first place.=C2=A0</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Anyway, I&#39;ll push a v3 soon to correct th=
is.=C2=A0</div><div dir=3D"auto"></div></div>

--00000000000077b32e05fa49fc22--

