Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9BFDB7C64E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 17:36:29 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x7so8355478ioh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8lrDkVGABba4uxg7H9ok9cK/QuShsvtVAN/1J7SNC5Q=;
	b=FAUl3atywoNkxEqoLgHt4o9qWmwVwL7K+9eQcXIiLdVs2jjzK7w0vWe82aZ7M5pN9G
	6nzu5UWouoBpBGOzsfvIbQupO4lyZXcD9YfYhRZrpaeNq+elZ1uif04lBHyJneQeOkyP
	lCsJHeh6KSr9lKXH+cbvvqzlaasb820GaNg0PIBq7PWgQU81APBQwuGKdpBrleqFqgt5
	CPAM6/0aDxs6aP3eM8twTRtBs2R9ajMSxu3fGT3G2uaM8bEANmOZuCxPdH/FMJ9idG8Q
	+heWGVN/ZPDPX0+Ac99kzfqL/Sl8RIeCZs62kPw/VpJ+mNdQT4ctkzkI/snkajY4En+Q
	1RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8lrDkVGABba4uxg7H9ok9cK/QuShsvtVAN/1J7SNC5Q=;
	b=KGXYfZrVrjwTkKHDyj0RZj0dQGwbmSM6msLdy3NmEo/bqc+UmZ6wDAl/odFlje4jzS
	EVtNpZjQAwaz92zR74THoC504UwuNA8HO9FYJHE9LNB4sGTDtTJtz6TwhnJyv+29SokB
	fTrpj7E6USVzvnK2A1RyZ14TqnqBm+QnRrhAqqhokYIy4iI9Wsni15troe4qhg4eMa1i
	ArGJNLCS6vNmteEAcgqZ7hAlVf2n5prfbdACYyVCtLXX6LizX7rzWI3baUcU2bFstSjH
	7pSNRllnuYTYEvQ7u59xK5PqcouhRnrR428jKQUSd93rgSg4zVgvETdMRgfMfwPQdft7
	q/GQ==
X-Gm-Message-State: APjAAAVyOu6ZZ3EDw9+4gOlbPyQjWG5HwsFoD2vT2K4GSTqPs6IUX7/o
	vLSngLcaIBE+8aQgBOpB4XkF8HoA42INlq4dQhc=
X-Google-Smtp-Source: APXvYqxfrEnCDh/dCKdmnVmLZJJCOxpLo/3+ZhDQEzWV/6/QS+g6v+UfmYuNUXdK3dR+X1Jjpm5ix28BWc6r/3mA61Y=
X-Received: by 2002:a5e:c249:: with SMTP id w9mr17660417iop.284.1553535390575; 
	Mon, 25 Mar 2019 10:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
	<CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
	<CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
	<20190325161004.GB484@localhost>
	<CALbNGRSgkQrjKrhEywJb3DhvKv3gkobZvv7YG_DxE039SAqJaw@mail.gmail.com>
	<CALbNGRThou+6CNKotr-hduJoKNPgg+F2i8PQdgjBGcGRZeOKdw@mail.gmail.com>
In-Reply-To: <CALbNGRThou+6CNKotr-hduJoKNPgg+F2i8PQdgjBGcGRZeOKdw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 25 Mar 2019 18:36:19 +0100
Message-ID: <CALbNGRSSXNWW4-Xn=aa2zVe4u=cT5AE50AKy+URSZXcTJfHRsw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Mon, 25 Mar 2019 17:36:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 6:15 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Mar 25, 2019 at 5:26 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Mon, Mar 25, 2019 at 5:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Mon, Mar 25, 2019 at 04:36:44PM +0100, Andrea Adami wrote:
> > > > On Sat, Mar 23, 2019 at 11:00 PM Andreas M=C3=BCller <schnitzeltony=
@gmail.com> wrote:
> > > > >
> > > > > On Sat, Mar 23, 2019 at 10:53 PM Adrian Bunk <bunk@stusta.de> wro=
te:
> > > > > >
> > > > > > On Sat, Mar 23, 2019 at 10:22:15PM +0100, Andreas M=C3=BCller w=
rote:
> > > > > > > On Sat, Mar 23, 2019 at 10:16 PM Adrian Bunk <bunk@stusta.de>=
 wrote:
> > > > > > > >
> > > > > > > > On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
> > > > > > > > >...
> > > > > > > > > There are certain design aspects of musl which are actual=
ly turning
> > > > > > > > > out to be good
> > > > > > > > > e.g. there is no __MUSL__ define, so non-portable code ca=
n not be
> > > > > > > > > hidden which is a good thing,
> > > > > > > > >...
> > > > > > > >
> > > > > > > > Please take a closer look at some of the musl changes to NM=
 that made
> > > > > > > > upgrading NM so hard for Andreas.
> > > > > > > >
> > > > > > > > +#if defined(__GLIBC__)
> > > > > > > >  #include <net/ethernet.h>
> > > > > > > > +#else /* musl libc */
> > > > > > > > +#define ETH_ALEN       6               /* Octets in one et=
hernet addr   */
> > > > > > > > +#endif
> > > >...
> > > >
> > > > Hi,
> > >
> > > Hi Andrea,
> > >
> > > > I am jumping in a little late to take side with Khem :)
> > > >
> > > > What happens now is that more 'bad' sources (written to suit glibc =
and
> > > > thus not portable) are discovered by the wider base of developers a=
nd
> > > > autobuilders.
> > > >...
> > >
> > > but this does not apply to this example, which is a problem between
> > > musl itself and the kernel headers.
> > >
> > > Code can expect #include <foo.h> to work for any headers, and with an=
y
> > > order of these headers. If it does not, the 'bad' sources are whateve=
r
> > > sources provide the headers in question.
> > >
> > > musl does provide net/ethernet.h, but including it causes a compile
> > > error here.
> > Out of curiosity: you have some log?
> >
> Looked into this. Found an old musl build failure of networkmanager
> [1] but I think the issue has not changed:
>
> | In file included from
> TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/re=
cipe-sysroot/usr/include/net/ethernet.h:10,
> |                  from ../NetworkManager-1.14.4/shared/n-acd/src/n-acd.c=
:28:
> | TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/=
recipe-sysroot/usr/include/netinet/if_ether.h:111:8:
> error: redefinition of 'struct ethhdr'
> |  struct ethhdr {
> |         ^~~~~~
> | In file included from ../NetworkManager-1.14.4/shared/n-acd/src/n-acd.c=
:26:
> | TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/=
recipe-sysroot/usr/include/linux/if_ether.h:167:8:
> note: originally defined here
> | struct ethhdr {
> |         ^~~~~~
>
> glibc does not fail because it does include linux header
> | /* Get definitions from kernel header file.  */
> | #include <linux/if_ether.h>
> and does not define struct ethhdr
>
> linux/if_ether.h says:
> /* allow libcs like musl to deactivate this, glibc does not implement thi=
s. */
> #ifndef __UAPI_DEF_ETHHDR
> #define __UAPI_DEF_ETHHDR        1
> #endif
>
> #if __UAPI_DEF_ETHHDR
> struct ethhdr {
>     unsigned char    h_dest[ETH_ALEN];    /* destination eth addr    */
>     unsigned char    h_source[ETH_ALEN];    /* source ether addr    */
>     __be16        h_proto;        /* packet type ID field    */
> } __attribute__((packed));
> #endif
>
> musl does not include linux header but defines which is differen from
> what linux does:
> struct ethhdr {
>     uint8_t h_dest[ETH_ALEN];
>     uint8_t h_source[ETH_ALEN];
>     uint16_t h_proto;
> };
> and later
> #define __UAPI_DEF_ETHHDR       0
>
> So for networkmanager there is either some wrong sequence or it
> includes linux headers.
>
> And I am still not confident that it is our job to teach umpteen
> projects written for linux how to write portable code (oe-core has 147
> musl related patches and meta-openembedded has 140)...
>
> [1] http://errors.yoctoproject.org/Errors/Details/198239/
>
Something to add - haven't yet looked into networkmanger:

Do we have the chance to change the sequence of paths headers are searched =
for

1. musl
2. linux

That might fix some issues

Andreas

> Andreas

