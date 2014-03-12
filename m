Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0AAE16F7B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:05:36 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 9so27385370ykp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 08:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=8PB3ntc37WMH1FFj1zPGFyTrKxT+ikuiTINn0sNV1j0=;
	b=QXlUbWF8hm2elhLz/b6s8Jori3sbqh5zFYfBu1jcfWWKlUaW72UbpWrSsJDr02zMEc
	ocpFgRX+X0p2XrdXEnU4lxDG+yh5Y6O8QiDdG+B9VMQ4qwCvURsgeRza8dDBmkrOuBi3
	ZzwBOtVhm2sv4ZerMfbpWP6yFrtlp983avHg0xPYiwFGseo+B0icihRrImCXlcc6sHPa
	ersugkg/f8bSwDDzvV0W9EqOaoIEMruJB0F25aZNMV6Gm+5Gu/rvRKSKXAjS2e7Il6Ac
	LSIT/Bto4OI18fEy3yqPIxFuCQZLirCXzMZ4d+PTKyOfNFmsa0eI3prVoAkHEh+5lcag
	ZCFA==
MIME-Version: 1.0
X-Received: by 10.236.60.68 with SMTP id t44mr61053512yhc.47.1394636737438;
	Wed, 12 Mar 2014 08:05:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 12 Mar 2014 08:05:37 -0700 (PDT)
In-Reply-To: <53204079.9030806@pr.hu>
References: <53204079.9030806@pr.hu>
Date: Wed, 12 Mar 2014 12:05:37 -0300
X-Google-Sender-Auth: 6Ax-JjwTwv5Hib9oJADsjpgW0qQ
Message-ID: <CAP9ODKra6NpM_jz=bFVHH45gEbjs6Sz3pD3oyh6OKT9XVhgZag@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Boszormenyi Zoltan <zboszor@pr.hu>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>
Subject: Re: [meta-freescale] systemtap fails to build
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
X-List-Received-Date: Wed, 12 Mar 2014 15:05:41 -0000
Content-Type: multipart/alternative; boundary=bcaec508238c53759f04f46a2b2c

--bcaec508238c53759f04f46a2b2c
Content-Type: text/plain; charset=ISO-8859-1

Hello,

This is not meta-fsl-arm specific so I am adding OE-Core mailing list in
copy.

On Wed, Mar 12, 2014 at 8:09 AM, Boszormenyi Zoltan <zboszor@pr.hu> wrote:

> I was trying to "bitbake core-image-lsb-sdk" and it failed with the error
> below.
> Even after "repo sync ; bitbake -c clean systemtap"
>
> | In file included from /usr/include/stdio.h:27:0,
> |                  from /home/zozo/fsl-community-bsp/
> build-master-next/tmp/work/x86_64-linux/systemtap-native/
> 2.5+gitAUTOINC+508059f048-r0/git/staprun/staprun.h:18,
> |                  from /home/zozo/fsl-community-bsp/
> build-master-next/tmp/work/x86_64-linux/systemtap-native/
> 2.5+gitAUTOINC+508059f048-r0/git/staprun/staprun.c:24:
> | /usr/include/features.h:148:3: error: #warning "_BSD_SOURCE and
> _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE" [-Werror=cpp]
> |  # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use
> _DEFAULT_SOURCE"
> |    ^
> | cc1: all warnings being treated as errors
> | make[3]: *** [staprun-staprun.o] Error 1
>
> I am using a hybrid system, host is mostly Fedora 20 with some
> packages upgraded from Rawhide, like GLIBC 2.19.90.
> The attached (shortsighted) patch allows it to build here.
>

Do someone know if it is being in worked by someone?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--bcaec508238c53759f04f46a2b2c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">This is not meta-fsl-arm specific so I am adding OE-Core m=
ailing list in copy.<br><br><div class=3D"gmail_quote">On Wed, Mar 12, 2014=
 at 8:09 AM, Boszormenyi Zoltan <span dir=3D"ltr">&lt;<a href=3D"mailto:zbo=
szor@pr.hu" target=3D"_blank">zboszor@pr.hu</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">I was trying to &quot;bitbake core-image-lsb=
-sdk&quot; and it failed with the error below.<br>
Even after &quot;repo sync ; bitbake -c clean systemtap&quot;<br>
<br>
| In file included from /usr/include/stdio.h:27:0,<br>
| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from /home/zozo/fsl-community-bsp/<u><=
/u>build-master-next/tmp/work/<u></u>x86_64-linux/systemtap-native/<u></u>2=
.5+gitAUTOINC+508059f048-r0/<u></u>git/staprun/staprun.h:18,<br>
| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from /home/zozo/fsl-community-bsp/<u><=
/u>build-master-next/tmp/work/<u></u>x86_64-linux/systemtap-native/<u></u>2=
.5+gitAUTOINC+508059f048-r0/<u></u>git/staprun/staprun.c:24:<br>
| /usr/include/features.h:148:3: error: #warning &quot;_BSD_SOURCE and _SVI=
D_SOURCE are deprecated, use _DEFAULT_SOURCE&quot; [-Werror=3Dcpp]<br>
| =A0# warning &quot;_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFA=
ULT_SOURCE&quot;<br>
| =A0 =A0^<br>
| cc1: all warnings being treated as errors<br>
| make[3]: *** [staprun-staprun.o] Error 1<br>
<br>
I am using a hybrid system, host is mostly Fedora 20 with some<br>
packages upgraded from Rawhide, like GLIBC 2.19.90.<br>
The attached (shortsighted) patch allows it to build here.<br></blockquote>=
<div><br></div><div>Do someone know if it is being in worked by someone?</d=
iv></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://code.ossystems.com.br" targ=
et=3D"_blank">http://code.ossystems.com.br</a><br><span>Mobile: +55 (53) 99=
81-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: <span id=3D"gc-number-4" class=3D"gc=
-cs-link" title=3D"Call with Google Voice">+1 (347) 903-9750</span></span><=
br>

</div></div>

--bcaec508238c53759f04f46a2b2c--
