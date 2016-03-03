Return-Path: <winiston@futuraautomation.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9273576420
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 10:55:54 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id fy10so12976068pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 02:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=futuraautomation-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:from:to:cc:subject:date:mime-version:importance
	:disposition-notification-to;
	bh=eIW7IQRG1t8EfXDjnxgarIxuBZV2QSjklmrUWlgYx9Q=;
	b=JqHNowE/jtpoOtnSnX4AZKaNRCaJCuzZ5JfoEJ63QOfsB4Cevfw6I4c8Lyhxuo2lKD
	3OBNwO5lx18KCEL/9HwoUoDwZuHgkOtlkVplFlUG+PP4gDa+VN+Ew1QqqwyaIBybOgFC
	yBqppPk9YigUIqAONAgUfFlOniTnn0pwjfJ78xSNzzrNx2NDk2t0nNBE/1J+L6qXeOWK
	IfViR7/eum/j6mfSVOZPcM1KioMdfUIpp6YHaoJuqv+dzwY18WSEgUQYWVrvniJixbJH
	RLIcJ4C8rbUInDq6Cef4VQ+6AE4QUK0zmCXRKdC4zRSf1MKsqQdS4++nAV6/ml6Ketb5
	7Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
	:importance:disposition-notification-to;
	bh=eIW7IQRG1t8EfXDjnxgarIxuBZV2QSjklmrUWlgYx9Q=;
	b=F+kpVaJT+8Uo/lGoQvtFB97lz7AkdqYSrfHI1MrWH+NB9lM3ofNI7DtWWizpmb8Ch6
	7o0VAEMOXI2FbJZBoP+8frsrpCvc3mdYrtGg8pu9TZ+T8OebjKdxm2xPlCV8Di7J/oBy
	7fdQU7JleOm8KF1bIDPMS+CAv4YU2f6LLIeX6oirGzJexp+saTPtdd2ahp9MqEGpmxhN
	FO1Q9lU/ofGs4NAaqMOqoxfyDWsbPSqyRISAf3LuXbonRqPZt77ImrqQxmNyq3qdqWIu
	5etjO0ff32Q5leVacI4bLgBEUHYDrQ4AuKmmhewKbI/43LWE1rFQ0KnpsvFeGt6kives
	TiYw==
X-Gm-Message-State: AD7BkJIEJIqZKZMje9myQZCZDBTtJYgMuI8xygpsZa5YmoYNq3L0KY5Hzr7/B2tHztIfKw==
X-Received: by 10.66.145.194 with SMTP id sw2mr2612645pab.69.1457002554710;
	Thu, 03 Mar 2016 02:55:54 -0800 (PST)
Received: from RD3 ([59.99.236.185]) by smtp.gmail.com with ESMTPSA id
	kw10sm59771935pab.0.2016.03.03.02.55.51
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Mar 2016 02:55:53 -0800 (PST)
Message-ID: <D6104635BEC047C6A117367EE5F6969D@RD3>
From: <winiston@futuraautomation.com>
To: "OpenEmbedded core" <openembedded-core@lists.openembedded.org>,
	"Yocto layer" <linux-yocto@yoctoproject.org>
Date: Thu, 3 Mar 2016 16:29:20 +0530
MIME-Version: 1.0
X-Priority: 1
X-MSMail-Priority: High
Importance: High
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: How to add recipes-navigation in core-image-base
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
X-List-Received-Date: Thu, 03 Mar 2016 10:55:54 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01EE_01D17569.D6C278A0"

------=_NextPart_000_01EE_01D17569.D6C278A0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I wanted to use =E2=80=9Crecipes-navigation=E2=80=9D in my yocto build =
(Poky ) . How do I add=E2=80=9D recipes-navigation =E2=80=9C to my =
image?

I have downloaded =E2=80=9C recipes-navigation =E2=80=9C from =
=E2=80=9Copen embedded project=E2=80=9D. Is it compatible with yocto =
build (poky ) ?

Note: Ultimately I wanted to integrate =E2=80=9CNavit=E2=80=9D to my =
image.           =E2=80=9Crecipes-navigation =E2=80=9C has =
=E2=80=9Cnavit=E2=80=9D.
How do I achieve this =E2=80=9CNavit=E2=80=9D integration in my image?

Target Image    : image-core-base
Target machine : AM437x-evm
Host Machine   :  Ubuntu 14.04=20
I am looking forward to your valuable reply. If you need any more =
details, Let me know please.

Regards,
Winiston.P
Futura Automation Pvt Ltd.

Ph :91-80-28375290 / 28375295
Fax :91-80-28375291

------=_NextPart_000_01EE_01D17569.D6C278A0
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: #000000">
<DIV>Hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I wanted to use =E2=80=9Crecipes-navigation=E2=80=9D in my yocto =
build (Poky ) . <FONT=20
color=3D#0000ff>How do I add=E2=80=9D recipes-navigation =E2=80=9C to my =
image?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>I have downloaded =E2=80=9C recipes-navigation =E2=80=9C from =
=E2=80=9Copen embedded project=E2=80=9D.=20
<FONT color=3D#0000ff>Is it compatible with yocto build (poky ) =
?</FONT></DIV>
<DIV><FONT color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT color=3D#0000ff>Note: Ultimately I wanted to integrate =
=E2=80=9CNavit=E2=80=9D to my=20
image.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
=E2=80=9Crecipes-navigation =E2=80=9C has =
=E2=80=9Cnavit=E2=80=9D.</FONT></DIV>
<DIV><FONT color=3D#0000ff>How do I achieve this =E2=80=9CNavit=E2=80=9D =
integration in my=20
image?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Target Image&nbsp;&nbsp;&nbsp; : image-core-base</DIV>
<DIV>Target machine : AM437x-evm</DIV>
<DIV>Host Machine&nbsp;&nbsp; :&nbsp; Ubuntu 14.04 </DIV>
<DIV>I am looking forward to your valuable reply. If you need any more =
details,=20
Let me know please.</DIV>
<DIV>&nbsp;</DIV>
<DIV=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Calibri'; COLOR: =
#000000">Regards,<BR>Winiston.P<BR>Futura=20
Automation Pvt Ltd.<BR><BR>Ph :91-80-28375290 / 28375295<BR>Fax=20
:91-80-28375291<BR></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_01EE_01D17569.D6C278A0--
