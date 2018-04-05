Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 23A0874B77
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 10:43:11 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id n20so15149375ual.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 03:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ropw5pdNd8Dt/SJbQ5mYbPEqtaQSD2fIO/4c+PUqD54=;
	b=EUbiMUH8kTeGOgFQQcsXvPHqpZXOQ53t+/lEWfE+qdM24B+SzB6qlhoawC86irq72A
	zZwcC0TrbZ3ZJzhDXas8BXIBPNVh9LDdHHUR98mAT0/TRKQ2xe47wBCFOYaOxfzUhcGV
	tfhvg8Yg7JHZ/JBbvUR6YjGYPZ1scO51IE9VJ3gQcTBvP+9U7+Y/UaOWTlemaI/MPzy4
	MA1N+ydRxRhseu9Z2lc9AMokKt92PQQTziOADK/9XmrqINusn2m9saFM5ljyd9Dt4qcY
	84Ow8drDMUDyex08m/RKt1ErUb4rgF2XsUIUsmD+OIEk+gz/HT5yZyAdiZkVBhHiOFFR
	239w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ropw5pdNd8Dt/SJbQ5mYbPEqtaQSD2fIO/4c+PUqD54=;
	b=Gx49jEIg/BnxbETY3lsYhWv9VlLl5Cm5QInelQv9BM4SW0nih3WpLJq5pMOPeXxAgi
	rFrSRmcACUVyrf1Ay5yluLo+e4C5SB1Q/xC3voODDg7/Egu/lT4UQmKjeRBOY3mtT7s2
	YyjwY71lmBaBMJvcnb37Tat8pjADeINNJgznizYQI0yaZb7/visuZ/bOAnpR/y7oFTzi
	zftt4zOf1ENGvNa1Km4lD25Daymhn3EdiyezWmjlhN2ZFKbTpuqNvUDDFZdeSX8yojcK
	GnRqSX2Ooc/5MhNBNZ2q5Ex9pwRQJ8vzloqijn4zP0EmNgdkzs0NtdEB3WPICM4JraNu
	iwyg==
X-Gm-Message-State: ALQs6tDaZo+cxnzaOIWN9JDcyFUUiB8SW/7zm9MindHTT07Thf0nQQLv
	jpd298lBOKTnJul/vil+gb1ElVDMWcLKQaawrhI=
X-Google-Smtp-Source: AIpwx4/ZHdOdxjPoh8eoJCvF35LrEI8kw6HnjA6ahXH0MMK6bWQC21qam+b/0UulOd7xsb6E6C8DWzxIbxin4f73zu0=
X-Received: by 10.176.71.213 with SMTP id w21mr13652829uac.125.1522924992299; 
	Thu, 05 Apr 2018 03:43:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.219.149 with HTTP; Thu, 5 Apr 2018 03:43:11 -0700 (PDT)
In-Reply-To: <CAPGMVzHSCh1VU91Leev0BaZNbzg05U--61WEO1UgcL700_WkBA@mail.gmail.com>
References: <CAPGMVzHSCh1VU91Leev0BaZNbzg05U--61WEO1UgcL700_WkBA@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 5 Apr 2018 16:13:11 +0530
Message-ID: <CAPGMVzGsUSor8=tX5EWWmnhUw1G4rpia9SVpSu=eYHw7DXDghw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] qemu boot problem
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
X-List-Received-Date: Thu, 05 Apr 2018 10:43:12 -0000
Content-Type: multipart/alternative; boundary="f4030437a0a02f868f0569179b70"

--f4030437a0a02f868f0569179b70
Content-Type: text/plain; charset="UTF-8"

as the error specifies about a specific recipe missing the license, i'd
like to know which recipe is that what is the pointer to defaultpkgname

Thanks

Rajath C S,
9964182112,
Bangalore - 560060

On Thu, Apr 5, 2018 at 3:30 PM, Rajath C S <rajathcs.1996@gmail.com> wrote:

> Hi,
>
> so i completed the core-image-sato build but while running it on qemu i
> get the below error.
>
> runqemu - INFO - Running MACHINE=qemux86 bitbake -e...
> ERROR: This recipe does not have the LICENSE field set (defaultpkgname)
> runqemu - ERROR - bitbake -e
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
> Build Configuration:
> BB_VERSION           = "1.37.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "i586-poky-linux"
> MACHINE              = "qemux86"
> DISTRO               = "poky"
> DISTRO_VERSION       = "2.4+snapshot-20180405"
> TUNE_FEATURES        = "m32 i586"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       = "master:80c7ca2c28959d08a59d960d318d8360392bd488"
> meta-oe
> meta-python          = "master:b9d1d8718834f7287e5a65373b952cbfe9ce83fe"
>
>
>
>
>

--f4030437a0a02f868f0569179b70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>as the error specifies about a specific recipe missin=
g the license, i&#39;d like to know which recipe is that what is the pointe=
r to defaultpkgname<br><br></div>Thanks<br></div><div class=3D"gmail_extra"=
><br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"gm=
ail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></d=
iv></div>Bangalore - 560060<br></div></div></div>
<br><div class=3D"gmail_quote">On Thu, Apr 5, 2018 at 3:30 PM, Rajath C S <=
span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_=
blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div>Hi,<br><br></div>so i completed the cor=
e-image-sato build but while running it on qemu i get the below error.<br><=
div><div><br>runqemu - INFO - Running MACHINE=3Dqemux86 bitbake -e...<br>ER=
ROR: This recipe does not have the LICENSE field set (defaultpkgname)<br>ru=
nqemu - ERROR - bitbake -e <br>Summary: There was 1 ERROR message shown, re=
turning a non-zero exit code.<br><br><br>Build Configuration:<br>BB_VERSION=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.37=
.0&quot;<br>BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;x86_64-linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;universal&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;i586-poky-linux&quot;<=
br>MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;qemux86&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky=
&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;2.4+=
snapshot-20180405&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;m32 i586&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;&quot;<br>meta=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <br>meta-poky=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 <br>meta-yocto-bsp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &qu=
ot;master:80c7ca2c28959d08a59d96<wbr>0d318d8360392bd488&quot;<br>meta-oe=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 <br>meta-python=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
&quot;master:b9d1d8718834f7287e5a65<wbr>373b952cbfe9ce83fe&quot;<div class=
=3D"m_-3211207360593716522gmail-yj6qo"></div><div class=3D"m_-3211207360593=
716522gmail-adL"><br></div><br><br><div class=3D"m_-3211207360593716522gmai=
l-yj6qo"></div><div class=3D"m_-3211207360593716522gmail-adL"><br></div></d=
iv></div></div>
</blockquote></div><br></div>

--f4030437a0a02f868f0569179b70--
