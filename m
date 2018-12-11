Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id CBB6A6069C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 14:17:53 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v5so10904901lfe.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 06:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Psb7cZe/agvohUWO4H8sCJtXDDldskUs1++mSf1MPHM=;
	b=OhnDHYxJ+l2aIWyMQNEqndxE4rfGPEJTjmFH0kxLDJU95tZJ5YBSjDzD+hg1l5J2Dr
	bOnyNSzCbU+KrbOPQXAvCC0I8ojWA0/+yhSpW3rm3PlmCMGO0wwqdE9xwxo9SzXjkJbE
	MzYGRoUQgWoXsO1GLtaxP2Cs1nOjXj6PKRdpDb1Xs4Gj1Usej0zHwrgu2GamWp+mkHrr
	c1KbIS1qAIYvLbw8zfeM0Vz6GRsXkfdswWohtENYuU0EV7rLEYBNuxY/kVBMX5jv88w6
	KWrtKp/87Qn+qmMSePkcNIlEUwzDEQKZ1ByDV488ybbgQmFY1VMiHVDZ0oHx2Mm08ZFD
	xZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Psb7cZe/agvohUWO4H8sCJtXDDldskUs1++mSf1MPHM=;
	b=W/jUDHBlvQbUl5J9zzpbaeVOwjY7WFJfzSXfqsa/Ysb/E5R/dWHIbQGSxg0OMaFGa8
	SyUh4zUDIq1tNGQUHp4mhe0+WQDe6pgDhKJWJnGnymVYCBllRUO3r88JnOAdI8Pc7tdZ
	AgiCwLMM2HSrQd7EOHZhKhIX9drDaNHJxeGAlTp4FXtuzwCgDPcv5cvB/q+opDYeUA/P
	Gc5jitZPdSFgOh49KEpOLiTOcV9EZEy8P9mC5nmCAZlJas6EGryAeBmLba3RdBDGBl1N
	uBoBMOC3cH5+bdVfOr+pCV6Uzx45ObePDAGK1afwTqn0yFTtA4ScBuxaCVrQTh4xaQ9a
	0yYA==
X-Gm-Message-State: AA+aEWZwrPJzGwIVmjzu64y7qHDpXoHeCOobvYphP7GqiELoG/lmvIhj
	vWKSn4gGs4gXhp1w0Jpd4m9VgCLAln/fk2/0jRk=
X-Google-Smtp-Source: AFSGD/WUg0OHEyIBTMaMK11VvwH6NV3vHPp3sUiIkXwcOdIYMu9CFOTzFsjEkPJy5ovT8nWMzfx4NThbSuecaaAfStU=
X-Received: by 2002:ac2:41cb:: with SMTP id d11mr9918641lfi.3.1544537873731;
	Tue, 11 Dec 2018 06:17:53 -0800 (PST)
MIME-Version: 1.0
References: <1542809165-118869-1-git-send-email-zhe.he@windriver.com>
	<CADkTA4NenFJOSNuNz_YRPaGSqoaqRjFUBVwo4s=-dA4jmnUJ_A@mail.gmail.com>
	<eb1e9d93-0f16-36c0-f4f1-07e06df8456f@windriver.com>
In-Reply-To: <eb1e9d93-0f16-36c0-f4f1-07e06df8456f@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Dec 2018 09:17:42 -0500
Message-ID: <CADkTA4MdPYvpBw18TP_YCJZ7j8jLXfELLH=u4Q8huuBUoM01jA@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] linux-libc-headers: Fix build failure by using fixed temporary file instead of pipe
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
X-List-Received-Date: Tue, 11 Dec 2018 14:17:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2018 at 2:49 AM He Zhe <zhe.he@windriver.com> wrote:
>
>
>
> On 2018/12/11 00:58, Bruce Ashfield wrote:
> >
> >
> > On Wed, Nov 21, 2018 at 9:06 AM <zhe.he@windriver.com <mailto:zhe.he@wi=
ndriver.com>> wrote:
> >
> >     From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
> >
> >     This is a workaround for the following possible build failure.
> >
> >     *** Compiler lacks asm-goto support.. Stop.
> >
> >     When building linux-libc-headers we need to use binutils on build m=
achine.
> >     binutils v2.31 introduces a bug that could cause scripts/gcc-goto.s=
h to fail
> >     when running in an environment where /tmp is rarely used, e.g. in d=
ocker.
> >
> >     Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windrive=
r.com>>
> >     ---
> >     v2: Improve commit log
> >     v3: Shorten long lines as patchwork suggested
> >     v4: Shorten subject line...
> >
> >      ...-fixed-temporary-file-instead-of-pipe-for.patch | 70 ++++++++++=
++++++++++++
> >      .../linux-libc-headers/linux-libc-headers_4.18.bb <http://linux-li=
bc-headers_4.18.bb>  |  4 ++
> >      2 files changed, 74 insertions(+)
> >      create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-li=
bc-headers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> >
> >     diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-head=
ers/0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch b/meta/=
recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed=
-temporary-file-instead-of-pipe-for.patch
> >     new file mode 100644
> >     index 0000000..0d8fa80
> >     --- /dev/null
> >     +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/000=
1-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> >     @@ -0,0 +1,70 @@
> >     +From 3bbea65e11918f8753e8006a2198b999cdb0af58 Mon Sep 17 00:00:00 =
2001
> >     +From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
> >     +Date: Wed, 21 Nov 2018 15:12:43 +0800
> >     +Subject: [PATCH] scripts: Use fixed temporary file instead of pipe=
 for
> >     + here-doc
> >     +
> >     +There was a bug of "as" in binutils that when it checks if the inp=
ut file and
> >     +output file are the same one, it would not check if they are on th=
e same block
> >     +device. The check is introduced by the following commit in v2.31.
> >     +
> >     +https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dcom=
mit;h=3D
> >     +67f846b59b32f3d704c601669409c2584383fea9 <https://sourceware.org/g=
it/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D+67f846b59b32f3d704c60166=
9409c2584383fea9>
> >
> >
> > Can you double check the links to the upstream changes ? They didn't wo=
rk
> > for me.
>
> I guess that's due to the leading "+" prepended to the second line of the=
 link.
> It's part of the patch, not of the link.

That's not what I'm seeing. Even when I select and paste the link, I'm gett=
ing
a:  "400 - Invalid hash parameter" back from the upstream git repo.

>
> >
> >
> >
> >     +
> >     +The here-doc usage in this script creates temporary file in /tmp. =
When we run in
> >     +an environment where /tmp has rarely been used, the newly created =
temporary file
> >     +may have a very low inode number. If the inode number was 6 which =
is the same as
> >     +/dev/null, the as would wrongly think the input file and the outpu=
t file are the
> >     +same and report the following error.
> >     +
> >     +*** Compiler lacks asm-goto support.. Stop.
> >     +
> >     +One observed case happened in docker where the /tmp could be so ra=
rely used that
> >     +very low number inode may be allocated and triggers the error.
> >     +
> >     +The fix below for the bug only exists on the master branch of binu=
tils so far
> >     +and has not been released from upstream. As the convict is introdu=
ced since
> >     +v2.31, only v2.31 is affected.
> >     +
> >     +https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dcom=
mit;h=3D
> >     +2a50366ded329bfb39d387253450c9d5302c3503 <https://sourceware.org/g=
it/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D+2a50366ded329bfb39d38725=
3450c9d5302c3503>
> >     +
> >     +When building linux-libc-headers we need to use "as" in binutils w=
hich does not
> >     +contain the fix for the moment. To work around the error, we creat=
e a fixed
> >     +temporary file to contain the program being tested.
> >     +
> >     +This patch also removes ">/dev/null 2>&1" so we will have more dir=
ect error
> >     +information in case something else wrong happened.
> >     +
> >     +Upstream-Status: Inappropriate [A work around for binutils v2.31]
> >
> >
> > It would be nice to have a way to test for the host binutils version, s=
ince without it
> > we have no way to know when we can stop carrying this change.
> >
> > Not that the change is all that complex or should cause any problems, i=
t is just
> > very open ended without a check.
> >
> > Did you look into any conditional way to test the binutils in the recip=
e and only
> > patch if required ?
>
> I have not tried but we can prepend the do_patch of linux-libc-headers to
> check the host binutils' version and modify the SRCURI there depending on
> the result.
>
> But the users may never want to upgrade their host binutils and thus need=
 this
> workaround forever. So even we know what the version is on the host and
> warn them to upgrade, it seems we still don't know when we can drop the
> workaround. I'm not sure the policy. Can we drop it when all supported
> distributions have included the fix?

That is my suggestion (that we have a way to eventually drop the
patch), so either
we have to manually keep track of the host binutils versions and
revisit the patch
each release, we have some sort of check and conditional apply or we submit=
 the
change to the upstream binutils -stable in the hopes that any distro
still tracking
v2.3x would bump to a 2.3x version with the change, and then we'd no longer=
 have
to carry it anymore ... (but as you say in the commit it isn't a
problem in other
binutils, just this version, so there's likely no way to submit it
upstream and have
it do any good .. the problem is solved already).

That being said, I was more interested in hearing if you had looked into
conditional application, or if you had considered how we could
eventually drop the
patch, since I agree that as it currently stands .. we may have to
carry it for a long
time. We've had that discussion now, so we are covered.

Since the patch is simple enough, I'm not insisting on the complexity
of a dynamic
check, and I can't see another way to fix it.

So if you could double check the link to the upstream commit, I can
ack the patch
and it can go in as-is.

Cheers,

Bruce

>
> Thanks,
> Zhe
>
> >
> > Bruce
> >
> >
> >
> >     +
> >     +Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriv=
er.com>>
> >     +---
> >     + scripts/gcc-goto.sh | 7 ++++++-
> >     + 1 file changed, 6 insertions(+), 1 deletion(-)
> >     +
> >     +diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh
> >     +index 083c526..0aaf1b4 100755
> >     +--- a/scripts/gcc-goto.sh
> >     ++++ b/scripts/gcc-goto.sh
> >     +@@ -3,7 +3,9 @@
> >     + # Test for gcc 'asm goto' support
> >     + # Copyright (C) 2010, Jason Baron <jbaron@redhat.com <mailto:jbar=
on@redhat.com>>
> >     +
> >     +-cat << "END" | $@ -x c - -c -o /dev/null >/dev/null 2>&1 && echo =
"y"
> >     ++TMPFILE=3D`mktemp -p .`
> >     ++
> >     ++cat << "END" > ${TMPFILE}
> >     + int main(void)
> >     + {
> >     + #if defined(__arm__) || defined(__aarch64__)
> >     +@@ -20,3 +22,6 @@ entry:
> >     +       return 0;
> >     + }
> >     + END
> >     ++
> >     ++$@ -x c ${TMPFILE} -c -o /dev/null && echo "y"
> >     ++rm ${TMPFILE}
> >     +--
> >     +2.7.4
> >     +
> >     diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-head=
ers_4.18.bb <http://linux-libc-headers_4.18.bb> b/meta/recipes-kernel/linux=
-libc-headers/linux-libc-headers_4.18.bb <http://linux-libc-headers_4.18.bb=
>
> >     index eb7bee7..00420aa 100644
> >     --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1=
8.bb <http://linux-libc-headers_4.18.bb>
> >     +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1=
8.bb <http://linux-libc-headers_4.18.bb>
> >     @@ -9,5 +9,9 @@ SRC_URI_append_libc-musl =3D "\
> >          file://0001-include-linux-stddef.h-in-swab.h-uapi-header.patch=
 \
> >         "
> >
> >     +SRC_URI_append =3D "\
> >     +    file://0001-scripts-Use-fixed-temporary-file-instead-of-pipe-f=
or.patch \
> >     +"
> >     +
> >      SRC_URI[md5sum] =3D "bee5fe53ee1c3142b8f0c12c0d3348f9"
> >      SRC_URI[sha256sum] =3D "19d8bcf49ef530cd4e364a45b4a22fa70714b70349=
c8100e7308488e26f1eaf1"
> >     --
> >     2.7.4
> >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@=
lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

