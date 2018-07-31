Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7B354744EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 08:45:39 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h9-v6so15738232wro.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lto0rlt71l6/Fs6VlPN6HDhjRW8slAzCtK3gYGhOHMA=;
	b=g+BXi39nup1QRMAQfFE6GR4swHLQvQU3HpGm5h7YyYQJoaSgAxSkorC7Oeh/JhaKSJ
	s9KcotH4+H+5DBEbcm9lWWtO1n03yIPA/ivvOqxpraxhgNKVfufvvtKA7x12Hxtk70cX
	1YZCSCpO918djEBICvxhk7TfY1xWyc/tfwpPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lto0rlt71l6/Fs6VlPN6HDhjRW8slAzCtK3gYGhOHMA=;
	b=ioemZcMhGda6p4w9LMQJytU8Ce5KyyJGP1oMAgP8NydB7vXiog1PsSBBs3YpaU64wq
	pqjxJyAWEPCNuq9bnZVE4hZ1D1oaqzUYtjZ+hgcLfaC/VCzYEebkM4t80yc3vpxhmBnU
	JaItwDpIXxGy7+MGkAsLGlSszjjuFhEKeq/RyXPrUqinkesVQ5yAnlF1mo5DNh3fwJOw
	fvKdR3zvdUNoW0ioN+n60IHY2RX2ml1BTecFdV5Kwk09Yd8v7Lo6RaITRJoJmIEkGeJt
	vKX4uvLRCPtYO4+ZvFcXkmLv3fhYwE1+NEK9nAcmTszve1SZIP8rgYa0aFyeRG6enyQO
	8s/g==
X-Gm-Message-State: AOUpUlHZmY1YJEYU4fQRUwmLluW/tPo57cm+LDck696k6iZ3oLWFIgTa
	vFEegVMQJxv+3g0dlhnWWfM5jA==
X-Google-Smtp-Source: AAOMgpeJIr5CrN9doTDDarS+Tnsl/zZ0502ff/xHI+G4LaPO7PNPyhtUGVImr+3H+xnKyxUMYlOAkA==
X-Received: by 2002:a5d:6841:: with SMTP id
	o1-v6mr20381976wrw.159.1533026739997; 
	Tue, 31 Jul 2018 01:45:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j20-v6sm1327076wmh.9.2018.07.31.01.45.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 31 Jul 2018 01:45:38 -0700 (PDT)
Message-ID: <8cca88af9a47b50672fc3116dcb00b6544e0166a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 31 Jul 2018 09:45:37 +0100
In-Reply-To: <CAJ86T=WuS3DBEYkLqrKACKdWQT9CZw6=_LLQj1KWFh3TzFjEcQ@mail.gmail.com>
References: <CAJ86T=WuVBc-WEE4+fKSd_qeTKJmd1VTmRGvB03KXqTZvB031Q@mail.gmail.com>
	<44b28ecdf9da3f1edab59861a7b32c4e11d0eead.camel@linuxfoundation.org>
	<CAJ86T=WuS3DBEYkLqrKACKdWQT9CZw6=_LLQj1KWFh3TzFjEcQ@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Is a dependency on hostperl-runtime-native actually useful?
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
X-List-Received-Date: Tue, 31 Jul 2018 08:45:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-07-30 at 18:06 -0700, Andre McCurdy wrote:
> On Mon, Jul 30, 2018 at 3:23 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2018-07-30 at 14:44 -0700, Andre McCurdy wrote:
> > > Currently the openssl 1.0 recipe defines a dependency on
> > > hostperl-runtime-native and the openssl 1.1 recipe does not. Both
> > > run
> > > "perl ./Configure ..." as part of do_configure().
> > > 
> > > Since hostperl-runtime-native is included in ASSUME_PROVIDED, is
> > > it
> > > really useful for the openssl 1.0 recipe to list it in DEPENDS?
> > > 
> > > ie is the openssl 1.0 recipe being unnecessarily complex or is
> > > the
> > > openssl 1.1 recipe being too simplistic?
> > 
> > It is useful for things to list their dependencies and we did have
> > an
> > effort to actually list things out so we know ASSUME_PROVIDED is
> > correct. This means we can spot areas we might be able to trim back
> > dependencies (amongst other reasons).
> > 
> > With the introduction of HOSTTOOLS, its perhaps less needed than it
> > was
> > but in principle it is still useful to know which things need a
> > given
> > item, particularly where its more unusual. I'd still be interested
> > in
> > trying to cut back HOSTTOOLS a bit more.
> > 
> > The 1.1 recipe was pretty heavily cut back, probably too much so
> > based
> > on some of the patches we've been getting...
> 
> Thanks. Is there an obvious reason why both recipes shouldn't be
> using perl-native rather than hostperl-runtime-native? Building with
> perl-native seems to work fine.

Build time overhead. openssl-native is one of the early dependencies
(or it certainly used to be due to git-native before we ASSUME_PROVIDED
it). Allowing openssl-native to use host perl cut down build time
significantly.

Cheers,

Richard


