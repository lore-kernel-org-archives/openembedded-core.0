Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 20B2779074
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:28:24 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id j19-v6so1428427ljc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4L2PmaVAbMavzelosFbew4/yZgu11Dcwulw5K8ZoO70=;
	b=nwIoKwcRAIY75+WjsYHbjILbzvF81q+e8b6uDZt2IO+TPDhLYAb1DpUsSkJxwTR/Uj
	eVWYHPZcqczNH8jV1rzSVXy4Dk6a1qeXDi/rAhRvzC7tTCsksof7F8/UKbFJD48RDp6J
	TTVxMCOWVrkNbUwagmfmqTswEZBCIAjqJDCJMCZ74tynLPEa9Kgoc+Q9Za2Oriirp6qx
	z4k9j16d29Uinf3Ws0mY53rPZ5EI+K0sVtek13uIoyXFY/DXSX8RYxJl8P2MCulFCK8e
	y6M8b+AohUFQyq6pqxgYJbpflr6i93XX3+PakJ7tDzqsDkdDhTnTtJlCTpQzx+OMMDVV
	QwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4L2PmaVAbMavzelosFbew4/yZgu11Dcwulw5K8ZoO70=;
	b=pEUGj3teUiZD7pgGMnYilgX7yj65VWTwbI0AkNV4UNZGug3gGoIkEHeKlGXIQeuWso
	V7gq/qhvj+ULy6a+V8WPrZuOVxvQkdXov/zw0QlgCnQN65Mw1YzWPnJKPHQ1mpxWydH4
	JVDVZM0YmMoubPjRhqin6srqXMLKJII3fLr+5y69eNSnoobW0uuZwHp4lZ07oBPpQ4mZ
	czkpOOLfYifc/Aw3Y+/XgbbiR4cTLwF8oXX2dA/NOdpWS4kqZ6ELWAUvPHbQyaWpfp6y
	0aVSjN6KngrRr2TP/jrEbQc2lUreRieirrhE8JLMeSPzDy2ISoowhfFZyqDUH3e//uk0
	9DDw==
X-Gm-Message-State: APzg51CukQTrYeJewaknQ388C+Soy3vL5SgOjE42Ivp7EQdvsDfVNI3l
	pnGvE7PDuprw4wjDoGSqU7NUwXDAiwg7lCspoj8=
X-Google-Smtp-Source: ANB0VdaJPXNDPw5iew31JfSBy7l+7CULOLiDMAWrB/9xxkayBsTHFqxwP06lk6cHHw/42qSqcAhKzjeYpIrrqTeyZmY=
X-Received: by 2002:a2e:1086:: with SMTP id 6-v6mr2553625ljq.59.1534944504680; 
	Wed, 22 Aug 2018 06:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
	<83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
	<CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
	<a031c89ea6cdb522999796f93b8c1a2c8ec8e4c5.camel@linuxfoundation.org>
	<CAPybu_0QAOWyz9+XGKEADtZqj+wj2Ro7hQx_q8BkX9BBrjPPCg@mail.gmail.com>
	<e0ffd2ccefb534b1c4171449256c123e9e6b5e55.camel@linuxfoundation.org>
In-Reply-To: <e0ffd2ccefb534b1c4171449256c123e9e6b5e55.camel@linuxfoundation.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 22 Aug 2018 15:28:07 +0200
Message-ID: <CAPybu_1NAf_p0zfZSPTAbweKYunAyGL_6tLwhao-Kw6be3FX9w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Wed, 22 Aug 2018 13:28:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 22, 2018 at 3:21 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-08-22 at 15:13 +0200, Ricardo Ribalda Delgado wrote:
> > > Here I see:
> > >
> > > $ MACHINE=qemux86-64 bitbake glibc -e | grep ^RTLDLIST=
> > > RTLDLIST="/lib/ld-linux-x86-64.so.2"
> >
> > The output of RTLDLIST that I shared was from
> > root@qt5122:~# cat /usr/bin/ldd | grep ^RTLD
> > RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> > /libx32/ld-linux-x32.so.2"
> >
> > If I run your command
> >
> > pokyuser@c10753884d1a:/workdir/build$ bitbake glibc -e | grep
> > ^RTLDLIST=
> > RTLDLIST=""
> >
> > If we look at log.do_compile we can see how the the value from ldd is
> > rewritten:
> >
> > LC_ALL=C sed -e 's%@RTLD@%/lib/ld-linux-x86-64.so.2%g' -e
> > 's%@VERSION@%2.27%g' -e 's|@PKGVERSION@|(GNU libc) |g' -e
> > 's|@REPORT_BUGS_TO@|<http://www.gnu.org/software/libc/bugs.html>|g'
> > -e
> > 's%@BASH@%/bin/bash%g' -e 's%@TEXTDOMAINDIR@%/usr/share/locale%g' <
> > ldd.bash.in | LC_ALL=C sed -f
> > ../sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed >
> > /workdir/build/tmp/work/dbfp4-poky-linux/glibc/2.27-r0/build-x86_64-
> > poky-linux/elf/ldd.new
> >
> > cat git/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
> > /LD_TRACE_LOADED_OBJECTS=1/a\
> > add_env="$add_env LD_LIBRARY_VERSION=\\$verify_out"
> > s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-
> > x32\)\(\.so\.[0-9.]*\)[
> > ]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6 \2\3\4\5\6"_
> >
> > which basically converts
> > /lib/ld-linux-x86-64.so.2
> >  into:
> >  /lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2 /libx32/ld-linux-
> > x32.so.2
> >
> > I agree that this bug is too obvious for not being noticed for a long
> > time. At least I use ldd a lot when thing fails ;)
>
> If you look at glibc_2.28.bb, it rewrites RTLDLIST if the value passed
> in is not empty. Yours is empty, the question is therefore why.
>
> Can you add -C10 to the command and see the variable history, here its:
>
> # $RTLDLIST [2 operations]
> #   set /media/build3/poky/meta/recipes-core/glibc/glibc-ld.inc:46
> #     "${@glibc_dl_info(d)['lddrewrite']}"
> #   override[class-nativesdk]:set /media/build3/poky/meta/recipes-core/glibc/glibc-ld.inc:47
> #     "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64', 'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
> # pre-expansion value:
> #   "${@glibc_dl_info(d)['lddrewrite']}"
> RTLDLIST="/lib/ld-linux-x86-64.so.2"
>


# $RTLDLIST [2 operations]
#   set /workdir/repo/poky/meta/recipes-core/glibc/glibc-ld.inc:46
#     "${@glibc_dl_info(d)['lddrewrite']}"
#   override[class-nativesdk]:set
/workdir/repo/poky/meta/recipes-core/glibc/glibc-ld.inc:47
#     "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64',
'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
# pre-expansion value:
#   "${@glibc_dl_info(d)['lddrewrite']}"
RTLDLIST=""
#

# $RTLDLIST_class-nativesdk
#   set /workdir/repo/poky/meta/recipes-core/glibc/glibc-ld.inc:47
#     "${base_libdir}/${@bb.utils.contains('SDK_ARCH', 'x86_64',
'ld-linux-x86-64.so.2', 'ld-linux.so.2', d)}"
RTLDLIST_class-nativesdk="/lib/ld-linux-x86-64.so.2"


I have just upgraded my work build to 19.0.1 / 2.5.1 Let me build ldd
again to see if the problem still persists

> Cheers,
>
> Richard



-- 
Ricardo Ribalda

