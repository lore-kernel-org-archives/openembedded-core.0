Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 098F560049
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 20:12:37 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id n21so698828qta.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 13:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UzaDLI72Fms0dfA0agz0bdTITOtpAKUI/hKhjobGQvY=;
	b=jpjKpQ/sJtBCAgUAw8wA22VdSLV5Tm+UmYEAxu1ISvnOnZrth93JYY11pyhmwiOzt1
	4aLhqaUNmJ1D7CAmX7PYi8Y/ax4Pp3wjOcc1IK49sxPp+AZ/f+tICsHQ0H1OwZjibMGF
	sL+3IwvZlnqzBVJbNO2ZB46Xx7IC5eFLcPYX1U93+vQ/OmPvrknUzUEUSbTimcFp1IES
	Dzeoy765vJpNbSzPW9YT9Bq6x5QpIiInHVv4Iqy5qxLgytW+pze70/46Zw7xR/U/QC3j
	1HGSbv2GPOaDZRPfUpdQBYd79MY5g8kDA/CYjNNCdAKTeCca1tHocR1sjGxGE86b/X/2
	iGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UzaDLI72Fms0dfA0agz0bdTITOtpAKUI/hKhjobGQvY=;
	b=P1qfNRi9CIRNzqN45FEX+b60hg1pH0bhH0L50jdzvTC6ibNbfk8vhqC59ZeK/Xzp9v
	9+XZlrKQP2BmQHlet4S4EtlYkFll3O1vc7opbAzYobjprtJ+YNNK87Exw7/BfHTLztCv
	MiR/Uchgh/YdewotDZrcTBbG4h7YvULEK/HIJ34ObjMgPz5JqSKrsy7UxA0HOnbf3k0f
	WcvMQit+/FKLg8jVzq4fTcBr++HvqUBkOEuZ13dh+sQd/CylamVv0Us+S/ZF9vLmKjDX
	3MfG+MSzvY9ePxrxKPE60GBTSRhlUpubd8YNpGTimfTLYkyEFYosY3MJxOiIkcaH1rrs
	iA0g==
X-Gm-Message-State: AFeK/H1fQh4HFjwFkNn/NRTOcddJpDsW3yslV/7Hx9gvwgfdnpMzaKNYgpTWcQKY1ECAePyR+gZb6jK6Poe79LFr
X-Received: by 10.237.33.69 with SMTP id 63mr9575769qtc.109.1490386358612;
	Fri, 24 Mar 2017 13:12:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 24 Mar 2017 13:12:18 -0700 (PDT)
In-Reply-To: <20170324163731.12769-1-alexander.kanavin@linux.intel.com>
References: <20170324163731.12769-1-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Mar 2017 20:12:18 +0000
Message-ID: <CAJTo0LbXz-Yre9xw5=qFdXfeBg+qoTErUPdYauUP+3YsnErkZA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf: move the entire dnf/rpm4 stack to Python 3
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
X-List-Received-Date: Fri, 24 Mar 2017 20:12:38 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc87bc9ef054b7f9dda

--94eb2c0c7fc87bc9ef054b7f9dda
Content-Type: text/plain; charset=UTF-8

On 24 March 2017 at 16:37, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

>  ...ython-pygpgme_0.3.bb => python3-pygpgme_0.3.bb} |   6 +-
>

For some reason this didn't build here.

| x86_64-poky-linux-gcc -m64 -march=corei7 -mtune=corei7 -mfpmath=sse
-msse4.2
--sysroot=/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0/recipe-sysroot
-shared -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-fstack-protector-strong -Wl,-z,relro,-z,now -O2 -pipe -g
-feliminate-unused-debug-types
-fdebug-prefix-map=/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0=/usr/src/debug/python3-pygpgme/0.3-r0
-fdebug-prefix-map=/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0/recipe-sysroot-native=
-fdebug-prefix-map=/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0/recipe-sysroot=
-fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
build/temp.linux-x86_64-3.5/src/gpgme.o
build/temp.linux-x86_64-3.5/src/pygpgme-error.o
build/temp.linux-x86_64-3.5/src/pygpgme-data.o
build/temp.linux-x86_64-3.5/src/pygpgme-context.o
build/temp.linux-x86_64-3.5/src/pygpgme-key.o
build/temp.linux-x86_64-3.5/src/pygpgme-signature.o
build/temp.linux-x86_64-3.5/src/pygpgme-import.o
build/temp.linux-x86_64-3.5/src/pygpgme-keyiter.o
build/temp.linux-x86_64-3.5/src/pygpgme-constants.o
build/temp.linux-x86_64-3.5/src/pygpgme-genkey.o -lgpgme -o
build/lib.linux-x86_64-3.5/gpgme/_gpgme.cpython-35m-x86_64-linux-gnu.so
|
/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0/recipe-sysroot/usr/lib/../lib/Scrt1.o:
In function `_start':
| /usr/src/debug/glibc/2.25-r0/git/csu/../sysdeps/x86_64/start.S:104:
undefined reference to `main'
| build/temp.linux-x86_64-3.5/src/gpgme.o: In function `create_module':
| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src/gpgme.c:44:
undefined reference to `PyExc_RuntimeError'
| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src/gpgme.c:44:
undefined reference to `PyErr_NewException'
| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src/gpgme.c:61:
undefined reference to `PyType_Ready'
| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src/gpgme.c:62:
undefined reference to `PyType_Ready'
| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src/gpgme.c:63:
undefined reference to `PyType_Ready'
| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src/gpgme.c:64:
undefined reference to `PyType_Ready'
| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src/gpgme.c:65:
undefined reference to `PyType_Ready'

(and pages more)

Ross

--94eb2c0c7fc87bc9ef054b7f9dda
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 March 2017 at 16:37, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D=
"gmail-:16l" class=3D"gmail-a3s gmail-aXjCH gmail-m15b012f31ae06b4f">=C2=A0=
...<a href=3D"http://ython-pygpgme_0.3.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ython-pygpgme_0.3.bb</a> =3D&gt; <a href=3D"http://python3-pygpgme_0.3=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygpgme_0.3.bb</a>} |=C2=
=A0 =C2=A06 +-<br></div></blockquote></div><br>For some reason this didn&#3=
9;t build here.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra"><div class=3D"gmail_extra">| x86_64-poky-linux-gcc -m64 -march=3D=
corei7 -mtune=3Dcorei7 -mfpmath=3Dsse -msse4.2 --sysroot=3D/data/poky-maste=
r/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0/recipe-sysroot -shar=
ed -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector-strong =
-Wl,-z,relro,-z,now -O2 -pipe -g -feliminate-unused-debug-types -fdebug-pre=
fix-map=3D/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0=
.3-r0=3D/usr/src/debug/python3-pygpgme/0.3-r0 -fdebug-prefix-map=3D/data/po=
ky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0/recipe-sysro=
ot-native=3D -fdebug-prefix-map=3D/data/poky-master/tmp/work/corei7-64-poky=
-linux/python3-pygpgme/0.3-r0/recipe-sysroot=3D -fstack-protector-strong -p=
ie -fpie -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-=
security build/temp.linux-x86_64-3.5/src/gpgme.o build/temp.linux-x86_64-3.=
5/src/pygpgme-error.o build/temp.linux-x86_64-3.5/src/pygpgme-data.o build/=
temp.linux-x86_64-3.5/src/pygpgme-context.o build/temp.linux-x86_64-3.5/src=
/pygpgme-key.o build/temp.linux-x86_64-3.5/src/pygpgme-signature.o build/te=
mp.linux-x86_64-3.5/src/pygpgme-import.o build/temp.linux-x86_64-3.5/src/py=
gpgme-keyiter.o build/temp.linux-x86_64-3.5/src/pygpgme-constants.o build/t=
emp.linux-x86_64-3.5/src/pygpgme-genkey.o -lgpgme -o build/lib.linux-x86_64=
-3.5/gpgme/_<a href=3D"http://gpgme.cpython-35m-x86_64-linux-gnu.so">gpgme.=
cpython-35m-x86_64-linux-gnu.so</a></div><div class=3D"gmail_extra">| /data=
/poky-master/tmp/work/corei7-64-poky-linux/python3-pygpgme/0.3-r0/recipe-sy=
sroot/usr/lib/../lib/Scrt1.o: In function `_start&#39;:</div><div class=3D"=
gmail_extra">| /usr/src/debug/glibc/2.25-r0/git/csu/../sysdeps/x86_64/start=
.S:104: undefined reference to `main&#39;</div><div class=3D"gmail_extra">|=
 build/temp.linux-x86_64-3.5/src/gpgme.o: In function `create_module&#39;:<=
/div><div class=3D"gmail_extra">| /usr/src/debug/python3-pygpgme/0.3-r0/pyg=
pgme-0.3/src/gpgme.c:44: undefined reference to `PyExc_RuntimeError&#39;</d=
iv><div class=3D"gmail_extra">| /usr/src/debug/python3-pygpgme/0.3-r0/pygpg=
me-0.3/src/gpgme.c:44: undefined reference to `PyErr_NewException&#39;</div=
><div class=3D"gmail_extra">| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme=
-0.3/src/gpgme.c:61: undefined reference to `PyType_Ready&#39;</div><div cl=
ass=3D"gmail_extra">| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src=
/gpgme.c:62: undefined reference to `PyType_Ready&#39;</div><div class=3D"g=
mail_extra">| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src/gpgme.c=
:63: undefined reference to `PyType_Ready&#39;</div><div class=3D"gmail_ext=
ra">| /usr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src/gpgme.c:64: und=
efined reference to `PyType_Ready&#39;</div><div class=3D"gmail_extra">| /u=
sr/src/debug/python3-pygpgme/0.3-r0/pygpgme-0.3/src/gpgme.c:65: undefined r=
eference to `PyType_Ready&#39;</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">(and pages more)</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div></div>

--94eb2c0c7fc87bc9ef054b7f9dda--
