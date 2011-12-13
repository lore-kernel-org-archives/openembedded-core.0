Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaQA3-0006Do-V5
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 12:04:40 +0100
Received: by bkbzt4 with SMTP id zt4so6465826bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=376V+D2yX4Bya2a/06LpIkVPxzY6fOGJeHRsatzcoso=;
	b=FfmdlTNXxXUal2SMwMnnP4XsEIxkLRmJLhGcXi6g4sUH019tiYS+cP9kOozOwCBkO3
	b7c7fgR/DwM66yrUbzQfX/+8OarBp1WyTHaP/cPLTBQ1JuHZRScRQF92ZbNcMInC68hC
	OcSEZr0pzIFEetI505lItpm0VycNtPB/ELGrg=
MIME-Version: 1.0
Received: by 10.205.135.9 with SMTP id ie9mr12675104bkc.137.1323773864287;
	Tue, 13 Dec 2011 02:57:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Tue, 13 Dec 2011 02:57:44 -0800 (PST)
In-Reply-To: <4EE72E39.9000103@windriver.com>
References: <cover.1323688579.git.xiaofeng.yan@windriver.com>
	<fbfec531140ee0c6848402faf94ba93b903d02ef.1323688580.git.xiaofeng.yan@windriver.com>
	<CAP9ODKrGOc27fxR74Ops4YjF+vLAwU5kZRZFW4XZjiFBaS=hig@mail.gmail.com>
	<4EE72E39.9000103@windriver.com>
Date: Tue, 13 Dec 2011 08:57:44 -0200
X-Google-Sender-Auth: I1C9mFxtqC2WKxECHoXWFftsxfo
Message-ID: <CAP9ODKoU+nN0h62xiPxU2=NP-xi7b+6jOZqLJTmRzwv4GH8YYQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] core-image-gtk-directfb.bb: add an image for gtk over directfb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Dec 2011 11:04:40 -0000
Content-Type: multipart/alternative; boundary=000e0ce0b7b6f19f3804b3f71e60

--000e0ce0b7b6f19f3804b3f71e60
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 13, 2011 at 08:51, Xiaofeng Yan <xiaofeng.yan@windriver.com>wrote:

> **
> ...
>
IMAGE_INSTALL += "\
>     ${POKY_BASE_INSTALL} \
>     task-core-basic \
>     module-init-tools \
>     task-core-gtk-directfb-base \
> "
> Do you have any comment about above method ?
>

All is fine except I don't see the need of having one specific image for
gtk-directfb use. The case, in case it is required, you might include in
case gtk-directfb feature is listed, avoiding an image specific to this.

Why do you want a specific image for it?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0ce0b7b6f19f3804b3f71e60
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Dec 13, 2011 at 08:51, Xiaofeng Yan <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:xiaofeng.yan@windriver.com">xiaofeng.ya=
n@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<u></u>

 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#ffffff"><div><div class=3D"h5">...=A0</=
div></div></div></blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div text=3D"#0=
00000" bgcolor=3D"#ffffff">
<div><div class=3D"h5">IMAGE_INSTALL +=3D &quot;\</div></div>
    =A0=A0=A0 ${POKY_BASE_INSTALL} \<br>
    =A0=A0=A0 task-core-basic \<br>
    =A0=A0=A0 module-init-tools \<br>
    =A0=A0=A0 task-core-gtk-directfb-base \<br>
    &quot;<br>
    Do you have any comment about above method ?<br></div></blockquote><div=
><br></div><div>All is fine except I don&#39;t see the need of having one s=
pecific image for gtk-directfb use. The case, in case it is required, you m=
ight include in case gtk-directfb feature is listed, avoiding an image spec=
ific to this.</div>
<div><br></div><div>Why do you want a specific image for it?</div><div>=A0<=
/div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossyste=
ms.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http=
://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><=
br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0ce0b7b6f19f3804b3f71e60--
