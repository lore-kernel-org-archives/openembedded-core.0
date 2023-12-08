Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBD2C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 23:58:57 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.27457.1702079928450383143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 15:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fLY8e75e;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5cece20f006so25539837b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 15:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702079927; x=1702684727; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q6BIq1017ohCV7fcP8V4Irwz0hkI41rh+ptcPnmvOk0=;
        b=fLY8e75e6T1iCsfjUJohpdhpRau3XaFAoGYmHyDJjgGc3c4Y6yetC7qGSvzrzvQ9ni
         83J87nw8OK2dvdFna3F2mqF0gD5o5Bp8/jiPYG7gVmcQz+9swvGocmDCTeB3RxJw9DSj
         Z1Z2WCvfLPlDZasUzWd7v6t7Ed0pt5EwdbQ1h5aHexKUl3J4LPlpLrY6rN0Jb95hdSxy
         /uGgtwX04DMH/W2VyZTyZq7H7HtzEs0TdnEoXWkD4rpHdAZSAqTBFiXE8hUDUapFTx5Y
         fZKbkK61Gdf+XSioaGQVzKq079VrbbB0yO1uzprZeujzxE66EInMrfx3wedqX6nUT32R
         xlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702079927; x=1702684727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6BIq1017ohCV7fcP8V4Irwz0hkI41rh+ptcPnmvOk0=;
        b=nh9ETQdj2HOtM3TBjxy+PV/ivFgs3KjBiiGNbZoCFkPYem2Sa3YAhk1YSPP8y8bLAI
         l5zB/En9VA+MLyZPvyvt24hk028MNivyFxbp/YexfKqYH4bQ2WM9VNmOeU2n9vg13j1E
         IrJU+l9V8DHsMrcMMCjpjM3J7V1Q5eopFjwK0sJn4TGGiIgwr/Xx51OG82acpTJqkL4t
         zUdb9GwS4wls/TYvWasD6r/770qS6JxXlMDwXGtDJYRXohJQAeuHF36fp1NuJd3rj8mP
         fFZbuPviQnyRK9rhGGB0XAmfFbRaTB14485qlHVlJruYWWttZdJ77MuNijpFpYyRq9Qw
         eSZA==
X-Gm-Message-State: AOJu0YxhizTxB6+WcQLNkvKZCS+mUA0GkS9jUqdTLGKc5kirfssgTorS
	AiSdJVEzTpYr8wG6OAZFw6vkupHJXnrCTGCbInU=
X-Google-Smtp-Source: AGHT+IETUR7+Mqr3bAnwhnGeDT+BjljgPI+ZmK9/bdP4b+4hrzO4FGIRBxnF3I3i1kdFJrhJKoiRsA2Q+gcwsmvg16M=
X-Received: by 2002:a0d:eac5:0:b0:5d3:4ef0:8be with SMTP id
 t188-20020a0deac5000000b005d34ef008bemr661481ywe.37.1702079927347; Fri, 08
 Dec 2023 15:58:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701989368.git.tim.orling@konsulko.com> <20231208225036585d7237@mail.local>
In-Reply-To: <20231208225036585d7237@mail.local>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 8 Dec 2023 15:58:36 -0800
Message-ID: <CANx9H-Ajw=4F0=KUu=x-NHDcdyPz84Q=sA25WpdJZAbp8443Ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] Add 'maturin' python backend support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000072ee6e060c085d74"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 23:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192089

--00000000000072ee6e060c085d74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 2:50=E2=80=AFPM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> Hello Tim,
>
> I got this failure, can you check?
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6166/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6159/st=
eps/14/logs/stdio
>
> this is from Peter=E2=80=99s change which had not been merged when I sent=
 this
series.

>
> 2023-12-08 22:03:18,822 - oe-selftest - INFO - FAIL:
> recipetool.RecipetoolCreateTests.test_recipetool_create_python3_pep517_ma=
turin
> (subunit.RemotedTestCase)
> 2023-12-08 22:03:18,822 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2023-12-08 22:03:18,823 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/self=
test/cases/recipetool.py",
> line 698, in test_recipetool_create_python3_pep517_maturin
>     self._test_recipe_contents(recipefile, checkvars, inherits)
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/self=
test/cases/devtool.py",
> line 178, in _test_recipe_contents
>     self.assertEqual(missingvars, {}, 'Some expected variables not found
> in recipe: %s' % checkvars)
>   File "/usr/lib64/python3.11/unittest/case.py", line 873, in assertEqual
>     assertion_func(first, second, msg=3Dmsg)
>   File "/usr/lib64/python3.11/unittest/case.py", line 1172, in
> assertDictEqual
>     self.fail(self._formatMessage(msg, standardMsg))
>   File "/usr/lib64/python3.11/unittest/case.py", line 703, in fail
>     raise self.failureException(msg)
> AssertionError: {'SRC_URI': 'https://files.pythonhosted.or[586
> chars]238'} !=3D {}
> Diff is 656 characters long. Set self.maxDiff to None to see it. : Some
> expected variables not found in recipe: {'SRC_URI': '
> https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae1=
4a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-${PV}.tar.gz',
> 'SRC_URI[md5sum]': '1eb13c211147496c1c9484ff7f8ac438', 'SRC_URI[sha1sum]'=
:
> '0803a731aa793f3eaf4d52f656d7300408ca0b36', 'SRC_URI[sha256sum]':
> '6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71',
> 'SRC_URI[sha384sum]':
> 'cca6d9f0ba72ff92e16aaf3d6c628b8df33bdf244cc39c9d59cff9d541f35d4e87ec136e=
60e4b040ad73c5c69b27cec6',
> 'SRC_URI[sha512sum]':
> 'e6c3081dfa58d9b59f8c33dfe80712d732ac3048a2f8240f9a0f5448d9bfc83e222c1e08=
b8bb49779b84f685c3bec3060cc935c113a818b1ab8aa955f3df2238'}
>
>
>
>
> On 07/12/2023 15:13:17-0800, Tim Orling wrote:
> > We are increasingly seeing Rust extensions for Python added in the
> > ecosystem. The current best practices approach has moved from using
> > 'setuptools-rust' to using 'maturin'.
> >
> > * Add python3-maturin, including 'native' and 'nativesdk' support.
> > * Add a 'python_maturin' bbclass for the PEP-517 backend.
> > * Add recipetool support for the 'maturin' PEP-517 backend.
> > * Add a very basic 'maturin list-python' smoke test added to oeqa for
> >   both 'runtime' (-c testimage) and 'sdk' (-c testsdk).
> >
> > The following changes since commit
> 70ad9b9b309575134834757468cb32c9e3b87448:
> >
> >   bitbake: hashserv: sqlite: Ensure sync propagates to database
> connections (2023-12-04 22:36:09 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.yoctoproject.org/poky-contrib timo/maturin_1.3.2
> >   https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/maturin_1.3.2
> >
> > Tim Orling (6):
> >   python3-setuptools-rust: BBCLASSEXTEND + nativesdk
> >   python3-maturin: add v1.3.2
> >   classes-recipe: add python_maturin.bbclass
> >   recipetool: add python_maturin support
> >   oe-selfest: add maturn runtime (testimage) test
> >   python3-maturin: add sdk (testsdk) test case
> >
> >  meta/classes-recipe/python_maturin.bbclass    |  17 +
> >  meta/conf/distro/include/maintainers.inc      |   1 +
> >  meta/lib/oeqa/runtime/cases/maturin.py        |  23 +
> >  meta/lib/oeqa/sdk/cases/maturin.py            |  33 +
> >  meta/lib/oeqa/selftest/cases/recipetool.py    |  34 ++
> >  .../python/python3-maturin-crates.inc         | 572 ++++++++++++++++++
> >  .../python/python3-maturin_1.3.2.bb           |  40 ++
> >  .../python/python3-setuptools-rust_1.8.1.bb   |   2 +-
> >  .../lib/recipetool/create_buildsys_python.py  |   1 +
> >  9 files changed, 722 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/classes-recipe/python_maturin.bbclass
> >  create mode 100644 meta/lib/oeqa/runtime/cases/maturin.py
> >  create mode 100644 meta/lib/oeqa/sdk/cases/maturin.py
> >  create mode 100644
> meta/recipes-devtools/python/python3-maturin-crates.inc
> >  create mode 100644 meta/recipes-devtools/python/
> python3-maturin_1.3.2.bb
> >
> > --
> > 2.34.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191981):
> https://lists.openembedded.org/g/openembedded-core/message/191981
> > Mute This Topic: https://lists.openembedded.org/mt/103045095/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000072ee6e060c085d74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Dec 8, 2023 at 2:50=E2=80=AFPM Alexandre Belloni &l=
t;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootli=
n.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddin=
g-left:1ex;border-left-color:rgb(204,204,204)">Hello Tim,<br>
<br>
I got this failure, can you check?<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/build=
s/6166/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6166/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/6159/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6159/steps/14/logs/=
stdio</a><br>
<br>
</blockquote><div dir=3D"auto">this is from Peter=E2=80=99s change which ha=
d not been merged when I sent this series.</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
2023-12-08 22:03:18,822 - oe-selftest - INFO - FAIL: recipetool.RecipetoolC=
reateTests.test_recipetool_create_python3_pep517_maturin (subunit.RemotedTe=
stCase)<br>
2023-12-08 22:03:18,822 - oe-selftest - INFO - ----------------------------=
------------------------------------------<br>
2023-12-08 22:03:18,823 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-fedora/build/met=
a/lib/oeqa/selftest/cases/recipetool.py&quot;, line 698, in test_recipetool=
_create_python3_pep517_maturin<br>
=C2=A0 =C2=A0 self._test_recipe_contents(recipefile, checkvars, inherits)<b=
r>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-fedora/build/met=
a/lib/oeqa/selftest/cases/devtool.py&quot;, line 178, in _test_recipe_conte=
nts<br>
=C2=A0 =C2=A0 self.assertEqual(missingvars, {}, &#39;Some expected variable=
s not found in recipe: %s&#39; % checkvars)<br>
=C2=A0 File &quot;/usr/lib64/python3.11/unittest/case.py&quot;, line 873, i=
n assertEqual<br>
=C2=A0 =C2=A0 assertion_func(first, second, msg=3Dmsg)<br>
=C2=A0 File &quot;/usr/lib64/python3.11/unittest/case.py&quot;, line 1172, =
in assertDictEqual<br>
=C2=A0 =C2=A0 self.fail(self._formatMessage(msg, standardMsg))<br>
=C2=A0 File &quot;/usr/lib64/python3.11/unittest/case.py&quot;, line 703, i=
n fail<br>
=C2=A0 =C2=A0 raise self.failureException(msg)<br>
AssertionError: {&#39;SRC_URI&#39;: &#39;<a href=3D"https://files.pythonhos=
ted.or" rel=3D"noreferrer" target=3D"_blank">https://files.pythonhosted.or<=
/a>[586 chars]238&#39;} !=3D {}<br>
Diff is 656 characters long. Set self.maxDiff to None to see it. : Some exp=
ected variables not found in recipe: {&#39;SRC_URI&#39;: &#39;<a href=3D"ht=
tps://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b=
073ecbc47fc36a9979c7aa888b245/pydantic_core-$%7BPV%7D.tar.gz" rel=3D"norefe=
rrer" target=3D"_blank">https://files.pythonhosted.org/packages/64/26/cffb9=
3fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-${PV}=
.tar.gz</a>&#39;, &#39;SRC_URI[md5sum]&#39;: &#39;1eb13c211147496c1c9484ff7=
f8ac438&#39;, &#39;SRC_URI[sha1sum]&#39;: &#39;0803a731aa793f3eaf4d52f656d7=
300408ca0b36&#39;, &#39;SRC_URI[sha256sum]&#39;: &#39;6d30226dfc816dd0fdf12=
0cae611dd2215117e4f9b124af8c60ab9093b6e8e71&#39;, &#39;SRC_URI[sha384sum]&#=
39;: &#39;cca6d9f0ba72ff92e16aaf3d6c628b8df33bdf244cc39c9d59cff9d541f35d4e8=
7ec136e60e4b040ad73c5c69b27cec6&#39;, &#39;SRC_URI[sha512sum]&#39;: &#39;e6=
c3081dfa58d9b59f8c33dfe80712d732ac3048a2f8240f9a0f5448d9bfc83e222c1e08b8bb4=
9779b84f685c3bec3060cc935c113a818b1ab8aa955f3df2238&#39;}<br>
<br>
<br>
<br>
<br>
On 07/12/2023 15:13:17-0800, Tim Orling wrote:<br>
&gt; We are increasingly seeing Rust extensions for Python added in the<br>
&gt; ecosystem. The current best practices approach has moved from using<br=
>
&gt; &#39;setuptools-rust&#39; to using &#39;maturin&#39;.<br>
&gt; <br>
&gt; * Add python3-maturin, including &#39;native&#39; and &#39;nativesdk&#=
39; support.<br>
&gt; * Add a &#39;python_maturin&#39; bbclass for the PEP-517 backend.<br>
&gt; * Add recipetool support for the &#39;maturin&#39; PEP-517 backend.<br=
>
&gt; * Add a very basic &#39;maturin list-python&#39; smoke test added to o=
eqa for<br>
&gt;=C2=A0 =C2=A0both &#39;runtime&#39; (-c testimage) and &#39;sdk&#39; (-=
c testsdk).<br>
&gt; <br>
&gt; The following changes since commit 70ad9b9b309575134834757468cb32c9e3b=
87448:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0bitbake: hashserv: sqlite: Ensure sync propagates to datab=
ase connections (2023-12-04 22:36:09 +0000)<br>
&gt; <br>
&gt; are available in the Git repository at:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.yoctoproject.org/poky-contrib" rel=
=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky-contrib=
</a> timo/maturin_1.3.2<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?=
h=3Dtimo/maturin_1.3.2" rel=3D"noreferrer" target=3D"_blank">https://git.yo=
ctoproject.org/poky-contrib/log/?h=3Dtimo/maturin_1.3.2</a><br>
&gt; <br>
&gt; Tim Orling (6):<br>
&gt;=C2=A0 =C2=A0python3-setuptools-rust: BBCLASSEXTEND + nativesdk<br>
&gt;=C2=A0 =C2=A0python3-maturin: add v1.3.2<br>
&gt;=C2=A0 =C2=A0classes-recipe: add python_maturin.bbclass<br>
&gt;=C2=A0 =C2=A0recipetool: add python_maturin support<br>
&gt;=C2=A0 =C2=A0oe-selfest: add maturn runtime (testimage) test<br>
&gt;=C2=A0 =C2=A0python3-maturin: add sdk (testsdk) test case<br>
&gt; <br>
&gt;=C2=A0 meta/classes-recipe/python_maturin.bbclass=C2=A0 =C2=A0 |=C2=A0 =
17 +<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 meta/lib/oeqa/runtime/cases/maturin.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 23 +<br>
&gt;=C2=A0 meta/lib/oeqa/sdk/cases/maturin.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 33 +<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/recipetool.py=C2=A0 =C2=A0 |=C2=A0 =
34 ++<br>
&gt;=C2=A0 .../python/python3-maturin-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 572 ++++++++++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-maturin_1.3.2.bb" rel=3D"no=
referrer" target=3D"_blank">python3-maturin_1.3.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 40 ++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-setuptools-rust_1.8.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-setuptools-rust_1.8.1.bb</a>=C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../lib/recipetool/create_buildsys_python.py=C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 9 files changed, 722 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta/classes-recipe/python_maturin.bbclass<br=
>
&gt;=C2=A0 create mode 100644 meta/lib/oeqa/runtime/cases/maturin.py<br>
&gt;=C2=A0 create mode 100644 meta/lib/oeqa/sdk/cases/maturin.py<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-maturin-=
crates.inc<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-maturin_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-ma=
turin_1.3.2.bb</a><br>
&gt; <br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#191981): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/191981" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/191981</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10304509=
5/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103045095/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000072ee6e060c085d74--

