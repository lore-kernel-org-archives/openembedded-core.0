Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C6C98789BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 18:01:49 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id h20-v6so7253419wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xB4dq6p3YJUfrcTmRWsXyPeCX3Bpb7iTTT2NcSgAkgI=;
	b=F2vk75DxQis4mJR+PC7QbFnRYggD4NQP3P0bSzyt2CbxWknTD8M5K+Tza6G5HKqJbQ
	ChUWByBBVRt0e0Pjgp9eEOfn4Y7tnEVmrejG4X6zySNDnqfDeOo/vfDKmT1RJgrY7ynm
	JcRW3X+2tmUSYfQCtFvdqZQo2rMoeGBT6ISm8SWfQtOVMHZt4LCd9zxD339ott/7Zbet
	d4ULrC8nWzDEstqKg4tbo5h7/lj1vcvncHPfoMay3yCKHgSAujvfXWFY8nvfCDEGbt7w
	V/Zd0F4pn5RSsYA1Y6/+h6I8BtdQqR/fT9LcR+yDwXNeiqoVa68LldsVVoRIXI3UzL7Y
	6Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xB4dq6p3YJUfrcTmRWsXyPeCX3Bpb7iTTT2NcSgAkgI=;
	b=YFY2t5kQkzGOtdgpzI3edP/V0MPT20Rx2fwEg1zY5iQCBkjI5B74I9eS2ZFbnhDYzL
	Pv2+YrXgCmFpsdsXM0EAm4IlnpByZT6hyuxa4rUTpJx73C/S5Q1T4PPxObrVgT4HUtkQ
	wHAunRCa+H0fKYBQXCAGZ/+vdgIxu8u29NbxPG26xlsaHHYxu4pjlfhiabWNpYCufZHw
	T8yLPRdynihSnZ392KxokueS2w6M+V6JRi94YOLi94k6mY5WGiW4ALujj2MxdCs8b0FU
	SwRWwlNFtnZ2EErOSBOMtcmu3MRzkyShdGEOgrpynuBZNyreHMEXtjJ7F50El0bdczsh
	PdAQ==
X-Gm-Message-State: AOUpUlH7Be59dY/mWFFPd7aZXBdC4BP5Qu21qP7An9x6AcXyHQaswZNM
	m7AVeYxUt9+lE8M0AcjmHVyMNM/X/EIbk4Ogd7c=
X-Google-Smtp-Source: AAOMgpfKWgRk+qx9v4S2WByh2NN7YFIGXFDwBUd6/ljV0kTEI9Oh49UlQg6vLxynT4OMYoSMyNOPirLOm9lzA8tfxM0=
X-Received: by 2002:a1c:f46:: with SMTP id 67-v6mr4579874wmp.122.1532023310561;
	Thu, 19 Jul 2018 11:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20180711150308.30275-1-marex@denx.de>
	<CAJTo0Latp_c1LVzzObR+FPYosVDuohbRwnGfOGruxaoHLSr8Uw@mail.gmail.com>
	<95864f6b-fae7-eb3a-ac2c-0e4efb18f88a@denx.de>
	<17eec68ff43fcf0259a4e89233e66a02907d0153.camel@gmail.com>
In-Reply-To: <17eec68ff43fcf0259a4e89233e66a02907d0153.camel@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 19 Jul 2018 20:01:39 +0200
Message-ID: <CA+chaQfa5vCqWZ_0e5MPyr1B2Fh25ec4N_Hpa92Hv_AkHetHoQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Add missing dependency on swig
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
X-List-Received-Date: Thu, 19 Jul 2018 18:01:50 -0000
Content-Type: multipart/alternative; boundary="00000000000036b57305715df96b"

--00000000000036b57305715df96b
Content-Type: text/plain; charset="UTF-8"

FWIW: my do_compile_prepend hack to stop autodetecting swig from sysroot
(in pre-RSS - recipe specific sysroots in Yocto 2.2) stopped working in
2017.07 version where it was moved from tools/Makefile:
https://github.com/u-boot/u-boot/commit/727f153629719c93f9c5df6e391fdfee32377ca7#diff-c9b3e9a4c86396781af56d6bdfc8c9f3

It was still building without swig I belive until 2018.07 version which
doesn't use "$(if $(shell which swig 2> /dev/null)" to check for native
swig anymore since:
https://github.com/u-boot/u-boot/commit/15b97f5c5e6d88e0560c6928f3acd01c999a494d#diff-c9b3e9a4c86396781af56d6bdfc8c9f3

Thanks Joshua for the fix.

On Thu, Jul 19, 2018 at 7:00 PM Joshua Watt <jpewhacker@gmail.com> wrote:

> On Wed, 2018-07-11 at 20:56 +0200, Marek Vasut wrote:
> > On 07/11/2018 06:10 PM, Burton, Ross wrote:
> > > On 11 July 2018 at 16:03, Marek Vasut <marex@denx.de> wrote:
> > > > The U-Boot build, in particular the pylibfdt, depends on swig-
> > > > native.
> > > > Add the missing dependency.
> > >
> > > If pylibfdt isn't usually needed (which it cant be, if swig is an
> > > optional build dependency which isn't on my machines, or the
> > > autobuilders, right?) can we just disable the building of pylibfdt
> > > instead?
> >
> > Why do you think libpyfdt isn't usually needed ?
> >
> > Why do you think swig is optional dependency ?
>
> I encountered this same issue and was able to track it down. The
> problem is that u-boot is building pylibfdt using the host Python
> instead of using python-native provided by bitbake. pylibfdt is a non-
> optional dependency for several u-boot configurations, in my case qemu-
> x86 and qemu-x84_64.
>
> I pushed a patch to the mailing list that I think fixes this: http://li
> sts.openembedded.org/pipermail/openembedded-core/2018-July/153115.html
>
> >
> > > Ross
> > >
> >
> >
> > --
> > Best regards,
> > Marek Vasut
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000036b57305715df96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: my do_compile_prepend hack to stop autodetecting swi=
g from sysroot (in pre-RSS - recipe specific sysroots in Yocto 2.2) stopped=
 working in 2017.07 version where it was moved from tools/Makefile:<div><a =
href=3D"https://github.com/u-boot/u-boot/commit/727f153629719c93f9c5df6e391=
fdfee32377ca7#diff-c9b3e9a4c86396781af56d6bdfc8c9f3">https://github.com/u-b=
oot/u-boot/commit/727f153629719c93f9c5df6e391fdfee32377ca7#diff-c9b3e9a4c86=
396781af56d6bdfc8c9f3</a><br></div><div><br></div><div>It was still buildin=
g without swig I belive until 2018.07 version which doesn&#39;t use &quot;$=
(if $(shell which swig 2&gt; /dev/null)&quot; to check for native swig anym=
ore since:</div><div><a href=3D"https://github.com/u-boot/u-boot/commit/15b=
97f5c5e6d88e0560c6928f3acd01c999a494d#diff-c9b3e9a4c86396781af56d6bdfc8c9f3=
">https://github.com/u-boot/u-boot/commit/15b97f5c5e6d88e0560c6928f3acd01c9=
99a494d#diff-c9b3e9a4c86396781af56d6bdfc8c9f3</a><br></div><div><br></div><=
div>Thanks Joshua for the fix.</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Thu, Jul 19, 2018 at 7:00 PM Joshua Watt &lt;<a href=3D"m=
ailto:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Wed, 2018-07-11 at 20:56 +0200, Marek Vasut=
 wrote:<br>
&gt; On 07/11/2018 06:10 PM, Burton, Ross wrote:<br>
&gt; &gt; On 11 July 2018 at 16:03, Marek Vasut &lt;<a href=3D"mailto:marex=
@denx.de" target=3D"_blank">marex@denx.de</a>&gt; wrote:<br>
&gt; &gt; &gt; The U-Boot build, in particular the pylibfdt, depends on swi=
g-<br>
&gt; &gt; &gt; native.<br>
&gt; &gt; &gt; Add the missing dependency.<br>
&gt; &gt; <br>
&gt; &gt; If pylibfdt isn&#39;t usually needed (which it cant be, if swig i=
s an<br>
&gt; &gt; optional build dependency which isn&#39;t on my machines, or the<=
br>
&gt; &gt; autobuilders, right?) can we just disable the building of pylibfd=
t<br>
&gt; &gt; instead?<br>
&gt; <br>
&gt; Why do you think libpyfdt isn&#39;t usually needed ?<br>
&gt; <br>
&gt; Why do you think swig is optional dependency ?<br>
<br>
I encountered this same issue and was able to track it down. The<br>
problem is that u-boot is building pylibfdt using the host Python<br>
instead of using python-native provided by bitbake. pylibfdt is a non-<br>
optional dependency for several u-boot configurations, in my case qemu-<br>
x86 and qemu-x84_64.<br>
<br>
I pushed a patch to the mailing list that I think fixes this: <a href=3D"ht=
tp://li" rel=3D"noreferrer" target=3D"_blank">http://li</a><br>
<a href=3D"http://sts.openembedded.org/pipermail/openembedded-core/2018-Jul=
y/153115.html" rel=3D"noreferrer" target=3D"_blank">sts.openembedded.org/pi=
permail/openembedded-core/2018-July/153115.html</a><br>
<br>
&gt; <br>
&gt; &gt; Ross<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Best regards,<br>
&gt; Marek Vasut<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000036b57305715df96b--
