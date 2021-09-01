Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.5219.1630485532371872050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 01:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iDi4f9FG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso4123439wmc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 01:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qxeP/UeczXdyO+qSJ1ZV/1fN+VT6vZ+j98TI/QxV75c=;
        b=iDi4f9FGvabhJOi9ft7QyOf8zTfWCAjeUGPoBNMo+tIrTScssRoMjKFc8Ol45kVPJ2
         FpSerNbehnAeBleH+yFlPMUmmYMf9sXzTJxxWlhBCuOAdSnEzy+2paHHmUYMgcM8gyxP
         aVKz3F58ti7mEa4/8s12cNe8VcHUQ97/7iswQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qxeP/UeczXdyO+qSJ1ZV/1fN+VT6vZ+j98TI/QxV75c=;
        b=EqP9Fht73NKcPcM3NngqdVeS0Vi6S46+JhAbuy7cTuXtSxqU8iEqrhnFWu8pAvmoLH
         DmUtqWPrWTLvo+JrlMgDeDUQS09J39tIAekxG4ra4W0+zMIQtG1d4gwBKx+H8sUtfjW/
         C89c0EYSe0jCtrQHAwTOrGMwAIg1aYmw/DwG4X4KRzp+dPkq9IKAeyYOK5w0PwjJSvUG
         DVcC/zL4JLXekFVzimWK862pkIB7Q+WQOFQjX6qFpvHvibebWnOBgWs+wsP95jwqqpCq
         lDhIpl1CB+dSaC9CKwBnf+48l8N0xbHDVbIRZwtJUc63iIIZnJZRCM166KcW/qODg8A9
         Ekhw==
X-Gm-Message-State: AOAM532SvDCaJwKKY/ADntAGvEevo0atGOUXIMPoJGN2QSCOd555+IE7
	+gbbYfMCkT1I28BpczRZxNq6ZQ==
X-Google-Smtp-Source: ABdhPJxWbSltsQuDWdXhVToQ/cRNX0XvP+yclmLiQJu4RLwnedrkegUjs+45Z+NKnPhG6bLEjJQZ5A==
X-Received: by 2002:a05:600c:21cd:: with SMTP id x13mr8273660wmj.20.1630485530645;
        Wed, 01 Sep 2021 01:38:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7e06:66c6:32e7:e304? ([2001:8b0:aba:5f3c:7e06:66c6:32e7:e304])
        by smtp.gmail.com with ESMTPSA id m12sm20404390wrq.29.2021.09.01.01.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 01:38:50 -0700 (PDT)
Message-ID: <4be1ffd84c34d5dd4d46cc534e89620a09ea4e1a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io, 
 cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com, Khem Raj
 <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
 saul.wold@windriver.com,  martin.jansa@gmail.com, paul@pbarker.dev, Trevor
 Gamblin <trevor.gamblin@windriver.com>, anbelski@linux.microsoft.com, Vinay
 Kumar <vinay.m.engg@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  "Orling, Timothy T"
 <timothy.t.orling@intel.com>, Richard Elberger <elberger@amazon.com>,
 "Kuber, Esteban" <ekuber@amazon.com>
Date: Wed, 01 Sep 2021 09:38:47 +0100
In-Reply-To: <169F2844BF9C5B85.31425@lists.openembedded.org>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
	 <20210813151947.55142-1-vinay.m.engg@gmail.com>
	 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
	 <169C1FA457B99CA0.23238@lists.openembedded.org>
	 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
	 <169D3274AAECC435.19323@lists.openembedded.org>
	 <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
	 <87dacc6ecc7af109db0039894254c77b43ae8323.camel@linuxfoundation.org>
	 <3e7ff50b-57f8-0503-b514-e53a82e0b2d5@windriver.com>
	 <e36985f82120c87f598289c672eafdacb5e37d86.camel@linuxfoundation.org>
	 <169E4C0C80951608.1595@lists.openembedded.org>
	 <23bc2196-4f7c-4958-e191-bd6f47223da2@windriver.com>
	 <169F1E62C63E8EDC.31425@lists.openembedded.org>
	 <169F2844BF9C5B85.31425@lists.openembedded.org>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-08-27 at 13:04 +0100, Richard Purdie via lists.openembedded.org
wrote:
> On Fri, 2021-08-27 at 10:03 +0100, Richard Purdie via lists.openembedded.org
> wrote:
> > On Fri, 2021-08-27 at 00:05 -0400, Randy MacLeod wrote:
> > > 2. a reproducible build failure on CentOS-7:
> > > 
> > >     https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/597
> > > 
> > > where, we see:
> > >     = note: /bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' \
> > >     not found (required by \
> > >     /home/pokybuild/yocto-worker/reproducible-centos/build/\
> > >     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
> > >     1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)
> > > 
> > > 
> > > 
> > > 
> > > 
> > >     error: linking with `\
> > >     /home/pokybuild/yocto-worker/reproducible-centos/build/\
> > >     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
> > >     1.54.0-r0/wrapper/target-rust-ccld` failed: exit status: 1
> > > 
> > 
> > I had a quick look at this. It reproduces if you build cargo-native on a centos7
> > machine with our M2 buildtools tarball in the environment of the build.
> > 
> > Adding the uninative relocation hack to the cargo snapshot binary with:
> > 
> >  do_cargo_setup_snapshot () {
> >         ${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
> > +       # Need to use uninative's loader if enabled/present since the library paths
> > +       # are used internally by rust and result in symbol mismatches if we don't
> > +       if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
> > +               patchelf-uninative ${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo --set-interpreter ${UNINATIVE_LOADER}
> > +       fi
> >  }
> > 
> > didn't help.
> > 
> > Running the command it mentions failing by hand in the same toolchain enabled
> > shell works. It therefore seems likely that something rust is putting into the
> > environment is breaking things. What that is, I don't know, I'm out of time to
> > debug further.
> > 
> > It looks to me like it is using the ld from the host instead of the buildtools
> > tarball. I did change tmp/work/x86_64-linux/cargo-native/1.54.0-
> > r0/wrapper/target-rust-ccld to a full path to gcc and messed with PATH to ensure
> > it would find "our" ld first but that didn't help.
> > 
> > In the error output is some:
> > 
> > Usage: which [options] [--] COMMAND [...]
> > Write the full path of COMMAND(s) to standard output.
> > 
> > suggesting some which call might not be compatible with centos7?
> 
> temp/run.do_compile:	bbnote "cargo = $(which /home/pokybuild/yocto-worker/reproducible-centos/build/build-st/tmp2/work/x86_64-linux/cargo-native/1.54.0-r0/cargo-1.53.0-x86_64-unknown-linux-gnu/bin/cargo)"
> temp/run.do_compile:	bbnote "rustc = $(which ${RUSTC})"
> 
> so probably not important.
> 

Distilling through all the noise, we reach this test case:

where you:

a) install buildtools-tarball and source the buildtools env
b) build cargo-native

then the failure can be reproduced with something like:

[pokybuild@centos7-ty-4 build-st]$ LD_LIBRARY_PATH=/home/pokybuild/yocto-worker/reproducible-centos/build/build-st/tmp/work/x86_64-linux/cargo-native/1.54.0-r0/recipe-sysroot-native/usr/lib /home/pokybuild/yocto-worker/reproducible-centos/build/build-st/tmp/work/x86_64-linux/cargo-native/1.54.0-r0/wrapper/target-rust-ccld
/bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' not found (required by /home/pokybuild/yocto-worker/reproducible-centos/build/build-st/tmp/work/x86_64-linux/cargo-native/1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)

which is because /bin/sh comes from the host and links against libtinfo,
LD_LIBRARY_PATH is set by cargo to the recipe sysroot, it finds our libtinfo
rather than the host one and it is incompatible with the libc/loader being used
by /bin/sh.

I did find this is documented in: 

https://doc.rust-lang.org/cargo/reference/environment-variables.html#dynamic-library-paths

and I suspect this is because it is adding "the rustc sysroot library path".

This also explains why running the reported ccld command by hand works since the
LD_LIBRARY_PATH is no longer set.

How to fix this? No idea.

Could/should we make rust use a different sysroot location?

Cheers,

Richard


