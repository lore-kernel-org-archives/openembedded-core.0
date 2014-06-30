Return-Path: <sadlife1990@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 85CB160438
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 07:22:23 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id il7so7082250vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 00:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=T9VIrCn/L1Bz/uDkoOFpEflz+/++FeXDjgefIZJkR9s=;
	b=ATER5XHrvQ0wmA3bKZjydXeTQKk/hNWs3uiYeE0vNE3mvQjHvynbDzGKTrqd5o4z0U
	CdR06E1QAPSTgJJKKPv6aDKRmfQaBCO1SdLOtAy01z71HUsvEB8pYDKn/mc72cy2WOEp
	ewf7PeZDMSR+nyAR6P5XceVh/bccxFqWffzX+AUp1Z3Q+NNOgjtHergtwv+f9QzRqJiH
	88iVK+CcXRH8f9hf7ggJ6rLZM59rR7/eiT+d582v004CHHFH40XvFV6oLXRVNP1DdB0j
	iXTzNQKUKxPwzd/TcHC0NmWZXgiKdVaa3SJbdMqAhqFCCDS2DXJmZAGkecPLYlxDpcnj
	114g==
MIME-Version: 1.0
X-Received: by 10.58.155.38 with SMTP id vt6mr37160255veb.3.1404112944655;
	Mon, 30 Jun 2014 00:22:24 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Mon, 30 Jun 2014 00:22:24 -0700 (PDT)
In-Reply-To: <53B0DD86.4030402@windriver.com>
References: <CAAHuHfzRzh2LhFoc0VrdA+MqJiUOVwv_tNe9y48nOrk13ERHug@mail.gmail.com>
	<53B0DD86.4030402@windriver.com>
Date: Mon, 30 Jun 2014 10:22:24 +0300
Message-ID: <CAAHuHfyOe09PgiP+tdJOzGJ71mb3Yxt=g0wHu1SWL_cwMh4ukw@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: "Wold, Saul" <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cape Manager
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
X-List-Received-Date: Mon, 30 Jun 2014 07:22:27 -0000
Content-Type: multipart/alternative; boundary=047d7b6721c04a737904fd0885cb

--047d7b6721c04a737904fd0885cb
Content-Type: text/plain; charset=UTF-8

Please tell me how to add this layer to Yocto ? I'm using Hob interface


2014-06-30 6:46 GMT+03:00 Robert Yang <liezhi.yang@windriver.com>:

>
> On 06/30/2014 12:24 AM, Life Life wrote:
>
>> Hello,
>>
>> I'm trying build yocto based linux, My hardware is beaglebone black I
>> successfull build system image. But I can't see capemanager. Beacuse my
>> lcd is
>> not work.
>>
>
> Hello,
>
> The cape manager is in meta-ti layer:
>
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-ti/
>
> Seems that we'd better add it to meta-yoco-bsp ?
>
> Add Saul in the loop.
>
>
>> Thanks
>>
>>
>>

--047d7b6721c04a737904fd0885cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please tell me how to add this layer to Yocto ? I&#39;m us=
ing Hob interface<br></div><div class=3D"gmail_extra"><br><br><div class=3D=
"gmail_quote">2014-06-30 6:46 GMT+03:00 Robert Yang <span dir=3D"ltr">&lt;<=
a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@w=
indriver.com</a>&gt;</span>:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><br>
On 06/30/2014 12:24 AM, Life Life wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello,<br>
<br>
I&#39;m trying build yocto based linux, My hardware is beaglebone black I<b=
r>
successfull build system image. But I can&#39;t see capemanager. Beacuse my=
 lcd is<br>
not work.<br>
</blockquote>
<br></div></div>
Hello,<br>
<br>
The cape manager is in meta-ti layer:<br>
<br>
<a href=3D"http://layers.openembedded.org/layerindex/branch/master/layer/me=
ta-ti/" target=3D"_blank">http://layers.openembedded.<u></u>org/layerindex/=
branch/master/<u></u>layer/meta-ti/</a><br>
<br>
Seems that we&#39;d better add it to meta-yoco-bsp ?<br>
<br>
Add Saul in the loop.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Thanks<br>
<br>
<br>
</blockquote>
</blockquote></div><br></div>

--047d7b6721c04a737904fd0885cb--
