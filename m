Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 05D4777371
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 10:46:14 +0000 (UTC)
Received: by iofh3 with SMTP id h3so120617174iof.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 02:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DBtiaxTRdNI6vhSxviOTcegRk89XdHDlPuVGIj7hsGQ=;
	b=xqZyNIsTgk4ALrMukouwF5IcIyifxV1vN7d8ztW3Zt7/Qu1cHN+gWl23cd618KA4gR
	LDJzJjRS195TSIj4RyuGTmiQ0OIpIt9jUFgjDv3QnbZQqDTvUt6EyCHi2+mdBzYgaAUF
	M/bEovqiJB/wP7+C1h43w1sSgXUu63i/tRQSzLtegGIQhWdxFK5S6vjAins+d19W3HDs
	TpEkFxVumYOln+2ai3GpsJk46TwkDP06I1BQhE/gHDLfeqze1YOPSinJMA8q5yeBr0eR
	5wJUJXut2OGSGFsMPY2n8q+cvc4D7aPl99c69WyuslEvylC2Sjl5lZ6Loj/NdHD9gD9v
	XTKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DBtiaxTRdNI6vhSxviOTcegRk89XdHDlPuVGIj7hsGQ=;
	b=E4WZNj8J+ogaQeyjYJVIgm10zyu9oV3y6p0C9KTH7eCsIpoyT9cpIYxU8HEslU4iEl
	EEWQPQhQYI0ISLksOQpel8Ni1Ns8bjcyL6312DmTp95wiC8I4z3NQlC6V5hjsj098X14
	9f3z7adaoAh/Rs/BkQCFhtFLO2YpeQLZm7UXjmAENX7jNOVTqhvAIMuUAubWRjxa+4or
	B1mxH/d2GWKpk6wOORajYtT0wjoRtS+HO/vXy8oU21rp55vJWupfLRtd3L7MCwRY9Ox/
	EnSMt4ffFkm1IEDuylYtfX+1veBau+Sn+fs/QoN29zAchOojFmVubSFWBfwpEklnoP9C
	Q+vQ==
X-Gm-Message-State: ALoCoQlB7L13fmKKDPAsYfIqZw2Np4kgN0DXRBYCvKqfzPZqLOXn3xgM1ZwyOb2UyT3SNrPE43Pf
X-Received: by 10.107.3.144 with SMTP id e16mr20455132ioi.99.1447497974820;
	Sat, 14 Nov 2015 02:46:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Sat, 14 Nov 2015 02:45:55 -0800 (PST)
In-Reply-To: <CAJTo0LaE+fVE5qyH05JeW6HjJuVTGs4AG9awhPW_ozQTyoTe=w@mail.gmail.com>
References: <cover.1447224734.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LaE+fVE5qyH05JeW6HjJuVTGs4AG9awhPW_ozQTyoTe=w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 14 Nov 2015 10:45:55 +0000
Message-ID: <CAJTo0LZD448ofKVJC+Py84g0i1S6QrJW+cLvkUhMHJ64UXKwzw@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] python3: Upgrade from 3.4.3 to 3.5
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
X-List-Received-Date: Sat, 14 Nov 2015 10:46:17 -0000
Content-Type: multipart/alternative; boundary=001a113ecf409a51d605247de28b

--001a113ecf409a51d605247de28b
Content-Type: text/plain; charset=UTF-8

On 13 November 2015 at 20:44, Burton, Ross <ross.burton@intel.com> wrote:

> This failed on the autobuilder in the world-lsb target:
>
> | ./Programs/_freeze_importlib \
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.5.0-r1.0/
> Python-3.5.0/Lib/importlib/_bootstrap.py Python/importlib.h
> | ./Programs/_freeze_importlib \
> |
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.5.0-r1.0/
> Python-3.5.0/Lib/importlib/_bootstrap_external.py Python
> /importlib_external.h
> | ./Programs/_freeze_importlib: error while loading shared libraries:
> libz.so.1: cannot open shared object file: No such file or directory
> | ./Programs/_freeze_importlib: error while loading shared libraries:
> libz.so.1: cannot open shared object file: No such file or directory
>
> Considering zlib is a DEPENDS I have no idea why this happens. :(
>

The problem appears to be that _freeze_importlib is a binary compiled and
ran at build time but using the target compiler.  For you your build
environment and the target environment were probably close enough that it
works, on some ABs the loader paths are different, and obviously if you
build for a different architecture it just fails.

| ./Programs/_freeze_importlib: 1: ./Programs/_freeze_importlib: Syntax
error: word unexpected (expecting ")")

$ file _freeze_importlib
_freeze_importlib: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV),
dynamically linked, interpreter /lib/ld-linux.so.3, for GNU/Linux 2.6.32,
BuildID[sha1]=f5defa61a5f1e65c6be7219dc1bfff59d510cd78, not stripped

Yeah running an ARM binary on x86 isn't going to work.

Ross

--001a113ecf409a51d605247de28b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 November 2015 at 20:44, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">This faile=
d on the autobuilder in the world-lsb target:<br><br>| ./Programs/_freeze_i=
mportlib \<br>| 		/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-wo=
rld-lsb/build/build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.5.0-r1.0=
/<span>Python</span>-3.5.0/Lib/importlib/_bootstrap.py <span>Python</span>/=
importlib.h<br>| ./Programs/_freeze_importlib \<br>| 		/home/pokybuild/yoct=
o-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/x86-pokym=
llib32-linux/lib32-python3/3.5.0-r1.0/<span>Python</span>-3.5.0/Lib/importl=
ib/_bootstrap_external.py <span>Python</span>/importlib_external.h<br>| ./P=
rograms/_freeze_importlib: error while loading shared libraries: libz.so.1:=
 cannot open shared object file: No such file or directory<br>| ./Programs/=
_freeze_importlib: error while loading shared libraries: libz.so.1: cannot =
open shared object file: No such file or directory<br></div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Considering zlib is a DEPE=
NDS I have no idea why this happens. :(</div></blockquote></div><div class=
=3D"gmail_extra"><br></div>The problem appears to be that _freeze_importlib=
 is a binary compiled and ran at build time but using the target compiler.=
=C2=A0 For you your build environment and the target environment were proba=
bly close enough that it works, on some ABs the loader paths are different,=
 and obviously if you build for a different architecture it just fails.<br>=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">| ./P=
rograms/_freeze_importlib: 1: ./Programs/_freeze_importlib: Syntax error: w=
ord unexpected (expecting &quot;)&quot;)<br></div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">$ file _f=
reeze_importlib</div><div class=3D"gmail_extra">_freeze_importlib: ELF 32-b=
it LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpr=
eter /lib/ld-linux.so.3, for GNU/Linux 2.6.32, BuildID[sha1]=3Df5defa61a5f1=
e65c6be7219dc1bfff59d510cd78, not stripped</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Yeah running an ARM binary on x86 isn&=
#39;t going to work.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div></div>

--001a113ecf409a51d605247de28b--
