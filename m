Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 61EF174EDD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 19:24:39 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id m21-v6so4892497uan.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 12:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VjDpiUCmqSW0tU/dmNLawjJM8tLQlF61oS2L8VGcDys=;
	b=CMlGVzuS+wrkaiQI/TUn1pbWxR7484Eldez1lgiXcxOj15Gkbt8JxnCHhtDNcA0V+m
	skfgC2gPzPLXZtC37AB1Bj4UWQ8h8bAyBxG0MP/00/lgp6TjGL4jDtVSBnQOM5hzJe0L
	UiazB1qDKV1G9e9zJReLbjMvJQbSMeRXLHd/zxwavcOEiiC85yhJGJg/3mHRoN1HsuTg
	KAwxJQqwQVV17w/r+W2lb4D9zZhXS0JvWxU5DzSscHp9jU9wUhQYIWHlrupmBgqwsqFK
	dx5YIXdsNBuCTEc9OnZiMSnAM5k21JOQPXA4m5cIBKqqVMHAt3taQ/shxVRklpVc7p1P
	OUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VjDpiUCmqSW0tU/dmNLawjJM8tLQlF61oS2L8VGcDys=;
	b=WDEFcP3YbYecd+yMr8MB4FRDFzE5c0gA2yJicwVeUW3BmvIGgFDZ4FrsRG/+NAZsi7
	tdj68nnNLyz+FtCJFQf92hrfiqzAUrqjXCLIgryHkGIpzt4eJTTsLpChZ3L+vh24R78O
	NFMkZA25QwKNFUHnLS/lGSii0Bhn3VRbDLOyyN4unhD7Z86TNlEUYVHjx+Rbb2hokHYE
	Lq5hYcEBDtJH/Uekw+CNj7TcRmX6FmyHS8eLwo+fW7HrjYfDyJi9gQ95azZ3tpQJZZ7R
	XB+FnqchPiXroduC1uuPYhmpWvJmuuwROBYWnsISvmrnGCyn44AA4Cel/mKUNhTsw7Mm
	JZ3A==
X-Gm-Message-State: APt69E0ddMagtoM15CRRe5+VsOocRV3pPuF8fM8PX6wHQHyXfVJ8k4Sc
	Baag0jRzsvKpphOETIqG/VhLgKha19cAeIkHZIg=
X-Google-Smtp-Source: ADUXVKL77WSaDxJdfAOC+DVQ6BgVfY0GUpKJRd50kVIxEFiSYPCIUL7AjiLXa9QpnAtJ6GSxhz0zCpBbA5tZ/RUx91A=
X-Received: by 2002:ab0:304e:: with SMTP id
	x14-v6mr2634396ual.80.1529004280071; 
	Thu, 14 Jun 2018 12:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
	<002e01d403d8$b811f1b0$2835d510$@neuf.fr>
	<20da1542-9903-d4fc-b38f-8f0ad3b2d4a1@gmail.com>
	<CAJ86T=UjDUYfQ3wAb4YCT954HjBfZMz1fnFkBxUV40xj=aBgow@mail.gmail.com>
In-Reply-To: <CAJ86T=UjDUYfQ3wAb4YCT954HjBfZMz1fnFkBxUV40xj=aBgow@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Jun 2018 12:24:13 -0700
Message-ID: <CAMKF1spJGLVW_HKD9YEgDY6aidz6q_TvjohfoJHnXHDiyc3vtg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Thu, 14 Jun 2018 19:24:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 14, 2018 at 12:12 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Thu, Jun 14, 2018 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On 6/14/18 5:10 AM, Herve Jourdain wrote:
> >> Hi,
> >>
> >> I believe I solved that same problem by just adding, in the case of armv8
> >> (which I believe may be the new architecture you're referring to):
> >> MUTEX_armv8 = ""
> >> This way, it allows previous versions to work just like they did before,
> >> without having to disable ARM assembler mutex code for architectures that
> >> support it correctly - up to armv7ve I believe.
> >> Of course, we might need to also have a good definition for armv8, which is
> >> the object of another thread.
> >
> > right thats a better approach.
>
> SWP is not guaranteed to work on SMP systems... and even if it does,
> performance is likely to be worse than the pthreads version (which can
> take advantage of the newer instructions).
>
>   https://community.arm.com/processors/b/blog/posts/locks-swps-and-two-smoking-barriers
>
> In general, use of hand optimised assembler mutex implementations in
> user space isn't something to be encouraged - use pthreads (or maybe a
> gcc intrinsic) instead.
>

question is about disabling it on old arm machines, do we have data where
we know that other sync methods without swp works better on armv5 and lower ? Do
we have gcc intrinsics for those versions of arm ?
if we do then I think I would agree

> I think the original patch is good.
>
> >> Cheers,
> >> Herve
> >>
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> >> Ovidiu Panait
> >> Sent: jeudi 14 juin 2018 13:55
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: [OE-core] [PATCH 1/1] db: disable the ARM assembler mutex code
> >>
> >> The swpb in macro MUTEX_SET will cause "undefined instruction" error on the
> >> new arm arches which don't support this assembly instruction any more. If
> >> use ldrex/strex to replace swpb, the old arm arches don't support them. So
> >> to avoid this issue, just disable the ARM assembler mutex code, and use the
> >> default pthreads mutex.
> >>
> >> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> >> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> >> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> >> ---
> >>  meta/recipes-support/db/db_5.3.28.bb | 13 +------------
> >>  1 file changed, 1 insertion(+), 12 deletions(-)
> >>
> >> diff --git a/meta/recipes-support/db/db_5.3.28.bb
> >> b/meta/recipes-support/db/db_5.3.28.bb
> >> index 093ee44909..15b4155a29 100644
> >> --- a/meta/recipes-support/db/db_5.3.28.bb
> >> +++ b/meta/recipes-support/db/db_5.3.28.bb
> >> @@ -59,18 +59,7 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so
> >> ${libdir}/libdb_cxx.so"
> >>  # All the --disable-* options replace --enable-smallbuild, which breaks a
> >> bunch of stuff (eg. postfix)  DB5_CONFIG ?= "--enable-o_direct
> >> --disable-cryptography --disable-queue --disable-replication
> >> --disable-verify --disable-compat185 --disable-sql"
> >>
> >> -EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot"
> >> -
> >> -# Override the MUTEX setting here, the POSIX library is -# the default -
> >> "POSIX/pthreads/library".
> >> -# Don't ignore the nice SWP instruction on the ARM:
> >> -# These enable the ARM assembler mutex code, this won't -# work with thumb
> >> compilation...
> >> -ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
> >> -MUTEX = ""
> >> -MUTEX_arm = "${ARM_MUTEX}"
> >> -MUTEX_armeb = "${ARM_MUTEX}"
> >> -EXTRA_OECONF += "${MUTEX} STRIP=true"
> >> +EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot
> >> STRIP=true"
> >>  EXTRA_OEMAKE += "LIBTOOL='./${HOST_SYS}-libtool'"
> >>
> >>  EXTRA_AUTORECONF += "--exclude=autoheader  -I ${S}/dist/aclocal
> >> -I${S}/dist/aclocal_java"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

