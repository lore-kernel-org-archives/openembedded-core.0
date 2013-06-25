Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7658A6ADC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 18:00:42 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa11so12914397pad.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 11:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Z5/Xr1Dfj4YEWDAN+T4To/+HrAI8tn3PSvIaF5APcNc=;
	b=DQEM6DBNDF8YRegTXwsTtqkQ/Nhdjeyhu46HYjsKt3krTRYp7BGsu8sBXOVIYkupZz
	nJNHxeM+CEtyNdURqdluP/5Ox0XAKldS1SWNJ6DgDmJo7VP0223IxGl3vMK8kYi6XVhy
	j/j/Vcu6j9SveHBmB8IuMl7yVxUGw81oSmbmA50sGTHLZ1+NUd4fDGKYhycOhgQcQPGD
	sFZ4sQswND3jfwGcWzotZYnVqy8ELrX2Sv+BvgcD7OLNACYTjkOSuN8H9iorwXs6uZMl
	EMbqfFHdxLv1SSeuuMh1Bytxz3uKiENBtB50nxjmaHqmr++VHJMOB9gcY/zan/4H1cqC
	RGHw==
X-Received: by 10.66.13.202 with SMTP id j10mr871095pac.181.1372183243721;
	Tue, 25 Jun 2013 11:00:43 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	fr1sm24219028pbb.26.2013.06.25.11.00.41 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 11:00:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
Date: Tue, 25 Jun 2013 11:00:39 -0700
Message-Id: <F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
References: <51C9CE42.8020207@linux.intel.com>
	<56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
	<CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1508)
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
X-List-Received-Date: Tue, 25 Jun 2013 18:00:42 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jun 25, 2013, at 10:46 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:

> =
http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/log/?h=3Dimx_2=
.6.35_11.09.01
>=20

hmm 2.6.35=20

> If you provide me the command I should do, I can get it. Or Saul might
> get it from autobuilder as well.

something like below. Replace the paths to your tmpdir appropriately in =
below cmd ( e.g. =
/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstrom-=
linux-gnueabi might be something else for you and also compiler name and =
sysroot)

cd into kernel srcdir in staging =
tmp/sysroots/beaglebone/usr/src/kernel/tools/perf

arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a -mthumb-interwork =
-mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 =
--sysroot=3D/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/qemu=
arm -O2 -pipe -g -feliminate-unused-debug-types -D_LARGEFILE64_SOURCE =
-D_FILE_OFFSET_BITS=3D64 -D_GNU_SOURCE -Iutil/include -Iarch/arm/include =
-I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstro=
m-linux-gnueabi/perf/1.0-r8/perf-1.0/arch/arm/include/generated/uapi =
-I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr=
/src/kernel/arch/arm/include/uapi =
-I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr=
/src/kernel/arch/arm/include =
-I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstro=
m-linux-gnueabi/perf/1.0-r8/perf-1.0/include/generated/uapi =
-I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr=
/src/kernel/include/uapi =
-I/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/beaglebone/usr=
/src/kernel/include =
-I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstro=
m-linux-gnueabi/perf/1.0-r8/perf-1.0/util -Iutil -I. =
-I../lib/traceevent/ -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 =
-D_GNU_SOURCE =
-I/builds1/angstrom/build/tmp-angstrom_next-eglibc/work/beaglebone-angstro=
m-linux-gnueabi/perf/1.0-r8/perf-1.0/ -DLIBELF_SUPPORT -DLIBELF_MMAP =
-I=3D/usr/include/slang -DNEWT_SUPPORT -DHAVE_ON_EXIT =
-DBACKTRACE_SUPPORT  util/callchain.c -E -dD -o callchain.i

and send me callchain.i=

