Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.5259.1630485893714509011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 01:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XYaUnkGp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id u9so3240544wrg.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 01:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LvaAPQU3IPo+2c+L5aYd9w5thEPgrEMkBrcphmOTEFU=;
        b=XYaUnkGpEabD4FBHlXqPF1mk3QWmHUNAjW6W51tCkCQhCy469w+AwwQZfoEuwjKQ4H
         aKhsz+1MrG5fsufl9BVXduP/auPDSah580eOmRZabPVyYM1nOEo86tg4g2QkYFN6Kp4E
         lNU1xub7fjjQtI953E+YF1WcN976QECtPiTjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LvaAPQU3IPo+2c+L5aYd9w5thEPgrEMkBrcphmOTEFU=;
        b=Yrk6o3tfnPoOQu82srJcvkRh+sMDSEGEA5JYhSZMSZ8GlyvdpaR7M3udTlTULXYr41
         sxEFw1T/pJFJWn9PsLRmBkKZ9/OfPIE5f4QUzsjzq/7R+kN953TP0B6yXUKmS6YVllpv
         /PiDPvcdXpPeKdfuAKoqrcoTWvCUcDaCBMtwR/8LdIOqdfGkanamUjJWvOmNR0wgQCI+
         qzllo2hI23GzO5xjEzO0g5a9jLpBG5sOEZGibC5/v+tpY5NUoj0NNUeVKeDSTtoc5zjl
         Qv/jS/dwPstxz6lM+eEMcp6YnPwgRcpbKA74u3iVq62EtHZ01hQrKpHbhRhptqWq7/yP
         sAtg==
X-Gm-Message-State: AOAM531wWrpMFky5C0Rd731JUuA8ZL3bqSz98PS2DJHfH6UR53xNMEUN
	Sj+8e/AvV/sVCBxkVopfZnvrBw==
X-Google-Smtp-Source: ABdhPJxnkef8JE9CEPtx5jJSH7IsFTo6VZbQv7zGwcnxcHJIwGZPyBrb4WmvNXTcqyOTbfnFSjBEtw==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr36569793wrv.71.1630485891720;
        Wed, 01 Sep 2021 01:44:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7e06:66c6:32e7:e304? ([2001:8b0:aba:5f3c:7e06:66c6:32e7:e304])
        by smtp.gmail.com with ESMTPSA id y24sm5236494wma.9.2021.09.01.01.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 01:44:51 -0700 (PDT)
Message-ID: <a29dcef3c659c57af8c25066a4949a80b6d82699.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Kuber, Esteban" <ekuber@amazon.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Cc: "steven@stevenwalter.org" <steven@stevenwalter.org>, 
 "johan.anderholm@gmail.com" <johan.anderholm@gmail.com>,
 "derek@asterius.io" <derek@asterius.io>,  "cardoe@cardoe.com"
 <cardoe@cardoe.com>, "dev@codyps.com" <dev@codyps.com>,
 "tylerwhall@gmail.com" <tylerwhall@gmail.com>, Khem Raj
 <raj.khem@gmail.com>,  "vinay.kumar@blackfigtech.com"
 <vinay.kumar@blackfigtech.com>, "saul.wold@windriver.com"
 <saul.wold@windriver.com>, "martin.jansa@gmail.com"
 <martin.jansa@gmail.com>,  "paul@pbarker.dev" <paul@pbarker.dev>, Trevor
 Gamblin <trevor.gamblin@windriver.com>,  "anbelski@linux.microsoft.com"
 <anbelski@linux.microsoft.com>, Vinay Kumar <vinay.m.engg@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, "Orling, Timothy T"
 <timothy.t.orling@intel.com>, "Elberger, Richard" <elberger@amazon.com>
Date: Wed, 01 Sep 2021 09:44:49 +0100
In-Reply-To: <7A95231E-0879-46D6-8653-85338E9BDDFA@amazon.com>
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
	 <b67a2c80f8fff37c2fef319a35b7e60984e60bac.camel@linuxfoundation.org>
	 <7A95231E-0879-46D6-8653-85338E9BDDFA@amazon.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Esteban,

On Fri, 2021-08-27 at 15:18 +0000, Kuber, Esteban wrote:
> On 2021/8/27, 2:03 AM, "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
>     > and:
>     >
>     > 2. a reproducible build failure on CentOS-7:
>     >
>     >     https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/597
>     >
>     > where, we see:
>     >     = note: /bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' \
>     >     not found (required by \
>     >     /home/pokybuild/yocto-worker/reproducible-centos/build/\
>     >     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
>     >     1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)
>     >
>     >
>     >
>     >
>     >
>     >     error: linking with `\
>     >     /home/pokybuild/yocto-worker/reproducible-centos/build/\
>     >     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
>     >     1.54.0-r0/wrapper/target-rust-ccld` failed: exit status: 1
>    
> 
>     I had a quick look at this. It reproduces if you build cargo-native on a centos7
>     machine with our M2 buildtools tarball in the environment of the build.
> 
>     Adding the uninative relocation hack to the cargo snapshot binary with:
> 
>      do_cargo_setup_snapshot () {
>             ${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
>     +       # Need to use uninative's loader if enabled/present since the library paths
>     +       # are used internally by rust and result in symbol mismatches if we don't
>     +       if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
>     +               patchelf-uninative ${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo --set-interpreter ${UNINATIVE_LOADER}
>     +       fi
>      }
> 
>     didn't help.
> 
>     Running the command it mentions failing by hand in the same toolchain enabled
>     shell works. It therefore seems likely that something rust is putting into the
>     environment is breaking things. What that is, I don't know, I'm out of time to
>     debug further.
> 
> I'm looking at what that could be. If I can't give you the actual list (from the
> code), I can give you a patch to print out to stderr *everything* that rustc is
> setting during builds. We currently have a `-v` verbose  flag in cargo that
> gives out the full command with wich rustc in invoked, but as you say, the
> problem is likely the environment variables at play.

With some further debugging as I mentioned in my other reply, it is the
LD_LIBRARY_PATH setting which is confusing things. Probably as a result of:

https://doc.rust-lang.org/cargo/reference/environment-variables.html#dynamic-library-paths

>     It looks to me like it is using the ld from the host instead of the buildtools
>     tarball. I did change tmp/work/x86_64-linux/cargo-native/1.54.0-
>     r0/wrapper/target-rust-ccld to a full path to gcc and messed with PATH to ensure
>     it would find "our" ld first but that didn't help.
> 
> This is making me wonder, could it be that we are defaulting to a linker that is
> not supplied in the buildtools tar.gz? That would explain why it ends up picking
> up the system's even when changing the $PATH.

It is a bit more subtle than that. The ccld script has /bin/sh as the
interpreter which uses the host libc and host libtinfo. The LD_LIBRARY_PATH
injected by cargo causes it to find the libtinfo in the recipe-sysroot-native
which is incompatible with it and things then fail :(.

> 
>     In the error output is some:
> 
>     Usage: which [options] [--] COMMAND [...]
>     Write the full path of COMMAND(s) to standard output.
> 
>     suggesting some which call might not be compatible with centos7?
> 
>     Cheers,
> 
>     Richard
> 
> One clarification I would like to have is, is this the *first* time you are 
> trying to build rustc in this configuration, or is this a *recent* problem 
> introduced in 1.54? Just want to make sure that my understanding that we are 
> dealing with the former is correct.

This is the first time we've tried this as far as I know.

It is a horrible mix of different host tools and libcs from uninative,
buildtools and the host all conflicting when LD_LIBRARY_PATH is set :(.

I'm not sure how to go about resolving this.

Cheers,

Richard





