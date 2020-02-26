Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id E311D616EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 16:35:08 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j6zeP-0005ra-Dm; Wed, 26 Feb 2020 17:35:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZgJnNTGcPo13INxGYJiFDGgItae0bm+ETUJJwSl6kMU=;
	b=f24qS2XPFSCC4bOnWRFY121LTp
	YCsPlCh6LjbEOZKscygApMTLtcLVLcmLmSZ/p96m5gKNNWbvvX9ewCe63EbGtBVD8KAV8xV0OyK2m
	Fov1mCv+TBQUokjSVtUuZCRmKKIhiWKOJsaEQh0qToYDCbJnxrUIZYRZw/eAI6mP60OOiy4tjHjf3
	KkqiT5q7u6nu1DuK+4O8M1atJfqcv1xfgHNXbhstAdgkwGBvg1f6eje5awayIyVfqxR4AB3Uqk4E3
	s2TIyBIj9BnVx+gcWOIjVOnJkke4fdpU+2HcvhSooan8n1sthmr2xafrQVbBj05D/qmhzmIO82gpn
	O2uPSzWQ==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1j6zeL-0007FT-2K; Wed, 26 Feb 2020 17:35:07 +0100
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
	<CANNYZj8MzPaJM7DMuufL_QShHtK5v5e=VjK7xmS2zz1ovf7J6g@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <a9d54420-9427-c153-aa2c-1586363de362@pr.hu>
Date: Wed, 26 Feb 2020 17:35:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8MzPaJM7DMuufL_QShHtK5v5e=VjK7xmS2zz1ovf7J6g@mail.gmail.com>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 2da2f9fc373ce6b0f4ec2747a0f9b020
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226163507Z
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libva-initial: New recipe to carry only pkgconfig files and headers
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
X-List-Received-Date: Wed, 26 Feb 2020 16:35:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2020. 02. 26. 17:12 keltezéssel, Alexander Kanavin írta:
> The 'circular dependency' thing must be explained in the commits, and not in a discussion 
> link to some email elsewhere.
> 
> I still don't get why this is needed. The -initial recipe is identical to the eventual 
> 'real' recipe, so where is the circularity coming from?

libva -> mesa -> libva

> 
> Alex
> 
> On Wed, 26 Feb 2020 at 15:05, Böszörményi Zoltán via Openembedded-core 
> <openembedded-core@lists.openembedded.org 
> <mailto:openembedded-core@lists.openembedded.org>> wrote:
> 
>     The package name exploits sstate.bbclass so it's not added as
>     implicit dependency to packages.
> 
>     Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu <mailto:zboszor@pr.hu>>
>     ---
>       meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
>       meta/recipes-graphics/libva/libva-initial_2.6.1.bb <http://libva-initial_2.6.1.bb> |
>     5 +++++
>       2 files changed, 8 insertions(+), 1 deletion(-)
>       create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>     <http://libva-initial_2.6.1.bb>
> 
>     diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc
>     b/meta/recipes-graphics/libva/libva-2.6.1.inc
>     index ca1386d80b..5b1cdee7e3 100644
>     --- a/meta/recipes-graphics/libva/libva-2.6.1.inc
>     +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
>     @@ -17,10 +17,12 @@ SECTION = "x11"
>       LICENSE = "MIT"
>       LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
> 
>     -SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2
>     <https://github.com/intel/$%7BBPN%7D/releases/download/$%7BPV%7D/$%7BBP%7D.tar.bz2>"
>     +SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2
>     <https://github.com/intel/libva/releases/download/$%7BPV%7D/libva-$%7BPV%7D.tar.bz2>"
>       SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
>       SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
> 
>     +S = "${WORKDIR}/libva-${PV}"
>     +
>       UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
> 
>       DEPENDS = "libdrm"
>     diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>     <http://libva-initial_2.6.1.bb> b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
>     <http://libva-initial_2.6.1.bb>
>     new file mode 100644
>     index 0000000000..828ef6fbca
>     --- /dev/null
>     +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb <http://libva-initial_2.6.1.bb>
>     @@ -0,0 +1,5 @@
>     +require libva-${PV}.inc
>     +
>     +do_install_append () {
>     +       rm -f ${D}${libdir}/*.so*
>     +}
>     -- 
>     2.24.1
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


