Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id D8FC57F281
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:42:36 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id l14so3028923lje.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=R10r7+eCoO4OGkd5tzAAv55Onq6dipy9REmRPqprduM=;
	b=U87LzkqxA2pCG7sS1vK5aUU6tp2crHTjz4atFZxRlIfzFJnxWkUbp0fVNE9kUqmKZs
	qXm3qO82b7JdJeEzqzur1rCcjn75P96GfBvy+yhCs5LGv0tBTCF7l1aEy5rkNmRuDxYz
	D7j5PEAwkRaFWmoezIzJZn/hB0gK6Mct5Yr0AuS0HnEJGMC3V2yqyXX1RbOzBWTFfeHq
	noab4+bTynnQqeEHcLwK3qJjv6tUNSWz958jP/WJUTMy8eaa19JRpfzhUFLb/GOKRkhs
	oZ9TexHwTGwVpk0aD9U/AUQ1VR4Qzd9E5DeGlovNLTBtEaIARIChtmK56o603LboN062
	P0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=R10r7+eCoO4OGkd5tzAAv55Onq6dipy9REmRPqprduM=;
	b=HyCBamctmojPRXFuRkOYM0iVMVzu2fXdLuDiiasLEykRa4kRA7CbVDiVm+7sCHeMZJ
	hg9erpW6ee7B1KJYVkz2B2/e8fw7orliMqKowPJjgwcQqAbrgB0UHXxXQL3uiwZYlu62
	L7D78/VeXGg6ec/U7UErtjjjPfxUti3GCaAlUhqwvp2gRQuzW0BZDEqf3ant/9rwlJiC
	cRS68ERlbQN7JyWxdouReJ+Qfby3L/Q5BjsKeE+xThy9r4O4EePg6I8rHe9jm+E6Cbs5
	MT/Y4HwM3pJdqTeNT/9Z+BZkVNOMuIM5MI8imgAAqgS4joBNLo7UYIMHYlg6NJC/1wBO
	0dPg==
X-Gm-Message-State: APjAAAUYUcbu4YRsXUKvDCYvYMChj8UmR33c67VYqaaBoytXWH2mWbtb
	lEeokVFW9M/jvjx5APUXS/IJAdLtsPnC9naf4PtvT3IQ
X-Google-Smtp-Source: APXvYqyYE1Rwm7Sybn6Pyx1wvNarD7Ma7Gdy4fk98nH/notMjE5K0AP8izKYjorSL37aG0yOUqP7h5Ou4vGTB1sAMuw=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr2713233lje.118.1567698157304; 
	Thu, 05 Sep 2019 08:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjxBhq4=rvMN5DWAamV5sE-nCenqFxLdPRYNA3st2Y0Z4Q@mail.gmail.com>
In-Reply-To: <CAP71WjxBhq4=rvMN5DWAamV5sE-nCenqFxLdPRYNA3st2Y0Z4Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Sep 2019 11:42:25 -0400
Message-ID: <CADkTA4NXHjo=2daFtRbZAheunsNO-OCeVqZGQ=9ZW+1Fjqe1+Q@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: make-mod-scripts question
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
X-List-Received-Date: Thu, 05 Sep 2019 15:42:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2019 at 10:43 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hi,
>
> I was looking into a build issue today, related to signing an external
> kernel module. My build failed when calling the kernel utility
> sign-file, the error was that libcrypto.so was not found.
>
> Looking a bit more into that, I realized that make-mod-scripts will
> built some kernel utilities, including scripts/sign-file which link
> against libcrypto, however we 'copy' sign-file into
> STAGING_KERNEL_BUILDDIR.

Indeed, the build and redirected output dir will get the binaries, but
not the libraries. Either static linking of a smarter install of the
binaries would be a good idea.

>
> Later on, when my own recipe uses sign-file from
> STAGING_KERNEL_BUILDDIR, it still requires the libcrypto.so file which
> is in the make-mod-scripts per recipe sysroot. So basically my recipe
> needs a binary from STAGING_KERNEL_BUILDDIR and a shared library from
> another recipe sysroot. That looks wrong to me.
>
> My problem is fixed by adding a dependency on make-mod-scripts, it
> still feels wrong to reply on another recipe sysroot , doesn't it go
> against the whole idea of per recipe sysroot?

Agreed.

I'm wondering make-mod-scripts should both create a package and
install into the staged kernel build dir.

That way if you had a dependency on make-mod-scripts, you'd use both
the binary and the library from the recipe sysroot, but we'd also get
that shared copy for the needs in the shared kernel build directory.
Obviously the shared kernel build artifacts are a special case, and
I'm not even sure if what I'm thinking is even possible .. or is worse
than the symptom you are describing.

Just thinking out loud. Hopefully someone with more knowledge on the
packaging/internal/sstate internals will see this and have more
details.

Bruce

>
> Here is the sign-file in the kernel shared workdir:
>
> $ find tmp-glibc -name sign-file
> tmp-glibc/work-shared/open-q-212a-homehub/kernel-build-artifacts/scripts/=
sign-file
>
> And here we can see the dependency against make-mod-scripts sysroot:
> $ ldd tmp-glibc/work-shared/open-q-212a-homehub/kernel-build-artifacts/sc=
ripts/sign-file
>         linux-vdso.so.1 =3D>  (0x00007fff8299d000)
>         libcrypto.so.1.1 =3D>
> /local/mnt2/workspace2/ndec/le.um.3.4.1/build-wlan/tmp-glibc/work/open_q_=
212a_homehub-oe-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-native=
/usr/lib/libcrypto.so.1.1
> (0x00007fcb2247d000)
>         libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007fcb220b300=
0)
>         libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fcb21eaf=
000)
>         libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0
> (0x00007fcb21c92000)
>         /lib64/ld-linux-x86-64.so.2 (0x00007fcb2293c000)
>
> or like that:
> $ strings tmp-glibc/work-shared/open-q-212a-homehub/kernel-build-artifact=
s/scripts/sign-file
> | grep tmp-glib
> /local/mnt2/workspace2/ndec/le.um.3.4.1/build-wlan/tmp-glibc/work/open_q_=
212a_homehub-oe-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-native=
/usr/lib:/local/mnt2/workspace2/ndec/le.um.3.4.1/build-wlan/tmp-glibc/work/=
open_q_212a_homehub-oe-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot=
-native/lib
>
> cheers
> nico



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

