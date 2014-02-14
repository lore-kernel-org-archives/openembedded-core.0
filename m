Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id B83906E714
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 23:58:36 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i8so21287029qcq.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 15:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LMTnaYtJs4vb3QB6kMu0YoNrEwZ00P8KZyYRD9IpsQQ=;
	b=HBGkgYtq84OYziDT4TMHVYRPRM8KX/NOpZhfL6YXrKPUcBHmc7pVpUWLXao3qK4tP2
	n6oMKzQ/3wUwjlHETtZtBahb4d7cGzkBlZE2Tw5HZYrOqcrq9KJsRt2G489y50l8rlOC
	roT8bKcq9jwnHSQFL5rPLFYKlvzo//bYVwLgTh4GNlxZuOxf5xEwrWwr2RFQzSguBIMC
	h2PNKwacdOpzP2UlxN+OlbpLKTnwPnZVEQ+pNoqSYrTtlnI/0R9CGbyOIvPShSeQm+oj
	RfP8CthSIeJ8ACHbAkOwTM1on8plL5sVNcL32SscORZ1gf6cVGOE9lN+mPxBZEtVAfJF
	FDcQ==
X-Received: by 10.140.31.75 with SMTP id e69mr17341012qge.76.1392422317268;
	Fri, 14 Feb 2014 15:58:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Fri, 14 Feb 2014 15:58:16 -0800 (PST)
In-Reply-To: <CAMKF1sqQQQD82FeRg_hgK-Q5=VQDPArpJrz7wUxe8kGy7KNe=A@mail.gmail.com>
References: <CAMCfZKE1+RDpEE8HehL_GDp2WxrVWjpjVL0Fb94Y_729Zi0A=w@mail.gmail.com>
	<CAMCfZKFBnmFip9qdUxjf60F_T5yBBEUfENULR_Bxt_b+Hso77g@mail.gmail.com>
	<1392334278.14081.26.camel@ted>
	<CAMCfZKEJJdCgCdhHHa_944+adDA2h6sBR9b9nwL=gTpy+dUPJQ@mail.gmail.com>
	<CAMKF1sqQQQD82FeRg_hgK-Q5=VQDPArpJrz7wUxe8kGy7KNe=A@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Fri, 14 Feb 2014 21:58:16 -0200
Message-ID: <CAMCfZKFO6G8pFprNR_62k4UhG1=S0sbxNew7VfzFSRKXtMG1RA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qte-4.8.5 missing libQtUiToolsE.a on toolchain
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
X-List-Received-Date: Fri, 14 Feb 2014 23:58:37 -0000
Content-Type: multipart/alternative; boundary=001a113a96ca9964a904f26695ff

--001a113a96ca9964a904f26695ff
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 14, 2014 at 6:18 PM, Khem Raj <raj.khem@gmail.com> wrote:

> then package the needed static library in -dev package. Now its not
> recommended practice however sometimes
> exceptions are made but I would recommend to check first if its an
> oversight/bug in QT5 to not generate a .so
> for the given library or it could be a architectural need to have it
> static either way some clarification is needed
> before this change is made
>

Khem,

Looking at some references it seems that qt just builds the static library:
https://bugs.archlinux.org/task/37447
http://rpmfind.net/linux/RPM/epel/6/x86_64/qt5-qttools-static-5.2.0-1.el6.x86_64.html
http://fr2.rpmfind.net//linux/RPM/opensuse/factory/armv7hl/armv7hl/libqt4-devel-4.8.5-10.1.armv7hl.html

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--001a113a96ca9964a904f26695ff
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Feb 14, 2014 at 6:18 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":n6x" style=3D"overflow:hidden">then package th=
e needed static library in -dev package. Now its not<br>


recommended practice however sometimes<br>
exceptions are made but I would recommend to check first if its an<br>
oversight/bug in QT5 to not generate a .so<br>
for the given library or it could be a architectural need to have it<br>
static either way some clarification is needed<br>
before this change is made</div></blockquote></div><br>Khem,</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Looking at some refe=
rences it seems that qt just builds the static library:</div><div class=3D"=
gmail_extra">

<a href=3D"https://bugs.archlinux.org/task/37447">https://bugs.archlinux.or=
g/task/37447</a></div><div class=3D"gmail_extra"><a href=3D"http://rpmfind.=
net/linux/RPM/epel/6/x86_64/qt5-qttools-static-5.2.0-1.el6.x86_64.html">htt=
p://rpmfind.net/linux/RPM/epel/6/x86_64/qt5-qttools-static-5.2.0-1.el6.x86_=
64.html</a></div>

<div class=3D"gmail_extra"><a href=3D"http://fr2.rpmfind.net//linux/RPM/ope=
nsuse/factory/armv7hl/armv7hl/libqt4-devel-4.8.5-10.1.armv7hl.html">http://=
fr2.rpmfind.net//linux/RPM/opensuse/factory/armv7hl/armv7hl/libqt4-devel-4.=
8.5-10.1.armv7hl.html</a><br>

<br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></div>-=
-<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D"h=
ttp://www.embarcados.com.br" target=3D"_blank">www.embarcados.com.br</a><br=
><br>

/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a113a96ca9964a904f26695ff--
