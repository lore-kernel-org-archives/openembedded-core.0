Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 136B86093E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 17:46:35 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id b6so20203773pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 10:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=o95JkgHukZ3kDjcyJNoRN4bLtzG4Pc0hcD8M9sF9fuk=;
	b=sPUQrcjoyoJV6Lcf+lh0UFyJ65/y8BfVAnYkaQsJMRkiIWFUiwy2qqQ98HMI5b22FH
	3rnQMh7/+8NMCmUK8YkJXVxK58jkChGl4PgUuzk+2zDfq6RiKbxiRoka3/G1uj+Vdiuc
	eMXHUjNZ4W09Q6j7k+duzOS/ur5bBnnSyYh68ipvE8j6EC94GArMUSpCL1hrloXGqBny
	fuafs2ZI5zdTsrsArG+DyZOi3rwZTRmQypwJw6yet+6b9vJMY8LH8CwAxfyicFUB3oAW
	ZWlxP0XmoQHdZjlc0nAW7NOx43jZcKINmOWdGFJwFWFV1NhHzEsGAkspW7gfktBrq/NM
	MLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=o95JkgHukZ3kDjcyJNoRN4bLtzG4Pc0hcD8M9sF9fuk=;
	b=VUa7tp5j4ffvAYFWRJ+cCar0ATl6E0hNXUWV9+lEbxI7nEu6qHR8m/RbcbWicUebB/
	32YmAdQ56ygtvmcjI9JbQsPRbmBtEuMjtNW2RmIF1qwiwckZ4cgtwbl14TjeS/oeZChc
	8Q6kzWO2Hf8P1pkwsjzaaiGwBaETr73F2E49L2YCXbc+wCknUy513HHoiK1Fyqn9yAeI
	qfiP4tqHRPQrp/SjW4sKRUcbnF2FbizuTxmS67fg/e/FVI+vKcriqqSI8o9jWTYlr57y
	G66sRNL1ES3bv/QAdpCAdGSflUskMzcAhRxgqE6WeR3058fDhH3+iCMbizjUDpMTmXAu
	eJPA==
X-Gm-Message-State: AMCzsaX7vzIwVuisM+E3jbR9klw/A3V+w8vGEhjkgv4dCLIUrRMz2SKS
	QjJzLIVdkGchwK0oCCdxAz2iiB/rZ8nhFZaTLjI=
X-Google-Smtp-Source: ABhQp+RO3RTTjZgb9KzxKjMMIXalr1asR8VDi6/esOiLsSSxtRAKB+Kj4cprKX5PFi9eAA5/mTLoWtbnoh60IytZqXE=
X-Received: by 10.84.184.12 with SMTP id l12mr5774415plc.404.1508867197225;
	Tue, 24 Oct 2017 10:46:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 24 Oct 2017 10:46:06 -0700 (PDT)
In-Reply-To: <SN1PR13MB02720FA5FB44DB41FCBD8EE792470@SN1PR13MB0272.namprd13.prod.outlook.com>
References: <SN1PR13MB027295287B467702CA7967E692470@SN1PR13MB0272.namprd13.prod.outlook.com>
	<CAMKF1sokNFnWVOuOTu31VJQ=Y-cjNON_cO9Ch1Ca8YfeVrNSiw@mail.gmail.com>
	<SN1PR13MB02720FA5FB44DB41FCBD8EE792470@SN1PR13MB0272.namprd13.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Oct 2017 10:46:06 -0700
Message-ID: <CAMKF1soogaY_w=yHc722fN7CtXJ3bSzb0kh_3S1ej5h_aUybbA@mail.gmail.com>
To: "Lee, Yong" <Yong.Lee@johnsonoutdoors.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 4.9 and Morty
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
X-List-Received-Date: Tue, 24 Oct 2017 17:46:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2017 at 10:33 AM, Lee, Yong
<Yong.Lee@johnsonoutdoors.com> wrote:
> Thanks Raj for the input. Attached the logs. Please take a look.
> The .diff file is based on the toolchain-linaro.inc file shipped with TI'=
s SDK [1].
>

Your changes look fine.

> I will try to configure the SDK to use the internal toolchain and see if =
I can decouple myself from the external toolchain to simplify things.
>

you might have to bug your SDK provider for gcc 4.9 build issue


> Adam
>
> [1] http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dmeta-ar=
ago-distro/conf/distro/include/toolchain-linaro.inc;h=3D20a65174f269c1e1a59=
84c5476a2ab4e5dfc42b5;hb=3Drefs/heads/morty
>
> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Tuesday, October 24, 2017 12:26 PM
> To: Lee, Yong <Yong.Lee@johnsonoutdoors.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] GCC 4.9 and Morty
>
> *EXTERNAL EMAIL*
>
>
> On Tue, Oct 24, 2017 at 6:56 AM, Lee, Yong <Yong.Lee@johnsonoutdoors.com>=
 wrote:
>> I have a bunch of apps that require an old version of GCC (4.9 or less).
>>
>> There are a few versions of GCC available in my Morty based SDK.
>>
>>
>>
>> build@6e35408e8fa5:~/tisdk/build$ bitbake-layers show-recipes gcc
>>
>> WARNING: No recipes available for:
>>
>>
>> /home/build/tisdk/sources/meta-openamp/recipes-bsp/device-tree/device-
>> tree-generation_%.bbappend
>>
>> Parsing recipes..done.
>>
>> =3D=3D=3D Matching recipes: =3D=3D=3D
>>
>> gcc:
>>
>>   meta-linaro-toolchain linaro-4.9
>>
>>   meta-linaro-toolchain linaro-6.2
>>
>>   meta                 6.2.0
>>
>>   meta                 5.4.0
>>
>>   meta-linaro-toolchain linaro-5.3
>>
>>   meta-linaro-toolchain linaro-5.2
>>
>>
>>
>> Immediately I have set the PREFERRED_VERSION of gcc to 4.9 but bitbake
>> does not go beyond configuration.
>>
>>
>
> Please post the error and change you did to enable 4.9
>
>>
>> I believe 4.9 + morty combination has not been tested at all. I
>> understand my apps need to get updated, but that=E2=80=99s not my call.
>
> OE-core and yocto releases by default do not test toolchains coming from =
other layers so essentially 6.2 is whats the default compiler with morty an=
d thats what is most tested however, others might have tested the other com=
binations with morty,

