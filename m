Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id BABAD605BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 10:50:38 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id p6-v6so6544390ljc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J2q22MXgjrg0NnWXAxYQfsA0nerCgAoA1vXmcywqo1k=;
	b=PIpS4EKRSVaZMEJ5slGIkwYX+piWKrdFY7nz7WPWy04T2pxcUVd5bY7mC9KGA2guta
	ixv1eJZutypw5ScJtkVpVbp3zPNYazahGP9sB3iLUlXeLyscejQ3ch+OL5WBPG+xi2YA
	vQeeV9vEG48QZgDEBVHoZS3Z4AHyjKNSCV+SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J2q22MXgjrg0NnWXAxYQfsA0nerCgAoA1vXmcywqo1k=;
	b=ZeaRY/kv73WEeo74WamhzWzapQTXUYZM7fUr6KYBXTVyoPUciMieIcQbw9YCFToyV2
	7EHBd/+2AesZce8oXr1IsGCLVywHTfPY3G+OY/5+GyKMuyDW86ox4TC83p4qu1Ymx6m/
	9SfsKYHT2Uppr5WxeBfkMdgiciazYLJCy1LzH242142CoiwN9pTBmhst8plc6hS11Ye0
	DmNzQcToTkn1ZhaJc3se+8AWRAuuqDCgYcUzn1ceonYDgB7jYTrQI2COa/Ey9sghkhkI
	RuiwjpX/+zwG3mv+TCLRgaPfe8hV01GiIaNyNXTufyaQpDALuLVeDQbKIA403AH5xv+x
	jgdQ==
X-Gm-Message-State: APzg51DwHhFTfIf9Ljix/CvHar5i7cK9WHppKJl5tgZz8cVjq+vo3xS0
	Wvdojd3PaslIEnDF+DFnnocO9Diqn7RBu0jGLuOpmg==
X-Google-Smtp-Source: ANB0VdbYE0ch6SoopOs/QgBoKy0fR8rDZ81plAdyqCVXepoCDtPJOFwhHGG3S487kmbS9ofqSu4uiv5OxlQ898zhdV0=
X-Received: by 2002:a2e:9791:: with SMTP id y17-v6mr992131lji.41.1535107839047;
	Fri, 24 Aug 2018 03:50:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1bc7:0:0:0:0:0 with HTTP; Fri, 24 Aug 2018 03:50:38
	-0700 (PDT)
In-Reply-To: <CA+chaQeR5fARUq_y+SKU+YBg1psK-aV4efXbq7+aY+-FaLRcig@mail.gmail.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-h+BwzZg=gZtvVTneykKZb9k+UwgkR9Lt8jjo7Kvbj60Hw@mail.gmail.com>
	<CAJ86T=WT0G5Q9Q+Z2GQ27hnTfOjgZcUtYzNbs+fvc5mTDwrNew@mail.gmail.com>
	<CA+chaQeR5fARUq_y+SKU+YBg1psK-aV4efXbq7+aY+-FaLRcig@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Fri, 24 Aug 2018 11:50:38 +0100
Message-ID: <CAD0U-hJ+HkskMbuP7YCtdhEZ=B+wSgrR-QbCg3h4uP9EEozZQA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Fri, 24 Aug 2018 10:50:39 -0000
Content-Type: multipart/alternative; boundary="000000000000704e3a05742c2583"

--000000000000704e3a05742c2583
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On 24 August 2018 at 10:04, Martin Jansa <martin.jansa@gmail.com> wrote:

> One way to keep it allarch would be to package
> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP6212.txt
> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
> in 2 separate packages and handle
> ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
> symlink with update-alternatives
>
> most MACHINEs won't install either of these packages and those which need
> it will pull the right one (e.g. through MACHINE_EXTRA_RRECOMMENDS).
>
> In worst case someone will try to install both packages and based on u-a
> priority one of them will win (use higher priority for the more common
> version).
>

Thanks, this sounds like a good approach. I'll experiment with
update-alternatives as I haven't used it before and see if I can come up
with something sensible.


> Cheers,
>
> On Fri, Aug 24, 2018 at 4:53 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> On Thu, Aug 23, 2018 at 1:15 AM, Ryan Harkin <ryan.harkin@linaro.org>
>> wrote:
>> >
>> > So now the ln issue is resolved, I'm not convinced my MACHINEOVERRIDES
>> is
>> > the correct approach. Does anyone have any feedback on how I can improve
>> > that?
>>
>> If you want to make a configurable symlink then perhaps the more usual
>> approach would be to just use a variable in the linux-firmware recipe
>> to weakly define a default target for the symlink. Machine config
>> files could then either do nothing (ie use the default) or provide
>> their own value. For example, in the linux-firmware recipe:
>>
>>   BCM43430_NVRAM_SYMLINK ?= "brcmfmac43430-sdio.AP6212.txt"
>>
>>   FILES_${PN}-bcm43430-nvram = " \
>>     ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt \
>>     ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.AP6212.txt \
>>     ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt \
>>   "
>>
>>   do_install() {
>>     ...
>>     ln -sf ${BCM43430_NVRAM_SYMLINK}
>> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt
>>   }
>>
>> And then in the machine config files of machines which need the MUR1DX
>> firmware instead of the default, add:
>>
>>   BCM43430_NVRAM_SYMLINK = "brcmfmac43430-sdio.MUR1DX.txt"
>>
>> However... note that currently the linux-firmware recipe is
>> architecture independent (ie it won't be rebuilt if the target is
>> changed). Adding a machine specific symlink is going to cause problems
>> with that, so the above is still not a full solution.
>>
>
Thanks Andre. It looks like it would work, but unless you see a problem,
I'll look at Martin's idea first.

Cheers,
Ryan.

--000000000000704e3a05742c2583
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Martin,<br><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 24 August 2018 at 10:04, Martin Jansa <span dir=3D"ltr">&l=
t;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">One way to keep it allarch would be to package<span class=3D""><di=
v>${nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>sdio.AP6212.=
txt<br>${nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>sdio.MU=
R1DX.txt<br></div></span><div>in 2 separate packages and handle</div><div>$=
{nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>sdio.txt<br></d=
iv><div>symlink with update-alternatives</div><div><br></div><div>most MACH=
INEs won&#39;t install either of these packages and those which need it wil=
l pull the right one (e.g. through=C2=A0MACHINE_EXTRA_<wbr>RRECOMMENDS).</d=
iv><div><br></div><div>In worst case someone will try to install both packa=
ges and based on u-a priority one of them will win (use higher priority for=
 the more common version).</div></div></blockquote><div><br></div>Thanks, t=
his sounds like a good approach. I&#39;ll experiment with update-alternativ=
es as I haven&#39;t used it before and see if I can come up with something =
sensible.<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><di=
v><br></div><div>Cheers,</div></div><div class=3D"HOEnZb"><div class=3D"h5"=
><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Aug 24, 2018 at 4:=
53 AM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_b=
lank">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On Thu, Aug 23, 2018 at 1:15 AM, Ryan Harkin &lt;<a href=3D"mailto:ry=
an.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt; wrot=
e:<br>
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
=C2=A0 BCM43430_NVRAM_SYMLINK ?=3D &quot;brcmfmac43430-sdio.AP6212.<wbr>txt=
&quot;<br>
<br>
=C2=A0 FILES_${PN}-bcm43430-nvram =3D &quot; \<br>
=C2=A0 =C2=A0 ${nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>=
sdio.txt \<br>
=C2=A0 =C2=A0 ${nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>=
sdio.AP6212.txt \<br>
=C2=A0 =C2=A0 ${nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>=
sdio.MUR1DX.txt \<br>
=C2=A0 &quot;<br>
<br>
=C2=A0 do_install() {<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 ln -sf ${BCM43430_NVRAM_SYMLINK}<br>
${D}${nonarch_base_libdir}/<wbr>firmware/brcm/brcmfmac43430-<wbr>sdio.txt<b=
r>
=C2=A0 }<br>
<br>
And then in the machine config files of machines which need the MUR1DX<br>
firmware instead of the default, add:<br>
<br>
=C2=A0 BCM43430_NVRAM_SYMLINK =3D &quot;brcmfmac43430-sdio.MUR1DX.<wbr>txt&=
quot;<br>
<br>
However... note that currently the linux-firmware recipe is<br>
architecture independent (ie it won&#39;t be rebuilt if the target is<br>
changed). Adding a machine specific symlink is going to cause problems<br>
with that, so the above is still not a full solution.<br>
</blockquote></div>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Thanks =
Andre. It looks like it would work, but unless you see a problem, I&#39;ll =
look at Martin&#39;s idea first.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ryan.</d=
iv><div class=3D"gmail_extra"><br></div></div>

--000000000000704e3a05742c2583--
