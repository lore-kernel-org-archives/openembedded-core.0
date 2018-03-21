Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 134467896D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:30:50 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id g14so6208167iob.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F+a2YygAairL12dkm6zEdT7UkMhaLLta1gYOHzoI310=;
	b=KbWbI05V4rDvEivu1n6F0pUMXqFuLwtZIysRBIh1vN/cMHq2HZuT4TCWHvt8nprUFJ
	/R6t7d+NBWooCBV3IZaG5zBuBa6/lEl9Z1VJXgBWTdontw7cK59siMnrQsuOfDEFx5/a
	GgBvba9r5o8vrOvPhJ9omilR1xSHoxhttOmzU4Srhp7SpRSUrmUUa3AjCqIzPOsph+k2
	5w/d55OJwf1DDFBA773nI6k2WaDjWknOctB/l6vuYynDMpONuOEVmFnyia1aVWf1jxWf
	Qq2orovI923fWLxGMQ3IJTjLKY1rvlAUQkczZj/rFw/EvwuA1wC1isiI02k4TZ2+4d2U
	mGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F+a2YygAairL12dkm6zEdT7UkMhaLLta1gYOHzoI310=;
	b=I/bLrEzr7xX5jNpGZoO7J0XA58ghglV/iIbIak60TwijvuRrbnOdbuTNZ7oMD+BkIz
	8y/2Fo5mGOw2UmqjAHqClmWeMaRRUuFonmu1Rja5k82Gyxa/w/flbc5bk0Cd/nzLom/a
	5DiJ08DeIbU5a2+5auqLAhpJXaUbm465j6ueNgDhKJ8iA1zyuVWmygXowa/aRsYXM6F8
	j3evCGiF83IUmnJRz/DgkSicR1Qi4dZLkXzi3jUnzNt+dbCs0DiN8X2gMamc6okIDq8f
	U5SctW6V3EVbEGhMw9EXZ6dBNIQ8kHg87XjXlsxZOLhO8P/kHS9XUrJ77oA2nZhabS0l
	SmeA==
X-Gm-Message-State: AElRT7GjBuLG+BU4gjrIRNq4Gx8/CXsFbsf1PSdx5NFdWZQLfoniKTTa
	bfItW80OI2HxU6XV82cpwuS6ccp0SydCT/jaEIkusw==
X-Google-Smtp-Source: AG47ELv1xb1jZtdIeAdSReKbcEvmQSQjxu/BP7tUu2ROSo+CnG10DnXsuw7zR1w/n5DF1Ga8Wfw+UFhpK+53GC/PAkI=
X-Received: by 10.107.37.212 with SMTP id l203mr19624183iol.20.1521631852265; 
	Wed, 21 Mar 2018 04:30:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 04:30:31 -0700 (PDT)
In-Reply-To: <CAPGMVzGS2LNAL2nAM7JABJgPF=wrw4+1aeEdXPxAy_xOyekK8A@mail.gmail.com>
References: <CAPGMVzGS2LNAL2nAM7JABJgPF=wrw4+1aeEdXPxAy_xOyekK8A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 11:30:31 +0000
Message-ID: <CAJTo0LaACuLHS9vJ6xe7bwjYmAVCZ10=mnKttN5AW+c+5vpXPg@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta data error while building
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 11:30:51 -0000
Content-Type: multipart/alternative; boundary="001a11405f1608a5390567ea86c2"

--001a11405f1608a5390567ea86c2
Content-Type: text/plain; charset="UTF-8"

If you made that change during a build, it's because you made a change
during a build.  Don't worry about it, it will go away on the next build.

(its telling you that the hash of the recipe state changed from first parse
to execution, which happened because you changed it)

Ross

On 21 March 2018 at 11:01, Rajath C S <rajathcs.1996@gmail.com> wrote:

> The below is the error while building core-image-sato, this error popped
> after i including the line : PACKAGECONFIG_pn-opencv = "python2"
>
> Please help me with the solution
>
>
>
>            ERROR: When reparsing /home/jarvis/poky/meta/
> recipes-sato/images/core-image-sato.bb.do_configure, the basehash value
> changed from 5d45ab9eb20c7583ac1edaab00e92e7d to
> bed406587156555087b16ce65e70811f. The metadata is not deterministic and
> this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_compile,
> the basehash value changed from 9b38ab297fe83e0397582fc241ec269b to
> 3e073d16f43dd6d1aafbfc77c0e5c193. The metadata is not deterministic and
> this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_install,
> the basehash value changed from 4e71f923f6dce32b7d98e1a016de76c9 to
> 1cbe08c06c4c74f7f4765b2b5ca43449. The metadata is not deterministic and
> this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_build,
> the basehash value changed from 77ff16e3d2d174337fc64b171c35e34c to
> f8c231359c972ada4c1acdfeb4139a61. The metadata is not deterministic and
> this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_package,
> the basehash value changed from bd69a16a7e8681701ed1bcb838350140 to
> 609508e260f4448bdecfa6fc14a648fc. The metadata is not deterministic and
> this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_packagedata,
> the basehash value changed from 5536cec6dc8957b6d48670b030ca78d4 to
> 7f342767cb91e19d4718fd437a37e259. The metadata is not deterministic and
> this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-
> image-sato.bb.do_package_write_deb, the basehash value changed from
> 87e31ea755f9b76dce7ae72fe34299b1 to 24719e85cf15c36f5b18cd6837841463. The
> metadata is not deterministic and this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_rootfs,
> the basehash value changed from d3cb3148fa62977844e3acc707212156 to
> 41805c6bbbbe7544554ad2887c85ae8e. The metadata is not deterministic and
> this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_image,
> the basehash value changed from f6b739ca1cfbc47bd8d14904c64d044b to
> e1abbf58b56b9f1614a1f352f715a56f. The metadata is not deterministic and
> this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-
> image-sato.bb.do_image_complete, the basehash value changed from
> 2ecdd58b8f372fb25ead31b8b04c47fa to 13be28bfaf5214958bd047d9c7682e24. The
> metadata is not deterministic and this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_image_tar,
> the basehash value changed from 7ba819c63a822ea5f5e7ce817c642127 to
> 36b2b07ea59c24b0e089467790f51829. The metadata is not deterministic and
> this needs to be fixed.
> ERROR: When reparsing /home/jarvis/poky/meta/recipes-sato/images/core-image-sato.bb.do_image_ext4,
> the basehash value changed from 09e97f15239508528e29bb300d6a2c99 to
> 48adebf1ecd497028b62e8a19fd21e0d. The metadata is not deterministic and
> this needs to be fixed.
>
>
>

--001a11405f1608a5390567ea86c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If you made that change during a build, it&#39;s because y=
ou made a change during a build.=C2=A0 Don&#39;t worry about it, it will go=
 away on the next build.<div><br></div><div>(its telling you that the hash =
of the recipe state changed from first parse to execution, which happened b=
ecause you changed it)</div><div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 March 2018 at 11:01, =
Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com"=
 target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div>The below is the error while =
building core-image-sato, this error popped after i including the line : PA=
CKAGECONFIG_pn-opencv =3D &quot;python2&quot;<br><br></div>Please help me w=
ith the solution<br><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 <br><br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ERROR: When reparsing /home/jarvis/poky/meta/<wbr>recipes-sato=
/images/core-<wbr>image-sato.bb.do_configure, the basehash value changed fr=
om 5d45ab9eb20c7583ac1edaab00e92e<wbr>7d to bed406587156555087b16ce65e7081<=
wbr>1f. The metadata is not deterministic and this needs to be fixed.<br>ER=
ROR: When reparsing /home/jarvis/poky/meta/<wbr>recipes-sato/images/core-<w=
br>image-sato.bb.do_compile, the basehash value changed from 9b38ab297fe83e=
0397582fc241ec26<wbr>9b to 3e073d16f43dd6d1aafbfc77c0e5c1<wbr>93. The metad=
ata is not deterministic and this needs to be fixed.<br>ERROR: When reparsi=
ng /home/jarvis/poky/meta/<wbr>recipes-sato/images/core-<wbr>image-sato.bb.=
do_install, the basehash value changed from 4e71f923f6dce32b7d98e1a016de76<=
wbr>c9 to 1cbe08c06c4c74f7f4765b2b5ca434<wbr>49. The metadata is not determ=
inistic and this needs to be fixed.<br>ERROR: When reparsing /home/jarvis/p=
oky/meta/<wbr>recipes-sato/images/core-<wbr>image-sato.bb.do_build, the bas=
ehash value changed from 77ff16e3d2d174337fc64b171c35e3<wbr>4c to f8c231359=
c972ada4c1acdfeb4139a<wbr>61. The metadata is not deterministic and this ne=
eds to be fixed.<br>ERROR: When reparsing /home/jarvis/poky/meta/<wbr>recip=
es-sato/images/core-<wbr>image-sato.bb.do_package, the basehash value chang=
ed from bd69a16a7e8681701ed1bcb8383501<wbr>40 to 609508e260f4448bdecfa6fc14=
a648<wbr>fc. The metadata is not deterministic and this needs to be fixed.<=
br>ERROR: When reparsing /home/jarvis/poky/meta/<wbr>recipes-sato/images/co=
re-<wbr>image-sato.bb.do_packagedata, the basehash value changed from 5536c=
ec6dc8957b6d48670b030ca78<wbr>d4 to 7f342767cb91e19d4718fd437a37e2<wbr>59. =
The metadata is not deterministic and this needs to be fixed.<br>ERROR: Whe=
n reparsing /home/jarvis/poky/meta/<wbr>recipes-sato/images/core-<wbr>image=
-sato.bb.do_package_<wbr>write_deb, the basehash value changed from 87e31ea=
755f9b76dce7ae72fe34299<wbr>b1 to 24719e85cf15c36f5b18cd68378414<wbr>63. Th=
e metadata is not deterministic and this needs to be fixed.<br>ERROR: When =
reparsing /home/jarvis/poky/meta/<wbr>recipes-sato/images/core-<wbr>image-s=
ato.bb.do_rootfs, the basehash value changed from d3cb3148fa62977844e3acc70=
72121<wbr>56 to 41805c6bbbbe7544554ad2887c85ae<wbr>8e. The metadata is not =
deterministic and this needs to be fixed.<br>ERROR: When reparsing /home/ja=
rvis/poky/meta/<wbr>recipes-sato/images/core-<wbr>image-sato.bb.do_image, t=
he basehash value changed from f6b739ca1cfbc47bd8d14904c64d04<wbr>4b to e1a=
bbf58b56b9f1614a1f352f715a5<wbr>6f. The metadata is not deterministic and t=
his needs to be fixed.<br>ERROR: When reparsing /home/jarvis/poky/meta/<wbr=
>recipes-sato/images/core-<wbr>image-sato.bb.do_image_<wbr>complete, the ba=
sehash value changed from 2ecdd58b8f372fb25ead31b8b04c47<wbr>fa to 13be28bf=
af5214958bd047d9c7682e<wbr>24. The metadata is not deterministic and this n=
eeds to be fixed.<br>ERROR: When reparsing /home/jarvis/poky/meta/<wbr>reci=
pes-sato/images/core-<wbr>image-sato.bb.do_image_tar, the basehash value ch=
anged from 7ba819c63a822ea5f5e7ce817c6421<wbr>27 to 36b2b07ea59c24b0e089467=
790f518<wbr>29. The metadata is not deterministic and this needs to be fixe=
d.<br>ERROR: When reparsing /home/jarvis/poky/meta/<wbr>recipes-sato/images=
/core-<wbr>image-sato.bb.do_image_ext4, the basehash value changed from 09e=
97f15239508528e29bb300d6a2c<wbr>99 to 48adebf1ecd497028b62e8a19fd21e<wbr>0d=
. The metadata is not deterministic and this needs to be fixed.<br><br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br></div></div>
</blockquote></div><br></div>

--001a11405f1608a5390567ea86c2--
