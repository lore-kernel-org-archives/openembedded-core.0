Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7458177084
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Oct 2015 12:51:41 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so61146508wic.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Oct 2015 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=1+dSx1TxNTmML1VGAdFt1JbEjnEyZ3rF7yZ9Zn4/s+Q=;
	b=rqdejojoV9E+LDu+hOua81Pb2HUCFBglFVem+ICXG2Jc59OPKeK6YYYE140w9wSu+R
	DjgB3gBdXwnE90VfF/pxErWbV9RDYkDvBcyS29sSKOKWMjbThNB4At3CiuYKR/XsLeRj
	QAV/6tBWRb4E/2B3C94AXItp3mSTZvGm88cojF99j0Exr5apOyFIoKSdnwQ9ADjOa46Q
	qgdrszASIbpW0NvRo7bZQiot8+lPbxrn2vLuuPynQLmiAfm40AmnznTeJCEy+0Pqml6o
	lrCUwUkB1vD/0DsF1SnIDhaziYb4YyFBuxZNQdtaU2NGHhUGL0nHcK2749u+KpSr9D+H
	0HFw==
X-Received: by 10.180.90.166 with SMTP id bx6mr2301182wib.93.1443876701758;
	Sat, 03 Oct 2015 05:51:41 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	cv4sm16387653wjc.17.2015.10.03.05.51.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Oct 2015 05:51:41 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <9EEC2D18-21A2-40BA-97B3-D8DD67015AC9@gmail.com>
Date: Sat, 3 Oct 2015 14:51:39 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: Should openssl(-native) build-depends on perl-native?
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
X-List-Received-Date: Sat, 03 Oct 2015 12:51:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I hit a build error never seen before:

| gcc  -I.. -I../.. -I../modes -I../asn1 -I../evp -I../../include  -fPIC =
-DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H =
-DL_ENDIAN     -DTERMIO =
-isystem/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine=
-freude-machen/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -Wall =
-Wa,--noexecstack -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS =
-DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 =
-DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM =
-DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM =
-DECP_NISTZ256_ASM =
-isystem/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine=
-freude-machen/tmp/sysroots/x86_64-linux/usr/include  -c -o sha512.o =
sha512.c
| /home/sno/perl5/perlbrew/perls/perl-5.6.2/bin/perl asm/sha1-x86_64.pl =
elf > sha1-x86_64.s
| Can't locate bigint.pm in @INC (@INC contains: =
/home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/5.6.2/x86_64-linux =
/home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/5.6.2 =
/home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/site_perl/5.6.2/x86_64-linux=
 /home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/site_perl/5.6.2 =
/home/sno/perl5/perlbrew/perls/perl-5.6.2/lib/site_perl .) at =
asm/../../perlasm/x86_64-xlate.pl line 200.
| BEGIN failed--compilation aborted at asm/../../perlasm/x86_64-xlate.pl =
line 200.
| make[2]: *** [sha1-x86_64.s] Error 141
| make[2]: Leaving directory =
`/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude=
-machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/openssl-1.0.2d/cryp=
to/sha'
| make[1]: *** [subdirs] Error 1
| make[1]: Leaving directory =
`/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude=
-machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/openssl-1.0.2d/cryp=
to'
| make: *** [build_crypto] Error 1
| ERROR: oe_runmake failed
| WARNING: =
/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-=
machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/temp/run.do_compile.=
15132:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at =
/home/sno/fsl-community-bsp/ornithologen-kann-man-mit-voegeln-eine-freude-=
machen/tmp/work/x86_64-linux/openssl-native/1.0.2d-r0/temp/log.do_compile.=
15132)
ERROR: Task 1531 =
(virtual:native:/home/sno/fsl-community-bsp/sources/poky/meta/recipes-conn=
ectivity/openssl/openssl_1.0.2d.bb, do_compile) failed with exit code =
'1'

Seems I recently used the same session to run my own module tests for a =
perl module to upload.
OTOH - it's easy to avoid such a problem by depending on perl-native for =
openssl(-native).

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


