Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id ADC067CDAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 17:46:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44ShX74VX6z60;
	Mon, 25 Mar 2019 18:46:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553535991;
	bh=+Rd/s6HlpIKMFbsiIgJAqkSrZbOBV4/bUwpcMzfIiNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKXOs7PhFY3ir1is/TREe9aWGhSx69HeUriTASch9LwZFsJClSw1KPVy/GqjbALh9
	xc/MdgVUJ/FZQTBbIpnsxmVbs3DTdoqUdgZo4jr0w2khdsPMX57hYJuz1PujKMCzHJ
	tptj9NtARKpJ+Nd/lNnyy87thIBOLBlsTILrytPYENJOUPDTFQHKyI3qGwZ/KxpGq0
	UGMLWV+wmJCB/KnJUZo/HQHySybyTrjerE+4dLTqtNleXJZTCnEF2yusgM8tfWrWBQ
	IXHDTgky5++tnhMUfALmmnyufaDAXmcRbZSyYsESxfZK5TDeungWvJApixbx4tCR3I
	e8wdSlFalGkpR/rNR/5p6YJc9Ppe3mSD+8Rz7rMNXixfvuUZVoFLAX2jqIiZ4/cOEL
	8IZEOCKtOSgVa5OqO6EBuqpYgH5kZDnotuowjHoeH64oBCxK+7+PvmjsFeIpNc3aZV
	EwLuEMMk80XYUpndGMIcOmDa1M6hfmplTcvgSrfnRfChwdMcLq67d83/7ZI79FgC0p
	1i62HqaZknBRUmNXYV/7L+NRBvmSXCu984XTopEgZKKwZK6AX+eDlKriFZKy4SkHDQ
	l25EPnSB9Uqu6+32DvMvFcfzilpw4SH5+AMtDnBUaFbaf9JyElYv44ckskQDcqUPH0
	SX/crGLfFFPgocQANgnzwFuQ=
Date: Mon, 25 Mar 2019 19:46:29 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190325174629.GA5805@localhost>
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
MIME-Version: 1.0
In-Reply-To: <CALbNGRThou+6CNKotr-hduJoKNPgg+F2i8PQdgjBGcGRZeOKdw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Mon, 25 Mar 2019 17:46:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 25, 2019 at 06:15:40PM +0100, Andreas Müller wrote:
>...
> Looked into this. Found an old musl build failure of networkmanager
> [1] but I think the issue has not changed:
> 
> | In file included from
> TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/recipe-sysroot/usr/include/net/ethernet.h:10,
> |                  from ../NetworkManager-1.14.4/shared/n-acd/src/n-acd.c:28:
> | TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/recipe-sysroot/usr/include/netinet/if_ether.h:111:8:
> error: redefinition of 'struct ethhdr'
> |  struct ethhdr {
> |         ^~~~~~
> | In file included from ../NetworkManager-1.14.4/shared/n-acd/src/n-acd.c:26:
> | TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/recipe-sysroot/usr/include/linux/if_ether.h:167:8:
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
> /* allow libcs like musl to deactivate this, glibc does not implement this. */
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

musl headers providing own different definitions of kernel interfaces
is a problem in musl.

After reading [1] I think that this is musl upstream having made the 
decision of not even trying to work properly with the kernel headers.

OE adding a not upstreamable patch that removes one of the two 
definitions in musl builds might be the best available solution.

> And I am still not confident that it is our job to teach umpteen
> projects written for linux how to write portable code (oe-core has 147
> musl related patches and meta-openembedded has 140)...
>...

This is not about writing portable code, this is about problems with musl.

Using the Linux userspace headers is obviously not portable to non-Linux,
but many packages like NetworkManager are anyways Linux-only no matter 
what you do.

> Andreas

cu
Adrian

[1] https://wiki.musl-libc.org/faq.html#Q:-Why-am-I-getting-

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


