Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.5671.1630054999196078351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 02:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jmuua4Yr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id y195so544541wmc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eBK+jGF3GCN0H5RSExzWIyPcAkmNsaOuuznC7oThiRs=;
        b=Jmuua4YrOqx1TOAjYq7hxaZ8bFFzcwIsRyoPKhqIjjHChw9EKS+5+tG90O6oRBs2Qp
         LYlHXBqQ5v26jhlL1E9IAQUNmqswI4pMhKgMkwH1NcnW6yWq/DtTpfGMPKvKnyXNtQxx
         MdLQCLADunsPqjt94gtOqyIEtFbIesIrRrwmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eBK+jGF3GCN0H5RSExzWIyPcAkmNsaOuuznC7oThiRs=;
        b=e+BPo4B3Gl+D7MW4NPtD8AO6GFSvg5lHO5zYk9E/SSfnam0V57OUdVd+OQqPa3eZM3
         jODajf7yC0DaynDVjL9c8/Ld2mi7SfpHIcNCtWK5xUQ/Pin6160s8NDBpkQghc1JWoJF
         UVxHrnlZlv3O+Lkmz+76a2itZqEikN0ShKONc1DAM4/4jJSc4Q/gMFZ4XS0aUkI8WTQL
         +LGQYY9DLLUpX8QxHLtrkBfpKgqoOWu/q64MTTyhtd+9Edlw0hde2v0zLyo0tqCqXUiK
         qi5LJoxrhmCp59R/RQS1WosL7ZaYmaKCm9VPyzMw6lhyaTdszVQXMxTH8M3hcwFIUAjO
         ksjg==
X-Gm-Message-State: AOAM532VqP3DV84FH3qWKU7B1//jabjH4KfbZTHHolvWY6l4SuxoEOTE
	mC6RihEzWsEasqnhkzqNM51HRA==
X-Google-Smtp-Source: ABdhPJzH4IPBIcOafN21obqxFPaTOa/ZgGcSBCLx/QYP0wLolK3uV9QxwtdSWq3DtUxa1dSzTD+hVQ==
X-Received: by 2002:a1c:1d87:: with SMTP id d129mr18656150wmd.185.1630054997522;
        Fri, 27 Aug 2021 02:03:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5262:687a:b257:b6af? ([2001:8b0:aba:5f3c:5262:687a:b257:b6af])
        by smtp.gmail.com with ESMTPSA id w9sm4724580wmc.19.2021.08.27.02.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 02:03:17 -0700 (PDT)
Message-ID: <b67a2c80f8fff37c2fef319a35b7e60984e60bac.camel@linuxfoundation.org>
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
Date: Fri, 27 Aug 2021 10:03:15 +0100
In-Reply-To: <23bc2196-4f7c-4958-e191-bd6f47223da2@windriver.com>
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
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-08-27 at 00:05 -0400, Randy MacLeod wrote:
> Thanks to Richard's dogged determination and Herculean efforts,
> the Rust recipes are now merged to the oe-core master branch.
> 
>     https://git.openembedded.org/openembedded-core/log/?qt=range&q=master
> 
> 
> There are still some known problems, such as:
> 
> 1. Tim Orling finding that Rust fails to build python-cryptography:
> 
>  
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/rust_python3-cryptography
> 
> Tim says that this change helps:
>  
> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/rustc-print-cfg-fix
> 
> 
> and:
> 
> 2. a reproducible build failure on CentOS-7:
> 
>     https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/597
> 
> where, we see:
>     = note: /bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' \
>     not found (required by \
>     /home/pokybuild/yocto-worker/reproducible-centos/build/\
>     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
>     1.54.0-r0/recipe-sysroot-native/usr/lib/libtinfo.so.5)
> 
> 
> 
> 
> 
>     error: linking with `\
>     /home/pokybuild/yocto-worker/reproducible-centos/build/\
>     build-st/reproducibleB/tmp/work/x86_64-linux/cargo-native/\
>     1.54.0-r0/wrapper/target-rust-ccld` failed: exit status: 1
> 

I had a quick look at this. It reproduces if you build cargo-native on a centos7
machine with our M2 buildtools tarball in the environment of the build.

Adding the uninative relocation hack to the cargo snapshot binary with:

 do_cargo_setup_snapshot () {
        ${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
+       # Need to use uninative's loader if enabled/present since the library paths
+       # are used internally by rust and result in symbol mismatches if we don't
+       if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
+               patchelf-uninative ${WORKDIR}/${CARGO_SNAPSHOT}/bin/cargo --set-interpreter ${UNINATIVE_LOADER}
+       fi
 }

didn't help.

Running the command it mentions failing by hand in the same toolchain enabled
shell works. It therefore seems likely that something rust is putting into the
environment is breaking things. What that is, I don't know, I'm out of time to
debug further.

It looks to me like it is using the ld from the host instead of the buildtools
tarball. I did change tmp/work/x86_64-linux/cargo-native/1.54.0-
r0/wrapper/target-rust-ccld to a full path to gcc and messed with PATH to ensure
it would find "our" ld first but that didn't help.

In the error output is some:

Usage: which [options] [--] COMMAND [...]
Write the full path of COMMAND(s) to standard output.

suggesting some which call might not be compatible with centos7?

Cheers,

Richard



