Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 066EB792A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:13:32 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m84-v6so1382933lje.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wlsAA9U65kxq0ac4WK30NDwNo+1YamiaF8CwuSeiYt0=;
	b=CItNNNNboVqpyALPX760dNxF8o47GWqBcxGqPokTuC8SU5dwn+5vGZo5Z8ligKuvMI
	V/xitvw1P8jMPQNDYxDJFiDX5LtX0tGLUMt6i3KNLI880VE/XxH/Ck8Q2PK24bDh9hHA
	vYCeA7mpZ7VYA+spGf7KpeF7pS5xbqywVEgFXzz6x06YbBOqFYL1ilthNo+CZia0xLLF
	GgHJ4wN09IjXYUJOeF70FTdyQKfuI3dXF49OFuyQZFZEmYWkrxr1RTzbgHbOWRVP1BJD
	rIKBJBTTQcohUO9AIwpjr+xENaQaxE1W07lITkB3sqGupmwVUV4CDbzFckEigKWMhzQa
	ZgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wlsAA9U65kxq0ac4WK30NDwNo+1YamiaF8CwuSeiYt0=;
	b=cpahvpndpQsQ3bcC7vQAhkMitAAaYrSV9yQA2O59iyDljRr8DXTuqhsVFXtJl6z6XY
	zTnJEJGNOSp3U+yb0+JOjIrCAw2oaiJ8CEyqqBIvNhmSUmoE3eM+WzYWD7/D6QYcYctN
	xyUIQ328ncslf2hmV/z8Riz8fTTiXolSNTIgOkfZkXxpKLfwBMSKH6LYCgTm3AjIWtF5
	pwEbLqdpI3fLCKCKvuKTkX42M8se+zTkU0bv/fMQwcu7XkPLNQiYxNEXDz8nVZhPcxkJ
	X4j76zt7VDuvNCGPZvXPHx5q+eZy5w/mZB8R1oQov9dpX667ZXCGaDlGxqr6fS1JcufX
	bnPA==
X-Gm-Message-State: AOUpUlGeApP/MhTgzIZKXQCRPpL414WgrXERBxfFsgrLFrfMjsFB7MZw
	MihKcqtrxvPdmYstVf4PSXdb2FXmYW1fjYxJmBY=
X-Google-Smtp-Source: AA+uWPxNpNShdMjtGgO2ZEaHQbaNLMdKpxaWD8VEsFrH08cF8EvsM7IXpCRZST98wCNi9XPnaEh062NVPqAGMtHY9uo=
X-Received: by 2002:a2e:9883:: with SMTP id
	b3-v6mr36287898ljj.80.1534943613521; 
	Wed, 22 Aug 2018 06:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
	<83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
	<CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
	<a031c89ea6cdb522999796f93b8c1a2c8ec8e4c5.camel@linuxfoundation.org>
In-Reply-To: <a031c89ea6cdb522999796f93b8c1a2c8ec8e4c5.camel@linuxfoundation.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 22 Aug 2018 15:13:16 +0200
Message-ID: <CAPybu_0QAOWyz9+XGKEADtZqj+wj2Ro7hQx_q8BkX9BBrjPPCg@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Aug 2018 13:13:33 -0000
Content-Type: text/plain; charset="UTF-8"

HI Richard

On Wed, Aug 22, 2018 at 3:05 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-08-22 at 15:02 +0200, Ricardo Ribalda Delgado wrote:
> > On Wed, Aug 22, 2018 at 3:00 PM <richard.purdie@linuxfoundation.org>
> > wrote:
> > >
> > > On Wed, 2018-08-22 at 14:48 +0200, Ricardo Ribalda Delgado wrote:
> > > > On Wed, Aug 22, 2018 at 2:45 PM <richard.purdie@linuxfoundation.o
> > > > rg>
> > > > wrote:
> > > > >
> > > > > On Tue, 2018-08-21 at 16:58 +0200, Ricardo Ribalda Delgado
> > > > > wrote:
> > > > > > RTLDLIST table does not include /lib/ld-linux-x86-64.so.2,
> > > > > > resulting
> > > > > > on the following error:
> > > > > >
> > > > > > root@qt5122:~# ldd ./qtec_webcam
> > > > > > not a dynamic executable
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail
> > > > > > .com
> > > > > > >
> > > > > >
> > > > > > ---
> > > > > >  .../glibc/glibc/0031-ldd-rewrite.patch        | 22
> > > > > > +++++++++++++++++++
> > > > > >  meta/recipes-core/glibc/glibc_2.28.bb         |  1 +
> > > > > >  2 files changed, 23 insertions(+)
> > > > > >  create mode 100644 meta/recipes-core/glibc/glibc/0031-ldd-
> > > > > > rewrite.patch
> > > > >
> > > > > I'm a bit confused as with MACHINE=qemux86-64, building core-
> > > > > image-
> > > > > sato
> > > > > with ldd added to IMAGE_INSTALL, ldd works correctly even
> > > > > though it
> > > > > has
> > > > > /lib/ld-linux-x86-64.so.2 (which is listed in RTLDLIST).
> > > > >
> > > > > We have an automated QA test checking this too:
> > > > >
> > > > > http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oeqa/ru
> > > > > ntim
> > > > > e/cases/ldd.py
> > > > >
> > > > > Which version of the project are you using? How would we
> > > > > reproduce
> > > > > the
> > > > > issue?
> > > >
> > > > I am using yocto-sumo
> > >
> > > I'm not aware of any fixes since sumo in this area...
> > >
> > > > Maybe your tests are run agains an image that has the package lsb
> > > > installed. Which creates symbolic links to the standard locations
> > >
> > > There is no /lib64 in the image and I'm not using or installing
> > > lsb...
> > >
> > > There is significant rewriting done as part of:
> > >
> > > http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-core/gl
> > > ibc/glibc-ld.inc
> > >
> > > What value of RTLDLIST is your build showing?
> >
> > RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> > /libx32/ld-linux-x32.so.2"
>
> Here I see:
>
> $ MACHINE=qemux86-64 bitbake glibc -e | grep ^RTLDLIST=
> RTLDLIST="/lib/ld-linux-x86-64.so.2"

The output of RTLDLIST that I shared was from
root@qt5122:~# cat /usr/bin/ldd | grep ^RTLD
RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
/libx32/ld-linux-x32.so.2"

If I run your command

pokyuser@c10753884d1a:/workdir/build$ bitbake glibc -e | grep ^RTLDLIST=
RTLDLIST=""

If we look at log.do_compile we can see how the the value from ldd is rewritten:

LC_ALL=C sed -e 's%@RTLD@%/lib/ld-linux-x86-64.so.2%g' -e
's%@VERSION@%2.27%g' -e 's|@PKGVERSION@|(GNU libc) |g' -e
's|@REPORT_BUGS_TO@|<http://www.gnu.org/software/libc/bugs.html>|g' -e
's%@BASH@%/bin/bash%g' -e 's%@TEXTDOMAINDIR@%/usr/share/locale%g' <
ldd.bash.in | LC_ALL=C sed -f
../sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed >
/workdir/build/tmp/work/dbfp4-poky-linux/glibc/2.27-r0/build-x86_64-poky-linux/elf/ldd.new

cat git/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
/LD_TRACE_LOADED_OBJECTS=1/a\
add_env="$add_env LD_LIBRARY_VERSION=\\$verify_out"
s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-x32\)\(\.so\.[0-9.]*\)[
]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6 \2\3\4\5\6"_

which basically converts
/lib/ld-linux-x86-64.so.2
 into:
 /lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2 /libx32/ld-linux-x32.so.2

I agree that this bug is too obvious for not being noticed for a long
time. At least I use ldd a lot when thing fails ;)

Cheers

>
> Not sure why its different without looking at the code but its
> something to look into...
>
> Cheers,
>
> Richard



-- 
Ricardo Ribalda

