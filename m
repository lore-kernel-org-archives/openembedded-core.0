Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2E36C77177
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 17:21:06 +0000 (UTC)
Received: by iouu10 with SMTP id u10so31824595iou.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8RFqUhvXOLGsifdVSTfbSqklJW3rNx1STOe+MjvcXxI=;
	b=reWZ/Uf7NRJBJ9U+kCPAex5wKeWpzff1WqquImOny4Z8OIWAsH6pDL7BIXVK+Ihr9L
	InTcx47Ec9b56lV2JtHlZcb5s7fWL77PrTuzgXLThPovFpbu9nyhXxJMR8giEH6qTzM8
	C9ib5Ji2r/TI7K0KWcnervC47odSJHqC07/ORU7ZfgraIhcpXxGNrXxE/3olSCzFlQzn
	SyT1oknAi1hE/9g5BY8AH1fNrTwuAclSyAkdHStmzQdPZ7klkcNo6Dpscu2rUckA7iHV
	OhkYcdJgWEaYMKuhUAMRE06O9BzvHc60ysJUqGce5sPUbdTHqqA6v6ZraNkG3hVkmToQ
	58Jw==
X-Received: by 10.107.162.137 with SMTP id l131mr7971370ioe.49.1447262466687; 
	Wed, 11 Nov 2015 09:21:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 09:20:37 -0800 (PST)
In-Reply-To: <1447261783.3559.246.camel@linuxfoundation.org>
References: <1447261783.3559.246.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 09:20:37 -0800
Message-ID: <CAMKF1sq8xNMQ5ovvSpzn8NfCU+T5nFmf_joB75e-y--seoKXxw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Drop 4.8
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
X-List-Received-Date: Wed, 11 Nov 2015 17:21:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 11, 2015 at 9:09 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We have 5.2 and 4.9, we don't really need 4.8 now and it can be moved
> out to other layers if anyone still wants/needs it.

OK with me.

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> [posting the diffstat rather than a huge patch]
>
>  gcc-4.8.inc                                                             |  119
>  gcc-4.8/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch                      |   42
>  gcc-4.8/0002-uclibc-conf.patch                                          |   53
>  gcc-4.8/0003-gcc-uclibc-locale-ctype_touplow_t.patch                    |   87
>  gcc-4.8/0004-uclibc-locale.patch                                        | 2862 ----------
>  gcc-4.8/0005-uclibc-locale-no__x.patch                                  |  257
>  gcc-4.8/0006-uclibc-locale-wchar_fix.patch                              |   68
>  gcc-4.8/0007-uclibc-locale-update.patch                                 |  542 -
>  gcc-4.8/0008-missing-execinfo_h.patch                                   |   28
>  gcc-4.8/0009-c99-snprintf.patch                                         |   28
>  gcc-4.8/0010-c99-complex-ugly-hack.patch                                |   29
>  gcc-4.8/0011-index_macro.patch                                          |   44
>  gcc-4.8/0012-libmudflap-susv3-legacy.patch                              |   64
>  gcc-4.8/0013-libstdc-namespace.patch                                    |   54
>  gcc-4.8/0014-sh-pr24836.patch                                           |   45
>  gcc-4.8/0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch |   29
>  gcc-4.8/0016-gcc-poison-system-directories.patch                        |  221
>  gcc-4.8/0017-gcc-poison-dir-extend.patch                                |   39
>  gcc-4.8/0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch                  |   73
>  gcc-4.8/0019-64-bit-multilib-hack.patch                                 |   79
>  gcc-4.8/0020-optional-libstdc.patch                                     |  102
>  gcc-4.8/0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch                 |   59
>  gcc-4.8/0022-COLLECT_GCC_OPTIONS.patch                                  |   38
>  gcc-4.8/0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch   |   88
>  gcc-4.8/0024-PR-target-32219.patch                                      |   67
>  gcc-4.8/0025-fortran-cross-compile-hack.patch                           |   46
>  gcc-4.8/0026-libgcc-sjlj-check.patch                                    |   74
>  gcc-4.8/0027-cpp-honor-sysroot.patch                                    |   54
>  gcc-4.8/0028-MIPS64-Default-to-N64-ABI.patch                            |   31
>  gcc-4.8/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  209
>  gcc-4.8/0030-gcc-Fix-argument-list-too-long-error.patch                 |   40
>  gcc-4.8/0031-Disable-sdt.patch                                          |  113
>  gcc-4.8/0032-libtool.patch                                              |   42
>  gcc-4.8/0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch    |   43
>  gcc-4.8/0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch |  102
>  gcc-4.8/0035-wcast-qual-PR-55383.patch                                  |   55
>  gcc-4.8/0038-gcc-4.8-build-args.patch                                   |   64
>  gcc-4.8/0040-fix-g++-sysroot.patch                                      |   40
>  gcc-4.8/0041-libtool-avoid-libdir.patch                                 |   19
>  gcc-4.8/0042-pr57748.patch                                              |   78
>  gcc-4.8/0043-cpp.patch                                                  |   40
>  gcc-4.8/0044-gengtypes.patch                                            |   97
>  gcc-4.8/0046-libatomic-deptracking.patch                                |   41
>  gcc-4.8/0047-repomembug.patch                                           |   53
>  gcc-4.8/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch |   42
>  gcc-4.8/0051-gcc-483-universal-initializer-no-warning.patch             |  107
>  gcc-4.8/target-gcc-includedir.patch                                     |   81
>  gcc-cross-canadian_4.8.bb                                               |    5
>  gcc-cross-initial_4.8.bb                                                |    2
>  gcc-cross_4.8.bb                                                        |    3
>  gcc-crosssdk-initial_4.8.bb                                             |    3
>  gcc-crosssdk_4.8.bb                                                     |    2
>  gcc-runtime_4.8.bb                                                      |    3
>  gcc-sanitizers_4.8.bb                                                   |    2
>  gcc-source_4.8.bb                                                       |    4
>  gcc_4.8.bb                                                              |    9
>  libgcc-initial_4.8.bb                                                   |    2
>  libgcc_4.8.bb                                                           |    2
>  libgfortran_4.8.bb                                                      |    3
>  59 files changed, 6628 deletions(-)
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

