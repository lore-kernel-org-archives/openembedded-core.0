Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 342FA6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 15:27:06 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id ig19so53940981igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 07:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sEN7xnm5oGEWSTheeKX66tB6aOz2S1Yo63cgs62D3JI=;
	b=QXeqyDBIdtwbjipx2V3cOQ6Q+D16/Rns4vBv9jHRaBkpCD30FQYbedVi4XdzwnsJQx
	YEvPI1f4EguJheo0bU5BF6Q+n+6AutYZ56zw7ohtyw2bm7YG/t1STmf4oweTfRcNqOU8
	5afLYiTun8r/n+VQUcv5Coid0DsU/X5uUgyvfLiOFVmGJemBPzpiHEQMWVKjpZp37GSu
	Es9p0iMK+WKf3c+ll+YFI//FUY++2mK0DYs+6oICJvF45n43QpIKZo4vFOBzfRoB+Dzu
	Jd/5PeOZUYNGHZ0LdZqjaxi2TaAJ7DhmLgLfDYC5xlBSRxwfwlqkjD+b9aV7q7g5t0ha
	o9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sEN7xnm5oGEWSTheeKX66tB6aOz2S1Yo63cgs62D3JI=;
	b=O7/kvSc3gehHJq8PokkM+5MQYfrVxw/l0HZlfXtpxBivQGArvimU5f1O8TLObPiyO9
	l2GgFfOnyDLG2KA6JDVl7MP3YyuW8MdF1dnTgoP/LjcNfpYu5Uat75v1ugoMqZAdEIFq
	x4NYZxKj4o2RvHQYpag6nENw+MMJ3Ku0nTcLOcWIglHiwq1hhLWere9tdijx3/BMLhhw
	+jZVs2RAYJ0kc4q/SOjfj9Ezr8/KJUUrbaiOjIG1wGvtw91eFvY6EaGAXvxJ1sLAIS+a
	Eb+LIZWDmeKeKGrcf5XC9Vu7r9EX90jXxoH72VbYTBOZyFJaAKChSrCQFD75RuoYcyv0
	fE5g==
X-Gm-Message-State: AD7BkJIJVYTDH2bOEnExxbhJbzQzF2cDKSPGDC20sCEO7FCv1XAz54jwOsPdjpzLCGN1DihpJLojfyp/xkDDj+rw
X-Received: by 10.50.43.226 with SMTP id z2mr19570532igl.78.1457450827870;
	Tue, 08 Mar 2016 07:27:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 8 Mar 2016 07:26:48 -0800 (PST)
In-Reply-To: <f6f440f9fbb9c8dccc4c0e449529ed3f3cb9fc65.1456449257.git.hongxu.jia@windriver.com>
References: <cover.1456449257.git.hongxu.jia@windriver.com>
	<f6f440f9fbb9c8dccc4c0e449529ed3f3cb9fc65.1456449257.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Mar 2016 15:26:48 +0000
Message-ID: <CAJTo0LbV7TfDKoZuT2OjV3PU7HaQ24DOpqZ2qGFOb0fhtXM9mA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/15] python-pycairo: fix buildpath QA issue
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
X-List-Received-Date: Tue, 08 Mar 2016 15:27:09 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4df930c052d8b36fb

--047d7bfea0f4df930c052d8b36fb
Content-Type: text/plain; charset=UTF-8

On 26 February 2016 at 01:45, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> +do_unpack[postfuncs] += "unpack_waf"
> +do_unpack[vardeps] += "unpack_waf"
> +unpack_waf() {
> +       # Just self extract tarball embedded in waf, do not care help
> message.
> +       # Do not generate bytecode, becuase we need to patch python file
> later
> +       PYTHONDONTWRITEBYTECODE=True ./waf --help >/dev/null
> +}
>

Presumably this isn't pycairo-specific but impacts every recipe using waf?


>  do_configure() {
> -       BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} ./waf configure
> --prefix=${D}${prefix} --libdir=${D}${libdir}
> +       BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} ./waf configure
> --prefix=${prefix} --libdir=${libdir}
>  }
>

Looks like this recipe needs to use the waf class for a start.

Ross

--047d7bfea0f4df930c052d8b36fb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 February 2016 at 01:45, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5al" cl=
ass=3D"a3s" style=3D"overflow:hidden">+do_unpack[postfuncs] +=3D &quot;unpa=
ck_waf&quot;<br>
+do_unpack[vardeps] +=3D &quot;unpack_waf&quot;<br>
+unpack_waf() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Just self extract tarball embedded in waf, do=
 not care help message.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Do not generate bytecode, becuase we need to =
patch python file later<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PYTHONDONTWRITEBYTECODE=3DTrue ./waf --help &gt=
;/dev/null<br>
+}<br></div></blockquote><div><br></div><div>Presumably this isn&#39;t pyca=
iro-specific but impacts every recipe using waf?</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div id=3D":5al" class=3D"a3s" style=3D"overflow=
:hidden">
=C2=A0do_configure() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS}=
 ./waf configure --prefix=3D${D}${prefix} --libdir=3D${D}${libdir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS}=
 ./waf configure --prefix=3D${prefix} --libdir=3D${libdir}<br>
=C2=A0}</div></blockquote></div><br>Looks like this recipe needs to use the=
 waf class for a start.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--047d7bfea0f4df930c052d8b36fb--
