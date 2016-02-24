Return-Path: <winiston@futuraautomation.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id A4D6F77262
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 12:46:30 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id e127so12530625pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 04:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:subject:date:mime-version:content-type
	:importance:disposition-notification-to;
	bh=16CbCtHUNmwptaLvZmf07zP4SbHx1kYq0GfzU3XNx8c=;
	b=R5ez7/4TL2y4NIi53u9aN3Xcb2BwHXJjlI3GmuLbyWemyiZmRslPenXDnAk/lT/+W5
	lZWfpNXyd/Sr97ncIPqC0o/fbzEwYkVL1Gxd2F+eD2lSdPkjSrKGHn6cQbSLrIwZI7ve
	WE4VGGBq9EsBNOBtc+P4AfLBx/ole1tGGGL+v2FexWkqiEW3mbQOBkXisf5tEI/kB5g5
	mhf8P+hqdnqqFaiUDv2zxb6lzauuuohwnKOS5ip6WQtrZKLChP5o1yea9QIvyX0TGps5
	BzUTLrKgx7jBaJL3YyJ3w1yl41uZWpJAamhTA2wts5ZhXmV/zhtV1pxseLK2Pb9pgUIs
	RSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
	:content-type:importance:disposition-notification-to;
	bh=16CbCtHUNmwptaLvZmf07zP4SbHx1kYq0GfzU3XNx8c=;
	b=dF22G2Roi3euUSvnQbpOyV8Tdq+nAuXb3lavbzAlSYjZQIZ73FnsKK8/pJw8h7APXX
	TcRQ3JXYvnAr5yRiqebOJRPPXSCvgtHKx9gbEQDbYZ56Bo49bOhvDMVBtZbPPH7KLmHb
	Gs+YewnhK0ZtKuRdJ1KG/H8ZSktTWjf7crWGQtakj9RpOEq8wrRuxI3fhWZ8rV+xw3hl
	ZnBjcR0OqY+dvqS+rj4fKV9PfvK7Gnc89wkuWdt+kH8W61INX0utRtVY6gIvThqSzn3u
	pG2hyojURZ+VoQnubCHi8gZkuK6ybCIuKaaqhbAK9PYw1q4/rfXJg4EPM0WDP61q5zUx
	trMQ==
X-Gm-Message-State: AG10YOSae1SApL534dBUsVYg036Bb4YTn9B805rVqGDUjbiPh510QRu7K3CgWzMqGTPTPA==
X-Received: by 10.98.40.4 with SMTP id o4mr7925696pfo.76.1456317991071;
	Wed, 24 Feb 2016 04:46:31 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	b63sm4978943pfj.25.2016.02.24.04.46.27
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 04:46:29 -0800 (PST)
Message-ID: <AB28D54196164B23BA942EBCF3204741@RD3>
From: <winiston@futuraautomation.com>
To: "OpenEmbedded core" <openembedded-core@lists.openembedded.org>,
	"Yocto layer" <linux-yocto@yoctoproject.org>
Date: Wed, 24 Feb 2016 18:20:14 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: How to integrate third party application software to yocto image
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
X-List-Received-Date: Wed, 24 Feb 2016 12:46:31 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00D3_01D16F30.01A774C0"

------=_NextPart_000_00D3_01D16F30.01A774C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I can build yocto image for arm based product like AM437x-evm using =
yocto project. I want to add third party software(Navit) to my image.

How can I add the third party software to my image ?. Can you provide me =
the steps to integrate third party software with yocto image ?

Note: Navit is a navigation software and it supports arm based product =
like AM437x.=20

Host system: Ubuntu 14.04
Target system : AM437x-evm


Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_00D3_01D16F30.01A774C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I can build yocto image for arm based product like AM437x-evm using =
yocto=20
project. I want to add third party software(Navit) to my image.</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>How can I add the third party software to my =
image ?.=20
Can you provide me the steps to integrate third party software with =
yocto image=20
?</FONT></DIV>
<DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Note: Navit is a navigation software and it =
supports=20
arm based product like AM437x.</FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Host system: Ubuntu 14.04</DIV>
<DIV>Target system : AM437x-evm</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_00D3_01D16F30.01A774C0--
