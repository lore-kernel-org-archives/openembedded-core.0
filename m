Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.7069.1630065865285389298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 05:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Iequj6uq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id q11so10015817wrr.9
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 05:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ujV1OTyC6veBxdufOwHpSqSVHgHVS9OmNeoiDb2QdkU=;
        b=Iequj6uqiaRLJjdAjWC4pPzdPofOfShRhjA6tB4u40pRCB/VjVyuWYHVwTjx3SepqN
         UvO405ucpuwrZ2f01HG2s0ibMHB9iwMbmvu6RoVvHhkqxwdRS0auF4ug/mJDLo73aL73
         80zWflVL0qdDWc/8zpWiT1y5XqRC7UoQ9GIhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ujV1OTyC6veBxdufOwHpSqSVHgHVS9OmNeoiDb2QdkU=;
        b=qMsCY7jYdJH0r3o1sTnJ+14rJ797I1Slhz10Qo24r3k16YFlRBQomGAWnLfK35BDm+
         a6mDjR0L/p3GH3el6ayehlvz9YvrEBWqzLZrF0NZ7EovIhp/dYP5099h5XwRmqN8FBsJ
         o9q9KS5oVEecEcjUYTCzxytVlF+EHPr9ju8Lq3RMEOjAtBJb91lMYGAKbRc/BnSNBDY7
         BYcVChNR8OsbMm7teQ4Tfju30mDLmSIc0oYfBm7TontxCKf5RZs+2jVMS9kVvgtdh1aD
         X1YF3LEFrkWGDr33FfyOaQocU7726aBi/OQpJBZ3Wc77RwwUVE1eJJpXjk6+kAI7izyM
         0hlQ==
X-Gm-Message-State: AOAM531C/9fZxu+y/dW19OWhQ1U/g1jR4r1HgD4EqwB89d+dE9he6Ki2
	ledg9sSUxVnh2ZC0nzfOygdXSw==
X-Google-Smtp-Source: ABdhPJwgNFgL2Cg5oB3cUYIvCNo6o2wiWqnSiGAUxsUjVhH235kiKrd0UNLtRciBmhF6fjvbqbd43w==
X-Received: by 2002:adf:f101:: with SMTP id r1mr9823430wro.355.1630065863325;
        Fri, 27 Aug 2021 05:04:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5262:687a:b257:b6af? ([2001:8b0:aba:5f3c:5262:687a:b257:b6af])
        by smtp.gmail.com with ESMTPSA id d124sm5218561wmd.2.2021.08.27.05.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 05:04:22 -0700 (PDT)
Message-ID: <666325b981f47975ed739b8d3eeaed46933845c0.camel@linuxfoundation.org>
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
Date: Fri, 27 Aug 2021 13:04:19 +0100
In-Reply-To: <169F1E62C63E8EDC.31425@lists.openembedded.org>
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
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-08-27 at 10:03 +0100, Richard Purdie via lists.openembedded.org
wrote:
> On Fri, 2021-08-27 at 00:05 -0400, Randy MacLeod wrote:
> > Thanks to Richard's dogged determination and Herculean efforts,
> > the Rust recipes are now merged to the oe-core master branch.
> > 
> >     https://git.openembedded.org/openembedded-core/log/?qt=range&q=master
> > 
> > 
> > There are still some known problems, such as:
> > 
> > 1. Tim Orling finding that Rust fails to build python-cryptography:
> > 
> >  
> > https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/rust_python3-cryptography
> > 
> > Tim says that this change helps:
> >  
> > https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/rustc-print-cfg-fix
> > 
> > 
> > and:
> > 
> > 2. a reproducible build failure on CentOS-7:
> > 
> >     https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/597
> > 
> > where, we see:
> >     = note: /bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' \
> >     not found (required by \
> >     /home/pokybuild/yocto-worker/reproducible-centos/build/\
> >     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
> >     1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)
> > 
> > 
> > 
> > 
> > 
> >     error: linking with `\
> >     /home/pokybuild/yocto-worker/reproducible-centos/build/\
> >     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
> >     1.54.0-r0/wrapper/target-rust-ccld` failed: exit status: 1
> > 
> 
> I had a quick look at this. It reproduces if you build cargo-native on a centos7
> machine with our M2 buildtools tarball in the environment of the build.
> 
> Adding the uninative relocation hack to the cargo snapshot binary with:
> 
>  do_cargo_setup_snapshot () {
>         ${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
> +       # Need to use uninative's loader if enabled/present since the library paths
> +       # are used internally by rust and result in symbol mismatches if we don't
> +       if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
> +               patchelf-uninative ${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo --set-interpreter ${UNINATIVE_LOADER}
> +       fi
>  }
> 
> didn't help.
> 
> Running the command it mentions failing by hand in the same toolchain enabled
> shell works. It therefore seems likely that something rust is putting into the
> environment is breaking things. What that is, I don't know, I'm out of time to
> debug further.
> 
> It looks to me like it is using the ld from the host instead of the buildtools
> tarball. I did change tmp/work/x86_64-linux/cargo-native/1.54.0-
> r0/wrapper/target-rust-ccld to a full path to gcc and messed with PATH to ensure
> it would find "our" ld first but that didn't help.
> 
> In the error output is some:
> 
> Usage: which [options] [--] COMMAND [...]
> Write the full path of COMMAND(s) to standard output.
> 
> suggesting some which call might not be compatible with centos7?

temp/run.do_compile:	bbnote "cargo = $(which /home/pokybuild/yocto-worker/reproducible-centos/build/build-st/tmp2/work/x86_64-linux/cargo-native/1.54.0-r0/cargo-1.53.0-x86_64-unknown-linux-gnu/bin/cargo)"
temp/run.do_compile:	bbnote "rustc = $(which ${RUSTC})"

so probably not important.

Cheers,

Richard


