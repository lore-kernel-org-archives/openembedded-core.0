Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id F23E275C0C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 10:16:10 +0000 (UTC)
Received: by qgii30 with SMTP id i30so1575959qgi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 03:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9/AimJyFTD3vsdbsP7+eEwlR/ye9qpbEzEeIOfrXI/Q=;
	b=dAPZTzfRbwzvf79+K+OkjZoeEPfo18QUaLwWTTT9fc5qjgPNhPDU9UB10MsW85ovfD
	gOXm1u3ufOzOTWGyl7Cw5UeE3BbHOdJnObNO6hKviTd5o47BfqJ0dTRrQN8Y8kOKJH+F
	xyTfuG0CDIUN1BHGZXkZYq5R16uIZe0X7crrnv8eLQzgW+8cpeFtOO3mA2+hUH+LQRmD
	cJ0PBsBPEesLKwwg1vegWkYqa8RcIstTqrOFEPGXchJamAECjIcBGIGpnndU5tI7TaXJ
	G18Kf+5JWFlfZP64GIzYpdiDpSwDj+tUoy1gB4U4GOghsz9N2A07Jkf06RfKHDhF4yGd
	ny9Q==
X-Gm-Message-State: ALoCoQnyeKpkQX/gacKKyrXeklEH349wTMhip8IshjGqz6FkWnQE60LsqmQ1/2z+DS6lJyjNh8Y5
X-Received: by 10.55.18.197 with SMTP id 66mr22941607qks.13.1435659371616;
	Tue, 30 Jun 2015 03:16:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 03:15:52 -0700 (PDT)
In-Reply-To: <mmtpa9$67d$1@ger.gmane.org>
References: <5591E548.8090706@gmail.com>
	<CAJTo0LbVgo+rn3rPPbj=ho-aDc6WuHTq83UcR8Y=HNAique81w@mail.gmail.com>
	<mmtpa9$67d$1@ger.gmane.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 11:15:52 +0100
Message-ID: <CAJTo0LaUtsGYH99Dqr2zyWB38HeM5w-K6Jw0q2VFUQMrwFC6rQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] cmake update broke mariadb
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
X-List-Received-Date: Tue, 30 Jun 2015 10:16:11 -0000
Content-Type: multipart/alternative; boundary=001a11474faadd2e4c0519b97ec3

--001a11474faadd2e4c0519b97ec3
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 10:59, Koen Kooi <koen@dominion.thruhere.net> wrote:

> CMake Error at CMakeLists.txt:86 (PROJECT):
> |   The CMAKE_C_COMPILER:
> |
> |     gcc
> |
> |   is not a full path and was not found in the PATH.
>

I'm definitely not the cmake maintainer and barely understand cmake files,
but the new release needs that to be a full path and not a filename.  The
recipe/class does this (as demonstrated by it working in
oe-core/meta-multimedia) so does the mariadb recipe do something else or
use a different class?

Ross

--001a11474faadd2e4c0519b97ec3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2015 at 10:59, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.net</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1y3" cla=
ss=3D"a3s" style=3D"overflow:hidden"> CMake Error at CMakeLists.txt:86 (PRO=
JECT):<br>
|=C2=A0 =C2=A0The CMAKE_C_COMPILER:<br>
|<br>
|=C2=A0 =C2=A0 =C2=A0gcc<br>
|<br>
|=C2=A0 =C2=A0is not a full path and was not found in the PATH.<br></div></=
blockquote><div><br></div><div>I&#39;m definitely not the cmake maintainer =
and barely understand cmake files, but the new release needs that to be a f=
ull path and not a filename.=C2=A0 The recipe/class does this (as demonstra=
ted by it working in oe-core/meta-multimedia) so does the mariadb recipe do=
 something else or use a different class?</div><div><br></div><div>Ross=C2=
=A0</div></div></div></div>

--001a11474faadd2e4c0519b97ec3--
