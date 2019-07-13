Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C1B227F111
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jul 2019 06:53:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45m0qn35cKzFS;
	Sat, 13 Jul 2019 08:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563000805;
	bh=j/5yG4kDRs/AcHhjDdinQWWW8tsts4xlpseg77A6Dpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=el2oNIgvkqM+uEdrrsErH2KV5xGXp6fSCFHUl7LVwzjzWihUzme6wTxz5LSd5ofAj
	ob5r1gUMN5TYn4x8mwd62/ZSqm4cLJ3zgQqi9KXaLypTXE6ulSmrwJ0E/eQ6yYwv9a
	BAOdgzdYAKdEX7XJpo3ON65AZWvjbtM9zoLMMR7955N1lQpraq9WSv5Ydy2Dep/N32
	MidvMQ5xfAo/oYDejyiPZ56jt3SdxAujbEkS1FbwuEwiZ95s65cAmSG8a6qMP5WZTQ
	yyOFCJG0sqb26JLS7I5U/ysLQD8ktIuS+ie6X5/UqFsIa1BfwaWtxR/+LRFaFbqk7F
	Z/erkOIpSPsuJYTOYoY1KQSYf84weu9f0DC22L388ncw5RdAkh/hS2vrf6qsKMHrT6
	gdiYnmVTIUv+9oUDQRw0BM/66bRuq15tCQK45NBEK3M3/A3C/X7g2GScx5btvNMtFY
	Bf8cztNmE1xJz2GneF8f0GLL8eNHYQeeguDTUvo+MDLjy03THu3fBDT6LEAi0AQ9ys
	bmYB8JgSAbhmMi14tQSPqSjf4rMZ4Yx/bU+cvfwVsiTTNOE2sDPV6haH0GCt3sikQC
	Bu1AxI+7VfOtO5Oez9m4jN78fXT8ziJ2JikxZB2uFWiiapK7QyaMKDNW00PDmH0EtQ
	3Exs8CYSISOOtpQi89eRLPZM=
Date: Sat, 13 Jul 2019 09:53:23 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190713065323.GA21584@localhost>
References: <20190712074813.15131-1-bunk@stusta.de>
	<20190712075547.GA1468@jama>
MIME-Version: 1.0
In-Reply-To: <20190712075547.GA1468@jama>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove remnants of bluez4 support
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
X-List-Received-Date: Sat, 13 Jul 2019 06:53:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jul 12, 2019 at 09:55:47AM +0200, Martin Jansa wrote:
> On Fri, Jul 12, 2019 at 10:48:13AM +0300, Adrian Bunk wrote:
>...
> > --- a/meta/conf/distro/include/default-providers.inc
> > +++ b/meta/conf/distro/include/default-providers.inc
> > @@ -44,7 +44,7 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
> >  PREFERRED_PROVIDER_console-tools ?= "kbd"
> >  PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
> >  PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
> > -PREFERRED_RPROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez-hcidump',d)}"
> > +PREFERRED_RPROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth','bluez5','bluez-hcidump',d)}"
> 
> Is this still needed?
> 
> With all remnants of bluez4 gone, bluez-hcidump is probably rprovided
> only by bluez5 now.
>...

Thanks, v2 sent.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


