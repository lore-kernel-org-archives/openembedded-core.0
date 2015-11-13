Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id E8ACE77346
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 20:44:46 +0000 (UTC)
Received: by igvi2 with SMTP id i2so43968374igv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 12:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xVJ5W5+JC1FWpmWH+VCGG3AgCc7O9di0Sz9y9Cmhkig=;
	b=yjs6ayoirmnJBFAYpRTprpGZpewPenwNFpw1rqIZzIvZ4UsEWNAmgOKDHorA/3K16U
	xsSAlV29YrcS6HKvWHG5fMBI1AseM0TRFEAofViiJo87w5Pwhi8EaZcfU/N80hhyyI7r
	/47UIAFkrIfL2VhePLlm8pciXxYQItO8bX7WttFW5viIWKHgheUemNFkz6Km6Vd2+n4v
	Ah88xpQ0abSz80BoSa/bT2UMNGQjEVpkgOasJbU6+xkh4VBaSOeKqm71ZOz9un0F3pJN
	GBTMMZ0Pgl3HNUFP4OeWzo60LEs19ZjqCpqoOur9wMSnMFVt7ulKs6CMLS9W6JhaQrJi
	UBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xVJ5W5+JC1FWpmWH+VCGG3AgCc7O9di0Sz9y9Cmhkig=;
	b=QPDkS8o7UvlX2DHCI1QyDx/Du/7o0duv4vumHSoaBU1zsp49qnFoWdbParRkvdrb0H
	On89CYgFcWw3f6Rng3EO6Pt5HldUxTqRf1qYB73mJ6712BD7j2B9alOcgQpav1q0U+dl
	FcJh2ltjHuh8MwLOhUj9bI0PywYOqFshIAGjhRdcCaoAl1XC4Yo/J2GqNLzC/gncYLaM
	x6vGD5Jk6S29/sIeGQWJ1pGP3PBomqTs6F2p4ELZy8nnqIEtb6aQYaFnv9Hwu7Bh206S
	BLHX0KIBqGuRrAXqvvrBSY7zhLwQsYpW3eadc+WPXVTP5aIN0ykg8AnjHjlImsf63O+Z
	20Uw==
X-Gm-Message-State: ALoCoQlAg982KGyGwi/Ir2P2pFaxS4nIQeblpDzRE2JPh7YHFZAgXJmzqAtULK6RIdXuPntsKdzm
X-Received: by 10.50.43.161 with SMTP id x1mr5175334igl.64.1447447486873; Fri,
	13 Nov 2015 12:44:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 13 Nov 2015 12:44:27 -0800 (PST)
In-Reply-To: <cover.1447224734.git.alejandro.hernandez@linux.intel.com>
References: <cover.1447224734.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Nov 2015 20:44:27 +0000
Message-ID: <CAJTo0LaE+fVE5qyH05JeW6HjJuVTGs4AG9awhPW_ozQTyoTe=w@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Nov 2015 20:44:50 -0000
Content-Type: multipart/alternative; boundary=089e0111bffe495b7e0524722100

--089e0111bffe495b7e0524722100
Content-Type: text/plain; charset=UTF-8

On 11 November 2015 at 06:57, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> Upgrades from python 3.4.3 to python 3.5, rebases some patches,
> modifies the related classes accordingly and also fixes
> an issue with python3-pip
>
This failed on the autobuilder in the world-lsb target:

| ./Programs/_freeze_importlib \
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.5.0-r1.0/Python-3.5.0/Lib/importlib/_bootstrap.py
Python/importlib.h
| ./Programs/_freeze_importlib \
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.5.0-r1.0/Python-3.5.0/Lib/importlib/_bootstrap_external.py
Python/importlib_external.h
| ./Programs/_freeze_importlib: error while loading shared libraries:
libz.so.1: cannot open shared object file: No such file or directory
| ./Programs/_freeze_importlib: error while loading shared libraries:
libz.so.1: cannot open shared object file: No such file or directory

Considering zlib is a DEPENDS I have no idea why this happens. :(

Ross

--089e0111bffe495b7e0524722100
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2015 at 06:57, Alejandro Hernandez <span dir=3D"ltr">&lt;<a =
href=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">aleja=
ndro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div id=3D":2bv" class=3D"" style=3D"overflow:hidden">Upgrades from <span c=
lass=3D"">python</span> 3.4.3 to <span class=3D"">python</span> 3.5, rebase=
s some patches,<br>
modifies the related classes accordingly and also fixes<br>
an issue with python3-pip<br></div></blockquote></div>This failed on the au=
tobuilder in the world-lsb target:<br><br>| ./Programs/_freeze_importlib \<=
br>| 		/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/bui=
ld/build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.5.0-r1.0/Python-3.5=
.0/Lib/importlib/_bootstrap.py Python/importlib.h<br>| ./Programs/_freeze_i=
mportlib \<br>| 		/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-wo=
rld-lsb/build/build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.5.0-r1.0=
/Python-3.5.0/Lib/importlib/_bootstrap_external.py Python/importlib_externa=
l.h<br>| ./Programs/_freeze_importlib: error while loading shared libraries=
: libz.so.1: cannot open shared object file: No such file or directory<br>|=
 ./Programs/_freeze_importlib: error while loading shared libraries: libz.s=
o.1: cannot open shared object file: No such file or directory<br></div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Considering zl=
ib is a DEPENDS I have no idea why this happens. :(</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0111bffe495b7e0524722100--
