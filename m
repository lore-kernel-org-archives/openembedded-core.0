Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC7A60290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:01:47 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id l63so6177765ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pz8IloBCgARs+XeiHVVvmc5uWp4AFJF/gRyJ700uRC0=;
	b=0m4zJ7r4E8RqRzSVYzgnVi569ZEuixaPFJ6N4DuKvvUdNm+JQzTYWrmewKvSAd4bcS
	/u41N/j5o6iBLAQ2seFIIivnM2hSbTgvefGcID3jImbiFAg3eS2aNrLntRxQ3e23Rxu1
	89QKaDNnCVXfOEBn4an9Ru3AG6NFNTVWJYTkBwzSWtjEULDfosWBWo+PY1YgqFCYA9uI
	qztCDF2c1FC/jWKqi8SswkGmtyNQrZtER611SjlaJ0DgLqYEr6BqOgGnsMa/y5n1gdgR
	qbMpPW0CcygeI/Auc6sKqvnKdk3S4UcinuTOZF2lb3oDOAna87XsLlnDV6cqg717kLmR
	9LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pz8IloBCgARs+XeiHVVvmc5uWp4AFJF/gRyJ700uRC0=;
	b=kimt1TF6kmvV3RP2Wb7EVW/FtphVVZGyaPKji1sKywoOQT4zfHGUuFONn8AbffzPNh
	IURhef55Gxi5CsSWTutkF8TbxdMgXfR0HaazYDnSFT4QPCUqLYB86ZShhLAbrNCsCnxj
	U5f2jzI0Fjk4kREZEKt68iQhw/0pjVit3ffQuIGr01qQw66vs7lN/tILEg1E4g0ozwhP
	/qCGBHAggMf6iLBpb7FRvm3pkHBN4hOQDG1Al8Zcy3s1aetLXrathetNLKjVXVfByEWM
	yVJr3FFeMBE/6lmxq+WSJwGTCKNUoEyi0h41lcIoREzab+m/Vf59qzq2pntCKfWisfI1
	XY4w==
X-Gm-Message-State: AOPr4FUQqqquB4U04W9t+93Cd1rK9VbJ4gO3fhoO0xDubDQ++R1ho3VEeXFtZe/YYoGLSXtm7Eb6qCbtem6RhA==
X-Received: by 10.36.41.11 with SMTP id p11mr14884456itp.66.1464033708361;
	Mon, 23 May 2016 13:01:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.5 with HTTP; Mon, 23 May 2016 13:01:28 -0700 (PDT)
In-Reply-To: <1464010266.3095.41.camel@intel.com>
References: <e889a21f09e4bcbddd05ee90a914600d33540dfa.1462489051.git.chris_larson@mentor.com>
	<1463763860-4124-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sozc-Xjvd_CPAT5DEeE=oNmqRnWV+qk0QDuq+4S=rk0Wg@mail.gmail.com>
	<1464010266.3095.41.camel@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 23 May 2016 13:01:28 -0700
Message-ID: <CABcZANnZ_CEGHFTh66iRDM_K6zEa=Zns1+2t9w2qFYcpfYH5JQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] mkelfimage: obey LDFLAGS, sort out HOST_ flags
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
X-List-Received-Date: Mon, 23 May 2016 20:01:49 -0000
Content-Type: multipart/alternative; boundary=001a1143fd70205514053387e98b

--001a1143fd70205514053387e98b
Content-Type: text/plain; charset=UTF-8

On Mon, May 23, 2016 at 6:31 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Mon, 2016-05-23 at 04:52 +0000, Khem Raj wrote:
> > I am getting these errors with clang now
> >
> >
> > http://errors.yoctoproject.org/Errors/Details/64935/
>
> And I am getting the same link error also during normal builds for
> Beaglebone (but not other platforms):
>
> https://ostroproject.org/jenkins/job/build_beaglebone/1663/console
> ...
> arm-ostro-linux-gnueabi-gcc  -march=armv7-a -mfpu=neon  -mfloat-abi=hard
> -mcpu=cortex-a8
> --sysroot=/var/lib/jenkins/ostro-worker-17-slot-1-JopZL/ostro-os/build/tmp-glibc/sysroots/beaglebone
> -O2 -pipe -g -feliminate-unused-debug-types
> -fdebug-prefix-map=/var/lib/jenkins/ostro-worker-17-slot-1-JopZL/ostro-os/build/tmp-glibc/work/cortexa8hf-neon-ostro-linux-gnueabi/mkelfimage/4.0+gitAUTOINC+686a48a339-r0=/usr/src/debug/mkelfimage/4.0+gitAUTOINC+686a48a339-r0
> -fdebug-prefix-map=/var/lib/jenkins/ostro-worker-17-slot-1-JopZL/ostro-os/build/tmp-glibc/sysroots/x86_64-linux=
> -fdebug-prefix-map=/var/lib/jenkins/ostro-worker-17-slot-1-JopZL/ostro-os/build/tmp-glibc/sysroots/beaglebone=
> -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security -fno-stack-protector -Wall
> -DVERSION='"2.7"' -DRELEASE_DATE='"27 March 2006"' -I include
> -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\"
> -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\"
> -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1
> -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1
> -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_ZLIB_H=1 -Wl,-O1
> -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong
> -Wl,-z,relro,-z,now objdir/main/mkelfImage.o
> objdir/linux-i386/mkelf-linux-i386.o objdir/linux-ia64/mkelf-linux-ia64.o
> -o objdir/sbin/mkelfImage -lz
> /var/lib/jenkins/ostro-worker-17-slot-1-JopZL/ostro-os/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/arm-ostro-linux-gnueabi/../../libexec/arm-ostro-linux-gnueabi/gcc/arm-ostro-linux-gnueabi/5.3.0/ld:
> objdir/linux-i386/mkelf-linux-i386.o: relocation R_ARM_MOVW_ABS_NC against
> `a local symbol' can not be used when making a shared object; recompile
> with -fPIC
> objdir/linux-i386/mkelf-linux-i386.o: error adding symbols: Bad value
> collect2: error: ld returned 1 exit status
> main/Makefile:6: recipe for target 'objdir/sbin/mkelfImage' failed
> ...
>
> Reverting the commit fixes that, so can we just do that in OE-core
> master while the problem gets sorted out?


I'll submit a revert patch to the list for now, unless someone gets to it
sooner. Thanks for the feedback.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143fd70205514053387e98b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, May 23, 2016 at 6:31 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"=
mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mo=
n, 2016-05-23 at 04:52 +0000, Khem Raj wrote:<br>
&gt; I am getting these errors with clang now<br>
&gt;<br>
&gt;<br>
&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/64935/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Det=
ails/64935/</a><br>
<br>
</span>And I am getting the same link error also during normal builds for<b=
r>
Beaglebone (but not other platforms):<br>
<br>
<a href=3D"https://ostroproject.org/jenkins/job/build_beaglebone/1663/conso=
le" rel=3D"noreferrer" target=3D"_blank">https://ostroproject.org/jenkins/j=
ob/build_beaglebone/1663/console</a><br>
...<br>
arm-ostro-linux-gnueabi-gcc=C2=A0 -march=3Darmv7-a -mfpu=3Dneon=C2=A0 -mflo=
at-abi=3Dhard -mcpu=3Dcortex-a8 --sysroot=3D/var/lib/jenkins/ostro-worker-1=
7-slot-1-JopZL/ostro-os/build/tmp-glibc/sysroots/beaglebone -O2 -pipe -g -f=
eliminate-unused-debug-types -fdebug-prefix-map=3D/var/lib/jenkins/ostro-wo=
rker-17-slot-1-JopZL/ostro-os/build/tmp-glibc/work/cortexa8hf-neon-ostro-li=
nux-gnueabi/mkelfimage/4.0+gitAUTOINC+686a48a339-r0=3D/usr/src/debug/mkelfi=
mage/4.0+gitAUTOINC+686a48a339-r0 -fdebug-prefix-map=3D/var/lib/jenkins/ost=
ro-worker-17-slot-1-JopZL/ostro-os/build/tmp-glibc/sysroots/x86_64-linux=3D=
 -fdebug-prefix-map=3D/var/lib/jenkins/ostro-worker-17-slot-1-JopZL/ostro-o=
s/build/tmp-glibc/sysroots/beaglebone=3D=C2=A0 -fstack-protector-strong -pi=
e -fpie -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-s=
ecurity -fno-stack-protector -Wall -DVERSION=3D&#39;&quot;2.7&quot;&#39; -D=
RELEASE_DATE=3D&#39;&quot;27 March 2006&quot;&#39; -I include -DPACKAGE_NAM=
E=3D\&quot;\&quot; -DPACKAGE_TARNAME=3D\&quot;\&quot; -DPACKAGE_VERSION=3D\=
&quot;\&quot; -DPACKAGE_STRING=3D\&quot;\&quot; -DPACKAGE_BUGREPORT=3D\&quo=
t;\&quot; -DPACKAGE_URL=3D\&quot;\&quot; -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPE=
S_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAV=
E_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=
=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_ZLIB_H=3D1 -Wl,-O1 -Wl,--hash-style=3Dgnu -=
Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now objdir/main/mke=
lfImage.o objdir/linux-i386/mkelf-linux-i386.o objdir/linux-ia64/mkelf-linu=
x-ia64.o -o objdir/sbin/mkelfImage -lz<br>
/var/lib/jenkins/ostro-worker-17-slot-1-JopZL/ostro-os/build/tmp-glibc/sysr=
oots/x86_64-linux/usr/bin/arm-ostro-linux-gnueabi/../../libexec/arm-ostro-l=
inux-gnueabi/gcc/arm-ostro-linux-gnueabi/5.3.0/ld: objdir/linux-i386/mkelf-=
linux-i386.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol&#39; can=
 not be used when making a shared object; recompile with -fPIC<br>
objdir/linux-i386/mkelf-linux-i386.o: error adding symbols: Bad value<br>
collect2: error: ld returned 1 exit status<br>
main/Makefile:6: recipe for target &#39;objdir/sbin/mkelfImage&#39; failed<=
br>
...<br>
<br>
Reverting the commit fixes that, so can we just do that in OE-core<br>
master while the problem gets sorted out?</blockquote><div><br></div><div>I=
&#39;ll submit a revert patch to the list for now, unless someone gets to i=
t sooner. Thanks for the feedback.</div></div>-- <br><div class=3D"gmail_si=
gnature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br=
>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senio=
r Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1143fd70205514053387e98b--
