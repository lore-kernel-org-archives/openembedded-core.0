Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 723916C0AD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 21:31:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l9so31791474wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 13:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=KW+zI5D2eo6odYv8cUY/PVNsF7o1Z/NyRgDbojT6Bas=;
	b=dq+XZ+hlUv49HmpTLliTDGb+jJ8xn7IIBtr2SnxzhnrZczRqbRSIFpZw+Z6ROwwXFg
	nCOU0lWqsdWmJF1M339Wbo0ReJohsmN3atUlN678yL30Mv6sS5tKqr4y0lRvSQgNCX2B
	KqRP8rZwYWoMAZmucHOxWJRoURJ/Du8hkj81Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=KW+zI5D2eo6odYv8cUY/PVNsF7o1Z/NyRgDbojT6Bas=;
	b=pYi8IADWbXD6SA0kimbh5qQrB5jz8tCO5QPbVZBlcqxbwa+JF8AiQscLC72bEe+8gt
	kCEH5z1pedjcmtlGU1JJmR2QEmoKyiBNdH8Nw7cY7yrx8qXQzJocwlQmmQyAHhIY7KAj
	pM4pQ4TQ49vNdYgNLI4QuDhI2Ag27FBv6INmPKYXNlVWBkcPg9fieYVqANnaSWNkdrXg
	uQVeHzrHfQMyAKkBh/xbm2OLYf4zL+pxmz6fMJTGcuFmynwmH2t8yS7bvUDQOVT0bjri
	KNnMvf01HlOrtSZhyExkgWeGQw9vcBV3ZXASHfdTiJtbnWXocuO97Y/L/dG7qv5XvLJq
	aUZg==
X-Gm-Message-State: AJcUukflH3yPdW6oC1Crj6Tru3ybkxdfOEfbyqrVu6uW7gnXelf3R7Ml
	D4l1ajAmg0rmKhu/+PaKbN2N7Q==
X-Google-Smtp-Source: ALg8bN78RBxbhiM+tSKfdmhmtcwENSEppHrYWhjja34DTcq+fPTq5uwIDxzF+4zF4/W6VVAz3Ryhow==
X-Received: by 2002:a5d:5409:: with SMTP id g9mr40324591wrv.88.1546464702142; 
	Wed, 02 Jan 2019 13:31:42 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id m4sm48380508wmi.3.2019.01.02.13.31.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 13:31:39 -0800 (PST)
Message-ID: <a4363be9273e627354f245ec4a2490a216e74c86.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>
Date: Wed, 02 Jan 2019 21:31:29 +0000
In-Reply-To: <CAMKF1so9UFQCtP_F8HZdopREaR1rp8poUyeCpr7yZj43xESnxQ@mail.gmail.com>
References: <20190102192111.33587-1-raj.khem@gmail.com>
	<CAPbeDCm6H0C=nKk=z_uB+SAP_3fJya5UDJKKGSQq9oA6wVdJAA@mail.gmail.com>
	<CAMKF1so9UFQCtP_F8HZdopREaR1rp8poUyeCpr7yZj43xESnxQ@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Wed, 02 Jan 2019 21:31:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-02 at 11:42 -0800, Khem Raj wrote:
> On Wed, Jan 2, 2019 at 11:32 AM Jacob Kroon <jacob.kroon@gmail.com>
> wrote:
> > On Wed, Jan 2, 2019 at 8:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > From: pino-kim <sungwon.pino@gmail.com>
> > > 
> > > This fixes RISC-V gdb-cross-canadian cross compile configure
> > > failure on missing bison.
> > > 
> > > Signed-off-by: pino-kim <sungwon.pino@gmail.com>
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > index 475e4f08ef..e54766bbb2 100644
> > > --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > @@ -6,7 +6,8 @@ PN = "gdb-cross-canadian-
> > > ${TRANSLATED_TARGET_ARCH}"
> > >  BPN = "gdb"
> > > 
> > >  DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
> > > -           virtual/${HOST_PREFIX}gcc-crosssdk
> > > virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
> > > +           virtual/${HOST_PREFIX}gcc-crosssdk
> > > virtual/${HOST_PREFIX}binutils-crosssdk \
> > > +           virtual/nativesdk-libc bison-native"
> > > 
> > 
> > Would it make sense to restrict this to DEPENDS_append_riscv32/64 ?
> 
> Its not particular to riscv, it just happens to unearth the problem
> for us since its building gdb from upstream
> master, we are going to land into this problem eventually when we
> upgrade.

Is this not a tarball verses source control issue (the git version
needs the dependency, the tarball doesn't)?

Cheers,

Richard




