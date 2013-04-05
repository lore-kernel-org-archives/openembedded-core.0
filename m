Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1UOCG3-0006QE-Vj
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 21:25:13 +0200
Received: by mail-pb0-f41.google.com with SMTP id mc17so2173671pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 12:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=sMmJCM6rLZ8VW4CTPGB6/iOCwIWCkEq0NPrEl9LrRqU=;
	b=Z8HJ+XKfvyWlp9bgY0Pjl3Xmok46NYapugul/0oVm0TuFHSM7bDW8bvOEMgrrr5Dng
	94Ot2FbMpnMe8YBB99xL0O2Ej2BTUGO4uKqcEsUDg60OcrBxLZxJ9kEobeKULDrQReRP
	OeW/OTS32Ot0Rma8cXuheDkJwGbLIIIGOgdF0o5CCKTiMXrjigaqHkxP6Zp0NC+yIERV
	sbS+hXsLw+mdQTOUTHWHxZRM3iWNodzfYk67dZYrR/404XmslatAjUFDjh8KSEIEJZLF
	vkrmEKscSgs4AZVXDGLUjQqMu3EqP9IdRLj3mK5zo/KhrJTZBwhTNJLlVvw2+QMBa7CK
	uWKg==
X-Received: by 10.66.228.225 with SMTP id sl1mr16763384pac.54.1365188872572;
	Fri, 05 Apr 2013 12:07:52 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.105.6])
	by mx.google.com with ESMTPS id yr10sm17116198pab.6.2013.04.05.12.07.49
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 12:07:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <515EFD76.2090009@communistcode.co.uk>
Date: Fri, 5 Apr 2013 23:07:46 +0400
Message-Id: <90388408-FA89-40F1-BC46-B49D56C33ED7@gmail.com>
References: <515ED999.9040100@communistcode.co.uk>
	<D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
	<515EFD76.2090009@communistcode.co.uk>
To: ml@communistcode.co.uk
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc-cross-initial Failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 19:25:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Apr 5, 2013, at 8:36 PM, Jack Mitchell <ml@communistcode.co.uk> =
wrote:

> On 05/04/2013 17:15, Khem Raj wrote:
>> On Apr 5, 2013, at 7:03 AM, Jack Mitchell <ml@communistcode.co.uk> =
wrote:
>>=20
>>> Doing my usual git master pull and rebuild today, resulted in =
gcc-cross-initial failing to build.
>>>=20
>>> Please find the log attached, does anyone know what could have =
caused it? I recently changed the TUNES, so could something not be being =
re-built when it should be?
>>=20
>> it could be gcc is crashing on you. What TUNEs did you change
>=20
> I build for the beaglebone and I changed them in line with your =
default beaglebone build patch you posted a week or so ago. I think it =
moved it form soft to hard float possibly=85


This is the same type of error that I'm currently stuck with, while =
attempting to build for microblaze hard-float using both gcc-4.7 and =
gcc-4.8 recipes with the current poky master branch.

I haven't tried building for soft-float, but will do so now.

If you look at the errors, it is related to libgcc.

| =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microblazeel-v830=
-bs-cmp-re-ml-div-fb-poky-linux/microblazeel-poky-linux-as: unrecognized =
option '-EL'
| make[1]: *** [divsi3_s.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microblazeel-v830=
-bs-cmp-re-ml-div-fb-poky-linux/microblazeel-poky-linux-as: unrecognized =
option '-EL'
| make[1]: *** [moddi3_s.o] Error 1
| =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microblazeel-v830=
-bs-cmp-re-ml-div-fb-poky-linux/microblazeel-poky-linux-as: unrecognized =
option '-EL'
| make[1]: *** [modsi3_s.o] Error 1
| =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microblazeel-v830=
-bs-cmp-re-ml-div-fb-poky-linux/microblazeel-poky-linux-as: unrecognized =
option '-EL'
| make[1]: *** [muldi3_hard_s.o] Error 1
| =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microblazeel-v830=
-bs-cmp-re-ml-div-fb-poky-linux/microblazeel-poky-linux-as: unrecognized =
option '-EL'
| make[1]: *** [stack_overflow_exit_s.o] Error 1
| =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/microblazeel-v830=
-bs-cmp-re-ml-div-fb-poky-linux/microblazeel-poky-linux-as: unrecognized =
option '-EL'
| make[1]: *** [mulsi3_s.o] Error 1
| make[1]: Leaving directory =
`/tool/yocto/poky/build/tmp/work/microblazeel-v830-bs-cmp-re-ml-div-fb-pok=
y-linux/gcc-cross-initial/4.8.0-r0/gcc-4.8.0/build.x86_64-linux.microblaze=
el-poky-linux/microblazeel-poky-linux/libgcc'
| make: *** [all-target-libgcc] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see =
/tool/yocto/poky/build/tmp/work/microblazeel-v830-bs-cmp-re-ml-div-fb-poky=
-linux/gcc-cross-initial/4.8.0-r0/temp/log.do_compile.8602 for further =
information)


Best regards,

Elvis Dowson=


