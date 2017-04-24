Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9696B77A4F;
	Mon, 24 Apr 2017 12:27:15 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id g60so111734161qtd.3;
	Mon, 24 Apr 2017 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+hKqVGjXYtlnHq2NRWbFWwWB1DYMCSB36FF+9EyOhd0=;
	b=V5f6aLbU37/tQlmBpJEMzns5amNpjaYGN9GXpOjDC9vEuBTUdwePqqQXuI/m0X5i0m
	6fJmPWwKBVQIOndrZFZh6yOaBLklv3Xa2C/Od2k8ByjHGAAm5hEIXY8sPUZ9ZLTkwe5K
	xKcMd2mK4zTZLtCo+lBm3geSZfSXd7gAEfuZg9c8D9Ux+IDGnHQIlaQzbta8vJMIH2zo
	oKeF2574cd8c2J1CNy+Bajw9rsMuOcNovhVoAswR+KdoElSnrUoVp1+AcRdnYBj3CsDG
	g6kAWbFscgLBNTffVj5S62cD3qJjDt3fw7UQ2JFnxWS+/4luOU78yectyg/MbL1QuYZs
	myTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+hKqVGjXYtlnHq2NRWbFWwWB1DYMCSB36FF+9EyOhd0=;
	b=H8U788ciDOz+kTP7A0oJ4px5HV8e432vj28RBW5E/O2Y/EFkUpDLrvsatShwwKreJh
	1QQcfa7jx3Ix9B+p3xNSqnYeo/kHKw7YbbIbQsPYDUjwMcT2QsMNxqpjxOUvtcMyK5bH
	AX9ctgVrLVM6iE+DJ0fSScEDf+7vdylWhmjifJGpGBLwc9/QdfRzxN+XC2lhNsfhMqjz
	PiM3aAS2Gb5SMmQPmX6olqnFJd3exIiiZb3zGwnTMHJ7iQuIeO2vVzUrgI7Inz9QA4d0
	RoyFZaKahtAwfZRJkCuek8oR6fucb9orC3FHCEZcVwtY6rrNn2lXzN9sSNi8zsbV/GX1
	JR0Q==
X-Gm-Message-State: AN3rC/4bjDpt6eepdc1Ipz78nofYwknGDFFEaYZ9FznT8H1cPZ7sZZz4
	c1one7j3NAmRAq3aPD1m/n4908CdSQ==
X-Received: by 10.237.36.105 with SMTP id s38mr27229173qtc.185.1493036836436; 
	Mon, 24 Apr 2017 05:27:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Mon, 24 Apr 2017 05:27:15 -0700 (PDT)
In-Reply-To: <CAJTo0LZxsyHC7zjc7Z=wdS5_7NizgnCh=qkPM5munBkGWOmyGg@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
	<CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
	<CAJTo0LYc7nRX2zsPJkP3ZdmnenBxP=fCNUbc_H6L1vePDHjn_g@mail.gmail.com>
	<CAJTo0LZxsyHC7zjc7Z=wdS5_7NizgnCh=qkPM5munBkGWOmyGg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Apr 2017 08:27:15 -0400
Message-ID: <CADkTA4MeBY2+=A_jZCEgmp2x2co6Q09WM97RFFnyxz2QNWr0gg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 12:27:15 -0000
Content-Type: multipart/alternative; boundary=001a113d84ae45bf28054de8ba0e

--001a113d84ae45bf28054de8ba0e
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 24, 2017 at 7:11 AM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 24 April 2017 at 11:29, Burton, Ross <ross.burton@intel.com> wrote:
>
>> I'm getting that with 4.9.15 from meta-intel, should I be telling Saul to
>> update the BSP with some fixes you've made?
>>
>
> Or ideally telling myself to update meta-intel for the fixes that Saul has
> already merged...
>

ooops. I should read all the way to the bottom of the thread :D

Bruce


>
> Ross
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113d84ae45bf28054de8ba0e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 24, 2017 at 7:11 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D""=
>On 24 April 2017 at 11:29, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra=
">I&#39;m getting that with 4.9.15 from meta-intel, should I be telling Sau=
l to update the BSP with some fixes you&#39;ve made?</div></blockquote><div=
><br></div></span><div>Or ideally telling myself to update meta-intel for t=
he fixes that Saul has already merged...</div></div></div></div></blockquot=
e><div><br></div><div>ooops. I should read all the way to the bottom of the=
 thread :D</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><span class=3D"HOEnZb"><font color=3D"#888888"><div><br></=
div><div>Ross=C2=A0</div></font></span></div><br></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a113d84ae45bf28054de8ba0e--
