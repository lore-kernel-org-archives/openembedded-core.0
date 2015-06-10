Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F28AB72120
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 09:17:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 10 Jun 2015 02:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,586,1427785200"; d="scan'208";a="506009387"
Received: from dsamson-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.2.237])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2015 02:17:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 10:17:53 +0100
Message-ID: <1554329.HKQRZb0eD9@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <CAJTo0LY2C3d6ewKs7f1V0U9k7vqMQ47kCnANetzGz1OhMtfTFg@mail.gmail.com>
References: <CAJTo0LY2C3d6ewKs7f1V0U9k7vqMQ47kCnANetzGz1OhMtfTFg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [RFC] remove neon from oe-core
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
X-List-Received-Date: Wed, 10 Jun 2015 09:17:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ross,

On Tuesday 09 June 2015 20:14:15 Burton, Ross wrote:
> Since Subversion moved away from neon it appears the only user of it in
> oe-core is GStreamer as a HTTP client plugin.  By virtue of being
> maintained I suspect the libsoup plugin is generally the better choice
> there, so as neon is now unmaintained upstream (last release September
> 2014, doesn't work with latest GnuTLS release) I propose moving it to
> meta-oe.
> 
> Any comments?

I have to be honest and say I don't like meta-oe continuing to be a dumping 
ground for old things that only a few (or no) people are using - if we must 
keep these recipes around, I'd rather they go into a different layer even if 
that layer's only grouping factor is "legacy items", at least then they are 
labelled appropriately. GStreamer 0.10 and BlueZ 4 were recent examples, 
perhaps I should have spoken up earlier, although I don't necessarily think 
it's too late.

Martin - what do you think?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

