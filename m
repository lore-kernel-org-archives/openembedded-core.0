Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QafAt-00080f-3f
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Jun 2011 04:34:15 +0200
Received: by pvf24 with SMTP id 24so2477686pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2011 19:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lIPOMwqk/9ZbSBvKYvEIF1LgIVr5yjMwWmWqroxC6oA=;
	b=wDsvJMvN1IrTnd/MQSMhnM1yOXYUPUsOQ4/3vW8TnqSClzTOuY1gXam2pIfkehFgmo
	tYMgVJvA1Me8Wjx/tAwlRRFTFwXSS8at9UIT/qfjtvDFjCAIqdpMOQdE4Jm9wfHmsGln
	SrVDXF/cmU9TIGdgeD8MjaDK4L/b0pufsRook=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=C8QjhiydA13PmdMX6hN5MBkFu3lEghf+GUzO8d8Z61IPJpa6P657/DYPrdPAMcdbP5
	rPr0euMrDiw7iiluH23jd+ABdNwR1e+uioyuPx/k7NfT0rsLva9vZ5ofxvB5BjHAE/e1
	mCQD/8rnIA091m6yxMRg4pekX0L8M83aB+Sco=
Received: by 10.142.174.20 with SMTP id w20mr860913wfe.379.1309055435555;
	Sat, 25 Jun 2011 19:30:35 -0700 (PDT)
Received: from [192.168.1.82] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z20sm1227684wff.19.2011.06.25.19.30.33
	(version=SSLv3 cipher=OTHER); Sat, 25 Jun 2011 19:30:34 -0700 (PDT)
Message-ID: <4E0699D1.9090308@gmail.com>
Date: Sat, 25 Jun 2011 19:30:41 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
In-Reply-To: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Sun, 26 Jun 2011 02:34:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/2011 1:38 PM, Koen Kooi wrote:
> Hi,
>
> I was spending some spare cycles on
> https://github.com/koenkooi/meta-archos and wanted to build the 2.6.22
> vendor kernel first before trying to the 3.0rc working and I need to use
> csl 2007q3 as gcc-cross-kernel due to bugs in the kernel.
>
> I imported the 2008q1 recipes from OE-core, then changed the SRC_URI to
> have the patches from the 2007q3 recipe in OE classic. It uses the .inc
> files from OE-core. It builds and gives me:
>
> koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-kernel-4.2.1-4.2.1+csl-arm-2007q3-53-r0/image$
> find . | grep bin
> ./OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin
>
> ./OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel-4.2.1
>
> ./OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel-4.2.1/arm-angstrom-linux-gnueabi-gcov
>
> ./OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel-4.2.1/arm-angstrom-linux-gnueabi-gccbug
>
> ./OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/arm-angstrom-linux-gnueabi-gcc-4.2.1+csl-arm-2007q3-53
>
>
> But when I do 'MACHINE=archos5 bitbake virtual/kernel -c compile' I get:
>
> | + make -j4 zImage 'CC=ccache
> arm-angstrom-linux-gnueabi-gcc-4.2.1+csl-arm-2007q3-53
> -mno-thumb-interwork -mno-thumb
> --sysroot=/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/archos5' 'LD=arm-angstrom-linux-gnueabi-ld
> --sysroot=/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/archos5
> --sysroot=/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/archos5'
> | arm-angstrom-linux-gnueabi-gcc-4.2.1+csl-arm-2007q3-53: No such file
> or directory
>
> And I can't find arm-angstrom-linux-gnueabi-gcc-4.2.1+csl-arm-2007q3-53
> in sysroots. When looking at WORKDIR for the gcc:
>
> koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-kernel-4.2.1-4.2.1+csl-arm-2007q3-53-r0$
> find sysroot-destdir/ | grep bin
> sysroot-destdir/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin
>
> sysroot-destdir/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel-4.2.1
>
> sysroot-destdir/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel-4.2.1/arm-angstrom-linux-gnueabi-gcov
>
> sysroot-destdir/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi.gcc-cross-kernel-4.2.1/arm-angstrom-linux-gnueabi-gccbug
>
>
> So that's missing the
> arm-angstrom-linux-gnueabi-gcc-4.2.1+csl-arm-2007q3-53 that's actually
> needed.

in oe-core we munge CROSS_TARGET_SYS_DIR and append PN to it, this 
should be considered in gcc-cross-kernel.inc

you need couple of changes

change the install command like below in gcc-cross-kernel.inc

install -m 0755 xgcc 
${D}${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_PREFIX}gcc-${PV}

secondly you need to inform kernel recipe of this new location of toolchain

so in you kernel recipe somewhere patch the below code

PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.gcc-cross-kernel:"

Thanks

-Khem


