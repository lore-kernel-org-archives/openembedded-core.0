Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 494D36FFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:41:21 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id q21so86828972iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lVkykDLIRB3vMj4ABLd9997H61oxAiwluJfCV+/WFLg=;
	b=p4g4x9t/Qbo1bssn6D9Us7MvQJhZr1Pht58Lpfi5bYaXaRHnOoTqTFTyP+d0O1iVR8
	BAAcgfhS46ZEEli9ADRVHgb8byBu5cSffd5Zq7lNm9kiXjrw07MEZaJCM/apCoH6vB0j
	z2kSKIHZS8Z+jG8pPlsvuXUdiYSD8+DFAkJGJz0edyjn+Zn48SsZXvCmc6bJgHC3AseT
	LezfSICCzPpm96wXkClmxYOcoyJIVzdj63CqYvMaipM/dEWeFoiz2Fyl6V4NqUotweYV
	RR/5678DBgrQvW+I6qJaYId8p0O2seEs2FhzQChNs8uigoz/6FrZYvlKd/o+oQRAsNp+
	rpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lVkykDLIRB3vMj4ABLd9997H61oxAiwluJfCV+/WFLg=;
	b=llno+H48ntvPmRFaSdS4QoN+r/ZDxkqlT5cWb2MGlImhVRWF2qZe+M0qr6Gw8aKsvg
	G79W29vastd/GNj7D6voV451wb+K6Yik25Rfb1irOCtDCUNwJbdQXcTmtLHkCaiKniha
	yvYKGd92Zrm3BCMihhv1V7UufoxNiHE5OTUkj+sHTu8BsSBboe1rLTBU9ChAhPKlJ3JI
	DPoK3px931jB8KvKHumizlGjWN0ArEv7PKowiQGVAXc/Hg6bxGtu2/zgfIqgGgoNh0bp
	9u0RExxOq1G9V2oscZJH8XgJcajHnzAs0oZbrO2HHQ6oDzt/2FAY3WRsc2Wasy64Ty17
	wo+Q==
X-Gm-Message-State: AG10YOSgdIhK/KMA9sl5F3dmfDi8Tzy6HDKiq5fTwCQtIsPIfnIPbkTlR2XgZcU+YI//dhjyQer6Yri92manBZuk
X-Received: by 10.107.164.161 with SMTP id d33mr3133625ioj.148.1453466482119; 
	Fri, 22 Jan 2016 04:41:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 04:41:02 -0800 (PST)
In-Reply-To: <a430918d3d3c0fe58d3cc8ea3d8178e3980c571e.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<a430918d3d3c0fe58d3cc8ea3d8178e3980c571e.1453029952.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 12:41:02 +0000
Message-ID: <CAJTo0LZa9oM8gpqcG7baZa30gree1ijxJsdj9Y1-YttxZ3OqYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 51/73] db: Use cross libtool
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
X-List-Received-Date: Fri, 22 Jan 2016 12:41:24 -0000
Content-Type: multipart/alternative; boundary=001a1141c9765c2d1a0529eb89d4

--001a1141c9765c2d1a0529eb89d4
Content-Type: text/plain; charset=UTF-8

On 17 January 2016 at 11:36, Khem Raj <raj.khem@gmail.com> wrote:

> db is not reconfigured like usual autotools based components so it
> generates its own libtool, and this libtool is not equipped to do cross
> builds, e.g. when building using clang on musl, it misdirects linker to
> use libstdc++.so from build host instead of target, the reason being it
> does not understand sysroot.
>
> Use cross libtool instead to build the target versions
>
> Fixes errors like below
>
> | libtool: link: arm-oe-linux-musleabi-ranlib .libs/libdb-6.0.a
> |
>
> /a/builder/mnt/build-oe/tmp-musl/sysroots/x86_64-linux/usr/bin/arm-oe-linux-musleabi/arm-oe-linux-musleabi-ld:
> error: /usr/lib/libstdc++.so: incompatible target


This fails to build on the autobuilder in poky-lsb configurations (which
turns on securityflags.inc):

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/sysroots/qemux86/usr/lib/libc_nonshared.a(elf-init.oS):
In function `__libc_csu_init':
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/i586-poky-linux/glibc/2.22-r0/git/csu/elf-init.c:87:
undefined reference to `__init_array_start'
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/5.3.0/ld:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/sysroots/qemux86/usr/lib/libc_nonshared.a(elf-init.oS):
relocation R_386_GOTOFF against undefined hidden symbol
`__init_array_start' can not be used when making a shared object
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/5.3.0/ld:
final link failed: Bad value
collect2: error: ld returned 1 exit status
Makefile:884: recipe for target 'libdb_cxx-6.0.la' failed

Ross

--001a1141c9765c2d1a0529eb89d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2016 at 11:36, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><span class=3D"">db</span> is not reconfigured l=
ike usual autotools based components so it<br>
generates its own libtool, and this libtool is not equipped to do cross<br>
builds, e.g. when building using clang on musl, it misdirects linker to<br>
use libstdc++.so from build host instead of target, the reason being it<br>
does not understand sysroot.<br>
<br>
Use cross libtool instead to build the target versions<br>
<br>
Fixes errors like below<br>
<br>
| libtool: link: arm-oe-linux-musleabi-ranlib .libs/libdb-6.0.a<br>
|<br>
/a/builder/mnt/build-oe/tmp-musl/sysroots/x86_64-linux/usr/bin/arm-oe-linux=
-musleabi/arm-oe-linux-musleabi-ld:<br>
error: /usr/lib/libstdc++.so: incompatible target</blockquote></div><br>Thi=
s fails to build on the autobuilder in poky-lsb configurations (which turns=
 on securityflags.inc):<br><br>/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-world-lsb/build/build/tmp/sysroots/qemux86/usr/lib/libc_nonshare=
d.a(elf-init.oS): In function `__libc_csu_init&#39;:<br>/home/pokybuild/yoc=
to-autobuilder/yocto-worker/nightly-world-lsb/build/build/tmp/work/i586-pok=
y-linux/glibc/2.22-r0/git/csu/elf-init.c:87: undefined reference to `__init=
_array_start&#39;<br>/home/pokybuild/yocto-autobuilder/yocto-worker/nightly=
-world-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linu=
x/gcc/i586-poky-linux/5.3.0/ld: /home/pokybuild/yocto-autobuilder/yocto-wor=
ker/nightly-world-lsb/build/build/tmp/sysroots/qemux86/usr/lib/libc_nonshar=
ed.a(elf-init.oS): relocation R_386_GOTOFF against undefined hidden symbol =
`__init_array_start&#39; can not be used when making a shared object<br>/ho=
me/pokybuild/yocto-autobuilder/yocto-worker/nightly-world-lsb/build/build/t=
mp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/5.=
3.0/ld: final link failed: Bad value<br>collect2: error: ld returned 1 exit=
 status<br>Makefile:884: recipe for target &#39;<a href=3D"http://libdb_cxx=
-6.0.la">libdb_cxx-6.0.la</a>&#39; failed</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1141c9765c2d1a0529eb89d4--
