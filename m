Return-Path: <winiston@futuraautomation.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2C24B77215
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 05:41:05 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id fy10so45073500pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 21:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:content-type:importance:disposition-notification-to;
	bh=BJE0DpYvB4X3VRbrM/NIvKuFXFebWW7CUZLS5DLrmmQ=;
	b=1BsiWIHmTnagNA2uozzFtrpK54JcFnhlQpGiPGn16phUbch7f6fAne5db3g7STcSpO
	CkGzo0r0FS5ehpHRthPED9rXTVCvUqcslnLEUw1cxN4A7X3Fq8XilQDWBgN8GeQytHBv
	+Dx3kLH65+84+5WtKwNyLsNypdhXpPYjn8nWES20Q/pu821F+FmFl8Uq3Su7WvcPXSvK
	X2nwdyFjn0YzIeiSqDBM30HY+GkscmILolYAwKYCACY8zEcHYD7Hkj/hl0vE1O9yV1i/
	eHJNhUFgwHkHYC4ngJQLnkLkpAYukxAydrUu+AY8KjMsf+INWy1w59d4KQeSGYSPEoEL
	RoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:content-type:importance
	:disposition-notification-to;
	bh=BJE0DpYvB4X3VRbrM/NIvKuFXFebWW7CUZLS5DLrmmQ=;
	b=D8XyoiMdw/WOT6X1WuMOQAFDg9IRf1bpHGfVZWpLxw3hRPOgVw9MbEf7kojZneRD3A
	oXLmRD1s4pLoTiDevxYnpgzElUtWZBGn+RaDsKTlEGKXNxKZDooqzFjOf+Md7ZkQ4B0F
	ub06Qoqflg3uRAFIcLlnxW2JNV51IdXG45Rjb0ZiznDpx5H1MnW6D7vt8+qTmvmksFp+
	TD+wcKFvqfp5l6S9494v4Tq0JAIxuWhzhYtdc/yUElj8TQ9lYacGPHbXb6KSvctXfIzE
	4kDVfO2VQ0GeiOdPlFkBWRDcwJ8edrlIV41TRqO4Wwy+UcBb4q1Jt50GP/3cPSgmYHGL
	QKLQ==
X-Gm-Message-State: AG10YOSUz/fo5eZXP06M5nQXLgKHMs6pvJc7UHj45VmoikRfjP9WRih9hn0yEredODZ3Fw==
X-Received: by 10.66.228.231 with SMTP id sl7mr35181946pac.30.1456465266420;
	Thu, 25 Feb 2016 21:41:06 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	r65sm16004574pfa.27.2016.02.25.21.41.02
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 21:41:04 -0800 (PST)
Message-ID: <E744C7D53BB7428AB0FD15C117627D11@RD3>
From: <winiston@futuraautomation.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <AB28D54196164B23BA942EBCF3204741@RD3>
	<20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
	<2CD39F82881F465AAD78DBB61BCA369E@RD3>
	<CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
In-Reply-To: <CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
Date: Fri, 26 Feb 2016 11:14:38 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OpenEmbedded core <openembedded-core@lists.openembedded.org>
Subject: Re: How to integrate third party application software to yocto image
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
X-List-Received-Date: Fri, 26 Feb 2016 05:41:06 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00F4_01D17086.E1C381F0"

------=_NextPart_000_00F4_01D17086.E1C381F0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

I copied "recipes-navigation" folder from meta-oe (Open embedded build =
tree) to "/poky/meta "

I have appended  in =E2=80=9Cconf/local.conf=E2=80=9D  as given below

IMAGE_INSTALL_append =3D " navit"

While creating the image, it spits out the following error,

winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
Loading cache: 100% |##########################| ETA:  00:00:00
Loaded 1510 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'navit' (but =
/home/winiston/poky/meta/recipes-qt/images/qt4e-demo-image.bb RDEPENDS =
on or otherwise requires it)
ERROR: navit was skipped: Recipe is blacklisted: bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES
NOTE: Runtime target 'navit' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['navit']
ERROR: Required build target 'qt4e-demo-image' has no buildable =
providers.
Missing or unbuildable dependency chain was: ['qt4e-demo-image', =
'navit']

Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.
winiston@winiston-VirtualBox:~/poky/build$=20

Should I make any other setting to add the =E2=80=9Cnavit=E2=80=9D =
recipe to my image?  Is this the correct method of copying  =
"recipes-navigation" folder  to "/poky/meta "  ?
Kindly help me to resolve this error.


Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291


From: Burton, Ross=20
Sent: Thursday, February 25, 2016 6:22 PM
To: winiston@futuraautomation.com=20
Cc: Maxin B. John ; yocto texas ; Yocto layer ; OpenEmbedded core=20
Subject: Re: [OE-core] How to integrate third party application software =
to yocto image


On 25 February 2016 at 12:51, <winiston@futuraautomation.com> wrote:

  IMAGE_INSTALL_append =3D " navit_svn"


The recipe is called navit, _svn is the version.  Just append " navit".

Ross

------=_NextPart_000_00F4_01D17086.E1C381F0
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Hi Ross,</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT style=3D'face: "Times' New roman?>I copied =
"recipes-navigation" folder=20
from meta-oe (Open embedded build tree) to "/poky/meta "</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>I have appended&nbsp; in =E2=80=9Cconf/local.conf=E2=80=9D&nbsp; as =
given below<BR></DIV>
<DIV>IMAGE_INSTALL_append =3D " navit"</DIV>
<DIV>&nbsp;</DIV>
<DIV>While creating the image, it spits out the following error,</DIV>
<DIV>&nbsp;</DIV>
<DIV>winiston@winiston-VirtualBox:~/poky/build$ bitbake =
qt4e-demo-image</DIV>
<DIV>Loading cache: 100% |##########################| ETA:&nbsp; =
00:00:00</DIV>
<DIV>Loaded 1510 entries from dependency cache.</DIV>
<DIV>NOTE: Resolving any missing task queue dependencies</DIV>
<DIV>ERROR: Nothing RPROVIDES 'navit' (but=20
/home/winiston/poky/meta/recipes-qt/images/qt4e-demo-image.bb RDEPENDS =
on or=20
otherwise requires it)</DIV>
<DIV>ERROR: navit was skipped: Recipe is blacklisted: bluez5 conflicts =
with=20
bluez4 and bluez5 is selected in DISTRO_FEATURES</DIV>
<DIV>NOTE: Runtime target 'navit' is unbuildable, removing...</DIV>
<DIV>Missing or unbuildable dependency chain was: ['navit']</DIV>
<DIV>ERROR: Required build target 'qt4e-demo-image' has no buildable=20
providers.</DIV>
<DIV>Missing or unbuildable dependency chain was: ['qt4e-demo-image',=20
'navit']</DIV>
<DIV>&nbsp;</DIV>
<DIV>Summary: There were 2 ERROR messages shown, returning a non-zero =
exit=20
code.</DIV>
<DIV><A=20
href=3D"mailto:winiston@winiston-VirtualBox:~/poky/build$">winiston@winis=
ton-VirtualBox:~/poky/build$</A>=20
</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Should I make any other setting to add the =
=E2=80=9Cnavit=E2=80=9D=20
recipe to my image?&nbsp; Is this the correct method of copying&nbsp; =
<FONT=20
face=3D"Times New Roman">"recipes-navigation" folder&nbsp; to =
"/poky/meta "&nbsp;=20
?</FONT></FONT></DIV>
<DIV><FONT color=3D#0000ff><FONT face=3D"Times New Roman">Kindly help me =
to resolve=20
this error.</FONT></FONT></DIV>
<DIV>&nbsp;</DIV>
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
<DIV><B>Sent:</B> Thursday, February 25, 2016 6:22 PM</DIV>
<DIV><B>To:</B> <A title=3Dwiniston@futuraautomation.com=20
href=3D"mailto:winiston@futuraautomation.com">winiston@futuraautomation.c=
om</A>=20
</DIV>
<DIV><B>Cc:</B> <A title=3Dmaxin.john@intel.com=20
href=3D"mailto:maxin.john@intel.com">Maxin B. John</A> ; <A=20
title=3Dmeta-ti@yoctoproject.org =
href=3D"mailto:meta-ti@yoctoproject.org">yocto=20
texas</A> ; <A title=3Dlinux-yocto@yoctoproject.org=20
href=3D"mailto:linux-yocto@yoctoproject.org">Yocto layer</A> ; <A=20
title=3Dopenembedded-core@lists.openembedded.org=20
href=3D"mailto:openembedded-core@lists.openembedded.org">OpenEmbedded =
core</A>=20
</DIV>
<DIV><B>Subject:</B> Re: [OE-core] How to integrate third party =
application=20
software to yocto image</DIV></DIV></DIV>
<DIV>&nbsp;</DIV></DIV>
<DIV=20
style=3D'FONT-SIZE: small; TEXT-DECORATION: none; FONT-FAMILY: =
"Calibri"; FONT-WEIGHT: normal; COLOR: #000000; FONT-STYLE: normal; =
DISPLAY: inline'>
<DIV dir=3Dltr>
<DIV class=3Dgmail_extra>
<DIV>&nbsp;</DIV>
<DIV class=3Dgmail_quote>On 25 February 2016 at 12:51, <SPAN =
dir=3Dltr>&lt;<A=20
href=3D"mailto:winiston@futuraautomation.com"=20
target=3D_blank>winiston@futuraautomation.com</A>&gt;</SPAN> wrote:<BR>
<BLOCKQUOTE class=3Dgmail_quote=20
style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc =
1px solid">
  <DIV id=3D:dxh class=3Da3s style=3D"OVERFLOW: =
hidden">IMAGE_INSTALL_append =3D "=20
  navit_svn"<BR></DIV></BLOCKQUOTE></DIV><BR>The recipe is called navit, =
_svn is=20
the version.&nbsp; Just append " navit".</DIV>
<DIV class=3Dgmail_extra>&nbsp;</DIV>
<DIV =
class=3Dgmail_extra>Ross</DIV></DIV></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_00F4_01D17086.E1C381F0--
