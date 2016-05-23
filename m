Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id E63F76072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:31:09 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id u5so4964592igk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 06:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=er8Utn+xEtWsm8nxqJxuB4WhAgeHLRf8ZRyj79bNNiw=;
	b=pi5RU02smwSrrtVhMKysuUB/t4j9uQrDgHe5eF7fbdu1iGt9WF1X0YiMsvp5K9SBcc
	LsIzmLhHiPsbFFPBRULDSMkcnvaZAPKwtKjUUF9kU9N18PybsSSKRS87oF4I0i55f6Mh
	ELhYZ/eQB2PR1AvbhS0DEojvhaHc33kXzXTHZmjHv+kDwLb01G4tuRXTLjOqPvZDclA5
	XDmLH4Gq31SXwqsTCVUEgsH1re0ZNceGULHiFc3jufwZTbJ/oXgPY8QrR7Xz3h0zXSEY
	05Wa03U4CJgHviS7RJvm1uLcF09v09R8Ydyb7fgo8HxYsGrglI0p/0jOXCfY3OJr8iZ7
	f7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=er8Utn+xEtWsm8nxqJxuB4WhAgeHLRf8ZRyj79bNNiw=;
	b=jXvhN35pCPYueknkS1ts07vsrQxRtnlWEWBei858QajHQaLKgqNKStgUEpEJJ9weef
	2rHonQG4YAJ4OsUJFV4SEr0375wHnrjEJqe2IoB68bVuMbGkVNNz/jqCwKF5MPBHeMPc
	r1l+8t7wdi8d58BZNnZ3ESpNwoBuPRUz2mLtQtEB/MCHB5p4PP5IT7FuySQ9cTs5JbpN
	1wSO9Ssebyvgb72Dg39zdy2ZuUT9UJLDY/5+ZZml1rOhgzVtxKyjZOKkuWliw40qJTFN
	tJBpjYu+1yftZH2+81iDfEgJEizfza2kr9KJv5CEbhdLLmTNbhoiWE2g1mI/pUphX5ff
	ZGFw==
X-Gm-Message-State: AOPr4FVIiej+5SNJBfZlLRIFi/CaQxo78utwlqJEr9JSQq5OD18gSB5JXXLd6BHS0kFqcDX5
X-Received: by 10.50.112.42 with SMTP id in10mr12172106igb.67.1464010270120;
	Mon, 23 May 2016 06:31:10 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DF24.dip0.t-ipconnect.de. [93.232.223.36])
	by smtp.gmail.com with ESMTPSA id x83sm3843429itf.2.2016.05.23.06.31.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 May 2016 06:31:09 -0700 (PDT)
Message-ID: <1464010266.3095.41.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 May 2016 15:31:06 +0200
In-Reply-To: <CAMKF1sozc-Xjvd_CPAT5DEeE=oNmqRnWV+qk0QDuq+4S=rk0Wg@mail.gmail.com>
References: <e889a21f09e4bcbddd05ee90a914600d33540dfa.1462489051.git.chris_larson@mentor.com>
	<1463763860-4124-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sozc-Xjvd_CPAT5DEeE=oNmqRnWV+qk0QDuq+4S=rk0Wg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 23 May 2016 13:31:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-05-23 at 04:52 +0000, Khem Raj wrote:
> I am getting these errors with clang now
>=20
>=20
> http://errors.yoctoproject.org/Errors/Details/64935/

And I am getting the same link error also during normal builds for
Beaglebone (but not other platforms):

https://ostroproject.org/jenkins/job/build_beaglebone/1663/console
...
arm-ostro-linux-gnueabi-gcc  -march=3Darmv7-a -mfpu=3Dneon  -mfloat-abi=3Dh=
ard -mcpu=3Dcortex-a8 --sysroot=3D/var/lib/jenkins/ostro-worker-17-slot-1-J=
opZL/ostro-os/build/tmp-glibc/sysroots/beaglebone -O2 -pipe -g -feliminate-=
unused-debug-types -fdebug-prefix-map=3D/var/lib/jenkins/ostro-worker-17-sl=
ot-1-JopZL/ostro-os/build/tmp-glibc/work/cortexa8hf-neon-ostro-linux-gnueab=
i/mkelfimage/4.0+gitAUTOINC+686a48a339-r0=3D/usr/src/debug/mkelfimage/4.0+g=
itAUTOINC+686a48a339-r0 -fdebug-prefix-map=3D/var/lib/jenkins/ostro-worker-=
17-slot-1-JopZL/ostro-os/build/tmp-glibc/sysroots/x86_64-linux=3D -fdebug-p=
refix-map=3D/var/lib/jenkins/ostro-worker-17-slot-1-JopZL/ostro-os/build/tm=
p-glibc/sysroots/beaglebone=3D  -fstack-protector-strong -pie -fpie -D_FORT=
IFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -fno-st=
ack-protector -Wall -DVERSION=3D'"2.7"' -DRELEASE_DATE=3D'"27 March 2006"' =
-I include -DPACKAGE_NAME=3D\"\" -DPACKAGE_TARNAME=3D\"\" -DPACKAGE_VERSION=
=3D\"\" -DPACKAGE_STRING=3D\"\" -DPACKAGE_BUGREPORT=3D\"\" -DPACKAGE_URL=3D=
\"\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE=
_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 =
-DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_ZLIB_H=
=3D1 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fstack-protector-stron=
g -Wl,-z,relro,-z,now objdir/main/mkelfImage.o objdir/linux-i386/mkelf-linu=
x-i386.o objdir/linux-ia64/mkelf-linux-ia64.o -o objdir/sbin/mkelfImage -lz
/var/lib/jenkins/ostro-worker-17-slot-1-JopZL/ostro-os/build/tmp-glibc/sysr=
oots/x86_64-linux/usr/bin/arm-ostro-linux-gnueabi/../../libexec/arm-ostro-l=
inux-gnueabi/gcc/arm-ostro-linux-gnueabi/5.3.0/ld: objdir/linux-i386/mkelf-=
linux-i386.o: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not=
 be used when making a shared object; recompile with -fPIC
objdir/linux-i386/mkelf-linux-i386.o: error adding symbols: Bad value
collect2: error: ld returned 1 exit status
main/Makefile:6: recipe for target 'objdir/sbin/mkelfImage' failed
...

Reverting the commit fixes that, so can we just do that in OE-core
master while the problem gets sorted out?

--=20
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




