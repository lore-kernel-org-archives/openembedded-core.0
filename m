Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0B07BF70
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 20:50:30 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id b8so9515022qtr.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 12:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/6jhUL4hPKuyW1h8PTqgFPzg9kBMMfqVwHqzeaQug/s=;
	b=DKhJ+jjiEObcO1vtdR5tRM6t6zdCbnwceqjw/3GXRI78+SinGLM4++Qp2VU0aveD3T
	X/pP/gd7vQfoJMKh6XVXDcaitx2vmBzZGTiPOI7qLyAeciZuf0H/PIP70y0TvSgV8dgg
	UhAUwqHqFdIv3C+cSx+vxANy5e28Wsg266IC/I9VJUGZYlaw3Oe/7VjAfOGbUIwaQ8WH
	bsAwrGlwdq8W6deNiCBL1EruOywX5J29nk+Q9mq2TsCAg5DFc1Ku8Ix4LxeaDIJ6Zf4V
	4S68oHGgsjyX4HKL13+19DHTsV/extO0S9c5meHfY0OrLHEqaoxP627Prd9d/DHwxait
	i8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/6jhUL4hPKuyW1h8PTqgFPzg9kBMMfqVwHqzeaQug/s=;
	b=CFe9RsBUnQrTtUXlAMhd6+PDcyNz2sVmAe/7HmWmUpzWgrJ6rELwz8bRQnrhQ4OZ8Z
	YYjAyxDIFM6AUwGq27D57Hde/LPZx+o5CULHBZdMw/7FP5MDrG1PToZ0q3g2iqzPtYk4
	V48K3nRC9jmeqDFEN123aJr520RRW75ZsBxTsVp2KWj7Futj8H2MlJmqEB2mv0yFnUdz
	abT7DTeCIBbvJ5RDO9wRtWaHrMPZXqE/7y5CcNRoOMKmlg6qVnBK671+bkiQvQMiomfB
	oEHH10PW2sFT9YaKQxFxhGfQX3diYcn/grEu7Wvi6jV6fDc/bz8bLFCC4KUNUBKTrW0b
	uiug==
X-Gm-Message-State: AHQUAuZjSseUhpyP5UbesiMe4IqTMvbVLKR00jQBMO+4Jxjfp7WeRrN3
	xGrFtS+aGPbBcgPjBwgEAgK7tzDsLhC4ySg+EZ4=
X-Google-Smtp-Source: AHgI3IbDGGbk03vUFQMtWHXjz7qoOHrg2x6z5Sj066jXuES4gg+aJnp95K34Vng/7qDjDIQL6Ch2AZI+e+L09uT9GCk=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr8994734qvd.224.1549486231265; 
	Wed, 06 Feb 2019 12:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20190205003627.4454-1-raj.khem@gmail.com>
	<CAO5Uq5RAbDD9KRQhXT2osH_ivYvskAMRMj82yq3RB8Zr0QdF8w@mail.gmail.com>
In-Reply-To: <CAO5Uq5RAbDD9KRQhXT2osH_ivYvskAMRMj82yq3RB8Zr0QdF8w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Feb 2019 12:50:04 -0800
Message-ID: <CAMKF1srzx8nQXUH8BxYJ_-oAfN+mfPryiGLgGRjh4ey+o07DnA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/2] multilib_header_wrapper.h: Use #pragma once
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
X-List-Received-Date: Wed, 06 Feb 2019 20:50:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 6, 2019 at 12:41 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Tue, Feb 5, 2019 at 12:36 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Avoid infinite include loops, especially with bits/wordsize.h which is
> > now possible with the synthesized headers since we now also synthesize
> > bits/wordsize.h itelf for some arches e.g. arm/aarch64
> >
> > In cases where extra preprocessing tools are used such as clang-tidy
> > e.g. and these tools are not passed the knowledge about architecture
> > then case comes where we enter into header include loop for
> > bits/wordsize.h, since this template does explicitly include
> > bits/wordsize.h
> >
> > To fix this emits the pragma once at beginning of file, this is better
> > solution than include guards, and pragma once is practically supported
> > on all compilers except few e.g. cray c/c++ compiler
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Something about this is breaking a local recipe (for tlsdate fwiw, but
> I don't think that's relevant):
>
> | checking openssl/ssl.h usability... no
> | checking openssl/ssl.h presence... yes
> | configure: WARNING: openssl/ssl.h: present but cannot be compiled
> | configure: WARNING: openssl/ssl.h:     check for missing prerequisite headers?
> | configure: WARNING: openssl/ssl.h: see the Autoconf documentation
> | configure: WARNING: openssl/ssl.h:     section "Present But Cannot
> Be Compiled"
> | configure: WARNING: openssl/ssl.h: proceeding with the compiler's result
> | configure: WARNING:     ## ------------------------------------- ##
> | configure: WARNING:     ## Report this to jacob at appelbaum.net ##
> | configure: WARNING:     ## ------------------------------------- ##
> | checking for openssl/ssl.h... no
> | configure: error: OpenSSL is not installed, openssl/sslh is missing
>
> Somehow it's not getting the definition for THIRTY_TWO_BIT from
> openssl/opensslconf.h (from openssl10) when testing for openssl/ssl.h
> so BN_ULONG ends up undefined... still digging as to what's going on.
>

thanks, is it using openssl10 ?

> --
> Alex Kiernan

