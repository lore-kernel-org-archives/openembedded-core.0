Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id D7AE76BA10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 17:15:51 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id c4so8268242ioh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 10:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=V2ddBqTG42Dx6pUyL38cCkyoZbRfsdELVlWtlIhlIx8=;
	b=bkM9J/+60nrFiqs8ZjvoCEvcQ4WmNd1/2PFFx7Dc6M1H6pRhlXlHQwC1KsSS8orrcT
	TxhenyzYgDauPVMPPT+SMW15I1q256YvFoZ/qxqNMYh0OTWYmW4acN3/B1tbvAAt06Kx
	x5Wsq3+py2gxM7xwltzj9Ia4NGdfAZ1xKSceSqqlukuxSF3xpXR1MJ+3o0i19xTshis3
	Zg9UfyqchA8RNjVxpahjwbUffQk+3tuMJgit42RcI1joAwZGonVp6i0T4UKQjRcJlHeQ
	qHp/M0KLcKrtITjiRCYmpTUYHd+kl0VOaMwwFrHdNhtUSoxS5x6BxQUgQZiw9P4n2L6L
	32jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=V2ddBqTG42Dx6pUyL38cCkyoZbRfsdELVlWtlIhlIx8=;
	b=WCntXDtWjBX14cnrx28tGl+yRZufwfgGtwCZrNu4SBIRsm+2XdzvmGkwXObL4nsTsX
	7PzfcXT0kgjB5yUoYK7THrMeBpm5SFzpyIfbjSJ+hk4l/MPkzkmL40MFt7FvCsNBqjsl
	fS2SFT33pB/4ZI/gMCGcFyxcJ4UBPGcgL5Oh8bZ6hlUNiXLJxQJ6h4ViUCRM5BEY6v4M
	VnDneFnHI5s1Y4KOJ6ApHbb0mHXadePBLAfzL3NYRrYdPhBqRN+5n+PQg3BMvP6yE6Tp
	p83sg3AcjOIfomYH8ClqDyOEWEw0MtY7OEVxC+EcrNZCdwvZGo1SPrBTUFi3wXLX6cZZ
	OgDw==
X-Gm-Message-State: APjAAAWj+Cfi7mUdSnu0VO+SQSyeKxsfcxOsUCcmCrdzZvW30T595U/s
	lks0v4pABzTDxGO3vAIPGhLJyX4QXHAtXDgs57+xbhIK
X-Google-Smtp-Source: APXvYqyWj2zltnXqWLTaUVO9P0uYSzOHwrEzjuj8dlEwzU9PCT8MnQkEPoUYz8i0MQOUMkxzRYjDNxHNC212n0JRezY=
X-Received: by 2002:a5d:9a08:: with SMTP id s8mr15276036iol.99.1553534152891; 
	Mon, 25 Mar 2019 10:15:52 -0700 (PDT)
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
In-Reply-To: <CALbNGRSgkQrjKrhEywJb3DhvKv3gkobZvv7YG_DxE039SAqJaw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 25 Mar 2019 18:15:40 +0100
Message-ID: <CALbNGRThou+6CNKotr-hduJoKNPgg+F2i8PQdgjBGcGRZeOKdw@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Mar 2019 17:15:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 5:26 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Mar 25, 2019 at 5:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Mon, Mar 25, 2019 at 04:36:44PM +0100, Andrea Adami wrote:
> > > On Sat, Mar 23, 2019 at 11:00 PM Andreas M=C3=BCller <schnitzeltony@g=
mail.com> wrote:
> > > >
> > > > On Sat, Mar 23, 2019 at 10:53 PM Adrian Bunk <bunk@stusta.de> wrote=
:
> > > > >
> > > > > On Sat, Mar 23, 2019 at 10:22:15PM +0100, Andreas M=C3=BCller wro=
te:
> > > > > > On Sat, Mar 23, 2019 at 10:16 PM Adrian Bunk <bunk@stusta.de> w=
rote:
> > > > > > >
> > > > > > > On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
> > > > > > > >...
> > > > > > > > There are certain design aspects of musl which are actually=
 turning
> > > > > > > > out to be good
> > > > > > > > e.g. there is no __MUSL__ define, so non-portable code can =
not be
> > > > > > > > hidden which is a good thing,
> > > > > > > >...
> > > > > > >
> > > > > > > Please take a closer look at some of the musl changes to NM t=
hat made
> > > > > > > upgrading NM so hard for Andreas.
> > > > > > >
> > > > > > > +#if defined(__GLIBC__)
> > > > > > >  #include <net/ethernet.h>
> > > > > > > +#else /* musl libc */
> > > > > > > +#define ETH_ALEN       6               /* Octets in one ethe=
rnet addr   */
> > > > > > > +#endif
> > >...
> > >
> > > Hi,
> >
> > Hi Andrea,
> >
> > > I am jumping in a little late to take side with Khem :)
> > >
> > > What happens now is that more 'bad' sources (written to suit glibc an=
d
> > > thus not portable) are discovered by the wider base of developers and
> > > autobuilders.
> > >...
> >
> > but this does not apply to this example, which is a problem between
> > musl itself and the kernel headers.
> >
> > Code can expect #include <foo.h> to work for any headers, and with any
> > order of these headers. If it does not, the 'bad' sources are whatever
> > sources provide the headers in question.
> >
> > musl does provide net/ethernet.h, but including it causes a compile
> > error here.
> Out of curiosity: you have some log?
>
Looked into this. Found an old musl build failure of networkmanager
[1] but I think the issue has not changed:

| In file included from
TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/reci=
pe-sysroot/usr/include/net/ethernet.h:10,
|                  from ../NetworkManager-1.14.4/shared/n-acd/src/n-acd.c:2=
8:
| TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/re=
cipe-sysroot/usr/include/netinet/if_ether.h:111:8:
error: redefinition of 'struct ethhdr'
|  struct ethhdr {
|         ^~~~~~
| In file included from ../NetworkManager-1.14.4/shared/n-acd/src/n-acd.c:2=
6:
| TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/re=
cipe-sysroot/usr/include/linux/if_ether.h:167:8:
note: originally defined here
| struct ethhdr {
|         ^~~~~~

glibc does not fail because it does include linux header
| /* Get definitions from kernel header file.  */
| #include <linux/if_ether.h>
and does not define struct ethhdr

linux/if_ether.h says:
/* allow libcs like musl to deactivate this, glibc does not implement this.=
 */
#ifndef __UAPI_DEF_ETHHDR
#define __UAPI_DEF_ETHHDR        1
#endif

#if __UAPI_DEF_ETHHDR
struct ethhdr {
    unsigned char    h_dest[ETH_ALEN];    /* destination eth addr    */
    unsigned char    h_source[ETH_ALEN];    /* source ether addr    */
    __be16        h_proto;        /* packet type ID field    */
} __attribute__((packed));
#endif

musl does not include linux header but defines which is differen from
what linux does:
struct ethhdr {
    uint8_t h_dest[ETH_ALEN];
    uint8_t h_source[ETH_ALEN];
    uint16_t h_proto;
};
and later
#define __UAPI_DEF_ETHHDR       0

So for networkmanager there is either some wrong sequence or it
includes linux headers.

And I am still not confident that it is our job to teach umpteen
projects written for linux how to write portable code (oe-core has 147
musl related patches and meta-openembedded has 140)...

[1] http://errors.yoctoproject.org/Errors/Details/198239/

Andreas

