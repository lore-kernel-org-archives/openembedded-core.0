Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id B829861AD1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 18:12:50 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id jh10so1803759pab.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 11:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=kCDGSDu7UTnBZiNo0/w3TOWZcPt8p36eCitCtwsyHBE=;
	b=hTzl6Vbzc7AyzbZPjTje9lJU9aI1HiIKyaTnMG05L6/OYOO4+Iq3Jjajw9JHkdKj3X
	h0cWI1qmludk4mlqYlZ51dTJ9ki8FEfxJENwp1AfRKPHm8kdWPsDyfcDYdC+1bxl8rAd
	Fj/xcOd9/XrEXDtp95BfQI8tfbXzRAtBUCWSXt+jxotOin9TH/qvOFSGKabPBiEtjLED
	xUoF60SciuCsQtM1UzodTaMejFN1PPWhLHJUCvKztqD4DcSc7T/EXYVLamEDMwzI/Wa1
	mbO6xvOFvT8Ys4Sp8s9TKpjwLRRButxZB0wdL52AZHP2nsV1VEz1CLlcldbJ7U9HNKE2
	/KLA==
MIME-Version: 1.0
X-Received: by 10.66.119.35 with SMTP id kr3mr16959067pab.149.1375553570968;
	Sat, 03 Aug 2013 11:12:50 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Sat, 3 Aug 2013 11:12:50 -0700 (PDT)
In-Reply-To: <CAP9ODKrGeOrWx6v_E9cYBY_VvBn3BLNDWMaDBekhfFR3sr4+eg@mail.gmail.com>
References: <1375521469-1654-1-git-send-email-lpapp@kde.org>
	<CAP9ODKrGeOrWx6v_E9cYBY_VvBn3BLNDWMaDBekhfFR3sr4+eg@mail.gmail.com>
Date: Sat, 3 Aug 2013 19:12:50 +0100
X-Google-Sender-Auth: eZTyeLClonth2go5-GH_p4rPmYw
Message-ID: <CAOMwXhOopQVMRmCXVMnGPt_ZrcL8aS0mxwmUyGgGAvLH7533Cw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQnG4GbL/Lj3tLnKWqre17sZP/wOsga7LIVW5ha/qyAVRZ+XBrecQbwXCuRx4qYIzped7RW+
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Sat, 03 Aug 2013 18:12:50 -0000
Content-Type: multipart/alternative; boundary=047d7b0721caf7ac0c04e30f0598

--047d7b0721caf7ac0c04e30f0598
Content-Type: text/plain; charset=ISO-8859-1

It is updating the latest version while also preserving the option of using
an earlier one.


On Sat, Aug 3, 2013 at 6:53 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Sat, Aug 3, 2013 at 6:17 AM, Laszlo Papp <lpapp@kde.org> wrote:
> > Signed-off-by: Laszlo Papp <lpapp@kde.org>
>
> Please reword the commit. You're not updating it but adding 2013.07
> version.
>
> Personally I'd prefer to update for 2013.07 and drop previous
> releases. To support the update, I've been using this in meta-fsl-arm
> since rc1 ;-)
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

--047d7b0721caf7ac0c04e30f0598
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It is updating the latest version while also preserving th=
e option of using an earlier one.</div><div class=3D"gmail_extra"><br><br><=
div class=3D"gmail_quote">On Sat, Aug 3, 2013 at 6:53 PM, Otavio Salvador <=
span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_=
blank">otavio@ossystems.com.br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Sat, Aug 3, 2013 at 6:17 AM, Laszlo Papp =
&lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:<br>
&gt; Signed-off-by: Laszlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@=
kde.org</a>&gt;<br>
<br>
Please reword the commit. You&#39;re not updating it but adding 2013.07 ver=
sion.<br>
<br>
Personally I&#39;d prefer to update for 2013.07 and drop previous<br>
releases. To support the update, I&#39;ve been using this in meta-fsl-arm<b=
r>
since rc1 ;-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S=
. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</font></span></blockquote></div><br></div>

--047d7b0721caf7ac0c04e30f0598--
