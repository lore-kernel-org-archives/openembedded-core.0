Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5B37900E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 09:05:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u12-v6so5577142wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y27iC77ofiddO1cKcR2YFLKOzXoUA27KGrwDKBt5dm0=;
	b=PUCsF5q39TFM5JAJiRle42tQny3nVl4nCP/TG2xzN0gYbaFMwGgj2cemSrB8LYQIyh
	8luRjnGEhPHKLVeP09VEU+gVn3SS4Kpx08R03wHaa/+5u26zFYVOq0C7BR2WEm/Jfa/5
	hnz3ga891tACb0sJtFFnv0rVGEkxmeJ9LrwiZqJybbDbB4zxJnMM4HkANp+z8yOdE7SJ
	MXNkU4U9tTC9MZoK52b4OxbZx6s18fxIrTyNTHnUQRaB1yAta8NRfyktP30lwtm+LD6L
	CefwrrkkYMC0m5/AAFii0rwGpEDugRVf2n7Zv41kdmnwRVOuHVXgs22XK9h0LN4Zqwv9
	Ydxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y27iC77ofiddO1cKcR2YFLKOzXoUA27KGrwDKBt5dm0=;
	b=k7wA8D3r5ZXPNer5UykV0MvZEKY7IVvPHgHMm/jWjZ2cgMoEZD0a+nO7rZ6gBj/WZi
	eMLJcnt8BBHG0/mHVkowHhr3CXKkF6fDA/VDffc3AVoyRd13tHdLsxFiJz+Csh6NZbKE
	PlD9rqYNwYTjL0tWOoe4CFM42c8BmOLqk/IXZTggaByvcqUEd+BdK9c8HBwlfQ5o4YZi
	PgNIrIwF/ZIfRfZWWp9QsBrzPtgSMfkL7KBUL/ZWZCNSt8cda1+QE9rWA3jqlUEAMccn
	vgIwBJkKwxd8Ll4NIJuVt6MEGnZsqPOKKxbdXUGFiyUSfvQQNhShvJTW4jQX76h7aXvi
	iXZg==
X-Gm-Message-State: APzg51D+XeDSf4SM3/eXfEBjfdV8syIh7qQQgsadxFqGTQG7JHK6CbDl
	NgrQbtNqz+aAdGi0nQ7lmSOtSK8CvXeU2UBcFYQ=
X-Google-Smtp-Source: ANB0VdayD8QdtHCO1GLttprWos21xjBKLAYKAZGzqQYJ/eQDarDuG+Y31qOkCMMjsWfJZtd+mCyLtnsRKepJx1C8lQ0=
X-Received: by 2002:adf:f28c:: with SMTP id
	k12-v6mr602543wro.263.1535101506961; 
	Fri, 24 Aug 2018 02:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-h+BwzZg=gZtvVTneykKZb9k+UwgkR9Lt8jjo7Kvbj60Hw@mail.gmail.com>
	<CAJ86T=WT0G5Q9Q+Z2GQ27hnTfOjgZcUtYzNbs+fvc5mTDwrNew@mail.gmail.com>
In-Reply-To: <CAJ86T=WT0G5Q9Q+Z2GQ27hnTfOjgZcUtYzNbs+fvc5mTDwrNew@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Aug 2018 11:04:55 +0200
Message-ID: <CA+chaQeR5fARUq_y+SKU+YBg1psK-aV4efXbq7+aY+-FaLRcig@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	daiane.angolini@nxp.com, patches@linaro.org
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Fri, 24 Aug 2018 09:05:06 -0000
Content-Type: multipart/alternative; boundary="00000000000004458405742aacce"

--00000000000004458405742aacce
Content-Type: text/plain; charset="UTF-8"

One way to keep it allarch would be to package
${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP6212.txt
${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
in 2 separate packages and handle
${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
symlink with update-alternatives

most MACHINEs won't install either of these packages and those which need
it will pull the right one (e.g. through MACHINE_EXTRA_RRECOMMENDS).

In worst case someone will try to install both packages and based on u-a
priority one of them will win (use higher priority for the more common
version).

Cheers,

On Fri, Aug 24, 2018 at 4:53 AM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Aug 23, 2018 at 1:15 AM, Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> >
> > So now the ln issue is resolved, I'm not convinced my MACHINEOVERRIDES is
> > the correct approach. Does anyone have any feedback on how I can improve
> > that?
>
> If you want to make a configurable symlink then perhaps the more usual
> approach would be to just use a variable in the linux-firmware recipe
> to weakly define a default target for the symlink. Machine config
> files could then either do nothing (ie use the default) or provide
> their own value. For example, in the linux-firmware recipe:
>
>   BCM43430_NVRAM_SYMLINK ?= "brcmfmac43430-sdio.AP6212.txt"
>
>   FILES_${PN}-bcm43430-nvram = " \
>     ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt \
>     ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP6212.txt \
>     ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt \
>   "
>
>   do_install() {
>     ...
>     ln -sf ${BCM43430_NVRAM_SYMLINK}
> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
>   }
>
> And then in the machine config files of machines which need the MUR1DX
> firmware instead of the default, add:
>
>   BCM43430_NVRAM_SYMLINK = "brcmfmac43430-sdio.MUR1DX.txt"
>
> However... note that currently the linux-firmware recipe is
> architecture independent (ie it won't be rebuilt if the target is
> changed). Adding a machine specific symlink is going to cause problems
> with that, so the above is still not a full solution.
>

--00000000000004458405742aacce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">One way to keep it allarch would be to package<div>${nonar=
ch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP6212.txt<br>${nonarch_ba=
se_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt<br></div><div>in 2 s=
eparate packages and handle</div><div>${nonarch_base_libdir}/firmware/brcm/=
brcmfmac43430-sdio.txt<br></div><div>symlink with update-alternatives</div>=
<div><br></div><div>most MACHINEs won&#39;t install either of these package=
s and those which need it will pull the right one (e.g. through=C2=A0MACHIN=
E_EXTRA_RRECOMMENDS).</div><div><br></div><div>In worst case someone will t=
ry to install both packages and based on u-a priority one of them will win =
(use higher priority for the more common version).</div><div><br></div><div=
>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri,=
 Aug 24, 2018 at 4:53 AM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmai=
l.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On Thu, Aug 23, 2018 at 1:15 AM, Ryan Harkin &lt;<a href=3D"mailto:r=
yan.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt; So now the ln issue is resolved, I&#39;m not convinced my MACHINEOVERR=
IDES is<br>
&gt; the correct approach. Does anyone have any feedback on how I can impro=
ve<br>
&gt; that?<br>
<br>
If you want to make a configurable symlink then perhaps the more usual<br>
approach would be to just use a variable in the linux-firmware recipe<br>
to weakly define a default target for the symlink. Machine config<br>
files could then either do nothing (ie use the default) or provide<br>
their own value. For example, in the linux-firmware recipe:<br>
<br>
=C2=A0 BCM43430_NVRAM_SYMLINK ?=3D &quot;brcmfmac43430-sdio.AP6212.txt&quot=
;<br>
<br>
=C2=A0 FILES_${PN}-bcm43430-nvram =3D &quot; \<br>
=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt \=
<br>
=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP621=
2.txt \<br>
=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1D=
X.txt \<br>
=C2=A0 &quot;<br>
<br>
=C2=A0 do_install() {<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 ln -sf ${BCM43430_NVRAM_SYMLINK}<br>
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt<br>
=C2=A0 }<br>
<br>
And then in the machine config files of machines which need the MUR1DX<br>
firmware instead of the default, add:<br>
<br>
=C2=A0 BCM43430_NVRAM_SYMLINK =3D &quot;brcmfmac43430-sdio.MUR1DX.txt&quot;=
<br>
<br>
However... note that currently the linux-firmware recipe is<br>
architecture independent (ie it won&#39;t be rebuilt if the target is<br>
changed). Adding a machine specific symlink is going to cause problems<br>
with that, so the above is still not a full solution.<br>
</blockquote></div>

--00000000000004458405742aacce--
