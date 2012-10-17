Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TOaeQ-0003KG-0u
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 22:55:38 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so6634060pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 13:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=OoDnh9fsysxlEy5X2/H7e6IlJugm53ktKUPP/HH0M34=;
	b=VmCLcOyhio4a0u8Roo0xGGU8kyrqqULFIyYgD5aPsaLhss0PFUSSyWFRId/sK/I9GG
	JpRupPsTD4nHB/7duMpZLGrKkIeuTPnrcEmGDzsnxa0UoVXWZH+avtqsmTJ5Z0N7ghRT
	2nELeYznnLBay6EHM6gxJ2YJiIST+Kt8Mbdun8zgmZrdahgrh28Cvs66QG38bHyEBPBK
	+TiFx2dNXjAt4vJ98cJ+aU4cq0mJzSF5ifad0WSDL3ZNQOrs5a54UyUNZsoOty2FhDd0
	ds0M/lzJiMMMwPIh2CEAruTDm26k+liTn/Zzbt+WqwEYGG06RmPYmRP5pmmH+j/gmn7b
	1h9g==
MIME-Version: 1.0
Received: by 10.68.229.138 with SMTP id sq10mr60307609pbc.126.1350506538525;
	Wed, 17 Oct 2012 13:42:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 17 Oct 2012 13:42:18 -0700 (PDT)
In-Reply-To: <1350500844-10356-1-git-send-email-raj.khem@gmail.com>
References: <1350500844-10356-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 17 Oct 2012 17:42:18 -0300
X-Google-Sender-Auth: yVR6O03t9hK8t3xwtms43_DQZ90
Message-ID: <CAP9ODKpprdTNmgJCZvir9jM7mnpS9RN17G_s=mbNW0RL4ZvQww@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFT][PATCH V2] eglibc-2.16: Use tar ball instead of svn SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 20:55:38 -0000
Content-Type: multipart/alternative; boundary=047d7b33985b7ee46304cc474e02

--047d7b33985b7ee46304cc474e02
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 17, 2012 at 4:07 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Adapt the recipes to fetch a tarball.
> Tarball is generated from latest 2.16 branch
> which has e500-math_private.patch already applied
> hence we remove that patch.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

What the motivation to move to the tarball?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b33985b7ee46304cc474e02
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Oct 17, 2012 at 4:07 PM, Khem Ra=
j <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<div class=3D"im">Adapt the recipes to fetch a tarball.<br>
Tarball is generated from latest 2.16 branch<br>
which has e500-math_private.patch already applied<br>
hence we remove that patch.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br></div></blockquote><div><br></div><div>What the motiva=
tion to move to the tarball?</div><div>=A0</div></div>-- <br>Otavio Salvado=
r=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br=
>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--047d7b33985b7ee46304cc474e02--
