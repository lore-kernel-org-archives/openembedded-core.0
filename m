Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id 616607BF68
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 20:58:13 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id d201so1992854vka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 12:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MdzR7oYcWNaY0kVTA8Vd5c25IWfudtkDcyJ5ctorBp4=;
	b=VIVkQDnGPrtMk0vFf5EYWnAWAZ86s6sGIqhb0HbmW5aH/98w0Ld4AIoBmfSk85tR8T
	Fpqes9VqdxqkyjZw7uE8FHRF9TfxvFIo/4iSlCFgnrk5larRd0S7L5JJBLgf0BTbAWBA
	EgTKBpzd9sW8sHNr48hFdg4PWdn6OyneQsAqY7dtk/BjwynCovEQhMXV0i1L4zu1LdyJ
	Wla0K/a2S/Ly8w3XZcWWN9OplnyBYHO/whvMNwkc88/G/FXAdaDJeD1EKCC7LQRTLeDF
	E+GbmXIUbs7NhnYJTNxZmyHmqgD7Dcag/DprfvTsl5BJJDqxUSYCEcHy+4zU7qKLRdDG
	Uu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MdzR7oYcWNaY0kVTA8Vd5c25IWfudtkDcyJ5ctorBp4=;
	b=MUpg/7/gROE4KlM0W2xk0OCYhyry5KfPLGfwJjCDAwm7hEpxmnJnR4d8v6fXH/y/wY
	uhPTZqIklLzSSF46EWUZGHrfjLt6X+dB212rtP3c9BvLmzrXSft+RWJvUMeuJJ8R0ZMZ
	Szc7Coik+SPJB9QCXqssDU4JJdpTIOeKRw4KKR/txhipbLIlO6m4Y7DxassFNVhycgI1
	hDpbmL0dHuaEJkY4I7iU9nU5R7hBcQOjg2GRMBpXgrjemwZa5LNEWfOgVugxmlfFWgVT
	5SDMEOG8yUYTIaRB5rspul0Os+I7bhu7GKO2iskWaMycrXHTHwyckCFkS+TJYk+hBS8N
	NaYQ==
X-Gm-Message-State: AHQUAuY1tyUrNab0UMQ7+sEnhjYV2P+yEoeRUBYYV7+sltroKtm2JCAF
	QUFeDyRP+8C564ciEpej4K21AFqRaLpHxnXX1WU=
X-Google-Smtp-Source: AHgI3IYppSU3KZv52BxYUHP0F8wnSVgekkcZZSMJmj9wWrczsvcpzTQqiKNTxe1ek9NGDV6jnkSmnvwtz6Yp4XJjxMM=
X-Received: by 2002:a1f:6306:: with SMTP id x6mr4969271vkb.26.1549486694291;
	Wed, 06 Feb 2019 12:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20190205003627.4454-1-raj.khem@gmail.com>
	<CAO5Uq5RAbDD9KRQhXT2osH_ivYvskAMRMj82yq3RB8Zr0QdF8w@mail.gmail.com>
	<CAMKF1srzx8nQXUH8BxYJ_-oAfN+mfPryiGLgGRjh4ey+o07DnA@mail.gmail.com>
In-Reply-To: <CAMKF1srzx8nQXUH8BxYJ_-oAfN+mfPryiGLgGRjh4ey+o07DnA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 6 Feb 2019 20:58:03 +0000
Message-ID: <CAO5Uq5QO=c6eZRuU3Ew-_AEN0-EagqPX+2Ld_yhKLFb1Ztb6WA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 06 Feb 2019 20:58:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 6, 2019 at 8:50 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Feb 6, 2019 at 12:41 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > On Tue, Feb 5, 2019 at 12:36 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Avoid infinite include loops, especially with bits/wordsize.h which is
> > > now possible with the synthesized headers since we now also synthesize
> > > bits/wordsize.h itelf for some arches e.g. arm/aarch64
> > >
> > > In cases where extra preprocessing tools are used such as clang-tidy
> > > e.g. and these tools are not passed the knowledge about architecture
> > > then case comes where we enter into header include loop for
> > > bits/wordsize.h, since this template does explicitly include
> > > bits/wordsize.h
> > >
> > > To fix this emits the pragma once at beginning of file, this is better
> > > solution than include guards, and pragma once is practically supported
> > > on all compilers except few e.g. cray c/c++ compiler
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > Something about this is breaking a local recipe (for tlsdate fwiw, but
> > I don't think that's relevant):
> >
> > | checking openssl/ssl.h usability... no
> > | checking openssl/ssl.h presence... yes
> > | configure: WARNING: openssl/ssl.h: present but cannot be compiled
> > | configure: WARNING: openssl/ssl.h:     check for missing prerequisite headers?
> > | configure: WARNING: openssl/ssl.h: see the Autoconf documentation
> > | configure: WARNING: openssl/ssl.h:     section "Present But Cannot
> > Be Compiled"
> > | configure: WARNING: openssl/ssl.h: proceeding with the compiler's result
> > | configure: WARNING:     ## ------------------------------------- ##
> > | configure: WARNING:     ## Report this to jacob at appelbaum.net ##
> > | configure: WARNING:     ## ------------------------------------- ##
> > | checking for openssl/ssl.h... no
> > | configure: error: OpenSSL is not installed, openssl/sslh is missing
> >
> > Somehow it's not getting the definition for THIRTY_TWO_BIT from
> > openssl/opensslconf.h (from openssl10) when testing for openssl/ssl.h
> > so BN_ULONG ends up undefined... still digging as to what's going on.
> >
>
> thanks, is it using openssl10 ?
>

It is... I'm sure that's relevant, but I'm failing to spot it.

-- 
Alex Kiernan

