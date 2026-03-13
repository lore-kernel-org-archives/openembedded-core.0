Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878A2105F784
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 09:25:31 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12061.1773393926320436044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 02:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=marcel@ziswiler.com header.s=s1-ionos header.b=mc/DWACx;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.196, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1773393916; x=1773998716; i=marcel@ziswiler.com;
	bh=LjMpGgSIUe6+q+a4Bu9MDBYflbCQ3BTHstkhTFIddg4=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mc/DWACxP5RAOSPXUZbJXd+ok7ewoI85fKMVMkqwuMSO446aVF0dbRMZW50SlrBR
	 /3BKrDbHhOAo26JoD5rLITNKtBbebIIv6aRHgG6/mxIfWSqfkkquIWNHgc6ZLLS34
	 qh5w2/nReR+pQK/SyxUIFcFaXAQhLCbaC+WJ9RKuqIhFcES74BHsmOXLFPi6zR+/d
	 7JrqvjPU1AhlFHqzBgI7RPKOT5FEvzTuG1TQqLAjnN8/J7PPB7y3bydYFaHwm3iD8
	 Zoi4lX2cYsc980S5ysBn06eiLAMPdD51lxWRWU+4UfMf1HaWUj2aSLMCC7PS67iRm
	 zXvVc+AY9Aqqy4Lpww==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelay.perfora.net (mreueus004
 [74.208.5.2]) with ESMTPSA (Nemesis) id 1MS4SF-1wB7ke0cmp-00SSl9; Fri, 13 Mar
 2026 10:25:15 +0100
Message-ID: <d291e85326d0d184045b7492aa5a1241b210763a.camel@ziswiler.com>
Subject: Re: [PATCH v2 1/4] python3-setuptools: upgrade 80.9.0 -> 82.0.0
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com
Date: Fri, 13 Mar 2026 10:25:09 +0100
In-Reply-To: <20260304045413.3265198-1-hongxu.jia@windriver.com>
References: <20260304045413.3265198-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:ENAm8uk6MLzICepkug7Ualwlv1GazdYkEwGXFSAh9AtcIjtwgk8
 gdgoaqpZDfMXEF0K5Hl+Q6e+G7520QQEBqvcK7wZvlQ2dffv7vs1pCPNTappb5XZp4MPlFG
 YcPfy6bgc7SdnySceTlwYphwrmCxUCavwPSMq7FA6K9iUYWkTsLDQCoFp+eeprOawC8gDJS
 HNb1bzHNcxMbJhc5FLlFg==
UI-OutboundReport: notjunk:1;M01:P0:kKLNMZ/6k+w=;kQ61P+Pht3M/WQpcWL0fdHXVUMa
 Q0vCUlhv9UbWVNjqhR+8eEhHZh1HVfWZdItyBeYQMEPnVdnOXlArHNhMN6GMjEN1sSWBTgmNv
 feoKOJcEFsKiHRNkRkZDHts6N2OsNulElkUhi8Z6pQEsXrOCvUOoPFzVayHtNLgNwfWVZG1Qm
 WtRSpezPqArLSZZ8Yrz7yyAZuJI4zMEiprAL9eXNei97Je5wq9y6J0lbES3o9Rx0HT1k1pSxo
 smJoKGSkZRRuvGmg+2Ttr0vtZ8xTd27k/ajdKokqTNWiSKoHWBDuVYACEHDAXGioKCQGgAKOH
 CWxXwEnPEXtMELEuXpmebXvT5ZnzbwBtODoK37FMAv1Vxk4HD3Qf6H8hwqtKYyoilUFoK5Gwp
 NxwXYtkTF/3/nHuxOVVmNfH7iH23WpaCZQfj6APR77afG/yV0aV5Tc64kGN69RI960e1M8Vrb
 MLHZ7BghklIyCu2tmisIIMU5ECvWxo3JU3bzxuASCRybWuH7zh0RCPOFRV8hBxfVEa/YRvyC6
 eOvxFsgn4qziGzntcWHO3WUI5hnd4e9oiEUoL4wCgmbYzeQAchNmccB5OELVxOTXzJIzaBlpo
 7vkuOliLTkp9YzWFEcmoV9Rn9qFGAFeuQB/Ik2O6MG8LzVA0HvtFe1BPnbre4m1j4+MoI0jMN
 CcO2ApCwucUhOjKOzvrJPrVBSl/LHp+9MzapGF80+bEgMbhyCNOh49mdB4aPOLhf98I7zwIqD
 HeCLY5EHv/CU+g7ITe7sHAgwFkwxXWxPK4q72baEGxg5XHK+iqqNiFKcO90M8fKdfzofVvBIl
 eGC7yANvlLQ7EOoy1xhiCMysRLIYWWFMxnmOJ1Ofo9sySEgi6dD2Cx8rBGMiK8IZs+EWRbZkT
 8rA/AW93OmNzf3THueni2P1wEiQOKud9gt9V1o7vbQfXCBFnsLMnljpNUuIvpvh3phc8W8FMU
 en1UTTegD1mH6Pq9iqaT5SJq5gd48JbtooJy5W653fiQwmSJUi13TNLrEmDFf9McGS+5mwMqu
 wkSxmPJ42tNN+KPt6JkdvwkL/Mlr9ubTT+veO+R7O97w7+CoN3ZuYrchFKG7+/CEOG+EfxcBx
 EIzuM8rjhf1nBrPQStPbevye6QKWdKHuHkC7PcaohG4E0KtTeS2eMx/yu0f3tDziSHKMy/EaP
 3Fh3m9OYoMogHs5XgvPj4veCNp8fcMqTRXW0IallYu5G/6ZILx9/ugArxA1aT4R56ZyEswUFr
 0iCjzIIQaK3dULlj60SW9M8Rxd/1PQ3fkEbHU7mKLTb0AebJ6ANdKc3F17QM1HGPDOzv/FTok
 alv0qMdEUlxMacvhPpWe4/gys61ZchcM5tkioqE+w+ix9IG8ThIOfoTsZ5uFHYjTgZUNpPUJA
 9DF6FqtT0PxCi0TVpWRF5uUws7buaWoov2AZE7sSZfGO36ksbP16ojrYW2vtK8o+GvSJLDu5Z
 ar4H1ORSraEsNrweRrCLEgAe6B6fD35lkGXfX7IJ8biXo9sZj65xn/luijAoER0l6CB5QqvjL
 HM5hZahLY6tBjNY720iX8WFNb7eVFASf//yA7i2HMXzCZjhUCcwZ/NAZ8g43+1PlU066oj9EL
 Q12wHl2FRonJc6m9MUwv2It0hX8x4pwaxCfT5p8jofCbPW5chphXDDN7j6KTPHQKo5+/iaf2z
 fTYdgLg0by8IIQhyJyvVyEfMOcUbeVbOU+dcqX+AwTIsRg+rTMlz3ewTd7EUZ/YnGgLI4v7TK
 X5rbibVyuWZOo6PCPzIb4bEB5EQODSVTIC0BzC8OvhjdIVaxu5uKnoxLD7Psf4JeLvmVSlr5e
 ppIa62peF7jc0QJJ5bBzhDbgcCSiTmZxob8JTHGco/FCRiBo7C6OFfmrZLwuo7n5yuNCOxqmm
 ZQrsrJ+KWf9paCu1Q==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 09:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233031

Hi Hongxu Jia

On Wed, 2026-03-04 at 12:54 +0800, Hongxu Jia wrote:
> Remove python3-pkg-resources
>=20
> History v82.0.0 [1]:
>=20
> Deprecations and Removals
> - pkg_resources has been removed from Setuptools. Most common uses of pkg=
_resources have
> =C2=A0 been superseded by the importlib.resources and importlib.metadata =
projects. Projects
> =C2=A0 and environments relying on pkg_resources for namespace packages o=
r other behavior
> =C2=A0 should depend on older versions of setuptools. (#3085)
>=20
> [1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

[snip]

Unfortunately, this seems to break all my meta-riscv machine builds:

...
| gcc -shared -L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-li=
nux/python3-cython-
native/3.2.4/recipe-sysroot-native/usr/lib -L/var/home/sumo/Sources/riscv-y=
octo/build/tmp/work/x86_64-
linux/python3-cython-native/3.2.4/recipe-sysroot-native/lib -Wl,--enable-ne=
w-dtags -Wl,-rpath-
link,/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3=
-cython-native/3.2.4/recipe-sysroot-
native/usr/lib -Wl,-rpath-link,/var/home/sumo/Sources/riscv-yocto/build/tmp=
/work/x86_64-linux/python3-cython-
native/3.2.4/recipe-sysroot-native/lib -Wl,-rpath,/var/home/sumo/Sources/ri=
scv-yocto/build/tmp/work/x86_64-
linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/lib -Wl,-rpath,=
/var/home/sumo/Sources/riscv-
yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-sysroo=
t-native/lib -Wl,-O1 -Wl,--allow-
shlib-undefined -Wl,--dynamic-linker=3D/var/home/sumo/Sources/riscv-yocto/b=
uild/tmp/sysroots-uninative/x86_64-
linux/lib/ld-linux-x86-64.so.2 -pthread -isystem/var/home/sumo/Sources/risc=
v-yocto/build/tmp/work/x86_64-
linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/include -O2 -pi=
pe -
isystem/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/pytho=
n3-cython-native/3.2.4/recipe-
sysroot-native/usr/include build/temp.linux-x86_64-cpython-314/var/home/sum=
o/Sources/riscv-
yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/sources/cytho=
n-3.2.4/Cython/Compiler/Code.o -
L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cyt=
hon-native/3.2.4/recipe-sysroot-
native/usr/lib -o build/lib.linux-x86_64-cpython-314/Cython/Compiler/Code.c=
python-314-x86_64-linux-gnu.so
| running bdist_wheel
| error: invalid command 'egg_info'
| WARNING: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/p=
ython3-cython-
native/3.2.4/temp/run.do_compile.2101018:159 exit 1 from 'nativepython3 set=
up.py --verbose build -j 48
bdist_wheel --dist-dir /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x8=
6_64-linux/python3-cython-
native/3.2.4/dist'
| WARNING: Backtrace (BB generated script):
|       #1: setuptools3_do_compile, /var/home/sumo/Sources/riscv-yocto/buil=
d/tmp/work/x86_64-linux/python3-
cython-native/3.2.4/temp/run.do_compile.2101018, line 159
|       #2: do_compile, /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x=
86_64-linux/python3-cython-
native/3.2.4/temp/run.do_compile.2101018, line 149
|       #3: main, /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-=
linux/python3-cython-
native/3.2.4/temp/run.do_compile.2101018, line 166
ERROR: Task (virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/opene=
mbedded-core/meta/recipes-
devtools/python/python3-cython_3.2.4.bb:do_compile) failed with exit code '=
1'
...
Summary: 7 tasks failed:
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-cor=
e/meta/recipes-
devtools/python/python3-pyelftools_0.32.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/pyt=
hon3-pyelftools-
native/0.32/temp/log.do_compile.2101167
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-cor=
e/meta/recipes-
devtools/python/python3-markupsafe_3.0.3.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/pyt=
hon3-markupsafe-
native/3.0.3/temp/log.do_compile.2100841
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-cor=
e/meta/recipes-
devtools/python/python3-calver_2025.10.20.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/pyt=
hon3-calver-
native/2025.10.20/temp/log.do_compile.2101147
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-cor=
e/meta/recipes-
devtools/meson/meson_1.10.1.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/mes=
on-
native/1.10.1/temp/log.do_compile.2100900
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-cor=
e/meta/recipes-
devtools/python/python3-setuptools-scm_9.2.2.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/pyt=
hon3-setuptools-scm-
native/9.2.2/temp/log.do_compile.2100993
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-cor=
e/meta/recipes-
devtools/python/python3-mako_1.3.10.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/pyt=
hon3-mako-
native/1.3.10/temp/log.do_compile.2101162
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-cor=
e/meta/recipes-
devtools/python/python3-cython_3.2.4.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/pyt=
hon3-cython-
native/3.2.4/temp/log.do_compile.2101018
Summary: There were 16 WARNING messages.
Summary: There were 7 ERROR messages, returning a non-zero exit code.

If I revert commit ab6b2bf7b555d3516abea6255b800fe6f9673a69 all builds fine=
 again.

Any ideas?

Thanks!

Cheers

Marcel

