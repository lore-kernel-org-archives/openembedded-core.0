Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 67A9860C02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 10:33:22 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k4so6027852qaq.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 02:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5uOpypdabgEoSCpXAmHutApsXYtcvNFe0rEOR8MCYd4=;
	b=nvAxcuk7hFjwOEPYlRkqsLQuE/vJEdcBWnNdp0qzcvZjSkA5ZpKoQPWXoA8L4/03RT
	Rh5yeHuWoF+8MbTYlgI+fvKeVPR+g92PLYK2JRpeFnucwhTELosmKJHQeCvFgXLIHmsP
	smTOXjIPFBdAzS+pBr97UY10OhoxwBuYOT9TAK9wRF7FkQGHSFNEw3P11DYmj8nCI4CJ
	2cXy/RLQdRfmVoebcm9VfvO2U2ppX3lb04nNGrGy30pBSHxqR7UHr7nX0DIrDR3AbtJ2
	X3wSX96E57EqznF5ZP/1ZE9N4NaxxmQ3fc4cG2G9Yh1yW3jTvfVRXKg+giunqnZqRwoK
	tDJw==
X-Received: by 10.140.48.82 with SMTP id n76mr13684024qga.82.1393238003512;
	Mon, 24 Feb 2014 02:33:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Mon, 24 Feb 2014 02:33:03 -0800 (PST)
In-Reply-To: <CAMCfZKFxAb22jjAQbkzA_UfjxjDK__i7KbnQ_vwNZN+BxGJkHA@mail.gmail.com>
References: <1392745755-20315-1-git-send-email-diego.sueiro@gmail.com>
	<CAMKF1srUcG1euTY2kzKroG5k5h7R-nUd7aFhqk2dVvcu-k8BrA@mail.gmail.com>
	<CAMCfZKGFs8-AEyFx4PCCu-t5c_fOLHi4ceJD+txO3woO4Mb0ZQ@mail.gmail.com>
	<CAMKF1sr-cAni3FXQHMmiEY_tapzPVfcY2h6DGPTZ-zY5F7+Rjw@mail.gmail.com>
	<CAMCfZKFxAb22jjAQbkzA_UfjxjDK__i7KbnQ_vwNZN+BxGJkHA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 24 Feb 2014 07:33:03 -0300
Message-ID: <CAMCfZKFTSApvWqUpETLN1G3zYXF-dhNEoO+MKNTsu2n1iGFeGA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Mon, 24 Feb 2014 10:33:28 -0000
Content-Type: multipart/alternative; boundary=001a1135250249c41e04f324801a

--001a1135250249c41e04f324801a
Content-Type: text/plain; charset=ISO-8859-1

Khem,

On Tue, Feb 18, 2014 at 4:16 PM, Diego Sueiro <diego.sueiro@gmail.com>wrote:

> I think is a choice.
> This is what the header says:
>
>
> /****************************************************************************
> **
> ** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
> ** Contact: http://www.qt-project.org/legal
> **
> ** This file is part of the Qt Designer of the Qt Toolkit.
> **
> ** $QT_BEGIN_LICENSE:LGPL$
> ** Commercial License Usage
> ** Licensees holding valid commercial Qt licenses may use this file in
> ** accordance with the commercial license agreement provided with the
> ** Software or, alternatively, in accordance with the terms contained in
> ** a written agreement between you and Digia.  For licensing terms and
> ** conditions see http://qt.digia.com/licensing.  For further information
> ** use the contact form at http://qt.digia.com/contact-us.
> **
> ** GNU Lesser General Public License Usage
> ** Alternatively, this file may be used under the terms of the GNU Lesser
> ** General Public License version 2.1 as published by the Free Software
> ** Foundation and appearing in the file LICENSE.LGPL included in the
> ** packaging of this file.  Please review the following information to
> ** ensure the GNU Lesser General Public License version 2.1 requirements
> ** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
> **
> ** In addition, as a special exception, Digia gives you certain additional
> ** rights.  These rights are described in the Digia Qt LGPL Exception
> ** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
> **
> ** GNU General Public License Usage
> ** Alternatively, this file may be used under the terms of the GNU
> ** General Public License version 3.0 as published by the Free Software
> ** Foundation and appearing in the file LICENSE.GPL included in the
> ** packaging of this file.  Please review the following information to
> ** ensure the GNU General Public License version 3.0 requirements will be
> ** met: http://www.gnu.org/copyleft/gpl.html.
> **
> **
> ** $QT_END_LICENSE$
>

What is the verdict? Should I have to add any notes on commit message?



Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a1135250249c41e04f324801a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Khem,<br></div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Tue, Feb 18, 2014 at 4:16 PM, Diego Sueiro <span dir=3D"ltr">&lt;<a href=
=3D"mailto:diego.sueiro@gmail.com" target=3D"_blank">diego.sueiro@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"gmail_extra">I think is a choice.</div><div =
class=3D"gmail_extra">

This is what the header says:</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra"><div class=3D"gmail_extra">/***********************=
*****************************************************</div>

<div class=3D"gmail_extra">**</div><div class=3D"gmail_extra">** Copyright =
(C) 2013 Digia Plc and/or its subsidiary(-ies).</div><div class=3D"gmail_ex=
tra">** Contact: <a href=3D"http://www.qt-project.org/legal" target=3D"_bla=
nk">http://www.qt-project.org/legal</a></div>



<div class=3D"gmail_extra">**</div><div class=3D"gmail_extra">** This file =
is part of the Qt Designer of the Qt Toolkit.</div><div class=3D"gmail_extr=
a">**</div><div class=3D"gmail_extra">** $QT_BEGIN_LICENSE:LGPL$</div><div =
class=3D"gmail_extra">



** Commercial License Usage</div><div class=3D"gmail_extra">** Licensees ho=
lding valid commercial Qt licenses may use this file in</div><div class=3D"=
gmail_extra">** accordance with the commercial license agreement provided w=
ith the</div>



<div class=3D"gmail_extra">** Software or, alternatively, in accordance wit=
h the terms contained in</div><div class=3D"gmail_extra">** a written agree=
ment between you and Digia. =A0For licensing terms and</div><div class=3D"g=
mail_extra">



** conditions see <a href=3D"http://qt.digia.com/licensing" target=3D"_blan=
k">http://qt.digia.com/licensing</a>. =A0For further information</div><div =
class=3D"gmail_extra">** use the contact form at <a href=3D"http://qt.digia=
.com/contact-us" target=3D"_blank">http://qt.digia.com/contact-us</a>.</div=
>



<div class=3D"gmail_extra">**</div><div class=3D"gmail_extra">** GNU Lesser=
 General Public License Usage</div><div class=3D"gmail_extra">** Alternativ=
ely, this file may be used under the terms of the GNU Lesser</div><div clas=
s=3D"gmail_extra">



** General Public License version 2.1 as published by the Free Software</di=
v><div class=3D"gmail_extra">** Foundation and appearing in the file LICENS=
E.LGPL included in the</div><div class=3D"gmail_extra">** packaging of this=
 file. =A0Please review the following information to</div>



<div class=3D"gmail_extra">** ensure the GNU Lesser General Public License =
version 2.1 requirements</div><div class=3D"gmail_extra">** will be met: <a=
 href=3D"http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html" target=3D"=
_blank">http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html</a>.</div>



<div class=3D"gmail_extra">**</div><div class=3D"gmail_extra">** In additio=
n, as a special exception, Digia gives you certain additional</div><div cla=
ss=3D"gmail_extra">** rights. =A0These rights are described in the Digia Qt=
 LGPL Exception</div>



<div class=3D"gmail_extra">** version 1.1, included in the file LGPL_EXCEPT=
ION.txt in this package.</div><div class=3D"gmail_extra">**</div><div class=
=3D"gmail_extra">** GNU General Public License Usage</div><div class=3D"gma=
il_extra">



** Alternatively, this file may be used under the terms of the GNU</div><di=
v class=3D"gmail_extra">** General Public License version 3.0 as published =
by the Free Software</div><div class=3D"gmail_extra">** Foundation and appe=
aring in the file LICENSE.GPL included in the</div>



<div class=3D"gmail_extra">** packaging of this file. =A0Please review the =
following information to</div><div class=3D"gmail_extra">** ensure the GNU =
General Public License version 3.0 requirements will be</div><div class=3D"=
gmail_extra">



** met: <a href=3D"http://www.gnu.org/copyleft/gpl.html" target=3D"_blank">=
http://www.gnu.org/copyleft/gpl.html</a>.</div><div class=3D"gmail_extra">*=
*</div><div class=3D"gmail_extra">**</div><div class=3D"gmail_extra">** $QT=
_END_LICENSE$</div>

</div></blockquote></div><br>What is the verdict? Should I have to add any =
notes on commit message?<br><br clear=3D"all"><div><div dir=3D"ltr"><br></d=
iv><div dir=3D"ltr"><br></div><div dir=3D"ltr">Regards,</div></div><br clea=
r=3D"all">

<div><div dir=3D"ltr"><div>--<br></div>*dS<br>Diego Sueiro<br><br>Administr=
ador do Embarcados<br><a href=3D"http://www.embarcados.com.br/?utm_source=
=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%2=
0Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a1135250249c41e04f324801a--
