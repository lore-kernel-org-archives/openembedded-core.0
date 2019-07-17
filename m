Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 27D0B6C1C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 08:19:19 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id r6so18254878qtt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 01:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Qs98acaTVD3jTtcWQCnzzdQDMHlUb7h+9uzCVznBImo=;
	b=XtlK8EG9bCzAwZQ0K2VUK9KIIzjq+qYjFdLthktB3MG8XLNEdWN/Ykig4DL+NiPQiu
	ZBuXCSVpe7JjewtTB1gSSw1LIoVscmAsOcZxUYSADPtMJsaKAzaF2Nlhe2C/rLCihc/S
	9MuYOOX1lWyfHSZlq2FMiSt+L0ba+G/fo6H3vzOnuWVfmFriiSDsfZAdfkx5KRb2soeT
	06Mp5rChxFimQT48+CNon/g2ksorj4Dz2iN0JWdd6YEwoJc5GUwPRVG8yJiAZWV5WcHQ
	MfUcTmd6/hCt7+4ruTLN2wIVzSlno7t2Chm5/dOe/Ey4RziS2cCQtKVs9FSHkAKDUzce
	HAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Qs98acaTVD3jTtcWQCnzzdQDMHlUb7h+9uzCVznBImo=;
	b=NlWtUFDwMarGR60cULcVryTM/K8rMl4mf1+a5YKbp4bEY76ZpkPFTvMNkeINS1O0n4
	JiuDmRbWgoG/jJE+kEbV4jSSxfjg9btY9ixy23PU06EZiow4eDwfXO1lG7vOE0JIirN3
	T7ysv+cdg3+jeegmFIi//y/cmZ41LoV/zgdppxwlUpDPEyG3tLN4qCVILycB5uoQmHUK
	Ir83d7PC9zaDaKS6UvFbtMaVbhsIaZVJBlJf3U9sqHbziqY3cGWM0V2texOGfmTdqt1y
	7AztkWWtfx3onnnlVK3E9AO9z7v6mq1XH2fVGpEGlwMQKllFph1N/Stqi3JVWuwvRG3i
	TGzA==
X-Gm-Message-State: APjAAAVTAcBQQRBpH2GT6sQFYVYVS2EwB18i9RbEiTMvaooeAUcDipk9
	l0gxCsEEalft7WgehWzsZuqQ/47xJpTElDRCazqDcfMJ
X-Google-Smtp-Source: APXvYqx87swXERF++CH6qA2kP2WLha0yIgZrcbqZcVwnYzVzDPQRqVS9N/05M6DfOtzxTQmfmtl/yaMcv1fnUp5GFK8=
X-Received: by 2002:ad4:4112:: with SMTP id i18mr27762615qvp.175.1563351560587;
	Wed, 17 Jul 2019 01:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190715102016.114264-1-kai.kang@windriver.com>
	<CAMKF1sq8rpdxdH2Yr8bHze06-R3hsmLTDdSLkX-TEj4utY2VYQ@mail.gmail.com>
	<0f664af2-cea3-aaa2-2a7c-74c43d58ced4@windriver.com>
	<CAMKF1spSOgaLYgy6U3r=wXNPcMA+qyy1Oigpob42xFAOFugbvA@mail.gmail.com>
	<8164ebb7-8a4f-a7ce-74de-e4adb60a6022@windriver.com>
	<CAMKF1sp=r+x8+DyGPAmJUfAMn6qtSzjquP+iaEwjtz1SkYXf7A@mail.gmail.com>
	<4d14f4a4-c3a2-ed2d-e8dc-fd6de1963124@windriver.com>
In-Reply-To: <4d14f4a4-c3a2-ed2d-e8dc-fd6de1963124@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Jul 2019 01:18:54 -0700
Message-ID: <CAMKF1srFgjj8r2PqzPKmsi2NToOkd60TknrcPWP4-pvRLLu58A@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: set incomptible with tune mips
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
X-List-Received-Date: Wed, 17 Jul 2019 08:19:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

oh COMPATIBLE_HOST_mipsarch threw me off. do we need to use the
override when the specific check
is done on right hand side?

On Tue, Jul 16, 2019 at 11:51 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/7/17 =E4=B8=8B=E5=8D=882:20, Khem Raj wrote:
>
> Right so we should only disable the tunes which don=E2=80=99t have clz an=
d not all mips as this patch is doing
>
> The patch only set COMPATILE_HOST to null  only when default tune is 'mip=
s' which causes webkitgtk fails.
> And for other conditions, it doesn't block to build that the COMPATILE_HO=
ST is 'mips.*-linux'.  Such as the
> default bsps qemumips(default tune mips32r2) and qemumips64(mips64r2), it=
 doesn't affect them.
>
> Kai
>
>
>
> On Tue, Jul 16, 2019 at 10:42 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>>
>> On 2019/7/16 =E4=B8=8B=E5=8D=8811:33, Khem Raj wrote:
>>
>>
>>
>> On Tue, Jul 16, 2019 at 2:33 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>>>
>>> On 2019/7/16 =E4=B8=8B=E5=8D=883:19, Khem Raj wrote:
>>> > On Mon, Jul 15, 2019 at 3:21 AM <kai.kang@windriver.com> wrote:
>>> >> From: Kai Kang <kai.kang@windriver.com>
>>> >>
>>> >> It fails to compile webkit when default tune is 'mips':
>>> >>
>>> >> | .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24.2-r0/webkitgtk-2.=
24.2
>>> >> | /Source/JavaScriptCore/assembler/MacroAssemblerMIPS.h:418:23:
>>> >> | error: static assertion failed: CLZ opcode is not available for th=
is ISA
>>> >>
>>> >> So don't build webkit when default tune is mips.
>>> >>
>>> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> >> ---
>>> >>   meta/recipes-sato/webkit/webkitgtk_2.24.2.bb | 2 ++
>>> >>   1 file changed, 2 insertions(+)
>>> >>
>>> >> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb b/meta/rec=
ipes-sato/webkit/webkitgtk_2.24.2.bb
>>> >> index 056334fff5..891266b220 100644
>>> >> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>>> >> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
>>> >> @@ -43,6 +43,8 @@ DEPENDS =3D "zlib libsoup-2.4 curl libxml2 cairo l=
ibxslt libxt libidn libgcrypt \
>>> >>             gettext-native glib-2.0 glib-2.0-native libtasn1 \
>>> >>             "
>>> >>
>>> >> +COMPATIBLE_HOST_mipsarch =3D "${@bb.utils.contains('DEFAULTTUNE', '=
mips', 'null', 'mips.*-linux', d)}"
>>> >> +
>>> > this disables is for all kind of mips. I think thats a broad set, it
>>> > would be best to narrow it to what you saw it failing for
>>> > e.g. it should work for mips32 and mips64 so maybe mips1 is what you
>>> > want to disable for
>>>
>>> I tested with qemumips and qemumips64. When set
>>>
>>> DEFAULTTUNE=3D "mips"
>>
>>
>> How about using mips32 and mips64 for default tune and retest
>>
>>
>> It build webkitgtk successfully on qemumips and qemumips64 with default =
tune mips32 and mips64.
>>
>>
>>>
>>>
>>> It fails with the error.
>>>
>>> Regards,
>>> Kai
>>>
>>> >
>>> >
>>> >>   PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11'=
, 'x11', 'wayland' ,d)} \
>>> >>                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl=
', 'webgl opengl', '' ,d)} \
>>> >>                      enchant \
>>> >> --
>>> >> 2.20.0
>>> >>
>>> >> --
>>> >> _______________________________________________
>>> >> Openembedded-core mailing list
>>> >> Openembedded-core@lists.openembedded.org
>>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>> --
>>> Kai Kang
>>>
>>
>> --
>> Kai Kang
>
>
> --
> Kai Kang

