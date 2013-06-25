Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDF161038
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 18:03:29 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id o6so13877267oag.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 11:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=MCD45cvjp6GyjJSXIrJatxIlsYJPVL7G9BqE4LeEiOI=;
	b=CHrksqr/4diMMBKsAhS5cwmlVq57f6aM9g96o9BxC8i5a/FNdar2lGW3upFSMwtPQw
	3avifXbl/CpkPeuh6POOIzo+v7/NAAXmKDuN+4p3ZEENT35SS5AnvkiW3iLpYLvEcfNk
	1rAOwWRQc+SZ7EnbbnhR1XWv6gm6XJGcZOfsViVY9uBG3PoYZZ8L2E/LE++dQCgnhiNq
	8FBVYrxt7MNPy7sLAe1Y9SjiBbjsjGwV26U9kuCEiOpaDvo3Py1wWSk6Zo1TONpDkRqp
	LG7fo6LvkwhK3xctSIKX5q/uncNBHbEqBlfyeordO6rjANEsvelh+ykgFd33TEeF5ua0
	LDZA==
MIME-Version: 1.0
X-Received: by 10.60.43.232 with SMTP id z8mr38172oel.138.1372183409754; Tue,
	25 Jun 2013 11:03:29 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Tue, 25 Jun 2013 11:03:29 -0700 (PDT)
In-Reply-To: <F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
References: <51C9CE42.8020207@linux.intel.com>
	<56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
	<CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
	<F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
Date: Tue, 25 Jun 2013 15:03:29 -0300
X-Google-Sender-Auth: lXDY824B7ZLB84qAgEaGYXN2JZw
Message-ID: <CAP9ODKrdDSkQrT2S+oqa3y2DQLPXk26_OuUzZHsU46wJCGZ5aQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Tue, 25 Jun 2013 18:03:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2013 at 3:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Jun 25, 2013, at 10:46 AM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
>
>> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/log/?h=3Dimx=
_2.6.35_11.09.01
>>
>
> hmm 2.6.35
>
>> If you provide me the command I should do, I can get it. Or Saul might
>> get it from autobuilder as well.
>
> something like below. Replace the paths to your tmpdir appropriately in b=
elow cmd ( e.g. /builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beagl=
ebone-angstrom-linux-gnueabi might be something else for you and also compi=
ler name and sysroot)
>
> cd into kernel srcdir in staging tmp/sysroots/beaglebone/usr/src/kernel/t=
ools/perf
>
> arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a -mthumb-interwork -mfloa=
t-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/builds1/angstro=
m/build/tmp-angstrom_next-eglibc/sysroots/qemuarm -O2 -pipe -g -feliminate-=
unused-debug-types -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_GNU_SO=
URCE -Iutil/include -Iarch/arm/include -I/builds1/angstrom/build/tmp-angstr=
om_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/=
arch/arm/include/generated/uapi -I/builds1/angstrom/build/tmp-angstrom_next=
-eglibc/sysroots/beaglebone/usr/src/kernel/arch/arm/include/uapi -I/builds1=
/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr/src/kernel=
/arch/arm/include -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/b=
eaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/include/generated/uap=
i -I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/us=
r/src/kernel/include/uapi -I/builds1/angstrom/build/tmp-angstrom_next-eglib=
c/sysroots/beaglebone/usr/src/kernel/include -I/builds1/angstrom/build/tmp-=
angstrom_next-eglibc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/per=
f-1.0/util -Iutil -I. -I../lib/traceevent/ -D_LARGEFILE64_SOURCE -D_FILE_OF=
FSET_BITS=3D64 -D_GNU_SOURCE -I/builds1/angstrom/build/tmp-angstrom_next-eg=
libc/work/beaglebone-angstrom-linux-gnueabi/perf/1.0-r8/perf-1.0/ -DLIBELF_=
SUPPORT -DLIBELF_MMAP -I=3D/usr/include/slang -DNEWT_SUPPORT -DHAVE_ON_EXIT=
 -DBACKTRACE_SUPPORT  util/callchain.c -E -dD -o callchain.i
>
> and send me callchain.i

Do I need to run it using 4.8 or 4.7 should be enough?

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

