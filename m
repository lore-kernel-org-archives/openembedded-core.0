Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C714A105F794
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 10:29:51 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12763.1773397787298240525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 03:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=marcel@ziswiler.com header.s=s1-ionos header.b=IQTuUNBj;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.196, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1773397782; x=1774002582; i=marcel@ziswiler.com;
	bh=jjaA1cqloC1Q9Pktd1NdZLNXvlqqeN+obgn7VTDvVbM=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IQTuUNBjHFx35hWt1T0qNVJG4OvuUDt0tUqoVuxOS0xusGTt2RiZa8DRyrgKVyBe
	 FNlIu+ekpHOqcPRKX/VHrBCGxhzOfFgeu8XdWOm00MU89bHGoS0lT68a6qPjk9acR
	 d2qlk0Gg7XT/eKGshvD8JLk8lyPgYiVqWDu7gStSb3PSgVVhmSPxN5x1hVuYcS9or
	 u0CWfgLxxZqtwg2mKuOGQzYSTTelRLlkd2t3FpH7vd9Co3NqgKZQb8D6JOkIrn3uh
	 daeyAl5mO/OXmRbA/XaLMvrMb/7Gstwfg/wkW9HZlLzee8mJFu/NcxSZZ2rVE8nM/
	 C98aat2lSHbXlR+EmA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelay.perfora.net (mreueus003
 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MdJp7-1wHhJO2AHD-00HiwB; Fri, 13 Mar
 2026 11:29:41 +0100
Message-ID: <eb366a1604a0a98d91634c29a3055feea29bc33a.camel@ziswiler.com>
Subject: Re: [OE-core] [PATCH v2 1/4] python3-setuptools: upgrade 80.9.0 ->
 82.0.0
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org, mathieu.dubois-briand@bootlin.com
Date: Fri, 13 Mar 2026 11:29:37 +0100
In-Reply-To: <CA+chaQfjTQxPAWr0jomTZmsFRMvKh-D-=AAtfYkZxxOsZhUh3Q@mail.gmail.com>
References: <20260304045413.3265198-1-hongxu.jia@windriver.com>
	 <d291e85326d0d184045b7492aa5a1241b210763a.camel@ziswiler.com>
	 <CA+chaQfjTQxPAWr0jomTZmsFRMvKh-D-=AAtfYkZxxOsZhUh3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:tYESeK9PTkXWEAfvzadPPAQQvkhReItHHgK3bEWOx6DT1PRt1Kz
 TrGC3BlLEBlGD4DYRrB2d3NyNEWO1mpzSvi1/6XOqckVE7x/b1Pv9E/Vf/kZtoq5/ijKJn+
 xUESmArBtGEBx6Vc6DDkip8eDFexyvmWKQf6j/ny9/5ZMNKoOrwqjpe8n93/XpGkhVZd+34
 457dv1eHfYWekgKhOYnDQ==
UI-OutboundReport: notjunk:1;M01:P0:2x43GNwV9EU=;gasEJdWEhaIsZ/3rX56rGkDwzbw
 OUwLMV1qn95GO8ceoPpUf4e/4VgL3dzd7w4vtAuEkI2uG6y5uZF79quoJDEVuIXpFutJNrEyp
 ik8lMlysgpLCJxk9iOoeOv/w4qO8aybgdrUOCZPO83kbaCmnUznfx3ExoSAmqKRFz3aJ0OzhQ
 HB2siPO+40G2lPedlp9d/AJuqAJE+nYCz6FkWF9DAjFoWED91xB+QR8JK/Oy0h7feWI39+ZtX
 +R/HdkKpCvPzwyCN6CwpCxF856CaixteHsmGUFDVR0EGW1zBEKeOoKGvaxmgIu7+xbX7N7Zy/
 2O2EpxB9S5Tg5qtU9YYHr1B2AD9L8iRYiSUXC6nbXOYKmESlEsk/eMROflPRjGer6zoI9F6Lz
 cnMVEg+qaCdiHVFXQ36MVvEGnBO+lR0bgbxu6o7QSzUmasSYlxQ4M4FG6efQEhf/ZiHEFaLRB
 aYhaqZxJ0quDxyhVbxPVK7Fg4khPlrun0NvQbOmt+G8PEcN5M1V+g2GxCDm9O9w3XEd62/kOf
 2MTpMgSbJB6yvUq+kerjxmcnLwsa3n10Mb+ghIcO+vLTHQWOYxnYh5emxGSJWaxMT0J9ite6l
 MY+zit5GxLoE4R2eYtpbVnKhV/4jLei1wHGBFoMU6ipmSREzRTnqAMJOKhusEIhoIShIgUB+R
 A9EkoLWzf6OizjpTsMZPDsac9cRWTOt7dZTbhHfmeiFb2plP+tk8oF2H6focb/Cni3KfZ+wn8
 yULRf2e3kiO+4iV4Ok5CtsczxSDM0vY//TRjk6S3OGh9Ml6n1ESYSM9tKcW/Qts2HcH1WQgva
 Ac3XragZS7nkiR6kIQS4boiw4z/Zl6wP4XOBoI4hprkrrXOyvsgpfJfcANevzQWl8GifIpkcw
 vR2dZrAjyJ/U+xXkh5QQGYfoB36fbUKlVwp62ko2IVd4s/9R2Kfkqo39+G+hveoRPOjvqLPgt
 /1Ec0Ynf6Jw0fSLEHrRWbK0tx5PatxsPyAfrrzVgiXs1v18oSZI5CZwUJ6UKQmy0B/vHdIUv/
 flB94+6lJORe1z6TfUfOYVqlSk3zxWv6crZPDf1ZOFw1cM5G3FUh9Zl8DMdJ3DwYEQNOTb7S+
 gIiiOSYDDE9XmjO95ksiwsPiXEWENKeFMrIqwCn/K3Xz66rZMGeFKfIidWOy5y29ay0XOMwpQ
 lLft4Z/+NOEsw1wUDlqfxSg7NJ9lh7aBLd3Nrcfn3G76w419bA+i6zHUt/IT7IsK0/ghxvaXz
 U+STgAk5IgNymADKjrOH8SRoDbLqXOCRHYBgTlyQHfeZa01KRPU1jmPqu/XlpzJn2AaG/lAVN
 MUGejcTnsBXWN3wA6ITKeGooCy7YHfGnqbuWyttvoEuU4jO+B8vcRcWFEQFqYatLY1p/Ll0HF
 veXWZRgh+b/34+YgX6MpOEb1XxR12c8NCqLP11EPs2C/qwO/Qd3PPKGVKrWkHd7enmXkrJgFG
 +GJ4Hobg7ry2Nv/C1abhvk2LiwuzvYUhXUqXP3P08Xo0hcLpEjbJhR1NrijICJKNeHnuNru33
 y32gueb7Sj8X+VMHbSwN12TcdETE97KLzLpVGU09B2zL0vQfy/uUj+YbvwtpfoS31vhfBfAv7
 bKISHWXBYdDVEtf4yMZK6o00tlmAfqwXCzEYdw6uiBXE1tsafEAraHTBn2jYOTPlw76x79Zau
 kGfdBlSGqnQK+5Gt8NWfiunHL3XHbHebyxTCaTJuITdtNe5IPK323maM+gRpn9X3W6aOy8W4Z
 I6y/Z/6fJF/7p78xnNxq0qpKxiR2U5JPafIrMH0A2qi3nAWmZqgReXtADLM1GST8IwO4SnRVX
 fP4loiP5z2KAgV5QxjJ/hLsgKA6BlldToCJ045FK4TJOFqM1GHskiM4grup+JEmtHPUrin2nM
 qQu9gTA5bj0gvtGZDkTgBnWXr8HU1pHWYRMn08=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 10:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233036

Hi Martin

On Fri, 2026-03-13 at 10:43 +0100, Martin Jansa wrote:
> Don't you have meta-tensorflow included in your build and set it to
> use python-3.13 instead of 3.14 as in:
> https://git.yoctoproject.org/meta-tensorflow/commit/?id=3Df1b44771445970c=
b389a50b5885356c987b8931a

No, I don't think so.

The only layers I have enabled are:

openembedded-core/meta
meta-openembedded/meta-oe
meta-riscv
meta-poky
meta-python
meta-multimedia
meta-networking

Cheers

Marcel

> 3.13 is not compatible with new setuptools, I have seen the same
> errors then removed meta-tensorflow and it built fine again.
>=20
> Hopefully https://lists.yoctoproject.org/g/yocto-patches/message/3323
> will be resolved soon.
>=20
> Regards,
>=20
>=20
> On Fri, Mar 13, 2026 at 10:25=E2=80=AFAM Marcel Ziswiler via
> lists.openembedded.org <marcel=3Dziswiler.com@lists.openembedded.org>
> wrote:
> >=20
> > Hi Hongxu Jia
> >=20
> > On Wed, 2026-03-04 at 12:54 +0800, Hongxu Jia wrote:
> > > Remove python3-pkg-resources
> > >=20
> > > History v82.0.0 [1]:
> > >=20
> > > Deprecations and Removals
> > > - pkg_resources has been removed from Setuptools. Most common uses of=
 pkg_resources have
> > > =C2=A0 been superseded by the importlib.resources and importlib.metad=
ata projects. Projects
> > > =C2=A0 and environments relying on pkg_resources for namespace packag=
es or other behavior
> > > =C2=A0 should depend on older versions of setuptools. (#3085)
> > >=20
> > > [1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
> > >=20
> > > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >=20
> > [snip]
> >=20
> > Unfortunately, this seems to break all my meta-riscv machine builds:
> >=20
> > ...
> > > gcc -shared -L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_6=
4-linux/python3-cython-
> > native/3.2.4/recipe-sysroot-native/usr/lib -L/var/home/sumo/Sources/ris=
cv-yocto/build/tmp/work/x86_64-
> > linux/python3-cython-native/3.2.4/recipe-sysroot-native/lib -Wl,--enabl=
e-new-dtags -Wl,-rpath-
> > link,/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/pyt=
hon3-cython-native/3.2.4/recipe-
> > sysroot-
> > native/usr/lib -Wl,-rpath-link,/var/home/sumo/Sources/riscv-yocto/build=
/tmp/work/x86_64-linux/python3-
> > cython-
> > native/3.2.4/recipe-sysroot-native/lib -Wl,-rpath,/var/home/sumo/Source=
s/riscv-yocto/build/tmp/work/x86_64-
> > linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/lib -Wl,-rp=
ath,/var/home/sumo/Sources/riscv-
> > yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-sy=
sroot-native/lib -Wl,-O1 -Wl,--
> > allow-
> > shlib-undefined -Wl,--dynamic-linker=3D/var/home/sumo/Sources/riscv-yoc=
to/build/tmp/sysroots-
> > uninative/x86_64-
> > linux/lib/ld-linux-x86-64.so.2 -pthread -isystem/var/home/sumo/Sources/=
riscv-yocto/build/tmp/work/x86_64-
> > linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/include -O2=
 -pipe -
> > isystem/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/p=
ython3-cython-native/3.2.4/recipe-
> > sysroot-native/usr/include build/temp.linux-x86_64-cpython-314/var/home=
/sumo/Sources/riscv-
> > yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/sources/c=
ython-3.2.4/Cython/Compiler/Code.o -
> > L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3=
-cython-native/3.2.4/recipe-sysroot-
> > native/usr/lib -o build/lib.linux-x86_64-cpython-314/Cython/Compiler/Co=
de.cpython-314-x86_64-linux-gnu.so
> > > running bdist_wheel
> > > error: invalid command 'egg_info'
> > > WARNING: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-lin=
ux/python3-cython-
> > native/3.2.4/temp/run.do_compile.2101018:159 exit 1 from 'nativepython3=
 setup.py --verbose build -j 48
> > bdist_wheel --dist-dir /var/home/sumo/Sources/riscv-yocto/build/tmp/wor=
k/x86_64-linux/python3-cython-
> > native/3.2.4/dist'
> > > WARNING: Backtrace (BB generated script):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #1: setuptools3_do_compile, /var/home/=
sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-
> > cython-native/3.2.4/temp/run.do_compile.2101018, line 159
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #2: do_compile, /var/home/sumo/Sources=
/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
> > native/3.2.4/temp/run.do_compile.2101018, line 149
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #3: main, /var/home/sumo/Sources/riscv=
-yocto/build/tmp/work/x86_64-linux/python3-cython-
> > native/3.2.4/temp/run.do_compile.2101018, line 166
> > ERROR: Task (virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/o=
penembedded-core/meta/recipes-
> > devtools/python/python3-cython_3.2.4.bb:do_compile) failed with exit co=
de '1'
> > ...
> > Summary: 7 tasks failed:
> > =C2=A0 virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openemb=
edded-core/meta/recipes-
> > devtools/python/python3-pyelftools_0.32.bb:do_compile
> > =C2=A0=C2=A0=C2=A0 log: /var/home/sumo/Sources/riscv-yocto/build/tmp/wo=
rk/x86_64-linux/python3-pyelftools-
> > native/0.32/temp/log.do_compile.2101167
> > =C2=A0 virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openemb=
edded-core/meta/recipes-
> > devtools/python/python3-markupsafe_3.0.3.bb:do_compile
> > =C2=A0=C2=A0=C2=A0 log: /var/home/sumo/Sources/riscv-yocto/build/tmp/wo=
rk/x86_64-linux/python3-markupsafe-
> > native/3.0.3/temp/log.do_compile.2100841
> > =C2=A0 virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openemb=
edded-core/meta/recipes-
> > devtools/python/python3-calver_2025.10.20.bb:do_compile
> > =C2=A0=C2=A0=C2=A0 log: /var/home/sumo/Sources/riscv-yocto/build/tmp/wo=
rk/x86_64-linux/python3-calver-
> > native/2025.10.20/temp/log.do_compile.2101147
> > =C2=A0 virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openemb=
edded-core/meta/recipes-
> > devtools/meson/meson_1.10.1.bb:do_compile
> > =C2=A0=C2=A0=C2=A0 log: /var/home/sumo/Sources/riscv-yocto/build/tmp/wo=
rk/x86_64-linux/meson-
> > native/1.10.1/temp/log.do_compile.2100900
> > =C2=A0 virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openemb=
edded-core/meta/recipes-
> > devtools/python/python3-setuptools-scm_9.2.2.bb:do_compile
> > =C2=A0=C2=A0=C2=A0 log: /var/home/sumo/Sources/riscv-yocto/build/tmp/wo=
rk/x86_64-linux/python3-setuptools-scm-
> > native/9.2.2/temp/log.do_compile.2100993
> > =C2=A0 virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openemb=
edded-core/meta/recipes-
> > devtools/python/python3-mako_1.3.10.bb:do_compile
> > =C2=A0=C2=A0=C2=A0 log: /var/home/sumo/Sources/riscv-yocto/build/tmp/wo=
rk/x86_64-linux/python3-mako-
> > native/1.3.10/temp/log.do_compile.2101162
> > =C2=A0 virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openemb=
edded-core/meta/recipes-
> > devtools/python/python3-cython_3.2.4.bb:do_compile
> > =C2=A0=C2=A0=C2=A0 log: /var/home/sumo/Sources/riscv-yocto/build/tmp/wo=
rk/x86_64-linux/python3-cython-
> > native/3.2.4/temp/log.do_compile.2101018
> > Summary: There were 16 WARNING messages.
> > Summary: There were 7 ERROR messages, returning a non-zero exit code.
> >=20
> > If I revert commit ab6b2bf7b555d3516abea6255b800fe6f9673a69 all builds =
fine again.
> >=20
> > Any ideas?
> >=20
> > Thanks!
> >=20
> > Cheers
> >=20
> > Marcel
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#233031): https://lists.openembedded.org/g/openembed=
ded-core/message/233031
> > Mute This Topic: https://lists.openembedded.org/mt/118127779/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
=C2=A0[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

