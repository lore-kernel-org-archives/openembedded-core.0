Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 759A27761E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 11:57:58 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id v125so87613933qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 03:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SZdn4mvO7+FNQN7J8U/Ya0yqHPJ/QKUA+uTGoATQTao=;
	b=G+G4z+O9qqmUDPRPet3YEa+n50zodmree1WaLUkbzf/F2lNrdf5u/UFKea5Ug141fl
	GUNZLqg6MVhwPCmWmoqT+7jXuSnnF5qJf1IrM5+qxOqFsp0mI2+OnMI6PO5nlXOilNRu
	YR6UA3G4pcZQVc1m5Gn54KnuHXrkc7WuZbKyincf+g66tCZJ5jKRjfx0oy1+qc7FaxX5
	1RALE+ZMJlCTLkm2NUPhGAxMKIPmh2fZzMk7gYBEeHMOWzEelLWUq1gACJ1v/PIDAnMS
	geVm6buQOuoL/6eQD+mdE/w2eIi4dS/XI08OK9SsQSTcP0JBg6cMaOvGqkMlN7nW++jS
	5vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SZdn4mvO7+FNQN7J8U/Ya0yqHPJ/QKUA+uTGoATQTao=;
	b=Yjdtp65Uhz0VJ2TxMqSw6+/tmbkNe6DDJESJ3xQsWuTGHMxzjLqw+2/W8e0jfeSkVW
	E+LZSn5Dw9nKioXD3aEEbaYcqMQz6QI2ojD4S74tP2wmvH3hwsSD3CAC/mrlUUa6eIsg
	bAZtQPqQxgRF4uzppSIYhvRUPnsXuSuPIS1FkdZHv++j+6x9NO2uDdp3bCP54AzjaWwY
	NY5Rs2bD8BaUOgYwiMrkvoGNDT5fAheHBjq8fYn15QykVQGb/3GCzUSjxQsm4zJ56f2K
	3wIrUhBusiNQy8p3DsLN/jkJJPrLpqTxEZS5JZfV9L13zujv5tLpT9KeYEqX6IakTT9j
	TrXQ==
X-Gm-Message-State: AMke39nn28DtIi3De6ju3bWrUVhlORLW7i+2CbJ1chlQM0rDyarpPCrYLbqtriBKJxGdiTEvL+Aaez//lFRXzjsk
X-Received: by 10.55.175.195 with SMTP id y186mr14627547qke.26.1488801479238; 
	Mon, 06 Mar 2017 03:57:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 03:57:38 -0800 (PST)
In-Reply-To: <20170306081337.23631-1-andrew.shadura@collabora.co.uk>
References: <20170306081337.23631-1-andrew.shadura@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 11:57:38 +0000
Message-ID: <CAJTo0LYO5CyocgoqBjBw5nzzsT-vbcvX-c_UL-MUc+4vjfAE=g@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ghostscript: build and install libgs
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
X-List-Received-Date: Mon, 06 Mar 2017 11:57:59 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c4fb67f054a0e9bfa

--94eb2c06093c4fb67f054a0e9bfa
Content-Type: text/plain; charset=UTF-8

On 6 March 2017 at 08:13, Andrew Shadura <andrew.shadura@collabora.co.uk>
wrote:

> Build and install libgs library, which is a build dependency
> of a few other libraries, such as libspectre.
>
> We don't want to ship the executable binaries, only the library and its
> headers, hence oe_runmake install-so + rm -rf, not e.g. oe_libinstall.
>

This fails when security flags are enabled:

|
/data/poky-master/tmp/work/corei7-64-poky-linux/ghostscript/9.20-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/6.3.0/ld:
./soobj/ttfmain.o: relocation R_X86_64_PC32 against symbol
`st_ttfInterpreter' can not be used when making a shared object; recompile
with -fPIC
|
/data/poky-master/tmp/work/corei7-64-poky-linux/ghostscript/9.20-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/6.3.0/ld:
final link failed: Bad value

Ross

--94eb2c06093c4fb67f054a0e9bfa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2017 at 08:13, Andrew Shadura <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:andrew.shadura@collabora.co.uk" target=3D"_blank">andrew.shadura@coll=
abora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:q3"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m15aa2af2920efb00">Build and install =
libgs library, which is a build dependency<br>
of a few other libraries, such as libspectre.<br>
<br>
We don&#39;t want to ship the executable binaries, only the library and its=
<br>
headers, hence oe_runmake install-so + rm -rf, not e.g. oe_libinstall.</div=
></blockquote></div><div class=3D"gmail_extra"><br></div>This fails when se=
curity flags are enabled:</div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_extra">| /data/poky-master/tmp/work/corei7-64-poky-linux/ghostscript=
/9.20-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_=
64-poky-linux/gcc/x86_64-poky-linux/6.3.0/ld: ./soobj/ttfmain.o: relocation=
 R_X86_64_PC32 against symbol `st_ttfInterpreter&#39; can not be used when =
making a shared object; recompile with -fPIC</div><div class=3D"gmail_extra=
">| /data/poky-master/tmp/work/corei7-64-poky-linux/ghostscript/9.20-r0/rec=
ipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linu=
x/gcc/x86_64-poky-linux/6.3.0/ld: final link failed: Bad value</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></=
div>

--94eb2c06093c4fb67f054a0e9bfa--
