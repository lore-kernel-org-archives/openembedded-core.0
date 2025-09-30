Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F696CCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 14:55:41 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.web11.27452.1759244132311079156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 07:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gavAjFpx;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-635401a8f5aso4812695d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759244131; x=1759848931; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GW9C2dc6obWbLBw2JwkiKtnYRlI5MfqJHh5byvEWMcM=;
        b=gavAjFpxEcdsxBwFVwmRxgtWrOm4xJzBDJ/wlwWMXVnGjG/ptCDW8OmaD4UFHSReRe
         mijLFhnQ6a9iEcY3qFtIJzVrChcjO9THa+ddqciVutqOr5NYDUZLWinaBoIpVxCZ8tlK
         j713uiIRZbHcW0aupHgkt2SgeOulMRe1CuYNCdEtSHFj7nFvm4GNFFoCHAyjZkFwBysh
         KJCfcHfXVgUxjNMZoq5+Dftk/FJscHPIln2r34FiFvGbJDhjEJu7jNoMuzv7pNpieDKi
         mX9Ob+wU9L3uGgeJ6u0QSWwJd8mwMw0zfaLZ7mqfiDIJuvxx4aM+qbqX0/HJzOnVo+fE
         LgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759244131; x=1759848931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GW9C2dc6obWbLBw2JwkiKtnYRlI5MfqJHh5byvEWMcM=;
        b=f3wySXwQeiElV+0bRUQQMEae/vBy/1TYX3kr8512qdzFTRETWuGiHxIl32T2mxURe/
         YdZ4fSeI7KKVUHG9QSM/76g9FHwx81+GEes09jrb/YCQjUB1XA3enKpp+59qxXLsOMsm
         eGmLGJ1jIhp8AS3vzeIrxModkPm6RwueKwXVm9u7NTADjvG8+LDZ2xpcNUJRkGa55RDJ
         0it7L7LIh0D/zowTgaFU0TSEFS4E7gUvuwYjIGuYAfjz/v6zA873t2gUB7ygUHgSRmy/
         TTdFUa6fEmJ6YAHcX4t3e8Ej70GmkAilbDVp9RtnODp7BxVhawFtPoxARH5khDBTlO7O
         ajSg==
X-Gm-Message-State: AOJu0Yzu/jqQG9E4mBbINQ1YKJOexjG+DHSWhotubq2NOz36ZUjRmgPN
	H4VN7GlZEIjtDheg5/6OtDm1zXRAvkNFIc2kFilvlkkR+5KfxWrVAgUbDUpF2VdA3EZm0g5BAtj
	P+y9QuJywqdHhav64ujArMLB+V72cmbk9oTQwGiA=
X-Gm-Gg: ASbGncsoC/SYuspFrAW/KbaVRP37WJN634/Y4v+RSGThoEdV3ZVvt24Ho3wmRUnh6xb
	BdltVr6riAXrmAG9oLRBRa+X4eB5c37IXrPP8m7kvEAJdlDS4IjKVktJur7Nd3WSlnnLwX/hLYQ
	/SLOP91kPt5/i8AcIjwbhSSgRt1mLUBUd6ehk/d5bbNmOQ39nGqHeUWE8ogI2qsDVJP1UuNiTCL
	Ql+2KaFxzm+TdRRLTLP+OSZT4qgOcPiBmd3Ov0Kcu5D2TjOF6vC1KDpaDy8qEz8YahcEf1TXf80
	DPhaPn85aBWhc5tx26p5GzyHqH2/8xGnL3Ri06RzuQKjzQnSA0yGbJp1WyjfK4KjR/RtNA==
X-Google-Smtp-Source: AGHT+IEt5rA/TL4vUBldkQPiqjTd94kgpiZu375CZtrifdQPrwT/ADnQ0JmOHgtbmKbmc5XLembUZABOMRCq1O2RRd4=
X-Received: by 2002:a05:690e:1583:20b0:635:4ecc:fc28 with SMTP id
 956f58d0204a3-63b6ff75980mr172068d50.48.1759244131063; Tue, 30 Sep 2025
 07:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAD_4BXiwzc0VBdNjptP3N2Hj2=czhEEbLw4GOphNNnwnj9uTPQ@mail.gmail.com>
 <CAMKF1soVEKaJcH=J99=eUKor+1gzE3RAB0cHaTnET68f4DnAeQ@mail.gmail.com>
 <CAD_4BXiRTKx5HPNqmroz1fO3T8ggmQUVXa+=HJT=saLtg5PJzw@mail.gmail.com>
 <CAMKF1sqwuC=AGzEa7W+EtfZM4fKvdXv-BP7YYhvhX5RD68owJw@mail.gmail.com> <CAD_4BXi_7XRk9KGvwvfoea6_uZQ2bgtpqqP51ht1JU4nC6D1-Q@mail.gmail.com>
In-Reply-To: <CAD_4BXi_7XRk9KGvwvfoea6_uZQ2bgtpqqP51ht1JU4nC6D1-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Sep 2025 07:55:04 -0700
X-Gm-Features: AS18NWBuF1yZ7SwPbP5bCGH65MkkhftJksaPNIv8nfdEMK2AqBH_kwriDb3slV4
Message-ID: <CAMKF1srtMC5ATe8Cm81aUFwZ5B+uazzx6RPvOggodB_BK1gfHQ@mail.gmail.com>
Subject: Re: [OE-core] Distro wide LTO broken?
To: William Kennington <william@wkennington.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 14:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224189

On Tue, Sep 30, 2025 at 12:50=E2=80=AFAM William Kennington
<william@wkennington.com> wrote:
>
> On Mon, Sep 29, 2025 at 7:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Mon, Sep 29, 2025 at 5:19=E2=80=AFPM William Kennington
> > <william@wkennington.com> wrote:
> > >
> > > On Mon, Sep 29, 2025 at 11:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com=
> wrote:
> > > >
> > > > On Mon, Sep 29, 2025 at 3:51=E2=80=AFAM William Kennington via
> > > > lists.openembedded.org
> > > > <william=3Dwkennington.com@lists.openembedded.org> wrote:
> > > > >
> > > > > If I add the following to my distro, the build breaks for the ope=
nssl
> > > > > and other core packages due to having build path impurities in th=
e
> > > > > static libraries created.
> > > > >
> > > > > ```
> > > > > require conf/distro/include/lto.inc
> > > > > DISTRO_FEATURES +=3D "lto"
> > > > > ```
> > > > >
> > > > > The errors I get are all like
> > > > > ```
> > > > > ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
> > > > > /usr/lib/libssl.a in package openssl-staticdev contains reference=
 to
> > > > > TMPDIR [buildpaths]
> > > > > ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
> > > > > /usr/lib/libcrypto.a in package openssl-staticdev contains refere=
nce
> > > > > to TMPDIR [buildpaths]
> > > > > ERROR: openssl-3.5.2-r0 do_package_qa: Fatal QA errors were found=
, failing task.
> > > > > ERROR: Logfile of failure stored in:
> > > > > /home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-=
linux/openssl/3.5.2/temp/log.do_package_qa.118335
> > > > > ERROR: Task (/srv/yocto/poky/meta/recipes-connectivity/openssl/op=
enssl_3.5.2.bb:do_package_qa)
> > > > > failed with exit code '1'
> > > > > ```
> > > > >
> > > > > Probably there is just some kind of flag missing in the LTO build
> > > > > options to filter out the build directory, as -ffile-prefix-map a=
nd
> > > > > whatnot are already present in the builds. I haven't yet figured =
out
> > > > > exactly what is contributing to this impurity.
> > > > >
> > > >
> > > > Inspect the .a files ( maybe using strings or binary viewing tools
> > > > like xxd ), with LTO they are flat objects with additional informat=
ion
> > > > for
> > > > LTO to work and I think it will give more information.
> > >
> > > Yeah, I believe it's just a single remapping we are missing somewhere
> > > that is allowing the extra string to be added into the binary. It's
> > > been a while since I've worked on this kind of impurity stripping, so
> > > it will probably take a bit to get used to the tooling again.
> > > Hopefully I find the root cause and we can strip it out
> > >
> > > An example invocation looks like the following. All other object file=
s
> > > I looked at share the same impurity which ends up in the static
> > > library later
> > > ```
> > > aarch64-oe-linux-gcc  -mcpu=3Dcortex-a76.cortex-a55+crypto
> > > -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> > > -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > > --sysroot=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-cr=
ypto-oe-linux/openssl/3.5.2/recipe-sysroot
> > >  -I. -Iinclude -Iapps/include -I../sources/openssl-3.5.2
> > > -I../sources/openssl-3.5.2/include
> > > -I../sources/openssl-3.5.2/apps/include  -fPIC -pthread
> > > -Wa,--noexecstack -O2 -g -flto -ffat-lto-objects -fuse-linker-plugin
> > > -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cort=
exa55-crypto-oe-linux/openssl/3.5.2/s
> > > ources/openssl-3.5.2=3D/usr/src/debug/openssl/3.5.2
> > > -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cort=
exa55-
> > > crypto-oe-linux/openssl/3.5.2/build=3D/usr/src/debug/openssl/3.5.2
> > > -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cort=
exa55-crypto-oe-linux/openssl/3.5.2/recipe-sysroot=3D
> > >  -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cor=
texa55-crypto-oe-linux/openssl/3.5.2/recipe-sysroot-native=3D
> > >  -pipe -DOPENSSL_USE_NODELETE -DOPENSSL_PIC
> > > -DOPENSSLDIR=3D"\"/usr/lib/ssl-3\""
> > > -DENGINESDIR=3D"\"/usr/lib/engines-3\""
> > > -DMODULESDIR=3D"\"/usr/lib/ossl-modules\"" -DOPENSSL_BUILDING_OPENSSL
> > > -DNDEBUG  -MMD -MF apps/lib/libapps-lib-app_x509.d.tmp -c -o
> > > apps/lib/libapps-lib-app_x509.o ../sources/openssl-3.5.2/apps/l
> > > ib/app_x509.c
> > > ```
> > > and the partial strings dump with the impurity looks like
> > > ```
> > > vtmp
> > > unsigned int
> > > /usr/src/debug/openssl/3.5.2
> > > ../sources/openssl-3.5.2/apps/lib/app_x509.c
> > > /home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linu=
x/openssl/3.5.2/build
> > > include/openssl
> > > /usr/lib/aarch64-oe-linux/gcc/aarch64-oe-linux/15.2.0/include
> > > ../sources/openssl-3.5.2/include/openssl
> > > /usr/include
> > > ../sources/openssl-3.5.2/apps/lib
> > > ../sources/openssl-3.5.2/apps/include
> > > app_x509.c
> > > ```
> >
> > If you already know its coming from  app_x509.c, then you have
> > narrowed it down a step. Next, would be
> To be fair, it's basically every invocation of `gcc ... -c` that
> produces it. I just picked an arbitrary file that was easy to find
> that happens to carry the issue.
>
> > to build just this file with -dD -E option and inspect if it contains
> > any live string containing
> > "/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux=
/openssl/3.5.2/build"
> > if it does not find it. then perhaps build the assembly output with
> > -fverbose-asm -S
> > option and look for this string in the generated asm file.
>
> I ran this, and didn't see anything containing the path. I think it's
> just a bug with the handling of `-ffile-prefix-map` because it looks
> like the PWD being used is exactly listed
>
> Tried the latest snapshot of gcc 15 too just to see if they fixed
> anything. Nothing in the git log looks relevant and it doesn't fix the
> issue.
>
> Did some more digging and found out that if i remove
> `-ffat-lto-objects` I don't have the issue anymore.
> Seems like maybe this is related to
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109805

yeah seems to be the problem you are seeing as well. For tests try passing

LDFLAGS +=3D "${DEBUG_PREFIX_MAP}"

and see if it helps.
>
> >
> > > >
> > > > > Prior to rebasing on the latest master, LTO was working fine glob=
ally.
> > > >
> > > > what is the delta we are talking about here ?
> > >
> > > Sadly this was long ago `25d60ac6f61cc186b4c5a961554bee583736fd17`
> > > from early 2024. Doing any kind of bisection is probably pointless so
> > > I just need to figure out this new impurity (or maybe just the check
> > > got added since then)
> >
> > Yeah that will take too long to bisect so leave that aside.
> >
> > >
> > > >
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#224137): https://lists.openembedded.org/g/ope=
nembedded-core/message/224137
> > > > > Mute This Topic: https://lists.openembedded.org/mt/115492623/1997=
914
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/u=
nsub [raj.khem@gmail.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >

