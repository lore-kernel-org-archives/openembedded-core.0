Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4B87F61F27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 16:39:27 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id j6so10397709oag.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=6IxpULDd5j+15OixI2MtdzUCOFvwNBWVCmrn08dihNY=;
	b=f9TY5+CTY187eDZe/mRZ90Krn6+33RNGsar5BvIBvWWujQv3QR+sTXODujjBp3dl7Y
	41ajyS8QwiizLlwKUkrQ0R6venpM/Pr6QFzUbhCOZtv8Bz1yiaT1msWSE0QQCeQhEm6K
	5xVxXr/+dbV/95PhzKQYH9ls1SSbkpmuj969/fDog+6B7ifpV6HG7swm2wcL7ULfmJic
	P+qfhnBJc/4RXCBSbUaMiTuaSWbnCy8MuWaxaob+ElZ3MK4QbrQSu/bzaypfBObn6WAR
	CgtThxOB6/1p7VipJ/aeSAwqxqo8QbbCjB1diUtKLPkH/Q8gtBCtgRipJ0lrsjD+9fk0
	mQvQ==
MIME-Version: 1.0
X-Received: by 10.182.39.226 with SMTP id s2mr21352728obk.46.1369759167501;
	Tue, 28 May 2013 09:39:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Tue, 28 May 2013 09:39:27 -0700 (PDT)
In-Reply-To: <1369758977.8846.21.camel@phil-desktop.brightsign>
References: <1369753475-22573-1-git-send-email-otavio@ossystems.com.br>
	<1369753938.8846.8.camel@phil-desktop.brightsign>
	<CAP9ODKqkoXrrYSyQJzRxmDfBKnQWYMUoCV8dhRvHGm2Y-sXp7g@mail.gmail.com>
	<1369755098.8846.16.camel@phil-desktop.brightsign>
	<CAP9ODKpzC7hM54OQ3dBQ5fBs5D5Fo=vawo1xWWA_wLKY8cPv-w@mail.gmail.com>
	<1369758517.8846.20.camel@phil-desktop.brightsign>
	<CAP9ODKp_DwsLazRcsidwiwsLNZAsrv1PZ7Rou8FM1StmygUxzw@mail.gmail.com>
	<1369758977.8846.21.camel@phil-desktop.brightsign>
Date: Tue, 28 May 2013 13:39:27 -0300
X-Google-Sender-Auth: bvAqozVWP_oy8pvKy-uEswvlZx8
Message-ID: <CAP9ODKo6JxtOO+zxyFNpJ+Zr7wcgD+0X-8RpbuX4Nx4=aFE1sw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Add COMPATIBLE_DISTRO_FEATURES support
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
X-List-Received-Date: Tue, 28 May 2013 16:39:27 -0000
Content-Type: multipart/alternative; boundary=001a11c2faec9ba94804ddc9e809

--001a11c2faec9ba94804ddc9e809
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 28, 2013 at 1:36 PM, Phil Blundell <pb@pbcl.net> wrote:

> On Tue, 2013-05-28 at 13:33 -0300, Otavio Salvador wrote:
>
> > In meta-fsl-arm, for now, it'll be 4 (gpu-viv-bin, gpu-viv-wl-bin,
> > amd-gpu-bin and amd-gpu-x11-bin) but I think other layers has same
> > need.
>
> Can you explain why those recipes need this feature?
>

gpu-viv and gpu-viv-wl provide support for Vivante GPU.

gpu-viv: x11
gpu-viv-wl: wayland

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c2faec9ba94804ddc9e809
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, May 28, 2013 at 1:36 PM, Phil Blundell <span dir=3D"ltr">&l=
t;<a href=3D"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</spa=
n> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Tue, 2013-05-28 at 13:3=
3 -0300, Otavio Salvador wrote:<br>
<br>
&gt; In meta-fsl-arm, for now, it&#39;ll be 4 (gpu-viv-bin, gpu-viv-wl-bin,=
<br>
&gt; amd-gpu-bin and amd-gpu-x11-bin) but I think other layers has same<br>
&gt; need.<br>
<br>
</div>Can you explain why those recipes need this feature?<br></blockquote>=
<div><br></div><div style>gpu-viv and gpu-viv-wl provide support for Vivant=
e GPU.</div><div style><br></div><div style>gpu-viv: x11</div><div style>
gpu-viv-wl: wayland</div><div style>=A0</div></div>-- <br>Otavio Salvador =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a =
href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems=
.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" tar=
get=3D"_blank">http://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--001a11c2faec9ba94804ddc9e809--
