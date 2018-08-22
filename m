Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EEDF6793EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:37:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v90-v6so1663904wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zMjUt8FAOPvj1kIP4WUnZiIYxLDJKnopC2+RaBa2dNg=;
	b=II4V67NVTFp5zimOpzKULrBA++dlIQvHigR1ZVvdISC9xySIrV/10oRXhOuAlV/bdi
	VRdDHH8T317QgOKg2wSZfBhxXDXwdqst5pfLwQZBh9kYTU+EfoccdenK1zFJdStt3mck
	BDWp8b/smcvD1ODb3Lha1LBzQO2i5MHxebbUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zMjUt8FAOPvj1kIP4WUnZiIYxLDJKnopC2+RaBa2dNg=;
	b=udpylKSWVLAIhPpfkOMGhedBGFeVrE9mNGtip1aXsgkESH6b04iaROKdsJnxRv48r/
	zRp3OWVD8OfjVZ37ybm69QkivzGWtLvVj22BpeFi87AWjYsb6dMriaeb3zIIrMSwQ3b4
	LImWVh6NH16Ief4zy8967QhaPT7h9rIryIEJb63X+xAQVHRNLH0ndW4zPwglw3zQxPh7
	VCxpaVB/C65ZcDC1ZoYAyg5EXPZmsaOM8nxYs1+cNaAFPDhXXAJVCuwTSL1WNhDTprQJ
	jYyF9azlFALmOKQdc/xQByooqfCVkEIK3kpC/wvvzPyMv3Min+UJjGCIyaIBJddxNArK
	Q7oA==
X-Gm-Message-State: APzg51AZulM/Tvj0nIMGqhxjZHkcoVcOT3Z3K295/KCniYgpzKLL99nl
	9QX5D5elDGxqVWdmD5wchlPxOQ==
X-Google-Smtp-Source: ANB0VdYuKS6s+hTx0/vVvjWFLsBICoEldzKBoan1X1Hmq5c0bqfJiqFYJyAQ0GXOe1gWRktB2yNJGQ==
X-Received: by 2002:a5d:574b:: with SMTP id q11-v6mr47073wrw.272.1534945071704;
	Wed, 22 Aug 2018 06:37:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m8-v6sm2217486wrf.93.2018.08.22.06.37.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Aug 2018 06:37:50 -0700 (PDT)
Message-ID: <15ac7737a9a1a20bfbb6ed98a79ba140a6e6c786.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 22 Aug 2018 14:37:49 +0100
In-Reply-To: <CAPybu_0oQ2sjiVTMqXXbvTs+3dagLn8Wps5-AxYhqtjKz-9M6w@mail.gmail.com>
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
	<83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
	<CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
	<a031c89ea6cdb522999796f93b8c1a2c8ec8e4c5.camel@linuxfoundation.org>
	<CAPybu_0QAOWyz9+XGKEADtZqj+wj2Ro7hQx_q8BkX9BBrjPPCg@mail.gmail.com>
	<e0ffd2ccefb534b1c4171449256c123e9e6b5e55.camel@linuxfoundation.org>
	<CAPybu_1NAf_p0zfZSPTAbweKYunAyGL_6tLwhao-Kw6be3FX9w@mail.gmail.com>
	<CAPybu_0oQ2sjiVTMqXXbvTs+3dagLn8Wps5-AxYhqtjKz-9M6w@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Wed, 22 Aug 2018 13:37:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-22 at 15:33 +0200, Ricardo Ribalda Delgado wrote:
> Hello
> On Wed, Aug 22, 2018 at 3:28 PM Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
> > 
> > On Wed, Aug 22, 2018 at 3:21 PM <richard.purdie@linuxfoundation.org
> > > wrote:
> > > 
> > > On Wed, 2018-08-22 at 15:13 +0200, Ricardo Ribalda Delgado wrote:
> > > > > Here I see:
> > > > > 
> > > > > $ MACHINE=qemux86-64 bitbake glibc -e | grep ^RTLDLIST=
> > > > > RTLDLIST="/lib/ld-linux-x86-64.so.2"
> > > > 
> > > > The output of RTLDLIST that I shared was from
> > > > root@qt5122:~# cat /usr/bin/ldd | grep ^RTLD
> > > > RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> > > > /libx32/ld-linux-x32.so.2"
> > > > 
> > > > If I run your command
> > > > 
> > > > pokyuser@c10753884d1a:/workdir/build$ bitbake glibc -e | grep
> > > > ^RTLDLIST=
> > > > RTLDLIST=""
> > > > 
> > > > If we look at log.do_compile we can see how the the value from
> > > > ldd is
> > > > rewritten:
> > > > 
> > > > LC_ALL=C sed -e 's%@RTLD@%/lib/ld-linux-x86-64.so.2%g' -e
> > > > 's%@VERSION@%2.27%g' -e 's|@PKGVERSION@|(GNU libc) |g' -e
> > > > 's|@REPORT_BUGS_TO@|<http://www.gnu.org/software/libc/bugs.html
> > > > >|g'
> > > > -e
> > > > 's%@BASH@%/bin/bash%g' -e 's%@TEXTDOMAINDIR@%/usr/share/locale%
> > > > g' <
> > > > ldd.bash.in | LC_ALL=C sed -f
> > > > ../sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed >
> > > > /workdir/build/tmp/work/dbfp4-poky-linux/glibc/2.27-r0/build-
> > > > x86_64-
> > > > poky-linux/elf/ldd.new
> > > > 
> > > > cat git/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
> > > > /LD_TRACE_LOADED_OBJECTS=1/a\
> > > > add_env="$add_env LD_LIBRARY_VERSION=\\$verify_out"
> > > > s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-
> > > > x32\)\(\.so\.[0-9.]*\)[
> > > > ]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6 \2\3\4\5\6"_
> > > > 
> > > > which basically converts
> > > > /lib/ld-linux-x86-64.so.2
> > > >  into:
> > > >  /lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2 /libx32/ld-
> > > > linux-
> > > > x32.so.2
> > > > 
> > > > I agree that this bug is too obvious for not being noticed for
> > > > a long
> > > > time. At least I use ldd a lot when thing fails ;)
> > > 
> > > If you look at glibc_2.28.bb, it rewrites RTLDLIST if the value
> > > passed
> > > in is not empty. Yours is empty, the question is therefore why.
> > > 
> > > Can you add -C10 to the command and see the variable history,
> > > here its:
> > > 
> > > # $RTLDLIST [2 operations]
> > > #   set /media/build3/poky/meta/recipes-core/glibc/glibc-
> > > ld.inc:46
> > > #     "${@glibc_dl_info(d)['lddrewrite']}"
> > > #   override[class-nativesdk]:set
> > > /media/build3/poky/meta/recipes-core/glibc/glibc-ld.inc:47
> > > #     "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64',
> > > 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
> > > # pre-expansion value:
> > > #   "${@glibc_dl_info(d)['lddrewrite']}"
> > > RTLDLIST="/lib/ld-linux-x86-64.so.2"
> > > 
> > 
> > 
> > # $RTLDLIST [2 operations]
> > #   set /workdir/repo/poky/meta/recipes-core/glibc/glibc-ld.inc:46
> > #     "${@glibc_dl_info(d)['lddrewrite']}"
> > #   override[class-nativesdk]:set
> > /workdir/repo/poky/meta/recipes-core/glibc/glibc-ld.inc:47
> > #     "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64',
> > 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
> > # pre-expansion value:
> > #   "${@glibc_dl_info(d)['lddrewrite']}"
> > RTLDLIST=""
> > #
> > 
> > # $RTLDLIST_class-nativesdk
> > #   set /workdir/repo/poky/meta/recipes-core/glibc/glibc-ld.inc:47
> > #     "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64',
> > 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
> > RTLDLIST_class-nativesdk="/lib/ld-linux-x86-64.so.2"
> > 
> > 
> > I have just upgraded my work build to 19.0.1 / 2.5.1 Let me build
> > ldd
> > again to see if the problem still persists
> 
> 19.0.1 gives the same results as 19.0.0
> 
> 
> RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> /libx32/ld-linux-x32.so.

I just looked at what the function is doing and its broken. What is
DEFAULTTUNE set to in your build?

Cheers,

Richard

