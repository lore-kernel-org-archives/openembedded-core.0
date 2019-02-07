Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 278956C0E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 02:16:39 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id b74so5765242vsd.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 18:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DhEIv2EDnC0as8Mv4pGLRnYgLejxxavbFBd/N4ASJ28=;
	b=skKBtDhKMTb1QWeEdA8XmcHMIjynispus31zU1sPyt66nF7GPbXrbgPv3xAzK/AXxI
	h68pYGO9fkG1RaxcOuvtvplx4Ti6sMRanSXvS40ZibNzeDlN5RA4yINy9QlUDynQkIIr
	XdSACKlEJ7NSFaV3Qvk8S1atvfTS1eBvSeqh44cSR1X3Lui3uLUuSYCzYDalkz4pgEcd
	wN262S3vHbQXxX7pHCYClaoZX+KgTzFanpVaJI8wi5H3VCe9H/UefvG7ieVkqFmQfLcD
	tU+WOKySSS5q3bkKruuKt30Vv/W0SXSVRaab/r65AS+SqF7wbpzdtCyDNCwyER98n9dv
	JAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DhEIv2EDnC0as8Mv4pGLRnYgLejxxavbFBd/N4ASJ28=;
	b=iSwg1NNhA9fRtPYSl8xNXJ1aHljXIA080TD82V9g3fPlvoe14rpLMxDh6CCaWspcBS
	GHiXZZjri0AiFjOv35TOmxfEeeoc6sRCEi3vIrcfAuvxNi8zyysE7ZrM4Rhm/Vd8KtWM
	XJBv2jN1DWNULfAlZiODMO2KnHF7WuDK1Vpfh4NE5dXKiKRn9j0dL9MSHZ8agpU0ZC5G
	wC2cU8/E2/wCkK3fs8VOg4y5zIXF/F+oRGRtthUejn5GBxRTKXANRyGhWewEAFXhs1tv
	PjL4/8MQiHqF284NuKNpTPtig9w3DlzPrB08Ezw98Ei252AinxwES/GiMhXCZfFFXPzh
	Kc8Q==
X-Gm-Message-State: AHQUAubQba96/DEstnR9Qf7Dduc3gJ+ou9vpS9Ol+4/C31McAlo9V/jv
	npNmxm9d6RyLCKco+xwE3orvivWBD+Kc4qNtmdM=
X-Google-Smtp-Source: AHgI3Ia+ov4Vc+be+4S11Jb56S9s69KEltPKtZ4V4m4ysC75OQtpD/EwdrVZcMGMwjuzTD0l3LvcfhoswtxY5eufSPo=
X-Received: by 2002:a67:7c92:: with SMTP id x140mr5337360vsc.137.1549505799897;
	Wed, 06 Feb 2019 18:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20190205003627.4454-1-raj.khem@gmail.com>
	<CAO5Uq5RAbDD9KRQhXT2osH_ivYvskAMRMj82yq3RB8Zr0QdF8w@mail.gmail.com>
	<CAMKF1srzx8nQXUH8BxYJ_-oAfN+mfPryiGLgGRjh4ey+o07DnA@mail.gmail.com>
	<CAO5Uq5QO=c6eZRuU3Ew-_AEN0-EagqPX+2Ld_yhKLFb1Ztb6WA@mail.gmail.com>
	<CAMKF1soYBT9-3_GKcAcf9EnL8ZkVmgxjVEho72HugQ4=abLEDw@mail.gmail.com>
	<CAO5Uq5QwD3m6AHXrZKY=Q1EDD9t9Q-XviB8voybAcYX3V0Abow@mail.gmail.com>
In-Reply-To: <CAO5Uq5QwD3m6AHXrZKY=Q1EDD9t9Q-XviB8voybAcYX3V0Abow@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 6 Feb 2019 18:16:28 -0800
Message-ID: <CAJ86T=VtKXsAYjVnO0EQH1fEYfAckn+Mi-7ivL6XNpwOt1gk_w@mail.gmail.com>
To: alex.kiernan@gmail.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 07 Feb 2019 02:16:39 -0000
Content-Type: text/plain; charset="UTF-8"

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
> > > >
> > > > thanks, is it using openssl10 ?
> > > >

I'm also seeing build issues with openssl10 which seem to be related
to this change:

 | i586-oe-linux-gcc -m32 -march=i586
--sysroot=/.../tmp-glibc/work/i586-oe-linux/mosquitto/1.4.8-r0/recipe-sysroot
-O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/.../tmp-glibc/work/i586-oe-linux/mosquitto/1.4.8-r0=/usr/src/debug/mosquitto/1.4.8-r0
-fdebug-prefix-map=/.../tmp-glibc/work/i586-oe-linux/mosquitto/1.4.8-r0/recipe-sysroot=
-fdebug-prefix-map=/.../tmp-glibc/work/i586-oe-linux/mosquitto/1.4.8-r0/recipe-sysroot-native=
-I. -I.. -I../lib -fPIC -DWITH_TLS -DWITH_TLS_PSK -DWITH_THREADING
-DWITH_SOCKS -c read_handle_shared.c -o read_handle_shared.o
 | In file included from
/.../tmp-glibc/work/i586-oe-linux/mosquitto/1.4.8-r0/recipe-sysroot/usr/include/openssl/engine.h:75,
 |                  from net_mosq.c:55:
 | /.../tmp-glibc/work/i586-oe-linux/mosquitto/1.4.8-r0/recipe-sysroot/usr/include/openssl/bn.h:321:5:
error: unknown type name 'BN_ULONG'
 |      BN_ULONG *d;                /* Pointer to an array of 'BN_BITS2' bit
 |      ^~~~~~~~
 | /.../tmp-glibc/work/i586-oe-linux/mosquitto/1.4.8-r0/recipe-sysroot/usr/include/openssl/bn.h:337:5:
error: unknown type name 'BN_ULONG'
 |      BN_ULONG n0[2];             /* least significant word(s) of Ni; (type
 |      ^~~~~~~~

