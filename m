Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5662476057
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 23:39:45 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id s13-v6so987022uad.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 16:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HIs8DNUFzbXprl7tW9jbJXYm14cc13uDDRx4XJei5Ek=;
	b=Dh+jjYugxflfN916WnUSfrYvb+e06i93BX9207blOWmemnS/+jwoJ+0M8mfTpXE1++
	JGkHxVHosgqmePkvxPLZMd5lNMCFqer2QCa0Y8SASzUPlufK18oxjGLOsJdzvAuiVziR
	pNJ/t6pWhxzQOtA94MO65dzQRvP3hIaKIatsvYXLCg9ioJNxOY7oql+TUjWe6i2njcs0
	NHLvMkwFVuZWfcHpH+nwCFxGGNXaTk8JxC/FUprceWKogvrBs1CWg11UUVTPciJhOric
	kqr2zitN1aicG5hi3owtNGgzAMcXsI7NUinnpZtwBgCpi5DYdlZQPu49uSIDq7RTZ5fo
	N5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HIs8DNUFzbXprl7tW9jbJXYm14cc13uDDRx4XJei5Ek=;
	b=VNFbikohkmmqwhTSH+CmF9BX1gA9/jfUJ7/bOGH+/m0BDwRxzjv5EYjR52/5kCM27J
	wpxVZN2v2M0nsuscXYfMteezxxvKkOdH3gnswHObHvBVFLxIliPjDQ52fNwyXbMDnsZR
	bpn0G9d/PyKHctzfUmQYSpMhbBOb/IXbzNwouUMSziD7LK943F2uFuo5hKYfxK9yWNaU
	i2flokUDLyozko7tS1w6/ckwpL4JbhMIZUie9iRVskxg55l9i1E0EVC/4yq4b8LDmXKE
	Iud361Lxm4/MLlPJ278LORH8CkyxO0KJp/ljwmwRtuz6UgKA7L5ZR4rKD4rdnUhYtX98
	NXAQ==
X-Gm-Message-State: APt69E1uCPcYwBzWc5+YB8cF9uj5VMBwwaRtofIMbGLUecGdOauSnmk/
	rziEZmy5EEP4ZbkCEmaXv803GcRhi8qZdnQ2cT4=
X-Google-Smtp-Source: ADUXVKLHP30sYUtb/VAd5CqwvuDJfqNaJmqsMWVsIzbz4/ssGK0A/DbCb5rG5p+XhtrL4pnnee+zTMvknP5ExYsiGgM=
X-Received: by 2002:ab0:5851:: with SMTP id
	p17-v6mr11832542uac.164.1529451585903; 
	Tue, 19 Jun 2018 16:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
	<282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
	<b536b753-8e56-bb37-5a7a-1f66092e9c02@windriver.com>
	<CANNYZj8M+88frU6ci4n-=ufcMts1764FPK2AdbYSkmboafsnfg@mail.gmail.com>
	<CADqQcK7Q_eZBoRiE88_XY=FbZVfJSpkybHdTCPqFM9okVZqYcQ@mail.gmail.com>
	<CAJTo0LaA44BywL8+0kNRnPJD5b90tA9M0B6wEZ7hOJcbX=L+ZA@mail.gmail.com>
	<CAJTo0Lbc-csvZj3qZPEvqbVbH-U0TyCgqeUQeF1Z_=xwfe7=NA@mail.gmail.com>
In-Reply-To: <CAJTo0Lbc-csvZj3qZPEvqbVbH-U0TyCgqeUQeF1Z_=xwfe7=NA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jun 2018 16:39:30 -0700
Message-ID: <CAMKF1soxbtYCax9tiwNwySfy0-+1VAhdbJ2zQMm=vecettKx_w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 23:39:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 19, 2018 at 4:13 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> Okay, odd.  Hacked in a few compile fixes and now systemd v237 fails
> to build with Meson git master:
>
> | FAILED: libsystemd.so.0.21.0
> | powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=7400 -mno-spe
> -fstack-protector-strong -D_FORTIFY_SOURCE=2 -no-pie -fno-PIE
> --sysroot=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot
>  -o libsystemd.so.0.21.0  -Wl,--no-undefined -Wl,--as-needed -shared
> -fPIC -Wl,--start-group -Wl,-soname,libsystemd.so.0
> -Wl,--whole-archive src/libsystemd/libsystemd.a
> src/journal/libjournal-client.a -Wl,--no-whole-archive -Wl,-z,relro
> -Wl,-z,now -pie -Wl,--gc-sections src/basic/libbasic.a
> src/basic/libbasic-gcrypt.a -pthread -shared
> -Wl,--version-script=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/git/src/libsystemd/libsystemd.sym
> -lrt -Wl,--end-group
> /data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr/lib/liblzma.so
> /data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/lib/libcap.so
> /data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr/lib/libblkid.so
> -lrt -m32 -mhard-float -mcpu=7400 -mno-spe -fstack-protector-strong
> -D_FORTIFY_SOURCE=2 -no-pie -fno-PIE
> --sysroot=/data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong
> -Wl,-z,relro,-z,now
> | /data/poky-tmp/master/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr/lib/../lib/crt1.o:(.rodata+0x4):
> undefined reference to `main'
>
> I'm guessing the compile option re-ordering is going wrong with our
> compiler flags?
>

When building a .so we need to remove pie flags regardless for linker
and compiler and replace with -fPIC like libtool does
pie flags are only relevant when building executable.
Can we try with v238  and see if that helps ?


> Ross
>
> On 20 June 2018 at 00:02, Burton, Ross <ross.burton@intel.com> wrote:
> > On 19 June 2018 at 21:24, Nirbheek Chauhan <nirbheek.chauhan@gmail.com> wrote:
> >> On Wed, Jun 20, 2018 at 1:39 AM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >>> FWIW, I did fix a similar (or maybe even same) issue with this patch:
> >>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/meson/meson/0001-Linker-rules-move-cross_args-in-front-of-output_args.patch
> >>>
> >>> It's possible that more rearranging needs to be done, or this patch no
> >>> longer has the desired effect.
> >>>
> >>
> >> So far in this thread, I don't see any changes that would cause this
> >> issue, and that patch shouldn't change things either. The bisection is
> >> probably significant, but I am not sure what's going.
> >>
> >> Also, in general please try to talk to us first before doing a change
> >> like that (switching the order of cross_args) so we can investigate
> >> and figure out what we should fix. The cross_args are at the end so
> >> they can override existing arguments, such as -D flags or -W flags.
> >>
> >> Another thing to try would be current git, which has significant
> >> changes in how we do library resolution, de-duplication, and so on.
> >> Specifically, instead of `-lfoo`, we now prefer full paths to the
> >> library to use instead since this allows greater flexibility in
> >> selecting whether to use shared or static libraries.
> >
> > So I just generated a snapshot of current git and am building systemd
> > with it.  Interestingly, the flag order change is resulting in what
> > were warnings now being fatal and systemd fails to build.  One was
> > easily fixed with a patch from master, the other will have to wait
> > until tomorrow morning, but I will get back to this.
> >
> > Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

