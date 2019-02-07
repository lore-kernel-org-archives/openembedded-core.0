Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6627C31A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 06:27:39 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l11so10847596qtp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 22:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2Tn+kHbyKW3v/aWOuW/AlHAfrKXAvGHbW3VtH7IOubQ=;
	b=i6noAUvawMQR+hR8AbAwjU7OO3WceSPigtV1T8iNLpySR6iZudd1U7x0i48y8asiKf
	qfWDwQ0TIc6cVkKU5sWEKZn0W6H4B3SrlHmIueNS1V/De8HGsOJd6TGl5Ra0jcGFWOpK
	e5DGiBwhpyMFFnV2cqFqbJeTxp138SXubDH5OCwkB39mRSpXb+b+TIQjgTBlCk29pWls
	DH3mMxoF0m2qxPy+cCWGPx8m5UFoKhKjapBg5vNd1Ur8v54uk18GFdNDkCpPL77jBpzU
	758QH0wd8AM66s2Mo67iP2nRA9aeKbZ+71o0Cee6ujbZ9r9+QP87BAa802wmTLmln2Zj
	T/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2Tn+kHbyKW3v/aWOuW/AlHAfrKXAvGHbW3VtH7IOubQ=;
	b=LHN6xRq5+1Lkd/4ELUxvhDNdcgsz0SWAWP+1AfUmI4bAa5a5qfsgZzYYE+CVgX2N5p
	RgwQZVTek9/fLwVCsLX37Pt+BeNVrhIS0/R4IknWvdhP9wden6IzgVH+PVl8W4WVd5lB
	VsD2iDAov0qYvvzROVB2kQF4k2gS8eCkF9xerNN0mEeJdbShc4mP0ToTDpchVVjxtpsE
	h5V59lYICBX52fv7+vRGh9Ql4hHgYKd2q/ES7xiUXhadh8R262UlWns7Xw+3cQrmxx/q
	2x5Rh7xyTzGe6jrIfHLENEBvI3ymKEGFhcfQ6WGKGB1onyHFTcBVxCio/ldwz5P/2Eug
	J1fg==
X-Gm-Message-State: AHQUAuad4uhuxtu415otU2RTUqPvQHIXRWiVk2A1j8XT/SZlay5gydsP
	q0tjdwcpL126BKjCSiGOXAkogw7jzom9odN6H+s=
X-Google-Smtp-Source: AHgI3IZbx6xHTBtXgy57FVLNyWGE/HSbD0p9HfsmR7bvVrCB8cAbupYVuxjQJCqM6QW0mPOleg6AY6gWiDOOdJuosrw=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr2140720qtn.253.1549520860604; 
	Wed, 06 Feb 2019 22:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20190205003627.4454-1-raj.khem@gmail.com>
	<CAO5Uq5RAbDD9KRQhXT2osH_ivYvskAMRMj82yq3RB8Zr0QdF8w@mail.gmail.com>
	<CAMKF1srzx8nQXUH8BxYJ_-oAfN+mfPryiGLgGRjh4ey+o07DnA@mail.gmail.com>
	<CAO5Uq5QO=c6eZRuU3Ew-_AEN0-EagqPX+2Ld_yhKLFb1Ztb6WA@mail.gmail.com>
	<CAMKF1soYBT9-3_GKcAcf9EnL8ZkVmgxjVEho72HugQ4=abLEDw@mail.gmail.com>
	<CAO5Uq5QwD3m6AHXrZKY=Q1EDD9t9Q-XviB8voybAcYX3V0Abow@mail.gmail.com>
In-Reply-To: <CAO5Uq5QwD3m6AHXrZKY=Q1EDD9t9Q-XviB8voybAcYX3V0Abow@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Feb 2019 22:27:13 -0800
Message-ID: <CAMKF1sru_=kBzWJ3eXby_bBsej0SpZA_9nXj4ALxZiBYgA+yNA@mail.gmail.com>
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
X-List-Received-Date: Thu, 07 Feb 2019 06:27:40 -0000
Content-Type: text/plain; charset="UTF-8"

Please try the patch I posted for openssl10 and report back
https://patchwork.openembedded.org/patch/158573/

On Wed, Feb 6, 2019 at 1:49 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Wed, Feb 6, 2019 at 9:23 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Feb 6, 2019 at 12:58 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > >
> > > On Wed, Feb 6, 2019 at 8:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Wed, Feb 6, 2019 at 12:41 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > > > >
> > > > > On Tue, Feb 5, 2019 at 12:36 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > > > >
> > > > > > Avoid infinite include loops, especially with bits/wordsize.h which is
> > > > > > now possible with the synthesized headers since we now also synthesize
> > > > > > bits/wordsize.h itelf for some arches e.g. arm/aarch64
> > > > > >
> > > > > > In cases where extra preprocessing tools are used such as clang-tidy
> > > > > > e.g. and these tools are not passed the knowledge about architecture
> > > > > > then case comes where we enter into header include loop for
> > > > > > bits/wordsize.h, since this template does explicitly include
> > > > > > bits/wordsize.h
> > > > > >
> > > > > > To fix this emits the pragma once at beginning of file, this is better
> > > > > > solution than include guards, and pragma once is practically supported
> > > > > > on all compilers except few e.g. cray c/c++ compiler
> > > > > >
> > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > >
> > > > > Something about this is breaking a local recipe (for tlsdate fwiw, but
> > > > > I don't think that's relevant):
> > > > >
> > > > > | checking openssl/ssl.h usability... no
> > > > > | checking openssl/ssl.h presence... yes
> > > > > | configure: WARNING: openssl/ssl.h: present but cannot be compiled
> > > > > | configure: WARNING: openssl/ssl.h:     check for missing prerequisite headers?
> > > > > | configure: WARNING: openssl/ssl.h: see the Autoconf documentation
> > > > > | configure: WARNING: openssl/ssl.h:     section "Present But Cannot
> > > > > Be Compiled"
> > > > > | configure: WARNING: openssl/ssl.h: proceeding with the compiler's result
> > > > > | configure: WARNING:     ## ------------------------------------- ##
> > > > > | configure: WARNING:     ## Report this to jacob at appelbaum.net ##
> > > > > | configure: WARNING:     ## ------------------------------------- ##
> > > > > | checking for openssl/ssl.h... no
> > > > > | configure: error: OpenSSL is not installed, openssl/sslh is missing
> > > > >
> > > > > Somehow it's not getting the definition for THIRTY_TWO_BIT from
> > > > > openssl/opensslconf.h (from openssl10) when testing for openssl/ssl.h
> > > > > so BN_ULONG ends up undefined... still digging as to what's going on.
> > > > >
> > > >
> > > > thanks, is it using openssl10 ?
> > > >
> > >
> > > It is... I'm sure that's relevant, but I'm failing to spot it.
> > >
> >
> > so where all do you have opensslconf.h in target sysroot ?
> >
>
> $ find tmp -name opensslconf.h -ls
>   1589118      8 -rw-r--r--   3 vagrant  vagrant      4534 Feb  6
> 11:40 tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/include/openssl/opensslconf.h
>   1451388      4 -rw-r--r--   4 vagrant  vagrant      1971 Feb  6
> 21:31 tmp/work/armv7at2hf-neon-poky-linux-gnueabi/tlsdate/0.0.13+gitAUTOINC+751f82dc6f-r0/recipe-sysroot/usr/include/openssl/opensslconf.h
>   1589118      8 -rw-r--r--   3 vagrant  vagrant      4534 Feb  6
> 11:40 tmp/work/armv7at2hf-neon-poky-linux-gnueabi/openssl10/1.0.2q-r0/recipe-sysroot-native/usr/include/openssl/opensslconf.h
>   1451388      4 -rw-r--r--   4 vagrant  vagrant      1971 Feb  6
> 21:31 tmp/work/armv7at2hf-neon-poky-linux-gnueabi/openssl10/1.0.2q-r0/sysroot-destdir/usr/include/openssl/opensslconf.h
>   1574753      8 -rw-r--r--   1 vagrant  vagrant      7423 Feb  6
> 21:30 tmp/work/armv7at2hf-neon-poky-linux-gnueabi/openssl10/1.0.2q-r0/openssl-1.0.2q/crypto/opensslconf.h
>   1717763      4 -rw-r--r--   1 vagrant  vagrant      3201 Nov 20
> 13:44 tmp/work/armv7at2hf-neon-poky-linux-gnueabi/openssl10/1.0.2q-r0/openssl-1.0.2q/MacOS/opensslconf.h
>   1574836      0 lrwxrwxrwx   1 vagrant  vagrant        26 Feb  6
> 21:30 tmp/work/armv7at2hf-neon-poky-linux-gnueabi/openssl10/1.0.2q-r0/openssl-1.0.2q/include/openssl/opensslconf.h
> -> ../../crypto/opensslconf.h
>   1451388      4 -rw-r--r--   4 vagrant  vagrant      1971 Feb  6
> 21:31 tmp/work/armv7at2hf-neon-poky-linux-gnueabi/openssl10/1.0.2q-r0/image/usr/include/openssl/opensslconf.h
>   1589118      8 -rw-r--r--   3 vagrant  vagrant      4534 Feb  6
> 11:40 tmp/sysroots-components/x86_64/openssl-native/usr/include/openssl/opensslconf.h
>   1849804      4 -rw-r--r--   1 vagrant  vagrant      1971 Feb  6
> 13:28 tmp/sysroots-components/armv7at2hf-neon/openssl/usr/include/openssl/opensslconf.h
>   1451388      4 -rw-r--r--   4 vagrant  vagrant      1971 Feb  6
> 21:31 tmp/sysroots-components/armv7at2hf-neon/openssl10/usr/include/openssl/opensslconf.h
>
> --
> Alex Kiernan

