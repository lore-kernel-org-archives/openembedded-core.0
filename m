Return-Path: <winiston@futuraautomation.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2820E7704E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 09:54:16 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id 184so52983253pff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:importance:disposition-notification-to;
	bh=qNO112TjTPReR22nm7NjD2QRi73TZZ5xIsBrsJD2M0U=;
	b=ploIjEDWHZPblZRtSPc2yBrs/tOelotSsJnLMSrfvrJ444DJqXmc+NUPWxpgkVUWXy
	ZbCg1zoukJAuCM+yqyHCgEj1omfW9n4Pgh8UaoT3bHIPnnryctt9Juqjz8OVu3WPSQRC
	FO3kU7O/03Dvxln/8GKTm8ZFNYxJN1l9Ytt3gBE8mozXjhVSduEcA0A5rFAirnahDSq2
	mMgQnb8/ircVHnyFcw+X1L78o2RSlGy9tkG4QPmOdoldj1BrAjjoIrBrZPw517lUMEme
	bb9q+eDehrY7urs3io3rDStGbztCbBwALcvpt+5UzqXEFpitdrzn/uIYk+0pts/vbORA
	PZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:importance:disposition-notification-to;
	bh=qNO112TjTPReR22nm7NjD2QRi73TZZ5xIsBrsJD2M0U=;
	b=RY/ft/incGIBeZJ646nslR7uk8p7zHyhc2/VRXIdPrVD2pFhaX3SCJgWGYkW1+xdLa
	953MbzR8ft0vkIdhGsgsSY7vM6RBuZl/9n9c61TX9sP7JzBWKxYJB5hWVp80Ew1Wh5Ia
	DBJ4FxhkPxoS4HRHuBb4cZxoYqU9FM7zMKVc0qsTgz8ElkestUXLSs6sVcWzgI/dZGL8
	BUlNRSwrphfKEO8jaajRHBP6jxAEYRfDt2UJt9EaPGkaK3qvbGXj0OGs27d0nq2Bf2/1
	WgBERQp8xd8oaZ8tChQgs0Y6kbVl3jBN7xLA1BBw9TJTj95Y89t5bK6mveaFwD83BH9X
	Hskw==
X-Gm-Message-State: AD7BkJIwvelw5mbWgjAFw/Pnw4bEegAAf37LPvmmLQd8Vnov6O4VkjClOCMIp6dkMJ4sdg==
X-Received: by 10.98.42.4 with SMTP id q4mr3478469pfq.23.1460022857416;
	Thu, 07 Apr 2016 02:54:17 -0700 (PDT)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	wh9sm10878494pab.8.2016.04.07.02.54.13
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Apr 2016 02:54:16 -0700 (PDT)
Message-ID: <BF87E273B05A4CE7A838874136B2D7CA@RD3>
From: <winiston@futuraautomation.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <188BD465D20643E496811D07CF7FDF9C@RD3>
	<CAJTo0LYhW-_8nC5DEi+uHnpE7TicR+rmrJQ+m5_0b_jdq--sSw@mail.gmail.com>
In-Reply-To: <CAJTo0LYhW-_8nC5DEi+uHnpE7TicR+rmrJQ+m5_0b_jdq--sSw@mail.gmail.com>
Date: Thu, 7 Apr 2016 15:27:04 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OpenEmbedded core <openembedded-core@lists.openembedded.org>
Subject: Re: Problem in Third party Software (Navit) integration
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
X-List-Received-Date: Thu, 07 Apr 2016 09:54:17 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0082_01D190E1.F0B12E80"

------=_NextPart_000_0082_01D190E1.F0B12E80
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Ross,

Your question: You're not really giving much away by just saying "not =
running",
Answer : kernel is generated using =E2=80=9Cbitbake =
core-image-base=E2=80=9D command.  I extracted my kernel image to SD =
card and used it in my am437x-eVm board, It boots and end up with =
command prompt. But No GUI related to =E2=80=9CNavit=E2=80=9D . I wanted =
to get the =E2=80=9CNavit=E2=80=9D GUI. So I assume that it is not =
running.

Your question:  you may need to install more than just the navit =
package.
Answer : I don=E2=80=99t have idea, what are the package I need to =
install and how to install? I have added  IMAGE_INSTALL_append =3D " =
navit"  in /build/conf/local.conf  .... Do you have any procedure to =
install additional packages?

Your question:    Have a look at the recipe and you'll see that it =
generates lots of packages,
Answer :  when I run =E2=80=9Cbitbake core-image-base=E2=80=9D , No =
packages are generated it seems. But when I run =E2=80=9Cbitbake  =
qt4e-demo-image=E2=80=9D , Lot of packages are generated related to =
=E2=80=9Cnavit=E2=80=9D in  =
/home/winiston/poky/build/tmp/sysroots/am437x-evm/pkgdata/runtime.
What are the packages I need to add ? How do I add those packages in the =
image?=20

Thanks in advance...

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291


From: Burton, Ross=20
Sent: Thursday, April 07, 2016 2:28 PM
To: winiston@futuraautomation.com=20
Cc: OpenEmbedded core ; yocto texas ; Yocto layer=20
Subject: Re: [OE-core] Problem in Third party Software (Navit) =
integration


On 7 April 2016 at 08:41, <winiston@futuraautomation.com> wrote:

  Kernel is successfully generated. But =E2=80=9CNavit=E2=80=9D is not =
running in my kernel. How do I integrate/add =E2=80=9CNavit=E2=80=9D to =
my kernel ? should I make any other configuration and package?

You're not really giving much away by just saying "not running", but you =
may need to install more than just the navit package.  Have a look at =
the recipe and you'll see that it generates lots of packages, you may =
need to install some more or even all of those.

Ross

------=_NextPart_000_0082_01D190E1.F0B12E80
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear Ross,</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Your question:</FONT> You're not really =
giving much=20
away by just saying "not running",</DIV>
<DIV><FONT color=3D#0000ff>Answer :</FONT> kernel is generated using =
=E2=80=9Cbitbake=20
core-image-base=E2=80=9D command.&nbsp; I extracted my kernel image to =
SD card and used=20
it in my am437x-eVm board, It boots and end up with command prompt. But =
No GUI=20
related to =E2=80=9CNavit=E2=80=9D . I wanted to get the =
=E2=80=9CNavit=E2=80=9D GUI. So I assume that it is not=20
running.</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Your question:</FONT>&nbsp; you may need to =
install=20
more than just the navit package.</DIV>
<DIV><FONT color=3D#0000ff>Answer :</FONT> I don=E2=80=99t have idea, =
what are the package=20
I need to install and how to install? I have added&nbsp; <FONT=20
color=3D#0000ff>IMAGE_INSTALL_append =3D " navit"</FONT>&nbsp; in=20
/build/conf/local.conf&nbsp; .... Do you have any procedure to install=20
additional packages?</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Your question:</FONT>&nbsp;&nbsp;&nbsp; Have =
a look at=20
the recipe and you'll see that it generates lots of packages,</DIV>
<DIV><FONT color=3D#0000ff>Answer :</FONT>&nbsp; when I run =
=E2=80=9Cbitbake=20
core-image-base=E2=80=9D , No packages are generated it seems. But when =
I run=20
=E2=80=9Cbitbake&nbsp; qt4e-demo-image=E2=80=9D , Lot of packages are =
generated related to=20
=E2=80=9Cnavit=E2=80=9D in<FONT face=3D"Times New Roman">&nbsp; <SPAN =
style=3D"FONT-FAMILY: "><FONT=20
color=3D#000000>/home/winiston/poky/build/tmp/sysroots/am437x-evm/pkgdata=
/runtime.</FONT></SPAN></FONT></DIV>
<DIV><FONT face=3D"Times New Roman"><SPAN style=3D"FONT-FAMILY: "><FONT=20
color=3D#0000ff>What are the packages I need to add ? How do I add those =
packages=20
in the image? </FONT></SPAN></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks in advance...</DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV>
<DIV=20
style=3D'FONT-SIZE: small; TEXT-DECORATION: none; FONT-FAMILY: =
"Calibri"; FONT-WEIGHT: normal; COLOR: #000000; FONT-STYLE: normal; =
DISPLAY: inline'>
<DIV style=3D"FONT: 10pt tahoma">
<DIV>&nbsp;</DIV>
<DIV style=3D"BACKGROUND: #f5f5f5">
<DIV style=3D"font-color: black"><B>From:</B> <A =
title=3Dross.burton@intel.com=20
href=3D"mailto:ross.burton@intel.com">Burton, Ross</A> </DIV>
<DIV><B>Sent:</B> Thursday, April 07, 2016 2:28 PM</DIV>
<DIV><B>To:</B> <A title=3Dwiniston@futuraautomation.com=20
href=3D"mailto:winiston@futuraautomation.com">winiston@futuraautomation.c=
om</A>=20
</DIV>
<DIV><B>Cc:</B> <A title=3Dopenembedded-core@lists.openembedded.org=20
href=3D"mailto:openembedded-core@lists.openembedded.org">OpenEmbedded =
core</A> ;=20
<A title=3Dmeta-ti@yoctoproject.org =
href=3D"mailto:meta-ti@yoctoproject.org">yocto=20
texas</A> ; <A title=3Dlinux-yocto@yoctoproject.org=20
href=3D"mailto:linux-yocto@yoctoproject.org">Yocto layer</A> </DIV>
<DIV><B>Subject:</B> Re: [OE-core] Problem in Third party Software =
(Navit)=20
integration</DIV></DIV></DIV>
<DIV>&nbsp;</DIV></DIV>
<DIV=20
style=3D'FONT-SIZE: small; TEXT-DECORATION: none; FONT-FAMILY: =
"Calibri"; FONT-WEIGHT: normal; COLOR: #000000; FONT-STYLE: normal; =
DISPLAY: inline'>
<DIV dir=3Dltr>
<DIV class=3Dgmail_extra>
<DIV>&nbsp;</DIV>
<DIV class=3Dgmail_quote>On 7 April 2016 at 08:41, <SPAN =
dir=3Dltr>&lt;<A=20
href=3D"mailto:winiston@futuraautomation.com"=20
target=3D_blank>winiston@futuraautomation.com</A>&gt;</SPAN> wrote:<BR>
<BLOCKQUOTE class=3Dgmail_quote=20
style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc =
1px solid">
  <DIV><FONT color=3D#0000ff>Kernel is successfully generated. But =
=E2=80=9CNavit=E2=80=9D is not=20
  running in my kernel. How do I integrate/add =E2=80=9CNavit=E2=80=9D =
to my kernel ? should I=20
  make any other configuration and package?</FONT></DIV>
  <DIV></DIV></BLOCKQUOTE></DIV><BR>You're not really giving much away =
by just=20
saying "not running", but you may need to install more than just the =
navit=20
package.&nbsp; Have a look at the recipe and you'll see that it =
generates lots=20
of packages, you may need to install some more or even all of =
those.</DIV>
<DIV class=3Dgmail_extra>&nbsp;</DIV>
<DIV =
class=3Dgmail_extra>Ross</DIV></DIV></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_0082_01D190E1.F0B12E80--
