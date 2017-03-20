Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id A79EF71DEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:57:28 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id y18so5980779itc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 02:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=5/jBVaqObkJlYYz+2m64V65opjfdr53NQwUd64bCnZQ=;
	b=PlPvUoB4e0PpqSV39e4bTMhhFRit4QcE69ybXGIE4AuMTLLkvLHrw1ytUjtD9bvU7U
	dwMmAkXsPKd4ysFmzNu8wgv54X2x8Bl6nprHn2rDix0wCLd/oL6c6YyL+Do+tcGPBwHg
	Ug5lZKGkOjshRwW3WyeTUZ+0RzQ1DrBbigGYefplIow1E+6sf3FfiNMF1HdAZQAIglxW
	c/myMv+kOMG0Q6TItupu6hmqRGCYVNsP4Ca0vlyYwbL5/oh8GOAcgscUwCMg888vPAC/
	SQIkQglfbjwZBufntwdhiEUT6otVZrBEbdxjnqI6vY7+IOY9utONwDu0dnUY/olsHCa2
	S1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=5/jBVaqObkJlYYz+2m64V65opjfdr53NQwUd64bCnZQ=;
	b=dev/eLQayXeZiMrZfbvjLH0gsZXfjTYy8a9Ab1YJ1p6/8jyGnqhtPFDUPu/lXVIwim
	rQwo8XtfYuQWXE0wasxyjuJcY8vlfgJLlM+bZJ6dJCRrh3l7EUlRLNtZZK6W6XU33QWa
	ekEbFqZePJ2ZLaqH9SxVPeTvX988ANwlOU27GxICfrRhNj0yTySJn1hNuPWtNh7QUjGe
	ecBf4Smmhd9p25CqrZxiuHNA1XqEBQwExj7rx8tZKLCn+P6hxVFogXdbOQb7nDNbNfjK
	BQpVKqlsJuUeUiRyDX2ymQlN4I51RsnT5w5DhkatVtVCDJTKgrOf9rCDqfQMpbt/l09J
	X2YA==
X-Gm-Message-State: AFeK/H17PtGZ064JpB8zB9K2Gj4XgNnWq4wul2ZOSQ9FvnrYJkoLgqPSkO7Gp2MJb6lI5tpp
X-Received: by 10.36.204.137 with SMTP id x131mr8502644itf.35.1490003849427;
	Mon, 20 Mar 2017 02:57:29 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C233.dip0.t-ipconnect.de. [93.232.194.51])
	by smtp.gmail.com with ESMTPSA id f9sm5016652itf.9.2017.03.20.02.57.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 02:57:28 -0700 (PDT)
Message-ID: <1490003844.6396.140.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>, "Neri, Ricardo"
	<ricardo.neri@intel.com>
Date: Mon, 20 Mar 2017 10:57:24 +0100
In-Reply-To: <CAHiDW_EvTOKpqOACTS6M9Y2_wofaEQ6sL89ThNHem4cPrxLFmQ@mail.gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
	<2a1cd614717f323afc788e24fae76337cffa8816.1489534345.git.raj.khem@gmail.com>
	<CAHiDW_EvTOKpqOACTS6M9Y2_wofaEQ6sL89ThNHem4cPrxLFmQ@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] musl: Update to latest
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
X-List-Received-Date: Mon, 20 Mar 2017 09:57:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-03-20 at 10:32 +0200, Jussi Kukkonen wrote:
> 
> On 15 March 2017 at 01:35, Khem Raj <raj.khem@gmail.com> wrote:
>         Rich Felker (11):
>               fix ld-behavior-dependent crash in ppc64 ldso startup
>               rework ldso handling of global symbol table for
>         consistency
>               reorder addend handling before symbol lookup in
>         relocation code
>               emulate lazy relocation as deferrable relocation
>               fix free of uninitialized buffer pointer on error in
>         regexec
>               in static dl_iterate_phdr, fix use of
>         possibly-uninitialized aux data
>               fix possible fd leak, unrestored cancellation state on
>         dns socket fail
>               fix wide scanf's use of a compound literal past its
>         lifetime
>               fix one-byte overflow in legacy getpass function
>               avoid loading of multiple libc versions via explicit
>         pathname
>               remove unused refcnt field for shared libraries
>         
>         Szabolcs Nagy (1):
>               treat STB_WEAK and STB_GNU_UNIQUE like STB_GLOBAL in
>         find_sym
> 
> 
> 
> 
> Could the relocation changes here be responsible for these ovmf build
> failures:
>   "GenFw: ERROR 3000: Invalid ... unsupported ELF EM_386 relocation"
> ?
> 
> 
> https://autobuilder.yocto.io/builders/nightly-musl/builds/196/steps/BuildImages/logs/stdio

That looks like a good guess.

I had tried to reproduce that error last week with poky/master-next, but
somehow it didn't trigger in my local setup.

I have no idea how to enhance ovmf such that can handle this, though.
Holding back an update of musl until someone can figure it out does not
very attractive. But nor is disabling the building of ovmf when musl is
selected, because then the wic tests which rely on ovmf will fail or
also need to get disabled.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




