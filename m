Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.5480.1630487705556565765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 02:15:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dkUKGl6+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id u9so3369482wrg.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 02:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=V9WrV8luR3QMC/ss5ujzVW3hziHKnahE92LSE+XNM3o=;
        b=dkUKGl6+aGt5xIh16TkEjOAY7AwWDTsKnRs0EzO9dbuejaZ+krGam9aiEsTaFrlAad
         kX5i222AXTfYdzeu6GNgCysNFzdkoid/sJm1GEgvYvxnmE1ljP2xY+SBBQVdtGLp0Vm5
         xaCyJxrFRdjybN1jr3+T/v0sj0sBM532FSl5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V9WrV8luR3QMC/ss5ujzVW3hziHKnahE92LSE+XNM3o=;
        b=GUc+FPw8MW/a072d2dUQ8M8/2EXeExc0RroYqNmQlFG9uRPuwCqOzQyIqC18qpn8qA
         ZLa5JAZGxW1UbRJt+1IpFwJzuC6KLa4mkvWbAPEjDq8Ipva4/mYXOr8E+78ivICo+Bkv
         mNSRKwbiIxDFLqwt3Ufi+vgWov764WsTsqHpmlU6GW7+l4dnx8DC+8tVcG/EvW79aXem
         3iLWuFBjGWLJUwf3MhfE0OQ2WEsU2LJtrkYAf6Ps465tZOH+6GaovT9IbTwXxItba/NP
         G2/Z/fyOazyrZX3PUrYy/6McvUGWu8VxGirlSN4wjqJNJG9fD3j1lk5PY08xuLWX5azL
         jXBw==
X-Gm-Message-State: AOAM531xe4UOqtAa4jzQUVOfHWRuiR2kr8k3J29+WFluKIYHFY9yEQPx
	KY880TufOLccb6+W3Hae+E9GLQ==
X-Google-Smtp-Source: ABdhPJyY3IwSwrt+2mAklPcabZfhzFOf8hTk4HSdBjPTUKAYAXmXBtu38M3bU8bdsxyVMXK7hgz9+Q==
X-Received: by 2002:adf:c144:: with SMTP id w4mr21163397wre.398.1630487703958;
        Wed, 01 Sep 2021 02:15:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7e06:66c6:32e7:e304? ([2001:8b0:aba:5f3c:7e06:66c6:32e7:e304])
        by smtp.gmail.com with ESMTPSA id g11sm20407670wrx.30.2021.09.01.02.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 02:15:03 -0700 (PDT)
Message-ID: <06e6b6542cb7097e7da11338a43073ca8f2e89d8.camel@linuxfoundation.org>
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
Date: Wed, 01 Sep 2021 10:15:02 +0100
In-Reply-To: <16A0A6483A22DE64.7229@lists.openembedded.org>
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
	 <16A0A6483A22DE64.7229@lists.openembedded.org>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-09-01 at 09:44 +0100, Richard Purdie via lists.openembedded.org
wrote:
> Hi Esteban,
> 
> On Fri, 2021-08-27 at 15:18 +0000, Kuber, Esteban wrote:
> > On 2021/8/27, 2:03 AM, "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
> >     > and:
> >     >
> >     > 2. a reproducible build failure on CentOS-7:
> >     >
> >     >     https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/597
> >     >
> >     > where, we see:
> >     >     = note: /bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' \
> >     >     not found (required by \
> >     >     /home/pokybuild/yocto-worker/reproducible-centos/build/\
> >     >     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
> >     >     1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)
> >     >
> >     >
> >     >
> >     >
> >     >
> >     >     error: linking with `\
> >     >     /home/pokybuild/yocto-worker/reproducible-centos/build/\
> >     >     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
> >     >     1.54.0-r0/wrapper/target-rust-ccld` failed: exit status: 1
> >    
> > 
> >     I had a quick look at this. It reproduces if you build cargo-native on a centos7
> >     machine with our M2 buildtools tarball in the environment of the build.
> > 
> >     Adding the uninative relocation hack to the cargo snapshot binary with:
> > 
> >      do_cargo_setup_snapshot () {
> >             ${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
> >     +       # Need to use uninative's loader if enabled/present since the library paths
> >     +       # are used internally by rust and result in symbol mismatches if we don't
> >     +       if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
> >     +               patchelf-uninative ${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo --set-interpreter ${UNINATIVE_LOADER}
> >     +       fi
> >      }
> > 
> >     didn't help.
> > 
> >     Running the command it mentions failing by hand in the same toolchain enabled
> >     shell works. It therefore seems likely that something rust is putting into the
> >     environment is breaking things. What that is, I don't know, I'm out of time to
> >     debug further.
> > 
> > I'm looking at what that could be. If I can't give you the actual list (from the
> > code), I can give you a patch to print out to stderr *everything* that rustc is
> > setting during builds. We currently have a `-v` verbose  flag in cargo that
> > gives out the full command with wich rustc in invoked, but as you say, the
> > problem is likely the environment variables at play.
> 
> With some further debugging as I mentioned in my other reply, it is the
> LD_LIBRARY_PATH setting which is confusing things. Probably as a result of:
> 
> https://doc.rust-lang.org/cargo/reference/environment-variables.html#dynamic-library-paths
> 
> >     It looks to me like it is using the ld from the host instead of the buildtools
> >     tarball. I did change tmp/work/x86_64-linux/cargo-native/1.54.0-
> >     r0/wrapper/target-rust-ccld to a full path to gcc and messed with PATH to ensure
> >     it would find "our" ld first but that didn't help.
> > 
> > This is making me wonder, could it be that we are defaulting to a linker that is
> > not supplied in the buildtools tar.gz? That would explain why it ends up picking
> > up the system's even when changing the $PATH.
> 
> It is a bit more subtle than that. The ccld script has /bin/sh as the
> interpreter which uses the host libc and host libtinfo. The LD_LIBRARY_PATH
> injected by cargo causes it to find the libtinfo in the recipe-sysroot-native
> which is incompatible with it and things then fail :(.
> 
> > 
> >     In the error output is some:
> > 
> >     Usage: which [options] [--] COMMAND [...]
> >     Write the full path of COMMAND(s) to standard output.
> > 
> >     suggesting some which call might not be compatible with centos7?
> > 
> >     Cheers,
> > 
> >     Richard
> > 
> > One clarification I would like to have is, is this the *first* time you are 
> > trying to build rustc in this configuration, or is this a *recent* problem 
> > introduced in 1.54? Just want to make sure that my understanding that we are 
> > dealing with the former is correct.
> 
> This is the first time we've tried this as far as I know.
> 
> It is a horrible mix of different host tools and libcs from uninative,
> buildtools and the host all conflicting when LD_LIBRARY_PATH is set :(.
> 
> I'm not sure how to go about resolving this.

I noticed some code in cargo. I think the code is where the sysroot path is
injected. Since rust figures out its own paths to everything it is a little
surprising this is needed and the comment suggests the author had similar
thoughts. I therefore tried the following patch:

Index: cargo/src/cargo/core/compiler/compilation.rs
===================================================================
--- cargo.orig/src/cargo/core/compiler/compilation.rs
+++ cargo/src/cargo/core/compiler/compilation.rs
@@ -273,13 +273,6 @@ impl<'cfg> Compilation<'cfg> {
             ));
             search_path.push(self.deps_output[&kind].clone());
             search_path.push(self.root_output[&kind].clone());
-            // For build-std, we don't want to accidentally pull in any shared
-            // libs from the sysroot that ships with rustc. This may not be
-            // required (at least I cannot craft a situation where it
-            // matters), but is here to be safe.
-            if self.config.cli_unstable().build_std.is_none() {
-                search_path.push(self.sysroot_target_libdir[&kind].clone());
-            }
         }
 
         let dylib_path = paths::dylib_path();

however since I think we're running a prebuilt binary rather than the one we're
building, this does work. I'm therefore not sure how we can fix this. Is this
code something upstream might consider removing?

Cheers,

Richard


