Return-Path: <winiston@futuraautomation.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFFD7317C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 04:19:42 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id x188so4089676pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 20:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:references:in-reply-to:subject:date
	:mime-version:importance;
	bh=X0FUoMDL9CF/LVFSZD2bL//8Ssg0wBRO5CaZM+ltAGg=;
	b=IYuqNhaYFOuwAS1ZrfPYJtK7LQ/iVlZlSxHlbvx+6/jiRGAlfTSIAsUiddyzebc2UK
	Z0UXtCOvUipkSjEEJtUcNHLgeYE7muRz6BV8JbINKAEx8lTF9xaGq1ECtMlNpgWrfj1o
	Nkbzl6TI6JeZs0fj0dtf7L19Yno6k60qegORmTQcYxrAMoM/fw/jw8muLEG42AM0vxNp
	Nr5yzF2XOddWA2xLDnJ8kauZ/RcB241HsztrTUZxyZIdqaSO4D1LtJ8vhsqqsqHXyixp
	Us12r3FfjynipkCQ9TBSLMJutoqkwEKd2WzOm9LQbLe8fMurV6oXMXQcw23ukedClDfO
	WHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:references:in-reply-to
	:subject:date:mime-version:importance;
	bh=X0FUoMDL9CF/LVFSZD2bL//8Ssg0wBRO5CaZM+ltAGg=;
	b=WmNxvQGtvn6UZhS8R6kM3hLtIzqhznuqAEQlMES2ommHNfEK/DsJEFEzGyGYXrPhNZ
	F+YDWOzW6MbMtTYr2jmRiLzvjiwV5xLKJoWHsc63pa5Td7b88kqFoOZ1bwkYYU4fEm70
	HUsGj2mtBlja5BWfXsljCFccNsxgopLVMFDj+t5Xrum/YMwIzQ9ZMVMI0iBjlFFOArsk
	mwuMf+CGnrVHiET3a17jg1aeELqQnVXGSnOZnhppYoe+8vSyvtytmruR3uMNA36stWDR
	WaMQcdRiA3DFlKbWCyq/rhWUf03nyKPWCSuMrvU6Exb6c1ULBmg2h8CsIXTjaclonMnZ
	QIYA==
X-Gm-Message-State: AD7BkJJoDrQXXjUDUBp/lv6RWzKzyx2uio8GjFWrx+gkVmo1ZwnvKYnWos0/l44DbmkhHA==
X-Received: by 10.98.64.202 with SMTP id f71mr8948115pfd.113.1457065183420;
	Thu, 03 Mar 2016 20:19:43 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	g78sm1526089pfg.35.2016.03.03.20.19.39
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 20:19:42 -0800 (PST)
Message-ID: <25A507B472054F9B9002D68314A7C388@RD3>
From: <winiston@futuraautomation.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <AB28D54196164B23BA942EBCF3204741@RD3>
	<20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
	<2CD39F82881F465AAD78DBB61BCA369E@RD3>
	<CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
	<E744C7D53BB7428AB0FD15C117627D11@RD3>
	<20160226093319.GA4329@ad.chargestorm.se>
	<38408F728A334E9F9A452EFD2448CC8D@RD3>
	<CAJTo0LbAoSeWVikqA4t9vXrbSnoiWwOWwLBLPtGPLwwr7E3w+g@mail.gmail.com>
In-Reply-To: <CAJTo0LbAoSeWVikqA4t9vXrbSnoiWwOWwLBLPtGPLwwr7E3w+g@mail.gmail.com>
Date: Fri, 4 Mar 2016 09:53:14 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Anders Darander <anders@chargestorm.se>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [linux-yocto] How to integrate third party application software to yocto image
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
X-List-Received-Date: Fri, 04 Mar 2016 04:19:45 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01C4_01D175FB.ABA7D880"

------=_NextPart_000_01C4_01D175FB.ABA7D880
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear Ross,=20

Backlist problem got solved by adding the lines which you mentioned in =
the previous mail. Now it gives the following error while building the =
image.

winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
Parsing recipes: 100% |########################| Time: 00:02:24
Parsing of 1125 .bb files complete (0 cached, 1125 parsed). 1569 =
targets, 139 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'gd' (but =
/home/winiston/poky/meta/recipes-qt/navit/navit_svn.bb DEPENDS on or =
otherwise requires it). Close matches:
  gdb
NOTE: Runtime target 'navit' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['navit', 'gd']
ERROR: Required build target 'qt4e-demo-image' has no buildable =
providers.
Missing or unbuildable dependency chain was: ['qt4e-demo-image', =
'navit', 'gd']

Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.
winiston@winiston-VirtualBox:~/poky/build$=20

I would be very thankful if you tell me the procedure to add =
=E2=80=9CNavit=E2=80=9D in the yocto build. My aim is to integrate =
=E2=80=9Cnavit=E2=80=9D in my image.

Thanking you...


Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291


From: Burton, Ross=20
Sent: Thursday, March 03, 2016 7:07 PM
To: winiston@futuraautomation.com=20
Cc: Anders Darander ; OE-core ; yocto texas ; Yocto layer=20
Subject: Re: [linux-yocto] [OE-core] How to integrate third party =
application software to yocto image


On 2 March 2016 at 08:52, <winiston@futuraautomation.com> wrote:

  ERROR: navit was skipped: Recipe is blacklisted: bluez5 conflicts with =
bluez4 and bluez5 is selected in DISTRO_FEATURES


Your distro is using bluez5 but navit is using the =
old/deprecated/unmaintained bluez4.

Ideally you create a new distro and change this, but for testing this in =
your local.conf should be sufficient:

DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "bluez5"


This will stop your distro from wanting to use bluez5 and will fall back =
to bluez4, at which point navit will build.

Ross

------=_NextPart_000_01C4_01D175FB.ABA7D880
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Dear Ross, </DIV>
<DIV>&nbsp;</DIV>
<DIV>Backlist problem got solved by adding the lines which you mentioned =
in the=20
previous mail. Now it gives the following error while building the =
image.</DIV>
<DIV>&nbsp;</DIV>
<DIV>winiston@winiston-VirtualBox:~/poky/build$ bitbake =
qt4e-demo-image</DIV>
<DIV>Parsing recipes: 100% |########################| Time: =
00:02:24</DIV>
<DIV>Parsing of 1125 .bb files complete (0 cached, 1125 parsed). 1569 =
targets,=20
139 skipped, 0 masked, 0 errors.</DIV>
<DIV>NOTE: Resolving any missing task queue dependencies</DIV>
<DIV>ERROR: Nothing PROVIDES 'gd' (but=20
/home/winiston/poky/meta/recipes-qt/navit/navit_svn.bb DEPENDS on or =
otherwise=20
requires it). Close matches:</DIV>
<DIV>&nbsp; gdb</DIV>
<DIV>NOTE: Runtime target 'navit' is unbuildable, removing...</DIV>
<DIV>Missing or unbuildable dependency chain was: ['navit', 'gd']</DIV>
<DIV>ERROR: Required build target 'qt4e-demo-image' has no buildable=20
providers.</DIV>
<DIV>Missing or unbuildable dependency chain was: ['qt4e-demo-image', =
'navit',=20
'gd']</DIV>
<DIV>&nbsp;</DIV>
<DIV>Summary: There were 2 ERROR messages shown, returning a non-zero =
exit=20
code.</DIV>
<DIV><A=20
href=3D"mailto:winiston@winiston-VirtualBox:~/poky/build$">winiston@winis=
ton-VirtualBox:~/poky/build$</A>=20
</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>I would be very thankful if you tell me the =
procedure=20
to add =E2=80=9CNavit=E2=80=9D in the yocto build. My aim is to =
integrate =E2=80=9Cnavit=E2=80=9D in my=20
image.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanking you...</DIV>
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
<DIV><B>Sent:</B> Thursday, March 03, 2016 7:07 PM</DIV>
<DIV><B>To:</B> <A title=3Dwiniston@futuraautomation.com=20
href=3D"mailto:winiston@futuraautomation.com">winiston@futuraautomation.c=
om</A>=20
</DIV>
<DIV><B>Cc:</B> <A title=3Danders@chargestorm.se=20
href=3D"mailto:anders@chargestorm.se">Anders Darander</A> ; <A=20
title=3Dopenembedded-core@lists.openembedded.org=20
href=3D"mailto:openembedded-core@lists.openembedded.org">OE-core</A> ; =
<A=20
title=3Dmeta-ti@yoctoproject.org =
href=3D"mailto:meta-ti@yoctoproject.org">yocto=20
texas</A> ; <A title=3Dlinux-yocto@yoctoproject.org=20
href=3D"mailto:linux-yocto@yoctoproject.org">Yocto layer</A> </DIV>
<DIV><B>Subject:</B> Re: [linux-yocto] [OE-core] How to integrate third =
party=20
application software to yocto image</DIV></DIV></DIV>
<DIV>&nbsp;</DIV></DIV>
<DIV=20
style=3D'FONT-SIZE: small; TEXT-DECORATION: none; FONT-FAMILY: =
"Calibri"; FONT-WEIGHT: normal; COLOR: #000000; FONT-STYLE: normal; =
DISPLAY: inline'>
<DIV dir=3Dltr>
<DIV class=3Dgmail_extra>
<DIV>&nbsp;</DIV>
<DIV class=3Dgmail_quote>On 2 March 2016 at 08:52, <SPAN =
dir=3Dltr>&lt;<A=20
href=3D"mailto:winiston@futuraautomation.com"=20
target=3D_blank>winiston@futuraautomation.com</A>&gt;</SPAN> wrote:<BR>
<BLOCKQUOTE class=3Dgmail_quote=20
style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: =
rgb(204,204,204) 1px solid"><SPAN>ERROR:=20
  navit was skipped: Recipe is blacklisted: bluez5 conflicts with bluez4 =
and=20
  bluez5 is selected in =
DISTRO_FEATURES<BR></SPAN></BLOCKQUOTE></DIV><BR>Your=20
distro is using bluez5 but navit is using the =
old/deprecated/unmaintained=20
bluez4.</DIV>
<DIV class=3Dgmail_extra>&nbsp;</DIV>
<DIV class=3Dgmail_extra>Ideally you create a new distro and change =
this, but for=20
testing this in your local.conf should be sufficient:</DIV>
<DIV class=3Dgmail_extra>&nbsp;</DIV>
<DIV class=3Dgmail_extra>DISTRO_FEATURES_BACKFILL_CONSIDERED =3D =
"bluez5"<BR></DIV>
<DIV class=3Dgmail_extra>&nbsp;</DIV>
<DIV class=3Dgmail_extra>This will stop your distro from wanting to use =
bluez5 and=20
will fall back to bluez4, at which point navit will build.</DIV>
<DIV class=3Dgmail_extra>&nbsp;</DIV>
<DIV =
class=3Dgmail_extra>Ross</DIV></DIV></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_01C4_01D175FB.ABA7D880--
