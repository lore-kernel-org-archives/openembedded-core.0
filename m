Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id BB6356FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 14:06:50 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id n59so85259387uan.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dHCDhxBPNm1M0+kyC6Pd5QAstnzVcmmsxmsvPxVkkdU=;
	b=wOPXpVI+I3UUxLojhwlqX0LNopX7mUcPwuPB34Zd/KzEHDO9/br8ow/FkzqGJd9Q29
	uJ/Ein46rwgT6bEhOht2JdHun/JsEa7AezEHX9B7CjV9fFB7zN6xsMENNVbfIYyNVwId
	OzEOwjrbAix3UcsX1B6X9cE1A+96/+PNPKIexFOQZN4AdoLsE3T68Zkpdh7OHIqhoVfV
	mJb9722wwNIoJCi1sMObrVLqvp/nxz6WBi5Tpjn/GbPxtFBpGhP5qvJ32jKXzcbFu24L
	um9LRD7kDE0NTdqeLPOiqT23YYmWYAc7mZ6GHEVsr63nX5X5f1BYdf3ARv3Qe3oz+1UD
	t8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dHCDhxBPNm1M0+kyC6Pd5QAstnzVcmmsxmsvPxVkkdU=;
	b=MTwmTtfI8yZ7bk5ZTYJs4PbZrpNvidGFHH72nfZLBc9d5soV/JVYS2ajSf2GJYYxOP
	Cyf/E0gz2hwVh2ngONYh3nSMbUm55d6vWxd8szYg6EJwN8VCm2vGEqh/LcWxX5Z4nAps
	lvb5ziP+fd1/dL52WIraTQ7lQ2DQV+f/9E8EMPz0HmF6JdatIOwK/Y9A3SUHswGRgeJB
	M3a9J+/YBiwX4mLTg9AIoVJiaEnIR5mVT6bCdVvKC6ync0FmYCeOySvlsmPXDmNLhAC8
	ws117CipIOjzmQwtG2zIS6D+Ybu7SE2vjVjY4TgRIkDcW2+9gTgydFN27As5Ny+QhQMM
	o47w==
X-Gm-Message-State: AE9vXwMPcQskihPJZr1udYqx+Id23EV658yB8L+8/pv2ywqfC4u0vpyYumjXvfBA1KUKQkhTMI4Wq8skZka85A==
X-Received: by 10.176.6.196 with SMTP id g62mr5079883uag.142.1472134010870;
	Thu, 25 Aug 2016 07:06:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.138 with HTTP; Thu, 25 Aug 2016 07:06:49 -0700 (PDT)
Received: by 10.176.64.138 with HTTP; Thu, 25 Aug 2016 07:06:49 -0700 (PDT)
In-Reply-To: <CAJTo0LbPUuXx=N=BsncbdceCVpR=ZerdzqkRpgn2T5uz38p8nQ@mail.gmail.com>
References: <20160820203609.5599-1-raj.khem@gmail.com>
	<CAJTo0LbPUuXx=N=BsncbdceCVpR=ZerdzqkRpgn2T5uz38p8nQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2016 07:06:49 -0700
Message-ID: <CAMKF1sp-ttXWxcjsVWT44p=a0AH5t6C8P2MYTLvES42D3hj41A@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] xserver-xf86-config: pre-load int10 and exa modules
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
X-List-Received-Date: Thu, 25 Aug 2016 14:06:51 -0000
Content-Type: multipart/alternative; boundary=94eb2c1243bac7a406053ae5e860

--94eb2c1243bac7a406053ae5e860
Content-Type: text/plain; charset=UTF-8

On Aug 25, 2016 6:45 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 20 August 2016 at 21:36, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> @@ -3,7 +3,7 @@ Section "Module"
>>      Load "fb"
>>      Load "shadow"
>>      Load "shadowfb"
>> +    Load "int10"
>>      Load "vbe"
>>      Load "vgahw"
>>  EndSection
>
>
> The log says "int10 and exa" but V2 has lost all exa references.  Is this
intentional?

Yes. It is not needed on qemu. I should have updated commit msg.
>
> Ross

--94eb2c1243bac7a406053ae5e860
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">On Aug 25, 2016 6:45 AM, &quot;Burton, Ross&quot; &lt;<a hre=
f=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 20 August 2016 at 21:36, Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; @@ -3,7 +3,7 @@ Section &quot;Module&quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0Load &quot;fb&quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0Load &quot;shadow&quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0Load &quot;shadowfb&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 Load &quot;int10&quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0Load &quot;vbe&quot;<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0Load &quot;vgahw&quot;<br>
&gt;&gt; =C2=A0EndSection<br>
&gt;<br>
&gt;<br>
&gt; The log says &quot;int10 and exa&quot; but V2 has lost all exa referen=
ces.=C2=A0 Is this intentional?</p>
<p dir=3D"ltr">Yes. It is not needed on qemu. I should have updated commit =
msg. <br>
&gt;<br>
&gt; Ross=C2=A0<br></p>

--94eb2c1243bac7a406053ae5e860--
