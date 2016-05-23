Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD16605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 19:59:21 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id lp2so4209996igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 12:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oII9juJIyYOUb/Xm4s3YoKuTZdqlEJgnt+chpeQ9RFg=;
	b=lW9epQiPNcdHFZvHcZ2iitdURlNmNS9t43EvJL75aJU7EFYKjOm2fx51JRb+jMBq3/
	wDMQ5Lz00qya2a6jwncRJOvnAZKHEXgkDdAFi47E8TTS3EUV3w5SI/91uG1De7bFe/4W
	TsyjXvG6XS8PMocXvfoVPeD4BoVq/mBLxgUIt7AKhndm/hdOkc3VXDNefQPlY4m1vKTa
	HC6guixYwhg77I4i+mm000J5wmH9DQTh4jqtxvdFLoe/gm5ad7wbBZPAYtuu8D9TvjRa
	8QUFEjJhXyvaIUfx02t0AclUVX8ldEUc6b3mn+vaJQ2GbzsIqAELQ1SCTzoqqyXtpSBO
	uMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oII9juJIyYOUb/Xm4s3YoKuTZdqlEJgnt+chpeQ9RFg=;
	b=O5oDr2wfZbfaqZkXKeeC4iIP1d7hVEEOCJRz4Ezuw9BE1KN9atF+GD1ajTy06PZW8I
	5VUB0QWZ2LAQrw4xbxNi6WPaJaQNh8YNjl7G6+vvAksSJW7AptGf9wprHcYzFt2w2KD4
	lnVKHOjwdZ9ruBxBxWKAM+mG3nMEaxPP//UuxylGv86sYFhajlvZHHOKdeqoQ/KHy7P5
	TUEtlYhzILP7bzOnABfVOyH3ruemwPy24OcTw2UYQ65eNq2/Yz/M8wnoUuy+DV0DHYgm
	LFXmr2Xm4kUTc5YzLL5meGMJpArRfAOW3cL0q14w6///u+e2/PPfHzkxMgJ9QQpWCuJe
	G82A==
X-Gm-Message-State: AOPr4FX7jdK/xvtVk761Q6x2il4zLx3WXHkMe2tnvhqhnuHLphsgxoTUK8vO/doPdxDLKsJ9VBidCmC6mTVvCg==
X-Received: by 10.50.160.8 with SMTP id xg8mr14641487igb.87.1464033562568;
	Mon, 23 May 2016 12:59:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.5 with HTTP; Mon, 23 May 2016 12:59:03 -0700 (PDT)
In-Reply-To: <1464010266.3095.41.camel@intel.com>
References: <e889a21f09e4bcbddd05ee90a914600d33540dfa.1462489051.git.chris_larson@mentor.com>
	<1463763860-4124-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sozc-Xjvd_CPAT5DEeE=oNmqRnWV+qk0QDuq+4S=rk0Wg@mail.gmail.com>
	<1464010266.3095.41.camel@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 23 May 2016 12:59:03 -0700
Message-ID: <CABcZAN=Zcm901n3Lvffh2y6aUqmLtHOWz=rx5ztQK2x26cVQ1Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 23 May 2016 19:59:22 -0000
Content-Type: multipart/alternative; boundary=001a11c28f006fb4ec053387e083

--001a11c28f006fb4ec053387e083
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


I'm not opposed to reverting this, as the issue being fixed was clearly not
as bad as this result, but I'm completely unable to repro this for
beaglebone with meta-ti, either with the internal toolchain or the external
sourcery toolchain. Was this with clang, or some specific toolchain
version? Or perhaps ostro is doing something special there?
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c28f006fb4ec053387e083
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 23, 2016 at 6:31 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a =
href=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On Mon, 2016-05-23 at 04:52 +0000, Khem Raj wrote:<br>
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
&#39;m not opposed to reverting this, as the issue being fixed was clearly =
not as bad as this result, but I&#39;m completely unable to repro this for =
beaglebone with meta-ti, either with the internal toolchain or the external=
 sourcery toolchain. Was this with clang, or some specific toolchain versio=
n? Or perhaps ostro is doing something special there?</div></div>-- <br><di=
v class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth =
at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintain=
er - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a11c28f006fb4ec053387e083--
