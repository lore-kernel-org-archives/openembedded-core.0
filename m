Return-Path: <diego.sueiro@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6339F734D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 12:58:53 +0000 (UTC)
Received: by obbir4 with SMTP id ir4so12068415obb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=DRXQcvFgySE3BqtgOdSTDRHzGCDUpRzxGkcpiBiYVcU=;
	b=dNGPJQ0vMK41aOv78HaXa4toD4wJqSfl3Kgc7Qg8weWtzif2qA0njlly7cVCs5pbJm
	zkRtJsbQaFlmbMRBTX5JhJo1mlimq7qAAsPYZDZtuiZ5R1PNyv2yKXvlG2jzWlgrtSaM
	ycQS08k6TQQ66uJNDW1t5bvDEUzRQIerbG6IJTi2AOxqpUnctgFDBnBWWGszFVe8HZZq
	NXJwjU3pvV01lcbb5y0QEaylg2qjprhPCF7JcRF3nQr0q6rp3Sq+1UrqcqVd80ehpDuO
	m+iyZLz+hD+OgScAhlqsQyQaHoMOWp1quRIDnrRfneGBotP1MXtd3cNy8WBPALnqDb9P
	b6Gw==
X-Received: by 10.60.92.131 with SMTP id cm3mr19024762oeb.23.1433854734808;
	Tue, 09 Jun 2015 05:58:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.20.13 with HTTP; Tue, 9 Jun 2015 05:58:34 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 9 Jun 2015 09:58:34 -0300
Message-ID: <CAMCfZKFgggP5Y21S58+jq8n_se3a3Tg06f2HTFTj8j0Go3ATUA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [meta-qt5] Issue on linking qtwebengine
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
X-List-Received-Date: Tue, 09 Jun 2015 12:58:57 -0000
Content-Type: multipart/alternative; boundary=047d7b33d81220bc88051815523d

--047d7b33d81220bc88051815523d
Content-Type: text/plain; charset=UTF-8

Folks,

I'm using fido branch and I'm getting the linker killed due to out of
memory in a machine with 8GB of RAM.

I saw this article talking about this:
http://www.phoronix.com/scan.php?page=news_item&px=QtWebEngine-Mess-Debian

Is there something in which can be done on openembedded side?

Is there someone who can reproduce this on fido branch?

I'm using raspberrypi2 machine.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--047d7b33d81220bc88051815523d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Folks,<div><br></div><div>I&#39;m using fido branch and I&=
#39;m getting the linker killed due to out of memory in a machine with 8GB =
of RAM.</div><div><br></div><div>I saw this article talking about this:</di=
v><div><a href=3D"http://www.phoronix.com/scan.php?page=3Dnews_item&amp;px=
=3DQtWebEngine-Mess-Debian">http://www.phoronix.com/scan.php?page=3Dnews_it=
em&amp;px=3DQtWebEngine-Mess-Debian</a><br></div><div><br></div><div>Is the=
re something in which can be done on openembedded side?</div><div><br></div=
><div>Is there someone who can reproduce this on fido branch?</div><div><br=
></div><div>I&#39;m using raspberrypi2 machine.</div><div><br></div><div><b=
r clear=3D"all"><div><div class=3D"gmail_signature"><div dir=3D"ltr"><div>R=
egards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador =
do Embarcados<br><a href=3D"http://www.embarcados.com.br/?utm_source=3Dassi=
natura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%=
20Diego" target=3D"_blank">www.embarcados.com.br</a><br><br>/*long live roc=
k &#39;n roll*/<br></div></div></div>
</div></div>

--047d7b33d81220bc88051815523d--
