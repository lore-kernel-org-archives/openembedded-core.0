Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5D6C19F2C
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 07:27:33 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.2144.1659598045895852190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 00:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QJbjVYZl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id z17so19479385wrq.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 00:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=EM+dW5DuG66fz0+lhkXS70P8AiyoBCxPM0n/hnUClkQ=;
        b=QJbjVYZlyDWfNaYcjWRbvTKp/x6coLxyN3vC+b7cKgw7xGwRNgofylMksJqyVnUvlF
         NOTb0GQ7qa3vaMDs5nTZEQa8B36vX+BrejOdsCsfudCbnEDmm4JpAR97adwvPJ7unRM4
         KFBnupXOOhorRRkEPAMPBJ7Cmxs9WH3DdlWXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=EM+dW5DuG66fz0+lhkXS70P8AiyoBCxPM0n/hnUClkQ=;
        b=BxGU9x2nabiZ6QOLJHpN5FvNSD4kgNeWIBkUQxYBPo2Apq5SFfeCBKXH+fe++EaBN/
         SjRUHyEPY1d1Mf8N+6NlSIk2Avvf4QXad1BMUFPYeEACdsHqXOVugLLnnQLpcwqEsEW7
         yUK0dHEYvCqIrnjOSzkjSCDFpzptaGVEFlreOQ5ZTe31O/fS86jRgBB58Yo2sV4gH/Cz
         i7BH3hJAcrCL3XwrGTpaLXyIECA6zNxTyqwo2O2lvePjcSbVDnjDy8eZhKpaBDnGDQmR
         hgwgZTqk6eZyB0rr7DJupC9qBhOkK6CxEddUrtGtVe7nzXcQZun0Yd6syW7p8iEuOstf
         GD8g==
X-Gm-Message-State: ACgBeo1luHVthf7V2T8UMdx90AY2FInP+/y2pFyG9BW/oJU95Qs1O6HM
	B41+SbYdVifR34HrhGUvSm9Mrw==
X-Google-Smtp-Source: 
 AA6agR5IK0o01oTkaBQxTuvqayy40WZYNKbhh8Z7vZg489oO0+sRBDpSanF5yU7UURy/Gbaawikw9A==
X-Received: by 2002:adf:ebc5:0:b0:21d:640e:dc2f with SMTP id
 v5-20020adfebc5000000b0021d640edc2fmr424233wrn.227.1659598044138;
        Thu, 04 Aug 2022 00:27:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3?
 ([2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3])
        by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b003a3199c243bsm7332241wmq.0.2022.08.04.00.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 00:27:23 -0700 (PDT)
Message-ID: 
 <ffef70ec3c7139d4be3fc234c7df1362c21930a5.camel@linuxfoundation.org>
Subject: Re: [OE-core] linux-yocto 5.15.48 reproducibility failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Aug 2022 08:27:22 +0100
In-Reply-To: <170812024C9E55A6.12743@lists.openembedded.org>
References: <YsWOLwlNxhAq7sKz@mail.local>
	 <570c56bce472ec4ba6a68f537dcb1f85f99a05ea.camel@linuxfoundation.org>
	 <CADkTA4N2gGHwG7OWGY32gqLzztsTcOsGXx=-wgpJrJhkfj=OKA@mail.gmail.com>
	 <CAOSpxdZPefjY=513h0vLb-W3dPqkUzBQXh00V6t68M+-9CDogQ@mail.gmail.com>
	 <830db8ea9f131bf577340c92a36cb5b7870f315f.camel@linuxfoundation.org>
	 <CADkTA4OEvF-MDtYRaMfT=1_FGS78XDtL+gJmO1Wn3m_6tKUyeQ@mail.gmail.com>
	 <170812024C9E55A6.12743@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 07:27:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168838

On Thu, 2022-08-04 at 07:57 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2022-08-03 at 22:33 -0400, Bruce Ashfield wrote:
> > On Wed, Aug 3, 2022 at 6:46 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > On Wed, 2022-08-03 at 11:50 -1000, Steve Sakoman wrote:
> > > > On Wed, Jul 6, 2022 at 4:05 AM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
> > > > >=20
> > > > > On Wed, Jul 6, 2022 at 9:31 AM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >=20
> > > > > > On Wed, 2022-07-06 at 15:29 +0200, Alexandre Belloni wrote:
> > > > > > > Hello Bruce,
> > > > > > >=20
> > > > > > > I got the following reproducible build failures:
> > > > > > >=20
> > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/b=
uilds/1116/steps/12/logs/stdio
> > > > > > >=20
> > > > > > > To me, it looks like the in-kernel config changed, did the co=
mpression
> > > > > > > alg change?
> > > > > > >=20
> > > > > > > Are you able to look at that soon or should I file a bug?
> > > > > >=20
> > > > > > FWIW,
> > > > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2022=
0705-g8ltxczy/packages/diff-html/
> > > > > >=20
> > > > > > and CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=3Dy changed value...
> > > > >=20
> > > > > A quick look at the -stable queue to init/Kconfig does indeed sho=
w
> > > > > that option arriving .. from my scan of the change, it looks like
> > > > > there are different compilers on the hosts, and hence that check =
is
> > > > > detecting a buggy gcc (or not) and changing the value.
> > > > >=20
> > > > > So one of the build hosts is failing the test, and another isn't.
> > > > >=20
> > > > > I'm not sure how to fix that, unless we revert the change. I'll p=
onder it more.
> > > >=20
> > > > Was this issue ever resolved?  I'm seeing it on kirkstone now too :=
-(
> > >=20
> > > No, it wasn't. I took a quick look and my best guess is that we now
> > > have the kernel wanting to do $CC tests in kConfig and we don't set C=
C
> > > properly for all our make config calls. I chucked this in master-next
> > > as a quick guess at a possible fix:
> > >=20
> >=20
> > That's what we've had to do with the linker in the past, so that is
> > generally speaking the right place to force the compiler.
> >=20
> > > https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D944cc0=
4d1ed316a5652f3d058b966d4cfb9a6b73
> > >=20
> > > but others might know better where we might be missing the CC setting=
s.
> > > I suspect we need to clean up our parameters a bit looking at the
> > > different call site differences.
> >=20
> > That being said, merge_config uses the compiler like so:
> >=20
> > # Use the merged file as the starting point for:
> > # alldefconfig: Fills in any missing symbols with Kconfig default
> > # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
> > make HOSTCC=3D"$HOSTCC" HOSTLD=3D"$HOSTLD" CC=3D"$CC" LD=3D"$LD" \
> >         KCONFIG_ALLCONFIG=3D$TMP_FILE $OUTPUT_ARG $ALLTARGET
> >=20
> > And we call it like this:
> >=20
> > CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC}
> > ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"
> > CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" ARCH=3D${ARCH} merge_config.sh =
-O
> > ${B} ${config_flags} ${configs} >
> > ${meta_dir}/cfg/merge_config_build.log 2>&1
> >=20
> > So for the merging of fragments, we are already covered.
> >=20
> > and kernel_do_configure calls: KERNEL_CONFIG_COMMAND as the last thing
> > it does, which is:
> >=20
> > KERNEL_CONFIG_COMMAND ?=3D "oe_runmake_call -C ${S} CC=3D"${KERNEL_CC}"
> > LD=3D"${KERNEL_LD}" O=3D${B} olddefconfig || oe_runmake -C ${S} O=3D${B=
}
> > CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" oldnoconfig"
> >=20
> > Which already does set CC to KERNEL_CC.
> >=20
> > So unless I'm missing how KCONFIG_CONFIG_COMMAND is sneaking in, I
> > expect the behaviour will still be the same.
> >=20
> > I spent the day digging through 5.19 kernel issues, so only had a few
> > minutes to look at this tonight .. and it is late, so I very easily
> > could have missed something.
>=20
> You're not missing anything, it didn't help.
>=20
> We're seeing this on ubuntu1804 so I logged in there and experimented.
> CC is set correctly. What isn't working well is the "echo". If I change
> the command to use /bin/echo instead of plain "echo" (which is probably
> a shell builtin), it works. Otherwise running manually I see:
>=20
> <stdin>: In function 'foo':
> <stdin>:1:29: warning: missing terminating " character
> <stdin>:1:29: error: missing terminating " character
> <stdin>:2:5: error: expected ':' before '+' token
> <stdin>:2:7: warning: missing terminating " character
> <stdin>:2:7: error: missing terminating " character
> <stdin>:2:1: error: expected declaration or statement at end of input
>=20
> It is looking like this is a dash vs. bash issue. Not sure how we fix
> it yet but it points to where the issue may be.

pokybuild@ubuntu1804-ty-3:~$ /bin/dash
$ echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .\n": "+m"(*x) ::: b=
ar); return *x; bar: return 0; }' | x86_64-poky-linux-gcc -x c - -c -o /dev=
/null; echo $?
<stdin>: In function 'foo':
<stdin>:1:29: warning: missing terminating " character
<stdin>:1:29: error: missing terminating " character
<stdin>:2:5: error: expected ':' before '+' token
<stdin>:2:7: warning: missing terminating " character
<stdin>:2:7: error: missing terminating " character
<stdin>:2:1: error: expected declaration or statement at end of input
1
$ exit
pokybuild@ubuntu1804-ty-3:~$ bash
pokybuild@ubuntu1804-ty-3:~$ echo 'int foo(int *x) { asm goto (".long (%l[b=
ar]) - .\n": "+m"(*x) ::: bar); return *x; bar: return 0; }' | x86_64-poky-=
linux-gcc -x c - -c -o /dev/null; echo $?
0

I think the command gets executed by the code in
scripts/kconfig/preprocess.c:do_shell() which passes it to popen()
which uses /bin/sh. Since this command has characters with interesting
quoting requirements, I suspect our easiest solution is to submit a
patch upstream which moves the content to a file which we reference in
the command instead of using echo. cc-can-link.sh and similar kind of
give some prior art for it.

Cheers,

Richard


