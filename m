Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 31F0C7FCD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:30:17 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 193so9567537pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=jkc5aH6S5OeMl5NsTcdeBYJhpTA5URjhN/5/W2XW304=;
	b=gXH8IHyS/k7PGsJItukBGbYVearpq/ZqlzOWgUxnd2ilIV2/KgmYBImVzEIj2EsnTO
	r6y8vVaRCdtQRefN44bn5Jm4M1m1byqMF9xijbDpzPDXFjXhNLUH1utvaI7f9aoJNF9K
	zHPTqCsz+INzyg4p3f3jMBfMqxwPE+sXKwCKmlxkQ8cB/JAL8LZre7pWv+fce5X7H2/W
	pDWvxuxIB8poK8w1O0Kv40x1nLLGT3HIo5k8X8rJdKn3vnZ1AusR9LHueCQkjXJu22Na
	moLhRREXVqvnr4fa7Eyo9DB1g6NutVUkESFz7RTSGWzgjps7xtD4OslOBQ1cLH8aSCW/
	AbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=jkc5aH6S5OeMl5NsTcdeBYJhpTA5URjhN/5/W2XW304=;
	b=GnVPtclF5Cc78+HWYdQEm7WNJsPzdgLbUtXpy96naKNimjdD7ahP1dFI7Nq+OX2wYJ
	WCsrkfkloxBH26Wrh/FWGFe/g7YSlZ45rmwZc9fjtcDe2ApYVq2MN8tpjxzLlT1dxRjS
	NQbo1a4BHUABAeSQWx3QOo7ImL6yAXWfhU4q+teezZzgOzy9Yq84V8SDPFM6YXU3U9Gi
	afr2PUq/nGKHAF2wkgjoeupT9UpVvo12yuivE+jP88Q9gbhz5IMWaSsLm1pxo4g6IyLs
	hUkx1rKXSOL60TvQncWZAug0R2l9D2tRYpsoKVNAfJ+ULabeHbMZl8uVIlT8k0XZQQqs
	Okbw==
X-Gm-Message-State: APjAAAVDHuEGY33wBtyr08r1kzWoDpVukR3B4eVG+Tqm1iQ/3PDRjGE+
	8XznKngkMoEZKpgGIYvfCbw=
X-Google-Smtp-Source: APXvYqwh4isQHyzAO3fxe8icSKaXvFtfSeTyryVcfatuSy0JJLW86UFuksJFDdhX7mnyYFhhbzAdEA==
X-Received: by 2002:a62:1e83:: with SMTP id e125mr43044245pfe.62.1574793017897;
	Tue, 26 Nov 2019 10:30:17 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id h4sm3705750pjs.24.2019.11.26.10.30.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 10:30:17 -0800 (PST)
Message-ID: <af480c83342314370cf70e562ff7ea17c0c14e8a.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 26 Nov 2019 10:30:12 -0800
In-Reply-To: <CADySD0Ht=A_-_5LbB00POn4Vjg_=n2ObTwZgExXwfiS6AZpidQ@mail.gmail.com>
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<20191125211027.GA32080@localhost>
	<0c6015a022140c820803a3963ef33af984f19c8c.camel@gmail.com>
	<CADySD0Ht=A_-_5LbB00POn4Vjg_=n2ObTwZgExXwfiS6AZpidQ@mail.gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Tue, 26 Nov 2019 18:30:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-27 at 07:27 +1300, Ankur Tyagi wrote:
> Hi Khem,
> 
> I have no experience with musl but keen to understand does musl
> improves/impacts DRAM performance as compared to glibc? 
> 

it really depends on load it runs, so I would not say its better or
worse but for many loads it makes better use of memory.

I would recommend to do some benchmarking on your platform and
application

> regards
> Ankur
> 
> On Wed, 27 Nov 2019, 7:17 a.m. Khem Raj, <raj.khem@gmail.com> wrote:
> > On Mon, 2019-11-25 at 23:10 +0200, Adrian Bunk wrote:
> > > On Mon, Nov 25, 2019 at 07:26:58PM +0000, Ross Burton wrote:
> > > > On 25/11/2019 18:37, Ankur Tyagi wrote:
> > > > > Hi,
> > > > > 
> > > > > Based upon "thud" branch, I created core-image-minimal for
> > > > > am335x-evm
> > > > > board and resulting image size is very big(71M)
> > > > 
> > > > If disk size is important then a good first step is to use musl
> > > > instead of
> > > > glibc:
> > > > 
> > > > TCLIBC = "musl"
> > > > ...
> > > 
> > > musl is mainly useful for tiny systems, a 40 MB partition is such
> > a
> > > huge
> > > amount of space that the size of the C library no longer matters
> > > much.
> > > 
> > > The size benefit of replacing glibc with musl is around 2 MB.
> > 
> > I would refrain from labeling as useful for tiny systems. since
> > static size is one thing, there is DRAM behaviour which is equally
> > important, how malloc and other resource oriented algorithms behave
> > is
> > important as well.
> > 
> > secondly, if I have 40MB partition, one might rather want to use
> > extra
> > space for implementing features in their product than spend it for
> > enabling the system if they can.
> > 
> > there are many other design considerations where musl might make
> > more
> > sense
> > 
> > > 
> > > A partition with an -Os build of Yocto with glibc+systemd (sic)
> > > is around 9 MB, together with bootloader and kernel this all
> > > fits in a 16 MB flash. Use compression for kernel and root
> > > filesystem and everything fits in a 8 MB flash.
> > > 
> > 
> > -Os is not as well tested option as -O2 is. So we should always
> > recommend it with grain of salt, speaking from experience there are
> > bugs that will show up with Os which you wont see with O2 and leave
> > a
> > bad taste for user
> > 
> > > > Ross
> > > 
> > > cu
> > > Adrian
> > 


