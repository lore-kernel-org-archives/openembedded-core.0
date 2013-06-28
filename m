Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1296A4E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 17:58:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2013 10:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,960,1363158000"; d="scan'208";a="337140563"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2013 10:58:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:58:24 +0100
Message-ID: <2321033.pcU8edf92s@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CALmOhgn3KnvPe2EqZ04vPrWuM7tYkK1xTKbD4ZEUxaubDRAGhA@mail.gmail.com>
References: <1372084023.9930.30.camel@ted>
	<CALmOhgn3KnvPe2EqZ04vPrWuM7tYkK1xTKbD4ZEUxaubDRAGhA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] linux-firmware: Package some iwlwifi firmware separately
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
X-List-Received-Date: Fri, 28 Jun 2013 17:58:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 25 June 2013 16:35:13 Trevor Woerner wrote:
> On 24 June 2013 10:27, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >  PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx ${PN}-vt6656 \
> >  
> >               ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce
> >               ${PN}-rtl8192su \
> >               ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330
> >               ${PN}-bcm4334 \
> > 
> > -             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k
> > ${PN}-ath9k" +             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k
> > ${PN}-ath6k ${PN}-ath9k \ +             ${PN}-iwlwifi-licence
> > ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2b-6"
>
> Does it matter whether you use "licence" or "license"?

For consistency I think it does. I also discovered an incorrect filename at the 
same time as looking into this. I've sent a patch to fix these.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

