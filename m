Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rjq7Y-00038g-5B
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jan 2012 11:37:00 +0100
Received: by lami14 with SMTP id i14so952396lam.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jan 2012 02:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=t1DBRGKJSYzK85+7x9lRMf5xhU75TvKngT8BNlITb2o=;
	b=F5VnPx/rrFCwUrGtmWnvdE/+o9XzGcUAjA8tYpvTUGAz9g1F9ibPXm21svZOOsvFnG
	mrl5yB+P1Kjh6mmg+qlrztRUmaZBXI7d90IuD5ry2li9fguAPdPg4a2c74nFxqpWWeeU
	3cz6fbuHBIS/A/Nz72iYbJj94Ykvmem5ZR4DU=
Received: by 10.112.36.8 with SMTP id m8mr2492810lbj.54.1326018573420; Sun, 08
	Jan 2012 02:29:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Sun, 8 Jan 2012 02:29:02 -0800 (PST)
In-Reply-To: <CAFu+fZeD2p2jTAtFQRWatF=PG=50NKR9EpG+a2PydZL-q8EFng@mail.gmail.com>
References: <CAFu+fZeD2p2jTAtFQRWatF=PG=50NKR9EpG+a2PydZL-q8EFng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 8 Jan 2012 02:29:02 -0800
Message-ID: <CAMKF1srhyG84xCn8G=Gd2cT6h9U0QWrFfrhaBJt+YvE7X=ftBA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libiconv_1.14.bb do_install failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Jan 2012 10:37:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 6, 2012 at 3:14 PM, James Baker <muriani@gmail.com> wrote:
> Greetings folks,
>
> I'm trying to build an OE system and the process stops at the do_install
> phase of building libiconv_1.14
>
> Build system is Ubuntu 10.04 x86_64, plenty of HDD and ram to spare.
> Possibly pertinent log:
> | arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc
> -march=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mfloat-abi=3Dsoft=
fp
> -mfpu=3Dneon -mtune=3Dcortex-a8
> --sysroot=3D/home/james/stuff/beagle/tmp-eglibc/sysroots/beagleboard -Wl,=
-O1
> -Wl,--hash-style=3Dgnu -Wl,--as-needed -O2 -pipe -g
> -feliminate-unused-debug-types -Wl,-rpath -Wl,\$ORIGIN/../lib iconv.o -o
> iconv =C2=A0../srclib/libicrt.a
> /home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi=
/libiconv-1.14-r0/image/usr/lib/libiconv.so
> -Wl,-rpath
> -Wl,/home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnu=
eabi/libiconv-1.14-r0/image/usr/lib
> | iconv.o: In function `main':
> |
> /home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi=
/libiconv-1.14-r0/libiconv-1.14/src/./iconv.c:861:
> undefined reference to `relocate'
> | ../srclib/libicrt.a(progreloc.o): In function `prepare_relocate':
> |
> /home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi=
/libiconv-1.14-r0/libiconv-1.14/srclib/progreloc.c:297:
> undefined reference to `compute_curr_prefix'
> |
> /home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi=
/libiconv-1.14-r0/libiconv-1.14/srclib/progreloc.c:302:
> undefined reference to `set_relocation_prefix'
> | collect2: ld returned 1 exit status
> | make[1]: *** [install] Error 1
> | make[1]: Leaving directory
> `/home/james/stuff/beagle/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueab=
i/libiconv-1.14-r0/libiconv-1.14/src'
>
>
> This problem is present regardless of the target I've chosen, and has bee=
n
> tried with qemuarm (armv5) and beagleboard targets, as well as a netbookp=
ro
> target I'm trying to build (gotta get some use out of the darned thing)
>
> According to git, my local repository is up to date. Any ideas?

yes. sadly the upgrade to 1.14 broke it. Please try the patch posted here

http://patchwork.openembedded.org/patch/18767/

Please test it and report if it works for you.

-Khem


