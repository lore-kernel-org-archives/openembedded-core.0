Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id EF29871DC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 15:13:44 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id v23so49916998qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 07:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=pOAG9+3I8ntc1WSrKqv8bX/Mqj5yi9pxmtm3ak7TLJg=;
	b=EaAnVMmuIIToR5MmTU6TE0y9uNfEmns5TXEZ6hV8SzHdv2OUDG92m5NaIRwYbb8Oxm
	XK8CSho47avMpkLn4v9ljZMaZuvALGszWscWYrEYXiHsoNwZjF6UYpx1xklJBtitkPxc
	A0c+96qsCMcjVgeewz6LZ86flA0GvRWFOguxe0oRKudBMfiM/6u8kE/6uexPEPsHfSIT
	Al+Ku09nZ8b2xCe5eR5q1AGUj3EAOPM/lp9WJs9YFXkSibsjIxFvb48OLnu61hRZsw0Y
	6GjoTgySOI/R9bPf3zlMuyW6GPthMNpcakghqIYel2GiYTpi2R6S2ld/PYPYn8MY5lBA
	rvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=pOAG9+3I8ntc1WSrKqv8bX/Mqj5yi9pxmtm3ak7TLJg=;
	b=I2v50ndNM6Cp21ZphnJg1V+9oMuGDWc5jwTkECAjFIFTyKKQJvv9WBa6jUzk3DxDf5
	/k6Y0AKnkppiDfke4wAKY56O6MXa/nejGPmyN4AtEpIbDfz5xxzUal2aT2XDRet6u8i1
	VU4pkQqn6F21AUx9GaP6tcAozZTkPHFvIPhvcY/0543VGhAQ5K41BUAHZBVRwHL8HfDW
	BUyvql/TKpW2okAuf86ZC+jHHUZvR3932TYNWKu6IFbOH/BvPxv4YY7ey6Znt0WY0X29
	hTUC5Jh12m0PhKFrN7JxAG/bE0zC1q4az9gl58n18ySc36EFv2Z+K37Pag/CfHUtAVn9
	apfw==
X-Gm-Message-State: AIkVDXJNrUObXbDJTkYqQm0KaB5piQ7U4Cnw89vICuEVh+gHbAt4S3ic7Qumm0R69b6MXTiqJPLlBUszdId6eaGo
X-Received: by 10.200.39.212 with SMTP id x20mr17349224qtx.109.1484320425006; 
	Fri, 13 Jan 2017 07:13:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 13 Jan 2017 07:13:24 -0800 (PST)
In-Reply-To: <CAJTo0Lb=d7-mZLh=NqQRyXknytV1tm+ivi1QTR9W5vEbdiU2DQ@mail.gmail.com>
References: <cover.1484312322.git.ross.burton@intel.com>
	<CAJTo0Lb=d7-mZLh=NqQRyXknytV1tm+ivi1QTR9W5vEbdiU2DQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jan 2017 15:13:24 +0000
Message-ID: <CAJTo0LZD5QG0bmm19YZpUuDETmY14WzuWXWV_=GXKL3iyWPoPw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 15:13:46 -0000
Content-Type: multipart/alternative; boundary=001a1135b542aa65290545fb47b0

--001a1135b542aa65290545fb47b0
Content-Type: text/plain; charset=UTF-8

On 13 January 2017 at 15:09, Burton, Ross <ross.burton@intel.com> wrote:

> On 13 January 2017 at 13:00, Ross Burton <ross.burton@intel.com> wrote:
>
>> Patrick Ohly (8):
>>       recipes: anonymous functions with priorities
>>       build.py: add preceedtask() API
>>       runqueue.py: alternative rm_work scheduler
>>       gcc-source.inc: cleanly disable do_rm_work
>>       rm_work_and_downloads.bbclass: more aggressively minimize disk usage
>>       rm_work.bbclass: clean up sooner
>>       rootfs-postcommands.bbclass: sort passwd entries
>>       insane.bbclass: print license text as part of QA message
>>
>
> This was retracted so please drop these too!


Overly concise: the rm_work and bitbake changes have a v2 and are pending
bitbake patches, so all but the last two need to be dropped. The branch is
updated.

Ross

--001a1135b542aa65290545fb47b0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2017 at 15:09, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_quot=
e"><span class=3D"">On 13 January 2017 at 13:00, Ross Burton <span dir=3D"l=
tr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.bur=
ton@intel.com</a>&gt;</span> wrote:<br></span><span class=3D""><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div id=3D"m_-8517850053356554643:2t4" class=3D"m_-85178=
50053356554643a3s m_-8517850053356554643aXjCH m_-8517850053356554643m15997e=
aab7b53979">Patrick Ohly (8):<br>
=C2=A0 =C2=A0 =C2=A0 recipes: anonymous functions with priorities<br>
=C2=A0 =C2=A0 =C2=A0 build.py: add preceedtask() API<br>
=C2=A0 =C2=A0 =C2=A0 runqueue.py: alternative rm_work scheduler<br>
=C2=A0 =C2=A0 =C2=A0 gcc-source.inc: cleanly disable do_rm_work<br>
=C2=A0 =C2=A0 =C2=A0 rm_work_and_downloads.bbclass: more aggressively minim=
ize disk usage<br>
=C2=A0 =C2=A0 =C2=A0 rm_work.bbclass: clean up sooner<br>
=C2=A0 =C2=A0 =C2=A0 rootfs-postcommands.bbclass: sort passwd entries<br>
=C2=A0 =C2=A0 =C2=A0 insane.bbclass: print license text as part of QA messa=
ge</div></blockquote></span></div><br>This was retracted so please drop the=
se too!</blockquote></div><br>Overly concise: the rm_work and bitbake chang=
es have a v2 and are pending bitbake patches, so all but the last two need =
to be dropped. The branch is updated.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1135b542aa65290545fb47b0--
