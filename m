Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE3260620
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:54:54 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id q13-v6so1001119lfc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 03:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oA5VGOsQCukg2NGuDHNwz7BToalG1D4YzEDXtilq720=;
	b=bhGC9lkWYFGOVxmdAdxz17phKAIcR3O03bSiVsraoFkcoOCsc3dPfWVplF9+UN7O5J
	liIv1bYABRg4Qc6Kx6xIaRX5qCYqE+xMI4D2EoXG1T83BOtEX6m3U7pf0KOiiCpgVC8+
	NX4o1rKuPPcE/zpnUl3SZ0/agIBTYbTfK3VmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oA5VGOsQCukg2NGuDHNwz7BToalG1D4YzEDXtilq720=;
	b=M5cyyQ+BcRJEylVe4EDObKhnYDD/Et8VcLdijBG3G0unHI36ONlEjVx+oiVUI+bhRG
	J+y5qo/8huUWVCuVxSfC78fjFjQu8vUVbqSqhzvEuyOkDA0cWz4CDaC7CuQxGO15sZpp
	hPXLZIYxND6zE6sf61RRpT3rwtUg3EBBSeRWpKJhsY36IOnFF+Gw4QTkoaV1s2bFYYDm
	Wwsivlbfs+qLHXNkZ0lqLMkzHKBo6yxgyMHtR/tYPOl3QsPHFrY4BxRqJ+6237o47TPt
	ZYnhuLLy206RVEitKC/xkkDRppIvBkP/q8h6Kvrbt0l5x1zRJ2dr+oN13l/+b7AqUd0x
	t1rg==
X-Gm-Message-State: APzg51CRIFDHP+yc/Z7VipPPYajDUNtjcZlVageAsYaNZiThaftehwBu
	Eyhtm742eEHXo5pi35Yp0Vdy0ImmhpAQg2m/tpTrEA==
X-Google-Smtp-Source: ANB0Vdb2CcBCeFMXLIMcKSYZGyL8OaZdtSeKC4vi1hapNxICW3IYaAhtNHmnED5HxduewDP0yjytX3DzLATdry+HFCI=
X-Received: by 2002:a19:10cb:: with SMTP id 72-v6mr905681lfq.113.1535453695537;
	Tue, 28 Aug 2018 03:54:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1bc7:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 03:54:54
	-0700 (PDT)
In-Reply-To: <75f6f971-cc25-4828-d17d-aa3d04b259cc@topic.nl>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-h+BwzZg=gZtvVTneykKZb9k+UwgkR9Lt8jjo7Kvbj60Hw@mail.gmail.com>
	<CAJ86T=WT0G5Q9Q+Z2GQ27hnTfOjgZcUtYzNbs+fvc5mTDwrNew@mail.gmail.com>
	<CA+chaQeR5fARUq_y+SKU+YBg1psK-aV4efXbq7+aY+-FaLRcig@mail.gmail.com>
	<75f6f971-cc25-4828-d17d-aa3d04b259cc@topic.nl>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Tue, 28 Aug 2018 11:54:54 +0100
Message-ID: <CAD0U-hJgkBxgvpgwLNr_qfVE-8Zf9fd828obFzh+rkE07sMH1w@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	daiane.angolini@nxp.com, Patch Tracking <patches@linaro.org>
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
X-List-Received-Date: Tue, 28 Aug 2018 10:54:55 -0000
Content-Type: multipart/alternative; boundary="000000000000178bfe05747cac16"

--000000000000178bfe05747cac16
Content-Type: text/plain; charset="UTF-8"

On 24 August 2018 at 11:43, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> I think this should be solved in the driver actually. It probably "knows"
> which variant is there (or could be taught using devicetree or so).


I agree. That's a longer term change that will take quite some time to
filter through, if at all.

The device doesn't know which variant it is, but I'm *hoping* to add a
device tree attribute to cover this, but there has been resistance this in
the past, so it may not be an easy change to get accepted.


>
> On 24-08-18 11:04, Martin Jansa wrote:
>
>> One way to keep it allarch would be to package
>> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP6212.txt
>> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
>> in 2 separate packages and handle
>> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
>> symlink with update-alternatives
>>
>> most MACHINEs won't install either of these packages and those which need
>> it will pull the right one (e.g. through MACHINE_EXTRA_RRECOMMENDS).
>>
>> In worst case someone will try to install both packages and based on u-a
>> priority one of them will win (use higher priority for the more common
>> version).
>>
>> Cheers,
>>
>> On Fri, Aug 24, 2018 at 4:53 AM Andre McCurdy <armccurdy@gmail.com
>> <mailto:armccurdy@gmail.com>> wrote:
>>
>>     On Thu, Aug 23, 2018 at 1:15 AM, Ryan Harkin <ryan.harkin@linaro.org
>>     <mailto:ryan.harkin@linaro.org>> wrote:
>>      >
>>      > So now the ln issue is resolved, I'm not convinced my
>> MACHINEOVERRIDES is
>>      > the correct approach. Does anyone have any feedback on how I can
>> improve
>>      > that?
>>
>>     If you want to make a configurable symlink then perhaps the more usual
>>     approach would be to just use a variable in the linux-firmware recipe
>>     to weakly define a default target for the symlink. Machine config
>>     files could then either do nothing (ie use the default) or provide
>>     their own value. For example, in the linux-firmware recipe:
>>
>>        BCM43430_NVRAM_SYMLINK ?= "brcmfmac43430-sdio.AP6212.txt"
>>
>>        FILES_${PN}-bcm43430-nvram = " \
>>          ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt \
>>          ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP6212.txt
>> \
>>          ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
>> \
>>        "
>>
>>        do_install() {
>>          ...
>>          ln -sf ${BCM43430_NVRAM_SYMLINK}
>>     ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
>>        }
>>
>>     And then in the machine config files of machines which need the MUR1DX
>>     firmware instead of the default, add:
>>
>>        BCM43430_NVRAM_SYMLINK = "brcmfmac43430-sdio.MUR1DX.txt"
>>
>>     However... note that currently the linux-firmware recipe is
>>     architecture independent (ie it won't be rebuilt if the target is
>>     changed). Adding a machine specific symlink is going to cause problems
>>     with that, so the above is still not a full solution.
>>
>>
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000178bfe05747cac16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 24 August 2018 at 11:43, Mike Looijmans <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic=
.nl</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I think this sh=
ould be solved in the driver actually. It probably &quot;knows&quot; which =
variant is there (or could be taught using devicetree or so).</blockquote><=
div><br></div><div>I agree. That&#39;s a longer term change that will take =
quite some time to filter through, if at all.</div><div><br></div><div>The =
device doesn&#39;t know which variant it is, but I&#39;m *hoping* to add a =
device tree attribute to cover this, but there has been resistance this in =
the past, so it may not be an easy change to get accepted.</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
On 24-08-18 11:04, Martin Jansa wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
One way to keep it allarch would be to package<br>
${nonarch_base_libdir}/firmwar<wbr>e/brcm/brcmfmac43430-sdio.<wbr>AP6212.tx=
t<br>
${nonarch_base_libdir}/firmwar<wbr>e/brcm/brcmfmac43430-sdio.<wbr>MUR1DX.tx=
t<br>
in 2 separate packages and handle<br>
${nonarch_base_libdir}/firmwar<wbr>e/brcm/brcmfmac43430-sdio.txt<br>
symlink with update-alternatives<br>
<br>
most MACHINEs won&#39;t install either of these packages and those which ne=
ed it will pull the right one (e.g. through=C2=A0MACHINE_EXTRA_RRECOMME<wbr=
>NDS).<br>
<br>
In worst case someone will try to install both packages and based on u-a pr=
iority one of them will win (use higher priority for the more common versio=
n).<br>
<br>
Cheers,<br>
<br></span><span class=3D"">
On Fri, Aug 24, 2018 at 4:53 AM Andre McCurdy &lt;<a href=3D"mailto:armccur=
dy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a> &lt;mailto:<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On Thu, Aug 23, 2018 at 1:15 AM, Ryan Harkin &lt;<a href=3D"m=
ailto:ryan.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a><=
br></span><div><div class=3D"h5">
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:ryan.harkin@linaro.org" target=
=3D"_blank">ryan.harkin@linaro.org</a><wbr>&gt;&gt; wrote:<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; So now the ln issue is resolved, I&#39;m not convi=
nced my MACHINEOVERRIDES is<br>
=C2=A0 =C2=A0 =C2=A0&gt; the correct approach. Does anyone have any feedbac=
k on how I can improve<br>
=C2=A0 =C2=A0 =C2=A0&gt; that?<br>
<br>
=C2=A0 =C2=A0 If you want to make a configurable symlink then perhaps the m=
ore usual<br>
=C2=A0 =C2=A0 approach would be to just use a variable in the linux-firmwar=
e recipe<br>
=C2=A0 =C2=A0 to weakly define a default target for the symlink. Machine co=
nfig<br>
=C2=A0 =C2=A0 files could then either do nothing (ie use the default) or pr=
ovide<br>
=C2=A0 =C2=A0 their own value. For example, in the linux-firmware recipe:<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 BCM43430_NVRAM_SYMLINK ?=3D &quot;brcmfmac43430-=
sdio.AP6212.txt<wbr>&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 FILES_${PN}-bcm43430-nvram =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmwar<wbr>e/brcm=
/brcmfmac43430-sdio.txt \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmwar<wbr>e/brcm=
/brcmfmac43430-sdio.<wbr>AP6212.txt \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ${nonarch_base_libdir}/firmwar<wbr>e/brcm=
/brcmfmac43430-sdio.<wbr>MUR1DX.txt \<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 &quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 do_install() {<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 ln -sf ${BCM43430_NVRAM_SYMLINK}<br>
=C2=A0 =C2=A0 ${D}${nonarch_base_libdir}/fir<wbr>mware/brcm/brcmfmac43430-s=
dio.<wbr>txt<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 }<br>
<br>
=C2=A0 =C2=A0 And then in the machine config files of machines which need t=
he MUR1DX<br>
=C2=A0 =C2=A0 firmware instead of the default, add:<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 BCM43430_NVRAM_SYMLINK =3D &quot;brcmfmac43430-s=
dio.MUR1DX.txt<wbr>&quot;<br>
<br>
=C2=A0 =C2=A0 However... note that currently the linux-firmware recipe is<b=
r>
=C2=A0 =C2=A0 architecture independent (ie it won&#39;t be rebuilt if the t=
arget is<br>
=C2=A0 =C2=A0 changed). Adding a machine specific symlink is going to cause=
 problems<br>
=C2=A0 =C2=A0 with that, so the above is still not a full solution.<br>
<br>
<br>
<br>
</div></div></blockquote><div class=3D"HOEnZb"><div class=3D"h5">
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--000000000000178bfe05747cac16--
