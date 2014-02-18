Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 457C16E8DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 18:56:06 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id cm18so23602920qab.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 10:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LhM7NIOF3XrIs40Y7BvcizIbSGwkZrI9SdxGrcZLDAY=;
	b=kKPxaSglmnb/LqmLA7MYJJsqHwPQvcxnZu03AKyYy+SdyRwq7Ja6+hQs+umN7dhirD
	LZMV1xufxkiurApxvUrv4IMKlJtVWCu/ecRl7Y1kRJaVQQFfQHOg88cOjPNyKbutmIQR
	8z1toKqit5f5x8LI6AqhbWb5f3pnfecRF02cN/bDtUzAR+oZ+g/x+qer4p8I2BQrhoB2
	6Uas07oZSoNbm2DtWHNt6L9SNJ7SH5VHu+zF5JJP95u6Tb6otRfGPmhp0QS1Pro3YsTh
	h8uaKtlnxdF4h/6OLs9jqQ+Mo6/fyKsfOKheLme+czNDf/gHivmSNTRURKJuCpHCY54f
	1aCg==
X-Received: by 10.140.21.179 with SMTP id 48mr12324050qgl.78.1392749767013;
	Tue, 18 Feb 2014 10:56:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 18 Feb 2014 10:55:46 -0800 (PST)
In-Reply-To: <CAMKF1srUcG1euTY2kzKroG5k5h7R-nUd7aFhqk2dVvcu-k8BrA@mail.gmail.com>
References: <1392745755-20315-1-git-send-email-diego.sueiro@gmail.com>
	<CAMKF1srUcG1euTY2kzKroG5k5h7R-nUd7aFhqk2dVvcu-k8BrA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 18 Feb 2014 15:55:46 -0300
Message-ID: <CAMCfZKGFs8-AEyFx4PCCu-t5c_fOLHi4ceJD+txO3woO4Mb0ZQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Feb 2014 18:56:07 -0000
Content-Type: multipart/alternative; boundary=001a11c11fee1fbbd704f2b2d34a

--001a11c11fee1fbbd704f2b2d34a
Content-Type: text/plain; charset=ISO-8859-1

Khem,
On Tue, Feb 18, 2014 at 2:51 PM, Khem Raj <raj.khem@gmail.com> wrote:

> can you also figure out what is the licensing terms of these static .a
> archives please ?
> and make a note of it in commit message or somewhere
>
Looking at the main library header (tools/designer/src/uitools/quiloader.h)
it mentions the Digia Commercial License, LGPL v2.1, LGPL Exception and
GPLv3.

I think it is not different from the other libraries and if you use this
library (in this case static library) in LGPL or GPL you should provide
your source code and follow the same license. Am I wrong?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--001a11c11fee1fbbd704f2b2d34a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Khem,<br><div class=3D"gmail_qu=
ote">On Tue, Feb 18, 2014 at 2:51 PM, Khem Raj <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div style=3D"overflow:hidden">can you also figure out wha=
t is the licensing terms of these static .a<br>



archives please ?<br>
and make a note of it in commit message or somewhere</div></blockquote></di=
v>Looking at the main library header (tools/designer/src/uitools/quiloader.=
h) it mentions the Digia Commercial License, LGPL v2.1, LGPL Exception and =
GPLv3.</div>


<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I think it =
is not different from the other libraries and if you use this library (in t=
his case static library) in LGPL or GPL you should provide your source code=
 and follow the same license. Am I wrong?=A0</div>


<div class=3D"gmail_extra"><br>Regards,<br><div><div dir=3D"ltr"><div><br><=
/div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a hre=
f=3D"http://www.embarcados.com.br" target=3D"_blank">www.embarcados.com.br<=
/a><br>


<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c11fee1fbbd704f2b2d34a--
