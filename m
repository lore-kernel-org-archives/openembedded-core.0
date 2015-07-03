Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 14DD675D50
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 10:26:37 +0000 (UTC)
Received: by qgat90 with SMTP id t90so25492961qga.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 03:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fF+mari+fiI/ybPkhLAo4WDooExlARQMfn7LYRsyCRE=;
	b=PJ8/P6+g9Voc1DZ9nrWIc8A2YJa0rNxQspSp3xu2VkvQscgLYK/GgZ3SyGk/WN5dCC
	PVyhxYwFSvJEginvm0ORmV5x40ztV0uYb+RETrlAH4DeaFlZ/XuOjS1g6ucrWr6sf5yL
	UjVj/JEU3ff4UjDGGAqP4UxmVeiGRbJ8kXNcnODIHcXsIEeG8hS5RmvheNkIgkl7Z1KH
	gG8dgvsqGbW+s6v2pOMUzpsaf2RK6Czyq/t2jo0nU/78vdE389CodeB3NHqquzkkjipD
	4G5c7/90LdMuE0fjnOY8y+RfsbhdKrfK5OcrQtLZ/ITRB5bSzpmBiwaS+JOBvEIlXAJu
	G3SQ==
X-Gm-Message-State: ALoCoQmN45Z8kh6B0D9SrGfpJ69bcVAjgtOqw/Jjc9WvnFYa26efyBf5RQrbGf3M9UgVfAKqMfB8
X-Received: by 10.140.133.199 with SMTP id 190mr52550343qhf.17.1435919197944; 
	Fri, 03 Jul 2015 03:26:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 3 Jul 2015 03:26:18 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAF11F7479@ALA-MBB.corp.ad.wrs.com>
References: <1435737141-31961-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0LacneDbjFJR+uPQs__cqx+FVwXEuyCXe5zVui+Gu9tbpg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11F6D32@ALA-MBB.corp.ad.wrs.com>
	<20150703090405.GA2436@jama>
	<CAJTo0Lbdq1=ZgX5VQApdvhDfX1uF3MkT0sD_MXfQr3coN18t1A@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11F7414@ALA-MBB.corp.ad.wrs.com>
	<CAJTo0LZDcTfLFE8wsCU04m0LR1mNOb-Q1zjO2d8hRTQfTmvuHw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11F7479@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Jul 2015 11:26:18 +0100
Message-ID: <CAJTo0LaCmxm_wytA4uRVxor7U2n2SfLErATERJ3g09ampPrpow@mail.gmail.com>
To: "Huang, Jie (Wind River)" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorg-proto-common: allow the empty package
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
X-List-Received-Date: Fri, 03 Jul 2015 10:26:39 -0000
Content-Type: multipart/alternative; boundary=001a11353390b853040519f5fd73

--001a11353390b853040519f5fd73
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3 July 2015 at 11:16, Huang, Jie (Wind River) <jackie.huang@windriver.co=
m
> wrote:

> Thanks for the explanation. I think you=E2=80=99re suggesting that we do =
nothing
> for such issue or
>
> just tell the user to use PN-dev for this kind of packages, right?
>
>
Correct.

Ross

--001a11353390b853040519f5fd73
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 July 2015 at 11:16, Huang, Jie (Wind River) <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:jackie.huang@windriver.com" target=3D"_blank">jackie.huang@wi=
ndriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p clas=
s=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&q=
uot;,&quot;sans-serif&quot;;color:#1f497d">Thanks for the explanation. I th=
ink you=E2=80=99re suggesting that we do nothing for such issue or
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">just tell the user to use=
 PN-dev for this kind of packages, right?<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>Correct.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11353390b853040519f5fd73--
